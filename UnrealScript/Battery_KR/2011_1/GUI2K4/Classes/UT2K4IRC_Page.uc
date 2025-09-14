class UT2K4IRC_Page extends UT2K4TabPanel
    abstract
    config(User)
    editinlinenew
    instanced;

var() automated moEditBox ed_TextEntry;
var() automated GUISplitter sp_Main;
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

function ProcessInput(string Text)
{
    //return;    
}

function free()
{
    //return;    
}

function bool InternalOnKeyEvent(out byte key, out byte State, float Delta)
{
    local string Input;
    local int Index;

    // End:0x38
    if((int(key) == 236) && int(State) == 3)
    {
        lb_TextDisplay.MyScrollText.WheelUp();
        return true;
    }
    // End:0x70
    if((int(key) == 237) && int(State) == 3)
    {
        lb_TextDisplay.MyScrollText.WheelDown();
        return true;
    }
    // End:0x7F
    if(int(State) != 1)
    {
        return false;
    }
    // End:0x133
    if(int(key) == 13)
    {
        Input = ed_TextEntry.GetText();
        // End:0x12E
        if(Input != "")
        {
            Index = InputHistory.Length;
            InputHistory.Insert(Index, 1);
            InputHistory[Index] = Input;
            // End:0xFB
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
    else
    {
        // End:0x195
        if(int(key) == 38)
        {
            // End:0x190
            if(InputHistory.Length > 0)
            {
                ed_TextEntry.SetText(InputHistory[InputHistoryPos]);
                InputHistoryPos--;
                // End:0x188
                if(InputHistoryPos < 0)
                {
                    InputHistoryPos = InputHistory.Length - 1;
                }
                bDoneInputScroll = true;
            }
            return true;            
        }
        else
        {
            // End:0x206
            if(int(key) == 40)
            {
                // End:0x204
                if(InputHistory.Length > 0)
                {
                    // End:0x1C1
                    if(!bDoneInputScroll)
                    {
                        InputHistoryPos = 0;
                    }
                    ed_TextEntry.SetText(InputHistory[InputHistoryPos]);
                    InputHistoryPos++;
                    // End:0x1FC
                    if(InputHistoryPos > (InputHistory.Length - 1))
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
    //return;    
}

function string ColorizeLinks(string InString)
{
    local int i;
    local string OutString, Character, word, ColourlessWord;
    local bool InWord, HaveWord;

    i = 0;
    J0x07:

    // End:0x1A0 [Loop If]
    if(true)
    {
        J0x0B:

        // End:0xBA [Loop If]
        if((i < Len(InString)) && !HaveWord)
        {
            Character = Mid(InString, i, 1);
            // End:0x75
            if(InWord)
            {
                // End:0x5D
                if(Character == " ")
                {
                    HaveWord = true;                    
                }
                else
                {
                    word $= Character;
                    i++;
                }                
            }
            else
            {
                // End:0x9A
                if(Character == " ")
                {
                    OutString $= Character;
                    i++;                    
                }
                else
                {
                    InWord = true;
                    word $= Character;
                    i++;
                }
            }
            // [Loop Continue]
            goto J0x0B;
        }
        // End:0xCC
        if(word == "")
        {
            return OutString;
        }
        ColourlessWord = StripColorCodes(word);
        // End:0x173
        if(((Left(ColourlessWord, 7) == "http://") || Left(ColourlessWord, 9) == "unreal://") || Left(ColourlessWord, Len(PlayerOwner().GetURLProtocol()) + 3) == (PlayerOwner().GetURLProtocol() $ "://"))
        {
            OutString = ((OutString $ (MakeColorCode(IRCLinkColor))) $ ColourlessWord) $ (MakeColorCode(IRCTextColor));            
        }
        else
        {
            OutString = OutString $ word;
        }
        word = "";
        HaveWord = false;
        InWord = false;
        // [Loop Continue]
        goto J0x07;
    }
    return OutString;
    //return;    
}

function bool IRCTextDblClick(GUIComponent Sender)
{
    local string ClickString;

    ClickString = StripColorCodes(lb_TextDisplay.MyScrollText.ClickedString);
    Controller.LaunchURL(ClickString);
    return true;
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(MyController, myOwner);
    lb_TextDisplay.MyScrollText.MaxHistory = MaxChatScrollback;
    lb_TextDisplay.MyScrollText.bClickText = true;
    lb_TextDisplay.MyScrollText.__OnDblClick__Delegate = IRCTextDblClick;
    lb_TextDisplay.MyScrollText.FocusInstead = ed_TextEntry;
    lb_TextDisplay.MyScrollText.bNeverFocus = true;
    //return;    
}

function InternalOnCreateComponent(GUIComponent NewComp, GUIComponent Sender)
{
    // End:0xCE
    if(GUIScrollTextBox(NewComp) != none)
    {
        lb_TextDisplay = GUIScrollTextBox(NewComp);
        lb_TextDisplay.bVisibleWhenEmpty = true;
        lb_TextDisplay.WinWidth = 1.0000000;
        lb_TextDisplay.WinHeight = 1.0000000;
        lb_TextDisplay.CharDelay = 0.0015000;
        lb_TextDisplay.EOLDelay = 0.2500000;
        lb_TextDisplay.Separator = Chr(13);
        lb_TextDisplay.bVisibleWhenEmpty = true;
        lb_TextDisplay.bNoTeletype = true;
        lb_TextDisplay.StyleName = "IRCText";
    }
    //return;    
}

function InterpretColorCodes(out string Text)
{
    local int pos;
    local string Code;

    pos = InStr(Text, Chr(3));
    J0x11:

    // End:0x126 [Loop If]
    if(pos != -1)
    {
        pos++;
        Code = "";
        J0x2F:

        // End:0x65 [Loop If]
        if(IsDigit(Mid(Text, pos, 1)))
        {
            Code $= Mid(Text, pos, 1);
            pos++;
            // [Loop Continue]
            goto J0x2F;
        }
        // End:0xE7
        if((Code != "") && Mid(Text, pos, 1) == ",")
        {
            Text = Left(Text, pos) $ Mid(Text, pos + 1);
            J0xAB:

            // End:0xE7 [Loop If]
            if(IsDigit(Mid(Text, pos, 1)))
            {
                Text = Left(Text, pos) $ Mid(Text, pos + 1);
                // [Loop Continue]
                goto J0xAB;
            }
        }
        Text = Repl(Text, Chr(3) $ Code, MakeColorCode(DecodeColor(int(Code))));
        pos = InStr(Text, Chr(3));
        // [Loop Continue]
        goto J0x11;
    }
    //return;    
}

function Color DecodeColor(int ColorCode)
{
    local Color C;

    switch(ColorCode)
    {
        // End:0x2A
        case 2:
            C = Class'Engine.Canvas'.static.MakeColor(0, 0, 127);
            // End:0x225
            break;
        // End:0x4D
        case 3:
            C = Class'Engine.Canvas'.static.MakeColor(0, 147, 0);
            // End:0x225
            break;
        // End:0x72
        case 4:
            C = Class'Engine.Canvas'.static.MakeColor(byte(255), 0, 0);
            // End:0x225
            break;
        // End:0x95
        case 5:
            C = Class'Engine.Canvas'.static.MakeColor(127, 0, 0);
            // End:0x225
            break;
        // End:0xB8
        case 6:
            C = Class'Engine.Canvas'.static.MakeColor(156, 0, 156);
            // End:0x225
            break;
        // End:0xDB
        case 7:
            C = Class'Engine.Canvas'.static.MakeColor(252, 127, 0);
            // End:0x225
            break;
        // End:0x102
        case 8:
            C = Class'Engine.Canvas'.static.MakeColor(byte(255), byte(255), 0);
            // End:0x225
            break;
        // End:0x127
        case 9:
            C = Class'Engine.Canvas'.static.MakeColor(0, byte(255), 0);
            // End:0x225
            break;
        // End:0x14A
        case 10:
            C = Class'Engine.Canvas'.static.MakeColor(0, 147, 147);
            // End:0x225
            break;
        // End:0x171
        case 11:
            C = Class'Engine.Canvas'.static.MakeColor(0, byte(255), byte(255));
            // End:0x225
            break;
        // End:0x194
        case 12:
            C = Class'Engine.Canvas'.static.MakeColor(0, 0, 252);
            // End:0x225
            break;
        // End:0x1BB
        case 13:
            C = Class'Engine.Canvas'.static.MakeColor(byte(255), 0, byte(255));
            // End:0x225
            break;
        // End:0x1DE
        case 14:
            C = Class'Engine.Canvas'.static.MakeColor(127, 127, 127);
            // End:0x225
            break;
        // End:0x201
        case 15:
            C = Class'Engine.Canvas'.static.MakeColor(210, 210, 210);
            // End:0x225
            break;
        // End:0xFFFF
        default:
            C = Class'Engine.Canvas'.static.MakeColor(byte(255), byte(255), byte(255));
            break;
    }
    return C;
    //return;    
}

defaultproperties
{
    // Reference: moEditBox'GUI2K4_Decompressed.UT2K4IRC_Page.EntryBox'
    begin object name="EntryBox" class=XInterface.moEditBox
        CaptionWidth=0.0000000
        OnCreateComponent=EntryBox.InternalOnCreateComponent
        StyleName="IRCEntry"
        WinTop=0.9500000
        WinLeft=0.0000000
        WinWidth=1.0000000
        WinHeight=0.0500000
        TabOrder=0
        bBoundToParent=true
        bScaleToParent=true
        OnKeyEvent=UT2K4IRC_Page.InternalOnKeyEvent
    end object
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