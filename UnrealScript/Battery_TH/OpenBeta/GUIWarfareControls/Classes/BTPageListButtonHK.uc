class BTPageListButtonHK extends GUITabPanel
    editinlinenew
    instanced;

struct PageBox
{
    var int BeginIndex;
    var int EndIndex;
    var int MaxIndex;
    var int ListPerPageCount;
    var int CurrentIndex;
};

var Color RedColor;
var int ButtonCount;
var export editinline BTOwnerDrawImageHK BackgroundImage;
var export editinline BTOwnerDrawCaptionButtonHK ButtonIndex[10];
var export editinline BTOwnerDrawImageHK SeparatorIndex[10];
var export editinline BTIconButtonHK ButtonFirst;
var export editinline BTIconButtonHK ButtonPrev;
var export editinline BTIconButtonHK ButtonNext;
var localized string strButtonFirst;
var localized string strButtonPrev;
var localized string strButtonNext;
var PageBox PageInfo;
//var delegate<ButtonIndex_OnClick> __ButtonIndex_OnClick__Delegate;

function SetData(int MaxPage, int ListPerPageCount, int CurrentPage)
{
    PageInfo.MaxIndex = MaxPage;
    PageInfo.ListPerPageCount = ListPerPageCount;
    PageInfo.CurrentIndex = CurrentPage;
    SetCurrentIndex(PageInfo.CurrentIndex);
    //return;    
}

function SetCurrentIndex(int CurrentPage)
{
    local float W, HT, buttonW;

    PageInfo.CurrentIndex = CurrentPage;
    PageInfo.BeginIndex = (((CurrentPage - 1) / PageInfo.ListPerPageCount) * PageInfo.ListPerPageCount) + 1;
    PageInfo.EndIndex = (PageInfo.BeginIndex + PageInfo.ListPerPageCount) - 1;
    // End:0x90
    if(PageInfo.EndIndex >= PageInfo.MaxIndex)
    {
        PageInfo.EndIndex = PageInfo.MaxIndex;
    }
    W = AWinPos.X2 - AWinPos.X1;
    HT = AWinPos.Y2 - AWinPos.Y1;
    ButtonCount = (PageInfo.EndIndex - PageInfo.BeginIndex) + 1;
    buttonW = ((51.0000000 + float(51)) + float(27 * ButtonCount)) + float(51);
    buttonW = AWinPos.X1 + ((W - buttonW) / float(2));
    ChangeButtonPosition(int(buttonW));
    //return;    
}

function ChangeButtonPosition(int StartX)
{
    local int i;

    ButtonFirst.AWinPos.X1 = float(StartX);
    ButtonFirst.AWinPos.Y1 = AWinPos.Y1;
    StartX += 51;
    ButtonFirst.AWinPos.X2 = float(StartX);
    ButtonFirst.AWinPos.Y2 = AWinPos.Y2;
    ButtonFirst.ApplyAWinPos();
    ButtonPrev.AWinPos.X1 = float(StartX);
    ButtonPrev.AWinPos.Y1 = AWinPos.Y1;
    StartX += 51;
    ButtonPrev.AWinPos.X2 = float(StartX);
    ButtonPrev.AWinPos.Y2 = AWinPos.Y2;
    ButtonPrev.ApplyAWinPos();
    i = 0;
    J0x11B:

    // End:0x15D [Loop If]
    if(i < 10)
    {
        SeparatorIndex[i].SetVisibility(false);
        ButtonIndex[i].SetVisibility(false);
        i++;
        // [Loop Continue]
        goto J0x11B;
    }
    i = 0;
    J0x164:

    // End:0x3E0 [Loop If]
    if(i < ButtonCount)
    {
        ButtonIndex[i].ButtonID = PageInfo.BeginIndex + i;
        ButtonIndex[i].SetDefaultFontColor();
        // End:0x1EE
        if(ButtonIndex[i].ButtonID == PageInfo.CurrentIndex)
        {
            ButtonIndex[i].SetFontColorAll(RedColor);            
        }
        else
        {
            ButtonIndex[i].SetFontColorAll(WhiteColor);
        }
        ButtonIndex[i].SetVisibility(true);
        ButtonIndex[i].AWinPos.X1 = float(StartX);
        ButtonIndex[i].AWinPos.Y1 = AWinPos.Y1;
        StartX += 27;
        ButtonIndex[i].AWinPos.X2 = float(StartX);
        ButtonIndex[i].AWinPos.Y2 = AWinPos.Y2;
        ButtonIndex[i].ApplyAWinPos();
        ButtonIndex[i].Caption = string(PageInfo.BeginIndex + i);
        // End:0x3C0
        if((i + 1) < ButtonCount)
        {
            SeparatorIndex[i].SetVisibility(true);
            SeparatorIndex[i].AWinPos.X1 = float(StartX - 2);
            SeparatorIndex[i].AWinPos.Y1 = AWinPos.Y1;
            SeparatorIndex[i].AWinPos.X2 = float(StartX + 2);
            SeparatorIndex[i].AWinPos.Y2 = AWinPos.Y2;
            SeparatorIndex[i].ApplyAWinPos();
            // [Explicit Continue]
            goto J0x3D6;
        }
        SeparatorIndex[i].SetVisibility(false);
        J0x3D6:

        i++;
        // [Loop Continue]
        goto J0x164;
    }
    ButtonNext.AWinPos.X1 = float(StartX);
    ButtonNext.AWinPos.Y1 = AWinPos.Y1;
    StartX += 51;
    ButtonNext.AWinPos.X2 = float(StartX);
    ButtonNext.AWinPos.Y2 = AWinPos.Y2;
    ButtonNext.ApplyAWinPos();
    //return;    
}

