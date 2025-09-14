/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\InventoryAttachment.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:1
 *
 *******************************************************************************/
class InventoryAttachment extends Actor
    native
    nativereplication
    notplaceable;

var bool bFastAttachmentReplication;
var int inventoryattachment_dummy;

function InitFor(Inventory i)
{
    Instigator = i.Instigator;
}

defaultproperties
{
    bFastAttachmentReplication=true
    DrawType=2
    bOnlyDrawIfAttached=true
    bOnlyDirtyReplication=true
    RemoteRole=2
    NetUpdateFrequency=10.0
    AttachmentBone=righthand
    bUseLightingFromBase=true
}