/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wGameStateStorageGetter.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:7
 *
 *******************************************************************************/
class wGameStateStorageGetter extends Object;

function GetUserQSlotState(wGameStateStorageSender GSSS, PlayerController PC)
{
    // End:0x4d
    if(PC == none)
    {
        Log("wGameStateStorageGetter::GetQSlotState() PC is none. error!!");
        return;
    }
    Log("wGameStateStorageGetter::GetUserQSlotState() Name: " $ PC.LoginName);
    Log("wGameStateStorageGetter::GetUserQSlotState() PRI.nQuickSlotIdx: " $ string(PC.PlayerReplicationInfo.nQuickSlotIdx));
    PC.ForceChangeQSlotIndex(PC.PlayerReplicationInfo.nQuickSlotIdx);
}

function GetUserSupplyState(wGameStateStorageSender GSSS, PlayerController PC);
function GetUserState(wGameStateStorageSender GSSS, PlayerController PC)
{
    local string Value, strState, strPawn, strTemp, strIsPawnValue;

    local name stateName;
    local int nPawnValue;

    // End:0x4c
    if(PC == none)
    {
        Log("wGameStateStorageGetter::GetUserState() PC is none. error!!");
        return;
    }
    // End:0x3d6
    if(GSSS.GetValue("Char", "State", "Name", Value) == true)
    {
        Log("[CYH] GetUserState() GotoState " $ Value);
        Divide(Value, "?", strState, strPawn);
        Divide(strPawn, "=", strTemp, strIsPawnValue);
        // End:0x15a
        if(strState == "PlayerTurreting")
        {
            Log("wGameStateStorageGetter::GetUserState() Change State. Old:" $ strState $ " New: PlayerWalking");
            strState = "PlayerWalking";
        }
        // End:0x1e4
        else
        {
            // End:0x1e4
            if(strState == "PlayerDriving")
            {
                Log("wGameStateStorageGetter::GetUserState() Change State. Old:" $ strState $ " New: PlayerWalking");
                strState = "PlayerWalking";
            }
        }
        nPawnValue = int(strIsPawnValue);
        // End:0x2a2
        if(nPawnValue == 0)
        {
            // End:0x29f
            if(PC.Pawn != none)
            {
                Log("[CYH] wGameStateStorageGetter::GetUserState() PC.Pawn is not none.");
                PC.Pawn.Died(PC, class'Suicided', PC.Pawn.Location);
                PC.Pawn = none;
            }
        }
        // End:0x32d
        else
        {
            // End:0x312
            if(nPawnValue == 1)
            {
                // End:0x30f
                if(PC.Pawn == none)
                {
                    Log("[CYH] wGameStateStorageGetter::GetUserState() PC.Pawn is none.");
                    strState = "Dead";
                }
            }
            // End:0x32d
            else
            {
                // End:0x321
                if(nPawnValue == 2)
                {
                }
                // End:0x32d
                else
                {
                    strState = "Dead";
                }
            }
        }
        // End:0x375
        if(PC.GetNameFromStr(strState, stateName))
        {
            PC.GotoState(stateName);
            PC.ClientGotoState(stateName, 'Begin');
        }
        // End:0x3d3
        else
        {
            Log("[CYH] wGameStateStorageGetter::GetUserState() GetNameFromStr() return false");
            PC.GotoDefaultState();
        }
    }
    // End:0x433
    else
    {
        Log("[CYH] wGameStateStorageGetter::GetUserState() GSSS.GetValue() return false");
        PC.GotoDefaultState();
    }
}

