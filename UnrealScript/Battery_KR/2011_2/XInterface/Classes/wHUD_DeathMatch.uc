class wHUD_DeathMatch extends HudCDeathmatch
    transient
    config(User);

simulated function DrawResultScore(Canvas C)
{
    HudPart_DisplayEvent.DrawResultScore_FFA(C);
    //return;    
}
