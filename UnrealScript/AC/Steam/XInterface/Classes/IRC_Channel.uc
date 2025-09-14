/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\IRC_Channel.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:6
 *	Functions:26
 *
 *******************************************************************************/
class IRC_Channel extends IRC_Page
    dependson(IRC_Page)
    dependson(GUIScrollTextBox)
    dependson(IRCLink)
    dependson(GUISplitter)
    config(User)
    editinlinenew
    instanced;

var string ChannelName;
var export editinline IRC_System SystemPage;
var string ChannelTopic;
var bool IsPrivate;
var export editinline GUIListBox UserListBox;
var bool bUsersNeedSorting;

function UserSetFlag(int i, string flag, bool bSet)
{
    local string Flags;
    local int FlagPos;

    Flags = UserListBox.List.GetExtraAtIndex(i);
    // End:0x70
    if(bSet)
    {
        // End:0x44
        if(InStr(Flags, flag) != -1)
        {
            return;
        }
        UserListBox.List.SetExtraAtIndex(i, Flags $ flag);
    }
    // End:0xd8
    else
    {
        FlagPos = InStr(Flags, flag);
        // End:0x93
        if(FlagPos == -1)
        {
            return;
        }
        Flags = Left(Flags, FlagPos) $ Mid(Flags, FlagPos + 1);
        UserListBox.List.SetExtraAtIndex(i, Flags);
    }
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local export editinline GUIPanel UtilPanel;

    GUISplitter(Controls[1]).SplitOrientation = 1;
    GUISplitter(Controls[1]).SplitPosition = 0.750;
    GUISplitter(Controls[1]).bFixedSplitter = false;
    UtilPanel = GUIPanel(GUISplitter(Controls[1]).Controls[1]);
    UtilPanel.Controls[0] = UserListBox;
    super.InitComponent(MyController, myOwner);
    UserListBox.List.__OnDrawItem__Delegate = MyOnDrawItem;
    UserListBox.List.__CompareItem__Delegate = MyCompareItem;
    UserListBox.List.__OnDblClick__Delegate = MyListDblClick;
    UserListBox.__OnPreDraw__Delegate = MyOnPreDraw;
}

function bool MyOnPreDraw(Canvas C)
{
    // End:0x29
    if(bUsersNeedSorting)
    {
        UserListBox.List.SortList();
        bUsersNeedSorting = false;
    }
    return true;
}

function bool MyListDblClick(GUIComponent Sender)
{
    local string UserName;

    UserName = UserListBox.List.Get();
    // End:0x2c
    if(UserName == "")
    {
        return true;
    }
    SystemPage.CreatePrivChannel(UserName, true);
    return true;
}

function int MyCompareItem(GUIListElem ElemA, GUIListElem ElemB)
{
    local string s1, s2;

    // End:0x33
    if(InStr(ElemA.ExtraStrData, "o") != -1)
    {
        s1 = "   " $ ElemA.Item;
    }
    // End:0xa6
    else
    {
        // End:0x65
        if(InStr(ElemA.ExtraStrData, "h") != -1)
        {
            s1 = "  " $ ElemA.Item;
        }
        // End:0xa6
        else
        {
            // End:0x96
            if(InStr(ElemA.ExtraStrData, "v") != -1)
            {
                s1 = " " $ ElemA.Item;
            }
            // End:0xa6
            else
            {
                s1 = ElemA.Item;
            }
        }
    }
    // End:0xd9
    if(InStr(ElemB.ExtraStrData, "o") != -1)
    {
        s2 = "   " $ ElemB.Item;
    }
    // End:0x14c
    else
    {
        // End:0x10b
        if(InStr(ElemB.ExtraStrData, "h") != -1)
        {
            s2 = "  " $ ElemB.Item;
        }
        // End:0x14c
        else
        {
            // End:0x13c
            if(InStr(ElemB.ExtraStrData, "v") != -1)
            {
                s2 = " " $ ElemB.Item;
            }
            // End:0x14c
            else
            {
                s2 = ElemB.Item;
            }
        }
    }
    s1 = Caps(s1);
    s2 = Caps(s2);
    // End:0x17a
    if(s1 > s2)
    {
        return 1;
    }
    // End:0x194
    else
    {
        // End:0x192
        if(s1 < s2)
        {
            return -1;
        }
        // End:0x194
        else
        {
            return 0;
        }
    }
}

function MyOnDrawItem(Canvas Canvas, int i, float X, float Y, float W, float H, bool bSelected, bool bPending)
{
    local string DrawName, NickName, Flags;

    NickName = UserListBox.List.GetItemAtIndex(i);
    Flags = UserListBox.List.GetExtraAtIndex(i);
    // End:0x6d
    if(InStr(Flags, "o") != -1)
    {
        DrawName = "@" $ NickName;
    }
    // End:0xc6
    else
    {
        // End:0x94
        if(InStr(Flags, "h") != -1)
        {
            DrawName = "%" $ NickName;
        }
        // End:0xc6
        else
        {
            // End:0xbb
            if(InStr(Flags, "v") != -1)
            {
                DrawName = "+" $ NickName;
            }
            // End:0xc6
            else
            {
                DrawName = NickName;
            }
        }
    }
    UserListBox.Style.DrawText(Canvas, 0, X, Y, W, H, 0, DrawName, UserListBox.FontScale);
}

function int GetUser(string Nick)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x5f [While If]
    if(i < UserListBox.List.ItemCount)
    {
        // End:0x55
        if(UserListBox.List.GetItemAtIndex(i) ~= Nick)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return -1;
}

function bool FindNick(string Nick)
{
    // End:0x17
    if(GetUser(Nick) > -1)
    {
        return true;
    }
    return false;
}

