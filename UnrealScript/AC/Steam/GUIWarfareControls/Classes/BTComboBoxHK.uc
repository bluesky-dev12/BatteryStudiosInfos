/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTComboBoxHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:13
 *	Functions:14
 *
 *******************************************************************************/
class BTComboBoxHK extends GUIPanel
    dependson(BTComboBoxButtonHK)
    dependson(BTScrollZoneHK)
    dependson(BTScrollButtonHK)
    dependson(BTGripButtonHK)
    editinlinenew
    instanced;

var Engine.BTCustomDrawHK.DrawType FontDrawType;
var Engine.BTCustomDrawHK.DrawType ExtraDataFontDrawType;
var int FontSize[5];
var Color FontColor[3];
var Color FontShadowColor;
var Color FontColorOfTitle;
var int FontPadding[4];
var bool bShowExtraData;
var Image combSelectImg;
var Image combBackImg;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTOwnerDrawImageHK Border;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIComboBox ComboBox;
var bool bHideBtn;

function string GetSelectExtra()
{
    return ComboBox.List.GetExtraAtIndex(ComboBox.Index);
}

function SetDefaultFontColor()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x32 [While If]
    if(i < 3)
    {
        FontColor[i].A = byte(255);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    FontShadowColor.R = 0;
    FontShadowColor.G = 0;
    FontShadowColor.B = 0;
    FontShadowColor.A = byte(255);
    FontColor[0].R = byte(255);
    FontColor[0].G = byte(255);
    FontColor[0].B = byte(255);
    FontColor[1].R = byte(255);
    FontColor[1].G = 192;
    FontColor[1].B = 0;
    FontColor[2].R = 90;
    FontColor[2].G = 90;
    FontColor[2].B = 90;
}

