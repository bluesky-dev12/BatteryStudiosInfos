class wAlienPlayerReplicationInfo extends wMSPlayerReplicationInfo
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var wGameManager.EAlienModeType eObjType;
var byte InfectionLevel;
var wGameManager.EAlienMode_Object_Type eSkinType;
var byte InfectionPoint;
var float fAttackDereaseRate;
var byte NoTransferAlienPoint;

replication
{
    // Pos:0x000
    reliable if(bNetDirty && int(Role) == int(ROLE_Authority))
        InfectionLevel, eObjType, 
        eSkinType;
}

simulated function SetObjType(wGameManager.EAlienModeType eObjType)
{
    self.eObjType = eObjType;
    //return;    
}

simulated function wGameManager.EAlienModeType GetObjType()
{
    return eObjType;
    //return;    
}

simulated function SetSkinType(wGameManager.EAlienMode_Object_Type eSkinType)
{
    self.eSkinType = eSkinType;
    //return;    
}

simulated function wGameManager.EAlienMode_Object_Type GetSkinType()
{
    return eSkinType;
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

function Reset()
{
    super.Reset();
    fAttackDereaseRate = 1.0000000;
    //return;    
}

simulated function int GetTeamIndex()
{
    // End:0x1C
    if(Class'Engine.wGameManager'.static.IsAlienTeamType(eObjType))
    {
        return 1;        
    }
    else
    {
        return 0;
    }
    //return;    
}

defaultproperties
{
    InfectionPoint=1
    fAttackDereaseRate=1.0000000
    IsInvulnerable=false
}