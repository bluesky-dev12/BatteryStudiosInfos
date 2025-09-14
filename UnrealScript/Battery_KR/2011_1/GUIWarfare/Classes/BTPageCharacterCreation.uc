class BTPageCharacterCreation extends BTNetGUIPageHK
    editinlinenew
    instanced;

var wGameManager GameMgr;
var localized string strErrorList[3];
var() automated FloatBox fbLeftPanel;
var() automated FloatBox fbEdgeLine;
var() automated FloatBox fbUIModel;
var() automated FloatBox fbAFTeamBG;
var() automated FloatBox fbRSATeamBG;
var() automated FloatBox fbButtonLR;
var() automated FloatBox fbButtonRR;
var() automated FloatBox fbButtonAF;
var() automated FloatBox fbButtonRSA;
var() automated FloatBox fbRightPanel;
var() automated FloatBox fbLabelLine[4];
var() automated FloatBox fbButtonEquipLeft[3];
var() automated FloatBox fbButtonEquipRight[3];
var() automated FloatBox fbDefaultItemBox[3];
var() automated FloatBox fbLabelNickName;
var() automated FloatBox fbEditNickName;
var() automated FloatBox fbButtonConfirm;
var() automated int HelmetList[3];
var() automated int FaceList[3];
var() automated int AccessoryList[3];
var export editinline BTOwnerDrawImageHK LeftPanel;
var() automated ButtonGroups InvenGroup;
var export editinline BTOwnerDrawCaptionButtonHK ButtonAF;
var export editinline BTOwnerDrawCaptionButtonHK ButtonRSA;
var bool bLRMousePressed;
var export editinline BTOwnerDrawCaptionButtonHK ButtonLR;
var bool bRRMousePressed;
var export editinline BTOwnerDrawCaptionButtonHK ButtonRR;
var export editinline BTOwnerDrawImageHK EdgeLine;
var export editinline BTOwnerDrawImageHK AFTeamBG;
var export editinline BTOwnerDrawImageHK RSATeamBG;
var bool bVisibleAFModel;
var localized string strAF;
var localized string strRSA;
var export editinline BTModelHK UIModel;
var BTROModelNew CharacterModel;
var export editinline BTOwnerDrawImageHK RightPanel;
var localized string strLabelLine[4];
var localized string strButtonConfirm;
var export editinline BTOwnerDrawImageHK LabelLine[4];
var export editinline BTOwnerDrawCaptionButtonHK ButtonEquipLeft[3];
var int CurrentDefaultItemIndex[3];
var export editinline BTItemBoxButtonHK DefaultItemBox[3];
var export editinline BTOwnerDrawCaptionButtonHK ButtonEquipRight[3];
var export editinline BTOwnerDrawImageHK LabelNickName;
var export editinline BTEditBoxHK EditNickName;
var localized string strEditNickName;
var export editinline BTOwnerDrawCaptionButtonHK ButtonConfirm;

function bool HeaderButton_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    switch(btn.ButtonID)
    {
        // End:0x27
        case 0:
            // End:0xF3
            break;
        // End:0x40
        case 1:
            page_Main.SetPage(20, false);
            // End:0xF3
            break;
        // End:0x5A
        case 2:
            page_Main.SetPage(21, false);
            // End:0xF3
            break;
        // End:0x74
        case 3:
            page_Main.SetPage(22, false);
            // End:0xF3
            break;
        // End:0x7C
        case 5:
            // End:0xF3
            break;
        // End:0x84
        case 6:
            // End:0xF3
            break;
        // End:0x8C
        case 7:
            // End:0xF3
            break;
        // End:0xA3
        case 8:
            page_Main.ShowHelpWindow();
            // End:0xF3
            break;
        // End:0xD3
        case 9:
            Controller.OpenMenu("GUIWarfare.BTPageOption");
            // End:0xF3
            break;
        // End:0xF0
        case 10:
            Controller.ConsoleCommand("exit");
            // End:0xF3
            break;
        // End:0xFFFF
        default:
            break;
    }
    return true;
    //return;    
}

