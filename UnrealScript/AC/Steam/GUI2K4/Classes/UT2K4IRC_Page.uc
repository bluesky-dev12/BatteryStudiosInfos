/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4IRC_Page.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:22
 *	Functions:9
 *
 *******************************************************************************/
class UT2K4IRC_Page extends UT2K4TabPanel
    config(User)
    editinlinenew
    abstract
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moEditBox ed_TextEntry;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISplitter sp_Main;
var() config float MainSplitterPosition;
var export editinline GUIScrollTextBox lb_TextDisplay;
var localized string HasLeftText;
var localized string HasJoinedText;
var localized string WasKickedByText;
var localized string NowKnownAsText;
var localized string QuitText;
var localized string SetsModeText;
var localized string NewTopicText;
var config int MaxChatScrollback;
var config int InputHistorySize;
var bool bIRCTextToSpeechEnabled;
var transient array<string> InputHistory;
var transient int InputHistoryPos;
var transient bool bDoneInputScroll;
var config Color IRCTextColor;
var config Color IRCNickColor;
var config Color IRCActionColor;
var config Color IRCInfoColor;
var config Color IRCLinkColor;

function ProcessInput(string Text);
function free();
function bool InternalOnKeyEvent(out byte key, out byte State, float Delta)
{
    local string Input;
    local int Index;

    // End:0x38
    if(key == 236 && State == 3)
    {
        lb_TextDisplay.MyScrollText.WheelUp();
        return true;
    }
    // End:0x70
    if(key == 237 && State == 3)
    {
        lb_TextDisplay.MyScrollText.WheelDown();
        return true;
    }
    // End:0x7f
    if(State != 1)
    {
        return false;
    }
    // End:0x133
    if(key == 13)
    {
        Input = ed_TextEntry.GetText();
        // End:0x12e
        if(Input != "")
        {
            Index = InputHistory.Length;
            InputHistory.Insert(Index, 1);
            InputHistory[Index] = Input;
            // End:0xfb
            if(InputHistory.Length > InputHistorySize)
            {
                InputHistory.Remove(0, InputHistory.Length - InputHistorySize);
            }
            InputHistoryPos = InputHistory.Length - 1;
            bDoneInputScroll = false;
            ProcessInput(Input);
            ed_TextEntry.SetText("");
        }
        return true;
    }
    // End:0x206
    else
    {
        // End:0x195
        if(key == 38)
        {
            // End:0x190
            if(InputHistory.Length > 0)
            {
                ed_TextEntry.SetText(InputHistory[InputHistoryPos]);
                -- InputHistoryPos;
                // End:0x188
                if(InputHistoryPos < 0)
                {
                    InputHistoryPos = InputHistory.Length - 1;
                }
                bDoneInputScroll = true;
            }
            return true;
        }
        // End:0x206
        else
        {
            // End:0x206
            if(key == 40)
            {
                // End:0x204
                if(InputHistory.Length > 0)
                {
                    // End:0x1c1
                    if(!bDoneInputScroll)
                    {
                        InputHistoryPos = 0;
                    }
                    ed_TextEntry.SetText(InputHistory[InputHistoryPos]);
                    ++ InputHistoryPos;
                    // End:0x1fc
                    if(InputHistoryPos > InputHistory.Length - 1)
                    {
                        InputHistoryPos = 0;
                    }
                    bDoneInputScroll = true;
                }
                return true;
            }
        }
    }
    return false;
}

