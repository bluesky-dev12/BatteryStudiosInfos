/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTTPMailReadHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:36
 *	Functions:4
 *
 *******************************************************************************/
class BTTPMailReadHK extends GUITabPanel
    editinlinenew
    instanced;

var BtrDouble ItemUID;
var int CurrentMailType;
var int CurrentItemID;
var BtrDouble CurrentItemUID;
var export editinline BTOwnerDrawImageHK LabelTitle;
var export editinline BTOwnerDrawImageHK LabelSender;
var export editinline BTOwnerDrawImageHK EditSender;
var export editinline BTOwnerDrawImageHK LabelRecvDate;
var export editinline BTOwnerDrawImageHK EditRecvDate;
var export editinline BTOwnerDrawImageHK LabelContent;
var export editinline BTAutoScrollListHK Content;
var export editinline BTPointBoxHK PointInfo;
var export editinline BTItemInfoHorzBoxHK WeaponInfo;
var export editinline BTOwnerDrawCaptionButtonHK ButtonReply;
var export editinline BTOwnerDrawCaptionButtonHK ButtonDelete;
var export editinline BTOwnerDrawCaptionButtonHK ButtonReceiveItem;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelTitle;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelSender;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelRecvDate;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbEditSender;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbEditRecvDate;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelContent[3];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbContent[3];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbButtonReply;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbButtonDelete;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbButtonReceiveItem;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbWeaponInfo;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbPointInfo;
var localized string strLabelTitle[2];
var localized string strLabelSender[2];
var localized string strLabelRecvDate[2];
var localized string strCash;
var localized string strButtonReply;
var localized string strButtonDelete;
var localized string strButtonReceivePoint;
var localized string strButtonReceiveItem;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local FloatBox fb;

    super(GUIPanel).InitComponent(MyController, myOwner);
    LabelTitle = new class'BTOwnerDrawImageHK';
    LabelTitle.BackgroundImage = class'BTCustomDrawHK'.static.MakeImage(512, 8, 28, texture'img_ptitl_back');
    LabelTitle.bUseAWinPos = true;
    LabelTitle.Caption = strLabelTitle[0];
    LabelTitle.SetFontSizeAll(11);
    LabelTitle.CaptionPadding[0] = 8;
    LabelTitle.SetFontDrawType(3);
    LabelTitle.AWinPos = fbLabelTitle;
    LabelTitle.InitComponent(Controller, self);
    AppendComponent(LabelTitle);
    LabelSender = new class'BTOwnerDrawImageHK';
    LabelSender.bUseAWinPos = true;
    LabelSender.Caption = strLabelSender[0];
    LabelSender.SetFontDrawType(3);
    LabelSender.AWinPos = fbLabelSender;
    LabelSender.InitComponent(Controller, self);
    AppendComponent(LabelSender);
    LabelRecvDate = new class'BTOwnerDrawImageHK';
    LabelRecvDate.bUseAWinPos = true;
    LabelRecvDate.Caption = strLabelRecvDate[0];
    LabelRecvDate.SetFontDrawType(3);
    LabelRecvDate.AWinPos = fbLabelRecvDate;
    LabelRecvDate.InitComponent(Controller, self);
    AppendComponent(LabelRecvDate);
    EditSender = new class'BTOwnerDrawImageHK';
    EditSender.BackgroundImage = class'BTUIResourcePoolHK'.default.panel_5;
    EditSender.bUseAWinPos = true;
    EditSender.AWinPos = fbEditSender;
    EditSender.SetFontDrawType(0);
    EditSender.InitComponent(Controller, self);
    AppendComponent(EditSender);
    EditSender.CaptionPadding[0] = 7;
    EditSender.CaptionPadding[1] = 3;
    EditRecvDate = new class'BTOwnerDrawImageHK';
    EditRecvDate.BackgroundImage = class'BTUIResourcePoolHK'.default.panel_5;
    EditRecvDate.bUseAWinPos = true;
    EditRecvDate.AWinPos = fbEditRecvDate;
    EditRecvDate.SetFontDrawType(0);
    EditRecvDate.InitComponent(Controller, self);
    AppendComponent(EditRecvDate);
    EditRecvDate.CaptionPadding[0] = 7;
    EditRecvDate.CaptionPadding[1] = 3;
    LabelContent = new class'BTOwnerDrawImageHK';
    LabelContent.BackgroundImage = class'BTUIResourcePoolHK'.default.panel_5;
    LabelContent.bUseAWinPos = true;
    LabelContent.AWinPos = fbLabelContent[0];
    LabelContent.InitComponent(Controller, self);
    AppendComponent(LabelContent);
    Content = new class'BTAutoScrollListHK';
    Content.bUseAWinPos = true;
    Content.AWinPos = fbContent[0];
    Content.AWinPos.X2 -= float(14);
    Content.InitComponent(Controller, self);
    AppendComponent(Content);
    Content.MultiColumnList.MyScrollBar.bUseAWinPos = true;
    Content.MultiColumnList.MyScrollBar.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(0.0, 0.0, 0.0, 0.0);
    Content.SelectImage = class'BTUIResourcePoolHK'.default.empty;
    ButtonReply = new class'BTOwnerDrawCaptionButtonHK';
    ButtonReply.bUseAWinPos = true;
    ButtonReply.AWinPos = fbButtonReply;
    ButtonReply.Caption = strButtonReply;
    ButtonReply.SetDefaultButtonImage();
    ButtonReply.SetFontSizeAll(11);
    ButtonReply.InitComponent(Controller, self);
    AppendComponent(ButtonReply);
    ButtonDelete = new class'BTOwnerDrawCaptionButtonHK';
    ButtonDelete.bUseAWinPos = true;
    ButtonDelete.AWinPos = fbButtonDelete;
    ButtonDelete.Caption = strButtonDelete;
    ButtonDelete.SetDefaultButtonImage();
    ButtonDelete.SetFontSizeAll(11);
    ButtonDelete.InitComponent(Controller, self);
    AppendComponent(ButtonDelete);
    ButtonReceiveItem = new class'BTOwnerDrawCaptionButtonHK';
    ButtonReceiveItem.bUseAWinPos = true;
    ButtonReceiveItem.AWinPos = fbButtonReceiveItem;
    ButtonReceiveItem.Caption = strButtonReceiveItem;
    ButtonReceiveItem.SetDefaultButtonImage();
    ButtonReceiveItem.SetFontSizeAll(11);
    ButtonReceiveItem.InitComponent(Controller, self);
    AppendComponent(ButtonReceiveItem);
    WeaponInfo = new class'BTItemInfoHorzBoxHK';
    WeaponInfo.bUseAWinPos = true;
    WeaponInfo.AWinPos = fbWeaponInfo;
    WeaponInfo.InitComponent(Controller, self);
    WeaponInfo.ItemStateView.bUseAWinPos = true;
    fb.X1 = WeaponInfo.AWinPos.X1 + float(318);
    fb.Y1 = WeaponInfo.AWinPos.Y1 + float(3);
    fb.Y2 = WeaponInfo.AWinPos.Y1 + float(118);
    fb.X2 = WeaponInfo.AWinPos.X1 + float(318) + float(242);
    WeaponInfo.ItemStateView.AWinPos = fb;
    WeaponInfo.ItemStateView.ApplyAWinPos();
    AppendComponent(WeaponInfo);
    PointInfo = new class'BTPointBoxHK';
    PointInfo.bUseAWinPos = true;
    PointInfo.AWinPos = fbPointInfo;
    PointInfo.InitComponent(Controller, self);
    AppendComponent(PointInfo);
    ChangeMailType(0);
}