function BTTcpLink_Login GetTcpLogin()
{
    local BTPageCharacterCreation_TcpLogin TCP;

    TCP = new Class'GUIWarfare_Decompressed.BTPageCharacterCreation_TcpLogin';
    TCP.Owner = self;
    return TCP;
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    TPTopMenu.Quest.DisableMe();
    TPTopMenu.MyInfo.DisableMe();
    TPTopMenu.PostBox.DisableMe();
    TPTopMenu.Inventory.DisableMe();
    TPTopMenu.Shop.DisableMe();
    TPTopMenu.Auction.DisableMe();
    TPTopMenu.Clan.DisableMe();
    TPTopMenu.Option.DisableMe();
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    TPTopMenu.__HeaderButton_OnClick__Delegate = HeaderButton_OnClick;
    LeftPanel = NewLabelComponent(fbLeftPanel, Class'GUIWarfareControls.BTUIResourcePoolHK'.default.panel_1);
    RightPanel = NewLabelComponent(fbRightPanel, Class'GUIWarfareControls.BTUIResourcePoolHK'.default.panel_1);
    EdgeLine = NewLabelComponent(fbEdgeLine, Class'GUIWarfareControls.BTUIResourcePoolHK'.default.img_edge_line);
    AFTeamBG = NewLabelComponent(fbAFTeamBG, Class'GUIWarfareControls.BTUIResourcePoolHK'.default.img_AF_cha, 0.1000000);
    RSATeamBG = NewLabelComponent(fbRSATeamBG, Class'GUIWarfareControls.BTUIResourcePoolHK'.default.img_RSA_cha, 0.1000000);
    bVisibleAFModel = true;
    ButtonLR = NewButtonComponent(Class'Engine.BTCustomDrawHK'.static.MakeFloatBox((AFTeamBG.AWinPos.X1 + float(252)) + float(10), (AFTeamBG.AWinPos.Y1 + float(483)) + float(10), (AFTeamBG.AWinPos.X1 + float(304)) + float(10), (AFTeamBG.AWinPos.Y1 + float(536)) + float(10)), 0.8000000);
    ButtonLR.SetDefaultLRotateButtonImage();
    ButtonLR.__OnMousePressed__Delegate = ButtonLR_OnPressed;
    ButtonLR.__OnMouseRelease__Delegate = ButtonLR_OnRelease;
    ButtonRR = NewButtonComponent(Class'Engine.BTCustomDrawHK'.static.MakeFloatBox((AFTeamBG.AWinPos.X1 + float(5)) + float(10), (AFTeamBG.AWinPos.Y1 + float(483)) + float(10), (AFTeamBG.AWinPos.X1 + float(57)) + float(10), (AFTeamBG.AWinPos.Y1 + float(536)) + float(10)), 0.8000000);
    ButtonRR.SetDefaultRRotateButtonImage();
    ButtonRR.__OnMousePressed__Delegate = ButtonRR_OnPressed;
    ButtonRR.__OnMouseRelease__Delegate = ButtonRR_OnRelease;
    ButtonAF = NewButtonComponent(Class'Engine.BTCustomDrawHK'.static.MakeFloatBox((AFTeamBG.AWinPos.X1 + float(25)) + float(10), (AFTeamBG.AWinPos.Y1 + float(525)) + float(10), (AFTeamBG.AWinPos.X1 + float(143)) + float(10), (AFTeamBG.AWinPos.Y1 + float(571)) + float(10)), 0.8000000);
    ButtonAF.SetDefaultFontColor();
    ButtonAF.SetDefaultLRotateAFButtonImage();
    ButtonAF.Caption = strAF;
    ButtonAF.__OnClick__Delegate = ButtonAF_OnClick;
    ButtonRSA = NewButtonComponent(Class'Engine.BTCustomDrawHK'.static.MakeFloatBox((AFTeamBG.AWinPos.X1 + float(166)) + float(10), (AFTeamBG.AWinPos.Y1 + float(525)) + float(10), (AFTeamBG.AWinPos.X1 + float(283)) + float(10), (AFTeamBG.AWinPos.Y1 + float(571)) + float(10)), 0.8000000);
    ButtonRSA.SetDefaultFontColor();
    ButtonRSA.SetDefaultRRotateRSAButtonImage();
    ButtonRSA.Caption = strRSA;
    ButtonRSA.__OnClick__Delegate = ButtonRSA_OnClick;
    CharacterModel = Controller.ViewportOwner.Actor.Level.Spawn(Class'GUIWarfareControls.BTROModelNew');
    CharacterModel.Init();
    CharacterModel.AWinPos = fbUIModel;
    UIModel = BTModelHK(NewComponent(new Class'GUIWarfareControls.BTModelHK', fbUIModel));
    UIModel.bAcceptsInput = false;
    i = 0;
    J0x5D4:

    // End:0x665 [Loop If]
    if(i < 4)
    {
        LabelLine[i] = NewLabelComponent(fbLabelLine[i], Class'GUIWarfareControls.BTUIResourcePoolHK'.default.img_ptitl_back);
        LabelLine[i].Caption = strLabelLine[i];
        LabelLine[i].CaptionPadding[0] = 5;
        LabelLine[i].CaptionDrawType = 3;
        i++;
        // [Loop Continue]
        goto J0x5D4;
    }
    i = 0;
    J0x66C:

    // End:0x779 [Loop If]
    if(i < 3)
    {
        ButtonEquipLeft[i] = NewButtonComponent(fbButtonEquipLeft[i]);
        ButtonEquipLeft[i].SetDefaultLArrowButtonImage();
        ButtonEquipLeft[i].ButtonID = i;
        ButtonEquipLeft[i].__OnClick__Delegate = ButtonEquipLeft_OnClick;
        ButtonEquipRight[i] = NewButtonComponent(fbButtonEquipRight[i]);
        ButtonEquipRight[i].SetDefaultRArrowButtonImage();
        ButtonEquipRight[i].ButtonID = i;
        ButtonEquipRight[i].__OnClick__Delegate = ButtonEquipRight_OnClick;
        DefaultItemBox[i] = BTItemBoxButtonHK(NewComponent(new Class'GUIWarfareControls.BTItemBoxButtonHK', fbDefaultItemBox[i]));
        i++;
        // [Loop Continue]
        goto J0x66C;
    }
    LabelNickName = NewLabelComponent(fbLabelNickName, Class'GUIWarfareControls.BTUIResourcePoolHK'.default.panel_2);
    EditNickName = BTEditBoxHK(NewComponent(new Class'GUIWarfareControls.BTEditBoxHK', fbEditNickName));
    EditNickName.SetTextSelect(strEditNickName, true);
    EditNickName.bLimitDrawSize = true;
    EditNickName.LimitDrawWidth = 105.0000000;
    ButtonConfirm = NewButtonComponent(fbButtonConfirm);
    ButtonConfirm.Caption = strButtonConfirm;
    ButtonConfirm.SetDefaultButtonImage();
    ButtonConfirm.__OnClick__Delegate = ButtonConfirm_OnClick;
    LabelRoomName.ClipArea.X1 = 0.0000000;
    LabelRoomName.ClipArea.Y1 = 192.0000000;
    LabelRoomName.ClipArea.X2 = 387.0000000;
    LabelRoomName.ClipArea.Y2 = 240.0000000;
    //return;    
}

