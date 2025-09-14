class BTChat extends GUITabPanel
    editinlinenew
    instanced;

var() automated BTBoxImage BackgroundImg;
var() automated FloatingImage TitleChat;
var() automated BTTailImage Tail;
var() automated BTTailImage Tail2;
var() automated TabControlMocker TabControl;
var() automated GUIButton TabAll;
var localized string TabAllCaption;
var() automated GUIButton TabWhisper;
var localized string TabWhisperCaption;
var() automated GUIButton TabClan;
var localized string TabClanCaption;
var() automated BTChatTextPanel TextPanelAll;
var() automated BTChatTextPanel TextPanelWhisper;
var() automated BTChatTextPanel TextPanelClan;
var() automated GUILabel LabelEditBox;
var() automated BTBoxImage ChatBarBG;
var() automated BTTailImage TailChatMode;
var() automated GUILabel LabelChatMode;
var localized string LabelChatModeCaption;
var() automated GUIEditBox EditBox;
//var delegate<OnChat> __OnChat__Delegate;
//var delegate<EditBox_OnKeyEvent> __EditBox_OnKeyEvent__Delegate;

delegate OnChat(GUIComponent Sender, string Text)
{
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(MyController, myOwner);
    TabControl.BindTabButtonAndPanel(TabAll, TextPanelAll);
    TabControl.BindTabButtonAndPanel(TabWhisper, TextPanelWhisper);
    TabControl.BindTabButtonAndPanel(TabClan, TextPanelClan);
    TabControl.SetVisiblePanel(0);
    TextPanelAll.MenuState = 2;
    ApplyLocalizedStrings();
    TextPanelAll.TextBox.MyList.bAlwaysShowScrollbar = true;
    TextPanelAll.TextBox.MyList.bForceScrollBarPosition = true;
    TextPanelAll.TextBox.MyList.ForcedScrollbarWinWidth = 0.0146484;
    TextPanelAll.TextBox.MyList.ForcedScrollbarWinHeight = 0.2669271;
    TextPanelAll.TextBox.MyList.ForcedScrollbarWinLeft = 0.4804688;
    TextPanelAll.TextBox.MyList.ForcedScrollbarWinTop = 0.6875000;
    TextPanelWhisper.TextBox.MyList.bAlwaysShowScrollbar = true;
    TextPanelWhisper.TextBox.MyList.bForceScrollBarPosition = true;
    TextPanelWhisper.TextBox.MyList.ForcedScrollbarWinWidth = 0.0146484;
    TextPanelWhisper.TextBox.MyList.ForcedScrollbarWinHeight = 0.2669271;
    TextPanelWhisper.TextBox.MyList.ForcedScrollbarWinLeft = 0.4804688;
    TextPanelWhisper.TextBox.MyList.ForcedScrollbarWinTop = 0.6875000;
    TextPanelClan.TextBox.MyList.bAlwaysShowScrollbar = true;
    TextPanelClan.TextBox.MyList.bForceScrollBarPosition = true;
    TextPanelClan.TextBox.MyList.ForcedScrollbarWinWidth = 0.0146484;
    TextPanelClan.TextBox.MyList.ForcedScrollbarWinHeight = 0.2669271;
    TextPanelClan.TextBox.MyList.ForcedScrollbarWinLeft = 0.4804688;
    TextPanelClan.TextBox.MyList.ForcedScrollbarWinTop = 0.6875000;
    //return;    
}

function ApplyLocalizedStrings()
{
    TabAll.Caption = TabAllCaption;
    TabWhisper.Caption = TabWhisperCaption;
    TabClan.Caption = TabClanCaption;
    LabelChatMode.Caption = LabelChatModeCaption;
    //return;    
}

