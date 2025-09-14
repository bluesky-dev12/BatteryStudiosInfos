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
    // Pos:0x000
    reliable if(int(Role) == int(ROLE_Authority))
        UserID;

    // Pos:0x00D
    reliable if(int(Role) == int(ROLE_Authority))
        ClientClearStorage, ClientDeleteFromStorage, 
        ClientInitialize, ClientSetToStorage, 
        ClientSetToStorage3;

    // Pos:0x01A
    reliable if(int(Role) == int(ROLE_Authority))
        ClientSetToStorage_AddWeapon, ClientSetToStorage_CurrentWeapon, 
        ClientSetToStorage_OldWeapon, ClientSetToStorage_PlayerState, 
        ClientSetToStorage_Skill_AddCount, ClientSetToStorage_Skill_IsEnable, 
        ClientSetToStorage_Skill_UpdateCall, ClientSetToStorage_Skill_Used, 
        ClientSetToStorage_Vehicle_Enter, ClientSetToStorage_Vehicle_Leave, 
        ClientSetToStorage_WeaponAmmo;

    // Pos:0x027
    reliable if(int(Role) == int(ROLE_Authority))
        ClientDeleteFromStorage_Weapon;
}

// Export UwGameStateStorageSender::execForceSetOwner(FFrame&, void* const)
native final function ForceSetOwner(PlayerController PC)
{
    //native.PC;        
}

// Export UwGameStateStorageSender::execAddGSSS(FFrame&, void* const)
private native function AddGSSS();

// Export UwGameStateStorageSender::execRemoveGSSS(FFrame&, void* const)
private native function RemoveGSSS();

// Export UwGameStateStorageSender::execLowSet(FFrame&, void* const)
private native final function LowSet(string sUserID, string Section, string sName, string Type, string Value)
{
    //native.sUserID;
    //native.Section;
    //native.sName;
    //native.Type;
    //native.Value;        
}

// Export UwGameStateStorageSender::execLowDelete(FFrame&, void* const)
private native final function LowDelete(string sUserID, string Section, string sName)
{
    //native.sUserID;
    //native.Section;
    //native.sName;        
}

// Export UwGameStateStorageSender::execLowClear(FFrame&, void* const)
private native final function LowClear(string sUserID)
{
    //native.sUserID;        
}

// Export UwGameStateStorageSender::execAllNames(FFrame&, void* const)
native final iterator function AllNames(string Section, out string sName)
{
    //native.Section;
    //native.sName;        
}

// Export UwGameStateStorageSender::execAllValues(FFrame&, void* const)
native final iterator function AllValues(string Section, string sName, out string Type, out string Value)
{
    //native.Section;
    //native.sName;
    //native.Type;
    //native.Value;        
}

// Export UwGameStateStorageSender::execGetValue(FFrame&, void* const)
native final function bool GetValue(string Section, string sName, string Type, out string Value)
{
    //native.Section;
    //native.sName;
    //native.Type;
    //native.Value;        
}

function SetToStorage(string Section, string sName, string Type, string Value)
{
    local wGameStateStorageSender GSSS;
    local int GSSSCount;

    Log((((((((("wGameStateStorageSender::SetToStorage() [Name:" $ OwnerName) $ "]   Section:") $ Section) $ " sName:") $ sName) $ " type:") $ Type) $ " value:") $ Value);
    // End:0xD9
    if(bNoUpdateData == true)
    {
        Log("wGameStateStorageSender::SetToStorage() bNoUpdate is true. no send");
        return;
    }
    // End:0x1BB
    if(int(Role) == int(ROLE_Authority))
    {
        LowSet(string(UserID), Section, sName, Type, Value);
        GSSSCount = 0;
        GSSS = Level.GSSSList;
        J0x125:

        // End:0x178 [Loop If]
        if(GSSS != none)
        {
            GSSSCount++;
            GSSS.ClientSetToStorage(string(UserID), Section, sName, Type, Value);
            GSSS = GSSS.nextGSSS;
            // [Loop Continue]
            goto J0x125;
        }
        Log("wGameStateStorageSender::SetToStorage() GSSS Count:" $ string(GSSSCount));        
    }
    else
    {
        Log("wGameStateStorageSender::SetToStorage() Role != ROLE_Authority. Role:" $ string(Role));
    }
    //return;    
}

simulated function ClientSetToStorage(string sUserID, string Section, string sName, string Type, string Value)
{
    // End:0x12
    if(int(Role) == int(ROLE_Authority))
    {
        return;
    }
    Log((((((((((("wGameStateStorageSender::ClientSetToStorage() [Name:" $ OwnerName) $ "] sUserID:") $ sUserID) $ " Section:") $ Section) $ " sName:") $ sName) $ " type:") $ Type) $ " value:") $ Value);
    LowSet(sUserID, Section, sName, Type, Value);
    //return;    
}

simulated function LowCurrentWeapon_Set(int UserID, int nWeaponID)
{
    LowSet(string(UserID), "Weapon", "CurrentWeapon", "ID", string(nWeaponID));
    //return;    
}

simulated function LowOldWeapon_Set(int UserID, int nWeaponID)
{
    LowSet(string(UserID), "Weapon", "OldWeapon", "ID", string(nWeaponID));
    //return;    
}

simulated function LowAddWeapon_Set(int UserID, string strWeaponName, int nWeaponID, int nAddPartID, bool bUniqueID, int iPainting_Item_ID)
{
    LowSet(string(UserID), "Weapon", strWeaponName, "iWeaponID", string(nWeaponID));
    LowSet(string(UserID), "Weapon", strWeaponName, "iAddPartsID", string(nAddPartID));
    LowSet(string(UserID), "Weapon", strWeaponName, "bUniqueID", string(bUniqueID));
    LowSet(string(UserID), "Weapon", strWeaponName, "iPainting_Item_ID", string(iPainting_Item_ID));
    //return;    
}

