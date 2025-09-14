/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfare\Classes\BTPageCharacterCreation.uc
 * Package Imports:
 *	GUIWarfare
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:38
 *	Functions:21
 *
 *******************************************************************************/
class BTPageCharacterCreation extends BTNetGUIPageHK
    dependson(BTPageCharacterCreation_TcpLogin)
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTTPTopMenuSCHK TPTopMenu;
var export editinline BTModelHK UIModel;
var BTROModelNew CharacterModel;
var FloatBox fbModelBG;
var FloatBox fbUIModel;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbButtonLR;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbButtonRR;
var export editinline BTOwnerDrawCaptionButtonHK ButtonLR;
var export editinline BTOwnerDrawCaptionButtonHK ButtonRR;
var bool bRRMousePressed;
var bool bLRMousePressed;
var export editinline BTOwnerDrawImageHK BackgroundDeco;
var Image CharacterCreationBgDeco;
var FloatBox fbBGDeco;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbButtonConfirm;
var localized string strButtonConfirm;
var export editinline BTOwnerDrawCaptionButtonHK ButtonConfirm;
var localized string strEditNickName;
var localized string strLabelNickName;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbEditNickName;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelNickName;
var export editinline BTEditBoxHK EditNickName;
var export editinline BTOwnerDrawImageHK LabelNickName;
var FloatBox fbAFTeamBtn;
var FloatBox fbRSATeamBtn;
var localized string strAF;
var localized string strRSA;
var export editinline BTOwnerDrawCaptionButtonHK ButtonAF;
var export editinline BTOwnerDrawCaptionButtonHK ButtonRSA;
var Image NickNameDeco;
var BTRODecorateStringHK NickNameToolTip;
var FloatBox fbToolTip;
var localized string strNickNameToolTip;
var wGameManager GameMgr;
var localized string strErrorList[3];
var bool bVisibleAFModel;
var int nOldMouseX;
var int nOffsetMouseDis;

function bool HeaderButton_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    switch(btn.ButtonID)
    {
        // End:0x5c
        case 5:
            Controller.OpenMenu("GUIWarfareControls.BTWindowOptionHK");
            // End:0x6d
            break;
        // End:0x6a
        case 6:
            OpenTodayResultPage();
            // End:0x6d
            break;
        // End:0xffff
        default:
            return true;
    }
}

