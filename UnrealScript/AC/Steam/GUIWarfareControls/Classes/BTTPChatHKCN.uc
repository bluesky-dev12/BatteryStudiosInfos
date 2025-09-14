/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTTPChatHKCN.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:3
 *
 *******************************************************************************/
class BTTPChatHKCN extends BTTPChatHK
    editinlinenew
    instanced;

var FloatBox fChatTab[3];

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
    fb.X1 = 101.0;
    fb.Y1 = 710.0;
    fb.X2 = 460.0;
    fb.Y2 = 736.0;
    BackgroundImage[1] = NewLabelComponent(fb, class'BTUIResourcePoolHK'.default.Lobby_Chat_Input_Bg);
    i = 0;
    J0xd2:
    // End:0x3e5 [While If]
    if(i < 3)
    {
        serverButton = new class'BTOwnerDrawCaptionButtonHK';
        serverButton.bUseAWinPos = true;
        // End:0x122
        if(i == 0)
        {
            serverButton.AWinPos = fChatTab[0];
        }
        // End:0x15d
        else
        {
            // End:0x147
            if(i == 1)
            {
                serverButton.AWinPos = fChatTab[2];
            }
            // End:0x15d
            else
            {
                serverButton.AWinPos = fChatTab[1];
            }
        }
        serverButton.RenderWeight = 0.50;
        serverButton.Caption = "Test";
        serverButton.CaptionDrawType = 4;
        serverButton.CaptionPadding[1] = 2;
        serverButton.CaptionAlign = 2;
        serverButton.SetChatTabButtonImage();
        serverButton.SetTabButtonFontColor();
        serverButton.ButtonID = i;
        serverButton.bBoundToParent = false;
        serverButton.bScaleToParent = false;
        serverButton.InitComponent(Controller, self);
        AppendComponent(serverButton);
        ButtonChat[i] = serverButton;
        serverACL = new class'BTAutoScrollListHK';
        serverACL.bUseAWinPos = true;
        fb.X1 = 19.0;
        fb.Y1 = 557.0;
        fb.X2 = 439.0;
        fb.Y2 = 703.0;
        serverACL.AWinPos = fb;
        serverACL.bBoundToParent = false;
        serverACL.bScaleToParent = false;
        serverACL.RenderWeight = 0.50;
        serverACL.InitComponent(Controller, self);
        AppendComponent(serverACL);
        fb.X1 = 447.0;
        fb.Y1 = 554.0;
        fb.X2 = 459.0;
        fb.Y2 = 707.0;
        serverACL.MultiColumnList.MyScrollBar.AWinPos = fb;
        ASLChat[i] = serverACL;
        ASLChat[i].SelectImage.Image = none;
        TabControl.BindTabButtonAndPanel(ButtonChat[i], ASLChat[i]);
        ButtonChat[i].__OnClick__Delegate = ButttonChat_OnClick;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xd2;
    }
    ButtonChat[1].bVisible = false;
    fb.X1 = AWinPos.X1 + float(2) + float(86) + float(5);
    fb.Y1 = AWinPos.Y2 - float(2) - float(25) + float(4);
    fb.X2 = AWinPos.X2 - float(4);
    fb.Y2 = AWinPos.Y2 - float(2) - float(1);
    InputBox = BTChatEditBoxHK(NewComponent(new class'BTChatEditBoxHK', fb));
    InputBox.bUseAWinPos = true;
    InputBox.bUseAWinPos = true;
    InputBox.bBoundToParent = false;
    InputBox.bScaleToParent = false;
    InputBox.ApplyAWinPos();
    InputBox.MaxTextStrNum = 255;
    InputBox.bLimitDrawSize = true;
    InputBox.LimitDrawWidth = 1815.0;
    ButtonChat[0].Caption = strAll;
    ButtonChat[1].Caption = strWhisper;
    ButtonChat[2].Caption = strClan;
    TabControl.SetVisiblePanel(0);
    ButtonChatState = NewButtonComponent(class'BTCustomDrawHK'.static.MakeFloatBox(13.0, 710.0, 99.0, 738.0), 0.990);
    ButtonChatState.buttonImage[0] = class'BTUIResourcePoolHK'.default.Lobby_ChatBtnUp_small_n;
    ButtonChatState.buttonImage[1] = class'BTUIResourcePoolHK'.default.Lobby_ChatBtnUp_small_on;
    ButtonChatState.buttonImage[2] = class'BTUIResourcePoolHK'.default.Lobby_ChatBtnUp_small_n;
    ButtonChatState.buttonImage[3] = class'BTUIResourcePoolHK'.default.Lobby_ChatBtnUp_small_cli;
    ButtonChatState.buttonImage[4] = class'BTUIResourcePoolHK'.default.Lobby_ChatBtnUp_small_block;
    ButtonChatState.buttonImage[5] = class'BTUIResourcePoolHK'.default.Lobby_ChatBtnUp_small_on;
    ButtonChatState.Caption = strAll;
    ButtonChatState.CaptionDrawType = 5;
    ButtonChatState.CaptionPadding[0] = 20;
    ButtonChatState.CaptionPadding[1] = 6;
    ButtonChatState.CaptionPadding[2] = 9;
    ButtonChatState.CaptionPadding[3] = 7;
    ButtonChatState.__OnClick__Delegate = ButtonChatState_OnClick;
    ButtonChatStateArray.Length = 2;
    fbButtonChatStateArray.Length = 2;
    fbSnapShotButtonChatStateArray.Length = 2;
    i = 0;
    J0x717:
    // End:0x995 [While If]
    if(i < 2)
    {
        ButtonChatStateArray[i] = NewButtonComponent(ButtonChatState.AWinPos, 0.950);
        ButtonChatStateArray[i].buttonImage[0] = class'BTUIResourcePoolHK'.default.Lobby_ChatBtn_small_n;
        ButtonChatStateArray[i].buttonImage[1] = class'BTUIResourcePoolHK'.default.Lobby_ChatBtn_small_on;
        ButtonChatStateArray[i].buttonImage[2] = class'BTUIResourcePoolHK'.default.Lobby_ChatBtn_small_n;
        ButtonChatStateArray[i].buttonImage[3] = class'BTUIResourcePoolHK'.default.Lobby_ChatBtn_small_cli;
        ButtonChatStateArray[i].buttonImage[4] = class'BTUIResourcePoolHK'.default.Lobby_ChatBtn_small_block;
        ButtonChatStateArray[i].buttonImage[5] = class'BTUIResourcePoolHK'.default.Lobby_ChatBtn_small_on;
        ButtonChatStateArray[i].Caption = strChatState[i + 1];
        ButtonChatStateArray[i].ButtonID = i + 1;
        ButtonChatStateArray[i].__OnClick__Delegate = ButtonChatStateArray_OnClick;
        ButtonChatStateArray[i].SetVisibility(false);
        ButtonChatStateArray[i].bAcceptsInput = false;
        fbButtonChatStateArray[i] = ButtonChatState.AWinPos;
        fbButtonChatStateArray[i].Y1 = ButtonChatState.AWinPos.Y1 - ButtonChatState.AWinPos.Y2 - ButtonChatState.AWinPos.Y1 + float(5) * float(i + 1);
        fbButtonChatStateArray[i].Y2 = ButtonChatState.AWinPos.Y2 - ButtonChatState.AWinPos.Y2 - ButtonChatState.AWinPos.Y1 + float(5) * float(i + 1);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x717;
    }
    ButtonChatStateArray[0].ButtonID = 1;
    ButtonChatStateArray[1].ButtonID = 2;
    ButtonChatStateArray[0].Caption = strChatState[1];
    ButtonChatStateArray[1].Caption = strChatState[2];
    bShowChatState = false;
    FocusFirst(InputBox);
}

