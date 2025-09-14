/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wSkill_RestoreSupply.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:6
 *	Functions:5
 *
 *******************************************************************************/
class wSkill_RestoreSupply extends wSkill;

var bool bAirStrike;
var bool bHeli;
var bool bUAV;
var int iAirWeaponID;
var int iHeliWeaponID;
var int iUAVWeaponID;

simulated function PostBeginPlay()
{
    // End:0xb5
    if(bAirStrike && !Base.Owner.Level.GetMatchMaker().bChangingHost && Base.Owner.Pawn != none)
    {
        Base.Owner.Pawn.PlayerReplicationInfo.bySupply_AirStrike = 1;
        Base.Owner.Pawn.AddWeaponFromSkill(EmptyBtrDouble(), iAirWeaponID);
    }
    // End:0x119
    else
    {
        // End:0x119
        if(Base.Owner != none && Base.Owner.Pawn != none)
        {
            // End:0x119
            if(Base.Owner.Pawn.HasWeaponByWeaponID(iAirWeaponID))
            {
                bAirStrike = true;
            }
        }
    }
    // End:0x1ce
    if(bHeli && !Base.Owner.Level.GetMatchMaker().bChangingHost && Base.Owner.Pawn != none)
    {
        Base.Owner.Pawn.PlayerReplicationInfo.bySupply_Helipack = 1;
        Base.Owner.Pawn.AddWeaponFromSkill(EmptyBtrDouble(), iHeliWeaponID);
    }
    // End:0x232
    else
    {
        // End:0x232
        if(Base.Owner != none && Base.Owner.Pawn != none)
        {
            // End:0x232
            if(Base.Owner.Pawn.HasWeaponByWeaponID(iHeliWeaponID))
            {
                bHeli = true;
            }
        }
    }
    // End:0x2e7
    if(bUAV && !Base.Owner.Level.GetMatchMaker().bChangingHost && Base.Owner.Pawn != none)
    {
        Base.Owner.Pawn.PlayerReplicationInfo.bySupply_UAV = 1;
        Base.Owner.Pawn.AddWeaponFromSkill(EmptyBtrDouble(), iUAVWeaponID);
    }
    // End:0x34b
    else
    {
        // End:0x34b
        if(Base.Owner != none && Base.Owner.Pawn != none)
        {
            // End:0x34b
            if(Base.Owner.Pawn.HasWeaponByWeaponID(iUAVWeaponID))
            {
                bUAV = true;
            }
        }
    }
}

simulated function RemoveSkill()
{
    bAirStrike = false;
    bHeli = false;
    bUAV = false;
}

simulated function SetSupplyItem(byte byType)
{
    switch(byType)
    {
        // End:0x17
        case 0:
            bAirStrike = true;
            // End:0x3a
            break;
        // End:0x27
        case 1:
            bHeli = true;
            // End:0x3a
            break;
        // End:0x37
        case 2:
            bUAV = true;
            // End:0x3a
            break;
        // End:0xffff
        default:
}

simulated function RemoveSupplyItem(byte byType)
{
    switch(byType)
    {
        // End:0x17
        case 0:
            bAirStrike = false;
            // End:0x3a
            break;
        // End:0x27
        case 1:
            bHeli = false;
            // End:0x3a
            break;
        // End:0x37
        case 2:
            bUAV = false;
            // End:0x3a
            break;
        // End:0xffff
        default:
}

simulated function UpdateProcess();

defaultproperties
{
    iAirWeaponID=5006
    iHeliWeaponID=5009
    iUAVWeaponID=5010
}