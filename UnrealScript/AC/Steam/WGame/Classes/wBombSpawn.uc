/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wBombSpawn.uc
 * Package Imports:
 *	WGame
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:3
 *
 *******************************************************************************/
class wBombSpawn extends GameObjective
    hidecategories(Lighting,LightColor,Karma,Force);

var() Sound TakenSound;
var wBombFlag myFlag;
var class<wBombFlag> FlagType;

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
        Warn(string(self) $ " could not spawn flag of type '" $ string(FlagType) $ "' at " $ string(Location));
        return;
    }
    // End:0x99
    else
    {
        myFlag.HomeBase = self;
    }
    Spawn(class'wBombBase', self,, Location - vect(0.0, 0.0, 60.0), Rotation);
}

function bool BotNearObjective(Bot B)
{
    // End:0x1a
    if(myFlag == none || B == none)
    {
        return false;
    }
    // End:0x5d
    if(MyBaseVolume != none && myFlag.bHome && B.Pawn.IsInVolume(MyBaseVolume))
    {
        return true;
    }
    return VSize(myFlag.Position().Location - B.Pawn.Location) < float(2000) && B.LineOfSightTo(myFlag.Position());
}

function bool BetterObjectiveThan(GameObjective Best, byte DesiredTeamNum, byte RequesterTeamNum)
{
    // End:0x2b
    if(!myFlag.bHome || RequesterTeamNum == DesiredTeamNum)
    {
        return false;
    }
    return true;
}

defaultproperties
{
    FlagType=class'wBombFlag'
    DefenderTeamIndex=255
    ObjectiveName="?(bomb) ??"
    bNotBased=true
    LightType=7
    LightEffect=21
    LightHue=37
    LightSaturation=255
    LightBrightness=128.0
    LightRadius=6.0
    DrawType=8
    bAlwaysRelevant=true
    NetUpdateFrequency=8.0
    DrawScale=3.0
    bUnlit=true
    CollisionRadius=60.0
    CollisionHeight=60.0
    bCollideActors=true
}