function string ColorizeLinks(string InString)
{
    local int i;
    local string OutString, Character, word, ColourlessWord;
    local bool InWord, HaveWord;

    i = 0;
    J0x07:
    // End:0x1a0 [While If]
    if(true)
    {
        J0x0b:
        // End:0xba [While If]
        if(i < Len(InString) && !HaveWord)
        {
            Character = Mid(InString, i, 1);
            // End:0x75
            if(InWord)
            {
                // End:0x5d
                if(Character == " ")
                {
                    HaveWord = true;
                }
                // End:0x72
                else
                {
                    word $= Character;
                    ++ i;
                }
            }
            // End:0xb7
            else
            {
                // End:0x9a
                if(Character == " ")
                {
                    OutString $= Character;
                    ++ i;
                }
                // End:0xb7
                else
                {
                    InWord = true;
                    word $= Character;
                    ++ i;
                }
            }
            // This is an implied JumpToken; Continue!
            goto J0x0b;
        }
        // End:0xcc
        if(word == "")
        {
            return OutString;
        }
        ColourlessWord = StripColorCodes(word);
        // End:0x173
        if(Left(ColourlessWord, 7) == "http://" || Left(ColourlessWord, 9) == "unreal://" || Left(ColourlessWord, Len(PlayerOwner().GetURLProtocol()) + 3) == PlayerOwner().GetURLProtocol() $ "://")
        {
            OutString = OutString $ MakeColorCode(IRCLinkColor) $ ColourlessWord $ MakeColorCode(IRCTextColor);
        }
        // End:0x185
        else
        {
            OutString = OutString $ word;
        }
        word = "";
        HaveWord = false;
        InWord = false;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return OutString;
}

function bool IRCTextDblClick(GUIComponent Sender)
{
    local string ClickString;

    ClickString = StripColorCodes(lb_TextDisplay.MyScrollText.ClickedString);
    Controller.LaunchURL(ClickString);
    return true;
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(MyController, myOwner);
    lb_TextDisplay.MyScrollText.MaxHistory = MaxChatScrollback;
    lb_TextDisplay.MyScrollText.bClickText = true;
    lb_TextDisplay.MyScrollText.__OnDblClick__Delegate = IRCTextDblClick;
    lb_TextDisplay.MyScrollText.FocusInstead = ed_TextEntry;
    lb_TextDisplay.MyScrollText.bNeverFocus = true;
}

function InternalOnCreateComponent(GUIComponent NewComp, GUIComponent Sender)
{
    // End:0xce
    if(GUIScrollTextBox(NewComp) != none)
    {
        lb_TextDisplay = GUIScrollTextBox(NewComp);
        lb_TextDisplay.bVisibleWhenEmpty = true;
        lb_TextDisplay.WinWidth = 1.0;
        lb_TextDisplay.WinHeight = 1.0;
        lb_TextDisplay.CharDelay = 0.00150;
        lb_TextDisplay.EOLDelay = 0.250;
        lb_TextDisplay.Separator = Chr(13);
        lb_TextDisplay.bVisibleWhenEmpty = true;
        lb_TextDisplay.bNoTeletype = true;
        lb_TextDisplay.StyleName = "IRCText";
    }
}

function InterpretColorCodes(out string Text)
{
    local int pos;
    local string Code;

    pos = InStr(Text, Chr(3));
    J0x11:
    // End:0x126 [While If]
    if(pos != -1)
    {
        ++ pos;
        Code = "";
        J0x2f:
        // End:0x65 [While If]
        if(IsDigit(Mid(Text, pos, 1)))
        {
            Code $= Mid(Text, pos, 1);
            ++ pos;
            // This is an implied JumpToken; Continue!
            goto J0x2f;
        }
        // End:0xe7
        if(Code != "" && Mid(Text, pos, 1) == ",")
        {
            Text = Left(Text, pos) $ Mid(Text, pos + 1);
            J0xab:
            // End:0xe7 [While If]
            if(IsDigit(Mid(Text, pos, 1)))
            {
                Text = Left(Text, pos) $ Mid(Text, pos + 1);
                // This is an implied JumpToken; Continue!
                goto J0xab;
            }
        }
        Text = Repl(Text, Chr(3) $ Code, MakeColorCode(DecodeColor(int(Code))));
        pos = InStr(Text, Chr(3));
        // This is an implied JumpToken; Continue!
        goto J0x11;
    }
}

function Color DecodeColor(int ColorCode)
{
    local Color C;

    switch(ColorCode)
    {
        // End:0x2a
        case 2:
            C = class'Canvas'.static.MakeColor(0, 0, 127);
            // End:0x225
            break;
        // End:0x4d
        case 3:
            C = class'Canvas'.static.MakeColor(0, 147, 0);
            // End:0x225
            break;
        // End:0x72
        case 4:
            C = class'Canvas'.static.MakeColor(byte(255), 0, 0);
            // End:0x225
            break;
        // End:0x95
        case 5:
            C = class'Canvas'.static.MakeColor(127, 0, 0);
            // End:0x225
            break;
        // End:0xb8
        case 6:
            C = class'Canvas'.static.MakeColor(156, 0, 156);
            // End:0x225
            break;
        // End:0xdb
        case 7:
            C = class'Canvas'.static.MakeColor(252, 127, 0);
            // End:0x225
            break;
        // End:0x102
        case 8:
            C = class'Canvas'.static.MakeColor(byte(255), byte(255), 0);
            // End:0x225
            break;
        // End:0x127
        case 9:
            C = class'Canvas'.static.MakeColor(0, byte(255), 0);
            // End:0x225
            break;
        // End:0x14a
        case 10:
            C = class'Canvas'.static.MakeColor(0, 147, 147);
            // End:0x225
            break;
        // End:0x171
        case 11:
            C = class'Canvas'.static.MakeColor(0, byte(255), byte(255));
            // End:0x225
            break;
        // End:0x194
        case 12:
            C = class'Canvas'.static.MakeColor(0, 0, 252);
            // End:0x225
            break;
        // End:0x1bb
        case 13:
            C = class'Canvas'.static.MakeColor(byte(255), 0, byte(255));
            // End:0x225
            break;
        // End:0x1de
        case 14:
            C = class'Canvas'.static.MakeColor(127, 127, 127);
            // End:0x225
            break;
        // End:0x201
        case 15:
            C = class'Canvas'.static.MakeColor(210, 210, 210);
            // End:0x225
            break;
        // End:0xffff
        default:
            C = class'Canvas'.static.MakeColor(byte(255), byte(255), byte(255));
            return C;
    }
}

defaultproperties
{
    begin object name=EntryBox class=moEditBox
        CaptionWidth=0.0
        OnCreateComponent=InternalOnCreateComponent
        StyleName="IRCEntry"
        WinTop=0.950
        WinLeft=0.0
        WinWidth=1.0
        WinHeight=0.050
        TabOrder=0
        bBoundToParent=true
        bScaleToParent=true
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: moEditBox'UT2K4IRC_Page.EntryBox'
    ed_TextEntry=EntryBox
    HasLeftText="%Name%?? %Chan%???? ??????."
    HasJoinedText="%Name%?? %Chan%??? ???????."
    WasKickedByText="%Kicked%?? %Kicker%?? ?? ?? ??????. ( %Reason% )."
    NowKnownAsText="%OldName%?? %NewName%??? ??? ??????."
    QuitText="*** %Name%?? ?????? ( %Reason% )"
    SetsModeText="*** %Name%?? ?? ??? ???????:  %mode%"
    NewTopicText="??"
    MaxChatScrollback=250
    InputHistorySize=16
    IRCTextColor=(R=160,G=160,B=160,A=0)
    IRCNickColor=(R=150,G=150,B=255,A=0)
    IRCActionColor=(R=230,G=200,B=0,A=0)
    IRCInfoColor=(R=130,G=130,B=160,A=0)
    IRCLinkColor=(R=255,G=150,B=150,A=0)
}