class wTrigger_MSRoundEnd_Diffused extends Triggers;

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
    wMSGameInfo(Level.Game).EndRound(1, EventInstigator, "!!! Defender Win - Bomb Defused !!!");
    //return;    
}

defaultproperties
{
    bCollideActors=false
}