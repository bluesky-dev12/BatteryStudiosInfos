/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wDOMLetter.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:3
 *
 *******************************************************************************/
class wDOMLetter extends Decoration
    abstract;

var() Material RedTeamShader;
var() Material BlueTeamShader;
var() Material NeutralShader;

defaultproperties
{
    bNetNotify=true
}