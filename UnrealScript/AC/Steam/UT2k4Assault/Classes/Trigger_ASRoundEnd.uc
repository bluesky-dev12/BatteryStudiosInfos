/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UT2k4Assault\Classes\Trigger_ASRoundEnd.uc
 * Package Imports:
 *	UT2k4Assault
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class Trigger_ASRoundEnd extends Triggers;

event Trigger(Actor Other, Pawn EventInstigator)
{
    // End:0x12
    if(Role < 4)
    {
        return;
    }
    // End:0x33
    if(!Level.Game.IsA('ASGameInfo'))
    {
        return;
    }
    ASGameInfo(Level.Game).EndRound(0, EventInstigator, "Attackers Win!");
}

defaultproperties
{
    bCollideActors=true
}