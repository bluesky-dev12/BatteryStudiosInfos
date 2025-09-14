class BTTPChatHK extends BTTabPanelHK
    editinlinenew
    instanced;

struct ColoredChatText
{
    var int ChatPanel;
    var Color ChatColor;
    var string chatText;
};

var Canvas saveC;
var float StartAniTime;
var float StartAniTimeOffset;
var float SlideAniTime;
var bool bShowChatState;
var bool bShowAni;
var array<FloatBox> fbButtonChatStateArray;
var array<FloatBox> fbSnapShotButtonChatStateArray;
var array<export editinline BTOwnerDrawCaptionButtonHK> ButtonChatStateArray;
var export editinline BTOwnerDrawCaptionButtonHK ButtonChatState;
var export editinline BTOwnerDrawImageHK BackgroundImage[2];
var() automated TabControlMocker TabControl;
var array<export editinline BTOwnerDrawCaptionButtonHK> ButtonChat;
var array<export editinline BTAutoScrollListHK> ASLChat;
var() automated BTEditBoxHK InputBox;
var localized string strChatState[7];
var localized string strAll;
var localized string strWhisper;
var localized string strClan;
var array<ColoredChatText> ccText;
//var delegate<ChangeTab_OnClick> __ChangeTab_OnClick__Delegate;
//var delegate<OnChageChatMode> __OnChageChatMode__Delegate;

delegate ChangeTab_OnClick(int TabIndex)
{
    //return;    
}

delegate OnChageChatMode(int ChatMode)
{
    //return;    
}

function AddChatHistoryNoColor(int Panel, string Chat)
{
    // End:0x71
    if(saveC == none)
    {
        ccText.Length = ccText.Length + 1;
        ccText[ccText.Length - 1].ChatPanel = Panel;
        ccText[ccText.Length - 1].ChatColor = self.WhiteColor;
        ccText[ccText.Length - 1].chatText = Chat;        
    }
    else
    {
        ASLChat[Panel].AddRow(saveC, Chat);
    }
    //return;    
}

function AddChatHistory(int Panel, string Chat, Color tcolor)
{
    // End:0x6C
    if(saveC == none)
    {
        ccText.Length = ccText.Length + 1;
        ccText[ccText.Length - 1].ChatPanel = Panel;
        ccText[ccText.Length - 1].ChatColor = tcolor;
        ccText[ccText.Length - 1].chatText = Chat;        
    }
    else
    {
        ASLChat[Panel].AddRowColor(saveC, Chat, tcolor);
    }
    //return;    
}

