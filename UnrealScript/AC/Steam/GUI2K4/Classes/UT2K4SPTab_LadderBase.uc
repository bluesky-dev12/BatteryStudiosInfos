/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4SPTab_LadderBase.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:21
 *	Functions:20
 *
 *******************************************************************************/
class UT2K4SPTab_LadderBase extends UT2K4SPTab_Base
    dependson(UT2K4SP_MapChallenge)
    dependson(UT2K4SP_TeamRoles)
    dependson(UT2K4LadderHButton)
    dependson(UT2K4LadderVButton)
    editinlinenew
    abstract
    instanced;

struct AnimData
{
    var float X;
    var float Y;
};

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sbgMatch;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sbgDetail;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage imgMatchShot;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIScrollTextBox sbDetails;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel lblMatchPrice;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel lblMatchEntryFee;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel lblBalance;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel lblNoMoney;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton btnChallengeMap;
var Color clEntryMatch;
var Color clEntryFail;
var localized string PrizeMoney;
var localized string EntryFee;
var localized string NotEnoughPlayers;
var localized string BalanceLabel;
var MapRecord ActiveMap;
var string TeamRoleWindow;
var export editinline UT2K4SP_TeamRoles RoleWindow;
var string MapChallengeWindow;
var export editinline UT2K4LadderButton SelectedMatch;
var float AnimTime;

function ShowPanel(bool bShow)
{
    super.ShowPanel(bShow);
    // End:0x46
    if(bShow)
    {
        MainWindow.btnPlay.Caption = CaptionPlay;
        btnPlayEnabled(SelectedMatch != none);
        UpdateBalance();
    }
}

function moveMatchInfo(optional float topDelta, optional float leftDelta)
{
    sbgMatch.WinTop += topDelta;
    sbgMatch.WinLeft += leftDelta;
    imgMatchShot.WinTop += topDelta;
    imgMatchShot.WinLeft += leftDelta;
    lblMatchPrice.WinTop += topDelta;
    lblMatchPrice.WinLeft += leftDelta;
    sbgDetail.WinTop += topDelta;
    sbgDetail.WinLeft += leftDelta;
    sbDetails.WinTop += topDelta;
    sbDetails.WinLeft += leftDelta;
    lblMatchEntryFee.WinTop += topDelta;
    lblMatchEntryFee.WinLeft += leftDelta;
    lblNoMoney.WinTop += topDelta;
    lblNoMoney.WinLeft += leftDelta;
    btnChallengeMap.WinTop += topDelta;
    btnChallengeMap.WinLeft += leftDelta;
}

function array<export editinline UT2K4LadderButton> CreateVButtons(int LadderId, float LadderTop, float LadderLeft, float LadderHeight, optional bool bHidden)
{
    local int i, ls;
    local float Spacing, CurrentTop;
    local array<export editinline UT2K4LadderButton> buttonArray;
    local export editinline UT2K4LadderButton btn;
    local export editinline GUIImage img;

    // End:0x47
    if(GP == none)
    {
        Log("Warning Will Robinson, no loaded game profile", LogPrefix);
        return buttonArray;
    }
    ls = GP.LengthOfLadder(LadderId);
    buttonArray.Length = ls;
    Spacing = LadderHeight / float(ls - 1) - class'UT2K4LadderVButton'.default.WinHeight;
    CurrentTop = LadderTop;
    i = ls - 1;
    J0xad:
    // End:0x330 [While If]
    if(i >= 0)
    {
        btn = new class'UT2K4LadderVButton';
        btn.WinLeft = LadderLeft;
        btn.WinTop = CurrentTop;
        btn.WinHeight = btn.WinHeight;
        btn.WinWidth = btn.WinWidth;
        CurrentTop = btn.WinTop + btn.WinHeight + Spacing;
        btn.__OnClick__Delegate = onMatchClick;
        btn.__OnDblClick__Delegate = onMatchDblClick;
        btn.TabOrder = Controls.Length + 1;
        btn.bBoundToParent = true;
        buttonArray[i] = btn;
        AppendComponent(btn);
        btn.bVisible = !bHidden;
        // End:0x311
        if(i > 0)
        {
            img = new class'GUIImage';
            img.WinTop = btn.WinTop + btn.WinHeight;
            img.WinHeight = CurrentTop - img.WinTop;
            img.WinWidth = 0.0039060;
            img.WinLeft = btn.WinWidth / float(2) - img.WinWidth + btn.WinLeft;
            img.Image = btn.PBNormal;
            img.ImageStyle = 2;
            img.bBoundToParent = true;
            btn.ProgresBar = img;
            AppendComponent(img);
            img.bVisible = !bHidden;
        }
        updateButton(btn, LadderId, i);
        -- i;
        // This is an implied JumpToken; Continue!
        goto J0xad;
    }
    return buttonArray;
}