simulated function LowWeaponAmmo_Set(int UserID, string strWeaponName, int nTotalAmmo, int nCurrentAmmo)
{
    LowSet(string(UserID), "Weapon", strWeaponName, "TotalAmmo", string(nTotalAmmo));
    LowSet(string(UserID), "Weapon", strWeaponName, "CurrentAmmo", string(nCurrentAmmo));
    //return;    
}

simulated function LowPlayerState_Set(int UserID, string strName, byte bPawnExistCondition)
{
    LowSet(string(UserID), "Char", "State", "Name", (strName $ "?Pawn=") $ string(bPawnExistCondition));
    //return;    
}

simulated function LowSkill_IsEnable_Set(int UserID, int nSkillID, bool bIsEnable)
{
    LowSet(string(UserID), "Skill", string(nSkillID), "IsEnable", string(bIsEnable));
    //return;    
}

simulated function LowSkill_Used_Set(int UserID, int nSkillID, bool bUsed)
{
    LowSet(string(UserID), "Skill", string(nSkillID), "bUsed", string(bUsed));
    //return;    
}

simulated function LowSkill_AddCount_Set(int UserID, int nSkillID, byte byAddCount)
{
    LowSet(string(UserID), "Skill", string(nSkillID), "byAddCount", string(byAddCount));
    //return;    
}

simulated function LowSkill_UpdateCall_Set(int UserID, int nSkillID, bool bUpdateCall)
{
    LowSet(string(UserID), "Skill", string(nSkillID), "bUpdateCall", string(bUpdateCall));
    //return;    
}

simulated function LowVehicleEnter_Set(int UserID, string strClassName, float Pos_X, float Pos_Y, float Pos_Z)
{
    LowSet(string(UserID), "Vehicle", "bRide", "bool", "true");
    LowSet(string(UserID), "Vehicle", "Class", "Value", strClassName);
    LowSet(string(UserID), "Vehicle", "Position", "X", string(int(Pos_X)));
    LowSet(string(UserID), "Vehicle", "Position", "Y", string(int(Pos_Y)));
    LowSet(string(UserID), "Vehicle", "Position", "Z", string(int(Pos_Z)));
    //return;    
}

simulated function LowVehicleLeave_Set(int UserID)
{
    LowSet(string(UserID), "Vehicle", "bRide", "bool", "false");
    //return;    
}

simulated function LowWeapon_Delete(int UserID, string strWeaponName)
{
    LowDelete(string(UserID), "Weapon", strWeaponName);
    //return;    
}

function SetToStorage_CurrentWeapon(int nWeaponID)
{
    local wGameStateStorageSender GSSS;
    local int GSSSCount;

    Log((("wGameStateStorageSender::SetToStorage_CurrentWeapon() [Name:" $ OwnerName) $ "]   nWeaponID:") $ string(nWeaponID));
    // End:0xC4
    if(bNoUpdateData == true)
    {
        Log("wGameStateStorageSender::SetToStorage_CurrentWeapon() bNoUpdate is true. no send");
        return;
    }
    // End:0x192
    if(int(Role) == int(ROLE_Authority))
    {
        LowCurrentWeapon_Set(UserID, nWeaponID);
        GSSSCount = 0;
        GSSS = Level.GSSSList;
        J0xFF:

        // End:0x141 [Loop If]
        if(GSSS != none)
        {
            GSSSCount++;
            GSSS.ClientSetToStorage_CurrentWeapon(UserID, nWeaponID);
            GSSS = GSSS.nextGSSS;
            // [Loop Continue]
            goto J0xFF;
        }
        Log("wGameStateStorageSender::SetToStorage_CurrentWeapon() GSSS Count:" $ string(GSSSCount));        
    }
    else
    {
        Log("wGameStateStorageSender::SetToStorage_CurrentWeapon() Role != ROLE_Authority. Role:" $ string(Role));
    }
    //return;    
}

function SetToStorage_OldWeapon(int nWeaponID)
{
    local wGameStateStorageSender GSSS;
    local int GSSSCount;

    Log((("wGameStateStorageSender::SetToStorage_OldWeapon() [Name:" $ OwnerName) $ "]   nWeaponID:") $ string(nWeaponID));
    // End:0xBC
    if(bNoUpdateData == true)
    {
        Log("wGameStateStorageSender::SetToStorage_OldWeapon() bNoUpdate is true. no send");
        return;
    }
    // End:0x186
    if(int(Role) == int(ROLE_Authority))
    {
        LowOldWeapon_Set(UserID, nWeaponID);
        GSSSCount = 0;
        GSSS = Level.GSSSList;
        J0xF7:

        // End:0x139 [Loop If]
        if(GSSS != none)
        {
            GSSSCount++;
            GSSS.ClientSetToStorage_OldWeapon(UserID, nWeaponID);
            GSSS = GSSS.nextGSSS;
            // [Loop Continue]
            goto J0xF7;
        }
        Log("wGameStateStorageSender::SetToStorage_OldWeapon() GSSS Count:" $ string(GSSSCount));        
    }
    else
    {
        Log("wGameStateStorageSender::SetToStorage_OldWeapon() Role != ROLE_Authority. Role:" $ string(Role));
    }
    //return;    
}

function SetToStorage_AddWeapon(string strWeaponName, int nWeaponID, int nAddPartID, bool bUniqueID, optional int iPainting_Item_ID)
{
    local wGameStateStorageSender GSSS;
    local int GSSSCount;

    Log((((((((("wGameStateStorageSender::SetToStorage_AddWeapon() [Name:" $ OwnerName) $ "] nWeaponID:") $ string(nWeaponID)) $ " nAddPartID:") $ string(nAddPartID)) $ " strWeaponName:") $ strWeaponName) $ " bUniqueID:") $ string(bUniqueID));
    // End:0x106
    if(bNoUpdateData == true)
    {
        Log("wGameStateStorageSender::SetToStorage_AddWeapon() bNoUpdate is true. no send");
        return;
    }
    // End:0x1FA
    if(int(Role) == int(ROLE_Authority))
    {
        LowAddWeapon_Set(UserID, strWeaponName, nWeaponID, nAddPartID, bUniqueID, iPainting_Item_ID);
        GSSSCount = 0;
        GSSS = Level.GSSSList;
        J0x156:

        // End:0x1AD [Loop If]
        if(GSSS != none)
        {
            GSSSCount++;
            GSSS.ClientSetToStorage_AddWeapon(UserID, strWeaponName, nWeaponID, nAddPartID, bUniqueID, iPainting_Item_ID);
            GSSS = GSSS.nextGSSS;
            // [Loop Continue]
            goto J0x156;
        }
        Log("wGameStateStorageSender::SetToStorage_AddWeapon() GSSS Count:" $ string(GSSSCount));        
    }
    else
    {
        Log("wGameStateStorageSender::SetToStorage_AddWeapon() Role != ROLE_Authority. Role:" $ string(Role));
    }
    //return;    
}

