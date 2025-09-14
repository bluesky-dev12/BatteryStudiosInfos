class NotifyProperties extends Object
    native
    collapsecategories
    hidecategories(Object);

struct native NotifyInfo
{
    var() float NotifyFrame;
    var() editinlinenotify AnimNotify Notify;
    var int OldRevisionNum;
};

var int OldArrayCount;
var const transient pointer WBrowserAnimationPtr;
var() array<NotifyInfo> Notifys;
