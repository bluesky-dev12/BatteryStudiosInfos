/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\SubActionFade.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *
 *******************************************************************************/
class SubActionFade extends MatSubAction
    native
    editinlinenew;

var(Fade) Color FadeColor;
var(Fade) bool bFadeOut;

defaultproperties
{
    bFadeOut=true
    Icon=Texture'SubActionFade'
    Desc="Fade"
}