function GetUserScoreState(wGameStateStorageSender GSSS, PlayerController PC)
{
    local string Value;

    // End:0x4d
    if(PC == none)
    {
        Log("wGameStateStorageGetter::GetScoreState() PC is none. error!!");
        return;
    }
    // End:0xcf
    if(PC.PlayerReplicationInfo == none)
    {
        Log("wGameStateStorageGetter::GetScoreState() PC.PlayerReplicationInfo is none. error!! Name:" $ PC.LoginName);
        return;
    }
    Log("wGameStateStorageGetter::GetUserScoreState() Name: " $ PC.LoginName);
    // End:0x1a5
    if(GSSS.GetValue("Char", "Score", "Kills", Value) == true)
    {
        PC.PlayerReplicationInfo.Kills = int(Value);
        Log("wGameStateStorageGetter::GetUserScoreState() Kills: " $ Value);
    }
    // End:0x1f2
    else
    {
        Log("wGameStateStorageGetter::GetUserScoreState() GetValue(Kills) return false");
    }
    // End:0x285
    if(GSSS.GetValue("Char", "Score", "Assists", Value) == true)
    {
        PC.PlayerReplicationInfo.Assists = int(Value);
        Log("wGameStateStorageGetter::GetUserScoreState() Assists: " $ Value);
    }
    // End:0x2d4
    else
    {
        Log("wGameStateStorageGetter::GetUserScoreState() GetValue(Assists) return false");
    }
    // End:0x367
    if(GSSS.GetValue("Char", "Score", "Deaths", Value) == true)
    {
        PC.PlayerReplicationInfo.Deaths = float(int(Value));
        Log("wGameStateStorageGetter::GetUserScoreState() Deaths: " $ Value);
    }
    // End:0x3b5
    else
    {
        Log("wGameStateStorageGetter::GetUserScoreState() GetValue(Deaths) return false");
    }
    // End:0x442
    if(GSSS.GetValue("Char", "Score", "Exp", Value) == true)
    {
        PC.PlayerReplicationInfo.fExp = float(int(Value));
        Log("wGameStateStorageGetter::GetUserScoreState() Exp: " $ Value);
    }
    // End:0x48d
    else
    {
        Log("wGameStateStorageGetter::GetUserScoreState() GetValue(Exp) return false");
    }
    // End:0x51e
    if(GSSS.GetValue("Char", "Score", "Point", Value) == true)
    {
        PC.PlayerReplicationInfo.Point = float(int(Value));
        Log("wGameStateStorageGetter::GetUserScoreState() Point: " $ Value);
    }
    // End:0x56b
    else
    {
        Log("wGameStateStorageGetter::GetUserScoreState() GetValue(Point) return false");
    }
    // End:0x5fc
    if(GSSS.GetValue("Char", "Score", "Score", Value) == true)
    {
        PC.PlayerReplicationInfo.Score = float(int(Value));
        Log("wGameStateStorageGetter::GetUserScoreState() Score: " $ Value);
    }
    // End:0x649
    else
    {
        Log("wGameStateStorageGetter::GetUserScoreState() GetValue(Score) return false");
    }
}

static function GetUserVehicle(wGameStateStorageSender GSSS, PlayerController PC)
{
    local Vehicle V;
    local string Value, sClass, sx, sy, sz;

    local int X, Y, Z;

    Log("[wGameStateStorageGetter::GetUserVehicle] player=" $ PC.PlayerReplicationInfo.PlayerName);
    // End:0x2d4
    if(PC.Pawn != none && GSSS.GetValue("Vehicle", "bRide", "bool", Value))
    {
        Log("  bRide=" $ Value);
        // End:0x2d4
        if(Value == "true")
        {
            // End:0x2d4
            if(PC.GSSS.GetValue("Vehicle", "Class", "Value", sClass) && PC.GSSS.GetValue("Vehicle", "Position", "X", sx) && PC.GSSS.GetValue("Vehicle", "Position", "Y", sy) && PC.GSSS.GetValue("Vehicle", "Position", "Z", sz))
            {
                X = int(sx);
                Y = int(sy);
                Z = int(sz);
                Log("  looking for " $ " x=" $ string(X) $ " y=" $ string(Y) $ " z=" $ string(Z));
                // End:0x2d3
                foreach PC.AllActors(class'Vehicle', V)
                {
                    // End:0x2d2
                    if(int(V.Location.X) == X && int(V.Location.Y) == Y && int(V.Location.Z) == Z)
                    {
                        Log("  found vehicle name=" $ string(V.Name) $ " Driver=" $ V.Driver.PlayerReplicationInfo.PlayerName);
                    }
                    // End:0x2d3
                    else
                    {
                        continue;
                    }                    
                }
            }
        }
    }
}