function AddUser(string Nick)
{
    local int i;

    i = GetUser(Nick);
    // End:0x22
    if(i > -1)
    {
        return;
    }
    UserListBox.List.Add(Nick);
    bUsersNeedSorting = true;
}

function RemoveUser(string Nick)
{
    local int i;

    i = GetUser(Nick);
    // End:0x1e
    if(i < 0)
    {
        return;
    }
    UserListBox.List.RemoveItem(Nick);
    bUsersNeedSorting = true;
}

function ChangeNick(string OldNick, string NewNick)
{
    local int i;

    i = GetUser(OldNick);
    // End:0x1e
    if(i < 0)
    {
        return;
    }
    UserListBox.List.SetItemAtIndex(i, NewNick);
}

function ChangeOp(string Nick, bool NewOp)
{
    local int i;

    i = GetUser(Nick);
    // End:0x1e
    if(i < 0)
    {
        return;
    }
    UserSetFlag(i, "o", NewOp);
    bUsersNeedSorting = true;
}

function ChangeHalfOp(string Nick, bool NewHalfOp)
{
    local int i;

    i = GetUser(Nick);
    // End:0x1e
    if(i < 0)
    {
        return;
    }
    UserSetFlag(i, "h", NewHalfOp);
    bUsersNeedSorting = true;
}

function ChangeVoice(string Nick, bool NewVoice)
{
    local int i;

    i = GetUser(Nick);
    // End:0x1e
    if(i < 0)
    {
        return;
    }
    UserSetFlag(i, "v", NewVoice);
    bUsersNeedSorting = true;
}

function ChangeTopic(string NewTopic)
{
    ChannelTopic = NewTopic;
    TextDisplay.AddText(MakeColorCode(IRCInfoColor) $ "*** " $ NewTopicText $ ": " $ NewTopic);
    // End:0x66
    if(!MyButton.bActive)
    {
        MyButton.bForceFlash = true;
    }
}

function ChannelText(string Nick, string Text)
{
    TextDisplay.AddText(MakeColorCode(IRCNickColor) $ "<" $ Nick $ "> " $ MakeColorCode(IRCTextColor) $ ColorizeLinks(Text));
    // End:0x6b
    if(!MyButton.bActive)
    {
        MyButton.bForceFlash = true;
    }
}

function ChannelAction(string Nick, string Text)
{
    TextDisplay.AddText(MakeColorCode(IRCActionColor) $ "* " $ Nick $ " " $ Text);
    // End:0x58
    if(!MyButton.bActive)
    {
        MyButton.bForceFlash = true;
    }
}

function UserNotice(string Nick, string Text)
{
    TextDisplay.AddText(MakeColorCode(IRCActionColor) $ "-" $ Nick $ "- " $ Text);
    // End:0x58
    if(!MyButton.bActive)
    {
        MyButton.bForceFlash = true;
    }
}

function ProcessInput(string Text)
{
    // End:0x5a
    if(Left(Text, 4) ~= "/me ")
    {
        ChannelAction(SystemPage.NickName, Mid(Text, 4));
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
                ChannelText(SystemPage.NickName, Text);
                SystemPage.Link.SendChannelText(ChannelName, Text);
            }
        }
    }
}

function PartedChannel(string Nick)
{
    TextDisplay.AddText(MakeColorCode(IRCInfoColor) $ "*** " $ Nick @ HasLeftText @ ChannelName $ ".");
    RemoveUser(Nick);
    // End:0x6c
    if(!MyButton.bActive)
    {
        MyButton.bForceFlash = true;
    }
}

function JoinedChannel(string Nick)
{
    TextDisplay.AddText(MakeColorCode(IRCInfoColor) $ "*** " $ Nick @ HasJoinedText @ ChannelName $ ".");
    AddUser(Nick);
    // End:0x6c
    if(!MyButton.bActive)
    {
        MyButton.bForceFlash = true;
    }
}

function KickUser(string KickedNick, string Kicker, string Reason)
{
    TextDisplay.AddText(MakeColorCode(IRCInfoColor) $ "*** " $ KickedNick @ WasKickedByText @ Kicker $ " (" $ Reason $ ")");
    RemoveUser(KickedNick);
    // End:0x79
    if(!MyButton.bActive)
    {
        MyButton.bForceFlash = true;
    }
}

function UserInChannel(string Nick)
{
    AddUser(Nick);
}

function ChangedNick(string OldNick, string NewNick)
{
    TextDisplay.AddText(MakeColorCode(IRCInfoColor) $ "*** " $ OldNick @ NowKnownAsText @ NewNick $ ".");
    ChangeNick(OldNick, NewNick);
    // End:0x71
    if(!MyButton.bActive)
    {
        MyButton.bForceFlash = true;
    }
}

function UserQuit(string Nick, string Reason)
{
    TextDisplay.AddText(MakeColorCode(IRCInfoColor) $ "*** " $ Nick @ QuitText @ "(" $ Reason $ ").");
    RemoveUser(Nick);
    // End:0x72
    if(!MyButton.bActive)
    {
        MyButton.bForceFlash = true;
    }
}

function ChangeMode(string Nick, string Mode)
{
    TextDisplay.AddText(MakeColorCode(IRCInfoColor) $ "*** " $ Nick @ SetsModeText $ ": " $ Mode);
    // End:0x62
    if(!MyButton.bActive)
    {
        MyButton.bForceFlash = true;
    }
}

defaultproperties
{
    begin object name=MyUserListBox class=GUIListBox
        bVisibleWhenEmpty=true
        OnCreateComponent=InternalOnCreateComponent
        StyleName="ServerBrowserGrid"
        bScaleToParent=true
    object end
    // Reference: GUIListBox'IRC_Channel.MyUserListBox'
    UserListBox=MyUserListBox
}