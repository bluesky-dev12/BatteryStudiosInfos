/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wBombDelivery.uc
 * Package Imports:
 *	WGame
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:6
 *	Functions:8
 *
 *******************************************************************************/
class wBombDelivery extends GameObjective
    hidecategories(Lighting,LightColor,Karma,Force);

var(Team) int Team;
var wBombDeliveryHole MyHole;
var int ExplosionCounter;
var int ExplodeNow;
var int LastExplodeNow;
var() float TouchDownDifficulty;

replication
{
    // Pos:0x00
    reliable if(Role == 4)
        ExplodeNow;

}

function bool CanDoubleJump(Pawn Other)
{
    return true;
}

function bool CanMakeJump(Pawn Other, float JumpHeight, float GroundSpeed, int Num, Actor Start, bool bForceCheck)
{
    // End:0x77
    if(!bForceCheck && JumpHeight > Other.JumpZ && PhysicsVolume.Gravity.Z >= CalculatedGravityZ[Num] && NeededJump[Num].Z < float(2) * Other.JumpZ)
    {
        return true;
    }
    return super(JumpSpot).CanMakeJump(Other, JumpHeight, GroundSpeed, Num, Start, bForceCheck);
}

function float GetDifficulty()
{
    return TouchDownDifficulty;
}

simulated function PostBeginPlay()
{
    local NavigationPoint N;

    super.PostBeginPlay();
    // End:0xc8
    if(Role == 4)
    {
        DefenderTeamIndex = byte(Team);
        NetUpdateTime = Level.TimeSeconds - float(1);
        MyHole = Spawn(class'wBombDeliveryHole', self,, Location, Rotation);
        N = Level.NavigationPointList;
        J0x6a:
        // End:0xc8 [While If]
        if(N != none)
        {
            // End:0xb1
            if(ShootSpot(N) != none && ShootSpot(N).TeamNum == Team)
            {
                bHasShootSpots = true;
            }
            // End:0xc8
            else
            {
                N = N.nextNavigationPoint;
                // This is an implied JumpToken; Continue!
                goto J0x6a;
            }
        }
    }
    SetTeamColors();
}

function ScoreEffect(bool touchdown)
{
    ++ ExplodeNow;
    Spawn(class'NewExplosionA',,, Location + VRand() * vect(50.0, 50.0, 50.0));
    ExplosionCounter = 1;
    SetTimer(0.250, true);
}

simulated function Timer()
{
    Spawn(class'NewExplosionA',,, Location + VRand() * vect(50.0, 50.0, 50.0));
    ++ ExplosionCounter;
    // End:0x3f
    if(ExplosionCounter > 5)
    {
        SetTimer(0.0, false);
    }
}

simulated function SetTeamColors();
simulated event PostNetReceive()
{
    super.PostNetReceive();
    // End:0x53
    if(LastExplodeNow != ExplodeNow)
    {
        LastExplodeNow = ExplodeNow;
        Spawn(class'NewExplosionA',,, Location + VRand() * vect(50.0, 50.0, 50.0));
        ExplosionCounter = 1;
        SetTimer(0.250, true);
    }
}

defaultproperties
{
    TouchDownDifficulty=0.50
    DestructionMessage=""
    ObjectiveStringSuffix="?"
    bNotBased=true
    bDestinationOnly=true
    LightType=7
    LightEffect=21
    LightHue=255
    LightSaturation=55
    LightBrightness=255.0
    LightRadius=6.0
    DrawType=8
    bStatic=true
    bHidden=true
    bDynamicLight=true
    bWorldGeometry=true
    bAlwaysRelevant=true
    RemoteRole=2
    NetUpdateFrequency=40.0
    DrawScale=0.80
    bUnlit=true
    SoundRadius=255.0
    TransientSoundVolume=1.0
    CollisionRadius=16.0
    CollisionHeight=16.0
    bCollideActors=true
    bBlockActors=true
    bProjTarget=true
    bBlockKarma=true
    bNetNotify=true
    bPathColliding=true
}