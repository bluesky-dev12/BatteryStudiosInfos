class BTFriendLocationListControl extends GUITabPanel
    editinlinenew
    instanced;

var() automated GUITabControl FriendsListTabControl;
var() automated GUIImage FriendLocationListBG;
var() automated BTFriendLocationList LocationListFriend;
var() automated BTFriendLocationList LocationListClan;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(MyController, myOwner);
    FriendsListTabControl.AddTab("Friends", "", LocationListFriend);
    FriendsListTabControl.AddTab("Clan", "", LocationListClan);
    LocationListFriend.Add("Gen", 1, "1", 1, "135", "babababa", 111);
    LocationListFriend.Add("Gen", 1, "1", 1, "Lobby", "sdf", 111);
    LocationListClan.Add("PC-Bang", 1, "3", 1, "2", "bdwdw", 111);
    //return;    
}

defaultproperties
{
    // Reference: GUITabControl'GUIWarfareControls_Decompressed.BTFriendLocationListControl.mFriendsListTabControl'
    begin object name="mFriendsListTabControl" class=XInterface.GUITabControl
        bDockPanels=true
        TabHeight=0.0350000
        WinTop=0.0100000
        WinLeft=0.0250000
        WinWidth=0.9500000
        WinHeight=0.0400000
        RenderWeight=0.4900000
        bAcceptsInput=true
        OnActivate=mFriendsListTabControl.InternalOnActivate
    end object
    FriendsListTabControl=mFriendsListTabControl
    // Reference: GUIImage'GUIWarfareControls_Decompressed.BTFriendLocationListControl.mFriendLocationListBG'
    begin object name="mFriendLocationListBG" class=XInterface.GUIImage
        ImageStyle=1
        RenderWeight=0.0100000
    end object
    FriendLocationListBG=mFriendLocationListBG
    // Reference: BTFriendLocationList'GUIWarfareControls_Decompressed.BTFriendLocationListControl.mLocationListFriend'
    begin object name="mLocationListFriend" class=GUIWarfareControls_Decompressed.BTFriendLocationList
        WinTop=0.0250000
        WinLeft=0.0250000
        WinWidth=0.9500000
        WinHeight=0.9500000
        RenderWeight=0.0000000
        bVisible=false
    end object
    LocationListFriend=mLocationListFriend
    // Reference: BTFriendLocationList'GUIWarfareControls_Decompressed.BTFriendLocationListControl.mLocationListClan'
    begin object name="mLocationListClan" class=GUIWarfareControls_Decompressed.BTFriendLocationList
        WinTop=0.0250000
        WinLeft=0.0250000
        WinWidth=0.9500000
        WinHeight=0.9500000
        RenderWeight=0.0000000
        bVisible=false
    end object
    LocationListClan=mLocationListClan
    bBoundToParent=true
    bScaleToParent=true
}