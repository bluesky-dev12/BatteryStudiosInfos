class IRC_Private extends IRC_Channel
    config(User)
    editinlinenew
    instanced;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    GUISplitter(Controls[1]).SplitOrientation = 1;
    GUISplitter(Controls[1]).SplitPosition = 1.0000000;
    GUISplitter(Controls[1]).bFixedSplitter = true;
    GUISplitter(Controls[1]).bDrawSplitter = false;
    //return;    
}

function ProcessInput(string Text)
{
    // End:0x5A
    if(Left(Text, 4) ~= "/me ")
    {
        PrivateAction(SystemPage.NickName, Mid(Text, 4));
        SystemPage.Link.SendChannelAction(ChannelName, Mid(Text, 4));        
    }
    else
    {
        // End:0x8D
        if(Left(Text, 1) == "/")
        {
            SystemPage.Link.SendCommandText(Mid(Text, 1));            
        }
        else
        {
            // End:0xD4
            if(Text != "")
            {
                PrivateText(SystemPage.NickName, Text);
                SystemPage.Link.SendChannelText(ChannelName, Text);
            }
        }
    }
    //return;    
}

function ChangedNick(string OldNick, string NewNick)
{
    TextDisplay.AddText((((((MakeColorCode(IRCInfoColor)) $ "*** ") $ OldNick) @ NowKnownAsText) @ NewNick) $ ".");
    ChannelName = NewNick;
    MyButton.Caption = NewNick;
    // End:0x83
    if(!MyButton.bActive)
    {
        MyButton.bForceFlash = true;        
    }
    else
    {
        SystemPage.IRCPage.LeaveButton.Caption = (SystemPage.IRCPage.LeavePrivateCaptionHead $ Caps(NewNick)) $ SystemPage.IRCPage.LeavePrivateCaptionTail;
    }
    //return;    
}

function UserQuit(string Nick, string Reason)
{
    TextDisplay.AddText(((((((MakeColorCode(IRCInfoColor)) $ "*** ") $ Nick) @ QuitText) @ "(") $ Reason) $ ").");
    // End:0x67
    if(!MyButton.bActive)
    {
        MyButton.bForceFlash = true;
    }
    //return;    
}

function PrivateText(string Nick, string Text)
{
    TextDisplay.AddText((((((MakeColorCode(IRCNickColor)) $ "<") $ Nick) $ "> ") $ (MakeColorCode(IRCTextColor))) $ (ColorizeLinks(Text)));
    // End:0x81
    if(SystemPage.InGame())
    {
        PlayerOwner().ClientMessage((("IRC: <" $ Nick) $ "> ") $ Text);
    }
    // End:0xA6
    if(!MyButton.bActive)
    {
        MyButton.bForceFlash = true;
    }
    //return;    
}

function PrivateAction(string Nick, string Text)
{
    TextDisplay.AddText(((((MakeColorCode(IRCActionColor)) $ "* ") $ Nick) $ " ") $ Text);
    // End:0x6E
    if(SystemPage.InGame())
    {
        PlayerOwner().ClientMessage((("IRC: * " $ Nick) $ " ") $ Text);
    }
    // End:0x93
    if(!MyButton.bActive)
    {
        MyButton.bForceFlash = true;
    }
    //return;    
}

function IsAway(string Nick, string Message)
{
    TextDisplay.AddText(((((MakeColorCode(IRCInfoColor)) $ Nick) @ SystemPage.IsAwayText) $ ": ") $ (ColorizeLinks(Message)));
    // End:0x69
    if(!MyButton.bActive)
    {
        MyButton.bForceFlash = true;
    }
    //return;    
}
