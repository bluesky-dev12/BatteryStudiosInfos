class BTPageMatchResult_Defence extends BTPageMatchResult
    editinlinenew
    instanced;

var export editinline BTTPMatchResultDefence TPResultDefence;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    Log("[BTPageMatchResult::InitComponent] ");
    super.InitComponent(MyController, myOwner);
    LabelTitle.bVisible = false;
    TPResultCommon = BTTPMatchResultCommonHK(NewComponent(new Class'GUIWarfareControls.BTTPMatchResultCommonHK', fbTPResult));
    TPResultCommon.SetVisibility(false);
    TPResultPrivate = BTTPMatchResultPrivateHK(NewComponent(new Class'GUIWarfareControls.BTTPMatchResultPrivateHK', fbTPResult));
    TPResultPrivate.SetVisibility(false);
    TPResultDefence = BTTPMatchResultDefence(NewComponent(new Class'GUIWarfareControls.BTTPMatchResultDefence', fbTPResult));
    TPResultDefence.SetVisibility(false);
    ButtonClose = NewButtonComponent(fbButtonClose);
    ButtonClose.DisableMe();
    ButtonClose.SetWaitRoomInfoBtnImage();
    ButtonClose.Caption = strButtonClose;
    ButtonClose.__OnClick__Delegate = ButtonClose_OnClick;
    BGDeco = NewLabelComponent(fbBGDeco, Class'GUIWarfareControls.BTUIResourcePoolHK'.default.GameResult_Deco_BG, 0.1000000);
    TopBg = NewLabelComponent(fbTopBg, Class'GUIWarfareControls.BTUIResourcePoolHK'.default.GameResult_Top_BG, 0.0100000);
    //return;    
}

function InternalOnOpen()
{
    __NFUN_270__("BTPageMatchResult::InternalOnOpen()");
    Log("[BTPageMatchResult::InternalOnOpen] ");
    LabelRoomName.SetVisibility(false);
    TPTopMenu.SetVisibility(false);
    TPTopMenu.__HeaderButton_OnClick__Delegate = HeaderButton_OnClick;
    GI = Controller.ViewportOwner.Actor.Level.Game;
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    InitializeDelegate();
    TPResultCommon.ACLResult[0].RemoveAll();
    TPResultCommon.ACLResult[1].RemoveAll();
    TPResultPrivate.ACLResult.RemoveAll();
    TPResultCommon.SetData(MM);
    TPResultPrivate.SetVisibility(false);
    TPResultCommon.SetVisibility(false);
    TPResultDefence.ACLResult[0].RemoveAll();
    TPResultDefence.ACLResult[1].RemoveAll();
    TPResultDefence.ACLResult[2].RemoveAll();
    TPResultDefence.ACLResult[3].RemoveAll();
    TPResultDefence.SetData(MM);
    TPResultDefence.SetVisibility(true);
    bCanClose = false;
    MM.InGameOver = 2;
    MM.EndMatch();
    ButtonCloseEnableTime = DefaultButtonCloseEnableTime;
    // End:0x2AA
    if(Controller.ViewportOwner.Actor.Level.GetMatchMaker().bAutoStart)
    {
        bCanClose = true;
        page_Main.SetPage(10, false);
    }
    romodelweapon1 = Controller.ViewportOwner.Actor.Level.Spawn(Class'GUIWarfareControls.BTROModelWeapon');
    romodelweapon1.Init();
    romodelweapon2 = Controller.ViewportOwner.Actor.Level.Spawn(Class'GUIWarfareControls.BTROModelWeapon');
    romodelweapon2.Init();
    bPrecachingRender = true;
    romodelnew = Controller.ViewportOwner.Actor.Level.Spawn(Class'GUIWarfareControls.BTROModelNew');
    romodelnew.Init();
    romodelnew.ChangeEquipItem(page_Main.rGameMgr);
    //return;    
}

defaultproperties
{
    OnOpen=BTPageMatchResult_Defence.InternalOnOpen
    OnClose=BTPageMatchResult_Defence.InternalOnClose
    OnCanClose=BTPageMatchResult_Defence.InternalOnCanClose
    OnPreDraw=BTPageMatchResult_Defence.InternalOnPreDraw
    OnKeyEvent=BTPageMatchResult_Defence.internalKeyEvent
}