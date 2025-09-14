/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wGameStateStorageSender.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Constants:1
 *	Properties:6
 *	Functions:64
 *
 *******************************************************************************/
class wGameStateStorageSender extends Actor
    native
    notplaceable;

const RefreshSec = 1.0;

var float fElapsedTime;
var int UserID;
var string OwnerName;
var wGameStateStorageSender nextGSSS;
var bool bNoUpdateData;
var GameReplicationInfo GRI;

replication
{
    // Pos:0x00
    reliable if(Role == 4)
        UserID;

    // Pos:0x0d
    reliable if(Role == 4)
        ClientClearStorage, ClientDeleteFromStorage,
        ClientSetToStorage3, ClientInitialize,
        ClientSetToStorage;

    // Pos:0x1a
    reliable if(Role == 4)
        ClientSetToStorage_WeaponAmmo, ClientSetToStorage_PlayerState,
        ClientSetToStorage_Skill_IsEnable, ClientSetToStorage_Skill_AddCount,
        ClientSetToStorage_Skill_UpdateCall, ClientSetToStorage_Vehicle_Enter,
        ClientSetToStorage_Vehicle_Leave, ClientSetToStorage_OldWeapon,
        ClientSetToStorage_CurrentWeapon, ClientSetToStorage_AddWeapon,
        ClientSetToStorage_Skill_Used;

    // Pos:0x27
    reliable if(Role == 4)
        ClientDeleteFromStorage_Weapon;

}

// Export UwGameStateStorageSender::execForceSetOwner(FFrame&, void* const)
native final function ForceSetOwner(PlayerController PC);
// Export UwGameStateStorageSender::execAddGSSS(FFrame&, void* const)
private native function AddGSSS();
// Export UwGameStateStorageSender::execRemoveGSSS(FFrame&, void* const)
private native function RemoveGSSS();
// Export UwGameStateStorageSender::execLowSet(FFrame&, void* const)
private native final function LowSet(string sUserID, string Section, string sName, string Type, string Value);
// Export UwGameStateStorageSender::execLowDelete(FFrame&, void* const)
private native final function LowDelete(string sUserID, string Section, string sName);
// Export UwGameStateStorageSender::execLowClear(FFrame&, void* const)
private native final function LowClear(string sUserID);
// Export UwGameStateStorageSender::execAllNames(FFrame&, void* const)
native final iterator function AllNames(string Section, out string sName);
// Export UwGameStateStorageSender::execAllValues(FFrame&, void* const)
native final iterator function AllValues(string Section, string sName, out string Type, out string Value);
// Export UwGameStateStorageSender::execGetValue(FFrame&, void* const)
native final function bool GetValue(string Section, string sName, string Type, out string Value);
function SetToStorage(string Section, string sName, string Type, string Value)
{
    local wGameStateStorageSender GSSS;
    local int GSSSCount;

    Log("wGameStateStorageSender::SetToStorage() [Name:" $ OwnerName $ "]   Section:" $ Section $ " sName:" $ sName $ " type:" $ Type $ " value:" $ Value);
    // End:0xd9
    if(bNoUpdateData == true)
    {
        Log("wGameStateStorageSender::SetToStorage() bNoUpdate is true. no send");
        return;
    }
    // End:0x1bb
    if(Role == 4)
    {
        LowSet(string(UserID), Section, sName, Type, Value);
        GSSSCount = 0;
        GSSS = Level.GSSSList;
        J0x125:
        // End:0x178 [While If]
        if(GSSS != none)
        {
            ++ GSSSCount;
            GSSS.ClientSetToStorage(string(UserID), Section, sName, Type, Value);
            GSSS = GSSS.nextGSSS;
            // This is an implied JumpToken; Continue!
            goto J0x125;
        }
        Log("wGameStateStorageSender::SetToStorage() GSSS Count:" $ string(GSSSCount));
    }
    // End:0x20d
    else
    {
        Log("wGameStateStorageSender::SetToStorage() Role != ROLE_Authority. Role:" $ string(Role));
    }
}

simulated function ClientSetToStorage(string sUserID, string Section, string sName, string Type, string Value)
{
    // End:0x12
    if(Role == 4)
    {
        return;
    }
    Log("wGameStateStorageSender::ClientSetToStorage() [Name:" $ OwnerName $ "] sUserID:" $ sUserID $ " Section:" $ Section $ " sName:" $ sName $ " type:" $ Type $ " value:" $ Value);
    LowSet(sUserID, Section, sName, Type, Value);
}

simulated function LowCurrentWeapon_Set(int UserID, int nWeaponID)
{
    LowSet(string(UserID), "Weapon", "CurrentWeapon", "ID", string(nWeaponID));
}

simulated function LowOldWeapon_Set(int UserID, int nWeaponID)
{
    LowSet(string(UserID), "Weapon", "OldWeapon", "ID", string(nWeaponID));
}

simulated function LowAddWeapon_Set(int UserID, string strWeaponName, int nWeaponID, int nAddPartID, bool bUniqueID, int iPainting_Item_ID)
{
    LowSet(string(UserID), "Weapon", strWeaponName, "iWeaponID", string(nWeaponID));
    LowSet(string(UserID), "Weapon", strWeaponName, "iAddPartsID", string(nAddPartID));
    LowSet(string(UserID), "Weapon", strWeaponName, "bUniqueID", string(bUniqueID));
    LowSet(string(UserID), "Weapon", strWeaponName, "iPainting_Item_ID", string(iPainting_Item_ID));
}

simulated function LowWeaponAmmo_Set(int UserID, string strWeaponName, int nTotalAmmo, int nCurrentAmmo)
{
    LowSet(string(UserID), "Weapon", strWeaponName, "TotalAmmo", string(nTotalAmmo));
    LowSet(string(UserID), "Weapon", strWeaponName, "CurrentAmmo", string(nCurrentAmmo));
}

simulated function LowPlayerState_Set(int UserID, string strName, byte bPawnExistCondition)
{
    LowSet(string(UserID), "Char", "State", "Name", strName $ "?Pawn=" $ string(bPawnExistCondition));
}