function bool ButtonChatState_OnClick(GUIComponent Sender)
{
    local int i;

    // End:0x14
    if(bShowChatState)
    {
        bShowChatState = false;
    }
    // End:0x1c
    else
    {
        bShowChatState = true;
    }
    // End:0x51
    if(bShowAni)
    {
        StartAniTimeOffset = StartAniTime + SlideAniTime - PlayerOwner().Level.TimeSeconds;
    }
    // End:0x5c
    else
    {
        StartAniTimeOffset = 0.0;
    }
    StartAniTime = PlayerOwner().Level.TimeSeconds;
    bShowAni = true;
    // End:0x1f0
    if(bShowChatState)
    {
        i = 0;
        J0x8f:
        // End:0x1f0 [While If]
        if(i < ButtonChatStateArray.Length)
        {
            ButtonChatStateArray[i].SetVisibility(true);
            ButtonChatStateArray[i].bAcceptsInput = true;
            ButtonChatStateArray[i].buttonImage[0] = class'BTUIResourcePoolHK'.default.Lobby_ChatBtn_small_n;
            ButtonChatStateArray[i].buttonImage[1] = class'BTUIResourcePoolHK'.default.Lobby_ChatBtn_small_on;
            ButtonChatStateArray[i].buttonImage[2] = class'BTUIResourcePoolHK'.default.Lobby_ChatBtn_small_n;
            ButtonChatStateArray[i].buttonImage[3] = class'BTUIResourcePoolHK'.default.Lobby_ChatBtn_small_cli;
            ButtonChatStateArray[i].buttonImage[4] = class'BTUIResourcePoolHK'.default.Lobby_ChatBtn_small_block;
            ButtonChatStateArray[i].buttonImage[5] = class'BTUIResourcePoolHK'.default.Lobby_ChatBtn_small_on;
            ButtonChatStateArray[i].AWinPos = ButtonChatState.AWinPos;
            ButtonChatStateArray[i].ApplyAWinPos();
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x8f;
        }
    }
    return true;
}

