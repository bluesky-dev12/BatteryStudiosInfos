/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\CTFBase.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:4
 *
 *******************************************************************************/
class CTFBase extends GameObjective
    hidecategories(Lighting,LightColor,Karma,Force)
    abstract;

var() Sound TakenSound;
var CTFFlag myFlag;
var class<CTFFlag> FlagType;

function BeginPlay()
{
    super(Actor).BeginPlay();
    bHidden = false;
    myFlag = Spawn(FlagType, self);
    // End:0x70
    if(myFlag == none)
    {
        Warn(string(self) $ " could not spawn flag of type '" $ string(FlagType) $ "' at " $ string(Location));
        return;
    }
    // End:0x94
    else
    {
        myFlag.HomeBase = self;
        myFlag.TeamNum = DefenderTeamIndex;
    }
}

function PostBeginPlay()
{
    local UnrealScriptedSequence W;

    super.PostBeginPlay();
    SetBaseDistance(DefenderTeamIndex);
    SetBaseVisibility(DefenderTeamIndex);
    W = DefenseScripts;
    J0x2b:
    // End:0x80 [While If]
    if(W != none)
    {
        // End:0x69
        if(W.myMarker != none)
        {
            W.myMarker.SetBaseVisibility(DefenderTeamIndex);
        }
        W = W.NextScript;
        // This is an implied JumpToken; Continue!
        goto J0x2b;
    }
}

function PlayAlarm()
{
    SetTimer(5.0, false);
    AmbientSound = TakenSound;
}

function Timer()
{
    AmbientSound = none;
}

defaultproperties
{
    DrawType=2
    bStatic=true
    bAlwaysRelevant=true
    NetUpdateFrequency=8.0
    DrawScale=1.30
    SoundRadius=255.0
    CollisionRadius=60.0
    CollisionHeight=60.0
    bCollideActors=true
}