simulated function LowSkill_IsEnable_Set(int UserID, int nSkillID, bool bIsEnable)
{
    LowSet(string(UserID), "Skill", string(nSkillID), "IsEnable", string(bIsEnable));
}

simulated function LowSkill_Used_Set(int UserID, int nSkillID, bool bUsed)
{
    LowSet(string(UserID), "Skill", string(nSkillID), "bUsed", string(bUsed));
}

simulated function LowSkill_AddCount_Set(int UserID, int nSkillID, byte byAddCount)
{
    LowSet(string(UserID), "Skill", string(nSkillID), "byAddCount", string(byAddCount));
}

simulated function LowSkill_UpdateCall_Set(int UserID, int nSkillID, bool bUpdateCall)
{
    LowSet(string(UserID), "Skill", string(nSkillID), "bUpdateCall", string(bUpdateCall));
}

simulated function LowVehicleEnter_Set(int UserID, string strClassName, float Pos_X, float Pos_Y, float Pos_Z)
{
    LowSet(string(UserID), "Vehicle", "bRide", "bool", "true");
    LowSet(string(UserID), "Vehicle", "Class", "Value", strClassName);
    LowSet(string(UserID), "Vehicle", "Position", "X", string(int(Pos_X)));
    LowSet(string(UserID), "Vehicle", "Position", "Y", string(int(Pos_Y)));
    LowSet(string(UserID), "Vehicle", "Position", "Z", string(int(Pos_Z)));
}

simulated function LowVehicleLeave_Set(int UserID)
{
    LowSet(string(UserID), "Vehicle", "bRide", "bool", "false");
}

simulated function LowWeapon_Delete(int UserID, string strWeaponName)
{
    LowDelete(string(UserID), "Weapon", strWeaponName);
}

function SetToStorage_CurrentWeapon(int nWeaponID)
{
    local wGameStateStorageSender GSSS;
    local int GSSSCount;

    Log("wGameStateStorageSender::SetToStorage_CurrentWeapon() [Name:" $ OwnerName $ "]   nWeaponID:" $ string(nWeaponID));
    // End:0xc4
    if(bNoUpdateData == true)
    {
        Log("wGameStateStorageSender::SetToStorage_CurrentWeapon() bNoUpdate is true. no send");
        return;
    }
    // End:0x192
    if(Role == 4)
    {
        LowCurrentWeapon_Set(UserID, nWeaponID);
        GSSSCount = 0;
        GSSS = Level.GSSSList;
        J0xff:
        // End:0x141 [While If]
        if(GSSS != none)
        {
            ++ GSSSCount;
            GSSS.ClientSetToStorage_CurrentWeapon(UserID, nWeaponID);
            GSSS = GSSS.nextGSSS;
            // This is an implied JumpToken; Continue!
            goto J0xff;
        }
        Log("wGameStateStorageSender::SetToStorage_CurrentWeapon() GSSS Count:" $ string(GSSSCount));
    }
    // End:0x1f2
    else
    {
        Log("wGameStateStorageSender::SetToStorage_CurrentWeapon() Role != ROLE_Authority. Role:" $ string(Role));
    }
}

function SetToStorage_OldWeapon(int nWeaponID)
{
    local wGameStateStorageSender GSSS;
    local int GSSSCount;

    Log("wGameStateStorageSender::SetToStorage_OldWeapon() [Name:" $ OwnerName $ "]   nWeaponID:" $ string(nWeaponID));
    // End:0xbc
    if(bNoUpdateData == true)
    {
        Log("wGameStateStorageSender::SetToStorage_OldWeapon() bNoUpdate is true. no send");
        return;
    }
    // End:0x186
    if(Role == 4)
    {
        LowOldWeapon_Set(UserID, nWeaponID);
        GSSSCount = 0;
        GSSS = Level.GSSSList;
        J0xf7:
        // End:0x139 [While If]
        if(GSSS != none)
        {
            ++ GSSSCount;
            GSSS.ClientSetToStorage_OldWeapon(UserID, nWeaponID);
            GSSS = GSSS.nextGSSS;
            // This is an implied JumpToken; Continue!
            goto J0xf7;
        }
        Log("wGameStateStorageSender::SetToStorage_OldWeapon() GSSS Count:" $ string(GSSSCount));
    }
    // End:0x1e2
    else
    {
        Log("wGameStateStorageSender::SetToStorage_OldWeapon() Role != ROLE_Authority. Role:" $ string(Role));
    }
}

function SetToStorage_AddWeapon(string strWeaponName, int nWeaponID, int nAddPartID, bool bUniqueID, optional int iPainting_Item_ID)
{
    local wGameStateStorageSender GSSS;
    local int GSSSCount;

    Log("wGameStateStorageSender::SetToStorage_AddWeapon() [Name:" $ OwnerName $ "] nWeaponID:" $ string(nWeaponID) $ " nAddPartID:" $ string(nAddPartID) $ " strWeaponName:" $ strWeaponName $ " bUniqueID:" $ string(bUniqueID));
    // End:0x106
    if(bNoUpdateData == true)
    {
        Log("wGameStateStorageSender::SetToStorage_AddWeapon() bNoUpdate is true. no send");
        return;
    }
    // End:0x1fa
    if(Role == 4)
    {
        LowAddWeapon_Set(UserID, strWeaponName, nWeaponID, nAddPartID, bUniqueID, iPainting_Item_ID);
        GSSSCount = 0;
        GSSS = Level.GSSSList;
        J0x156:
        // End:0x1ad [While If]
        if(GSSS != none)
        {
            ++ GSSSCount;
            GSSS.ClientSetToStorage_AddWeapon(UserID, strWeaponName, nWeaponID, nAddPartID, bUniqueID, iPainting_Item_ID);
            GSSS = GSSS.nextGSSS;
            // This is an implied JumpToken; Continue!
            goto J0x156;
        }
        Log("wGameStateStorageSender::SetToStorage_AddWeapon() GSSS Count:" $ string(GSSSCount));
    }
    // End:0x256
    else
    {
        Log("wGameStateStorageSender::SetToStorage_AddWeapon() Role != ROLE_Authority. Role:" $ string(Role));
    }
}

