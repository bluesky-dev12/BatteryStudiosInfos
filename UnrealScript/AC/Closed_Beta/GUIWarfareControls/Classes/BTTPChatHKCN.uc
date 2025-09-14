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
    fb.X1 = 101.0000000;
    fb.Y1 = 710.0000000;
    fb.X2 = 460.0000000;
    fb.Y2 = 736.0000000;
    BackgroundImage[1] = NewLabelComponent(fb, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Lobby_Chat_Input_Bg);
    i = 0;
    J0xD2:

    // End:0x3E5 [Loop If]
    if(i < 3)
    {
        serverButton = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
        serverButton.bUseAWinPos = true;
        // End:0x122
        if(i == 0)
        {
            serverButton.AWinPos = fChatTab[0];            
        }
        else
        {
            // End:0x147
            if(i == 1)
            {
                serverButton.AWinPos = fChatTab[2];                
            }
            else
            {
                serverButton.AWinPos = fChatTab[1];
            }
        }
        serverButton.RenderWeight = 0.5000000;
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
        serverACL = new Class'GUIWarfareControls_Decompressed.BTAutoScrollListHK';
        serverACL.bUseAWinPos = true;
        fb.X1 = 19.0000000;
        fb.Y1 = 557.0000000;
        fb.X2 = 439.0000000;
        fb.Y2 = 703.0000000;
        serverACL.AWinPos = fb;
        serverACL.bBoundToParent = false;
        serverACL.bScaleToParent = false;
        serverACL.RenderWeight = 0.5000000;
        serverACL.InitComponent(Controller, self);
        AppendComponent(serverACL);
        fb.X1 = 447.0000000;
        fb.Y1 = 554.0000000;
        fb.X2 = 459.0000000;
        fb.Y2 = 707.0000000;
        serverACL.MultiColumnList.MyScrollBar.AWinPos = fb;
        ASLChat[i] = serverACL;
        ASLChat[i].SelectImage.Image = none;
        TabControl.BindTabButtonAndPanel(ButtonChat[i], ASLChat[i]);
        ButtonChat[i].__OnClick__Delegate = ButttonChat_OnClick;
        i++;
        // [Loop Continue]
        goto J0xD2;
    }
    ButtonChat[1].bVisible = false;
    fb.X1 = ((AWinPos.X1 + float(2)) + float(86)) + float(5);
    fb.Y1 = ((AWinPos.Y2 - float(2)) - float(25)) + float(4);
    fb.X2 = AWinPos.X2 - float(4);
    fb.Y2 = (AWinPos.Y2 - float(2)) - float(1);
    InputBox = BTChatEditBoxHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTChatEditBoxHK', fb));
    InputBox.bUseAWinPos = true;
    InputBox.bUseAWinPos = true;
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
    ButtonChatState = NewButtonComponent(Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(13.0000000, 710.0000000, 99.0000000, 738.0000000), 0.9900000);
    ButtonChatState.buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Lobby_ChatBtn_small_n;
    ButtonChatState.buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Lobby_ChatBtn_small_on;
    ButtonChatState.buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Lobby_ChatBtn_small_n;
    ButtonChatState.buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Lobby_ChatBtn_small_cli;
    ButtonChatState.buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Lobby_ChatBtn_small_block;
    ButtonChatState.buttonImage[5] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Lobby_ChatBtn_small_on;
    ButtonChatState.Caption = strAll;
    ButtonChatState.__OnClick__Delegate = ButtonChatState_OnClick;
    ButtonChatStateArray.Length = 2;
    fbButtonChatStateArray.Length = 2;
    fbSnapShotButtonChatStateArray.Length = 2;
    i = 0;
    J0x6B8:

    // End:0x936 [Loop If]
    if(i < 2)
    {
        ButtonChatStateArray[i] = NewButtonComponent(ButtonChatState.AWinPos, 0.9500000);
        ButtonChatStateArray[i].buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Lobby_ChatBtn_small_n;
        ButtonChatStateArray[i].buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Lobby_ChatBtn_small_on;
        ButtonChatStateArray[i].buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Lobby_ChatBtn_small_n;
        ButtonChatStateArray[i].buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Lobby_ChatBtn_small_cli;
        ButtonChatStateArray[i].buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Lobby_ChatBtn_small_block;
        ButtonChatStateArray[i].buttonImage[5] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Lobby_ChatBtn_small_on;
        ButtonChatStateArray[i].Caption = strChatState[i + 1];
        ButtonChatStateArray[i].ButtonID = i + 1;
        ButtonChatStateArray[i].__OnClick__Delegate = ButtonChatStateArray_OnClick;
        ButtonChatStateArray[i].SetVisibility(false);
        ButtonChatStateArray[i].bAcceptsInput = false;
        fbButtonChatStateArray[i] = ButtonChatState.AWinPos;
        fbButtonChatStateArray[i].Y1 = ButtonChatState.AWinPos.Y1 - (((ButtonChatState.AWinPos.Y2 - ButtonChatState.AWinPos.Y1) + float(5)) * float(i + 1));
        fbButtonChatStateArray[i].Y2 = ButtonChatState.AWinPos.Y2 - (((ButtonChatState.AWinPos.Y2 - ButtonChatState.AWinPos.Y1) + float(5)) * float(i + 1));
        i++;
        // [Loop Continue]
        goto J0x6B8;
    }
    ButtonChatStateArray[0].ButtonID = 1;
    ButtonChatStateArray[1].ButtonID = 2;
    ButtonChatStateArray[0].Caption = strChatState[1];
    ButtonChatStateArray[1].Caption = strChatState[2];
    bShowChatState = false;
    FocusFirst(InputBox);
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
    // End:0x1F0
    if(bShowChatState)
    {
        i = 0;
        J0x8F:

        // End:0x1F0 [Loop If]
        if(i < ButtonChatStateArray.Length)
        {
            ButtonChatStateArray[i].SetVisibility(true);
            ButtonChatStateArray[i].bAcceptsInput = true;
            ButtonChatStateArray[i].buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Lobby_ChatBtn_small_n;
            ButtonChatStateArray[i].buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Lobby_ChatBtn_small_on;
            ButtonChatStateArray[i].buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Lobby_ChatBtn_small_n;
            ButtonChatStateArray[i].buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Lobby_ChatBtn_small_cli;
            ButtonChatStateArray[i].buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Lobby_ChatBtn_small_block;
            ButtonChatStateArray[i].buttonImage[5] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Lobby_ChatBtn_small_on;
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

function bool Internal_OnPreDraw(Canvas C)
{
    local int i;
    local float CurrentTime, ElapsedTime, perc;
    local FloatBox fb, fb2;

    saveC = C;
    // End:0x57E
    if(bShowAni)
    {
        CurrentTime = PlayerOwner().Level.TimeSeconds + StartAniTimeOffset;
        ElapsedTime = CurrentTime - StartAniTime;
        // End:0x2E0
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

                // End:0x2D5 [Loop If]
                if(i < ButtonChatStateArray.Length)
                {
                    ButtonChatStateArray[i].SetVisibility(true);
                    ButtonChatStateArray[i].bAcceptsInput = true;
                    ButtonChatStateArray[i].buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Lobby_ChatBtn_small_n;
                    ButtonChatStateArray[i].buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Lobby_ChatBtn_small_on;
                    ButtonChatStateArray[i].buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Lobby_ChatBtn_small_n;
                    ButtonChatStateArray[i].buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Lobby_ChatBtn_small_cli;
                    ButtonChatStateArray[i].buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Lobby_ChatBtn_small_block;
                    ButtonChatStateArray[i].buttonImage[5] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Lobby_ChatBtn_small_on;
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
            // End:0x3FC
            if(ElapsedTime < SlideAniTime)
            {
                perc = ElapsedTime / SlideAniTime;
                perc = 1.0000000 - perc;
                i = 0;
                J0x31A:

                // End:0x3F9 [Loop If]
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
                    goto J0x31A;
                }                
            }
            else
            {
                i = 0;
                J0x403:

                // End:0x576 [Loop If]
                if(i < ButtonChatStateArray.Length)
                {
                    ButtonChatStateArray[i].SetVisibility(false);
                    ButtonChatStateArray[i].bAcceptsInput = false;
                    ButtonChatStateArray[i].buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Lobby_ChatBtn_small_n;
                    ButtonChatStateArray[i].buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Lobby_ChatBtn_small_on;
                    ButtonChatStateArray[i].buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Lobby_ChatBtn_small_n;
                    ButtonChatStateArray[i].buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Lobby_ChatBtn_small_cli;
                    ButtonChatStateArray[i].buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Lobby_ChatBtn_small_block;
                    ButtonChatStateArray[i].buttonImage[5] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Lobby_ChatBtn_small_on;
                    ButtonChatStateArray[i].SetDefaultFontColor();
                    ButtonChatStateArray[i].AWinPos = fbButtonChatStateArray[i];
                    ButtonChatStateArray[i].ApplyAWinPos();
                    i++;
                    // [Loop Continue]
                    goto J0x403;
                }
                bShowAni = false;
            }
        }
    }
    return false;
    //return;    
}

defaultproperties
{
    fChatTab[0]=(X1=10.0000000,Y1=518.0000000,X2=113.0000000,Y2=550.0000000)
    fChatTab[1]=(X1=114.0000000,Y1=518.0000000,X2=217.0000000,Y2=550.0000000)
    fChatTab[2]=(X1=218.0000000,Y1=518.0000000,X2=321.0000000,Y2=550.0000000)
    // Reference: TabControlMocker'GUIWarfareControls_Decompressed.BTTPChatHKCN.mTabControl'
    begin object name="mTabControl" class=GUIWarfareControls_Decompressed.TabControlMocker
    end object
    TabControl=mTabControl
    OnPostDraw=BTTPChatHKCN.Internal_OnPostDraw
    OnPreDraw=BTTPChatHKCN.Internal_OnPreDraw
    OnDeActivate=BTTPChatHKCN.Internal_DeActivate
}