class BTComboBoxHK extends GUIPanel
    editinlinenew
    instanced;

var BTCustomDrawHK.DrawType FontDrawType;
var BTCustomDrawHK.DrawType ExtraDataFontDrawType;
var int FontSize[5];
var Color FontColor[5];
var Color FontShadowColor[5];
var int FontPadding[4];
var bool bShowExtraData;
var Image combSelectImg;
var Image combBackImg;
var() automated BTOwnerDrawImageHK Border;
var() automated GUIComboBox ComboBox;

function string GetSelectExtra()
{
    return ComboBox.List.GetExtraAtIndex(ComboBox.Index);
    //return;    
}

function SetDefaultFontColor()
{
    local int i;

    i = 0;
    J0x07:

    // End:0xBF [Loop If]
    if(i < 4)
    {
        FontColor[i].R = byte(255);
        FontColor[i].G = byte(255);
        FontColor[i].B = byte(255);
        FontColor[i].A = byte(255);
        FontShadowColor[i].R = 0;
        FontShadowColor[i].G = 0;
        FontShadowColor[i].B = 0;
        FontShadowColor[i].A = byte(255);
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    FontColor[4].R = 90;
    FontColor[i].G = 90;
    FontColor[i].B = 90;
    FontColor[i].A = byte(255);
    FontShadowColor[4].R = 0;
    FontShadowColor[i].G = 0;
    FontShadowColor[i].B = 0;
    FontShadowColor[i].A = byte(255);
    //return;    
}

function SetFontSizeAll(int Size)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x2E [Loop If]
    if(i < 5)
    {
        FontSize[i] = Size;
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function InitScrollBar()
{
    local Image img, zoneimg;
    local export editinline BTScrollButtonHK ibtn, dbtn;
    local export editinline BTGripButtonHK Grip;
    local export editinline BTScrollZoneHK Zone;
    local export editinline GUIVertScrollBar vsb;

    Zone = new Class'GUIWarfareControls_Decompressed.BTScrollZoneHK';
    zoneimg.Width = 8.0000000;
    zoneimg.Height = 8.0000000;
    zoneimg.Image = Texture'Warfare_TH_UI_UI.Common.scrol_back';
    zoneimg.DrawType = 15;
    zoneimg.DrawColor = self.WhiteColor;
    Zone.zoneImage = zoneimg;
    ComboBox.MyListBox.MyScrollBar.MyScrollZone = Zone;
    ibtn = new Class'GUIWarfareControls_Decompressed.BTScrollButtonHK';
    img.Width = 12.0000000;
    img.Height = 12.0000000;
    img.Image = Texture'Warfare_TH_UI_UI.Common.scrol_up_n';
    img.DrawType = 28;
    img.DrawColor = self.WhiteColor;
    ibtn.buttonImage[0] = img;
    ibtn.buttonImage[3] = img;
    ibtn.buttonImage[4] = img;
    img.Image = Texture'Warfare_TH_UI_UI.Common.scrol_up_on';
    ibtn.buttonImage[1] = img;
    ibtn.buttonImage[2] = img;
    ibtn.buttonImage[5] = zoneimg;
    ComboBox.MyListBox.MyScrollBar.MyDecreaseButton = ibtn;
    dbtn = new Class'GUIWarfareControls_Decompressed.BTScrollButtonHK';
    img.Width = 12.0000000;
    img.Height = 12.0000000;
    img.Image = Texture'Warfare_TH_UI_UI.Common.scrol_dn_n';
    img.DrawType = 28;
    img.DrawColor = self.WhiteColor;
    dbtn.buttonImage[0] = img;
    dbtn.buttonImage[3] = img;
    dbtn.buttonImage[4] = img;
    img.Image = Texture'Warfare_TH_UI_UI.Common.scrol_dn_on';
    dbtn.buttonImage[1] = img;
    dbtn.buttonImage[2] = img;
    dbtn.buttonImage[5] = zoneimg;
    ComboBox.MyListBox.MyScrollBar.MyIncreaseButton = dbtn;
    Grip = new Class'GUIWarfareControls_Decompressed.BTGripButtonHK';
    img.Width = 14.0000000;
    img.Height = 16.0000000;
    img.Image = Texture'Warfare_TH_UI_UI.Common.scrol_grip_n';
    img.DrawType = 15;
    img.DrawColor = self.WhiteColor;
    Grip.buttonImage[0] = img;
    Grip.buttonImage[3] = img;
    Grip.buttonImage[4] = img;
    img.Image = Texture'Warfare_TH_UI_UI.Common.scrol_grip_on';
    Grip.buttonImage[1] = img;
    Grip.buttonImage[2] = img;
    ComboBox.MyListBox.MyScrollBar.MyGripButton = Grip;
    vsb = GUIVertScrollBar(ComboBox.MyListBox.MyScrollBar);
    Grip.__OnMousePressed__Delegate = vsb.GripPressed;
    Zone.__OnScrollZoneClick__Delegate = vsb.ZoneClick;
    ibtn.__OnClick__Delegate = vsb.DecreaseClick;
    dbtn.__OnClick__Delegate = vsb.IncreaseClick;
    //return;    
}

function InitComboBox()
{
    local export editinline BTComboBoxButtonHK btn;

    btn = new Class'GUIWarfareControls_Decompressed.BTComboBoxButtonHK';
    btn.buttonImage[0] = Class'Engine.BTCustomDrawHK'.static.MakeImage(26, 26, 28, Texture'Warfare_TH_UI_UI.Common.comb_buutt_n');
    btn.buttonImage[1] = Class'Engine.BTCustomDrawHK'.static.MakeImage(26, 26, 28, Texture'Warfare_TH_UI_UI.Common.comb_buutt_on');
    btn.buttonImage[2] = Class'Engine.BTCustomDrawHK'.static.MakeImage(26, 26, 28, Texture'Warfare_TH_UI_UI.Common.comb_buutt_on');
    btn.buttonImage[3] = Class'Engine.BTCustomDrawHK'.static.MakeImage(26, 26, 28, Texture'Warfare_TH_UI_UI.Common.comb_buutt_cli');
    btn.buttonImage[4] = Class'Engine.BTCustomDrawHK'.static.MakeImage(26, 26, 28, Texture'Warfare_TH_UI_UI.Common.comb_buutt_n');
    ComboBox.MyShowListBtn = btn;
    //return;    
}

function bool OnComboEditDraw(Canvas C)
{
    local int X, Y, X2, Y2;

    X = int(ComboBox.Edit.ActualLeft());
    Y = int(ComboBox.Edit.ActualTop());
    X2 = int(float(X) + ComboBox.Edit.ActualWidth());
    Y2 = int(float(Y) + ComboBox.Edit.ActualHeight());
    C.Style = 5;
    C.DrawColor = FontColor[int(self.MenuState)];
    Class'Engine.BTCustomDrawHK'.static.DrawEllipsisStringPaddingOffset(C, ComboBox.GetItem(ComboBox.GetIndex()), FontDrawType, float(FontSize[int(self.MenuState)]), 0.9000000, float(X), float(Y), float(X2), float(Y2), FontPadding[0], FontPadding[1], FontPadding[2], FontPadding[3], FontShadowColor[int(self.MenuState)]);
    // End:0x202
    if(bShowExtraData)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawEllipsisStringPaddingOffset(C, ComboBox.List.GetExtraAtIndex(ComboBox.GetIndex()), ExtraDataFontDrawType, float(FontSize[int(self.MenuState)]), 0.9000000, float(X), float(Y), float(X2), float(Y2), FontPadding[0], FontPadding[1], FontPadding[2], FontPadding[3], FontShadowColor[int(self.MenuState)]);
    }
    return true;
    //return;    
}

function OnComboListDrawItem(Canvas C, int Item, float X, float Y, float W, float HT, bool bSelected, bool bPending)
{
    C.Style = 5;
    C.DrawColor = FontColor[int(self.MenuState)];
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, combBackImg, X, Y, X + W, Y + HT);
    // End:0xB1
    if(bSelected)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, combSelectImg, X, Y, X + W, Y + HT);
    }
    Class'Engine.BTCustomDrawHK'.static.DrawEllipsisStringPaddingOffset(C, ComboBox.GetItem(Item), FontDrawType, float(FontSize[int(self.MenuState)]), 0.9000000, X, Y, X + W, Y + HT, FontPadding[0], FontPadding[1], FontPadding[2], FontPadding[3], FontShadowColor[int(self.MenuState)]);
    // End:0x1F3
    if(bShowExtraData)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawEllipsisStringPaddingOffset(C, ComboBox.List.GetExtraAtIndex(Item), ExtraDataFontDrawType, float(FontSize[int(self.MenuState)]), 0.9000000, X, Y, X + W, Y + HT, FontPadding[0], FontPadding[1], FontPadding[2], FontPadding[3], FontShadowColor[int(self.MenuState)]);
    }
    //return;    
}