function BTTcpLink_Login GetTcpLogin()
{
    local BTPageCharacterCreation_TcpLogin TCP;

    TCP = new class'BTPageCharacterCreation_TcpLogin';
    TCP.Owner = self;
    return TCP;
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    TPTopMenu.__HeaderButton_OnClick__Delegate = HeaderButton_OnClick;
    TPTopMenu.RemoveComponent(TPTopMenu.ButtonRefresh);
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    bVisibleAFModel = true;
    BackgroundDeco = NewLabelComponent(fbBGDeco, CharacterCreationBgDeco, 0.10);
    AppendComponent(BackgroundDeco);
    ButtonLR = NewButtonComponent(fbButtonLR, 0.80);
    ButtonLR.SetDefaultLRotateButtonImage();
    ButtonLR.__OnMousePressed__Delegate = ButtonLR_OnPressed;
    ButtonLR.__OnMouseRelease__Delegate = ButtonLR_OnRelease;
    ButtonRR = NewButtonComponent(fbButtonRR, 0.80);
    ButtonRR.SetDefaultRRotateButtonImage();
    ButtonRR.__OnMousePressed__Delegate = ButtonRR_OnPressed;
    ButtonRR.__OnMouseRelease__Delegate = ButtonRR_OnRelease;
    AppendComponent(ButtonLR);
    AppendComponent(ButtonRR);
    ButtonAF = NewButtonComponent(fbAFTeamBtn, 0.80);
    ButtonAF.SetTabButtonFontColor();
    ButtonAF.SetSmallTabButtonImage();
    ButtonAF.Caption = strAF;
    ButtonAF.__OnClick__Delegate = ButtonAF_OnClick;
    ButtonAF.bSelect = true;
    ButtonAF.bSelectHighlight = true;
    ButtonRSA = NewButtonComponent(fbRSATeamBtn, 0.80);
    ButtonRSA.SetTabButtonFontColor();
    ButtonRSA.SetSmallTabButtonImage();
    ButtonRSA.Caption = strRSA;
    ButtonRSA.__OnClick__Delegate = ButtonRSA_OnClick;
    AppendComponent(ButtonAF);
    AppendComponent(ButtonRSA);
    CharacterModel = Controller.ViewportOwner.Actor.Level.Spawn(class'BTROModelNew');
    CharacterModel.Init();
    CharacterModel.AWinPos = fbUIModel;
    UIModel = BTModelHK(NewComponent(new class'BTModelHK', fbUIModel));
    UIModel.bAcceptsInput = false;
    LabelNickName = NewLabelComponent(fbLabelNickName, class'BTUIResourcePoolHK'.default.empty);
    LabelNickName.Caption = strLabelNickName;
    LabelNickName.CaptionDrawType = 5;
    EditNickName = BTEditBoxHK(NewComponent(new class'BTEditBoxHK', fbEditNickName));
    EditNickName.SetFontColorAll(class'Canvas'.static.MakeColor(162, byte(255), 0, byte(255)));
    EditNickName.SetTextSelect(strEditNickName, true);
    EditNickName.MaxTextStrNum = 15;
    AppendComponent(LabelNickName);
    AppendComponent(EditNickName);
    ButtonConfirm = NewButtonComponent(fbButtonConfirm);
    ButtonConfirm.Caption = strButtonConfirm;
    ButtonConfirm.SetDefaultButtonImage();
    ButtonConfirm.__OnClick__Delegate = ButtonConfirm_OnClick;
    NickNameToolTip = new class'BTRODecorateStringHK';
    NickNameToolTip.Init();
    NickNameToolTip.OriginalString.FontDrawType = 3;
    NickNameToolTip.OriginalString.DrawColor = class'Canvas'.static.MakeColorNoEmpty(byte(255), 204, 0, byte(255));
    NickNameToolTip.OriginalString.Text = strNickNameToolTip;
    NickNameToolTip.BackgroundImg = NickNameDeco;
    NickNameToolTip.AWinPos = fbToolTip;
}

function InternalOnOpen()
{
    UnresolvedNativeFunction_97("BTPageCharacterCreation::InternalOnOpen()");
    Log("[BTPageCharacterCreation::InternalOnOpen]");
    CharacterModel.BeginModel();
}

function InternalOnClose(optional bool bCanceled)
{
    UnresolvedNativeFunction_97("BTPageCharacterCreation::InternalOnClose()");
    Log("[BTPageCharacterCreation::InternalOnClose]");
    CharacterModel.Destroy();
    CharacterModel = none;
    OnClose(bCanceled);
}

