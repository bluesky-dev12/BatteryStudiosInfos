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
var() automated FloatBox fbLabelTitle;
var() automated FloatBox fbLabelSender;
var() automated FloatBox fbLabelRecvDate;
var() automated FloatBox fbEditSender;
var() automated FloatBox fbEditRecvDate;
var() automated FloatBox fbLabelContent[3];
var() automated FloatBox fbContent[3];
var() automated FloatBox fbButtonReply;
var() automated FloatBox fbButtonDelete;
var() automated FloatBox fbButtonReceiveItem;
var() automated FloatBox fbWeaponInfo;
var() automated FloatBox fbPointInfo;
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
    LabelTitle = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    LabelTitle.BackgroundImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(512, 8, 28, Texture'Warfare_TH_UI_UI.Common.img_ptitl_back');
    LabelTitle.bUseAWinPos = true;
    LabelTitle.Caption = strLabelTitle[0];
    LabelTitle.SetFontSizeAll(11);
    LabelTitle.CaptionPadding[0] = 8;
    LabelTitle.SetFontDrawType(3);
    LabelTitle.AWinPos = fbLabelTitle;
    LabelTitle.InitComponent(Controller, self);
    AppendComponent(LabelTitle);
    LabelSender = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    LabelSender.bUseAWinPos = true;
    LabelSender.Caption = strLabelSender[0];
    LabelSender.SetFontDrawType(3);
    LabelSender.AWinPos = fbLabelSender;
    LabelSender.InitComponent(Controller, self);
    AppendComponent(LabelSender);
    LabelRecvDate = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    LabelRecvDate.bUseAWinPos = true;
    LabelRecvDate.Caption = strLabelRecvDate[0];
    LabelRecvDate.SetFontDrawType(3);
    LabelRecvDate.AWinPos = fbLabelRecvDate;
    LabelRecvDate.InitComponent(Controller, self);
    AppendComponent(LabelRecvDate);
    EditSender = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    EditSender.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_5;
    EditSender.bUseAWinPos = true;
    EditSender.AWinPos = fbEditSender;
    EditSender.SetFontDrawType(0);
    EditSender.InitComponent(Controller, self);
    AppendComponent(EditSender);
    EditSender.CaptionPadding[0] = 7;
    EditSender.CaptionPadding[1] = 3;
    EditRecvDate = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    EditRecvDate.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_5;
    EditRecvDate.bUseAWinPos = true;
    EditRecvDate.AWinPos = fbEditRecvDate;
    EditRecvDate.SetFontDrawType(0);
    EditRecvDate.InitComponent(Controller, self);
    AppendComponent(EditRecvDate);
    EditRecvDate.CaptionPadding[0] = 7;
    EditRecvDate.CaptionPadding[1] = 3;
    LabelContent = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    LabelContent.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_5;
    LabelContent.bUseAWinPos = true;
    LabelContent.AWinPos = fbLabelContent[0];
    LabelContent.InitComponent(Controller, self);
    AppendComponent(LabelContent);
    Content = new Class'GUIWarfareControls_Decompressed.BTAutoScrollListHK';
    Content.bUseAWinPos = true;
    Content.AWinPos = fbContent[0];
    Content.AWinPos.X2 -= float(14);
    Content.InitComponent(Controller, self);
    AppendComponent(Content);
    Content.MultiColumnList.MyScrollBar.bUseAWinPos = true;
    Content.MultiColumnList.MyScrollBar.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 0.0000000, 0.0000000, 0.0000000);
    Content.SelectImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty;
    ButtonReply = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
    ButtonReply.bUseAWinPos = true;
    ButtonReply.AWinPos = fbButtonReply;
    ButtonReply.Caption = strButtonReply;
    ButtonReply.SetDefaultButtonImage();
    ButtonReply.SetFontSizeAll(11);
    ButtonReply.InitComponent(Controller, self);
    AppendComponent(ButtonReply);
    ButtonDelete = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
    ButtonDelete.bUseAWinPos = true;
    ButtonDelete.AWinPos = fbButtonDelete;
    ButtonDelete.Caption = strButtonDelete;
    ButtonDelete.SetDefaultButtonImage();
    ButtonDelete.SetFontSizeAll(11);
    ButtonDelete.InitComponent(Controller, self);
    AppendComponent(ButtonDelete);
    ButtonReceiveItem = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
    ButtonReceiveItem.bUseAWinPos = true;
    ButtonReceiveItem.AWinPos = fbButtonReceiveItem;
    ButtonReceiveItem.Caption = strButtonReceiveItem;
    ButtonReceiveItem.SetDefaultButtonImage();
    ButtonReceiveItem.SetFontSizeAll(11);
    ButtonReceiveItem.InitComponent(Controller, self);
    AppendComponent(ButtonReceiveItem);
    WeaponInfo = new Class'GUIWarfareControls_Decompressed.BTItemInfoHorzBoxHK';
    WeaponInfo.bUseAWinPos = true;
    WeaponInfo.AWinPos = fbWeaponInfo;
    WeaponInfo.InitComponent(Controller, self);
    WeaponInfo.ItemStateView.bUseAWinPos = true;
    fb.X1 = WeaponInfo.AWinPos.X1 + float(318);
    fb.Y1 = WeaponInfo.AWinPos.Y1 + float(3);
    fb.Y2 = WeaponInfo.AWinPos.Y1 + float(98);
    fb.X2 = (WeaponInfo.AWinPos.X1 + float(318)) + float(242);
    WeaponInfo.ItemStateView.AWinPos = fb;
    WeaponInfo.ItemStateView.ApplyAWinPos();
    AppendComponent(WeaponInfo);
    PointInfo = new Class'GUIWarfareControls_Decompressed.BTPointBoxHK';
    PointInfo.bUseAWinPos = true;
    PointInfo.AWinPos = fbPointInfo;
    PointInfo.InitComponent(Controller, self);
    AppendComponent(PointInfo);
    ChangeMailType(0);
    //return;    
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
        WeaponInfo.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 0.0000000, 0.0000000, 0.0000000);
        WeaponInfo.ApplyAWinPos();
        WeaponInfo.SetVisibility(false);
        PointInfo.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 0.0000000, 0.0000000, 0.0000000);
        PointInfo.ApplyAWinPos();
        PointInfo.SetVisibility(false);
        ButtonReceiveItem.SetVisibility(false);        
    }
    else
    {
        // End:0x39C
        if(MailType == 1)
        {
            WeaponInfo.AWinPos = fbWeaponInfo;
            WeaponInfo.ApplyAWinPos();
            WeaponInfo.SetVisibility(true);
            PointInfo.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 0.0000000, 0.0000000, 0.0000000);
            PointInfo.ApplyAWinPos();
            PointInfo.SetVisibility(false);
            ItemInfo = GameMgr.FindUIItem(ItemID);
            instanceInfo = new Class'Engine.wItemBoxInstanceHK';
            // End:0x288
            if((ItemInfo.CostType == 1) || ItemInfo.CostType == 4)
            {
                instanceInfo.LeftTime.Day = StackCount / 24;
                instanceInfo.LeftTime.Hour = int(float(StackCount) % float(24));                
            }
            else
            {
                // End:0x2DE
                if((ItemInfo.CostType == 0) || ItemInfo.CostType == 2)
                {
                    instanceInfo.PartID = StackCount;
                    instanceInfo.Durability = 100000;                    
                }
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
            WeaponInfo.ItemBoxView.itemBox.colCurrentUntilTime = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultWhite();
            WeaponInfo.ItemBoxView.itemBox.ChangeState(10);
            ButtonReceiveItem.SetVisibility(true);
            ButtonReceiveItem.Caption = strButtonReceiveItem;            
        }
        else
        {
            // End:0x467
            if(MailType == 2)
            {
                WeaponInfo.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 0.0000000, 0.0000000, 0.0000000);
                WeaponInfo.ApplyAWinPos();
                WeaponInfo.SetVisibility(false);
                PointInfo.AWinPos = fbPointInfo;
                PointInfo.ApplyAWinPos();
                PointInfo.SetVisibility(true);
                PointInfo.SetData(ItemUID);
                ButtonReceiveItem.SetVisibility(true);
                ButtonReceiveItem.Caption = strButtonReceivePoint;                
            }
            else
            {
                // End:0x608
                if(MailType == 7)
                {
                    WeaponInfo.AWinPos = fbWeaponInfo;
                    WeaponInfo.ApplyAWinPos();
                    WeaponInfo.SetVisibility(true);
                    PointInfo.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 0.0000000, 0.0000000, 0.0000000);
                    PointInfo.ApplyAWinPos();
                    PointInfo.SetVisibility(false);
                    ItemInfo = new Class'Engine.wItemBoxHK';
                    WeaponInfo.SetData(ItemInfo, none, none, none);
                    WeaponInfo.ItemStateView.SetVisibility(false);
                    WeaponInfo.EditItemDescription.SetText("");
                    WeaponInfo.ItemBoxView.itemBox.ItemImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.item_item_cash;
                    WeaponInfo.ItemBoxView.itemBox.ItemName = Class'Engine.BTCustomDrawHK'.static.MakeText(12, 0, string(ItemID) @ strCash);
                    WeaponInfo.ItemBoxView.itemBox.ChangeState(10);
                    ButtonReceiveItem.SetVisibility(true);
                    ButtonReceiveItem.Caption = strButtonReceiveItem;
                }
            }
        }
    }
    //return;    
}