function SetToStorage_WeaponAmmo(string strName, int nTotalAmmo, int nCurrentAmmo)
{
    local wGameStateStorageSender GSSS;
    local int GSSSCount;

    Log((((((("wGameStateStorageSender::SetToStorage_WeaponAmmo() [Name:" $ OwnerName) $ "] strName:") $ strName) $ " nTotalAmmo:") $ string(nTotalAmmo)) $ " nCurrentAmmo:") $ string(nCurrentAmmo));
    // End:0xEC
    if(bNoUpdateData == true)
    {
        Log("wGameStateStorageSender::SetToStorage_WeaponAmmo() bNoUpdate is true. no send");
        return;
    }
    // End:0x1CB
    if(int(Role) == int(ROLE_Authority))
    {
        LowWeaponAmmo_Set(UserID, strName, nTotalAmmo, nCurrentAmmo);
        GSSSCount = 0;
        GSSS = Level.GSSSList;
        J0x131:

        // End:0x17D [Loop If]
        if(GSSS != none)
        {
            GSSSCount++;
            GSSS.ClientSetToStorage_WeaponAmmo(UserID, strName, nTotalAmmo, nCurrentAmmo);
            GSSS = GSSS.nextGSSS;
            // [Loop Continue]
            goto J0x131;
        }
        Log("wGameStateStorageSender::SetToStorage_WeaponAmmo() GSSS Count:" $ string(GSSSCount));        
    }
    else
    {
        Log("wGameStateStorageSender::SetToStorage_WeaponAmmo() Role != ROLE_Authority. Role:" $ string(Role));
    }
    //return;    
}

function SetToStorage_PlayerState(string strName, byte bPawnExistCondition)
{
    local wGameStateStorageSender GSSS;
    local int GSSSCount;

    Log((((("wGameStateStorageSender::SetToStorage_PlayerState() [Name:" $ OwnerName) $ "] strName:") $ strName) $ " bPawnExistCondition:") $ string(bPawnExistCondition));
    // End:0xDC
    if(bNoUpdateData == true)
    {
        Log("wGameStateStorageSender::SetToStorage_PlayerState() bNoUpdate is true. no send");
        return;
    }
    // End:0x1B2
    if(int(Role) == int(ROLE_Authority))
    {
        LowPlayerState_Set(UserID, strName, bPawnExistCondition);
        GSSSCount = 0;
        GSSS = Level.GSSSList;
        J0x11C:

        // End:0x163 [Loop If]
        if(GSSS != none)
        {
            GSSSCount++;
            GSSS.ClientSetToStorage_PlayerState(UserID, strName, bPawnExistCondition);
            GSSS = GSSS.nextGSSS;
            // [Loop Continue]
            goto J0x11C;
        }
        Log("wGameStateStorageSender::SetToStorage_PlayerState() GSSS Count:" $ string(GSSSCount));        
    }
    else
    {
        Log("wGameStateStorageSender::SetToStorage_PlayerState() Role != ROLE_Authority. Role:" $ string(Role));
    }
    //return;    
}

function SetToStorage_Skill_IsEnable(int nSkillID, bool bIsEnable)
{
    local wGameStateStorageSender GSSS;
    local int GSSSCount;

    Log((((("wGameStateStorageSender::SetToStorage_Skill_IsEnable() [Name:" $ OwnerName) $ "] nSkillID:") $ string(nSkillID)) $ " bIsEnable:") $ string(bIsEnable));
    // End:0xDC
    if(bNoUpdateData == true)
    {
        Log("wGameStateStorageSender::SetToStorage_Skill_IsEnable() bNoUpdate is true. no send");
        return;
    }
    // End:0x1B7
    if(int(Role) == int(ROLE_Authority))
    {
        LowSkill_IsEnable_Set(UserID, nSkillID, bIsEnable);
        GSSSCount = 0;
        GSSS = Level.GSSSList;
        J0x11D:

        // End:0x165 [Loop If]
        if(GSSS != none)
        {
            GSSSCount++;
            GSSS.ClientSetToStorage_Skill_IsEnable(UserID, nSkillID, bIsEnable);
            GSSS = GSSS.nextGSSS;
            // [Loop Continue]
            goto J0x11D;
        }
        Log("wGameStateStorageSender::SetToStorage_Skill_IsEnable() GSSS Count:" $ string(GSSSCount));        
    }
    else
    {
        Log("wGameStateStorageSender::SetToStorage_Skill_IsEnable() Role != ROLE_Authority. Role:" $ string(Role));
    }
    //return;    
}

function SetToStorage_Skill_Used(int nSkillID, bool bUsed)
{
    local wGameStateStorageSender GSSS;
    local int GSSSCount;

    Log((((("wGameStateStorageSender::SetToStorage_Skill_Used() [Name:" $ OwnerName) $ "] nSkillID:") $ string(nSkillID)) $ " bUsed:") $ string(bUsed));
    // End:0xD0
    if(bNoUpdateData == true)
    {
        Log("wGameStateStorageSender::SetToStorage_Skill_Used() bNoUpdate is true. no send");
        return;
    }
    // End:0x1A7
    if(int(Role) == int(ROLE_Authority))
    {
        LowSkill_Used_Set(UserID, nSkillID, bUsed);
        GSSSCount = 0;
        GSSS = Level.GSSSList;
        J0x111:

        // End:0x159 [Loop If]
        if(GSSS != none)
        {
            GSSSCount++;
            GSSS.ClientSetToStorage_Skill_Used(UserID, nSkillID, bUsed);
            GSSS = GSSS.nextGSSS;
            // [Loop Continue]
            goto J0x111;
        }
        Log("wGameStateStorageSender::SetToStorage_Skill_Used() GSSS Count:" $ string(GSSSCount));        
    }
    else
    {
        Log("wGameStateStorageSender::SetToStorage_Skill_Used() Role != ROLE_Authority. Role:" $ string(Role));
    }
    //return;    
}