function InternalOnOpen()
{
    __NFUN_270__("BTPageCharacterCreation::InternalOnOpen()");
    Log("[BTPageCharacterCreation::InternalOnOpen]");
    CharacterModel.BeginModel();
    UpdateItemBox();
    //return;    
}

function UpdateItemBox()
{
    local int i;

    DefaultItemBox[0].itemBox.ItemInfo = GameMgr.FindUIItem(HelmetList[CurrentDefaultItemIndex[0]]);
    DefaultItemBox[1].itemBox.ItemInfo = GameMgr.FindUIItem(FaceList[CurrentDefaultItemIndex[1]]);
    DefaultItemBox[2].itemBox.ItemInfo = GameMgr.FindUIItem(AccessoryList[CurrentDefaultItemIndex[2]]);
    i = 0;
    J0xAB:

    // End:0xDF [Loop If]
    if(i < 3)
    {
        DefaultItemBox[i].itemBox.Update();
        i++;
        // [Loop Continue]
        goto J0xAB;
    }
    CharacterModel.ChangeEquipItemByID(0, 0, DefaultItemBox[1].itemBox.ItemInfo.ItemID, DefaultItemBox[1].itemBox.ItemInfo.ItemID, DefaultItemBox[0].itemBox.ItemInfo.ItemID, DefaultItemBox[0].itemBox.ItemInfo.ItemID, DefaultItemBox[2].itemBox.ItemInfo.ItemID, DefaultItemBox[2].itemBox.ItemInfo.ItemID);
    //return;    
}

