class UT2k4IRC_Private extends UT2k4IRC_Channel
    config(User)
    editinlinenew
    instanced;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    sp_Main.SplitPosition = 1.0000000;
    sp_Main.__OnReleaseSplitter__Delegate = None;
    sp_Main.__OnLoadINI__Delegate = None;
    sp_Main.bFixedSplitter = true;
    sp_Main.bDrawSplitter = false;
    //return;    
}

function ProcessInput(string Text)
{
    // End:0x5A
    if(Left(Text, 4) ~= "/me ")
    {
        PrivateAction(tp_System.NickName, Mid(Text, 4));
        tp_System.Link.SendChannelAction(ChannelName, Mid(Text, 4));        
    }
    else
    {
        // End:0x8D
        if(Left(Text, 1) == "/")
        {
            tp_System.Link.SendCommandText(Mid(Text, 1));            
        }
        else
        {
            // End:0xD4
            if(Text != "")
            {
                PrivateText(tp_System.NickName, Text);
                tp_System.Link.SendChannelText(ChannelName, Text);
            }
        }
    }
    //return;    
}

function PrivateText(string Nick, string Text)
{
    // End:0x3A
    if(MyButton.bActive && bIRCTextToSpeechEnabled)
    {
        PlayerOwner().TextToSpeech(StripColorCodes(Text), 1.0000000);
    }
    InterpretColorCodes(Text);
    lb_TextDisplay.AddText((((((MakeColorCode(IRCNickColor)) $ "<") $ Nick) $ "> ") $ (MakeColorCode(IRCTextColor))) $ (ColorizeLinks(Text)));
    // End:0xC6
    if(tp_System.InGame())
    {
        PlayerOwner().ClientMessage((("IRC: <" $ Nick) $ "> ") $ Text);
    }
    // End:0xEB
    if(!MyButton.bActive)
    {
        MyButton.bForceFlash = true;
    }
    //return;    
}

function PrivateAction(string Nick, string Text)
{
    InterpretColorCodes(Text);
    lb_TextDisplay.AddText(((((MakeColorCode(IRCActionColor)) $ "* ") $ Nick) $ " ") $ Text);
    // End:0x79
    if(tp_System.InGame())
    {
        PlayerOwner().ClientMessage((("IRC: * " $ Nick) $ " ") $ Text);
    }
    // End:0x9E
    if(!MyButton.bActive)
    {
        MyButton.bForceFlash = true;
    }
    //return;    
}

function PrintAwayMessage(string Nick, string Message)
{
    InterpretColorCodes(Message);
    lb_TextDisplay.AddText(((((MakeColorCode(IRCInfoColor)) $ Nick) @ tp_System.IsAwayText) $ ": ") $ (ColorizeLinks(Message)));
    // End:0x74
    if(!MyButton.bActive)
    {
        MyButton.bForceFlash = true;
    }
    //return;    
}

function int GetUser(string Nick)
{
    // End:0x11
    if(Nick ~= ChannelName)
    {
        return 0;
    }
    return -1;
    //return;    
}

function bool FindNick(string Nick)
{
    // End:0x11
    if(Nick ~= ChannelName)
    {
        return true;
    }
    return false;
    //return;    
}

function AddUser(string Nick)
{
    //return;    
}

function RemoveUser(string Nick)
{
    //return;    
}

function ChangeNick(string OldNick, string NewNick)
{
    // End:0x2E
    if(OldNick ~= ChannelName)
    {
        ChannelName = NewNick;
        MyButton.Caption = NewNick;
    }
    //return;    
}

function ChangeOp(string Nick, bool NewOp)
{
    //return;    
}

function ChangeHalfOp(string Nick, bool NewHalfOp)
{
    //return;    
}

function ChangeVoice(string Nick, bool NewVoice)
{
    //return;    
}

function bool ContextMenuOpen(GUIContextMenu Sender)
{
    return false;
    //return;    
}