function GetUserWeaponState(wGameStateStorageSender GSSS, PlayerController PC)
{
    local string sName, Type, Value;
    local int iWeaponID, iAddPartsID, TotalAmmo, CurrentAmmo, iPainting_Item_ID;

    local bool bUniqueID, bNoData;
    local wWeapon W;
    local int iCurrentWeaponID;

    // End:0x4e
    if(PC == none)
    {
        Log("wGameStateStorageGetter::GetWeaponState() PC is none. error!!");
        return;
    }
    // End:0xaa
    if(PC.Pawn == none)
    {
        Log("wGameStateStorageGetter::GetWeaponState() PC.Pawn is none. error!!");
        return;
    }
    GSSS.GetValue("Weapon", "CurrentWeapon", "ID", Value);
    iCurrentWeaponID = int(Value);
    PC.Log("wGameStateStorageGetter::GetWeaponState() - iCurrentWeaponID=" $ string(iCurrentWeaponID) $ " Name:" $ PC.LoginName);
    Log("wGameStateStorageGetter::GetWeaponState() - iCurrentWeaponID=" $ string(iCurrentWeaponID) $ " Name:" $ PC.LoginName);
    bNoData = true;
    // End:0x903
    foreach GSSS.AllNames("Weapon", sName)
    {
        TotalAmmo = -1;
        CurrentAmmo = -1;
        iWeaponID = -1;
        PC.clog("foreach AllNames(" $ sName $ ") Name:" $ PC.LoginName);
        Log("foreach AllNames(" $ sName $ ") Name:" $ PC.LoginName);
        // End:0x451
        foreach GSSS.AllValues("Weapon", sName, Type, Value)
        {
            PC.clog("foreach AllValues( Weapon, " $ sName $ ", " $ Type $ ", " $ Value $ " ) Name:" $ PC.LoginName);
            Log("foreach AllValues( Weapon, " $ sName $ ", " $ Type $ ", " $ Value $ " ) Name:" $ PC.LoginName);
            // End:0x38d
            if(Type == "iWeaponID")
            {
                iWeaponID = int(Value);
            }
            // End:0x450
            else
            {
                // End:0x3b4
                if(Type == "iAddPartsID")
                {
                    iAddPartsID = int(Value);
                }
                // End:0x450
                else
                {
                    // End:0x3d9
                    if(Type == "TotalAmmo")
                    {
                        TotalAmmo = int(Value);
                    }
                    // End:0x450
                    else
                    {
                        // End:0x400
                        if(Type == "CurrentAmmo")
                        {
                            CurrentAmmo = int(Value);
                        }
                        // End:0x450
                        else
                        {
                            // End:0x426
                            if(Type == "bUniqueID")
                            {
                                bUniqueID = bool(Value);
                            }
                            // End:0x450
                            else
                            {
                                // End:0x450
                                if(Type == "iPainting_Item_ID")
                                {
                                    iPainting_Item_ID = int(Value);
                                }
                            }
                        }
                    }
                }
            }                        
        }
        // End:0x4c4
        if(iWeaponID == -1)
        {
            PC.clog("iWeaponID == -1 Name:" $ PC.LoginName);
            Log("iWeaponID == -1 Name:" $ PC.LoginName);
            continue;
        }
        // End:0x903
        else
        {
            bNoData = false;
            // End:0x63f
            if(bUniqueID == true)
            {
                PC.clog("bUniqueID == true Name:" $ PC.LoginName);
                PC.clog("PC.Pawn.AddWeapon( " $ sName $ ", " $ string(iWeaponID) $ ", " $ string(iAddPartsID) $ ", false ) Name:" $ PC.LoginName);
                Log("bUniqueID == true Name:" $ PC.LoginName);
                Log("PC.Pawn.AddWeapon( " $ sName $ ", " $ string(iWeaponID) $ ", " $ string(iAddPartsID) $ ", false ) Name:" $ PC.LoginName);
                W = PC.Pawn.AddWeapon(UnresolvedNativeFunction_99(sName), iWeaponID, iAddPartsID, false, iPainting_Item_ID);
            }
            // End:0x78f
            else
            {
                PC.clog("bUniqueID == false Name:" $ PC.LoginName);
                PC.clog("PC.Pawn.AddWeapon( 0, " $ string(iWeaponID) $ ", " $ string(iAddPartsID) $ ", false ) Name:" $ PC.LoginName);
                Log("bUniqueID == false Name:" $ PC.LoginName);
                Log("PC.Pawn.AddWeapon( 0, " $ string(iWeaponID) $ ", " $ string(iAddPartsID) $ ", false ) Name:" $ PC.LoginName);
                W = PC.Pawn.AddWeapon(EmptyBtrDouble(), iWeaponID, iAddPartsID, false, iPainting_Item_ID);
            }
            // End:0x898
            if(iWeaponID == iCurrentWeaponID)
            {
                PC.clog("wGameStateStorageGetter::GetWeaponState() - found Weapon with iCurrentWeaponID Name:" $ PC.LoginName);
                Log("wGameStateStorageGetter::GetWeaponState() - found Weapon with iCurrentWeaponID Name:" $ PC.LoginName);
                PC.Pawn.ClientForceChangedWeapon(W);
            }
            // End:0x902
            if(W != none)
            {
                // End:0x902
                if(W.IsA('wGun') == true)
                {
                    // End:0x8de
                    if(TotalAmmo > -1)
                    {
                        W.SetAmmoTotal(0, TotalAmmo);
                    }
                    // End:0x902
                    if(CurrentAmmo > -1)
                    {
                        W.SetAmmoAmount(0, CurrentAmmo);
                    }
                }
            }
            continue;
        }        
    }
    // End:0xa0a
    if(bNoData == true)
    {
        PC.clog("wGameStateStorageGetter::GetUserWeaponState() Can't find weapon data. set default inventory");
        Log("wGameStateStorageGetter::GetUserWeaponState() Can't find weapon data. set default inventory");
        PC.Level.Game.GameAddDefaultInventory(PC.Pawn);
    }
}