function SetToStorage_WeaponAmmo(string strName, int nTotalAmmo, int nCurrentAmmo)
{
    local wGameStateStorageSender GSSS;
    local int GSSSCount;

    Log("wGameStateStorageSender::SetToStorage_WeaponAmmo() [Name:" $ OwnerName $ "] strName:" $ strName $ " nTotalAmmo:" $ string(nTotalAmmo) $ " nCurrentAmmo:" $ string(nCurrentAmmo));
    // End:0xec
    if(bNoUpdateData == true)
    {
        Log("wGameStateStorageSender::SetToStorage_WeaponAmmo() bNoUpdate is true. no send");
        return;
    }
    // End:0x1cb
    if(Role == 4)
    {
        LowWeaponAmmo_Set(UserID, strName, nTotalAmmo, nCurrentAmmo);
        GSSSCount = 0;
        GSSS = Level.GSSSList;
        J0x131:
        // End:0x17d [While If]
        if(GSSS != none)
        {
            ++ GSSSCount;
            GSSS.ClientSetToStorage_WeaponAmmo(UserID, strName, nTotalAmmo, nCurrentAmmo);
            GSSS = GSSS.nextGSSS;
            // This is an implied JumpToken; Continue!
            goto J0x131;
        }
        Log("wGameStateStorageSender::SetToStorage_WeaponAmmo() GSSS Count:" $ string(GSSSCount));
    }
    // End:0x228
    else
    {
        Log("wGameStateStorageSender::SetToStorage_WeaponAmmo() Role != ROLE_Authority. Role:" $ string(Role));
    }
}

function SetToStorage_PlayerState(string strName, byte bPawnExistCondition)
{
    local wGameStateStorageSender GSSS;
    local int GSSSCount;

    Log("wGameStateStorageSender::SetToStorage_PlayerState() [Name:" $ OwnerName $ "] strName:" $ strName $ " bPawnExistCondition:" $ string(bPawnExistCondition));
    // End:0xdc
    if(bNoUpdateData == true)
    {
        Log("wGameStateStorageSender::SetToStorage_PlayerState() bNoUpdate is true. no send");
        return;
    }
    // End:0x1b2
    if(Role == 4)
    {
        LowPlayerState_Set(UserID, strName, bPawnExistCondition);
        GSSSCount = 0;
        GSSS = Level.GSSSList;
        J0x11c:
        // End:0x163 [While If]
        if(GSSS != none)
        {
            ++ GSSSCount;
            GSSS.ClientSetToStorage_PlayerState(UserID, strName, bPawnExistCondition);
            GSSS = GSSS.nextGSSS;
            // This is an implied JumpToken; Continue!
            goto J0x11c;
        }
        Log("wGameStateStorageSender::SetToStorage_PlayerState() GSSS Count:" $ string(GSSSCount));
    }
    // End:0x210
    else
    {
        Log("wGameStateStorageSender::SetToStorage_PlayerState() Role != ROLE_Authority. Role:" $ string(Role));
    }
}

function SetToStorage_Skill_IsEnable(int nSkillID, bool bIsEnable)
{
    local wGameStateStorageSender GSSS;
    local int GSSSCount;

    Log("wGameStateStorageSender::SetToStorage_Skill_IsEnable() [Name:" $ OwnerName $ "] nSkillID:" $ string(nSkillID) $ " bIsEnable:" $ string(bIsEnable));
    // End:0xdc
    if(bNoUpdateData == true)
    {
        Log("wGameStateStorageSender::SetToStorage_Skill_IsEnable() bNoUpdate is true. no send");
        return;
    }
    // End:0x1b7
    if(Role == 4)
    {
        LowSkill_IsEnable_Set(UserID, nSkillID, bIsEnable);
        GSSSCount = 0;
        GSSS = Level.GSSSList;
        J0x11d:
        // End:0x165 [While If]
        if(GSSS != none)
        {
            ++ GSSSCount;
            GSSS.ClientSetToStorage_Skill_IsEnable(UserID, nSkillID, bIsEnable);
            GSSS = GSSS.nextGSSS;
            // This is an implied JumpToken; Continue!
            goto J0x11d;
        }
        Log("wGameStateStorageSender::SetToStorage_Skill_IsEnable() GSSS Count:" $ string(GSSSCount));
    }
    // End:0x218
    else
    {
        Log("wGameStateStorageSender::SetToStorage_Skill_IsEnable() Role != ROLE_Authority. Role:" $ string(Role));
    }
}

function SetToStorage_Skill_Used(int nSkillID, bool bUsed)
{
    local wGameStateStorageSender GSSS;
    local int GSSSCount;

    Log("wGameStateStorageSender::SetToStorage_Skill_Used() [Name:" $ OwnerName $ "] nSkillID:" $ string(nSkillID) $ " bUsed:" $ string(bUsed));
    // End:0xd0
    if(bNoUpdateData == true)
    {
        Log("wGameStateStorageSender::SetToStorage_Skill_Used() bNoUpdate is true. no send");
        return;
    }
    // End:0x1a7
    if(Role == 4)
    {
        LowSkill_Used_Set(UserID, nSkillID, bUsed);
        GSSSCount = 0;
        GSSS = Level.GSSSList;
        J0x111:
        // End:0x159 [While If]
        if(GSSS != none)
        {
            ++ GSSSCount;
            GSSS.ClientSetToStorage_Skill_Used(UserID, nSkillID, bUsed);
            GSSS = GSSS.nextGSSS;
            // This is an implied JumpToken; Continue!
            goto J0x111;
        }
        Log("wGameStateStorageSender::SetToStorage_Skill_Used() GSSS Count:" $ string(GSSSCount));
    }
    // End:0x204
    else
    {
        Log("wGameStateStorageSender::SetToStorage_Skill_Used() Role != ROLE_Authority. Role:" $ string(Role));
    }
}