function SetToStorage_Skill_AddCount(int nSkillID, byte byAddCount)
{
    local wGameStateStorageSender GSSS;
    local int GSSSCount;

    Log((((("wGameStateStorageSender::SetToStorage_Skill_AddCount() [Name:" $ OwnerName) $ "] nSkillID:") $ string(nSkillID)) $ " byAddCount:") $ string(byAddCount));
    // End:0xDC
    if(bNoUpdateData == true)
    {
        Log("wGameStateStorageSender::SetToStorage_Skill_AddCount() bNoUpdate is true. no send");
        return;
    }
    // End:0x1B5
    if(int(Role) == int(ROLE_Authority))
    {
        LowSkill_AddCount_Set(UserID, nSkillID, byAddCount);
        GSSSCount = 0;
        GSSS = Level.GSSSList;
        J0x11C:

        // End:0x163 [Loop If]
        if(GSSS != none)
        {
            GSSSCount++;
            GSSS.ClientSetToStorage_Skill_AddCount(UserID, nSkillID, byAddCount);
            GSSS = GSSS.nextGSSS;
            // [Loop Continue]
            goto J0x11C;
        }
        Log("wGameStateStorageSender::SetToStorage_Skill_AddCount() GSSS Count:" $ string(GSSSCount));        
    }
    else
    {
        Log("wGameStateStorageSender::SetToStorage_Skill_AddCount() Role != ROLE_Authority. Role:" $ string(Role));
    }
    //return;    
}

function SetToStorage_Skill_UpdateCall(int nSkillID, bool bUpdateCall)
{
    local wGameStateStorageSender GSSS;
    local int GSSSCount;

    Log((((("wGameStateStorageSender::SetToStorage_Skill_UpdateCall() [Name:" $ OwnerName) $ "] nSkillID:") $ string(nSkillID)) $ " bUpdateCall:") $ string(bUpdateCall));
    // End:0xE2
    if(bNoUpdateData == true)
    {
        Log("wGameStateStorageSender::SetToStorage_Skill_UpdateCall() bNoUpdate is true. no send");
        return;
    }
    // End:0x1BF
    if(int(Role) == int(ROLE_Authority))
    {
        LowSkill_UpdateCall_Set(UserID, nSkillID, bUpdateCall);
        GSSSCount = 0;
        GSSS = Level.GSSSList;
        J0x123:

        // End:0x16B [Loop If]
        if(GSSS != none)
        {
            GSSSCount++;
            GSSS.ClientSetToStorage_Skill_UpdateCall(UserID, nSkillID, bUpdateCall);
            GSSS = GSSS.nextGSSS;
            // [Loop Continue]
            goto J0x123;
        }
        Log("wGameStateStorageSender::SetToStorage_Skill_UpdateCall() GSSS Count:" $ string(GSSSCount));        
    }
    else
    {
        Log("wGameStateStorageSender::SetToStorage_Skill_UpdateCall() Role != ROLE_Authority. Role:" $ string(Role));
    }
    //return;    
}

function SetToStorage_Vehicle_Enter(string strClassName, float Pos_X, float Pos_Y, float Pos_Z)
{
    local wGameStateStorageSender GSSS;
    local int GSSSCount;

    Log((((((((("wGameStateStorageSender::SetToStorage_Vehicle_Enter() [Name:" $ OwnerName) $ "] strClassName:") $ strClassName) $ " Pos_X:") $ string(Pos_X)) $ " Pox_Y:") $ string(Pos_Y)) $ " Pos_Z:") $ string(Pos_Z));
    // End:0xFF
    if(bNoUpdateData == true)
    {
        Log("wGameStateStorageSender::SetToStorage_Vehicle_Enter() bNoUpdate is true. no send");
        return;
    }
    // End:0x1EB
    if(int(Role) == int(ROLE_Authority))
    {
        LowVehicleEnter_Set(UserID, strClassName, Pos_X, Pos_Y, Pos_Z);
        GSSSCount = 0;
        GSSS = Level.GSSSList;
        J0x149:

        // End:0x19A [Loop If]
        if(GSSS != none)
        {
            GSSSCount++;
            GSSS.ClientSetToStorage_Vehicle_Enter(UserID, strClassName, Pos_X, Pos_Y, Pos_Z);
            GSSS = GSSS.nextGSSS;
            // [Loop Continue]
            goto J0x149;
        }
        Log("wGameStateStorageSender::SetToStorage_Vehicle_Enter() GSSS Count:" $ string(GSSSCount));        
    }
    else
    {
        Log("wGameStateStorageSender::SetToStorage_Vehicle_Enter() Role != ROLE_Authority. Role:" $ string(Role));
    }
    //return;    
}

function SetToStorage_Vehicle_Leave()
{
    local wGameStateStorageSender GSSS;
    local int GSSSCount;

    Log(("wGameStateStorageSender::SetToStorage_Vehicle_Leave() [Name:" $ OwnerName) $ "]");
    // End:0xAE
    if(bNoUpdateData == true)
    {
        Log("wGameStateStorageSender::SetToStorage_Vehicle_Leave() bNoUpdate is true. no send");
        return;
    }
    // End:0x172
    if(int(Role) == int(ROLE_Authority))
    {
        LowVehicleLeave_Set(UserID);
        GSSSCount = 0;
        GSSS = Level.GSSSList;
        J0xE4:

        // End:0x121 [Loop If]
        if(GSSS != none)
        {
            GSSSCount++;
            GSSS.ClientSetToStorage_Vehicle_Leave(UserID);
            GSSS = GSSS.nextGSSS;
            // [Loop Continue]
            goto J0xE4;
        }
        Log("wGameStateStorageSender::SetToStorage_Vehicle_Leave() GSSS Count:" $ string(GSSSCount));        
    }
    else
    {
        Log("wGameStateStorageSender::SetToStorage_Vehicle_Leave() Role != ROLE_Authority. Role:" $ string(Role));
    }
    //return;    
}

