class IRC_Page extends UT2K3TabPanel
    abstract
    config(User)
    editinlinenew
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

function ProcessInput(string Text)
{
    //return;    
}

function bool InternalOnKeyEvent(out byte key, out byte State, float Delta)
{
    local string Input;
    local int Index;

    // End:0x0F
    if(int(State) != 1)
    {
        return false;
    }
    // End:0xC3
    if(int(key) == 13)
    {
        Input = TextEntry.GetText();
        // End:0xBE
        if(Input != "")
        {
            Index = InputHistory.Length;
            InputHistory.Insert(Index, 1);
            InputHistory[Index] = Input;
            // End:0x8B
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
    else
    {
        // End:0x125
        if(int(key) == 38)
        {
            // End:0x120
            if(InputHistory.Length > 0)
            {
                TextEntry.SetText(InputHistory[InputHistoryPos]);
                InputHistoryPos--;
                // End:0x118
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
            // End:0x196
            if(int(key) == 40)
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
                    InputHistoryPos++;
                    // End:0x18C
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

    // End:0x1AC [Loop If]
    if(true)
    {
        J0x0B:

        // End:0xC6 [Loop If]
        if((i < Len(InString)) && !HaveWord)
        {
            Character = Mid(InString, i, 1);
            // End:0x79
            if(InWord)
            {
                // End:0x5D
                if(Character == " ")
                {
                    HaveWord = true;                    
                }
                else
                {
                    word = word $ Character;
                    i++;
                }                
            }
            else
            {
                // End:0xA2
                if(Character == " ")
                {
                    OutString = OutString $ Character;
                    i++;                    
                }
                else
                {
                    InWord = true;
                    word = word $ Character;
                    i++;
                }
            }
            // [Loop Continue]
            goto J0x0B;
        }
        // End:0xD8
        if(word == "")
        {
            return OutString;
        }
        ColourlessWord = StripColorCodes(word);
        // End:0x17F
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

    ClickString = StripColorCodes(TextDisplay.MyScrollText.ClickedString);
    // End:0x59
    if(Left(ClickString, 7) == "http://")
    {
        PlayerOwner().ConsoleCommand("start" @ ClickString);        
    }
    else
    {
        // End:0xCC
        if((Left(ClickString, 9) == "unreal://") || Left(ClickString, Len(PlayerOwner().GetURLProtocol()) + 3) == (PlayerOwner().GetURLProtocol() $ "://"))
        {
            Controller.CloseAll(false);
            PlayerOwner().ClientTravel(ClickString, 0, false);
        }
    }
    return true;
    //return;    
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
    //return;    
}

defaultproperties
{
    HasLeftText="has left"
    HasJoinedText="has joined"
    WasKickedByText="was kicked by"
    NowKnownAsText="is now known as"
    QuitText="Quit"
    SetsModeText="sets mode"
    NewTopicText="Topic"
    MaxChatScrollback=250
    InputHistorySize=16
    IRCTextColor=(R=160,G=160,B=160,A=0)
    IRCNickColor=(R=150,G=150,B=255,A=0)
    IRCActionColor=(R=230,G=200,B=0,A=0)
    IRCInfoColor=(R=130,G=130,B=160,A=0)
    IRCLinkColor=(R=255,G=150,B=150,A=0)
    // Reference: moEditBox'XInterface_Decompressed.IRC_Page.EntryBox'
    begin object name="EntryBox" class=XInterface_Decompressed.moEditBox
        CaptionWidth=0.0000000
        OnCreateComponent=EntryBox.InternalOnCreateComponent
        WinTop=0.9500000
        WinLeft=0.0000000
        WinWidth=1.0000000
        WinHeight=0.0500000
    end object
    Controls[0]=EntryBox
    // Reference: GUISplitter'XInterface_Decompressed.IRC_Page.MainSplitter'
    begin object name="MainSplitter" class=XInterface_Decompressed.GUISplitter
        SplitPosition=0.8000000
        bFixedSplitter=true
        Controls[0]=GUIPanel'XInterface_Decompressed.IRC_Page.DisplayPanel'
        Controls[1]=GUIPanel'XInterface_Decompressed.IRC_Page.UtilPanel'
        WinHeight=0.9500000
    end object
    Controls[1]=MainSplitter
    WinTop=0.1500000
    WinHeight=0.7300000
}