function float GetItemHeight(Canvas C)
{
    return AWinPos.Y2 - AWinPos.Y1;
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    InitScrollBar();
    InitComboBox();
    Border.BackgroundImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(16, 16, 15, Texture'Warfare_TH_UI_UI.Common.panel_4');
    super.InitComponent(MyController, myOwner);
    combBackImg = Class'Engine.BTCustomDrawHK'.static.MakeImage(16, 16, 15, Texture'Warfare_TH_UI_UI.Common.comb_back');
    combSelectImg = Class'Engine.BTCustomDrawHK'.static.MakeImage(8, 8, 15, Texture'Warfare_TH_UI_UI.Common.comb_expand_on');
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
    SetFontSizeAll(10);
    //return;    
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
    ComboBox.Edit.AWinPos.X2 = AWinPos.X2 - float(26);
    ComboBox.Edit.AWinPos.Y2 = AWinPos.Y2;
    ComboBox.Edit.ApplyAWinPos();
    ComboBox.MyShowListBtn.bUseAWinPos = true;
    ComboBox.MyShowListBtn.AWinPos.X1 = AWinPos.X2 - float(26);
    ComboBox.MyShowListBtn.AWinPos.Y1 = AWinPos.Y1;
    ComboBox.MyShowListBtn.AWinPos.X2 = AWinPos.X2;
    ComboBox.MyShowListBtn.AWinPos.Y2 = AWinPos.Y2;
    ComboBox.MyShowListBtn.ApplyAWinPos();
    //return;    
}