function InternalOnClose(optional bool bCanceled)
{
    __NFUN_270__("BTPageCharacterCreation::InternalOnClose()");
    Log("[BTPageCharacterCreation::InternalOnClose]");
    CharacterModel.Destroy();
    CharacterModel = none;
    OnClose(bCanceled);
    //return;    
}

function int GetStringCount(string Text)
{
    local string oneChar;
    local int one, sum, i;
    local string DenyCharSet;

    DenyCharSet = " `~!@#$%^&*()_+-={}|[],./<>?:'\"\\;";
    sum = 0;
    i = 0;
    J0x37:

    // End:0xF3 [Loop If]
    if(i < Len(Text))
    {
        oneChar = Mid(Text, i, 1);
        // End:0xE3
        if(InStr(DenyCharSet, oneChar) < 0)
        {
            one = Asc(oneChar);
            // End:0xD7
            if((((one >= 65) && one <= 90) || (one >= 97) && one <= 122) || (one >= 48) && one <= 57)
            {
                sum += 1;                
            }
            else
            {
                sum += 2;
            }
            // [Explicit Continue]
            goto J0xE9;
        }
        return -1;
        J0xE9:

        i++;
        // [Loop Continue]
        goto J0x37;
    }
    return sum;
    //return;    
}

function bool Internal_OnPreDraw(Canvas C)
{
    ChangeVisibleModel(bVisibleAFModel);
    UIModel.cModel = CharacterModel;
    // End:0x3B
    if(bLRMousePressed)
    {
        CharacterModel.SetRotationLeft();        
    }
    else
    {
        // End:0x53
        if(bRRMousePressed)
        {
            CharacterModel.SetRotationRight();
        }
    }
    return false;
    //return;    
}

function ButtonLR_OnPressed(GUIComponent Sender, bool bRepeat)
{
    bRRMousePressed = true;
    //return;    
}

function ButtonLR_OnRelease(GUIComponent Sender)
{
    bRRMousePressed = false;
    //return;    
}

function ButtonRR_OnPressed(GUIComponent Sender, bool bRepeat)
{
    bLRMousePressed = true;
    //return;    
}

function ButtonRR_OnRelease(GUIComponent Sender)
{
    bLRMousePressed = false;
    //return;    
}

function bool ButtonAF_OnClick(GUIComponent Sender)
{
    CharacterModel.ChangeTeam(0);
    ChangeVisibleModel(true);
    return true;
    //return;    
}

function bool ButtonRSA_OnClick(GUIComponent Sender)
{
    CharacterModel.ChangeTeam(1);
    ChangeVisibleModel(false);
    return true;
    //return;    
}

function bool ButtonEquipLeft_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    // End:0x2F
    if((CurrentDefaultItemIndex[btn.ButtonID] - 1) < 0)
    {
        return true;
    }
    CurrentDefaultItemIndex[btn.ButtonID] -= 1;
    UpdateItemBox();
    return true;
    //return;    
}

