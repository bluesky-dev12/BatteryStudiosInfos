class BTMessenger extends GUITabPanel
    editinlinenew
    instanced;

var() automated FloatingImage TitleCommunity;
var() automated BTTailImage CommunityTail1;
var() automated BTTailImage CommunityTailPositionedLeftToTabs;
var() automated BTTailImage CommunityTail2;
var() automated BTBoxImage CommunityBG;
var() automated TabControlMocker CommunityTabControl;
var() automated GUIButton CommunityTabOnline;
var localized string CommunityTabOnlineCaption;
var() automated GUIButton CommunityTabBlocked;
var localized string CommunityTabBlockedCaption;
var() automated GUIButton CommunityTabFriend;
var localized string CommunityTabFriendCaption;
var() automated GUIButton CommunityTabClan;
var localized string CommunityTabClanCaption;
var() automated BTOnlineUserList OnlineUserList;
var() automated BTFriendLocationList LocationListFriend;
var() automated BTFriendLocationList LocationListClan;
var() automated BTBlockedUserList BlockedUserList;
var bool EnableTabOnlineUserList;
var bool EnableTabFriendList;
var bool EnableTabClanMemberList;
var bool EnableTabBlockedUserList;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(MyController, myOwner);
    CommunityTabOnline.bVisible = EnableTabOnlineUserList;
    CommunityTabFriend.bVisible = EnableTabFriendList;
    CommunityTabClan.bVisible = EnableTabClanMemberList;
    CommunityTabBlocked.bVisible = EnableTabBlockedUserList;
    OnlineUserList.bVisible = EnableTabOnlineUserList;
    LocationListFriend.bVisible = EnableTabFriendList;
    LocationListClan.bVisible = EnableTabClanMemberList;
    BlockedUserList.bVisible = EnableTabBlockedUserList;
    // End:0xE2
    if(EnableTabOnlineUserList)
    {
        CommunityTabControl.BindTabButtonAndPanel(CommunityTabOnline, OnlineUserList);
    }
    // End:0x104
    if(EnableTabFriendList)
    {
        CommunityTabControl.BindTabButtonAndPanel(CommunityTabFriend, LocationListFriend);
    }
    // End:0x126
    if(EnableTabClanMemberList)
    {
        CommunityTabControl.BindTabButtonAndPanel(CommunityTabClan, LocationListClan);
    }
    // End:0x148
    if(EnableTabBlockedUserList)
    {
        CommunityTabControl.BindTabButtonAndPanel(CommunityTabBlocked, BlockedUserList);
    }
    CommunityTabControl.SetVisiblePanel(0);
    ApplyLocalizedStrings();
    //return;    
}

function ApplyLocalizedStrings()
{
    CommunityTabOnline.Caption = CommunityTabOnlineCaption;
    CommunityTabBlocked.Caption = CommunityTabBlockedCaption;
    CommunityTabFriend.Caption = CommunityTabFriendCaption;
    CommunityTabClan.Caption = CommunityTabClanCaption;
    //return;    
}

function bool InternalOnDraw(Canvas C)
{
    return false;
    //return;    
}

defaultproperties
{
    CommunityTabOnlineCaption="???"
    CommunityTabBlockedCaption="??"
    CommunityTabFriendCaption="??"
    CommunityTabClanCaption="??"
    EnableTabOnlineUserList=true
    EnableTabFriendList=true
    EnableTabClanMemberList=true
    EnableTabBlockedUserList=true
    SetControlsBoundToParent=false
    SetControlsScaleToParent=false
    OnDraw=BTMessenger.InternalOnDraw
}