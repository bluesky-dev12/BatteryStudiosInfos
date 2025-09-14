class wBombSpawn extends GameObjective
    hidecategories(Lighting,LightColor,Karma,Force);

var() Sound TakenSound;
var wBombFlag myFlag;
var Class<wBombFlag> FlagType;

function BeginPlay()
{
    super(Actor).BeginPlay();
    // End:0x27
    if(!Level.Game.IsA('wBombingRun'))
    {
        return;
    }
    myFlag = Spawn(FlagType, self);
    // End:0x89
    if(myFlag == none)
    {
        Warn((((string(self) $ " could not spawn flag of type '") $ string(FlagType)) $ "' at ") $ string(Location));
        return;        
    }
    else
    {
        myFlag.HomeBase = self;
    }
    Spawn(Class'WGame_Decompressed.wBombBase', self,, Location - vect(0.0000000, 0.0000000, 60.0000000), Rotation);
    //return;    
}

function bool BotNearObjective(Bot B)
{
    // End:0x1A
    if((myFlag == none) || B == none)
    {
        return false;
    }
    // End:0x5D
    if(((MyBaseVolume != none) && myFlag.bHome) && B.Pawn.IsInVolume(MyBaseVolume))
    {
        return true;
    }
    return (VSize(myFlag.Position().Location - B.Pawn.Location) < float(2000)) && B.LineOfSightTo(myFlag.Position());
    //return;    
}

function bool BetterObjectiveThan(GameObjective Best, byte DesiredTeamNum, byte RequesterTeamNum)
{
    // End:0x2B
    if(!myFlag.bHome || int(RequesterTeamNum) == int(DesiredTeamNum))
    {
        return false;
    }
    return true;
    //return;    
}

defaultproperties
{
    FlagType=Class'WGame_Decompressed.wBombFlag'
    DefenderTeamIndex=255
    ObjectiveName="?(bomb) ??"
    bNotBased=true
    LightType=7
    LightEffect=21
    LightHue=37
    LightSaturation=255
    LightBrightness=128.0000000
    LightRadius=6.0000000
    DrawType=8
    bAlwaysRelevant=true
    NetUpdateFrequency=8.0000000
    DrawScale=3.0000000
    bUnlit=true
    CollisionRadius=60.0000000
    CollisionHeight=60.0000000
    bCollideActors=true
}