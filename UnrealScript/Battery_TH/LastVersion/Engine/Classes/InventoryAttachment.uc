class InventoryAttachment extends Actor
    native
    nativereplication
    notplaceable;

var bool bFastAttachmentReplication;
var int inventoryattachment_dummy;

function InitFor(Inventory i)
{
    Instigator = i.Instigator;
    //return;    
}

defaultproperties
{
    bFastAttachmentReplication=true
    DrawType=2
    bOnlyDrawIfAttached=true
    bOnlyDirtyReplication=true
    RemoteRole=2
    NetUpdateFrequency=10.0000000
    AttachmentBone="righthand"
    bUseLightingFromBase=true
}