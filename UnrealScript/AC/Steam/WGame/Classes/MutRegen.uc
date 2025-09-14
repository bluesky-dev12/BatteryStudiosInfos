/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\MutRegen.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:2
 *
 *******************************************************************************/
class MutRegen extends Mutator
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var() float RegenPerSecond;

event PreBeginPlay()
{
    SetTimer(1.0, true);
}

function Timer()
{
    local Controller C;

    C = Level.ControllerList;
    J0x14:
    // End:0xd6 [While If]
    if(C != none)
    {
        // End:0xbf
        if(C.Pawn != none && float(C.Pawn.Health) < C.Pawn.HealthMax)
        {
            C.Pawn.Health = Min(int(float(C.Pawn.Health) + RegenPerSecond), int(C.Pawn.HealthMax));
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
}

defaultproperties
{
    RegenPerSecond=5.0
    GroupName="Regen"
    FriendlyName="??"
    Description="?? ????? ??? ??? ?????."
}