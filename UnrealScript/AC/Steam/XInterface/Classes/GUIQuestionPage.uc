/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\GUIQuestionPage.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:8
 *	Functions:10
 *
 *******************************************************************************/
class GUIQuestionPage extends GUIPage
    editinlinenew
    instanced;

var export editinline GUILabel lMessage;
var Material MessageIcon;
var localized array<localized string> ButtonNames;
var array<export editinline GUIButton> Buttons;
var export editinline GUIButton DefaultButton;
var export editinline GUIButton CancelButton;
var delegate<OnButtonClick> __OnButtonClick__Delegate;
var delegate<NewOnButtonClick> __NewOnButtonClick__Delegate;

delegate OnButtonClick(byte bButton);
delegate bool NewOnButtonClick(byte bButton)
{
    return true;
}

function InitComponent(GUIController pMyController, GUIComponent myOwner)
{
    super.InitComponent(pMyController, myOwner);
    lMessage = GUILabel(Controls[1]);
    ParentPage.InactiveFadeColor = class'Canvas'.static.MakeColor(128, 128, 128, byte(255));
}

function bool InternalOnPreDraw(Canvas C)
{
    local float XL, YL;
    local int i;
    local array<string> MsgArray;

    // End:0x59
    if(lMessage.TextFont != "")
    {
        C.Font = Controller.GetMenuFont(lMessage.TextFont).GetFont(C.SizeX);
    }
    C.TextSize("W", XL, YL);
    C.WrapStringToArray(lMessage.Caption, MsgArray, lMessage.ActualWidth(), "|");
    YL *= float(MsgArray.Length);
    // End:0x104
    if(lMessage.Style != none)
    {
        YL += float(lMessage.Style.BorderOffsets[1] + lMessage.Style.BorderOffsets[3]);
    }
    lMessage.WinHeight = YL + float(1) / float(C.SizeY);
    WinHeight = YL + Buttons[0].ActualHeight() + float(60) / float(C.SizeY);
    WinTop = float(C.SizeY) - ActualHeight() / float(2);
    lMessage.WinTop = WinTop + float(20);
    i = 0;
    J0x1a4:
    // End:0x1e5 [While If]
    if(i < Buttons.Length)
    {
        Buttons[i].WinTop = WinTop + float(40) + YL;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1a4;
    }
    __OnPreDraw__Delegate = None;
    return false;
}

function SetupQuestion(string Question, coerce byte bButtons, optional byte ActiveButton, optional bool bClearFirst)
{
    // End:0x1f
    if(lMessage != none)
    {
        lMessage.Caption = Question;
    }
    // End:0x2e
    if(bClearFirst)
    {
        RemoveButtons();
    }
    AddButton(byte(bButtons & 16));
    AddButton(byte(bButtons & 32));
    AddButton(byte(bButtons & 1));
    AddButton(byte(bButtons & 64));
    AddButton(byte(bButtons & 4));
    AddButton(byte(bButtons & 8));
    CancelButton = AddButton(byte(bButtons & 2));
    AddButton(byte(bButtons & 128));
    LayoutButtons(ActiveButton);
}

function GUIButton AddButton(coerce byte idesc)
{
    local export editinline GUIButton btn;
    local byte Mask;
    local int cnt;

    // End:0x0f
    if(idesc == 0)
    {
        return none;
    }
    Mask = 1;
    J0x17:
    // End:0x4a [While If]
    if(!bool(Mask & idesc))
    {
        ++ cnt;
        Mask = byte(Mask << 1);
        // This is an implied JumpToken; Continue!
        goto J0x17;
    }
    // End:0xaa
    if(cnt >= ButtonNames.Length)
    {
        Log("GUIQuestionPage.AddButton() button mask was larger than button name array!");
        return none;
    }
    btn = GUIButton(AddComponent("XInterface.GUIButton"));
    // End:0xde
    if(btn == none)
    {
        return none;
    }
    btn.Tag = idesc;
    btn.TabOrder = Components.Length;
    btn.Caption = ButtonNames[cnt];
    btn.__OnClick__Delegate = ButtonClick;
    Buttons[Buttons.Length] = btn;
    return btn;
}

function LayoutButtons(byte ActiveButton)
{
    local int i;
    local float Left, colw, btnw;

    colw = 1.0 / float(Buttons.Length + 1);
    btnw = colw * 0.660;
    Left = colw - btnw / float(2);
    i = 0;
    J0x49:
    // End:0x10f [While If]
    if(i < Buttons.Length)
    {
        Buttons[i].WinLeft = Left;
        Buttons[i].WinWidth = btnw;
        Buttons[i].WinHeight = 0.0427730;
        Buttons[i].WinTop = 0.60;
        Left += colw;
        // End:0x105
        if(bool(Buttons[i].Tag & ActiveButton))
        {
            Buttons[i].SetFocus(none);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x49;
    }
}

function bool ButtonClick(GUIComponent Sender)
{
    local int t;
    local GUIController C;

    C = Controller;
    t = GUIButton(Sender).Tag;
    ParentPage.InactiveFadeColor = ParentPage.default.InactiveFadeColor;
    OnButtonClick(byte(t));
    // End:0x84
    if(NewOnButtonClick(byte(t)))
    {
        C.CloseMenu(bool(t & 2 | 64));
    }
    return true;
}

function string Replace(string Src, string Tag, string Value)
{
    // End:0x20
    if(Left(Tag, 1) != "%")
    {
        Tag = "%" $ Tag;
    }
    // End:0x3c
    if(Right(Tag, 1) != "%")
    {
        Tag $= "%";
    }
    return Repl(Src, Tag, Value);
}

function RemoveButtons()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x33 [While If]
    if(i < Buttons.Length)
    {
        RemoveComponent(Buttons[i], true);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    // End:0x4c
    if(Buttons.Length > 0)
    {
        Buttons.Remove(0, Buttons.Length);
    }
    RemapComponents();
}

defaultproperties
{
    ButtonNames=// Object reference not set to an instance of an object.
    
    bRenderWorld=true
    bRequire640x480=true
    BackgroundColor=(R=64,G=64,B=64,A=255)
    BackgroundRStyle=5
    Controls=// Object reference not set to an instance of an object.
    
    WinTop=0.250
    WinHeight=0.50
    OnPreDraw=InternalOnPreDraw
}