function Clear()
{
    EditSender.Caption = "";
    EditRecvDate.Caption = "";
    Content.Clear();
    //return;    
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

    // End:0xC2 [Loop If]
    if(i < tarray.Length)
    {
        Content.AddRow(C, tarray[i]);
        i++;
        // [Loop Continue]
        goto J0x89;
    }
    tarray.Length = 0;
    Split(ExtraText, Chr(13), tarray);
    i = 0;
    J0xE1:

    // End:0x11A [Loop If]
    if(i < tarray.Length)
    {
        Content.AddRow(C, tarray[i]);
        i++;
        // [Loop Continue]
        goto J0xE1;
    }
    switch(ItemType)
    {
        // End:0x140
        case 2:
            ChangeMailType(1, ItemID, EmptyBtrDouble(), StackCount);
            // End:0x17D
            break;
        // End:0x15B
        case 4:
            ChangeMailType(2, 0, ItemUID, StackCount);
            // End:0x17D
            break;
        // End:0x170
        case 7:
            ChangeMailType(7, ItemID);
            // End:0x17D
            break;
        // End:0xFFFF
        default:
            ChangeMailType(0);
            // End:0x17D
            break;
            break;
    }
    // End:0x1FF
    if(TabIndex == 0)
    {
        LabelTitle.Caption = strLabelTitle[TabIndex];
        LabelSender.Caption = strLabelSender[TabIndex];
        LabelRecvDate.Caption = strLabelRecvDate[TabIndex];
        // End:0x1FC
        if(int(MM.GMLevelFlag) == 0)
        {
            ButtonReply.SetVisibility(false);
        }        
    }
    else
    {
        // End:0x27B
        if(TabIndex == 1)
        {
            LabelTitle.Caption = strLabelTitle[TabIndex];
            LabelSender.Caption = strLabelSender[TabIndex];
            LabelRecvDate.Caption = strLabelRecvDate[TabIndex];
            ButtonReply.SetVisibility(false);
            ButtonReceiveItem.SetVisibility(false);            
        }
        else
        {
            LabelTitle.Caption = strLabelTitle[0];
            LabelSender.Caption = strLabelSender[0];
            LabelRecvDate.Caption = strLabelRecvDate[0];
            ButtonReply.SetVisibility(false);
        }
    }
    //return;    
}

