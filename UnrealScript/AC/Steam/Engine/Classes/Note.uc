/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\Note.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *
 *******************************************************************************/
class Note extends Actor
    native
    placeable;

var() string Text;

defaultproperties
{
    bStatic=true
    bHidden=true
    bNoDelete=true
    Texture=Texture'S_Note'
    bMovable=true
}