function ChangeMailType(int MailType, optional int ItemID, optional BtrDouble ItemUID, optional int StackCount)
{
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    CurrentMailType = MailType;
    CurrentItemID = ItemID;
    CurrentItemUID = ItemUID;
    LabelContent.AWinPos = fbLabelContent[MailType];
    LabelContent.ApplyAWinPos();
    Content.AWinPos = fbContent[MailType];
    Content.ApplyAWinPos();
    // End:0x162
    if(MailType == 0)
    {
        WeaponInfo.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(0.0, 0.0, 0.0, 0.0);
        WeaponInfo.ApplyAWinPos();
        WeaponInfo.SetVisibility(false);
        PointInfo.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(0.0, 0.0, 0.0, 0.0);
        PointInfo.ApplyAWinPos();
        PointInfo.SetVisibility(false);
        ButtonReceiveItem.SetVisibility(false);
    }
    // End:0x608
    else
    {
        // End:0x39c
        if(MailType == 1)
        {
            WeaponInfo.AWinPos = fbWeaponInfo;
            WeaponInfo.ApplyAWinPos();
            WeaponInfo.SetVisibility(true);
            PointInfo.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(0.0, 0.0, 0.0, 0.0);
            PointInfo.ApplyAWinPos();
            PointInfo.SetVisibility(false);
            ItemInfo = GameMgr.FindUIItem(ItemID);
            instanceInfo = new class'wItemBoxInstanceHK';
            // End:0x288
            if(ItemInfo.CostType == 1 || ItemInfo.CostType == 4)
            {
                instanceInfo.LeftTime.Day = StackCount / 24;
                instanceInfo.LeftTime.Hour = int(float(StackCount) % float(24));
            }
            // End:0x307
            else
            {
                // End:0x2de
                if(ItemInfo.CostType == 0 || ItemInfo.CostType == 2)
                {
                    instanceInfo.PartID = StackCount;
                    instanceInfo.Durability = 100000;
                }
                // End:0x307
                else
                {
                    // End:0x307
                    if(ItemInfo.CostType == 3)
                    {
                        instanceInfo.OverlapCount = StackCount;
                    }
                }
            }
            WeaponInfo.SetData(ItemInfo, instanceInfo, none, none);
            WeaponInfo.ItemBoxView.itemBox.colCurrentUntilTime = class'BTUIColorPoolHK'.static.DefaultWhite();
            WeaponInfo.ItemBoxView.itemBox.ChangeState(10);
            ButtonReceiveItem.SetVisibility(true);
            ButtonReceiveItem.Caption = strButtonReceiveItem;
        }
        // End:0x608
        else
        {
            // End:0x467
            if(MailType == 2)
            {
                WeaponInfo.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(0.0, 0.0, 0.0, 0.0);
                WeaponInfo.ApplyAWinPos();
                WeaponInfo.SetVisibility(false);
                PointInfo.AWinPos = fbPointInfo;
                PointInfo.ApplyAWinPos();
                PointInfo.SetVisibility(true);
                PointInfo.SetData(ItemUID);
                ButtonReceiveItem.SetVisibility(true);
                ButtonReceiveItem.Caption = strButtonReceivePoint;
            }
            // End:0x608
            else
            {
                // End:0x608
                if(MailType == 7)
                {
                    WeaponInfo.AWinPos = fbWeaponInfo;
                    WeaponInfo.ApplyAWinPos();
                    WeaponInfo.SetVisibility(true);
                    PointInfo.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(0.0, 0.0, 0.0, 0.0);
                    PointInfo.ApplyAWinPos();
                    PointInfo.SetVisibility(false);
                    ItemInfo = new class'wItemBoxHK';
                    WeaponInfo.SetData(ItemInfo, none, none, none);
                    WeaponInfo.ItemStateView.SetVisibility(false);
                    WeaponInfo.EditItemDescription.SetText("");
                    WeaponInfo.ItemBoxView.itemBox.ItemImage = class'BTUIResourcePoolHK'.default.item_item_cash;
                    WeaponInfo.ItemBoxView.itemBox.ItemName = class'BTCustomDrawHK'.static.MakeText(12, 0, string(ItemID) @ strCash);
                    WeaponInfo.ItemBoxView.itemBox.ChangeState(10);
                    ButtonReceiveItem.SetVisibility(true);
                    ButtonReceiveItem.Caption = strButtonReceiveItem;
                }
            }
        }
    }
}