function SetToStorage_Skill_AddCount(int nSkillID, byte byAddCount)
{
    local wGameStateStorageSender GSSS;
    local int GSSSCount;

    Log("wGameStateStorageSender::SetToStorage_Skill_AddCount() [Name:" $ OwnerName $ "] nSkillID:" $ string(nSkillID) $ " byAddCount:" $ string(byAddCount));
    // End:0xdc
    if(bNoUpdateData == true)
    {
        Log("wGameStateStorageSender::SetToStorage_Skill_AddCount() bNoUpdate is true. no send");
        return;
    }
    // End:0x1b5
    if(Role == 4)
    {
        LowSkill_AddCount_Set(UserID, nSkillID, byAddCount);
        GSSSCount = 0;
        GSSS = Level.GSSSList;
        J0x11c:
        // End:0x163 [While If]
        if(GSSS != none)
        {
            ++ GSSSCount;
            GSSS.ClientSetToStorage_Skill_AddCount(UserID, nSkillID, byAddCount);
            GSSS = GSSS.nextGSSS;
            // This is an implied JumpToken; Continue!
            goto J0x11c;
        }
        Log("wGameStateStorageSender::SetToStorage_Skill_AddCount() GSSS Count:" $ string(GSSSCount));
    }
    // End:0x216
    else
    {
        Log("wGameStateStorageSender::SetToStorage_Skill_AddCount() Role != ROLE_Authority. Role:" $ string(Role));
    }
}

function SetToStorage_Skill_UpdateCall(int nSkillID, bool bUpdateCall)
{
    local wGameStateStorageSender GSSS;
    local int GSSSCount;

    Log("wGameStateStorageSender::SetToStorage_Skill_UpdateCall() [Name:" $ OwnerName $ "] nSkillID:" $ string(nSkillID) $ " bUpdateCall:" $ string(bUpdateCall));
    // End:0xe2
    if(bNoUpdateData == true)
    {
        Log("wGameStateStorageSender::SetToStorage_Skill_UpdateCall() bNoUpdate is true. no send");
        return;
    }
    // End:0x1bf
    if(Role == 4)
    {
        LowSkill_UpdateCall_Set(UserID, nSkillID, bUpdateCall);
        GSSSCount = 0;
        GSSS = Level.GSSSList;
        J0x123:
        // End:0x16b [While If]
        if(GSSS != none)
        {
            ++ GSSSCount;
            GSSS.ClientSetToStorage_Skill_UpdateCall(UserID, nSkillID, bUpdateCall);
            GSSS = GSSS.nextGSSS;
            // This is an implied JumpToken; Continue!
            goto J0x123;
        }
        Log("wGameStateStorageSender::SetToStorage_Skill_UpdateCall() GSSS Count:" $ string(GSSSCount));
    }
    // End:0x222
    else
    {
        Log("wGameStateStorageSender::SetToStorage_Skill_UpdateCall() Role != ROLE_Authority. Role:" $ string(Role));
    }
}

function SetToStorage_Vehicle_Enter(string strClassName, float Pos_X, float Pos_Y, float Pos_Z)
{
    local wGameStateStorageSender GSSS;
    local int GSSSCount;

    Log("wGameStateStorageSender::SetToStorage_Vehicle_Enter() [Name:" $ OwnerName $ "] strClassName:" $ strClassName $ " Pos_X:" $ string(Pos_X) $ " Pox_Y:" $ string(Pos_Y) $ " Pos_Z:" $ string(Pos_Z));
    // End:0xff
    if(bNoUpdateData == true)
    {
        Log("wGameStateStorageSender::SetToStorage_Vehicle_Enter() bNoUpdate is true. no send");
        return;
    }
    // End:0x1eb
    if(Role == 4)
    {
        LowVehicleEnter_Set(UserID, strClassName, Pos_X, Pos_Y, Pos_Z);
        GSSSCount = 0;
        GSSS = Level.GSSSList;
        J0x149:
        // End:0x19a [While If]
        if(GSSS != none)
        {
            ++ GSSSCount;
            GSSS.ClientSetToStorage_Vehicle_Enter(UserID, strClassName, Pos_X, Pos_Y, Pos_Z);
            GSSS = GSSS.nextGSSS;
            // This is an implied JumpToken; Continue!
            goto J0x149;
        }
        Log("wGameStateStorageSender::SetToStorage_Vehicle_Enter() GSSS Count:" $ string(GSSSCount));
    }
    // End:0x24b
    else
    {
        Log("wGameStateStorageSender::SetToStorage_Vehicle_Enter() Role != ROLE_Authority. Role:" $ string(Role));
    }
}

function SetToStorage_Vehicle_Leave()
{
    local wGameStateStorageSender GSSS;
    local int GSSSCount;

    Log("wGameStateStorageSender::SetToStorage_Vehicle_Leave() [Name:" $ OwnerName $ "]");
    // End:0xae
    if(bNoUpdateData == true)
    {
        Log("wGameStateStorageSender::SetToStorage_Vehicle_Leave() bNoUpdate is true. no send");
        return;
    }
    // End:0x172
    if(Role == 4)
    {
        LowVehicleLeave_Set(UserID);
        GSSSCount = 0;
        GSSS = Level.GSSSList;
        J0xe4:
        // End:0x121 [While If]
        if(GSSS != none)
        {
            ++ GSSSCount;
            GSSS.ClientSetToStorage_Vehicle_Leave(UserID);
            GSSS = GSSS.nextGSSS;
            // This is an implied JumpToken; Continue!
            goto J0xe4;
        }
        Log("wGameStateStorageSender::SetToStorage_Vehicle_Leave() GSSS Count:" $ string(GSSSCount));
    }
    // End:0x1d2
    else
    {
        Log("wGameStateStorageSender::SetToStorage_Vehicle_Leave() Role != ROLE_Authority. Role:" $ string(Role));
    }
}

simulated function ClientSetToStorage_CurrentWeapon(int UserID, int nWeaponID)
{
    // End:0x12
    if(Role == 4)
    {
        return;
    }
    Log("wGameStateStorageSender::ClientSetToStorage_CurrentWeapon() UserID:" $ string(UserID) $ " nWeaponID:" $ string(nWeaponID));
    LowCurrentWeapon_Set(UserID, nWeaponID);
}