function int GetStringCount(string Text)
{
    local string oneChar;
    local int one, sum, i;
    local string DenyCharSet;

    DenyCharSet = " `~!@#$%^&*()_+-={}|[],./<>?:'\\"\\;";
    sum = 0;
    i = 0;
    J0x37:
    // End:0xf3 [While If]
    if(i < Len(Text))
    {
        oneChar = Mid(Text, i, 1);
        // End:0xe3
        if(InStr(DenyCharSet, oneChar) < 0)
        {
            one = Asc(oneChar);
            // End:0xd7
            if(one >= 65 && one <= 90 || one >= 97 && one <= 122 || one >= 48 && one <= 57)
            {
                sum += 1;
            }
            // End:0xe0
            else
            {
                sum += 2;
            }
        }
        // End:0xe9
        else
        {
            return -1;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x37;
    }
    return sum;
}

function bool Internal_OnPreDraw(Canvas C)
{
    UIModel.cModel = CharacterModel;
    // End:0x37
    if(bLRMousePressed)
    {
        CharacterModel.PawnRot.Yaw += 100;
    }
    // End:0x57
    else
    {
        // End:0x57
        if(bRRMousePressed)
        {
            CharacterModel.PawnRot.Yaw -= 100;
        }
    }
    CharRotByDrag();
    return false;
}

function CharRotByDrag()
{
    local int i;

    // End:0x5f
    if(Controller.MouseX < UIModel.AWinPos.X1 || Controller.MouseX > UIModel.AWinPos.X2)
    {
        UIModel.bLMouseDn = false;
    }
    // End:0xbe
    if(Controller.MouseY < UIModel.AWinPos.Y1 || Controller.MouseY > UIModel.AWinPos.Y2)
    {
        UIModel.bLMouseDn = false;
    }
    UIModel.bAcceptsInput = true;
    // End:0x117
    if(ButtonLR.IsInBounds() || ButtonRR.IsInBounds())
    {
        UIModel.bLMouseDn = false;
        UIModel.bAcceptsInput = false;
    }
    // End:0x166
    if(UIModel.bLMouseDn)
    {
        nOffsetMouseDis = int(float(nOldMouseX) - Controller.MouseX);
        CharacterModel.PawnRot.Yaw += nOffsetMouseDis * 100;
    }
    nOldMouseX = int(Controller.MouseX);
}

function ButtonLR_OnPressed(GUIComponent Sender, bool bRepeat)
{
    bRRMousePressed = true;
}

function ButtonLR_OnRelease(GUIComponent Sender)
{
    bRRMousePressed = false;
}

function ButtonRR_OnPressed(GUIComponent Sender, bool bRepeat)
{
    bLRMousePressed = true;
}

function ButtonRR_OnRelease(GUIComponent Sender)
{
    bLRMousePressed = false;
}

function bool ButtonAF_OnClick(GUIComponent Sender)
{
    CharacterModel.ChangeTeam(0);
    ButtonAF.bSelect = true;
    ButtonAF.bSelectHighlight = true;
    ButtonRSA.bSelect = false;
    ButtonRSA.bSelectHighlight = false;
    return true;
}

function bool ButtonRSA_OnClick(GUIComponent Sender)
{
    CharacterModel.ChangeTeam(1);
    ButtonAF.bSelect = false;
    ButtonAF.bSelectHighlight = false;
    ButtonRSA.bSelect = true;
    ButtonRSA.bSelectHighlight = true;
    return true;
}

function bool ButtonConfirm_OnClick(GUIComponent Sender)
{
    local int temp;
    local string filter;

    // End:0x14
    if(EditNickName.bReadOnly)
    {
        return true;
    }
    // End:0x60
    if(EditNickName.TextStr == self.strEditNickName || EditNickName.TextStr == "")
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 12);
        return true;
    }
    // End:0xc1
    if(Controller.ViewportOwner.Actor.Level.GameMgr.ContainsBadNicks(EditNickName.TextStr, filter))
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 101);
        return true;
    }
    temp = IsCorrectUserName(EditNickName.TextStr);
    // End:0x120
    if(temp == -1 || EditNickName.TextStr == "none")
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 13);
        return true;
    }
    // End:0x152
    else
    {
        // End:0x152
        if(temp > 16 || temp < 4)
        {
            class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 14);
            return true;
        }
    }
    // End:0x181
    if(IsInIncompleteLetter(EditNickName.TextStr))
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 160);
        return true;
    }
    EditNickName.bAcceptsInput = false;
    EditNickName.bReadOnly = true;
    PlayerOwner().SendWebLog(4090, -1);
    page_Main.TcpLogin.sfReqCreateChar(EditNickName.TextStr, 12011, 11107, 13007);
    return true;
}

function rfAckCreateChar(int Success, string ErrMsg)
{
    local int webLogFailCode;

    // End:0x19
    if(Success == 0)
    {
        webLogFailCode = -1;
    }
    // End:0x20
    else
    {
        webLogFailCode = 0;
    }
    PlayerOwner().SendWebLog(4100, webLogFailCode);
    Log("[BTPageCharacterCreation::rfAckCreateChar] Success=" $ string(Success) $ " " $ "ErrMsg=" $ ErrMsg);
    // End:0x1e7
    if(Success == 0)
    {
        page_Main.rMM.My_szName = EditNickName.TextStr;
        page_Main.rMM.kUserName = EditNickName.TextStr;
        page_Main.rMM.kCharacterCreation = true;
        page_Main.rMM.kInterfaceGuideStep = 1;
        page_Main.rMM.kFirstTutorial = true;
        // End:0x1a0
        if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild())
        {
            page_Main.TcpLogin.sfReqLoginInHouseTest(page_Main.AuthLogin_AccountID, "battery", page_Main.AuthLogin_GUID);
        }
        // End:0x1e2
        else
        {
            page_Main.TcpLogin.sfReqLoginInHouseTest(page_Main.szAccountName, page_Main.szLoginPassword, page_Main.AuthLogin_GUID);
        }
        return;
    }
    // End:0x296
    else
    {
        // End:0x20b
        if(Success == 1)
        {
            class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 15);
        }
        // End:0x296
        else
        {
            // End:0x230
            if(Success == 7)
            {
                class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 14);
            }
            // End:0x296
            else
            {
                // End:0x255
                if(Success == 8)
                {
                    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 206);
                }
                // End:0x296
                else
                {
                    // End:0x280
                    if(Success == 846)
                    {
                        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 846);
                    }
                    // End:0x296
                    else
                    {
                        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 16);
                    }
                }
            }
        }
    }
    EditNickName.bAcceptsInput = true;
    EditNickName.bReadOnly = false;
}