delegate bool EditBox_OnKeyEvent(out byte key, out byte State, float Delta)
{
    local Interactions.EInputKey iKey;
    local Interactions.EInputAction iAction;
    local string chatString;

    iKey = key;
    iAction = State;
    chatString = EditBox.GetText();
    // End:0x81
    if(((int(iKey) == int(13)) && int(iAction) == int(1)) && chatString != "")
    {
        EditBox.SetText("");
        OnChat(none, chatString);
        return true;        
    }
    else
    {
        return EditBox.InternalOnKeyEvent(key, State, Delta);
    }
    //return;    
}

function BTChatTextPanel GetCurrentChatPanel()
{
    return BTChatTextPanel(TabControl.GetVisiblePanel());
    //return;    
}

function Add(int id, string Sender, string Message)
{
    Log(((((("[BTChat::Add]" $ " id=") $ string(id)) $ " Sender=") $ Sender) $ " Message=") $ Message);
    GetCurrentChatPanel().AppendText((Sender $ " : ") $ Message);
    GetCurrentChatPanel().TextBox.MyScrollText.EndScrolling();
    //return;    
}

function ClearAll()
{
    Log("[BTChat::ClearAll]");
    TextPanelAll.Clear();
    TextPanelWhisper.Clear();
    TextPanelClan.Clear();
    //return;    
}