simulated function ClientSetToStorage_OldWeapon(int UserID, int nWeaponID)
{
    // End:0x12
    if(Role == 4)
    {
        return;
    }
    Log("wGameStateStorageSender::ClientSetToStorage_OldWeapon() UserID:" $ string(UserID) $ " nWeaponID:" $ string(nWeaponID));
    LowOldWeapon_Set(UserID, nWeaponID);
}

simulated function ClientSetToStorage_AddWeapon(int UserID, string strWeaponName, int nWeaponID, int nAddPartID, bool bUniqueID, int iPainting_Item_ID)
{
    // End:0x12
    if(Role == 4)
    {
        return;
    }
    Log("wGameStateStorageSender::ClientSetToStorage_AddWeapon() UserID:" $ string(UserID) $ " nWeaponID:" $ string(nWeaponID) $ " nAddPartID:" $ string(nAddPartID) $ " strWeaponName:" $ strWeaponName $ " bUniqueID:" $ string(bUniqueID));
    LowAddWeapon_Set(UserID, strWeaponName, nWeaponID, nAddPartID, bUniqueID, iPainting_Item_ID);
}

simulated function ClientSetToStorage_WeaponAmmo(int UserID, string strName, int nTotalAmmo, int nCurrentAmmo)
{
    // End:0x12
    if(Role == 4)
    {
        return;
    }
    Log("wGameStateStorageSender::ClientSetToStorage_WeaponAmmo() UserID:" $ string(UserID) $ " strName:" $ strName $ " nTotalAmmo:" $ string(nTotalAmmo) $ " nCurrentAmmo:" $ string(nCurrentAmmo));
    LowWeaponAmmo_Set(UserID, strName, nTotalAmmo, nCurrentAmmo);
}

simulated function ClientSetToStorage_PlayerState(int UserID, string strName, byte bPawnExistCondition)
{
    // End:0x12
    if(Role == 4)
    {
        return;
    }
    Log("wGameStateStorageSender::ClientSetToStorage_PlayerState() UserID:" $ string(UserID) $ " strName:" $ strName $ " bPawnExistCondition:" $ string(bPawnExistCondition));
    LowPlayerState_Set(UserID, strName, bPawnExistCondition);
}

simulated function ClientSetToStorage_Skill_IsEnable(int UserID, int nSkillID, bool bIsEnable)
{
    // End:0x12
    if(Role == 4)
    {
        return;
    }
    Log("wGameStateStorageSender::ClientSetToStorage_Skill_IsEnable() UserID:" $ string(UserID) $ " nSkillID:" $ string(nSkillID) $ " bIsEnable:" $ string(bIsEnable));
    LowSkill_IsEnable_Set(UserID, nSkillID, bIsEnable);
}

simulated function ClientSetToStorage_Skill_Used(int UserID, int nSkillID, bool bUsed)
{
    // End:0x12
    if(Role == 4)
    {
        return;
    }
    Log("wGameStateStorageSender::ClientSetToStorage_Skill_Used() UserID:" $ string(UserID) $ " nSkillID:" $ string(nSkillID) $ " bUsed:" $ string(bUsed));
    LowSkill_Used_Set(UserID, nSkillID, bUsed);
}

simulated function ClientSetToStorage_Skill_AddCount(int UserID, int nSkillID, byte byAddCount)
{
    // End:0x12
    if(Role == 4)
    {
        return;
    }
    Log("wGameStateStorageSender::ClientSetToStorage_Skill_AddCount() UserID:" $ string(UserID) $ " nSkillID:" $ string(nSkillID) $ " byAddCount:" $ string(byAddCount));
    LowSkill_AddCount_Set(UserID, nSkillID, byAddCount);
}

simulated function ClientSetToStorage_Skill_UpdateCall(int UserID, int nSkillID, bool bUpdateCall)
{
    // End:0x12
    if(Role == 4)
    {
        return;
    }
    Log("wGameStateStorageSender::ClientSetToStorage_Skill_UpdateCall() UserID:" $ string(UserID) $ " nSkillID:" $ string(nSkillID) $ " bUpdateCall:" $ string(bUpdateCall));
    LowSkill_UpdateCall_Set(UserID, nSkillID, bUpdateCall);
}

simulated function ClientSetToStorage_Vehicle_Enter(int UserID, string strClassName, float Pos_X, float Pos_Y, float Pos_Z)
{
    // End:0x12
    if(Role == 4)
    {
        return;
    }
    Log("wGameStateStorageSender::ClientSetToStorage_Vehicle_Enter() UserID:" $ string(UserID) $ " strClassName:" $ strClassName $ " Pos_X:" $ string(Pos_X) $ " Pos_Y:" $ string(Pos_Y) $ " Pos_Z:" $ string(Pos_Z));
    LowVehicleEnter_Set(UserID, strClassName, Pos_X, Pos_Y, Pos_Z);
}

simulated function ClientSetToStorage_Vehicle_Leave(int UserID)
{
    // End:0x12
    if(Role == 4)
    {
        return;
    }
    Log("wGameStateStorageSender::ClientSetToStorage_Vehicle_Leave() UserID:" $ string(UserID));
    LowVehicleLeave_Set(UserID);
}

