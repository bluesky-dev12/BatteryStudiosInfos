class BTRoomListControl extends GUIPanel
    editinlinenew
    instanced;

var() automated BTTailImage Tail;
var() automated GUIButton ButtonCreate;
var localized string ButtonCreateCaption;
var() automated GUIButton ButtonQuickJoin;
var localized string ButtonQuickJoinCaption;
var() automated GUIButton ButtonQuickJoinSettings;
var localized string ButtonQuickJoinSettingsCaption;
var() automated GUIButton ButtonJoin;
var localized string ButtonJoinCaption;
var() automated GUIButton ButtonShowJoinable;
var localized string ButtonShowJoinableCaption;
//var delegate<OnCreateClick> __OnCreateClick__Delegate;
//var delegate<OnQuickJoinClick> __OnQuickJoinClick__Delegate;
//var delegate<OnJoinClick> __OnJoinClick__Delegate;

delegate bool OnCreateClick(GUIComponent Sender)
{
    //return;    
}

delegate bool OnQuickJoinClick(GUIComponent Sender)
{
    //return;    
}

delegate bool OnJoinClick(GUIComponent Sender)
{
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    ApplyLocalizedStrings();
    ButtonQuickJoinSettings.SetEnabled(false);
    ButtonJoin.SetEnabled(false);
    ButtonShowJoinable.SetEnabled(false);
    //return;    
}

function ApplyLocalizedStrings()
{
    ButtonCreate.Caption = ButtonCreateCaption;
    ButtonQuickJoin.Caption = ButtonQuickJoinCaption;
    ButtonQuickJoinSettings.Caption = ButtonQuickJoinSettingsCaption;
    ButtonJoin.Caption = ButtonJoinCaption;
    ButtonShowJoinable.Caption = ButtonShowJoinableCaption;
    //return;    
}

function bool ButtonCreate_OnClick(GUIComponent Sender)
{
    return OnCreateClick(self);
    //return;    
}

function bool ButtonQuickJoin_OnClick(GUIComponent Sender)
{
    return OnQuickJoinClick(self);
    //return;    
}

function bool ButtonJoin_OnClick(GUIComponent Sender)
{
    return OnJoinClick(self);
    //return;    
}

defaultproperties
{
    // Reference: BTTailImage'GUIWarfareControls_Decompressed.BTRoomListControl.mTail'
    begin object name="mTail" class=GUIWarfareControls_Decompressed.BTTailImage
        WinTop=0.6393229
        WinLeft=0.0097656
        WinWidth=0.2197266
    end object
    Tail=mTail
    // Reference: GUIButton'GUIWarfareControls_Decompressed.BTRoomListControl.mButtonCreate'
    begin object name="mButtonCreate" class=XInterface.GUIButton
        Caption="Create Room"
        StyleName="STY2Warfare_MainButton"
        WinTop=0.6393229
        WinLeft=0.2402344
        WinWidth=0.0917969
        WinHeight=0.0390625
        OnClickSound=0
        OnClick=BTRoomListControl.ButtonCreate_OnClick
        OnKeyEvent=mButtonCreate.InternalOnKeyEvent
    end object
    ButtonCreate=mButtonCreate
    ButtonCreateCaption="????"
    // Reference: GUIButton'GUIWarfareControls_Decompressed.BTRoomListControl.mButtonQuickJoin'
    begin object name="mButtonQuickJoin" class=XInterface.GUIButton
        Caption="Quick Join"
        StyleName="STY2Warfare_MainButton"
        WinTop=0.6393229
        WinLeft=0.3427734
        WinWidth=0.0917969
        WinHeight=0.0390625
        OnClick=BTRoomListControl.ButtonQuickJoin_OnClick
        OnKeyEvent=mButtonQuickJoin.InternalOnKeyEvent
    end object
    ButtonQuickJoin=mButtonQuickJoin
    ButtonQuickJoinCaption="????"
    // Reference: GUIButton'GUIWarfareControls_Decompressed.BTRoomListControl.mButtonQuickJoinSettings'
    begin object name="mButtonQuickJoinSettings" class=XInterface.GUIButton
        Caption="Quick Join Settings"
        StyleName="STY2Warfare_MainButton"
        WinTop=0.6393229
        WinLeft=0.4448780
        WinWidth=0.0917969
        WinHeight=0.0390625
        OnKeyEvent=mButtonQuickJoinSettings.InternalOnKeyEvent
    end object
    ButtonQuickJoinSettings=mButtonQuickJoinSettings
    ButtonQuickJoinSettingsCaption="??????"
    // Reference: GUIButton'GUIWarfareControls_Decompressed.BTRoomListControl.mButtonJoin'
    begin object name="mButtonJoin" class=XInterface.GUIButton
        Caption="Join"
        StyleName="STY2Warfare_MainButton"
        WinTop=0.6393229
        WinLeft=0.5478516
        WinWidth=0.0917969
        WinHeight=0.0390625
        OnClick=BTRoomListControl.ButtonJoin_OnClick
        OnKeyEvent=mButtonJoin.InternalOnKeyEvent
    end object
    ButtonJoin=mButtonJoin
    ButtonJoinCaption="??"
    // Reference: GUIButton'GUIWarfareControls_Decompressed.BTRoomListControl.mButtonShowJoinable'
    begin object name="mButtonShowJoinable" class=XInterface.GUIButton
        Caption="Show Joinable"
        StyleName="STY2Warfare_MainButton"
        WinTop=0.6393229
        WinLeft=0.6503906
        WinWidth=0.0917969
        WinHeight=0.0390625
        OnKeyEvent=mButtonShowJoinable.InternalOnKeyEvent
    end object
    ButtonShowJoinable=mButtonShowJoinable
    ButtonShowJoinableCaption="?????"
    SetControlsBoundToParent=false
    SetControlsScaleToParent=false
    bBoundToParent=true
    bScaleToParent=true
}