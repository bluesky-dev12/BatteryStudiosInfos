/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wAction.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:7
 *
 *******************************************************************************/
class wAction extends Object;

var int Layer;
var float MinTimeSegment;
var string ActionName;

function Goal GetGoal(wAIBotBase Owner);
function bool CheckRequirement(wState ws);
function float Sim_GetTime(wState ws);
function Sim_PreEffect(wState ws);
function Sim_PostEffect(wState ws);
function WriteFutureState(out wFutureState fs);
function ClearReferences();

defaultproperties
{
    MinTimeSegment=0.50
}