function bool ButtonEquipRight_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    // End:0x2F
    if((CurrentDefaultItemIndex[btn.ButtonID] + 1) <= 0)
    {
        return true;
    }
    // End:0x8A
    if((btn.ButtonID == 0) && ((CurrentDefaultItemIndex[btn.ButtonID] + 1) >= 3) || HelmetList[CurrentDefaultItemIndex[btn.ButtonID] + 1] <= 0)
    {
        return true;
    }
    // End:0xE5
    if((btn.ButtonID == 1) && ((CurrentDefaultItemIndex[btn.ButtonID] + 1) >= 3) || FaceList[CurrentDefaultItemIndex[btn.ButtonID] + 1] <= 0)
    {
        return true;
    }
    // End:0x141
    if((btn.ButtonID == 2) && ((CurrentDefaultItemIndex[btn.ButtonID] + 1) >= 3) || AccessoryList[CurrentDefaultItemIndex[btn.ButtonID] + 1] <= 0)
    {
        return true;
    }
    CurrentDefaultItemIndex[btn.ButtonID] += 1;
    UpdateItemBox();
    return true;
    //return;    
}

function ChangeVisibleModel(bool bAF)
{
    bVisibleAFModel = bAF;
    // End:0x3B
    if(bVisibleAFModel)
    {
        AFTeamBG.bVisible = true;
        RSATeamBG.bVisible = false;        
    }
    else
    {
        AFTeamBG.bVisible = false;
        RSATeamBG.bVisible = true;
    }
    //return;    
}

function bool ButtonConfirm_OnClick(GUIComponent Sender)
{
    local int Temp;
    local string filter;

    // End:0x14
    if(EditNickName.bReadOnly)
    {
        return true;
    }
    // End:0x60
    if((EditNickName.TextStr == self.strEditNickName) || EditNickName.TextStr == "")
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 12);
        return true;
    }
    // End:0xC1
    if(Controller.ViewportOwner.Actor.Level.GameMgr.ContainsBadNicks(EditNickName.TextStr, filter))
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 101);
        return true;
    }
    Temp = IsCorrectUserName(EditNickName.TextStr);
    // End:0x120
    if((Temp == -1) || EditNickName.TextStr == "none")
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 13);
        return true;        
    }
    else
    {
        // End:0x152
        if((Temp > 16) || Temp < 4)
        {
            Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 14);
            return true;
        }
    }
    // End:0x181
    if(IsInIncompleteLetter(EditNickName.TextStr))
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 160);
        return true;
    }
    EditNickName.bAcceptsInput = false;
    EditNickName.bReadOnly = true;
    page_Main.TcpLogin.sfReqCreateChar(EditNickName.TextStr, FaceList[CurrentDefaultItemIndex[1]], HelmetList[CurrentDefaultItemIndex[0]], AccessoryList[CurrentDefaultItemIndex[2]]);
    return true;
    //return;    
}

function rfAckCreateChar(byte Success, string ErrMsg)
{
    Log(((("[BTPageCharacterCreation::rfAckCreateChar] Success=" $ string(Success)) $ " ") $ "ErrMsg=") $ ErrMsg);
    // End:0x17E
    if(int(Success) == 0)
    {
        page_Main.rMM.My_szName = EditNickName.TextStr;
        page_Main.rMM.kUserName = EditNickName.TextStr;
        page_Main.rMM.kCharacterCreation = true;
        // End:0x137
        if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild())
        {
            page_Main.TcpLogin.sfReqLoginInHouseTest(page_Main.AuthLogin_AccountID, "battery", page_Main.AuthLogin_GUID);            
        }
        else
        {
            page_Main.TcpLogin.sfReqLoginInHouseTest(page_Main.szAccountName, page_Main.szLoginPassword, page_Main.AuthLogin_GUID);
        }
        return;        
    }
    else
    {
        // End:0x1A4
        if(int(Success) == 1)
        {
            Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 15);            
        }
        else
        {
            Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 16);
        }
    }
    EditNickName.bAcceptsInput = true;
    EditNickName.bReadOnly = false;
    //return;    
}

function bool ForceDisconnect_OnOK(GUIComponent Sender)
{
    Log("[BTPageCharacterCreation::ForceDisconnect_OnOK]");
    page_Main.TcpLogin.sfReqProcessPreLoginUser(page_Main.rMM.kUserName, 0);
    Controller.CloseMenu(false);
    return true;
    //return;    
}

function bool Exit_OnOK(GUIComponent Sender)
{
    Log("[BTPageCharacterCreation::Exit_OnOK]");
    Controller.ConsoleCommand("exit");
    return true;
    //return;    
}

