/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\GUIScrollTextBox.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:12
 *	Functions:11
 *
 *******************************************************************************/
class GUIScrollTextBox extends GUIListBoxBase
    dependson(GUIListBoxBase)
    dependson(GUIScrollText)
    native
    editinlinenew
    instanced;

var export editinline GUIScrollText MyScrollText;
var(GUIScrollText) bool bRepeat;
var(GUIScrollText) bool bNoTeletype;
var(GUIScrollText) bool bStripColors;
var(GUIScrollText) float InitialDelay;
var(GUIScrollText) float CharDelay;
var(GUIScrollText) float EOLDelay;
var(GUIScrollText) float RepeatDelay;
var(GUIScrollText) GUI.eTextAlign TextAlign;
var(GUIScrollText) string Separator;
var() string ESC;
var() string COMMA;

event Created()
{
    ESC = Chr(3);
    COMMA = Chr(44);
}

function InternalOnCreateComponent(GUIComponent NewComp, GUIComponent Sender)
{
    // End:0x38
    if(GUIScrollText(NewComp) != none && Sender == self)
    {
        GUIScrollText(NewComp).bNoTeletype = bNoTeletype;
    }
    super.InternalOnCreateComponent(NewComp, Sender);
}

function InitBaseList(GUIListBase LocalList)
{
    // End:0x3e
    if(MyScrollText == none || MyScrollText != LocalList && GUIScrollText(LocalList) != none)
    {
        MyScrollText = GUIScrollText(LocalList);
    }
    super.InitBaseList(LocalList);
    MyScrollText.Separator = Separator;
    MyScrollText.InitialDelay = InitialDelay;
    MyScrollText.CharDelay = CharDelay;
    MyScrollText.EOLDelay = EOLDelay;
    MyScrollText.RepeatDelay = RepeatDelay;
    MyScrollText.TextAlign = TextAlign;
    MyScrollText.bRepeat = bRepeat;
    MyScrollText.bNoTeletype = bNoTeletype;
    MyScrollText.__OnAdjustTop__Delegate = InternalOnAdjustTop;
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    // End:0x88
    if(DefaultListClass != "")
    {
        MyScrollText = GUIScrollText(AddComponent(DefaultListClass));
        // End:0x88
        if(MyScrollText == none)
        {
            Log(string(Class) $ ".InitComponent - Could not create default list [" $ DefaultListClass $ "]");
            return;
        }
    }
    // End:0xb3
    if(MyScrollText == none)
    {
        Warn("Could not initialize list!");
        return;
    }
    InitBaseList(MyScrollText);
}

function SetContent(string NewContent, optional string sep)
{
    MyScrollText.SetContent(NewContent, sep);
}

function Restart()
{
    MyScrollText.Restart();
}

function Stop()
{
    MyScrollText.Stop();
}

function InternalOnAdjustTop(GUIComponent Sender)
{
    MyScrollText.EndScrolling();
}

function bool IsNumber(string Num)
{
    // End:0x20
    if(Num > Chr(47) && Num < Chr(58))
    {
        return true;
    }
    return false;
}

function string StripColors(string MyString)
{
    local int EscapePos, RemCount, LenFromEscape;

    EscapePos = InStr(MyString, ESC);
    J0x12:
    // End:0x10b [While If]
    if(EscapePos != -1)
    {
        LenFromEscape = Len(MyString) - EscapePos + 1;
        RemCount = 0;
        J0x3f:
        // End:0xd0 [While If]
        if(RemCount < LenFromEscape && RemCount < 7)
        {
            // End:0xc3
            if(Mid(MyString, EscapePos + RemCount, 1) == ESC || IsNumber(Mid(MyString, EscapePos + RemCount, 1)) || Mid(MyString, EscapePos + RemCount, 1) == COMMA)
            {
                ++ RemCount;
            }
            // End:0xc6
            else
            {
                // This is an implied JumpToken;
                goto J0xd0;
            }
            ++ RemCount;
            // This is an implied JumpToken; Continue!
            goto J0x3f;
        }
        J0xd0:
        MyString = Left(MyString, EscapePos) $ Mid(MyString, EscapePos + RemCount);
        EscapePos = InStr(MyString, Chr(3));
        // This is an implied JumpToken; Continue!
        goto J0x12;
    }
    return MyString;
}

function AddText(string NewText)
{
    local string StrippedText;

    // End:0x0e
    if(NewText == "")
    {
        return;
    }
    // End:0x2b
    if(bStripColors)
    {
        StrippedText = StripColors(NewText);
    }
    // End:0x36
    else
    {
        StrippedText = NewText;
    }
    // End:0x6b
    if(MyScrollText.NewText != "")
    {
        MyScrollText.NewText $= MyScrollText.Separator;
    }
    MyScrollText.NewText $= StrippedText;
}

defaultproperties
{
    CharDelay=0.250
    EOLDelay=0.750
    RepeatDelay=3.0
    Separator="|"
    DefaultListClass="XInterface.GUIScrollText"
    FontScale=1
}