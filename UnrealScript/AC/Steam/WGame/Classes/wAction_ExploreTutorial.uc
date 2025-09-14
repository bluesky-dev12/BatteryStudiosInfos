/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wAction_ExploreTutorial.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Functions:2
 *
 *******************************************************************************/
class wAction_ExploreTutorial extends wAction_Explore;

function bool CheckRequirement(wState ws)
{
    return ws.FreeLegs && !ws.CannotFindPath;
}

static function float CalcMeetNewEnemyProbability(wState ws)
{
    return float(ws.World_NumEnemies) / 4.0;
}
