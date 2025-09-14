/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTPageListButtonHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:13
 *	Functions:9
 *
 *******************************************************************************/
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
var delegate<ButtonIndex_OnClick> __ButtonIndex_OnClick__Delegate;

function SetData(int MaxPage, int ListPerPageCount, int CurrentPage)
{
    PageInfo.MaxIndex = MaxPage;
    PageInfo.ListPerPageCount = ListPerPageCount;
    PageInfo.CurrentIndex = CurrentPage;
    SetCurrentIndex(PageInfo.CurrentIndex);
}

function SetCurrentIndex(int CurrentPage)
{
    local float W, HT, buttonW;

    PageInfo.CurrentIndex = CurrentPage;
    PageInfo.BeginIndex = CurrentPage - 1 / PageInfo.ListPerPageCount * PageInfo.ListPerPageCount + 1;
    PageInfo.EndIndex = PageInfo.BeginIndex + PageInfo.ListPerPageCount - 1;
    // End:0x90
    if(PageInfo.EndIndex >= PageInfo.MaxIndex)
    {
        PageInfo.EndIndex = PageInfo.MaxIndex;
    }
    W = AWinPos.X2 - AWinPos.X1;
    HT = AWinPos.Y2 - AWinPos.Y1;
    ButtonCount = PageInfo.EndIndex - PageInfo.BeginIndex + 1;
    buttonW = 51.0 + float(51) + float(27 * ButtonCount) + float(51);
    buttonW = AWinPos.X1 + W - buttonW / float(2);
    ChangeButtonPosition(int(buttonW));
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
    J0x11b:
    // End:0x15d [While If]
    if(i < 10)
    {
        SeparatorIndex[i].SetVisibility(false);
        ButtonIndex[i].SetVisibility(false);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x11b;
    }
    i = 0;
    J0x164:
    // End:0x3e0 [While If]
    if(i < ButtonCount)
    {
        ButtonIndex[i].ButtonID = PageInfo.BeginIndex + i;
        ButtonIndex[i].SetDefaultFontColor();
        // End:0x1ee
        if(ButtonIndex[i].ButtonID == PageInfo.CurrentIndex)
        {
            ButtonIndex[i].SetFontColorAll(RedColor);
        }
        // End:0x208
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
        // End:0x3c0
        if(i + 1 < ButtonCount)
        {
            SeparatorIndex[i].SetVisibility(true);
            SeparatorIndex[i].AWinPos.X1 = float(StartX - 2);
            SeparatorIndex[i].AWinPos.Y1 = AWinPos.Y1;
            SeparatorIndex[i].AWinPos.X2 = float(StartX + 2);
            SeparatorIndex[i].AWinPos.Y2 = AWinPos.Y2;
            SeparatorIndex[i].ApplyAWinPos();
        }
        // End:0x3d6
        else
        {
            SeparatorIndex[i].SetVisibility(false);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x164;
    }
    ButtonNext.AWinPos.X1 = float(StartX);
    ButtonNext.AWinPos.Y1 = AWinPos.Y1;
    StartX += 51;
    ButtonNext.AWinPos.X2 = float(StartX);
    ButtonNext.AWinPos.Y2 = AWinPos.Y2;
    ButtonNext.ApplyAWinPos();
}

delegate ButtonIndex_OnClick(int pageIndex);
function bool Internal_ButtonIndex_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    ButtonIndex_OnClick(btn.ButtonID);
    return true;
}

function bool ButtonFirst_OnClick(GUIComponent Sender)
{
    SetCurrentIndex(1);
    ButtonIndex_OnClick(PageInfo.CurrentIndex);
    return true;
}

function bool ButtonNext_OnClick(GUIComponent Sender)
{
    // End:0x43
    if(PageInfo.CurrentIndex + 1 <= PageInfo.MaxIndex)
    {
        SetCurrentIndex(PageInfo.CurrentIndex + 1);
        ButtonIndex_OnClick(PageInfo.CurrentIndex);
    }
    return true;
}

