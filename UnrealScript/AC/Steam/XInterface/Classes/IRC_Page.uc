/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\IRC_Page.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:19
 *	Functions:5
 *
 *******************************************************************************/
class IRC_Page extends UT2K3TabPanel
    config(User)
    editinlinenew
    abstract
    instanced;

var export editinline moEditBox TextEntry;
var export editinline GUIScrollTextBox TextDisplay;
var localized string HasLeftText;
var localized string HasJoinedText;
var localized string WasKickedByText;
var localized string NowKnownAsText;
var localized string QuitText;
var localized string SetsModeText;
var localized string NewTopicText;
var config int MaxChatScrollback;
var config int InputHistorySize;
var transient array<string> InputHistory;
var transient int InputHistoryPos;
var transient bool bDoneInputScroll;
var config Color IRCTextColor;
var config Color IRCNickColor;
var config Color IRCActionColor;
var config Color IRCInfoColor;
var config Color IRCLinkColor;

function ProcessInput(string Text);
function bool InternalOnKeyEvent(out byte key, out byte State, float Delta)
{
    local string Input;
    local int Index;

    // End:0x0f
    if(State != 1)
    {
        return false;
    }
    // End:0xc3
    if(key == 13)
    {
        Input = TextEntry.GetText();
        // End:0xbe
        if(Input != "")
        {
            Index = InputHistory.Length;
            InputHistory.Insert(Index, 1);
            InputHistory[Index] = Input;
            // End:0x8b
            if(InputHistory.Length > InputHistorySize)
            {
                InputHistory.Remove(0, InputHistory.Length - InputHistorySize);
            }
            InputHistoryPos = InputHistory.Length - 1;
            bDoneInputScroll = false;
            ProcessInput(Input);
            TextEntry.SetText("");
        }
        return true;
    }
    // End:0x196
    else
    {
        // End:0x125
        if(key == 38)
        {
            // End:0x120
            if(InputHistory.Length > 0)
            {
                TextEntry.SetText(InputHistory[InputHistoryPos]);
                -- InputHistoryPos;
                // End:0x118
                if(InputHistoryPos < 0)
                {
                    InputHistoryPos = InputHistory.Length - 1;
                }
                bDoneInputScroll = true;
            }
            return true;
        }
        // End:0x196
        else
        {
            // End:0x196
            if(key == 40)
            {
                // End:0x194
                if(InputHistory.Length > 0)
                {
                    // End:0x151
                    if(!bDoneInputScroll)
                    {
                        InputHistoryPos = 0;
                    }
                    TextEntry.SetText(InputHistory[InputHistoryPos]);
                    ++ InputHistoryPos;
                    // End:0x18c
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
    // End:0x1ac [While If]
    if(true)
    {
        J0x0b:
        // End:0xc6 [While If]
        if(i < Len(InString) && !HaveWord)
        {
            Character = Mid(InString, i, 1);
            // End:0x79
            if(InWord)
            {
                // End:0x5d
                if(Character == " ")
                {
                    HaveWord = true;
                }
                // End:0x76
                else
                {
                    word = word $ Character;
                    ++ i;
                }
            }
            // End:0xc3
            else
            {
                // End:0xa2
                if(Character == " ")
                {
                    OutString = OutString $ Character;
                    ++ i;
                }
                // End:0xc3
                else
                {
                    InWord = true;
                    word = word $ Character;
                    ++ i;
                }
            }
            // This is an implied JumpToken; Continue!
            goto J0x0b;
        }
        // End:0xd8
        if(word == "")
        {
            return OutString;
        }
        ColourlessWord = StripColorCodes(word);
        // End:0x17f
        if(Left(ColourlessWord, 7) == "http://" || Left(ColourlessWord, 9) == "unreal://" || Left(ColourlessWord, Len(PlayerOwner().GetURLProtocol()) + 3) == PlayerOwner().GetURLProtocol() $ "://")
        {
            OutString = OutString $ MakeColorCode(IRCLinkColor) $ ColourlessWord $ MakeColorCode(IRCTextColor);
        }
        // End:0x191
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

    ClickString = StripColorCodes(TextDisplay.MyScrollText.ClickedString);
    // End:0x59
    if(Left(ClickString, 7) == "http://")
    {
        PlayerOwner().ConsoleCommand("start" @ ClickString);
    }
    // End:0xcc
    else
    {
        // End:0xcc
        if(Left(ClickString, 9) == "unreal://" || Left(ClickString, Len(PlayerOwner().GetURLProtocol()) + 3) == PlayerOwner().GetURLProtocol() $ "://")
        {
            Controller.CloseAll(false);
            PlayerOwner().ClientTravel(ClickString, 0, false);
        }
    }
    return true;
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(MyController, myOwner);
    TextEntry = moEditBox(Controls[0]);
    TextEntry.__OnKeyEvent__Delegate = InternalOnKeyEvent;
    TextEntry.MyEditBox.Style = Controller.GetStyle("IRCEntry", TextEntry.MyEditBox.FontScale);
    TextDisplay = GUIScrollTextBox(GUIPanel(GUISplitter(Controls[1]).Controls[0]).Controls[0]);
    TextDisplay.MyScrollText.Separator = Chr(13);
    TextDisplay.MyScrollText.MaxHistory = MaxChatScrollback;
    TextDisplay.MyScrollText.Style = Controller.GetStyle("IRCText", TextDisplay.MyScrollText.FontScale);
    TextDisplay.MyScrollText.bClickText = true;
    TextDisplay.MyScrollText.__OnDblClick__Delegate = IRCTextDblClick;
}

defaultproperties
{
    HasLeftText="  left."
    HasJoinedText="  joined."
    WasKickedByText="  was kicked by: "
    NowKnownAsText="  changed names to: "
    QuitText="Exiting"
    SetsModeText="  set the game mode to: "
    NewTopicText="Topic"
    MaxChatScrollback=250
    InputHistorySize=16
    IRCTextColor=(R=160,G=160,B=160,A=0)
    IRCNickColor=(R=150,G=150,B=255,A=0)
    IRCActionColor=(R=230,G=200,B=0,A=0)
    IRCInfoColor=(R=130,G=130,B=160,A=0)
    IRCLinkColor=(R=255,G=150,B=150,A=0)
    Controls=// Object reference not set to an instance of an object.
    
    WinTop=0.150
    WinHeight=0.730
}