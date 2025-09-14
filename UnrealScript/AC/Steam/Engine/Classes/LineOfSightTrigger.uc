/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\LineOfSightTrigger.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:8
 *	Functions:4
 *
 *******************************************************************************/
class LineOfSightTrigger extends Triggers
    native
    placeable;

var() float MaxViewDist;
var float OldTickTime;
var() bool bEnabled;
var bool bTriggered;
var() name SeenActorTag;
var Actor SeenActor;
var() int MaxViewAngle;
var float RequiredViewDir;

function PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    RequiredViewDir = Cos(float(MaxViewAngle) * 3.1415930 / float(180));
    // End:0x4b
    if(SeenActorTag != 'None')
    {
        // End:0x4a
        foreach AllActors(class'Actor', SeenActor, SeenActorTag)
        {
            // End:0x4a
            break;                        
        }
    }
    // End:0x6f
    if(Level.GetMatchMaker().BotTutorial)
    {
        bEnabled = false;
    }
}

event PlayerSeesMe(PlayerController P)
{
    TriggerEvent(Event, self, P.Pawn);
    bTriggered = true;
}

function Trigger(Actor Other, Pawn EventInstigator)
{
    bEnabled = true;
    // End:0x51
    if(Level.GetMatchMaker().BotTutorial)
    {
        // End:0x3b
        if(Other != none)
        {
            SetTimer(0.10, true);
        }
        // End:0x51
        else
        {
            bEnabled = false;
            Disable('Trigger');
            Disable('Timer');
        }
    }
}

function Timer()
{
    local PlayerController PC;

    // End:0x137
    if(Level.GetMatchMaker().BotTutorial && bEnabled)
    {
        PC = Level.GetLocalPlayerController();
        // End:0x137
        if(PC.Pawn.Weapon != none)
        {
            // End:0x137
            if(PC.Pawn.Weapon.WeaponType == 1 || PC.Pawn.Weapon.WeaponType == 4 || PC.Pawn.Weapon.WeaponType == 2 || PC.Pawn.Weapon.WeaponType == 3)
            {
                PC.Pawn.Weapon.FireMode[0].DoFireEffect();
            }
        }
    }
}

defaultproperties
{
    MaxViewDist=3000.0
    bEnabled=true
    MaxViewAngle=15
    bCollideActors=true
}