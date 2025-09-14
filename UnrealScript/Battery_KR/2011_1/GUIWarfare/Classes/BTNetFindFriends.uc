class BTNetFindFriends extends BTNetGUIChildPage
    editinlinenew
    instanced;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(BTNetGUIPage).InitComponent(MyController, myOwner);
    //return;    
}

function InternalOnOpen()
{
    Controls[1].SetFocus(none);
    Log(string(self) $ "InternalOnOpen, SetFocus");
    //return;    
}

function InternalOnClose(optional bool bCanceled)
{
    SaveConfig();
    OnClose(bCanceled);
    //return;    
}

function bool Close_OnClick(GUIComponent Sender)
{
    return CloseChildPage();
    //return;    
}

function bool GoToChannelList()
{
    return true;
    //return;    
}

function bool rfAckLogin(int Result, string ErrMsg)
{
    return true;
    //return;    
}

defaultproperties
{
    bPersistent=true
    bAllowedAsLast=true
    OnOpen=BTNetFindFriends.InternalOnOpen
    OnClose=BTNetFindFriends.InternalOnClose
    // Reference: BackgroundImage'GUIWarfare_Decompressed.BTNetFindFriends.backg'
    begin object name="backg" class=XInterface.BackgroundImage
        Image=Texture'Warfare_UI.ID_Textures.ID_back2'
        ImageStyle=6
        WinTop=0.2825520
        WinLeft=0.4179690
        WinWidth=0.3759770
        WinHeight=0.2070310
    end object
    Controls[0]=backg
    // Reference: GUIButton'GUIWarfare_Decompressed.BTNetFindFriends.HelloButton'
    begin object name="HelloButton" class=XInterface.GUIButton
        Caption="Close"
        StyleName="WarfareConnectButton"
        Hint="If click, close this page."
        WinTop=0.4114580
        WinLeft=0.6865230
        WinWidth=0.0917970
        WinHeight=0.0546880
        OnClick=BTNetFindFriends.Close_OnClick
        OnKeyEvent=HelloButton.InternalOnKeyEvent
    end object
    Controls[1]=HelloButton
    // Reference: GUIEditBox'GUIWarfare_Decompressed.BTNetFindFriends.edtLoginName'
    begin object name="edtLoginName" class=XInterface.GUIEditBox
        MaxWidth=80
        StyleName="WarfareIDEditBox"
        WinTop=0.2825520
        WinLeft=0.4179690
        WinWidth=0.3759770
        WinHeight=0.2070310
        bBoundToParent=true
        bScaleToParent=true
        OnActivate=edtLoginName.InternalActivate
        OnDeActivate=edtLoginName.InternalDeactivate
        OnKeyType=edtLoginName.InternalOnKeyType
        OnKeyEvent=edtLoginName.InternalOnKeyEvent
    end object
    Controls[2]=edtLoginName
    WinTop=0.2825520
    WinLeft=0.4179690
    WinWidth=0.3759770
    WinHeight=0.2070310
    OnKeyEvent=BTNetFindFriends.MyKeyEvent
}