function Clear()
{
    EditSender.Caption = "";
    EditRecvDate.Caption = "";
    Content.Clear();
}

function SetData(Canvas C, int TabIndex, int ItemType, string Sender, string recv_date, string Text, optional int ItemID, optional BtrDouble iItemUID, optional string ExtraText, optional int StackCount)
{
    local int i;
    local array<string> tarray;
    local wMatchMaker MM;

    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    ItemUID = iItemUID;
    EditSender.Caption = Sender;
    EditRecvDate.Caption = recv_date;
    Content.Clear();
    Split(Text, Chr(13), tarray);
    i = 0;
    J0x89:
    // End:0xc2 [While If]
    if(i < tarray.Length)
    {
        Content.AddRow(C, tarray[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x89;
    }
    tarray.Length = 0;
    Split(ExtraText, Chr(13), tarray);
    i = 0;
    J0xe1:
    // End:0x11a [While If]
    if(i < tarray.Length)
    {
        Content.AddRow(C, tarray[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xe1;
    }
    switch(ItemType)
    {
        // End:0x140
        case 2:
            ChangeMailType(1, ItemID, EmptyBtrDouble(), StackCount);
            // End:0x17d
            break;
        // End:0x15b
        case 4:
            ChangeMailType(2, 0, ItemUID, StackCount);
            // End:0x17d
            break;
        // End:0x170
        case 7:
            ChangeMailType(7, ItemID);
            // End:0x17d
            break;
        // End:0xffff
        default:
            ChangeMailType(0);
            // End:0x17d Break;
            break;
    }
    // End:0x1ff
    if(TabIndex == 0)
    {
        LabelTitle.Caption = strLabelTitle[TabIndex];
        LabelSender.Caption = strLabelSender[TabIndex];
        LabelRecvDate.Caption = strLabelRecvDate[TabIndex];
        // End:0x1fc
        if(MM.GMLevelFlag == 0)
        {
            ButtonReply.SetVisibility(false);
        }
    }
    // End:0x2cd
    else
    {
        // End:0x27b
        if(TabIndex == 1)
        {
            LabelTitle.Caption = strLabelTitle[TabIndex];
            LabelSender.Caption = strLabelSender[TabIndex];
            LabelRecvDate.Caption = strLabelRecvDate[TabIndex];
            ButtonReply.SetVisibility(false);
            ButtonReceiveItem.SetVisibility(false);
        }
        // End:0x2cd
        else
        {
            LabelTitle.Caption = strLabelTitle[0];
            LabelSender.Caption = strLabelSender[0];
            LabelRecvDate.Caption = strLabelRecvDate[0];
            ButtonReply.SetVisibility(false);
        }
    }
}

defaultproperties
{
    fbLabelTitle=(X1=512.0,Y1=112.0,X2=1011.0,Y2=137.0)
    fbLabelSender=(X1=526.0,Y1=142.0,X2=597.0,Y2=167.0)
    fbLabelRecvDate=(X1=526.0,Y1=176.0,X2=597.0,Y2=201.0)
    fbEditSender=(X1=597.0,Y1=142.0,X2=1006.0,Y2=167.0)
    fbEditRecvDate=(X1=597.0,Y1=176.0,X2=1006.0,Y2=201.0)
    fbLabelContent[0]=(X1=517.0,Y1=210.0,X2=1007.0,Y2=659.0)
    fbLabelContent[1]=(X1=517.0,Y1=210.0,X2=1007.0,Y2=482.0)
    fbLabelContent[2]=(X1=517.0,Y1=210.0,X2=1007.0,Y2=600.0)
    fbContent[0]=(X1=518.0,Y1=218.0,X2=1006.0,Y2=655.0)
    fbContent[1]=(X1=518.0,Y1=218.0,X2=1006.0,Y2=479.0)
    fbContent[2]=(X1=518.0,Y1=218.0,X2=1006.0,Y2=596.0)
    fbButtonReply=(X1=814.0,Y1=697.0,X2=908.0,Y2=729.0)
    fbButtonDelete=(X1=912.0,Y1=697.0,X2=1006.0,Y2=729.0)
    fbButtonReceiveItem=(X1=716.0,Y1=697.0,X2=810.0,Y2=729.0)
    fbWeaponInfo=(X1=517.0,Y1=487.0,X2=1007.0,Y2=660.0)
    fbPointInfo=(X1=517.0,Y1=605.0,X2=1007.0,Y2=660.0)
    strLabelTitle[0]="Inbox"
    strLabelTitle[1]="Sent Mail"
    strLabelSender[0]="Sender"
    strLabelSender[1]="Recipient"
    strLabelRecvDate[0]="Date"
    strLabelRecvDate[1]="Date"
    strCash="Cash"
    strButtonReply="Reply"
    strButtonDelete="Delete"
    strButtonReceivePoint="Get Points"
    strButtonReceiveItem="Get Item"
    bBoundToParent=true
    bScaleToParent=true
}