simulated function ClientSetToStorage_CurrentWeapon(int UserID, int nWeaponID)
{
    // End:0x12
    if(int(Role) == int(ROLE_Authority))
    {
        return;
    }
    Log((("wGameStateStorageSender::ClientSetToStorage_CurrentWeapon() UserID:" $ string(UserID)) $ " nWeaponID:") $ string(nWeaponID));
    LowCurrentWeapon_Set(UserID, nWeaponID);
    //return;    
}

simulated function ClientSetToStorage_OldWeapon(int UserID, int nWeaponID)
{
    // End:0x12
    if(int(Role) == int(ROLE_Authority))
    {
        return;
    }
    Log((("wGameStateStorageSender::ClientSetToStorage_OldWeapon() UserID:" $ string(UserID)) $ " nWeaponID:") $ string(nWeaponID));
    LowOldWeapon_Set(UserID, nWeaponID);
    //return;    
}

simulated function ClientSetToStorage_AddWeapon(int UserID, string strWeaponName, int nWeaponID, int nAddPartID, bool bUniqueID, int iPainting_Item_ID)
{
    // End:0x12
    if(int(Role) == int(ROLE_Authority))
    {
        return;
    }
    Log((((((((("wGameStateStorageSender::ClientSetToStorage_AddWeapon() UserID:" $ string(UserID)) $ " nWeaponID:") $ string(nWeaponID)) $ " nAddPartID:") $ string(nAddPartID)) $ " strWeaponName:") $ strWeaponName) $ " bUniqueID:") $ string(bUniqueID));
    LowAddWeapon_Set(UserID, strWeaponName, nWeaponID, nAddPartID, bUniqueID, iPainting_Item_ID);
    //return;    
}

simulated function ClientSetToStorage_WeaponAmmo(int UserID, string strName, int nTotalAmmo, int nCurrentAmmo)
{
    // End:0x12
    if(int(Role) == int(ROLE_Authority))
    {
        return;
    }
    Log((((((("wGameStateStorageSender::ClientSetToStorage_WeaponAmmo() UserID:" $ string(UserID)) $ " strName:") $ strName) $ " nTotalAmmo:") $ string(nTotalAmmo)) $ " nCurrentAmmo:") $ string(nCurrentAmmo));
    LowWeaponAmmo_Set(UserID, strName, nTotalAmmo, nCurrentAmmo);
    //return;    
}

simulated function ClientSetToStorage_PlayerState(int UserID, string strName, byte bPawnExistCondition)
{
    // End:0x12
    if(int(Role) == int(ROLE_Authority))
    {
        return;
    }
    Log((((("wGameStateStorageSender::ClientSetToStorage_PlayerState() UserID:" $ string(UserID)) $ " strName:") $ strName) $ " bPawnExistCondition:") $ string(bPawnExistCondition));
    LowPlayerState_Set(UserID, strName, bPawnExistCondition);
    //return;    
}

simulated function ClientSetToStorage_Skill_IsEnable(int UserID, int nSkillID, bool bIsEnable)
{
    // End:0x12
    if(int(Role) == int(ROLE_Authority))
    {
        return;
    }
    Log((((("wGameStateStorageSender::ClientSetToStorage_Skill_IsEnable() UserID:" $ string(UserID)) $ " nSkillID:") $ string(nSkillID)) $ " bIsEnable:") $ string(bIsEnable));
    LowSkill_IsEnable_Set(UserID, nSkillID, bIsEnable);
    //return;    
}

simulated function ClientSetToStorage_Skill_Used(int UserID, int nSkillID, bool bUsed)
{
    // End:0x12
    if(int(Role) == int(ROLE_Authority))
    {
        return;
    }
    Log((((("wGameStateStorageSender::ClientSetToStorage_Skill_Used() UserID:" $ string(UserID)) $ " nSkillID:") $ string(nSkillID)) $ " bUsed:") $ string(bUsed));
    LowSkill_Used_Set(UserID, nSkillID, bUsed);
    //return;    
}

simulated function ClientSetToStorage_Skill_AddCount(int UserID, int nSkillID, byte byAddCount)
{
    // End:0x12
    if(int(Role) == int(ROLE_Authority))
    {
        return;
    }
    Log((((("wGameStateStorageSender::ClientSetToStorage_Skill_AddCount() UserID:" $ string(UserID)) $ " nSkillID:") $ string(nSkillID)) $ " byAddCount:") $ string(byAddCount));
    LowSkill_AddCount_Set(UserID, nSkillID, byAddCount);
    //return;    
}

simulated function ClientSetToStorage_Skill_UpdateCall(int UserID, int nSkillID, bool bUpdateCall)
{
    // End:0x12
    if(int(Role) == int(ROLE_Authority))
    {
        return;
    }
    Log((((("wGameStateStorageSender::ClientSetToStorage_Skill_UpdateCall() UserID:" $ string(UserID)) $ " nSkillID:") $ string(nSkillID)) $ " bUpdateCall:") $ string(bUpdateCall));
    LowSkill_UpdateCall_Set(UserID, nSkillID, bUpdateCall);
    //return;    
}

