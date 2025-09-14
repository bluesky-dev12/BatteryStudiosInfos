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
    // Pos:0x000
    reliable if(int(Role) == int(ROLE_Authority))
        ExplodeNow;
}

function bool CanDoubleJump(Pawn Other)
{
    return true;
    //return;    
}

function bool CanMakeJump(Pawn Other, float JumpHeight, float GroundSpeed, int Num, Actor Start, bool bForceCheck)
{
    // End:0x77
    if(((!bForceCheck && JumpHeight > Other.JumpZ) && PhysicsVolume.Gravity.Z >= CalculatedGravityZ[Num]) && NeededJump[Num].Z < (float(2) * Other.JumpZ))
    {
        return true;
    }
    return super(JumpSpot).CanMakeJump(Other, JumpHeight, GroundSpeed, Num, Start, bForceCheck);
    //return;    
}

function float GetDifficulty()
{
    return TouchDownDifficulty;
    //return;    
}

simulated function PostBeginPlay()
{
    local NavigationPoint N;

    super.PostBeginPlay();
    // End:0xC8
    if(int(Role) == int(ROLE_Authority))
    {
        DefenderTeamIndex = byte(Team);
        NetUpdateTime = Level.TimeSeconds - float(1);
        MyHole = Spawn(Class'WGame_Decompressed.wBombDeliveryHole', self,, Location, Rotation);
        N = Level.NavigationPointList;
        J0x6A:

        // End:0xC8 [Loop If]
        if(N != none)
        {
            // End:0xB1
            if((ShootSpot(N) != none) && int(ShootSpot(N).TeamNum) == Team)
            {
                bHasShootSpots = true;
                // [Explicit Break]
                goto J0xC8;
            }
            N = N.nextNavigationPoint;
            // [Loop Continue]
            goto J0x6A;
        }
    }
    J0xC8:

    SetTeamColors();
    //return;    
}

function ScoreEffect(bool touchdown)
{
    ExplodeNow++;
    Spawn(Class'XEffects.NewExplosionA',,, Location + (VRand() * vect(50.0000000, 50.0000000, 50.0000000)));
    ExplosionCounter = 1;
    SetTimer(0.2500000, true);
    //return;    
}

simulated function Timer()
{
    Spawn(Class'XEffects.NewExplosionA',,, Location + (VRand() * vect(50.0000000, 50.0000000, 50.0000000)));
    ExplosionCounter++;
    // End:0x3F
    if(ExplosionCounter > 5)
    {
        SetTimer(0.0000000, false);
    }
    //return;    
}

simulated function SetTeamColors()
{
    //return;    
}

simulated event PostNetReceive()
{
    super.PostNetReceive();
    // End:0x53
    if(LastExplodeNow != ExplodeNow)
    {
        LastExplodeNow = ExplodeNow;
        Spawn(Class'XEffects.NewExplosionA',,, Location + (VRand() * vect(50.0000000, 50.0000000, 50.0000000)));
        ExplosionCounter = 1;
        SetTimer(0.2500000, true);
    }
    //return;    
}

defaultproperties
{
    TouchDownDifficulty=0.5000000
    DestructionMessage=""
    ObjectiveStringSuffix="?"
    bNotBased=true
    bDestinationOnly=true
    LightType=7
    LightEffect=21
    LightHue=255
    LightSaturation=55
    LightBrightness=255.0000000
    LightRadius=6.0000000
    DrawType=8
    bStatic=false
    bHidden=false
    bDynamicLight=true
    bWorldGeometry=true
    bAlwaysRelevant=true
    RemoteRole=2
    NetUpdateFrequency=40.0000000
    DrawScale=0.8000000
    bUnlit=true
    SoundRadius=255.0000000
    TransientSoundVolume=1.0000000
    CollisionRadius=16.0000000
    CollisionHeight=16.0000000
    bCollideActors=true
    bBlockActors=true
    bProjTarget=true
    bBlockKarma=true
    bNetNotify=true
    bPathColliding=true
}