function SetEditText(string Chat)
{
    InputBox.SetText(Chat);
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local export editinline BTAutoScrollListHK serverACL;
    local export editinline BTOwnerDrawCaptionButtonHK serverButton;
    local FloatBox fb;
    local int i;

    super(GUIPanel).InitComponent(MyController, myOwner);
    fb.X1 = AWinPos.X1;
    fb.Y1 = AWinPos.Y1 + float(23);
    fb.X2 = AWinPos.X2;
    fb.Y2 = AWinPos.Y2;
    BackgroundImage[0] = NewLabelComponent(fb, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_1);
    fb.X1 = (AWinPos.X1 + float(2)) + float(86);
    fb.Y1 = (AWinPos.Y2 - float(24)) - float(1);
    fb.X2 = AWinPos.X2 - float(3);
    fb.Y2 = (AWinPos.Y2 - float(2)) - float(2);
    BackgroundImage[1] = NewLabelComponent(fb, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_2);
    i = 0;
    J0x130:

    // End:0x518 [Loop If]
    if(i < 3)
    {
        serverButton = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
        serverButton.bUseAWinPos = true;
        fb.X1 = (AWinPos.X1 + float(99 * i)) + float(i);
        fb.Y1 = AWinPos.Y1;
        fb.X2 = (AWinPos.X1 + float(99 * (i + 1))) + float(i);
        fb.Y2 = AWinPos.Y1 + float(23);
        serverButton.AWinPos = fb;
        serverButton.RenderWeight = 0.5000000;
        serverButton.Caption = "Test";
        serverButton.CaptionDrawType = 4;
        serverButton.CaptionPadding[1] = 2;
        serverButton.CaptionAlign = 2;
        serverButton.SetDefaultTabButtonImage();
        serverButton.SetDefaultTabButtonFontColor();
        serverButton.ButtonID = i;
        serverButton.bBoundToParent = false;
        serverButton.bScaleToParent = false;
        serverButton.InitComponent(Controller, self);
        AppendComponent(serverButton);
        ButtonChat[i] = serverButton;
        serverACL = new Class'GUIWarfareControls_Decompressed.BTAutoScrollListHK';
        serverACL.bUseAWinPos = true;
        fb.X1 = (AWinPos.X1 + float(2)) - float(3);
        fb.Y1 = ((AWinPos.Y1 + float(2)) + float(23)) + float(4);
        fb.X2 = ((AWinPos.X2 - float(2)) - float(14)) - float(1);
        fb.Y2 = ((AWinPos.Y2 - float(2)) - float(25)) - float(1);
        serverACL.AWinPos = fb;
        serverACL.bBoundToParent = false;
        serverACL.bScaleToParent = false;
        serverACL.RenderWeight = 0.5000000;
        serverACL.InitComponent(Controller, self);
        AppendComponent(serverACL);
        fb.X1 = (AWinPos.X2 - float(2)) - float(14);
        fb.Y1 = (AWinPos.Y1 + float(2)) + float(23);
        fb.X2 = AWinPos.X2 - float(2);
        fb.Y2 = ((AWinPos.Y2 - float(2)) - float(25)) - float(1);
        serverACL.MultiColumnList.MyScrollBar.AWinPos = fb;
        ASLChat[i] = serverACL;
        ASLChat[i].SelectImage.Image = none;
        TabControl.BindTabButtonAndPanel(ButtonChat[i], ASLChat[i]);
        ButtonChat[i].__OnClick__Delegate = ButttonChat_OnClick;
        i++;
        // [Loop Continue]
        goto J0x130;
    }
    InputBox.bUseAWinPos = true;
    fb.X1 = ((AWinPos.X1 + float(2)) + float(86)) + float(5);
    fb.Y1 = ((AWinPos.Y2 - float(2)) - float(25)) + float(4);
    fb.X2 = AWinPos.X2 - float(4);
    fb.Y2 = (AWinPos.Y2 - float(2)) - float(1);
    InputBox.AWinPos = fb;
    InputBox.bBoundToParent = false;
    InputBox.bScaleToParent = false;
    InputBox.ApplyAWinPos();
    InputBox.MaxTextStrNum = 255;
    InputBox.bLimitDrawSize = true;
    InputBox.LimitDrawWidth = 1815.0000000;
    ButtonChat[0].Caption = strAll;
    ButtonChat[1].Caption = strWhisper;
    ButtonChat[2].Caption = strClan;
    TabControl.SetVisiblePanel(0);
    ButtonChatState = NewButtonComponent(Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1 + float(4), AWinPos.Y2 - float(25), (AWinPos.X1 + float(4)) + float(82), AWinPos.Y2 - float(4)), 0.9900000);
    i = 0;
    J0x6ED:

    // End:0x726 [Loop If]
    if(i < 5)
    {
        ButtonChatState.buttonImage[i] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_chat;
        i++;
        // [Loop Continue]
        goto J0x6ED;
    }
    ButtonChatState.Caption = strAll;
    ButtonChatState.__OnClick__Delegate = ButtonChatState_OnClick;
    ButtonChatStateArray.Length = 3;
    fbButtonChatStateArray.Length = 3;
    fbSnapShotButtonChatStateArray.Length = 3;
    i = 0;
    J0x770:

    // End:0x921 [Loop If]
    if(i < 3)
    {
        ButtonChatStateArray[i] = NewButtonComponent(ButtonChatState.AWinPos, 0.9500000);
        ButtonChatStateArray[i].Caption = strChatState[i + 1];
        ButtonChatStateArray[i].SetDefaultMButtonImage();
        ButtonChatStateArray[i].ButtonID = i + 1;
        ButtonChatStateArray[i].__OnClick__Delegate = ButtonChatStateArray_OnClick;
        ButtonChatStateArray[i].SetVisibility(false);
        ButtonChatStateArray[i].bAcceptsInput = false;
        fbButtonChatStateArray[i] = ButtonChatState.AWinPos;
        fbButtonChatStateArray[i].Y1 = ButtonChatState.AWinPos.Y1 - (((ButtonChatState.AWinPos.Y2 - ButtonChatState.AWinPos.Y1) + float(5)) * float(i + 1));
        fbButtonChatStateArray[i].Y2 = ButtonChatState.AWinPos.Y2 - (((ButtonChatState.AWinPos.Y2 - ButtonChatState.AWinPos.Y1) + float(5)) * float(i + 1));
        i++;
        // [Loop Continue]
        goto J0x770;
    }
    bShowChatState = false;
    FocusFirst(InputBox);
    //return;    
}

