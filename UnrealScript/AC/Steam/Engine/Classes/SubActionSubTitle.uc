/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\SubActionSubTitle.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *
 *******************************************************************************/
class SubActionSubTitle extends MatSubAction
    native
    editinlinenew;

var() SceneSubtitles.ESST_Mode SubTitleMode;

defaultproperties
{
    Icon=Texture'SubActionTrigger'
    Desc="Subtitles"
}