function array<export editinline UT2K4LadderButton> CreateHButtons(int LadderId, float LadderTop, float LadderLeft, float LadderWidth, optional bool bHidden)
{
    local int i, ls;
    local float Spacing, CurrentLeft;
    local array<export editinline UT2K4LadderButton> buttonArray;
    local export editinline UT2K4LadderButton btn;
    local export editinline GUIImage img;

    // End:0x47
    if(GP == none)
    {
        Log("Warning Will Robinson, no loaded game profile", LogPrefix);
        return buttonArray;
    }
    ls = GP.LengthOfLadder(LadderId);
    buttonArray.Length = ls;
    Spacing = LadderWidth / float(ls - 1) - class'UT2K4LadderHButton'.default.WinWidth;
    CurrentLeft = LadderLeft;
    i = 0;
    J0xa6:
    // End:0x32d [While If]
    if(i < ls)
    {
        // End:0x1d9
        if(i > 0)
        {
            img = new class'GUIImage';
            img.WinLeft = btn.WinLeft + btn.WinWidth;
            img.WinWidth = CurrentLeft - img.WinLeft;
            img.WinHeight = 0.0039060;
            img.WinTop = btn.WinHeight / float(2) - img.WinHeight + btn.WinTop;
            img.Image = btn.PBNormal;
            img.ImageStyle = 2;
            img.bBoundToParent = true;
            AppendComponent(img);
            img.bVisible = !bHidden;
        }
        btn = new class'UT2K4LadderHButton';
        btn.WinLeft = CurrentLeft;
        btn.WinTop = LadderTop;
        btn.WinHeight = btn.WinHeight;
        btn.WinWidth = btn.WinWidth;
        CurrentLeft = btn.WinLeft + btn.WinWidth + Spacing;
        btn.__OnClick__Delegate = onMatchClick;
        btn.__OnDblClick__Delegate = onMatchDblClick;
        btn.ProgresBar = img;
        btn.TabOrder = Controls.Length + 1;
        btn.bBoundToParent = true;
        buttonArray[i] = btn;
        AppendComponent(btn);
        btn.bVisible = !bHidden;
        updateButton(btn, LadderId, i);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xa6;
    }
    return buttonArray;
}

function updateButton(UT2K4LadderButton btn, int LadderId, int MatchID)
{
    // End:0x9b
    if(btn.MatchInfo == none)
    {
        btn.MatchInfo = UT2K4MatchInfo(GP.GetMatchInfo(LadderId, MatchID));
        btn.MyMapRecord = class'CacheManager'.static.GetMapRecord(btn.MatchInfo.LevelName);
        btn.MatchIndex = MatchID;
        btn.LadderIndex = LadderId;
    }
}

function bool onMatchClick(GUIComponent Sender)
{
    local export editinline UT2K4LadderButton tmp;

    // End:0x13a
    if(UT2K4LadderButton(Sender) != none && GP != none)
    {
        tmp = UT2K4LadderButton(GP.NextMatchObject);
        // End:0x64
        if(tmp != none)
        {
            tmp.SetState(GetLadderProgress(tmp.LadderIndex));
        }
        SelectedMatch = UT2K4LadderButton(Sender);
        GP.CurrentLadder = SelectedMatch.LadderIndex;
        GP.CurrentMenuRung = SelectedMatch.MatchIndex;
        GP.NextMatchObject = SelectedMatch;
        showMatchDetails(UT2K4LadderButton(Sender).MatchInfo);
        SelectedMatch.StyleName = "LadderButtonActive";
        SelectedMatch.Style = Controller.GetStyle(SelectedMatch.StyleName, SelectedMatch.FontScale);
        return true;
    }
    Warn("" $ string(UT2K4LadderButton(Sender) != none) @ string(GP != none));
    return false;
}

