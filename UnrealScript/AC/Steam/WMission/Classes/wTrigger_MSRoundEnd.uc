/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WMission\Classes\wTrigger_MSRoundEnd.uc
 * Package Imports:
 *	WMission
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class wTrigger_MSRoundEnd extends Triggers;

event Trigger(Actor Other, Pawn EventInstigator)
{
    // End:0x12
    if(Role < 4)
    {
        return;
    }
    // End:0x33
    if(!Level.Game.IsA('wMSGameInfo'))
    {
        return;
    }
    wMSGameInfo(Level.Game).EndRound(0, EventInstigator, "Attackers Win!");
}

defaultproperties
{
    bCollideActors=true
}