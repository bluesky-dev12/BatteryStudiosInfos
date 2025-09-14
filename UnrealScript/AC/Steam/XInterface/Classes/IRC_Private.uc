/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\IRC_Private.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Functions:7
 *
 *******************************************************************************/
class IRC_Private extends IRC_Channel
    config(User)
    editinlinenew
    instanced;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    GUISplitter(Controls[1]).SplitOrientation = 1;
    GUISplitter(Controls[1]).SplitPosition = 1.0;
    GUISplitter(Controls[1]).bFixedSplitter = true;
    GUISplitter(Controls[1]).bDrawSplitter = false;
}

function ProcessInput(string Text)
{
    // End:0x5a
    if(Left(Text, 4) ~= "/me ")
    {
        PrivateAction(SystemPage.NickName, Mid(Text, 4));
        SystemPage.Link.SendChannelAction(ChannelName, Mid(Text, 4));
    }
    // End:0xd4
    else
    {
        // End:0x8d
        if(Left(Text, 1) == "/")
        {
            SystemPage.Link.SendCommandText(Mid(Text, 1));
        }
        // End:0xd4
        else
        {
            // End:0xd4
            if(Text != "")
            {
                PrivateText(SystemPage.NickName, Text);
                SystemPage.Link.SendChannelText(ChannelName, Text);
            }
        }
    }
}

function ChangedNick(string OldNick, string NewNick)
{
    TextDisplay.AddText(MakeColorCode(IRCInfoColor) $ "*** " $ OldNick @ NowKnownAsText @ NewNick $ ".");
    ChannelName = NewNick;
    MyButton.Caption = NewNick;
    // End:0x83
    if(!MyButton.bActive)
    {
        MyButton.bForceFlash = true;
    }
    // End:0xdd
    else
    {
        SystemPage.IRCPage.LeaveButton.Caption = SystemPage.IRCPage.LeavePrivateCaptionHead $ Caps(NewNick) $ SystemPage.IRCPage.LeavePrivateCaptionTail;
    }
}

function UserQuit(string Nick, string Reason)
{
    TextDisplay.AddText(MakeColorCode(IRCInfoColor) $ "*** " $ Nick @ QuitText @ "(" $ Reason $ ").");
    // End:0x67
    if(!MyButton.bActive)
    {
        MyButton.bForceFlash = true;
    }
}

function PrivateText(string Nick, string Text)
{
    TextDisplay.AddText(MakeColorCode(IRCNickColor) $ "<" $ Nick $ "> " $ MakeColorCode(IRCTextColor) $ ColorizeLinks(Text));
    // End:0x81
    if(SystemPage.InGame())
    {
        PlayerOwner().ClientMessage("IRC: <" $ Nick $ "> " $ Text);
    }
    // End:0xa6
    if(!MyButton.bActive)
    {
        MyButton.bForceFlash = true;
    }
}

function PrivateAction(string Nick, string Text)
{
    TextDisplay.AddText(MakeColorCode(IRCActionColor) $ "* " $ Nick $ " " $ Text);
    // End:0x6e
    if(SystemPage.InGame())
    {
        PlayerOwner().ClientMessage("IRC: * " $ Nick $ " " $ Text);
    }
    // End:0x93
    if(!MyButton.bActive)
    {
        MyButton.bForceFlash = true;
    }
}

function IsAway(string Nick, string Message)
{
    TextDisplay.AddText(MakeColorCode(IRCInfoColor) $ Nick @ SystemPage.IsAwayText $ ": " $ ColorizeLinks(Message));
    // End:0x69
    if(!MyButton.bActive)
    {
        MyButton.bForceFlash = true;
    }
}