function SetToStorage3(string Section, string sName, string Type, string Value, string Section2, string sName2, string type2, string value2, string Section3, string sName3, string type3, string value3)
{
    local wGameStateStorageSender GSSS;
    local int GSSSCount;

    Log("wGameStateStorageSender::SetToStorage3() [Name:" $ OwnerName $ "]  Section:" $ Section $ " sName:" $ sName $ " type:" $ Type $ " value:" $ Value);
    Log("wGameStateStorageSender::SetToStorage3() [Name:" $ OwnerName $ "]  Section2:" $ Section2 $ " sName2:" $ sName2 $ " type2:" $ type2 $ " value2:" $ value2);
    Log("wGameStateStorageSender::SetToStorage3() [Name:" $ OwnerName $ "]  Section3:" $ Section3 $ " sName3:" $ sName3 $ " type3:" $ type3 $ " value3:" $ value3);
    // End:0x1ec
    if(bNoUpdateData == true)
    {
        Log("wGameStateStorageSender::SetToStorage3() bNoUpdate is true. no send");
        return;
    }
    // End:0x2f7
    if(Role == 4)
    {
        LowSet(string(UserID), Section, sName, Type, Value);
        GSSSCount = 0;
        GSSS = Level.GSSSList;
        J0x238:
        // End:0x2b3 [While If]
        if(GSSS != none)
        {
            ++ GSSSCount;
            GSSS.ClientSetToStorage3(string(UserID), Section, sName, Type, Value, Section2, sName2, type2, value2, Section3, sName3, type3, value3);
            GSSS = GSSS.nextGSSS;
            // This is an implied JumpToken; Continue!
            goto J0x238;
        }
        Log("wGameStateStorageSender::SetToStorage3() GSSS Count:" $ string(GSSSCount));
    }
    // End:0x34a
    else
    {
        Log("wGameStateStorageSender::SetToStorage3() Role != ROLE_Authority. Role:" $ string(Role));
    }
}

simulated function ClientSetToStorage3(string sUserID, string Section, string sName, string Type, string Value, string Section2, string sName2, string type2, string value2, string Section3, string sName3, string type3, string value3)
{
    // End:0x12
    if(Role == 4)
    {
        return;
    }
    Log("wGameStateStorageSender::ClientSetToStorage3() [Name:" $ OwnerName $ "]  sUserID:" $ sUserID $ " Section:" $ Section $ " sName:" $ sName $ " type:" $ Type $ " value:" $ Value);
    Log("wGameStateStorageSender::ClientSetToStorage3() [Name:" $ OwnerName $ "]  sUserID:" $ sUserID $ " Section2:" $ Section2 $ " sName2:" $ sName2 $ " type2:" $ type2 $ " value2:" $ value2);
    Log("wGameStateStorageSender::ClientSetToStorage3() [Name:" $ OwnerName $ "]  sUserID:" $ sUserID $ " Section3:" $ Section3 $ " sName3:" $ sName3 $ " type3:" $ type3 $ " value3:" $ value3);
    LowSet(sUserID, Section, sName, Type, Value);
    LowSet(sUserID, Section2, sName2, type2, value2);
    LowSet(sUserID, Section3, sName3, type3, value3);
}

function DeleteFromStorage(string Section, string sName)
{
    local wGameStateStorageSender GSSS;
    local int GSSSCount;

    Log("wGameStateStorageSender::DeleteFromStorage() Name:" $ OwnerName $ "   Section:" $ Section $ " sName:" $ sName);
    // End:0xbe
    if(bNoUpdateData == true)
    {
        Log("wGameStateStorageSender::DeleteFromStorage() bNoUpdate is true. no send");
        return;
    }
    // End:0x191
    if(Role == 4)
    {
        LowDelete(string(UserID), Section, sName);
        GSSSCount = 0;
        GSSS = Level.GSSSList;
        J0x100:
        // End:0x149 [While If]
        if(GSSS != none)
        {
            ++ GSSSCount;
            GSSS.ClientDeleteFromStorage(string(UserID), Section, sName);
            GSSS = GSSS.nextGSSS;
            // This is an implied JumpToken; Continue!
            goto J0x100;
        }
        Log("wGameStateStorageSender::DeleteFromStorage() GSSS Count:" $ string(GSSSCount));
    }
    // End:0x1e8
    else
    {
        Log("wGameStateStorageSender::DeleteFromStorage() Role != ROLE_Authority. Role:" $ string(Role));
    }
}

simulated function ClientDeleteFromStorage(string sUserID, string Section, string sName)
{
    // End:0x12
    if(Role == 4)
    {
        return;
    }
    LowDelete(sUserID, Section, sName);
}

function ClearStorage()
{
    local wGameStateStorageSender GSSS;

    Log("wGameStateStorageSender::ClearStorage() Name:" $ OwnerName);
    // End:0x91
    if(bNoUpdateData == true)
    {
        Log("wGameStateStorageSender::DeleteFromStorage() bNoUpdate is true. no send");
        return;
    }
    // End:0xfa
    if(Role == 4)
    {
        LowClear(string(UserID));
        GSSS = Level.GSSSList;
        J0xc2:
        // End:0xfa [While If]
        if(GSSS != none)
        {
            GSSS.ClientClearStorage(string(UserID));
            GSSS = GSSS.nextGSSS;
            // This is an implied JumpToken; Continue!
            goto J0xc2;
        }
    }
}

simulated function ClientClearStorage(string sUserID)
{
    // End:0x12
    if(Role == 4)
    {
        return;
    }
    LowClear(sUserID);
}

function DeleteFromStorage_Weapon(string strWeaponName)
{
    local wGameStateStorageSender GSSS;
    local int GSSSCount;

    Log("wGameStateStorageSender::DeleteFromStorage_Weapon() Name:" $ OwnerName $ " strWeaponName:" $ strWeaponName);
    // End:0xbe
    if(bNoUpdateData == true)
    {
        Log("wGameStateStorageSender::DeleteFromStorage_Weapon() bNoUpdate is true. no send");
        return;
    }
    // End:0x18a
    if(Role == 4)
    {
        LowWeapon_Delete(UserID, strWeaponName);
        GSSSCount = 0;
        GSSS = Level.GSSSList;
        J0xf9:
        // End:0x13b [While If]
        if(GSSS != none)
        {
            ++ GSSSCount;
            GSSS.ClientDeleteFromStorage_Weapon(UserID, strWeaponName);
            GSSS = GSSS.nextGSSS;
            // This is an implied JumpToken; Continue!
            goto J0xf9;
        }
        Log("wGameStateStorageSender::DeleteFromStorage_Weapon() GSSS Count:" $ string(GSSSCount));
    }
    // End:0x1e8
    else
    {
        Log("wGameStateStorageSender::DeleteFromStorage_Weapon() Role != ROLE_Authority. Role:" $ string(Role));
    }
}

