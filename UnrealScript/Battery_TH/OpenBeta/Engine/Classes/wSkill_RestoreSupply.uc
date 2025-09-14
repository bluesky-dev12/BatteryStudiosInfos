class wSkill_RestoreSupply extends wSkill;

var bool bAirStrike;
var bool bHeli;
var bool bUAV;
var int iAirWeaponID;
var int iHeliWeaponID;
var int iUAVWeaponID;

simulated function PostBeginPlay()
{
    // End:0xB5
    if((bAirStrike && !Base.Owner.Level.GetMatchMaker().bChangingHost) && Base.Owner.Pawn != none)
    {
        Base.Owner.Pawn.PlayerReplicationInfo.bySupply_AirStrike = 1;
        Base.Owner.Pawn.AddWeaponFromSkill(EmptyBtrDouble(), iAirWeaponID);        
    }
    else
    {
        // End:0x119
        if((Base.Owner != none) && Base.Owner.Pawn != none)
        {
            // End:0x119
            if(Base.Owner.Pawn.HasWeaponByWeaponID(iAirWeaponID))
            {
                bAirStrike = true;
            }
        }
    }
    // End:0x1CE
    if((bHeli && !Base.Owner.Level.GetMatchMaker().bChangingHost) && Base.Owner.Pawn != none)
    {
        Base.Owner.Pawn.PlayerReplicationInfo.bySupply_Helipack = 1;
        Base.Owner.Pawn.AddWeaponFromSkill(EmptyBtrDouble(), iHeliWeaponID);        
    }
    else
    {
        // End:0x232
        if((Base.Owner != none) && Base.Owner.Pawn != none)
        {
            // End:0x232
            if(Base.Owner.Pawn.HasWeaponByWeaponID(iHeliWeaponID))
            {
                bHeli = true;
            }
        }
    }
    // End:0x2E7
    if((bUAV && !Base.Owner.Level.GetMatchMaker().bChangingHost) && Base.Owner.Pawn != none)
    {
        Base.Owner.Pawn.PlayerReplicationInfo.bySupply_UAV = 1;
        Base.Owner.Pawn.AddWeaponFromSkill(EmptyBtrDouble(), iUAVWeaponID);        
    }
    else
    {
        // End:0x34B
        if((Base.Owner != none) && Base.Owner.Pawn != none)
        {
            // End:0x34B
            if(Base.Owner.Pawn.HasWeaponByWeaponID(iUAVWeaponID))
            {
                bUAV = true;
            }
        }
    }
    //return;    
}

simulated function RemoveSkill()
{
    bAirStrike = false;
    bHeli = false;
    bUAV = false;
    //return;    
}

simulated function SetSupplyItem(byte byType)
{
    switch(byType)
    {
        // End:0x17
        case 0:
            bAirStrike = true;
            // End:0x3A
            break;
        // End:0x27
        case 1:
            bHeli = true;
            // End:0x3A
            break;
        // End:0x37
        case 2:
            bUAV = true;
            // End:0x3A
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

simulated function RemoveSupplyItem(byte byType)
{
    switch(byType)
    {
        // End:0x17
        case 0:
            bAirStrike = false;
            // End:0x3A
            break;
        // End:0x27
        case 1:
            bHeli = false;
            // End:0x3A
            break;
        // End:0x37
        case 2:
            bUAV = false;
            // End:0x3A
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

simulated function UpdateProcess()
{
    //return;    
}

defaultproperties
{
    iAirWeaponID=5006
    iHeliWeaponID=5009
    iUAVWeaponID=5010
}