simulated function ClientSetToStorage_Vehicle_Enter(int UserID, string strClassName, float Pos_X, float Pos_Y, float Pos_Z)
{
    // End:0x12
    if(int(Role) == int(ROLE_Authority))
    {
        return;
    }
    Log((((((((("wGameStateStorageSender::ClientSetToStorage_Vehicle_Enter() UserID:" $ string(UserID)) $ " strClassName:") $ strClassName) $ " Pos_X:") $ string(Pos_X)) $ " Pos_Y:") $ string(Pos_Y)) $ " Pos_Z:") $ string(Pos_Z));
    LowVehicleEnter_Set(UserID, strClassName, Pos_X, Pos_Y, Pos_Z);
    //return;    
}

simulated function ClientSetToStorage_Vehicle_Leave(int UserID)
{
    // End:0x12
    if(int(Role) == int(ROLE_Authority))
    {
        return;
    }
    Log("wGameStateStorageSender::ClientSetToStorage_Vehicle_Leave() UserID:" $ string(UserID));
    LowVehicleLeave_Set(UserID);
    //return;    
}

function SetToStorage3(string Section, string sName, string Type, string Value, string Section2, string sName2, string type2, string value2, string Section3, string sName3, string type3, string value3)
{
    local wGameStateStorageSender GSSS;
    local int GSSSCount;

    Log((((((((("wGameStateStorageSender::SetToStorage3() [Name:" $ OwnerName) $ "]  Section:") $ Section) $ " sName:") $ sName) $ " type:") $ Type) $ " value:") $ Value);
    Log((((((((("wGameStateStorageSender::SetToStorage3() [Name:" $ OwnerName) $ "]  Section2:") $ Section2) $ " sName2:") $ sName2) $ " type2:") $ type2) $ " value2:") $ value2);
    Log((((((((("wGameStateStorageSender::SetToStorage3() [Name:" $ OwnerName) $ "]  Section3:") $ Section3) $ " sName3:") $ sName3) $ " type3:") $ type3) $ " value3:") $ value3);
    // End:0x1EC
    if(bNoUpdateData == true)
    {
        Log("wGameStateStorageSender::SetToStorage3() bNoUpdate is true. no send");
        return;
    }
    // End:0x2F7
    if(int(Role) == int(ROLE_Authority))
    {
        LowSet(string(UserID), Section, sName, Type, Value);
        GSSSCount = 0;
        GSSS = Level.GSSSList;
        J0x238:

        // End:0x2B3 [Loop If]
        if(GSSS != none)
        {
            GSSSCount++;
            GSSS.ClientSetToStorage3(string(UserID), Section, sName, Type, Value, Section2, sName2, type2, value2, Section3, sName3, type3, value3);
            GSSS = GSSS.nextGSSS;
            // [Loop Continue]
            goto J0x238;
        }
        Log("wGameStateStorageSender::SetToStorage3() GSSS Count:" $ string(GSSSCount));        
    }
    else
    {
        Log("wGameStateStorageSender::SetToStorage3() Role != ROLE_Authority. Role:" $ string(Role));
    }
    //return;    
}

simulated function ClientSetToStorage3(string sUserID, string Section, string sName, string Type, string Value, string Section2, string sName2, string type2, string value2, string Section3, string sName3, string type3, string value3)
{
    // End:0x12
    if(int(Role) == int(ROLE_Authority))
    {
        return;
    }
    Log((((((((((("wGameStateStorageSender::ClientSetToStorage3() [Name:" $ OwnerName) $ "]  sUserID:") $ sUserID) $ " Section:") $ Section) $ " sName:") $ sName) $ " type:") $ Type) $ " value:") $ Value);
    Log((((((((((("wGameStateStorageSender::ClientSetToStorage3() [Name:" $ OwnerName) $ "]  sUserID:") $ sUserID) $ " Section2:") $ Section2) $ " sName2:") $ sName2) $ " type2:") $ type2) $ " value2:") $ value2);
    Log((((((((((("wGameStateStorageSender::ClientSetToStorage3() [Name:" $ OwnerName) $ "]  sUserID:") $ sUserID) $ " Section3:") $ Section3) $ " sName3:") $ sName3) $ " type3:") $ type3) $ " value3:") $ value3);
    LowSet(sUserID, Section, sName, Type, Value);
    LowSet(sUserID, Section2, sName2, type2, value2);
    LowSet(sUserID, Section3, sName3, type3, value3);
    //return;    
}

function DeleteFromStorage(string Section, string sName)
{
    local wGameStateStorageSender GSSS;
    local int GSSSCount;

    Log((((("wGameStateStorageSender::DeleteFromStorage() Name:" $ OwnerName) $ "   Section:") $ Section) $ " sName:") $ sName);
    // End:0xBE
    if(bNoUpdateData == true)
    {
        Log("wGameStateStorageSender::DeleteFromStorage() bNoUpdate is true. no send");
        return;
    }
    // End:0x191
    if(int(Role) == int(ROLE_Authority))
    {
        LowDelete(string(UserID), Section, sName);
        GSSSCount = 0;
        GSSS = Level.GSSSList;
        J0x100:

        // End:0x149 [Loop If]
        if(GSSS != none)
        {
            GSSSCount++;
            GSSS.ClientDeleteFromStorage(string(UserID), Section, sName);
            GSSS = GSSS.nextGSSS;
            // [Loop Continue]
            goto J0x100;
        }
        Log("wGameStateStorageSender::DeleteFromStorage() GSSS Count:" $ string(GSSSCount));        
    }
    else
    {
        Log("wGameStateStorageSender::DeleteFromStorage() Role != ROLE_Authority. Role:" $ string(Role));
    }
    //return;    
}

simulated function ClientDeleteFromStorage(string sUserID, string Section, string sName)
{
    // End:0x12
    if(int(Role) == int(ROLE_Authority))
    {
        return;
    }
    LowDelete(sUserID, Section, sName);
    //return;    
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
    // End:0xFA
    if(int(Role) == int(ROLE_Authority))
    {
        LowClear(string(UserID));
        GSSS = Level.GSSSList;
        J0xC2:

        // End:0xFA [Loop If]
        if(GSSS != none)
        {
            GSSS.ClientClearStorage(string(UserID));
            GSSS = GSSS.nextGSSS;
            // [Loop Continue]
            goto J0xC2;
        }
    }
    //return;    
}