function SetFontSizeAll(int Size)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x2e [While If]
    if(i < 5)
    {
        FontSize[i] = Size;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function InitScrollBar()
{
    local Image zoneimg;
    local export editinline BTScrollButtonHK ibtn, dbtn;
    local export editinline BTGripButtonHK Grip;
    local export editinline BTScrollZoneHK Zone;
    local export editinline GUIVertScrollBar vsb;

    Zone = new class'BTScrollZoneHK';
    zoneimg = class'BTUIResourcePoolHK'.default.Scrol_New_BG;
    Zone.zoneImage = zoneimg;
    ComboBox.MyListBox.MyScrollBar.MyScrollZone = Zone;
    ibtn = new class'BTScrollButtonHK';
    ibtn.buttonImage[0] = class'BTUIResourcePoolHK'.default.scrol_new_up_n;
    ibtn.buttonImage[1] = class'BTUIResourcePoolHK'.default.scrol_new_up_on;
    ibtn.buttonImage[2] = class'BTUIResourcePoolHK'.default.scrol_new_up_n;
    ibtn.buttonImage[3] = class'BTUIResourcePoolHK'.default.scrol_new_up_cli;
    ibtn.buttonImage[4] = class'BTUIResourcePoolHK'.default.scrol_new_up_dis;
    ibtn.buttonImage[5] = class'BTUIResourcePoolHK'.default.scrol_new_up_on;
    ComboBox.MyListBox.MyScrollBar.MyDecreaseButton = ibtn;
    dbtn = new class'BTScrollButtonHK';
    dbtn.buttonImage[0] = class'BTUIResourcePoolHK'.default.scrol_new_dn_n;
    dbtn.buttonImage[1] = class'BTUIResourcePoolHK'.default.scrol_new_dn_on;
    dbtn.buttonImage[2] = class'BTUIResourcePoolHK'.default.scrol_new_dn_n;
    dbtn.buttonImage[3] = class'BTUIResourcePoolHK'.default.scrol_new_dn_cli;
    dbtn.buttonImage[4] = class'BTUIResourcePoolHK'.default.scrol_new_dn_dis;
    dbtn.buttonImage[5] = class'BTUIResourcePoolHK'.default.scrol_new_dn_on;
    ComboBox.MyListBox.MyScrollBar.MyIncreaseButton = dbtn;
    Grip = new class'BTGripButtonHK';
    Grip.buttonImage[0] = class'BTUIResourcePoolHK'.default.scrol_new_grip_n;
    Grip.buttonImage[1] = class'BTUIResourcePoolHK'.default.scrol_new_grip_on;
    Grip.buttonImage[2] = class'BTUIResourcePoolHK'.default.scrol_new_grip_n;
    Grip.buttonImage[3] = class'BTUIResourcePoolHK'.default.scrol_new_grip_cli;
    Grip.buttonImage[4] = class'BTUIResourcePoolHK'.default.scrol_new_grip_dis;
    ComboBox.MyListBox.MyScrollBar.MyGripButton = Grip;
    ComboBox.MyListBox.MyScrollBar.bScrollStyle = true;
    vsb = GUIVertScrollBar(ComboBox.MyListBox.MyScrollBar);
    Grip.__OnMousePressed__Delegate = vsb.GripPressed;
    Zone.__OnScrollZoneClick__Delegate = vsb.ZoneClick;
    ibtn.__OnClick__Delegate = vsb.DecreaseClick;
    dbtn.__OnClick__Delegate = vsb.IncreaseClick;
}

function InitComboBox()
{
    local export editinline BTComboBoxButtonHK btn;

    btn = new class'BTComboBoxButtonHK';
    btn.buttonImage[0] = class'BTUIResourcePoolHK'.default.Combo_New_Butt_n;
    btn.buttonImage[1] = class'BTUIResourcePoolHK'.default.Combo_New_Butt_on;
    btn.buttonImage[2] = class'BTUIResourcePoolHK'.default.Combo_New_Butt_on;
    btn.buttonImage[3] = class'BTUIResourcePoolHK'.default.Combo_New_Butt_cli;
    btn.buttonImage[4] = class'BTUIResourcePoolHK'.default.Combo_New_Butt_n;
    // End:0x12c
    if(bHideBtn)
    {
        btn.buttonImage[0].Image = none;
        btn.buttonImage[1].Image = none;
        btn.buttonImage[2].Image = none;
        btn.buttonImage[3].Image = none;
        btn.buttonImage[4].Image = none;
    }
    ComboBox.MyShowListBtn = btn;
}

function bool OnComboEditDraw(Canvas C)
{
    local int X, Y, X2, Y2;

    X = int(ComboBox.Edit.ActualLeft());
    Y = int(ComboBox.Edit.ActualTop());
    X2 = int(float(X) + ComboBox.Edit.ActualWidth());
    Y2 = int(float(Y) + ComboBox.Edit.ActualHeight());
    C.Style = 5;
    C.DrawColor = FontColorOfTitle;
    class'BTCustomDrawHK'.static.DrawEllipsisStringPaddingOffset(C, ComboBox.GetItem(ComboBox.GetIndex()), FontDrawType, float(FontSize[self.MenuState]), 0.90, float(X), float(Y), float(X2), float(Y2), FontPadding[0], FontPadding[1], FontPadding[2], FontPadding[3], FontShadowColor);
    // End:0x1db
    if(bShowExtraData)
    {
        class'BTCustomDrawHK'.static.DrawEllipsisStringPaddingOffset(C, ComboBox.List.GetExtraAtIndex(ComboBox.GetIndex()), ExtraDataFontDrawType, float(FontSize[self.MenuState]), 0.90, float(X), float(Y), float(X2), float(Y2), FontPadding[0], FontPadding[1], FontPadding[2], FontPadding[3], FontShadowColor);
    }
    return true;
}

function OnComboListDrawItem(Canvas C, int Item, float X, float Y, float W, float HT, bool bSelected, bool bPending)
{
    C.Style = 5;
    C.DrawColor = FontColor[0];
    class'BTCustomDrawHK'.static.DrawImage(C, combBackImg, X, Y, X + W, Y + HT);
    // End:0xbc
    if(bSelected)
    {
        class'BTCustomDrawHK'.static.DrawImage(C, combSelectImg, X, Y, X + W, Y + HT);
        C.DrawColor = FontColor[1];
    }
    class'BTCustomDrawHK'.static.DrawEllipsisStringPaddingOffset(C, ComboBox.GetItem(Item), FontDrawType, float(FontSize[self.MenuState]), 0.90, X, Y, X + W, Y + HT, FontPadding[0], FontPadding[1], FontPadding[2], FontPadding[3], FontShadowColor);
    // End:0x1e4
    if(bShowExtraData)
    {
        class'BTCustomDrawHK'.static.DrawEllipsisStringPaddingOffset(C, ComboBox.List.GetExtraAtIndex(Item), ExtraDataFontDrawType, float(FontSize[self.MenuState]), 0.90, X, Y, X + W, Y + HT, FontPadding[0], FontPadding[1], FontPadding[2], FontPadding[3], FontShadowColor);
    }
}

function DisableMe()
{
    super(GUIMultiComponent).DisableMe();
    FontColorOfTitle = FontColor[2];
}

function EnableMe()
{
    super(GUIMultiComponent).EnableMe();
    FontColorOfTitle = FontColor[0];
}

function float GetItemHeight(Canvas C)
{
    return AWinPos.Y2 - AWinPos.Y1;
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    InitScrollBar();
    InitComboBox();
    Border.BackgroundImage = class'BTUIResourcePoolHK'.default.Combo_New_Back;
    super.InitComponent(MyController, myOwner);
    combBackImg = class'BTUIResourcePoolHK'.default.Combo_New_Expand;
    combSelectImg = class'BTUIResourcePoolHK'.default.Combo_New_Expand_on;
    ComboBox.Edit.__OnDraw__Delegate = OnComboEditDraw;
    ComboBox.MyListBox.List.__GetItemHeight__Delegate = GetItemHeight;
    ComboBox.MyListBox.List.__OnDrawItem__Delegate = OnComboListDrawItem;
    Border.WinLeft = WinLeft;
    Border.WinTop = WinTop;
    Border.WinWidth = WinWidth;
    Border.WinHeight = WinHeight;
    ComboBox.WinLeft = Border.WinLeft;
    ComboBox.WinTop = Border.WinTop;
    ComboBox.WinWidth = Border.WinWidth;
    ComboBox.WinHeight = Border.WinHeight;
    bShowExtraData = false;
    SetDefaultFontColor();
    SetFontSizeAll(11);
}

function ApplyAWinPos()
{
    super(GUIComponent).ApplyAWinPos();
    Border.WinLeft = WinLeft;
    Border.WinTop = WinTop;
    Border.WinWidth = WinWidth;
    Border.WinHeight = WinHeight;
    ComboBox.WinLeft = Border.WinLeft;
    ComboBox.WinTop = Border.WinTop;
    ComboBox.WinWidth = Border.WinWidth;
    ComboBox.WinHeight = Border.WinHeight;
    ComboBox.Edit.bUseAWinPos = true;
    ComboBox.Edit.AWinPos.X1 = AWinPos.X1;
    ComboBox.Edit.AWinPos.Y1 = AWinPos.Y1;
    ComboBox.Edit.AWinPos.X2 = AWinPos.X2;
    ComboBox.Edit.AWinPos.Y2 = AWinPos.Y2;
    ComboBox.Edit.ApplyAWinPos();
    ComboBox.MyShowListBtn.bUseAWinPos = true;
    ComboBox.MyShowListBtn.AWinPos.X1 = AWinPos.X2;
    ComboBox.MyShowListBtn.AWinPos.Y1 = AWinPos.Y1;
    ComboBox.MyShowListBtn.AWinPos.X2 = AWinPos.X2;
    ComboBox.MyShowListBtn.AWinPos.Y2 = AWinPos.Y2;
    ComboBox.MyShowListBtn.ApplyAWinPos();
}

function bool InternalDraw(Canvas C)
{
    return false;
}

function InternalOnChange(GUIComponent Sender)
{
    OnChange(self);
}

defaultproperties
{
    FontDrawType=4
    ExtraDataFontDrawType=5
    FontSize=11
    FontColor[0]=(R=255,G=255,B=255,A=255)
    FontColor[1]=(R=255,G=255,B=255,A=255)
    FontColor[2]=(R=255,G=255,B=255,A=255)
    FontColorOfTitle=(R=255,G=255,B=255,A=255)
    FontPadding=5
    begin object name=mBorder class=BTOwnerDrawImageHK
        OnRendered=Internal_OnRendered
    object end
    // Reference: BTOwnerDrawImageHK'BTComboBoxHK.mBorder'
    Border=mBorder
    begin object name=mComboBox class=GUIComboBox
        bReadOnly=true
        WinWidth=0.0
        WinHeight=0.0
        OnChange=InternalOnChange
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIComboBox'BTComboBoxHK.mComboBox'
    ComboBox=mComboBox
    SetControlsBoundToParent=true
    SetControlsScaleToParent=true
    WinWidth=0.0
    WinHeight=0.0
    bBoundToParent=true
    bScaleToParent=true
    OnDraw=InternalDraw
}