function bool ButttonChat_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    TabControl.SetVisiblePanel(btn.ButtonID);
    ChangeTab_OnClick(btn.ButtonID);
    return true;
    //return;    
}

function bool ButtonChatStateArray_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    OnChageChatMode(btn.ButtonID);
    return true;
    //return;    
}

function bool ButtonChatState_OnClick(GUIComponent Sender)
{
    local int i;

    // End:0x14
    if(bShowChatState)
    {
        bShowChatState = false;        
    }
    else
    {
        bShowChatState = true;
    }
    // End:0x51
    if(bShowAni)
    {
        StartAniTimeOffset = (StartAniTime + SlideAniTime) - PlayerOwner().Level.TimeSeconds;        
    }
    else
    {
        StartAniTimeOffset = 0.0000000;
    }
    StartAniTime = PlayerOwner().Level.TimeSeconds;
    bShowAni = true;
    // End:0x13B
    if(bShowChatState)
    {
        i = 0;
        J0x8F:

        // End:0x138 [Loop If]
        if(i < ButtonChatStateArray.Length)
        {
            ButtonChatStateArray[i].SetVisibility(true);
            ButtonChatStateArray[i].bAcceptsInput = true;
            ButtonChatStateArray[i].SetDefaultMButtonImage();
            ButtonChatStateArray[i].SetDefaultFontColor();
            ButtonChatStateArray[i].AWinPos = ButtonChatState.AWinPos;
            ButtonChatStateArray[i].ApplyAWinPos();
            i++;
            // [Loop Continue]
            goto J0x8F;
        }        
    }
    return true;
    //return;    
}

function SetChatState(int ChatState)
{
    ButtonChatState.Caption = strChatState[ChatState];
    //return;    
}