simulated function ClientClearStorage(string sUserID)
{
    // End:0x12
    if(int(Role) == int(ROLE_Authority))
    {
        return;
    }
    LowClear(sUserID);
    //return;    
}

function DeleteFromStorage_Weapon(string strWeaponName)
{
    local wGameStateStorageSender GSSS;
    local int GSSSCount;

    Log((("wGameStateStorageSender::DeleteFromStorage_Weapon() Name:" $ OwnerName) $ " strWeaponName:") $ strWeaponName);
    // End:0xBE
    if(bNoUpdateData == true)
    {
        Log("wGameStateStorageSender::DeleteFromStorage_Weapon() bNoUpdate is true. no send");
        return;
    }
    // End:0x18A
    if(int(Role) == int(ROLE_Authority))
    {
        LowWeapon_Delete(UserID, strWeaponName);
        GSSSCount = 0;
        GSSS = Level.GSSSList;
        J0xF9:

        // End:0x13B [Loop If]
        if(GSSS != none)
        {
            GSSSCount++;
            GSSS.ClientDeleteFromStorage_Weapon(UserID, strWeaponName);
            GSSS = GSSS.nextGSSS;
            // [Loop Continue]
            goto J0xF9;
        }
        Log("wGameStateStorageSender::DeleteFromStorage_Weapon() GSSS Count:" $ string(GSSSCount));        
    }
    else
    {
        Log("wGameStateStorageSender::DeleteFromStorage_Weapon() Role != ROLE_Authority. Role:" $ string(Role));
    }
    //return;    
}

simulated function ClientDeleteFromStorage_Weapon(int UserID, string strWeaponName)
{
    // End:0x12
    if(int(Role) == int(ROLE_Authority))
    {
        return;
    }
    LowWeapon_Delete(UserID, strWeaponName);
    //return;    
}

