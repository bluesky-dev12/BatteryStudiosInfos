class wTrigger_MSRoundEnd extends Triggers;

event Trigger(Actor Other, Pawn EventInstigator)
{
    // End:0x12
    if(int(Role) < int(ROLE_Authority))
    {
        return;
    }
    // End:0x33
    if(!Level.Game.IsA('wMSGameInfo'))
    {
        return;
    }
    wMSGameInfo(Level.Game).EndRound(0, EventInstigator, "Attackers Win!");
    //return;    
}

defaultproperties
{
    bCollideActors=false
}