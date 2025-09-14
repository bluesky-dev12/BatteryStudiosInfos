/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wPrivilegeBase.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:1
 *
 *******************************************************************************/
class wPrivilegeBase extends Object
    abstract;

var localized string LoadMsg;
var localized string MainPrivs;
var localized string SubPrivs;
var localized array<localized string> Tags;

event Created();