function int GetLadderProgress(int LadderIndex)
{
    // End:0x2a
    if(LadderIndex >= 10)
    {
        return GP.CustomLadders[LadderIndex - 10].Progress;
    }
    return GP.LadderProgress[LadderIndex];
}

function bool onMatchDblClick(GUIComponent Sender)
{
    // End:0x17
    if(UT2K4LadderButton(Sender) != none)
    {
        return onPlayClick();
    }
    return false;
}

function showMatchDetails(UT2K4MatchInfo MI)
{
    local Material Screenshot;
    local int minentryfee;

    // End:0x0d
    if(MI == none)
    {
        return;
    }
    minentryfee = GP.getMinimalEntryFeeFor(MI);
    // End:0xaa
    if(SelectedMatch != none)
    {
        lblNoMoney.bVisible = minentryfee > GP.Balance || minentryfee < 0;
        // End:0x90
        if(lblNoMoney.bVisible)
        {
            lblNoMoney.Caption = getMatchCaption(MI);
        }
        btnPlayEnabled(!lblNoMoney.bVisible);
    }
    // End:0xb1
    else
    {
        btnPlayEnabled(false);
    }
    ActiveMap = class'CacheManager'.static.GetMapRecord(MI.LevelName);
    MainWindow.LastLadderPage = self;
    // End:0x112
    if(ActiveMap.ScreenshotRef != "")
    {
        Screenshot = Material(DynamicLoadObject(ActiveMap.ScreenshotRef, class'Material'));
    }
    imgMatchShot.Image = Screenshot;
    sbDetails.SetContent(GetMapDecription(ActiveMap));
    // End:0x175
    if(MI.MenuName != "")
    {
        sbgDetail.Caption = MI.MenuName;
    }
    // End:0x1bb
    else
    {
        // End:0x1a2
        if(ActiveMap.FriendlyName != "")
        {
            sbgDetail.Caption = ActiveMap.FriendlyName;
        }
        // End:0x1bb
        else
        {
            sbgDetail.Caption = ActiveMap.MapName;
        }
    }
    // End:0x205
    if(MI.PrizeMoney != 0)
    {
        lblMatchPrice.Caption = PrizeMoney @ GP.MoneyToString(MI.PrizeMoney);
    }
    // End:0x216
    else
    {
        lblMatchPrice.Caption = "";
    }
    // End:0x2ac
    if(MI.EntryFee != 0)
    {
        lblMatchEntryFee.Caption = EntryFee @ GP.MoneyToString(MI.EntryFee);
        // End:0x295
        if(MI.EntryFee <= GP.Balance)
        {
            lblMatchEntryFee.TextColor = clEntryMatch;
        }
        // End:0x2a9
        else
        {
            lblMatchEntryFee.TextColor = clEntryFail;
        }
    }
    // End:0x2bd
    else
    {
        lblMatchEntryFee.Caption = "";
    }
    btnChallengeMap.bVisible = GP.HasAltLevel(GP.CurrentLadder, GP.CurrentMenuRung);
    minentryfee = GP.getMinimalEntryFeeFor(MI, true);
    // End:0x361
    if(float(MI.PrizeMoney) * GP.MapChallengeCost < float(GP.Balance - minentryfee))
    {
        btnChallengeMap.EnableMe();
    }
    // End:0x370
    else
    {
        btnChallengeMap.DisableMe();
    }
}

