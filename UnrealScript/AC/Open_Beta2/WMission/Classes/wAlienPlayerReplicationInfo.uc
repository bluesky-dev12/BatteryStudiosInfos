class wAlienPlayerReplicationInfo extends wMSPlayerReplicationInfo
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var wGameManager.EAlienModeType eObjType;
var byte InfectionLevel;
var byte bySkinID;
var byte InfectionPoint;
var bool bNoTransferAlien;
var float fAttackDereaseRate;

replication
{
    // Pos:0x000
    reliable if(bNetDirty && int(Role) == int(ROLE_Authority))
        InfectionLevel, bySkinID, 
        eObjType;

    // Pos:0x018
    reliable if(int(Role) < int(ROLE_Authority))
        ServerSetSkinID;
}

simulated function SetObjType(wGameManager.EAlienModeType eType)
{
    eObjType = eType;
    //return;    
}

simulated function wGameManager.EAlienModeType GetObjType()
{
    return eObjType;
    //return;    
}

simulated function SetInfectionLevel(byte Level)
{
    InfectionLevel = Level;
    //return;    
}

simulated function byte GetInfectionLevel()
{
    return InfectionLevel;
    //return;    
}

simulated function byte GetSelectedSkinID()
{
    // End:0x1D
    if(Class'Engine.wGameManager'.static.IsAlienTeamType(eObjType))
    {
        return bySkinID;
    }
    return 0;
    //return;    
}

simulated function ServerSetSkinID(byte bySkinID)
{
    self.bySkinID = bySkinID;
    //return;    
}

function Reset()
{
    super.Reset();
    fAttackDereaseRate = 1.0000000;
    //return;    
}

defaultproperties
{
    bySkinID=1
    InfectionPoint=1
    fAttackDereaseRate=1.0000000
    IsInvulnerable=false
}