function ClearAll()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x36 [Loop If]
    if(i < ASLChat.Length)
    {
        ASLChat[i].Clear();
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function FloatBox FloatBoxAdd(out FloatBox A, out FloatBox B)
{
    local FloatBox Temp;

    Temp.X1 = A.X1 + B.X1;
    Temp.Y1 = A.Y1 + B.Y1;
    Temp.X2 = A.X2 + B.X2;
    Temp.Y2 = A.Y2 + B.Y2;
    return Temp;
    //return;    
}

function FloatBox FloatBoxSubstract(out FloatBox A, out FloatBox B)
{
    local FloatBox Temp;

    Temp.X1 = A.X1 - B.X1;
    Temp.Y1 = A.Y1 - B.Y1;
    Temp.X2 = A.X2 - B.X2;
    Temp.Y2 = A.Y2 - B.Y2;
    return Temp;
    //return;    
}

function FloatBox FloatBoxMultiply(out FloatBox A, float B)
{
    local FloatBox Temp;

    Temp.X1 = A.X1 * B;
    Temp.Y1 = A.Y1 * B;
    Temp.X2 = A.X2 * B;
    Temp.Y2 = A.Y2 * B;
    return Temp;
    //return;    
}

function bool Internal_OnPreDraw(Canvas C)
{
    local int i;
    local float CurrentTime, ElapsedTime, perc;
    local FloatBox fb, fb2;

    saveC = C;
    // End:0x3E4
    if(bShowAni)
    {
        CurrentTime = PlayerOwner().Level.TimeSeconds + StartAniTimeOffset;
        ElapsedTime = CurrentTime - StartAniTime;
        // End:0x213
        if(bShowChatState)
        {
            // End:0x15B
            if(ElapsedTime < SlideAniTime)
            {
                perc = ElapsedTime / SlideAniTime;
                i = 0;
                J0x79:

                // End:0x158 [Loop If]
                if(i < ButtonChatStateArray.Length)
                {
                    ButtonChatStateArray[i].SetVisibility(true);
                    ButtonChatStateArray[i].bAcceptsInput = true;
                    fb = FloatBoxSubstract(fbButtonChatStateArray[i], ButtonChatState.AWinPos);
                    fb2 = FloatBoxMultiply(fb, perc);
                    ButtonChatStateArray[i].SetAlphaValue(perc);
                    ButtonChatStateArray[i].AWinPos = FloatBoxAdd(ButtonChatState.AWinPos, fb2);
                    ButtonChatStateArray[i].ApplyAWinPos();
                    i++;
                    // [Loop Continue]
                    goto J0x79;
                }                
            }
            else
            {
                i = 0;
                J0x162:

                // End:0x208 [Loop If]
                if(i < ButtonChatStateArray.Length)
                {
                    ButtonChatStateArray[i].SetVisibility(true);
                    ButtonChatStateArray[i].bAcceptsInput = true;
                    ButtonChatStateArray[i].SetDefaultMButtonImage();
                    ButtonChatStateArray[i].SetDefaultFontColor();
                    ButtonChatStateArray[i].AWinPos = fbButtonChatStateArray[i];
                    ButtonChatStateArray[i].ApplyAWinPos();
                    i++;
                    // [Loop Continue]
                    goto J0x162;
                }
                bShowAni = false;
            }            
        }
        else
        {
            // End:0x32F
            if(ElapsedTime < SlideAniTime)
            {
                perc = ElapsedTime / SlideAniTime;
                perc = 1.0000000 - perc;
                i = 0;
                J0x24D:

                // End:0x32C [Loop If]
                if(i < ButtonChatStateArray.Length)
                {
                    ButtonChatStateArray[i].SetVisibility(true);
                    ButtonChatStateArray[i].bAcceptsInput = true;
                    fb = FloatBoxSubstract(fbButtonChatStateArray[i], ButtonChatState.AWinPos);
                    fb2 = FloatBoxMultiply(fb, perc);
                    ButtonChatStateArray[i].SetAlphaValue(perc);
                    ButtonChatStateArray[i].AWinPos = FloatBoxAdd(ButtonChatState.AWinPos, fb2);
                    ButtonChatStateArray[i].ApplyAWinPos();
                    i++;
                    // [Loop Continue]
                    goto J0x24D;
                }                
            }
            else
            {
                i = 0;
                J0x336:

                // End:0x3DC [Loop If]
                if(i < ButtonChatStateArray.Length)
                {
                    ButtonChatStateArray[i].SetVisibility(false);
                    ButtonChatStateArray[i].bAcceptsInput = false;
                    ButtonChatStateArray[i].SetDefaultMButtonImage();
                    ButtonChatStateArray[i].SetDefaultFontColor();
                    ButtonChatStateArray[i].AWinPos = fbButtonChatStateArray[i];
                    ButtonChatStateArray[i].ApplyAWinPos();
                    i++;
                    // [Loop Continue]
                    goto J0x336;
                }
                bShowAni = false;
            }
        }
    }
    return false;
    //return;    
}

function bool Internal_OnPostDraw(Canvas C)
{
    local int i;

    // End:0x78
    if((saveC != none) && ccText.Length > 0)
    {
        i = 0;
        J0x20:

        // End:0x70 [Loop If]
        if(i < ccText.Length)
        {
            AddChatHistory(ccText[i].ChatPanel, ccText[i].chatText, ccText[i].ChatColor);
            i++;
            // [Loop Continue]
            goto J0x20;
        }
        ccText.Length = 0;
    }
    return false;
    //return;    
}

function Internal_DeActivate()
{
    // End:0x10
    if(bShowChatState)
    {
        ButtonChatState_OnClick(none);
    }
    //return;    
}

defaultproperties
{
    SlideAniTime=0.4000000
    // Reference: TabControlMocker'GUIWarfareControls_Decompressed.BTTPChatHK.mTabControl'
    begin object name="mTabControl" class=GUIWarfareControls_Decompressed.TabControlMocker
    end object
    TabControl=mTabControl
    // Reference: BTEditBoxHK'GUIWarfareControls_Decompressed.BTTPChatHK.mInputBox'
    begin object name="mInputBox" class=GUIWarfareControls_Decompressed.BTEditBoxHK
        bCaptureTabs=true
        OnDraw=mInputBox.OwnerDraw
        OnActivate=mInputBox.InternalActivate
        OnDeActivate=mInputBox.InternalDeactivate
        OnMousePressed=mInputBox.OnMousePressed
        OnMouseRelease=mInputBox.OnMouseRelease
        OnChange=mInputBox.Internal_OnChange
        OnKeyType=mInputBox.InternalOnKeyType
        OnKeyEvent=mInputBox.InternalOnKeyEvent
    end object
    InputBox=mInputBox
    strChatState[0]="??????"
    strChatState[1]="??"
    strChatState[2]="??"
    strChatState[3]="???"
    strChatState[4]="??"
    strChatState[5]="???"
    strChatState[6]="?"
    strAll="??"
    strWhisper="???"
    strClan="??"
    OnPostDraw=BTTPChatHK.Internal_OnPostDraw
    bBoundToParent=true
    bScaleToParent=true
    OnPreDraw=BTTPChatHK.Internal_OnPreDraw
    OnDeActivate=BTTPChatHK.Internal_DeActivate
}