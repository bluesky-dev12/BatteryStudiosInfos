class wAction_ExploreTutorial extends wAction_Explore;

function bool CheckRequirement(wState ws)
{
    return ws.FreeLegs && !ws.CannotFindPath;
    //return;    
}

static function float CalcMeetNewEnemyProbability(wState ws)
{
    return float(ws.World_NumEnemies) / 4.0000000;
    //return;    
}
