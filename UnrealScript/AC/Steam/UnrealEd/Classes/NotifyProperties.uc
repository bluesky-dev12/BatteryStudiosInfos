/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealEd\Classes\NotifyProperties.uc
 * Package Imports:
 *	UnrealEd
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:3
 *
 *******************************************************************************/
class NotifyProperties extends Object
    hidecategories(Object)
    native
    collapsecategories;

struct native NotifyInfo
{
    var() float NotifyFrame;
    var() databinding editinlinenotify AnimNotify Notify;
    var int OldRevisionNum;
};

var int OldArrayCount;
var const transient pointer WBrowserAnimationPtr;
var() array<NotifyInfo> Notifys;