function bool ForceDisconnect_OnOK(GUIComponent Sender)
{
    Log("[BTPageCharacterCreation::ForceDisconnect_OnOK]");
    page_Main.TcpLogin.sfReqProcessPreLoginUser(page_Main.rMM.kUserName, 0);
    Controller.CloseMenu(false);
    return true;
}

function bool Exit_OnOK(GUIComponent Sender)
{
    Log("[BTPageCharacterCreation::Exit_OnOK]");
    page_Main.TcpLogin.sfReqLogOut(4);
    return true;
}

function bool rfAckLoginInHouseTest(byte Sucess, string CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, byte NeedChar, string ErrMsg, string BDay, byte Sex, BtrDouble ServerTime)
{
    Log("[BTPageCharacterCreation::rfAckLoginInHouseTest] " $ string(Sucess) $ " " $ CharName $ " " $ string(TimeStamp) $ " " $ string(LoginHash1) $ " " $ string(LoginHash2) $ " " $ string(LoginHash3) $ " " $ string(LoginHash4) $ " " $ string(LoginHash5) $ " " $ string(NeedChar) $ " " $ ErrMsg $ " " $ BDay $ " " $ string(Sex));
    // End:0x256
    if(Sucess == 0)
    {
        page_Main.BirthDay = BDay;
        page_Main.Sex = Sex;
        page_Main.LoginTimeStamp = TimeStamp;
        page_Main.LoginHash1 = LoginHash1;
        page_Main.LoginHash2 = LoginHash2;
        page_Main.LoginHash3 = LoginHash3;
        page_Main.LoginHash4 = LoginHash4;
        page_Main.LoginHash5 = LoginHash5;
        // End:0x1d3
        if(NeedChar == 0)
        {
            UnresolvedNativeFunction_97("NeedChar :" $ string(NeedChar));
            UnresolvedNativeFunction_97("Character name : NULL");
            page_Main.SetPage(4, true);
        }
        // End:0x253
        else
        {
            UnresolvedNativeFunction_97("NeedChar :" $ string(NeedChar));
            UnresolvedNativeFunction_97("Character name :" $ CharName);
            page_Main.rMM.My_szName = CharName;
            page_Main.rMM.kUserName = CharName;
            page_Main.SetPage(5, true);
        }
    }
    // End:0x451
    else
    {
        // End:0x32d
        if(Sucess == 50)
        {
            page_Main.rMM.My_szName = CharName;
            page_Main.rMM.kUserName = CharName;
            class'BTWindowDefineSelectHK'.static.ShowInfo(Controller, 0, CharName);
            BTWindowDefineSelectHK(Controller.TopPage()).ButtonCancel.Caption = strExit;
            BTWindowDefineSelectHK(Controller.TopPage()).__OnOK__Delegate = ForceDisconnect_OnOK;
            BTWindowDefineSelectHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
        }
        // End:0x451
        else
        {
            // End:0x376
            if(Sucess == 1)
            {
                class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 5);
                BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
            }
            // End:0x451
            else
            {
                // End:0x3c0
                if(Sucess == 2)
                {
                    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 2);
                    BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
                }
                // End:0x451
                else
                {
                    // End:0x40a
                    if(Sucess == 3)
                    {
                        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 3);
                        BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
                    }
                    // End:0x451
                    else
                    {
                        // End:0x451
                        if(Sucess == 15)
                        {
                            class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 4);
                            BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
                        }
                    }
                }
            }
        }
    }
    return true;
}