defaultproperties
{
    fbLabelTitle=(X1=512.0000000,Y1=112.0000000,X2=1011.0000000,Y2=137.0000000)
    fbLabelSender=(X1=526.0000000,Y1=142.0000000,X2=597.0000000,Y2=167.0000000)
    fbLabelRecvDate=(X1=526.0000000,Y1=176.0000000,X2=597.0000000,Y2=201.0000000)
    fbEditSender=(X1=597.0000000,Y1=142.0000000,X2=1006.0000000,Y2=167.0000000)
    fbEditRecvDate=(X1=597.0000000,Y1=176.0000000,X2=1006.0000000,Y2=201.0000000)
    fbLabelContent[0]=(X1=517.0000000,Y1=210.0000000,X2=1007.0000000,Y2=659.0000000)
    fbLabelContent[1]=(X1=517.0000000,Y1=210.0000000,X2=1007.0000000,Y2=482.0000000)
    fbLabelContent[2]=(X1=517.0000000,Y1=210.0000000,X2=1007.0000000,Y2=600.0000000)
    fbContent[0]=(X1=518.0000000,Y1=218.0000000,X2=1006.0000000,Y2=655.0000000)
    fbContent[1]=(X1=518.0000000,Y1=218.0000000,X2=1006.0000000,Y2=479.0000000)
    fbContent[2]=(X1=518.0000000,Y1=218.0000000,X2=1006.0000000,Y2=596.0000000)
    fbButtonReply=(X1=814.0000000,Y1=697.0000000,X2=908.0000000,Y2=729.0000000)
    fbButtonDelete=(X1=912.0000000,Y1=697.0000000,X2=1006.0000000,Y2=729.0000000)
    fbButtonReceiveItem=(X1=716.0000000,Y1=697.0000000,X2=810.0000000,Y2=729.0000000)
    fbWeaponInfo=(X1=517.0000000,Y1=487.0000000,X2=1007.0000000,Y2=660.0000000)
    fbPointInfo=(X1=517.0000000,Y1=605.0000000,X2=1007.0000000,Y2=660.0000000)
    strLabelTitle[0]="???????????????"
    strLabelTitle[1]="????????????????"
    strLabelSender[0]="??????"
    strLabelSender[1]="??????"
    strLabelRecvDate[0]="????????????"
    strLabelRecvDate[1]="?????????"
    strCash="DE"
    strButtonReply="???"
    strButtonDelete="??????"
    strButtonReceivePoint="???BP"
    strButtonReceiveItem="?????????"
    bBoundToParent=true
    bScaleToParent=true
}