function GetUserSkillState(wGameStateStorageSender GSSS, PlayerController PC)
{
    local int i;
    local string strValue;

    // End:0x4d
    if(PC == none)
    {
        Log("wGameStateStorageGetter::GetSkillState() PC is none. error!!");
        return;
    }
    // End:0xa8
    if(PC.Pawn == none)
    {
        Log("wGameStateStorageGetter::GetSkillState() PC.Pawn is none. error!!");
        return;
    }
    PC.Pawn.AddDefaultSkills();
    i = 0;
    J0xc7:
    // End:0x4de [While If]
    if(i < PC.SkillBase.Skills.Length)
    {
        // End:0x1e3
        if(GSSS.GetValue("Skill", string(PC.SkillBase.Skills[i].SkillID), "IsEnable", strValue) == true)
        {
            Log("wGameStateStorageGetter::GetUserSkillState() SkillID:" $ string(PC.SkillBase.Skills[i].SkillID) $ " IsEnable:" $ strValue);
            PC.SkillBase.Skills[i].IsEnable = bool(strValue);
        }
        // End:0x2d7
        if(GSSS.GetValue("Skill", string(PC.SkillBase.Skills[i].SkillID), "bUsed", strValue) == true)
        {
            Log("wGameStateStorageGetter::GetUserSkillState() SkillID:" $ string(PC.SkillBase.Skills[i].SkillID) $ " bUsed:" $ strValue);
            PC.SkillBase.Skills[i].bUsed = bool(strValue);
        }
        // End:0x3d4
        if(GSSS.GetValue("Skill", string(PC.SkillBase.Skills[i].SkillID), "byAddCount", strValue) == true)
        {
            Log("wGameStateStorageGetter::GetUserSkillState() SkillID:" $ string(PC.SkillBase.Skills[i].SkillID) $ " byAddCount:" $ strValue);
            PC.SkillBase.Skills[i].byAddCount = byte(strValue);
        }
        // End:0x4d4
        if(GSSS.GetValue("Skill", string(PC.SkillBase.Skills[i].SkillID), "bUpdateCall", strValue) == true)
        {
            Log("wGameStateStorageGetter::GetUserSkillState() SkillID:" $ string(PC.SkillBase.Skills[i].SkillID) $ " bUpdateCall:" $ strValue);
            PC.SkillBase.Skills[i].bUpdateCall = bool(strValue);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xc7;
    }
}
