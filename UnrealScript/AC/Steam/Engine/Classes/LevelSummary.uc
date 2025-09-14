/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\LevelSummary.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:11
 *
 *******************************************************************************/
class LevelSummary extends Object
    native;

var() localized string Title;
var() localized string Description;
var() localized string LevelEnterText;
var() string Author;
var() string DecoTextName;
var() int IdealPlayerCountMin;
var() int IdealPlayerCountMax;
var() bool HideFromMenus;
var(SinglePlayer) int SinglePlayerTeamSize;
var() Material Screenshot;
var() string ExtraInfo;
