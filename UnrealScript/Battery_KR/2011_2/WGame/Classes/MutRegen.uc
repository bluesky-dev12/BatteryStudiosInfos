class MutRegen extends Mutator
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var() float RegenPerSecond;

event PreBeginPlay()
{
    SetTimer(1.0000000, true);
    //return;    
}

function Timer()
{
    local Controller C;

    C = Level.ControllerList;
    J0x14:

    // End:0xD6 [Loop If]
    if(C != none)
    {
        // End:0xBF
        if((C.Pawn != none) && float(C.Pawn.Health) < C.Pawn.HealthMax)
        {
            C.Pawn.Health = Min(int(float(C.Pawn.Health) + RegenPerSecond), int(C.Pawn.HealthMax));
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x14;
    }
    //return;    
}

defaultproperties
{
    RegenPerSecond=5.0000000
    GroupName="Regen"
    FriendlyName="??"
    Description="?? ????? ??? ??? ?????."
}