/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\wHUD_DeathMatch.uc
 * Package Imports:
 *	XInterface
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class wHUD_DeathMatch extends HudCDeathmatch
    config(User)
    transient;

simulated function DrawResultScore(Canvas C)
{
    HudPart_DisplayEvent.DrawResultScore_FFA(C);
}
