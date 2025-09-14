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
    RequiredViewDir = Cos((float(MaxViewAngle) * 3.1415927) / float(180));
    // End:0x4B
    if(SeenActorTag != 'None')
    {
        // End:0x4A
        foreach AllActors(Class'Engine_Decompressed.Actor', SeenActor, SeenActorTag)
        {
            // End:0x4A
            break;            
        }        
    }
    // End:0x6F
    if(Level.GetMatchMaker().BotTutorial)
    {
        bEnabled = false;
    }
    //return;    
}

event PlayerSeesMe(PlayerController P)
{
    TriggerEvent(Event, self, P.Pawn);
    bTriggered = true;
    //return;    
}

function Trigger(Actor Other, Pawn EventInstigator)
{
    bEnabled = true;
    // End:0x51
    if(Level.GetMatchMaker().BotTutorial)
    {
        // End:0x3B
        if(Other != none)
        {
            SetTimer(0.1000000, true);            
        }
        else
        {
            bEnabled = false;
            Disable('Trigger');
            Disable('Timer');
        }
    }
    //return;    
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
            if((((int(PC.Pawn.Weapon.WeaponType) == int(1)) || int(PC.Pawn.Weapon.WeaponType) == int(4)) || int(PC.Pawn.Weapon.WeaponType) == int(2)) || int(PC.Pawn.Weapon.WeaponType) == int(3))
            {
                PC.Pawn.Weapon.FireMode[0].DoFireEffect();
            }
        }
    }
    //return;    
}

defaultproperties
{
    MaxViewDist=3000.0000000
    bEnabled=true
    MaxViewAngle=15
    bCollideActors=false
}