function string getMatchCaption(UT2K4MatchInfo MI)
{
    local int nummates, healthymates, i, j;

    nummates = GP.GetNumTeammatesForMatch();
    // End:0xf1
    if(nummates > 0)
    {
        healthymates = 0;
        i = 0;
        J0x2e:
        // End:0xb2 [While If]
        if(i < GP.GetMaxTeamSize())
        {
            j = GP.GetBotPosition(GP.PlayerTeam[i]);
            // End:0xa8
            if(j > -1)
            {
                // End:0xa8
                if(GP.BotStats[j].Health >= 100)
                {
                    ++ healthymates;
                }
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x2e;
        }
        // End:0xf1
        if(healthymates < nummates)
        {
            return Repl(Repl(NotEnoughPlayers, "%healthy%", string(healthymates)), "%teammates%", string(nummates));
        }
    }
    return default.lblNoMoney.Caption;
}

function string GetMapDecription(MapRecord MR)
{
    local DecoText dt;
    local string Package, Item;

    // End:0xbf
    if(MR.Description == "" && class'CacheManager'.static.Is2003Content(MR.MapName) && MR.TextName != "")
    {
        // End:0x7a
        if(!Divide(MR.TextName, ".", Package, Item))
        {
            Package = "XMaps";
            Item = MR.TextName;
        }
        dt = class'wUtil'.static.LoadDecoText(Package, Item);
        // End:0xa7
        if(dt == none)
        {
            return "";
        }
        return JoinArray(dt.Rows, "|");
    }
    return MR.Description;
}

function bool onPlayClick()
{
    local int nummates, healthymates, i, j;
    local export editinline GUIQuestionPage QPage;

    // End:0x20d
    if(SelectedMatch != none && GP != none)
    {
        // End:0x45
        if(!MainWindow.HandleRequirements(SelectedMatch.MatchInfo.Requirements))
        {
            return true;
        }
        GP.bIsChallenge = false;
        // End:0x82
        if(SelectedMatch.MatchInfo.EntryFee > GP.Balance)
        {
            return false;
        }
        nummates = GP.GetNumTeammatesForMatch();
        // End:0x207
        if(nummates > 0)
        {
            healthymates = 0;
            i = 0;
            J0xb0:
            // End:0x134 [While If]
            if(i < GP.GetMaxTeamSize())
            {
                j = GP.GetBotPosition(GP.PlayerTeam[i]);
                // End:0x12a
                if(j > -1)
                {
                    // End:0x12a
                    if(GP.BotStats[j].Health >= 100)
                    {
                        ++ healthymates;
                    }
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0xb0;
            }
            // End:0x1bf
            if(healthymates < nummates)
            {
                // End:0x1bd
                if(Controller.OpenMenu(Controller.QuestionMenuClass))
                {
                    QPage = GUIQuestionPage(Controller.TopPage());
                    QPage.SetupQuestion(Repl(Repl(NotEnoughPlayers, "%healthy%", string(healthymates)), "%teammates%", string(nummates)), 1);
                }
                return true;
            }
            // End:0x204
            if(Controller.OpenMenu(TeamRoleWindow))
            {
                RoleWindow = UT2K4SP_TeamRoles(Controller.TopPage());
                RoleWindow.__onOkClick__Delegate = StartMatch;
            }
        }
        // End:0x20d
        else
        {
            StartMatch();
        }
    }
    return true;
}

function StartMatch()
{
    local LevelInfo myLevel;

    GP.Balance -= SelectedMatch.MatchInfo.EntryFee;
    GP.ActiveMap = ActiveMap;
    myLevel = PlayerOwner().Level;
    GP.bIsChallenge = false;
    GP.StartNewMatch(GP.CurrentLadder, myLevel);
    Controller.CloseAll(false, true);
}

function selectNextMatch();
function array<AnimData> InitAnimData(array<export editinline UT2K4LadderButton> Buttons)
{
    local array<AnimData> res;
    local int i;

    res.Length = Buttons.Length;
    i = 0;
    J0x14:
    // End:0x78 [While If]
    if(i < Buttons.Length)
    {
        res[i].X = Buttons[i].WinLeft;
        res[i].Y = Buttons[i].WinTop;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
    DoAnimate(Buttons, res, true);
    return res;
}

function DoAnimate(array<export editinline UT2K4LadderButton> Buttons, array<AnimData> Data, optional bool Reset)
{
    local int i;

    // End:0xd7
    if(Reset)
    {
        i = 1;
        J0x10:
        // End:0xd5 [While If]
        if(i < Buttons.Length)
        {
            Buttons[i].KillAnimation();
            Buttons[i].__OnArrival__Delegate = None;
            Buttons[i].WinLeft = Data[0].X;
            Buttons[i].WinTop = Data[0].Y;
            // End:0xcb
            if(Buttons[i].ProgresBar != none)
            {
                Buttons[i].ProgresBar.bVisible = false;
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x10;
        }
        return;
    }
    i = 1;
    J0xde:
    // End:0x199 [While If]
    if(i < Buttons.Length)
    {
        Buttons[i].__OnArrival__Delegate = LadderButtonOnArrival;
        // End:0x142
        if(Buttons[i].ProgresBar != none)
        {
            Buttons[i].ProgresBar.bVisible = false;
        }
        Buttons[i].Animate(Data[i].X, Data[i].Y, AnimTime * float(i) / float(Buttons.Length));
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xde;
    }
}

function LadderButtonOnArrival(GUIComponent Sender, XInterface.GUI.EAnimationType Type)
{
    // End:0x12
    if(UT2K4LadderButton(Sender) == none)
    {
        return;
    }
    // End:0x4a
    if(UT2K4LadderButton(Sender).ProgresBar != none)
    {
        UT2K4LadderButton(Sender).ProgresBar.bVisible = true;
    }
}

function bool OnMapChallenge(GUIComponent Sender)
{
    local bool res;

    res = Controller.OpenMenu(MapChallengeWindow);
    // End:0x46
    if(res)
    {
        UT2K4SP_MapChallenge(Controller.ActivePage).__MapSelectionUpdate__Delegate = MapChallengeUpdate;
    }
    return res;
}

function MapChallengeUpdate()
{
    // End:0xc2
    if(SelectedMatch != none)
    {
        SelectedMatch.MatchInfo = UT2K4MatchInfo(GP.GetMatchInfo(SelectedMatch.LadderIndex, SelectedMatch.MatchIndex));
        SelectedMatch.MyMapRecord = class'CacheManager'.static.GetMapRecord(SelectedMatch.MatchInfo.LevelName);
        SelectedMatch.SetState(GP.LadderProgress[SelectedMatch.LadderIndex]);
        showMatchDetails(SelectedMatch.MatchInfo);
        UpdateBalance();
    }
}

function UpdateBalance()
{
    lblBalance.Caption = BalanceLabel @ GP.MoneyToString(GP.Balance);
}

defaultproperties
{
    begin object name=SPPsbgMatch class=AltSectionBackground
        Caption="?? ??"
        WinTop=0.0743290
        WinLeft=0.5150
        WinWidth=0.470
        WinHeight=0.3766330
        bBoundToParent=true
        OnPreDraw=InternalPreDraw
    object end
    // Reference: AltSectionBackground'UT2K4SPTab_LadderBase.SPPsbgMatch'
    sbgMatch=SPPsbgMatch
    begin object name=SPPsbgDetail class=AltSectionBackground
        Caption="????"
        WinTop=0.4734630
        WinLeft=0.5150
        WinWidth=0.470
        WinHeight=0.450
        bBoundToParent=true
        OnPreDraw=InternalPreDraw
    object end
    // Reference: AltSectionBackground'UT2K4SPTab_LadderBase.SPPsbgDetail'
    sbgDetail=SPPsbgDetail
    begin object name=SPLimgMatchShot class=GUIImage
        ImageStyle=2
        ImageRenderStyle=1
        WinTop=0.1284340
        WinLeft=0.5290050
        WinWidth=0.4432660
        WinHeight=0.2869390
        RenderWeight=0.20
        bBoundToParent=true
    object end
    // Reference: GUIImage'UT2K4SPTab_LadderBase.SPLimgMatchShot'
    imgMatchShot=SPLimgMatchShot
    begin object name=SPPsbDetails class=GUIScrollTextBox
        CharDelay=0.00250
        EOLDelay=0.50
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.5321790
        WinLeft=0.5313780
        WinWidth=0.4397960
        WinHeight=0.333750
        RenderWeight=0.20
        TabOrder=1
        bBoundToParent=true
    object end
    // Reference: GUIScrollTextBox'UT2K4SPTab_LadderBase.SPPsbDetails'
    sbDetails=SPPsbDetails
    begin object name=SPLlblMatchPrice class=GUILabel
        TextAlign=1
        TextColor=(R=207,G=185,B=103,A=255)
        ShadowOffsetX=1.0
        ShadowOffsetY=1.0
        WinTop=0.3740770
        WinLeft=0.5249990
        WinWidth=0.450
        WinHeight=0.041250
        RenderWeight=0.250
        bBoundToParent=true
    object end
    // Reference: GUILabel'UT2K4SPTab_LadderBase.SPLlblMatchPrice'
    lblMatchPrice=SPLlblMatchPrice
    begin object name=SPLlblMatchEntryFee class=GUILabel
        TextAlign=1
        TextColor=(R=185,G=207,B=103,A=255)
        ShadowOffsetX=1.0
        ShadowOffsetY=1.0
        WinTop=0.3404170
        WinLeft=0.5249990
        WinWidth=0.450
        WinHeight=0.041250
        RenderWeight=0.250
        bBoundToParent=true
    object end
    // Reference: GUILabel'UT2K4SPTab_LadderBase.SPLlblMatchEntryFee'
    lblMatchEntryFee=SPLlblMatchEntryFee
    begin object name=SPLlblBalance class=GUILabel
        TextAlign=2
        ShadowColor=(R=0,G=0,B=0,A=64)
        ShadowOffsetX=1.50
        ShadowOffsetY=1.50
        StyleName="TextLabel"
        WinTop=0.0050
        WinLeft=0.5462490
        WinWidth=0.450
        WinHeight=0.041250
        RenderWeight=0.250
        bBoundToParent=true
    object end
    // Reference: GUILabel'UT2K4SPTab_LadderBase.SPLlblBalance'
    lblBalance=SPLlblBalance
    begin object name=SPLlblNoMoney class=GUILabel
        Caption="? ??? ????? ???? ?????."
        TextAlign=1
        TextColor=(R=255,G=96,B=96,A=255)
        bMultiLine=true
        ShadowOffsetX=1.0
        ShadowOffsetY=1.0
        WinTop=0.1289460
        WinLeft=0.5301010
        WinWidth=0.4423470
        WinHeight=0.2084180
        RenderWeight=0.250
        bBoundToParent=true
        bVisible=true
    object end
    // Reference: GUILabel'UT2K4SPTab_LadderBase.SPLlblNoMoney'
    lblNoMoney=SPLlblNoMoney
    begin object name=SPLbtnChallengeMap class=GUIButton
        Caption="??? ??"
        Hint="? ??? ?? ?? ???? ?????"
        WinTop=0.8682320
        WinLeft=0.5654330
        WinWidth=0.3715560
        WinHeight=0.0476280
        RenderWeight=0.30
        TabOrder=2
        bBoundToParent=true
        bVisible=true
        OnClick=OnMapChallenge
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4SPTab_LadderBase.SPLbtnChallengeMap'
    btnChallengeMap=SPLbtnChallengeMap
    clEntryMatch=(R=185,G=207,B=103,A=255)
    clEntryFail=(R=255,G=96,B=96,A=255)
    PrizeMoney="??:"
    EntryFee="???:"
    NotEnoughPlayers="? ??? ????? ???? ????? ??????.|%teammates% ??? ??? ?????, ??? ??? %healthy% ???? ???? ????."
    BalanceLabel="???:"
    TeamRoleWindow="GUI2K4.UT2K4SP_TeamRoles"
    MapChallengeWindow="GUI2K4.UT2K4SP_MapChallenge"
    AnimTime=1.0
    PropagateVisibility=true
}