function bool rfAckLoginInHouseTest(byte Sucess, string CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, byte NeedChar, string ErrMsg, string BDay, byte Sex, BtrDouble ServerTime)
{
    Log((((((((((((((((((((((("[BTPageCharacterCreation::rfAckLoginInHouseTest] " $ string(Sucess)) $ " ") $ CharName) $ " ") $ string(TimeStamp)) $ " ") $ string(LoginHash1)) $ " ") $ string(LoginHash2)) $ " ") $ string(LoginHash3)) $ " ") $ string(LoginHash4)) $ " ") $ string(LoginHash5)) $ " ") $ string(NeedChar)) $ " ") $ ErrMsg) $ " ") $ BDay) $ " ") $ string(Sex));
    // End:0x256
    if(int(Sucess) == 0)
    {
        page_Main.BirthDay = BDay;
        page_Main.Sex = Sex;
        page_Main.LoginTimeStamp = TimeStamp;
        page_Main.LoginHash1 = LoginHash1;
        page_Main.LoginHash2 = LoginHash2;
        page_Main.LoginHash3 = LoginHash3;
        page_Main.LoginHash4 = LoginHash4;
        page_Main.LoginHash5 = LoginHash5;
        // End:0x1D3
        if(int(NeedChar) == 0)
        {
            __NFUN_270__("NeedChar :" $ string(NeedChar));
            __NFUN_270__("Character name : NULL");
            page_Main.SetPage(4, true);            
        }
        else
        {
            __NFUN_270__("NeedChar :" $ string(NeedChar));
            __NFUN_270__("Character name :" $ CharName);
            page_Main.rMM.My_szName = CharName;
            page_Main.rMM.kUserName = CharName;
            page_Main.SetPage(5, true);
        }        
    }
    else
    {
        // End:0x32D
        if(int(Sucess) == 50)
        {
            page_Main.rMM.My_szName = CharName;
            page_Main.rMM.kUserName = CharName;
            Class'GUIWarfareControls.BTWindowDefineSelectHK'.static.ShowInfo(Controller, 0, CharName);
            BTWindowDefineSelectHK(Controller.TopPage()).ButtonCancel.Caption = strExit;
            BTWindowDefineSelectHK(Controller.TopPage()).__OnOK__Delegate = ForceDisconnect_OnOK;
            BTWindowDefineSelectHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;            
        }
        else
        {
            // End:0x376
            if(int(Sucess) == 1)
            {
                Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 5);
                BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;                
            }
            else
            {
                // End:0x3C0
                if(int(Sucess) == 2)
                {
                    Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 2);
                    BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;                    
                }
                else
                {
                    // End:0x40A
                    if(int(Sucess) == 3)
                    {
                        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 3);
                        BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;                        
                    }
                    else
                    {
                        // End:0x451
                        if(int(Sucess) == 15)
                        {
                            Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 4);
                            BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
                        }
                    }
                }
            }
        }
    }
    return true;
    //return;    
}

function bool rfAckProcessPreLoginUser(int Result, string ErrMsg)
{
    Log("[BTPageCharacterCreation::rfAckProcessPreLoginUser] Result=" $ string(Result));
    // End:0x91
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        BTWindowErrorDefineHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
        return true;
    }
    // End:0xFE
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild())
    {
        page_Main.TcpLogin.sfReqLoginInHouseTest(page_Main.AuthLogin_AccountID, "battery", page_Main.AuthLogin_GUID);        
    }
    else
    {
        page_Main.TcpLogin.sfReqLoginInHouseTest(page_Main.szAccountName, page_Main.szLoginPassword, page_Main.AuthLogin_GUID);
    }
    return true;
    //return;    
}

