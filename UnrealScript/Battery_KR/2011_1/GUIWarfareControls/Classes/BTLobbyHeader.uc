class BTLobbyHeader extends GUIPanel
    editinlinenew
    instanced;

var() automated GUIButton ButtonMyInfo;
var() automated GUIButton ButtonShop;
var() automated GUIButton ButtonAuction;
var() automated GUIButton ButtonClan;
var() automated GUIButton ButtonClanWarStatus;
var() automated GUIButton ButtonClanWar;
var() automated GUIButton ButtonFindFriend;
var() automated GUIButton ButtonHelp;
var() automated GUIButton ButtonSettings;
var() automated GUIButton ButtonBack;
//var delegate<onBackClick> __onBackClick__Delegate;
//var delegate<OnShopClick> __OnShopClick__Delegate;
//var delegate<OnHelpClick> __OnHelpClick__Delegate;
//var delegate<OnSettingsClick> __OnSettingsClick__Delegate;
//var delegate<OnClanClick> __OnClanClick__Delegate;
//var delegate<OnAuctionClick> __OnAuctionClick__Delegate;

delegate bool onBackClick(GUIComponent Sender)
{
    //return;    
}

delegate bool OnShopClick(GUIComponent Sender)
{
    //return;    
}

delegate bool OnHelpClick(GUIComponent Sender)
{
    //return;    
}

delegate bool OnSettingsClick(GUIComponent Sender)
{
    //return;    
}

delegate bool OnClanClick(GUIComponent Sender)
{
    //return;    
}

delegate bool OnAuctionClick(GUIComponent Sender)
{
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    //return;    
}

function bool ButtonBack_OnClick(GUIComponent Sender)
{
    return onBackClick(self);
    //return;    
}

function bool ButtonShop_OnClick(GUIComponent Sender)
{
    return OnShopClick(self);
    //return;    
}

function bool ButtonSettings_OnClick(GUIComponent Sender)
{
    Controller.OpenMenu("GUIWarfare.BTPageOption");
    return OnSettingsClick(self);
    //return;    
}

function bool ButtonClan_OnClick(GUIComponent Sender)
{
    return OnClanClick(self);
    //return;    
}

function bool ButtonAuction_OnClick(GUIComponent Sender)
{
    return OnAuctionClick(self);
    //return;    
}

function bool ButtonHelp_OnClick(GUIComponent Sender)
{
    return OnHelpClick(self);
    //return;    
}

defaultproperties
{
    // Reference: GUIButton'GUIWarfareControls_Decompressed.BTLobbyHeader.mButtonMyInfo'
    begin object name="mButtonMyInfo" class=XInterface.GUIButton
        StyleName="STY2WarfareHeader_MyInfoButton"
        bUseAWinPos=true
        AWinPos=(X1=438.0000000,Y1=10.0000000,X2=501.0000000,Y2=63.0000000)
        OnKeyEvent=mButtonMyInfo.InternalOnKeyEvent
    end object
    ButtonMyInfo=mButtonMyInfo
    // Reference: GUIButton'GUIWarfareControls_Decompressed.BTLobbyHeader.mButtonShop'
    begin object name="mButtonShop" class=XInterface.GUIButton
        StyleName="STY2WarfareHeader_StoreButton"
        WinTop=0.0130208
        WinLeft=0.4902344
        WinWidth=0.0615234
        WinHeight=0.0690104
        OnClick=BTLobbyHeader.ButtonShop_OnClick
        OnKeyEvent=mButtonShop.InternalOnKeyEvent
    end object
    ButtonShop=mButtonShop
    // Reference: GUIButton'GUIWarfareControls_Decompressed.BTLobbyHeader.mButtonAuction'
    begin object name="mButtonAuction" class=XInterface.GUIButton
        StyleName="STY2WarfareHeader_AuctionButton"
        WinTop=0.0130208
        WinLeft=0.5527344
        WinWidth=0.0615234
        WinHeight=0.0690104
        OnClick=BTLobbyHeader.ButtonAuction_OnClick
        OnKeyEvent=mButtonAuction.InternalOnKeyEvent
    end object
    ButtonAuction=mButtonAuction
    // Reference: GUIButton'GUIWarfareControls_Decompressed.BTLobbyHeader.mButtonClan'
    begin object name="mButtonClan" class=XInterface.GUIButton
        StyleName="STY2WarfareHeader_ClanButton"
        WinTop=0.0130208
        WinLeft=0.6152344
        WinWidth=0.0615234
        WinHeight=0.0690104
        OnClick=BTLobbyHeader.ButtonClan_OnClick
        OnKeyEvent=mButtonClan.InternalOnKeyEvent
    end object
    ButtonClan=mButtonClan
    // Reference: GUIButton'GUIWarfareControls_Decompressed.BTLobbyHeader.mButtonClanWar'
    begin object name="mButtonClanWar" class=XInterface.GUIButton
        StyleName="STY2WarfareHeader_ClanWarButton"
        WinTop=0.0130208
        WinLeft=0.6777344
        WinWidth=0.0615234
        WinHeight=0.0690104
        OnKeyEvent=mButtonClanWar.InternalOnKeyEvent
    end object
    ButtonClanWar=mButtonClanWar
    // Reference: GUIButton'GUIWarfareControls_Decompressed.BTLobbyHeader.mButtonFindFriend'
    begin object name="mButtonFindFriend" class=XInterface.GUIButton
        StyleName="STY2WarfareHeader_FindFriendButton"
        WinTop=0.0130208
        WinLeft=0.7402344
        WinWidth=0.0615234
        WinHeight=0.0690104
        OnKeyEvent=mButtonFindFriend.InternalOnKeyEvent
    end object
    ButtonFindFriend=mButtonFindFriend
    // Reference: GUIButton'GUIWarfareControls_Decompressed.BTLobbyHeader.mButtonHelp'
    begin object name="mButtonHelp" class=XInterface.GUIButton
        StyleName="STY2WarfareHeader_HelpButton"
        WinTop=0.0130208
        WinLeft=0.8027344
        WinWidth=0.0615234
        WinHeight=0.0690104
        OnClick=BTLobbyHeader.ButtonHelp_OnClick
        OnKeyEvent=mButtonHelp.InternalOnKeyEvent
    end object
    ButtonHelp=mButtonHelp
    // Reference: GUIButton'GUIWarfareControls_Decompressed.BTLobbyHeader.mButtonSettings'
    begin object name="mButtonSettings" class=XInterface.GUIButton
        StyleName="STY2WarfareHeader_OptionButton"
        WinTop=0.0130208
        WinLeft=0.8652344
        WinWidth=0.0615234
        WinHeight=0.0690104
        OnClick=BTLobbyHeader.ButtonSettings_OnClick
        OnKeyEvent=mButtonSettings.InternalOnKeyEvent
    end object
    ButtonSettings=mButtonSettings
    // Reference: GUIButton'GUIWarfareControls_Decompressed.BTLobbyHeader.mButtonBack'
    begin object name="mButtonBack" class=XInterface.GUIButton
        StyleName="STY2WarfareHeader_OutButton"
        WinTop=0.0130208
        WinLeft=0.9277344
        WinWidth=0.0615234
        WinHeight=0.0690104
        OnClick=BTLobbyHeader.ButtonBack_OnClick
        OnKeyEvent=mButtonBack.InternalOnKeyEvent
    end object
    ButtonBack=mButtonBack
    SetControlsBoundToParent=false
    SetControlsScaleToParent=false
    WinHeight=0.0690104
    bBoundToParent=true
    bScaleToParent=true
}