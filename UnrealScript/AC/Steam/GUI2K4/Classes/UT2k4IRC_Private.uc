/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2k4IRC_Private.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Functions:14
 *
 *******************************************************************************/
class UT2k4IRC_Private extends UT2k4IRC_Channel
    config(User)
    editinlinenew
    instanced;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    sp_Main.SplitPosition = 1.0;
    sp_Main.__OnReleaseSplitter__Delegate = None;
    sp_Main.__OnLoadINI__Delegate = None;
    sp_Main.bFixedSplitter = true;
    sp_Main.bDrawSplitter = false;
}

function ProcessInput(string Text)
{
    // End:0x5a
    if(Left(Text, 4) ~= "/me ")
    {
        PrivateAction(tp_System.NickName, Mid(Text, 4));
        tp_System.Link.SendChannelAction(ChannelName, Mid(Text, 4));
    }
    // End:0xd4
    else
    {
        // End:0x8d
        if(Left(Text, 1) == "/")
        {
            tp_System.Link.SendCommandText(Mid(Text, 1));
        }
        // End:0xd4
        else
        {
            // End:0xd4
            if(Text != "")
            {
                PrivateText(tp_System.NickName, Text);
                tp_System.Link.SendChannelText(ChannelName, Text);
            }
        }
    }
}

function PrivateText(string Nick, string Text)
{
    // End:0x3a
    if(MyButton.bActive && bIRCTextToSpeechEnabled)
    {
        PlayerOwner().TextToSpeech(StripColorCodes(Text), 1.0);
    }
    InterpretColorCodes(Text);
    lb_TextDisplay.AddText(MakeColorCode(IRCNickColor) $ "<" $ Nick $ "> " $ MakeColorCode(IRCTextColor) $ ColorizeLinks(Text));
    // End:0xc6
    if(tp_System.InGame())
    {
        PlayerOwner().ClientMessage("IRC: <" $ Nick $ "> " $ Text);
    }
    // End:0xeb
    if(!MyButton.bActive)
    {
        MyButton.bForceFlash = true;
    }
}

function PrivateAction(string Nick, string Text)
{
    InterpretColorCodes(Text);
    lb_TextDisplay.AddText(MakeColorCode(IRCActionColor) $ "* " $ Nick $ " " $ Text);
    // End:0x79
    if(tp_System.InGame())
    {
        PlayerOwner().ClientMessage("IRC: * " $ Nick $ " " $ Text);
    }
    // End:0x9e
    if(!MyButton.bActive)
    {
        MyButton.bForceFlash = true;
    }
}

function PrintAwayMessage(string Nick, string Message)
{
    InterpretColorCodes(Message);
    lb_TextDisplay.AddText(MakeColorCode(IRCInfoColor) $ Nick @ tp_System.IsAwayText $ ": " $ ColorizeLinks(Message));
    // End:0x74
    if(!MyButton.bActive)
    {
        MyButton.bForceFlash = true;
    }
}

function int GetUser(string Nick)
{
    // End:0x11
    if(Nick ~= ChannelName)
    {
        return 0;
    }
    return -1;
}

function bool FindNick(string Nick)
{
    // End:0x11
    if(Nick ~= ChannelName)
    {
        return true;
    }
    return false;
}

function AddUser(string Nick);
function RemoveUser(string Nick);
function ChangeNick(string OldNick, string NewNick)
{
    // End:0x2e
    if(OldNick ~= ChannelName)
    {
        ChannelName = NewNick;
        MyButton.Caption = NewNick;
    }
}

function ChangeOp(string Nick, bool NewOp);
function ChangeHalfOp(string Nick, bool NewHalfOp);
function ChangeVoice(string Nick, bool NewVoice);
function bool ContextMenuOpen(GUIContextMenu Sender)
{
    return false;
}