defaultproperties
{
    // Reference: BTBoxImage'GUIWarfareControls_Decompressed.BTChat.mBackground'
    begin object name="mBackground" class=GUIWarfareControls_Decompressed.BTBoxImage
        WinTop=0.6875000
        WinLeft=0.0097656
        WinWidth=0.4716797
        WinHeight=0.2669271
    end object
    BackgroundImg=mBackground
    // Reference: FloatingImage'GUIWarfareControls_Decompressed.BTChat.mTitleChat'
    begin object name="mTitleChat" class=XInterface.FloatingImage
        X1=0
        Y1=0
        X2=73
        Y2=14
        DropShadowX=0
        DropShadowY=0
        WinTop=0.6614583
        WinLeft=0.0097656
        WinWidth=0.0712891
        WinHeight=0.0182292
        RenderWeight=0.2100000
    end object
    TitleChat=mTitleChat
    // Reference: BTTailImage'GUIWarfareControls_Decompressed.BTChat.mTail'
    begin object name="mTail" class=GUIWarfareControls_Decompressed.BTTailImage
        WinLeft=0.0810547
        WinWidth=0.0166016
    end object
    Tail=mTail
    // Reference: BTTailImage'GUIWarfareControls_Decompressed.BTChat.mTail2'
    begin object name="mTail2" class=GUIWarfareControls_Decompressed.BTTailImage
        WinLeft=0.3271484
        WinWidth=0.1679688
    end object
    Tail2=mTail2
    // Reference: TabControlMocker'GUIWarfareControls_Decompressed.BTChat.mTabControl'
    begin object name="mTabControl" class=GUIWarfareControls_Decompressed.TabControlMocker
    end object
    TabControl=mTabControl
    // Reference: GUIButton'GUIWarfareControls_Decompressed.BTChat.mTabAll'
    begin object name="mTabAll" class=XInterface.GUIButton
        Caption="All"
        StyleName="STY2Warfare_TabButton"
        WinTop=0.6575521
        WinLeft=0.1015625
        WinWidth=0.0722656
        WinHeight=0.0286458
        OnKeyEvent=mTabAll.InternalOnKeyEvent
    end object
    TabAll=mTabAll
    TabAllCaption="??"
    // Reference: GUIButton'GUIWarfareControls_Decompressed.BTChat.mTabWhisper'
    begin object name="mTabWhisper" class=XInterface.GUIButton
        Caption="Whisper"
        StyleName="STY2Warfare_TabButton"
        WinTop=0.6575521
        WinLeft=0.1767578
        WinWidth=0.0722656
        WinHeight=0.0286458
        OnKeyEvent=mTabWhisper.InternalOnKeyEvent
    end object
    TabWhisper=mTabWhisper
    TabWhisperCaption="??"
    // Reference: GUIButton'GUIWarfareControls_Decompressed.BTChat.mTabClan'
    begin object name="mTabClan" class=XInterface.GUIButton
        Caption="Clan"
        StyleName="STY2Warfare_TabButton"
        WinTop=0.6575521
        WinLeft=0.2519531
        WinWidth=0.0722656
        WinHeight=0.0286458
        OnKeyEvent=mTabClan.InternalOnKeyEvent
    end object
    TabClan=mTabClan
    TabClanCaption="??"
    // Reference: BTChatTextPanel'GUIWarfareControls_Decompressed.BTChat.mTextPanelAll'
    begin object name="mTextPanelAll" class=GUIWarfareControls_Decompressed.BTChatTextPanel
        WinTop=0.6953125
        WinLeft=0.0195312
        WinWidth=0.4550781
        WinHeight=0.2096354
        RenderWeight=1.0000000
    end object
    TextPanelAll=mTextPanelAll
    // Reference: BTChatTextPanel'GUIWarfareControls_Decompressed.BTChat.mTextPanelWhisper'
    begin object name="mTextPanelWhisper" class=GUIWarfareControls_Decompressed.BTChatTextPanel
        WinTop=0.6953125
        WinLeft=0.0195312
        WinWidth=0.4550781
        WinHeight=0.2096354
        RenderWeight=1.0000000
    end object
    TextPanelWhisper=mTextPanelWhisper
    // Reference: BTChatTextPanel'GUIWarfareControls_Decompressed.BTChat.mTextPanelClan'
    begin object name="mTextPanelClan" class=GUIWarfareControls_Decompressed.BTChatTextPanel
        WinTop=0.6953125
        WinLeft=0.0195312
        WinWidth=0.4550781
        WinHeight=0.2096354
        RenderWeight=1.0000000
    end object
    TextPanelClan=mTextPanelClan
    // Reference: BTBoxImage'GUIWarfareControls_Decompressed.BTChat.mChatBarBG'
    begin object name="mChatBarBG" class=GUIWarfareControls_Decompressed.BTBoxImage
        WinTop=0.9231771
        WinLeft=0.0097656
        WinWidth=0.4716797
        WinHeight=0.0312500
    end object
    ChatBarBG=mChatBarBG
    // Reference: BTTailImage'GUIWarfareControls_Decompressed.BTChat.mTailChatMode'
    begin object name="mTailChatMode" class=GUIWarfareControls_Decompressed.BTTailImage
        WinTop=0.9231771
        WinLeft=0.0097656
        WinWidth=0.0761719
        WinHeight=0.0312500
    end object
    TailChatMode=mTailChatMode
    // Reference: GUILabel'GUIWarfareControls_Decompressed.BTChat.mLabelChatMode'
    begin object name="mLabelChatMode" class=XInterface.GUILabel
        Caption="Chat Mode"
        TextAlign=1
        TextColor=(R=255,G=255,B=255,A=255)
        WinTop=0.9231771
        WinLeft=0.0097656
        WinWidth=0.0761719
        WinHeight=0.0312500
    end object
    LabelChatMode=mLabelChatMode
    LabelChatModeCaption="????"
    // Reference: GUIEditBox'GUIWarfareControls_Decompressed.BTChat.mEditBox'
    begin object name="mEditBox" class=XInterface.GUIEditBox
        StyleName="STY2WarfareEmpty"
        WinTop=0.9231771
        WinLeft=0.0878906
        WinWidth=0.3955078
        WinHeight=0.0312500
        OnActivate=mEditBox.InternalActivate
        OnDeActivate=mEditBox.InternalDeactivate
        OnKeyType=mEditBox.InternalOnKeyType
        OnKeyEvent=BTChat.EditBox_OnKeyEvent
    end object
    EditBox=mEditBox
    SetControlsBoundToParent=false
    SetControlsScaleToParent=false
    bBoundToParent=true
    bScaleToParent=true
}