simulated function ClientDeleteFromStorage_Weapon(int UserID, string strWeaponName)
{
    // End:0x12
    if(Role == 4)
    {
        return;
    }
    LowWeapon_Delete(UserID, strWeaponName);
}

function SetToStorage_AllUserData()
{
    local wGameStateStorageSender GSSS;
    local int GSSSCount;

    Log("wGameStateStorageGetter::SetToStorage_AllUserData() send all user data ToUser[" $ OwnerName $ "]");
    GSSSCount = 0;
    GSSS = Level.GSSSList;
    J0x79:
    // End:0xb2 [While If]
    if(GSSS != none)
    {
        ++ GSSSCount;
        GSSS.SetAllDataToInterventionUser(self);
        GSSS = GSSS.nextGSSS;
        // This is an implied JumpToken; Continue!
        goto J0x79;
    }
    Log("wGameStateStorageSender::SetToStorage_AllUserData() GSSS Count:" $ string(GSSSCount));
}

function SetAllDataToInterventionUser(wGameStateStorageSender ToGSSS)
{
    local string strName, strType, strValue, strVehicleClassName, strState, strPawn,
	    strTemp, strIsPawnValue;

    local int TotalAmmo, CurrentAmmo, iWeaponID, iAddPartsID, Vehicle_Pos_X, Vehicle_Pos_Y,
	    Vehicle_Pos_Z, iPainting_Item_ID;

    local bool bUniqueID, bRide;
    local byte IsPawnValue;

    // End:0x57
    if(ToGSSS == none)
    {
        Log("wGameStateStorageSender::SetAllDataToInterventionUser() ToGSSS is none");
        return;
    }
    // End:0xaa
    if(GetValue("Weapon", "CurrentWeapon", "ID", strValue) == true)
    {
        // End:0xaa
        if(strValue != "")
        {
            ToGSSS.ClientSetToStorage_CurrentWeapon(UserID, int(strValue));
        }
    }
    // End:0xf9
    if(GetValue("Weapon", "OldWeapon", "ID", strValue) == true)
    {
        // End:0xf9
        if(strValue != "")
        {
            ToGSSS.ClientSetToStorage_OldWeapon(UserID, int(strValue));
        }
    }
    // End:0x411
    foreach AllNames("Weapon", strName)
    {
        TotalAmmo = -1;
        CurrentAmmo = -1;
        iWeaponID = -1;
        Log("wGameStateStorageSender::SetAllDataToInterventionUser() foreach AllNames( Weapon, " $ strName $ ") Name:" $ OwnerName);
        // End:0x333
        foreach AllValues("Weapon", strName, strType, strValue)
        {
            Log("wGameStateStorageSender::SetAllDataToInterventionUser() foreach AllValues( Weapon, " $ strName $ ", " $ strType $ ", " $ strValue $ " ) Name:" $ OwnerName);
            // End:0x26f
            if(strType == "iWeaponID")
            {
                iWeaponID = int(strValue);
            }
            // End:0x332
            else
            {
                // End:0x296
                if(strType == "iAddPartsID")
                {
                    iAddPartsID = int(strValue);
                }
                // End:0x332
                else
                {
                    // End:0x2bb
                    if(strType == "TotalAmmo")
                    {
                        TotalAmmo = int(strValue);
                    }
                    // End:0x332
                    else
                    {
                        // End:0x2e2
                        if(strType == "CurrentAmmo")
                        {
                            CurrentAmmo = int(strValue);
                        }
                        // End:0x332
                        else
                        {
                            // End:0x308
                            if(strType == "bUniqueID")
                            {
                                bUniqueID = bool(strValue);
                            }
                            // End:0x332
                            else
                            {
                                // End:0x332
                                if(strType == "iPainting_Item_ID")
                                {
                                    iPainting_Item_ID = int(strValue);
                                }
                            }
                        }
                    }
                }
            }                        
        }
        // End:0x39f
        if(iWeaponID == -1)
        {
            Log("wGameStateStorageSender::SetAllDataToInterventionUser() iWeaponID == -1 Name:" $ OwnerName);
            continue;
        }
        // End:0x411
        else
        {
            ToGSSS.ClientSetToStorage_AddWeapon(UserID, strName, iWeaponID, iAddPartsID, bUniqueID, iPainting_Item_ID);
            // End:0x410
            if(TotalAmmo > -1 || CurrentAmmo > -1)
            {
                ToGSSS.ClientSetToStorage_WeaponAmmo(UserID, strName, TotalAmmo, CurrentAmmo);
            }
            continue;
        }        
    }
    // End:0x624
    foreach AllNames("Skill", strName)
    {
        Log("wGameStateStorageSender::SetAllDataToInterventionUser() foreach AllNames( Skill, " $ strName $ ") Name:" $ OwnerName);
        // End:0x622
        foreach AllValues("Skill", strName, strType, strValue)
        {
            Log("wGameStateStorageSender::SetAllDataToInterventionUser() foreach AllValues( Skill, " $ strName $ ", " $ strType $ ", " $ strValue $ " ) Name:" $ OwnerName);
            // End:0x577
            if(strType == "IsEnable")
            {
                ToGSSS.ClientSetToStorage_Skill_IsEnable(UserID, int(strName), bool(strValue));
            }
            // End:0x621
            else
            {
                // End:0x5ad
                if(strType == "bUsed")
                {
                    ToGSSS.ClientSetToStorage_Skill_Used(UserID, int(strName), bool(strValue));
                }
                // End:0x621
                else
                {
                    // End:0x5e8
                    if(strType == "byAddCount")
                    {
                        ToGSSS.ClientSetToStorage_Skill_AddCount(UserID, int(strName), byte(strValue));
                    }
                    // End:0x621
                    else
                    {
                        // End:0x621
                        if(strType == "bUpdateCall")
                        {
                            ToGSSS.ClientSetToStorage_Skill_UpdateCall(UserID, int(strName), bool(strValue));
                        }
                    }
                }
            }                        
        }                
    }
    // End:0x6a8
    if(GetValue("Char", "State", "Name", strValue) == true)
    {
        // End:0x6a8
        if(strValue != "")
        {
            Divide(strValue, "?", strState, strPawn);
            Divide(strPawn, "=", strTemp, strIsPawnValue);
            IsPawnValue = byte(strIsPawnValue);
            ToGSSS.ClientSetToStorage_PlayerState(UserID, strState, IsPawnValue);
        }
    }
    bRide = false;
    // End:0x6f1
    if(GetValue("Vehicle", "bRide", "bool", strValue) == true)
    {
        // End:0x6f1
        if(strValue != "")
        {
            bRide = bool(strValue);
        }
    }
    // End:0x730
    if(GetValue("Vehicle", "Class", "Value", strValue) == true)
    {
        // End:0x730
        if(strValue != "")
        {
            strVehicleClassName = strValue;
        }
    }
    // End:0x770
    if(GetValue("Vehicle", "Position", "X", strValue) == true)
    {
        // End:0x770
        if(strValue != "")
        {
            Vehicle_Pos_X = int(strValue);
        }
    }
    // End:0x7b0
    if(GetValue("Vehicle", "Position", "Y", strValue) == true)
    {
        // End:0x7b0
        if(strValue != "")
        {
            Vehicle_Pos_Y = int(strValue);
        }
    }
    // End:0x7f0
    if(GetValue("Vehicle", "Position", "Z", strValue) == true)
    {
        // End:0x7f0
        if(strValue != "")
        {
            Vehicle_Pos_Z = int(strValue);
        }
    }
    // End:0x82a
    if(bRide == true)
    {
        ToGSSS.ClientSetToStorage_Vehicle_Enter(UserID, strVehicleClassName, float(Vehicle_Pos_X), float(Vehicle_Pos_Y), float(Vehicle_Pos_Z));
    }
}