function bool Internal_OnPreDraw(Canvas C)
{
    local int i;
    local float CurrentTime, ElapsedTime, perc;
    local FloatBox fb, fb2;

    saveC = C;
    // End:0x6fa
    if(bShowAni)
    {
        CurrentTime = PlayerOwner().Level.TimeSeconds + StartAniTimeOffset;
        ElapsedTime = CurrentTime - StartAniTime;
        // End:0x39e
        if(bShowChatState)
        {
            // End:0x15b
            if(ElapsedTime < SlideAniTime)
            {
                perc = ElapsedTime / SlideAniTime;
                i = 0;
                J0x79:
                // End:0x158 [While If]
                if(i < ButtonChatStateArray.Length)
                {
                    ButtonChatStateArray[i].SetVisibility(true);
                    ButtonChatStateArray[i].bAcceptsInput = true;
                    fb = FloatBoxSubstract(fbButtonChatStateArray[i], ButtonChatState.AWinPos);
                    fb2 = FloatBoxMultiply(fb, perc);
                    ButtonChatStateArray[i].SetAlphaValue(perc);
                    ButtonChatStateArray[i].AWinPos = FloatBoxAdd(ButtonChatState.AWinPos, fb2);
                    ButtonChatStateArray[i].ApplyAWinPos();
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0x79;
                }
            }
            // End:0x39b
            else
            {
                ButtonChatState.buttonImage[0] = class'BTUIResourcePoolHK'.default.Lobby_ChatBtnDn_small_n;
                ButtonChatState.buttonImage[1] = class'BTUIResourcePoolHK'.default.Lobby_ChatBtnDn_small_on;
                ButtonChatState.buttonImage[2] = class'BTUIResourcePoolHK'.default.Lobby_ChatBtnDn_small_n;
                ButtonChatState.buttonImage[3] = class'BTUIResourcePoolHK'.default.Lobby_ChatBtnDn_small_cli;
                ButtonChatState.buttonImage[4] = class'BTUIResourcePoolHK'.default.Lobby_ChatBtnDn_small_block;
                ButtonChatState.buttonImage[5] = class'BTUIResourcePoolHK'.default.Lobby_ChatBtnDn_small_on;
                i = 0;
                J0x220:
                // End:0x393 [While If]
                if(i < ButtonChatStateArray.Length)
                {
                    ButtonChatStateArray[i].SetVisibility(true);
                    ButtonChatStateArray[i].bAcceptsInput = true;
                    ButtonChatStateArray[i].buttonImage[0] = class'BTUIResourcePoolHK'.default.Lobby_ChatBtn_small_n;
                    ButtonChatStateArray[i].buttonImage[1] = class'BTUIResourcePoolHK'.default.Lobby_ChatBtn_small_on;
                    ButtonChatStateArray[i].buttonImage[2] = class'BTUIResourcePoolHK'.default.Lobby_ChatBtn_small_n;
                    ButtonChatStateArray[i].buttonImage[3] = class'BTUIResourcePoolHK'.default.Lobby_ChatBtn_small_cli;
                    ButtonChatStateArray[i].buttonImage[4] = class'BTUIResourcePoolHK'.default.Lobby_ChatBtn_small_block;
                    ButtonChatStateArray[i].buttonImage[5] = class'BTUIResourcePoolHK'.default.Lobby_ChatBtn_small_on;
                    ButtonChatStateArray[i].SetDefaultFontColor();
                    ButtonChatStateArray[i].AWinPos = fbButtonChatStateArray[i];
                    ButtonChatStateArray[i].ApplyAWinPos();
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0x220;
                }
                bShowAni = false;
            }
        }
        // End:0x6fa
        else
        {
            // End:0x4ba
            if(ElapsedTime < SlideAniTime)
            {
                perc = ElapsedTime / SlideAniTime;
                perc = 1.0 - perc;
                i = 0;
                J0x3d8:
                // End:0x4b7 [While If]
                if(i < ButtonChatStateArray.Length)
                {
                    ButtonChatStateArray[i].SetVisibility(true);
                    ButtonChatStateArray[i].bAcceptsInput = true;
                    fb = FloatBoxSubstract(fbButtonChatStateArray[i], ButtonChatState.AWinPos);
                    fb2 = FloatBoxMultiply(fb, perc);
                    ButtonChatStateArray[i].SetAlphaValue(perc);
                    ButtonChatStateArray[i].AWinPos = FloatBoxAdd(ButtonChatState.AWinPos, fb2);
                    ButtonChatStateArray[i].ApplyAWinPos();
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0x3d8;
                }
            }
            // End:0x6fa
            else
            {
                ButtonChatState.buttonImage[0] = class'BTUIResourcePoolHK'.default.Lobby_ChatBtnUp_small_n;
                ButtonChatState.buttonImage[1] = class'BTUIResourcePoolHK'.default.Lobby_ChatBtnUp_small_on;
                ButtonChatState.buttonImage[2] = class'BTUIResourcePoolHK'.default.Lobby_ChatBtnUp_small_n;
                ButtonChatState.buttonImage[3] = class'BTUIResourcePoolHK'.default.Lobby_ChatBtnUp_small_cli;
                ButtonChatState.buttonImage[4] = class'BTUIResourcePoolHK'.default.Lobby_ChatBtnUp_small_block;
                ButtonChatState.buttonImage[5] = class'BTUIResourcePoolHK'.default.Lobby_ChatBtnUp_small_on;
                i = 0;
                J0x57f:
                // End:0x6f2 [While If]
                if(i < ButtonChatStateArray.Length)
                {
                    ButtonChatStateArray[i].SetVisibility(false);
                    ButtonChatStateArray[i].bAcceptsInput = false;
                    ButtonChatStateArray[i].buttonImage[0] = class'BTUIResourcePoolHK'.default.Lobby_ChatBtn_small_n;
                    ButtonChatStateArray[i].buttonImage[1] = class'BTUIResourcePoolHK'.default.Lobby_ChatBtn_small_on;
                    ButtonChatStateArray[i].buttonImage[2] = class'BTUIResourcePoolHK'.default.Lobby_ChatBtn_small_n;
                    ButtonChatStateArray[i].buttonImage[3] = class'BTUIResourcePoolHK'.default.Lobby_ChatBtn_small_cli;
                    ButtonChatStateArray[i].buttonImage[4] = class'BTUIResourcePoolHK'.default.Lobby_ChatBtn_small_block;
                    ButtonChatStateArray[i].buttonImage[5] = class'BTUIResourcePoolHK'.default.Lobby_ChatBtn_small_on;
                    ButtonChatStateArray[i].SetDefaultFontColor();
                    ButtonChatStateArray[i].AWinPos = fbButtonChatStateArray[i];
                    ButtonChatStateArray[i].ApplyAWinPos();
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0x57f;
                }
                bShowAni = false;
            }
        }
    }
    return false;
}

defaultproperties
{
    fChatTab[0]=(X1=10.0,Y1=518.0,X2=113.0,Y2=550.0)
    fChatTab[1]=(X1=114.0,Y1=518.0,X2=217.0,Y2=550.0)
    fChatTab[2]=(X1=218.0,Y1=518.0,X2=321.0,Y2=550.0)
    TabControl=mTabControl
    OnPostDraw=Internal_OnPostDraw
    OnPreDraw=Internal_OnPreDraw
    OnDeActivate=Internal_DeActivate
}