defaultproperties
{
    strErrorList[0]="?? ???? ??????."
    strErrorList[1]="??? ?? ??"
    strErrorList[2]="???? 0, 1-DB Error, 2,3-no id. 50-?? ???"
    fbLeftPanel=(X1=178.0000000,Y1=96.0000000,X2=507.0000000,Y2=721.0000000)
    fbEdgeLine=(X1=184.0000000,Y1=102.0000000,X2=501.0000000,Y2=715.0000000)
    fbUIModel=(X1=184.0000000,Y1=102.0000000,X2=501.0000000,Y2=715.0000000)
    fbAFTeamBG=(X1=178.0000000,Y1=96.0000000,X2=506.0000000,Y2=720.0000000)
    fbRSATeamBG=(X1=178.0000000,Y1=96.0000000,X2=506.0000000,Y2=720.0000000)
    fbButtonLR=(X1=198.0000000,Y1=665.0000000,X2=230.0000000,Y2=697.0000000)
    fbButtonRR=(X1=452.0000000,Y1=665.0000000,X2=484.0000000,Y2=697.0000000)
    fbButtonAF=(X1=259.0000000,Y1=680.0000000,X2=341.0000000,Y2=700.0000000)
    fbButtonRSA=(X1=344.0000000,Y1=680.0000000,X2=426.0000000,Y2=700.0000000)
    fbRightPanel=(X1=517.0000000,Y1=96.0000000,X2=846.0000000,Y2=721.0000000)
    fbLabelLine[0]=(X1=519.0000000,Y1=98.0000000,X2=844.0000000,Y2=125.0000000)
    fbLabelLine[1]=(X1=519.0000000,Y1=219.0000000,X2=844.0000000,Y2=246.0000000)
    fbLabelLine[2]=(X1=519.0000000,Y1=340.0000000,X2=844.0000000,Y2=367.0000000)
    fbLabelLine[3]=(X1=519.0000000,Y1=461.0000000,X2=844.0000000,Y2=488.0000000)
    fbButtonEquipLeft[0]=(X1=554.0000000,Y1=143.0000000,X2=579.0000000,Y2=203.0000000)
    fbButtonEquipLeft[1]=(X1=554.0000000,Y1=264.0000000,X2=579.0000000,Y2=324.0000000)
    fbButtonEquipLeft[2]=(X1=554.0000000,Y1=385.0000000,X2=579.0000000,Y2=445.0000000)
    fbButtonEquipRight[0]=(X1=785.0000000,Y1=143.0000000,X2=810.0000000,Y2=203.0000000)
    fbButtonEquipRight[1]=(X1=785.0000000,Y1=264.0000000,X2=810.0000000,Y2=324.0000000)
    fbButtonEquipRight[2]=(X1=785.0000000,Y1=385.0000000,X2=810.0000000,Y2=445.0000000)
    fbDefaultItemBox[0]=(X1=604.0000000,Y1=129.0000000,X2=760.0000000,Y2=214.0000000)
    fbDefaultItemBox[1]=(X1=604.0000000,Y1=250.0000000,X2=760.0000000,Y2=335.0000000)
    fbDefaultItemBox[2]=(X1=604.0000000,Y1=371.0000000,X2=760.0000000,Y2=456.0000000)
    fbLabelNickName=(X1=530.0000000,Y1=493.0000000,X2=833.0000000,Y2=519.0000000)
    fbEditNickName=(X1=535.0000000,Y1=498.0000000,X2=828.0000000,Y2=519.0000000)
    fbButtonConfirm=(X1=556.0000000,Y1=668.0000000,X2=797.0000000,Y2=700.0000000)
    HelmetList[0]=11107
    HelmetList[1]=11105
    HelmetList[2]=11106
    FaceList[0]=12011
    FaceList[1]=12007
    FaceList[2]=12008
    AccessoryList[0]=13007
    AccessoryList[1]=13005
    AccessoryList[2]=13006
    strAF="AF"
    strRSA="RSA"
    strLabelLine[0]="??"
    strLabelLine[1]="??"
    strLabelLine[2]="????"
    strLabelLine[3]="???"
    strButtonConfirm="??"
    strEditNickName="???? ??????"
    fbLabelRoomName=(X1=10.0000000,Y1=15.0000000,X2=397.0000000,Y2=63.0000000)
    bPersistent=false
    OnOpen=BTPageCharacterCreation.InternalOnOpen
    OnClose=BTPageCharacterCreation.InternalOnClose
}