class GUIQuestionPage extends GUIPage
    editinlinenew
    instanced;

var export editinline GUILabel lMessage;
var Material MessageIcon;
var localized array<localized string> ButtonNames;
var array<export editinline GUIButton> Buttons;
var export editinline GUIButton DefaultButton;
var export editinline GUIButton CancelButton;
//var delegate<OnButtonClick> __OnButtonClick__Delegate;
//var delegate<NewOnButtonClick> __NewOnButtonClick__Delegate;

delegate OnButtonClick(byte bButton)
{
    //return;    
}

delegate bool NewOnButtonClick(byte bButton)
{
    return true;
    //return;    
}

function InitComponent(GUIController pMyController, GUIComponent myOwner)
{
    super.InitComponent(pMyController, myOwner);
    lMessage = GUILabel(Controls[1]);
    ParentPage.InactiveFadeColor = Class'Engine.Canvas'.static.MakeColor(128, 128, 128, byte(255));
    //return;    
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
    lMessage.WinHeight = (YL + float(1)) / float(C.SizeY);
    WinHeight = ((YL + Buttons[0].ActualHeight()) + float(60)) / float(C.SizeY);
    WinTop = (float(C.SizeY) - ActualHeight()) / float(2);
    lMessage.WinTop = WinTop + float(20);
    i = 0;
    J0x1A4:

    // End:0x1E5 [Loop If]
    if(i < Buttons.Length)
    {
        Buttons[i].WinTop = (WinTop + float(40)) + YL;
        i++;
        // [Loop Continue]
        goto J0x1A4;
    }
    __OnPreDraw__Delegate = None;
    return false;
    //return;    
}

function SetupQuestion(string Question, coerce byte bButtons, optional byte ActiveButton, optional bool bClearFirst)
{
    // End:0x1F
    if(lMessage != none)
    {
        lMessage.Caption = Question;
    }
    // End:0x2E
    if(bClearFirst)
    {
        RemoveButtons();
    }
    AddButton(byte(int(bButtons) & 16));
    AddButton(byte(int(bButtons) & 32));
    AddButton(byte(int(bButtons) & 1));
    AddButton(byte(int(bButtons) & 64));
    AddButton(byte(int(bButtons) & 4));
    AddButton(byte(int(bButtons) & 8));
    CancelButton = AddButton(byte(int(bButtons) & 2));
    AddButton(byte(int(bButtons) & 128));
    LayoutButtons(ActiveButton);
    //return;    
}

function GUIButton AddButton(coerce byte idesc)
{
    local export editinline GUIButton btn;
    local byte Mask;
    local int cnt;

    // End:0x0F
    if(int(idesc) == 0)
    {
        return none;
    }
    Mask = 1;
    J0x17:

    // End:0x4A [Loop If]
    if(!bool(int(Mask) & int(idesc)))
    {
        cnt++;
        Mask = byte(int(Mask) << 1);
        // [Loop Continue]
        goto J0x17;
    }
    // End:0xAA
    if(cnt >= ButtonNames.Length)
    {
        Log("GUIQuestionPage.AddButton() button mask was larger than button name array!");
        return none;
    }
    btn = GUIButton(AddComponent("XInterface.GUIButton"));
    // End:0xDE
    if(btn == none)
    {
        return none;
    }
    btn.Tag = int(idesc);
    btn.TabOrder = Components.Length;
    btn.Caption = ButtonNames[cnt];
    btn.__OnClick__Delegate = ButtonClick;
    Buttons[Buttons.Length] = btn;
    return btn;
    //return;    
}

function LayoutButtons(byte ActiveButton)
{
    local int i;
    local float Left, colw, btnw;

    colw = 1.0000000 / float(Buttons.Length + 1);
    btnw = colw * 0.6600000;
    Left = colw - (btnw / float(2));
    i = 0;
    J0x49:

    // End:0x10F [Loop If]
    if(i < Buttons.Length)
    {
        Buttons[i].WinLeft = Left;
        Buttons[i].WinWidth = btnw;
        Buttons[i].WinHeight = 0.0427730;
        Buttons[i].WinTop = 0.6000000;
        Left += colw;
        // End:0x105
        if(bool(Buttons[i].Tag & int(ActiveButton)))
        {
            Buttons[i].SetFocus(none);
        }
        i++;
        // [Loop Continue]
        goto J0x49;
    }
    //return;    
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
        C.CloseMenu(bool(t & (2 | 64)));
    }
    return true;
    //return;    
}

function string Replace(string Src, string Tag, string Value)
{
    // End:0x20
    if(Left(Tag, 1) != "%")
    {
        Tag = "%" $ Tag;
    }
    // End:0x3C
    if(Right(Tag, 1) != "%")
    {
        Tag $= "%";
    }
    return Repl(Src, Tag, Value);
    //return;    
}

function RemoveButtons()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x33 [Loop If]
    if(i < Buttons.Length)
    {
        RemoveComponent(Buttons[i], true);
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    // End:0x4C
    if(Buttons.Length > 0)
    {
        Buttons.Remove(0, Buttons.Length);
    }
    RemapComponents();
    //return;    
}

defaultproperties
{
    ButtonNames[0]="??"
    ButtonNames[1]="????"
    ButtonNames[2]="?????"
    ButtonNames[3]="????"
    ButtonNames[4]="?"
    ButtonNames[5]="???"
    ButtonNames[6]="????"
    ButtonNames[7]="????"
    bRenderWorld=true
    bRequire640x480=false
    BackgroundColor=(R=64,G=64,B=64,A=255)
    BackgroundRStyle=5
    // Reference: GUIImage'XInterface_Decompressed.GUIQuestionPage.imgBack'
    begin object name="imgBack" class=XInterface_Decompressed.GUIImage
        ImageStyle=1
        bBoundToParent=true
        bScaleToParent=true
    end object
    Controls[0]=imgBack
    // Reference: GUILabel'XInterface_Decompressed.GUIQuestionPage.lblQuestion'
    begin object name="lblQuestion" class=XInterface_Decompressed.GUILabel
        bMultiLine=true
        WinTop=0.2000000
        WinLeft=0.1000000
        WinWidth=0.8000000
        WinHeight=0.4000000
    end object
    Controls[1]=lblQuestion
    WinTop=0.2500000
    WinHeight=0.5000000
    OnPreDraw=GUIQuestionPage.InternalOnPreDraw
}