function bool ButtonPrev_OnClick(GUIComponent Sender)
{
    // End:0x3a
    if(PageInfo.CurrentIndex - 1 >= 1)
    {
        SetCurrentIndex(PageInfo.CurrentIndex - 1);
        ButtonIndex_OnClick(PageInfo.CurrentIndex);
    }
    return true;
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    RedColor = class'Canvas'.static.MakeColor(byte(255), 0, 0, byte(255));
    super(GUIPanel).InitComponent(MyController, myOwner);
    BackgroundImage = new class'BTOwnerDrawImageHK';
    BackgroundImage.bUseAWinPos = true;
    BackgroundImage.AWinPos = AWinPos;
    BackgroundImage.BackgroundImage = class'BTUIResourcePoolHK'.default.list_lobby_n;
    BackgroundImage.InitComponent(MyController, self);
    AppendComponent(BackgroundImage);
    ButtonFirst = new class'BTIconButtonHK';
    ButtonFirst.bUseAWinPos = true;
    ButtonFirst.SetFontSizeAll(10);
    ButtonFirst.SetDefaultPageListButtonColor();
    ButtonFirst.InitComponent(MyController, self);
    AppendComponent(ButtonFirst);
    ButtonFirst.SetData(class'BTUIResourcePoolHK'.default.img_fir_aro, 0, strButtonFirst, 3);
    ButtonFirst.__OnClick__Delegate = ButtonFirst_OnClick;
    ButtonPrev = new class'BTIconButtonHK';
    ButtonPrev.bUseAWinPos = true;
    ButtonPrev.SetFontSizeAll(10);
    ButtonPrev.SetDefaultPageListButtonColor();
    ButtonPrev.InitComponent(MyController, self);
    AppendComponent(ButtonPrev);
    ButtonPrev.SetData(class'BTUIResourcePoolHK'.default.img_bak_aro, 0, strButtonPrev, 3);
    ButtonPrev.__OnClick__Delegate = ButtonPrev_OnClick;
    ButtonNext = new class'BTIconButtonHK';
    ButtonNext.bUseAWinPos = true;
    ButtonNext.SetFontSizeAll(10);
    ButtonNext.SetDefaultPageListButtonColor();
    ButtonNext.InitComponent(MyController, self);
    AppendComponent(ButtonNext);
    ButtonNext.SetData(class'BTUIResourcePoolHK'.default.img_nex_aro, 1, strButtonNext, 3);
    ButtonNext.__OnClick__Delegate = ButtonNext_OnClick;
    i = 0;
    J0x277:
    // End:0x506 [While If]
    if(i < 10)
    {
        ButtonIndex[i] = new class'BTOwnerDrawCaptionButtonHK';
        ButtonIndex[i].bUseAWinPos = true;
        ButtonIndex[i].SetFontSizeAll(9);
        ButtonIndex[i].FontColor[0] = class'Canvas'.static.MakeColor(byte(255), byte(255), byte(255), 0);
        ButtonIndex[i].FontColor[1] = class'Canvas'.static.MakeColor(byte(255), byte(255), byte(255), 0);
        ButtonIndex[i].FontColor[2] = class'Canvas'.static.MakeColor(byte(255), byte(255), byte(255), 0);
        ButtonIndex[i].FontColor[3] = class'Canvas'.static.MakeColor(byte(255), byte(255), byte(255), 0);
        ButtonIndex[i].FontColor[4] = class'Canvas'.static.MakeColor(byte(255), byte(255), byte(255), 0);
        ButtonIndex[i].FontShadowColor[0] = class'Canvas'.static.MakeColor(0, 0, 0, 0);
        ButtonIndex[i].FontShadowColor[1] = class'Canvas'.static.MakeColor(0, 0, 0, 0);
        ButtonIndex[i].FontShadowColor[2] = class'Canvas'.static.MakeColor(0, 0, 0, 0);
        ButtonIndex[i].FontShadowColor[3] = class'Canvas'.static.MakeColor(0, 0, 0, 0);
        ButtonIndex[i].FontShadowColor[4] = class'Canvas'.static.MakeColor(0, 0, 0, 0);
        ButtonIndex[i].__OnClick__Delegate = Internal_ButtonIndex_OnClick;
        ButtonIndex[i].InitComponent(MyController, self);
        AppendComponent(ButtonIndex[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x277;
    }
    i = 0;
    J0x50d:
    // End:0x59e [While If]
    if(i < 10)
    {
        SeparatorIndex[i] = new class'BTOwnerDrawImageHK';
        SeparatorIndex[i].bUseAWinPos = true;
        SeparatorIndex[i].BackgroundImage = class'BTUIResourcePoolHK'.default.img_list_divid;
        SeparatorIndex[i].InitComponent(MyController, self);
        AppendComponent(SeparatorIndex[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x50d;
    }
    SetData(0, 0, 0);
}

defaultproperties
{
    strButtonFirst="First"
    strButtonPrev="Previous"
    strButtonNext="Next"
}