function SetToStorage_AllUserData()
{
    local wGameStateStorageSender GSSS;
    local int GSSSCount;

    Log(("wGameStateStorageGetter::SetToStorage_AllUserData() send all user data ToUser[" $ OwnerName) $ "]");
    GSSSCount = 0;
    GSSS = Level.GSSSList;
    J0x79:

    // End:0xB2 [Loop If]
    if(GSSS != none)
    {
        GSSSCount++;
        GSSS.SetAllDataToInterventionUser(self);
        GSSS = GSSS.nextGSSS;
        // [Loop Continue]
        goto J0x79;
    }
    Log("wGameStateStorageSender::SetToStorage_AllUserData() GSSS Count:" $ string(GSSSCount));
    //return;    
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
    // End:0xAA
    if(GetValue("Weapon", "CurrentWeapon", "ID", strValue) == true)
    {
        // End:0xAA
        if(strValue != "")
        {
            ToGSSS.ClientSetToStorage_CurrentWeapon(UserID, int(strValue));
        }
    }
    // End:0xF9
    if(GetValue("Weapon", "OldWeapon", "ID", strValue) == true)
    {
        // End:0xF9
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
        Log((("wGameStateStorageSender::SetAllDataToInterventionUser() foreach AllNames( Weapon, " $ strName) $ ") Name:") $ OwnerName);
        // End:0x333
        foreach AllValues("Weapon", strName, strType, strValue)
        {
            Log((((((("wGameStateStorageSender::SetAllDataToInterventionUser() foreach AllValues( Weapon, " $ strName) $ ", ") $ strType) $ ", ") $ strValue) $ " ) Name:") $ OwnerName);
            // End:0x26F
            if(strType == "iWeaponID")
            {
                iWeaponID = int(strValue);
                // End:0x332
                continue;
            }
            // End:0x296
            if(strType == "iAddPartsID")
            {
                iAddPartsID = int(strValue);
                // End:0x332
                continue;
            }
            // End:0x2BB
            if(strType == "TotalAmmo")
            {
                TotalAmmo = int(strValue);
                // End:0x332
                continue;
            }
            // End:0x2E2
            if(strType == "CurrentAmmo")
            {
                CurrentAmmo = int(strValue);
                // End:0x332
                continue;
            }
            // End:0x308
            if(strType == "bUniqueID")
            {
                bUniqueID = bool(strValue);
                // End:0x332
                continue;
            }
            // End:0x332
            if(strType == "iPainting_Item_ID")
            {
                iPainting_Item_ID = int(strValue);
            }            
        }        
        // End:0x39F
        if(iWeaponID == -1)
        {
            Log("wGameStateStorageSender::SetAllDataToInterventionUser() iWeaponID == -1 Name:" $ OwnerName);
            continue;            
        }
        ToGSSS.ClientSetToStorage_AddWeapon(UserID, strName, iWeaponID, iAddPartsID, bUniqueID, iPainting_Item_ID);
        // End:0x410
        if((TotalAmmo > -1) || CurrentAmmo > -1)
        {
            ToGSSS.ClientSetToStorage_WeaponAmmo(UserID, strName, TotalAmmo, CurrentAmmo);
        }        
    }    
    // End:0x624
    foreach AllNames("Skill", strName)
    {
        Log((("wGameStateStorageSender::SetAllDataToInterventionUser() foreach AllNames( Skill, " $ strName) $ ") Name:") $ OwnerName);
        // End:0x622
        foreach AllValues("Skill", strName, strType, strValue)
        {
            Log((((((("wGameStateStorageSender::SetAllDataToInterventionUser() foreach AllValues( Skill, " $ strName) $ ", ") $ strType) $ ", ") $ strValue) $ " ) Name:") $ OwnerName);
            // End:0x577
            if(strType == "IsEnable")
            {
                ToGSSS.ClientSetToStorage_Skill_IsEnable(UserID, int(strName), bool(strValue));
                // End:0x621
                continue;
            }
            // End:0x5AD
            if(strType == "bUsed")
            {
                ToGSSS.ClientSetToStorage_Skill_Used(UserID, int(strName), bool(strValue));
                // End:0x621
                continue;
            }
            // End:0x5E8
            if(strType == "byAddCount")
            {
                ToGSSS.ClientSetToStorage_Skill_AddCount(UserID, int(strName), byte(strValue));
                // End:0x621
                continue;
            }
            // End:0x621
            if(strType == "bUpdateCall")
            {
                ToGSSS.ClientSetToStorage_Skill_UpdateCall(UserID, int(strName), bool(strValue));
            }            
        }                
    }    
    // End:0x6A8
    if(GetValue("Char", "State", "Name", strValue) == true)
    {
        // End:0x6A8
        if(strValue != "")
        {
            Divide(strValue, "?", strState, strPawn);
            Divide(strPawn, "=", strTemp, strIsPawnValue);
            IsPawnValue = byte(strIsPawnValue);
            ToGSSS.ClientSetToStorage_PlayerState(UserID, strState, IsPawnValue);
        }
    }
    bRide = false;
    // End:0x6F1
    if(GetValue("Vehicle", "bRide", "bool", strValue) == true)
    {
        // End:0x6F1
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
    // End:0x7B0
    if(GetValue("Vehicle", "Position", "Y", strValue) == true)
    {
        // End:0x7B0
        if(strValue != "")
        {
            Vehicle_Pos_Y = int(strValue);
        }
    }
    // End:0x7F0
    if(GetValue("Vehicle", "Position", "Z", strValue) == true)
    {
        // End:0x7F0
        if(strValue != "")
        {
            Vehicle_Pos_Z = int(strValue);
        }
    }
    // End:0x82A
    if(bRide == true)
    {
        ToGSSS.ClientSetToStorage_Vehicle_Enter(UserID, strVehicleClassName, float(Vehicle_Pos_X), float(Vehicle_Pos_Y), float(Vehicle_Pos_Z));
    }
    //return;    
}

simulated function ClientTick(float DeltaTime)
{
    SetScoreState_OnlyClient();
    SetGameState_OnlyClient();
    //return;    
}

simulated event Tick(float DeltaTime)
{
    super.Tick(DeltaTime);
    // End:0x56
    if(fElapsedTime >= 1.0000000)
    {
        fElapsedTime = 0.0000000;
        // End:0x38
        if(int(Role) == int(ROLE_Authority))
        {            
        }
        else
        {
            // End:0x53
            if(int(Role) < int(ROLE_Authority))
            {
                ClientTick(DeltaTime);
            }
        }        
    }
    else
    {
        fElapsedTime += DeltaTime;
    }
    //return;    
}

simulated function SetScoreState_OnlyClient()
{
    local PlayerReplicationInfo PRI;
    local int UID;

    // End:0x5B
    if(Level == none)
    {
        Log("wGameStateStorageSender::SetScoreState_OnlyClient() level is none. error!!");
        return;
    }
    // End:0xD4
    if(Level.GetMatchMaker() == none)
    {
        Log("wGameStateStorageSender::SetScoreState_OnlyClient() level.GetMatchMaker() return none. error!!");
        return;
    }
    // End:0x294
    foreach DynamicActors(Class'Engine_Decompressed.PlayerReplicationInfo', PRI)
    {
        // End:0x13F
        if(PRI == none)
        {
            Log("wGameStateStorageSender::SetScoreState_OnlyClient() PRI is none. error!!");
            continue;            
        }
        UID = Level.GetMatchMaker().GetUIDByUserName(PRI.PlayerName);
        LowSet(string(UID), "Char", "Score", "Kills", string(PRI.Kills));
        LowSet(string(UID), "Char", "Score", "Assists", string(PRI.Assists));
        LowSet(string(UID), "Char", "Score", "Deaths", string(PRI.Deaths));
        LowSet(string(UID), "Char", "Score", "Exp", string(PRI.fExp));
        LowSet(string(UID), "Char", "Score", "Point", string(PRI.Point));
        LowSet(string(UID), "Char", "Score", "Score", string(PRI.Score));        
    }    
    //return;    
}

simulated function SetGameState_OnlyClient()
{
    GRI = Level.GRI;
    //return;    
}

event PreBeginPlay()
{
    super.PreBeginPlay();
    GRI = none;
    //return;    
}

event Destroyed()
{
    Log("wGameStateStorageSender::Destroyed() ID:" $ string(UserID));
    // End:0x4C
    if(int(Role) == int(ROLE_Authority))
    {
        ForceSetOwner(none);
    }
    LowClear(string(UserID));
    RemoveGSSS();
    super.Destroyed();
    //return;    
}

function Initialize(int id, PlayerController PC)
{
    // End:0x42
    if(PC == none)
    {
        Log("wGameStateStorageSender::Initialize() PC is none");        
    }
    else
    {
        Log((("wGameStateStorageSender::Initialize(" $ string(id)) $ ")  Name:") $ PC.LoginName);
        OwnerName = PC.LoginName;
        ForceSetOwner(PC);
    }
    UserID = id;
    GRI = none;
    AddGSSS();
    ClientInitialize(id, PC);
    //return;    
}

simulated function ClientInitialize(int id, PlayerController PC)
{
    // End:0x12
    if(int(Role) == int(ROLE_Authority))
    {
        return;
    }
    Log(("wGameStateStorageSender::ClientInitialize(" $ string(id)) $ ")");
    // End:0x9F
    if(PC == none)
    {
        Log("wGameStateStorageSender::ClientInitialize() PC is none. error!!");        
    }
    else
    {
        PC.GSSS = self;
        OwnerName = PC.LoginName;
    }
    UserID = id;
    GRI = none;
    AddGSSS();
    //return;    
}

simulated function PlayerController GetPlayerController()
{
    // End:0x1E
    if(int(Role) == int(ROLE_Authority))
    {
        return PlayerController(Owner);        
    }
    else
    {
        // End:0x3E
        if(int(Role) < int(ROLE_Authority))
        {
            return Level.GetLocalPlayerController();
        }
    }
    //return;    
}

defaultproperties
{
    bNoUpdateData=true
    bHidden=true
    bAlwaysRelevant=true
    bSkipActorPropertyReplication=true
    RemoteRole=2
}