delegate ButtonIndex_OnClick(int pageIndex)
{
    //return;    
}

function bool Internal_ButtonIndex_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    ButtonIndex_OnClick(btn.ButtonID);
    return true;
    //return;    
}

function bool ButtonFirst_OnClick(GUIComponent Sender)
{
    SetCurrentIndex(1);
    ButtonIndex_OnClick(PageInfo.CurrentIndex);
    return true;
    //return;    
}

function bool ButtonNext_OnClick(GUIComponent Sender)
{
    // End:0x43
    if((PageInfo.CurrentIndex + 1) <= PageInfo.MaxIndex)
    {
        SetCurrentIndex(PageInfo.CurrentIndex + 1);
        ButtonIndex_OnClick(PageInfo.CurrentIndex);
    }
    return true;
    //return;    
}

function bool ButtonPrev_OnClick(GUIComponent Sender)
{
    // End:0x3A
    if((PageInfo.CurrentIndex - 1) >= 1)
    {
        SetCurrentIndex(PageInfo.CurrentIndex - 1);
        ButtonIndex_OnClick(PageInfo.CurrentIndex);
    }
    return true;
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    RedColor = Class'Engine.Canvas'.static.MakeColor(byte(255), 0, 0, byte(255));
    super(GUIPanel).InitComponent(MyController, myOwner);
    BackgroundImage = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    BackgroundImage.bUseAWinPos = true;
    BackgroundImage.AWinPos = AWinPos;
    BackgroundImage.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_lobby_n;
    BackgroundImage.InitComponent(MyController, self);
    AppendComponent(BackgroundImage);
    ButtonFirst = new Class'GUIWarfareControls_Decompressed.BTIconButtonHK';
    ButtonFirst.bUseAWinPos = true;
    ButtonFirst.SetFontSizeAll(10);
    ButtonFirst.SetDefaultPageListButtonColor();
    ButtonFirst.InitComponent(MyController, self);
    AppendComponent(ButtonFirst);
    ButtonFirst.SetData(Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_fir_aro, 0, strButtonFirst, 3);
    ButtonFirst.__OnClick__Delegate = ButtonFirst_OnClick;
    ButtonPrev = new Class'GUIWarfareControls_Decompressed.BTIconButtonHK';
    ButtonPrev.bUseAWinPos = true;
    ButtonPrev.SetFontSizeAll(10);
    ButtonPrev.SetDefaultPageListButtonColor();
    ButtonPrev.InitComponent(MyController, self);
    AppendComponent(ButtonPrev);
    ButtonPrev.SetData(Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_bak_aro, 0, strButtonPrev, 3);
    ButtonPrev.__OnClick__Delegate = ButtonPrev_OnClick;
    ButtonNext = new Class'GUIWarfareControls_Decompressed.BTIconButtonHK';
    ButtonNext.bUseAWinPos = true;
    ButtonNext.SetFontSizeAll(10);
    ButtonNext.SetDefaultPageListButtonColor();
    ButtonNext.InitComponent(MyController, self);
    AppendComponent(ButtonNext);
    ButtonNext.SetData(Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_nex_aro, 1, strButtonNext, 3);
    ButtonNext.__OnClick__Delegate = ButtonNext_OnClick;
    i = 0;
    J0x277:

    // End:0x506 [Loop If]
    if(i < 10)
    {
        ButtonIndex[i] = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
        ButtonIndex[i].bUseAWinPos = true;
        ButtonIndex[i].SetFontSizeAll(9);
        ButtonIndex[i].FontColor[0] = Class'Engine.Canvas'.static.MakeColor(byte(255), byte(255), byte(255), 0);
        ButtonIndex[i].FontColor[1] = Class'Engine.Canvas'.static.MakeColor(byte(255), byte(255), byte(255), 0);
        ButtonIndex[i].FontColor[2] = Class'Engine.Canvas'.static.MakeColor(byte(255), byte(255), byte(255), 0);
        ButtonIndex[i].FontColor[3] = Class'Engine.Canvas'.static.MakeColor(byte(255), byte(255), byte(255), 0);
        ButtonIndex[i].FontColor[4] = Class'Engine.Canvas'.static.MakeColor(byte(255), byte(255), byte(255), 0);
        ButtonIndex[i].FontShadowColor[0] = Class'Engine.Canvas'.static.MakeColor(0, 0, 0, 0);
        ButtonIndex[i].FontShadowColor[1] = Class'Engine.Canvas'.static.MakeColor(0, 0, 0, 0);
        ButtonIndex[i].FontShadowColor[2] = Class'Engine.Canvas'.static.MakeColor(0, 0, 0, 0);
        ButtonIndex[i].FontShadowColor[3] = Class'Engine.Canvas'.static.MakeColor(0, 0, 0, 0);
        ButtonIndex[i].FontShadowColor[4] = Class'Engine.Canvas'.static.MakeColor(0, 0, 0, 0);
        ButtonIndex[i].__OnClick__Delegate = Internal_ButtonIndex_OnClick;
        ButtonIndex[i].InitComponent(MyController, self);
        AppendComponent(ButtonIndex[i]);
        i++;
        // [Loop Continue]
        goto J0x277;
    }
    i = 0;
    J0x50D:

    // End:0x59E [Loop If]
    if(i < 10)
    {
        SeparatorIndex[i] = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
        SeparatorIndex[i].bUseAWinPos = true;
        SeparatorIndex[i].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_list_divid;
        SeparatorIndex[i].InitComponent(MyController, self);
        AppendComponent(SeparatorIndex[i]);
        i++;
        // [Loop Continue]
        goto J0x50D;
    }
    SetData(0, 0, 0);
    //return;    
}

defaultproperties
{
    strButtonFirst="1st "
    strButtonPrev="Prev"
    strButtonNext="?????"
}