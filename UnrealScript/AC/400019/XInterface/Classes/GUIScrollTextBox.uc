class GUIScrollTextBox extends GUIListBoxBase
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
    //return;    
}

function InternalOnCreateComponent(GUIComponent NewComp, GUIComponent Sender)
{
    // End:0x38
    if((GUIScrollText(NewComp) != none) && Sender == self)
    {
        GUIScrollText(NewComp).bNoTeletype = bNoTeletype;
    }
    super.InternalOnCreateComponent(NewComp, Sender);
    //return;    
}

function InitBaseList(GUIListBase LocalList)
{
    // End:0x3E
    if(((MyScrollText == none) || MyScrollText != LocalList) && GUIScrollText(LocalList) != none)
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
    //return;    
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
            Log(((string(Class) $ ".InitComponent - Could not create default list [") $ DefaultListClass) $ "]");
            return;
        }
    }
    // End:0xB3
    if(MyScrollText == none)
    {
        Warn("Could not initialize list!");
        return;
    }
    InitBaseList(MyScrollText);
    //return;    
}

function SetContent(string NewContent, optional string sep)
{
    MyScrollText.SetContent(NewContent, sep);
    //return;    
}

function Restart()
{
    MyScrollText.Restart();
    //return;    
}

function Stop()
{
    MyScrollText.Stop();
    //return;    
}

function InternalOnAdjustTop(GUIComponent Sender)
{
    MyScrollText.EndScrolling();
    //return;    
}

function bool IsNumber(string Num)
{
    // End:0x20
    if((Num > Chr(47)) && Num < Chr(58))
    {
        return true;
    }
    return false;
    //return;    
}

function string StripColors(string MyString)
{
    local int EscapePos, RemCount, LenFromEscape;

    EscapePos = InStr(MyString, ESC);
    J0x12:

    // End:0x10B [Loop If]
    if(EscapePos != -1)
    {
        LenFromEscape = Len(MyString) - (EscapePos + 1);
        RemCount = 0;
        J0x3F:

        // End:0xD0 [Loop If]
        if((RemCount < LenFromEscape) && RemCount < 7)
        {
            // End:0xC3
            if(((Mid(MyString, EscapePos + RemCount, 1) == ESC) || IsNumber(Mid(MyString, EscapePos + RemCount, 1))) || Mid(MyString, EscapePos + RemCount, 1) == COMMA)
            {
                RemCount++;
                // [Explicit Continue]
                goto J0xC6;
            }
            // [Explicit Break]
            goto J0xD0;
            J0xC6:

            RemCount++;
            // [Loop Continue]
            goto J0x3F;
        }
        J0xD0:

        MyString = Left(MyString, EscapePos) $ Mid(MyString, EscapePos + RemCount);
        EscapePos = InStr(MyString, Chr(3));
        // [Loop Continue]
        goto J0x12;
    }
    return MyString;
    //return;    
}

function AddText(string NewText)
{
    local string StrippedText;

    // End:0x0E
    if(NewText == "")
    {
        return;
    }
    // End:0x2B
    if(bStripColors)
    {
        StrippedText = StripColors(NewText);        
    }
    else
    {
        StrippedText = NewText;
    }
    // End:0x6B
    if(MyScrollText.NewText != "")
    {
        MyScrollText.NewText $= MyScrollText.Separator;
    }
    MyScrollText.NewText $= StrippedText;
    //return;    
}

defaultproperties
{
    CharDelay=0.2500000
    EOLDelay=0.7500000
    RepeatDelay=3.0000000
    Separator="|"
    DefaultListClass="XInterface.GUIScrollText"
    FontScale=1
}