function bool rfAckProcessPreLoginUser(int Result, string ErrMsg)
{
    Log("[BTPageCharacterCreation::rfAckProcessPreLoginUser] Result=" $ string(Result));
    // End:0x91
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        BTWindowErrorDefineHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
        return true;
    }
    // End:0xfe
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild())
    {
        page_Main.TcpLogin.sfReqLoginInHouseTest(page_Main.AuthLogin_AccountID, "battery", page_Main.AuthLogin_GUID);
    }
    // End:0x140
    else
    {
        page_Main.TcpLogin.sfReqLoginInHouseTest(page_Main.szAccountName, page_Main.szLoginPassword, page_Main.AuthLogin_GUID);
    }
    return true;
}

function Internal_OnRendered(Canvas Canvas)
{
    local int MousePosX, MousePosY;

    MousePosX = int(Controller.MouseY);
    MousePosY = int(Controller.MouseY);
    // End:0xaf
    if(fbEditNickName.X1 < float(MousePosX) && fbEditNickName.X2 > float(MousePosX) && fbEditNickName.Y1 < float(MousePosY) && fbEditNickName.Y2 > float(MousePosY))
    {
        NickNameToolTip.bNeedUpdate = true;
        NickNameToolTip.Render(Canvas);
    }
}

defaultproperties
{
    begin object name=mTPTopMenu class=BTTPTopMenuSCHK
        bUseAWinPos=true
        AWinPos=(X1=454.0,Y1=0.0,X2=1016.0,Y2=70.0)
    object end
    // Reference: BTTPTopMenuSCHK'BTPageCharacterCreation.mTPTopMenu'
    TPTopMenu=mTPTopMenu
    fbModelBG=(X1=383.0,Y1=81.0,X2=647.0,Y2=625.0)
    fbUIModel=(X1=389.0,Y1=81.0,X2=642.0,Y2=625.0)
    fbButtonLR=(X1=557.0,Y1=551.0,X2=608.0,Y2=582.0)
    fbButtonRR=(X1=421.0,Y1=551.0,X2=472.0,Y2=582.0)
    CharacterCreationBgDeco=(X=0.0,Y=0.0,width=1024.0,Height=768.0,Image=Texture'Warfare_GP_UI_UI.Common.img_charactercreate_bgdeco',DrawType=28,DrawColor=(R=255,G=255,B=255,A=255),DrawShadowColor=(R=0,G=0,B=0,A=255))
    fbBGDeco=(X1=0.0,Y1=0.0,X2=1024.0,Y2=768.0)
    fbButtonConfirm=(X1=450.0,Y1=695.0,X2=574.0,Y2=732.0)
    strButtonConfirm="Confirm"
    strEditNickName="Enter your nickname."
    strLabelNickName="Nick Name"
    fbEditNickName=(X1=418.0,Y1=659.0,X2=687.0,Y2=677.0)
    fbLabelNickName=(X1=259.0,Y1=660.0,X2=398.0,Y2=675.0)
    fbAFTeamBtn=(X1=408.0,Y1=43.0,X2=511.0,Y2=75.0)
    fbRSATeamBtn=(X1=512.0,Y1=43.0,X2=615.0,Y2=75.0)
    strAF="AF"
    strRSA="RSA"
    NickNameDeco=(X=0.0,Y=0.0,width=475.0,Height=51.0,Image=Texture'Warfare_GP_UI_UI.Common.img_charactercreate_nametipbg',DrawType=28,DrawColor=(R=255,G=255,B=255,A=255),DrawShadowColor=(R=0,G=0,B=0,A=255))
    fbToolTip=(X1=274.0,Y1=593.0,X2=749.0,Y2=644.0)
    strNickNameToolTip="15 character limit with no special characters."
    strErrorList[0]="That ID already exists."
    strErrorList[1]="Character Creation Error"
    strErrorList[2]="(0) successful, (1) DB error, (2,3) no ID, (50) already in use"
    bSkipInitializeDefaultPage=true
    bPersistent=true
    OnOpen=InternalOnOpen
    OnClose=InternalOnClose
    OnRendered=Internal_OnRendered
}