function bool InternalDraw(Canvas C)
{
    return false;
    //return;    
}

function InternalOnChange(GUIComponent Sender)
{
    OnChange(self);
    //return;    
}

defaultproperties
{
    FontDrawType=3
    ExtraDataFontDrawType=5
    FontSize=10
    FontColor=(R=255,G=255,B=255,A=255)
    FontPadding[0]=5
    FontPadding[2]=5
    // Reference: BTOwnerDrawImageHK'GUIWarfareControls_Decompressed.BTComboBoxHK.mBorder'
    begin object name="mBorder" class=GUIWarfareControls_Decompressed.BTOwnerDrawImageHK
        OnRendered=mBorder.Internal_OnRendered
    end object
    Border=mBorder
    // Reference: GUIComboBox'GUIWarfareControls_Decompressed.BTComboBoxHK.mComboBox'
    begin object name="mComboBox" class=XInterface.GUIComboBox
        bReadOnly=true
        WinWidth=0.0000000
        WinHeight=0.0000000
        OnChange=BTComboBoxHK.InternalOnChange
        OnKeyEvent=mComboBox.InternalOnKeyEvent
    end object
    ComboBox=mComboBox
    SetControlsBoundToParent=false
    SetControlsScaleToParent=false
    WinWidth=0.0000000
    WinHeight=0.0000000
    bBoundToParent=true
    bScaleToParent=true
    OnDraw=BTComboBoxHK.InternalDraw
}