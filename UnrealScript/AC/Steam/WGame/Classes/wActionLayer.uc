/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wActionLayer.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:1
 *
 *******************************************************************************/
class wActionLayer extends Object;

var array<wAction> Actions;

function wActionLayer Init()
{
    Actions.Length = 0;
    return self;
}