simulated function ClientTick(float DeltaTime)
{
    SetScoreState_OnlyClient();
    SetGameState_OnlyClient();
}

simulated event Tick(float DeltaTime)
{
    super.Tick(DeltaTime);
    // End:0x56
    if(fElapsedTime >= 1.0)
    {
        fElapsedTime = 0.0;
        // End:0x38
        if(Role == 4)
        {
        }
        // End:0x53
        else
        {
            // End:0x53
            if(Role < 4)
            {
                ClientTick(DeltaTime);
            }
        }
    }
    // End:0x62
    else
    {
        fElapsedTime += DeltaTime;
    }
}

simulated function SetScoreState_OnlyClient()
{
    local PlayerReplicationInfo PRI;
    local int UID;

    // End:0x5b
    if(Level == none)
    {
        Log("wGameStateStorageSender::SetScoreState_OnlyClient() level is none. error!!");
        return;
    }
    // End:0xd4
    if(Level.GetMatchMaker() == none)
    {
        Log("wGameStateStorageSender::SetScoreState_OnlyClient() level.GetMatchMaker() return none. error!!");
        return;
    }
    // End:0x294
    foreach DynamicActors(class'PlayerReplicationInfo', PRI)
    {
        // End:0x13f
        if(PRI == none)
        {
            Log("wGameStateStorageSender::SetScoreState_OnlyClient() PRI is none. error!!");
            continue;
        }
        // End:0x294
        else
        {
            UID = Level.GetMatchMaker().GetUIDByUserName(PRI.PlayerName);
            LowSet(string(UID), "Char", "Score", "Kills", string(PRI.Kills));
            LowSet(string(UID), "Char", "Score", "Assists", string(PRI.Assists));
            LowSet(string(UID), "Char", "Score", "Deaths", string(PRI.Deaths));
            LowSet(string(UID), "Char", "Score", "Exp", string(PRI.fExp));
            LowSet(string(UID), "Char", "Score", "Point", string(PRI.Point));
            LowSet(string(UID), "Char", "Score", "Score", string(PRI.Score));
            continue;
        }        
    }
}

simulated function SetGameState_OnlyClient()
{
    GRI = Level.GRI;
}

event PreBeginPlay()
{
    super.PreBeginPlay();
    GRI = none;
}

event Destroyed()
{
    Log("wGameStateStorageSender::Destroyed() ID:" $ string(UserID));
    // End:0x4c
    if(Role == 4)
    {
        ForceSetOwner(none);
    }
    LowClear(string(UserID));
    RemoveGSSS();
    super.Destroyed();
}

function Initialize(int id, PlayerController PC)
{
    // End:0x42
    if(PC == none)
    {
        Log("wGameStateStorageSender::Initialize() PC is none");
    }
    // End:0xae
    else
    {
        Log("wGameStateStorageSender::Initialize(" $ string(id) $ ")  Name:" $ PC.LoginName);
        OwnerName = PC.LoginName;
        ForceSetOwner(PC);
    }
    UserID = id;
    GRI = none;
    AddGSSS();
    ClientInitialize(id, PC);
}

simulated function ClientInitialize(int id, PlayerController PC)
{
    // End:0x12
    if(Role == 4)
    {
        return;
    }
    Log("wGameStateStorageSender::ClientInitialize(" $ string(id) $ ")");
    // End:0x9f
    if(PC == none)
    {
        Log("wGameStateStorageSender::ClientInitialize() PC is none. error!!");
    }
    // End:0xc3
    else
    {
        PC.GSSS = self;
        OwnerName = PC.LoginName;
    }
    UserID = id;
    GRI = none;
    AddGSSS();
}

simulated function PlayerController GetPlayerController()
{
    // End:0x1e
    if(Role == 4)
    {
        return PlayerController(Owner);
    }
    // End:0x3e
    else
    {
        // End:0x3e
        if(Role < 4)
        {
            return Level.GetLocalPlayerController();
        }
    }
}

defaultproperties
{
    bNoUpdateData=true
    bHidden=true
    bAlwaysRelevant=true
    bSkipActorPropertyReplication=true
    RemoteRole=2
}