class UT2K4SPTab_LadderBase extends UT2K4SPTab_Base
    abstract
    editinlinenew
    instanced;

struct AnimData
{
    var float X;
    var float Y;
};

var() automated GUISectionBackground sbgMatch;
var() automated GUISectionBackground sbgDetail;
var() automated GUIImage imgMatchShot;
var() automated GUIScrollTextBox sbDetails;
var() automated GUILabel lblMatchPrice;
var() automated GUILabel lblMatchEntryFee;
var() automated GUILabel lblBalance;
var() automated GUILabel lblNoMoney;
var() automated GUIButton btnChallengeMap;
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
    //return;    
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
    //return;    
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
    Spacing = (LadderHeight / float(ls - 1)) - Class'GUI2K4_Decompressed.UT2K4LadderVButton'.default.WinHeight;
    CurrentTop = LadderTop;
    i = ls - 1;
    J0xAD:

    // End:0x330 [Loop If]
    if(i >= 0)
    {
        btn = new Class'GUI2K4_Decompressed.UT2K4LadderVButton';
        btn.WinLeft = LadderLeft;
        btn.WinTop = CurrentTop;
        btn.WinHeight = btn.WinHeight;
        btn.WinWidth = btn.WinWidth;
        CurrentTop = (btn.WinTop + btn.WinHeight) + Spacing;
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
            img = new Class'XInterface.GUIImage';
            img.WinTop = btn.WinTop + btn.WinHeight;
            img.WinHeight = CurrentTop - img.WinTop;
            img.WinWidth = 0.0039060;
            img.WinLeft = ((btn.WinWidth / float(2)) - img.WinWidth) + btn.WinLeft;
            img.Image = btn.PBNormal;
            img.ImageStyle = 2;
            img.bBoundToParent = true;
            btn.ProgresBar = img;
            AppendComponent(img);
            img.bVisible = !bHidden;
        }
        updateButton(btn, LadderId, i);
        i--;
        // [Loop Continue]
        goto J0xAD;
    }
    return buttonArray;
    //return;    
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
    Spacing = (LadderWidth / float(ls - 1)) - Class'GUI2K4_Decompressed.UT2K4LadderHButton'.default.WinWidth;
    CurrentLeft = LadderLeft;
    i = 0;
    J0xA6:

    // End:0x32D [Loop If]
    if(i < ls)
    {
        // End:0x1D9
        if(i > 0)
        {
            img = new Class'XInterface.GUIImage';
            img.WinLeft = btn.WinLeft + btn.WinWidth;
            img.WinWidth = CurrentLeft - img.WinLeft;
            img.WinHeight = 0.0039060;
            img.WinTop = ((btn.WinHeight / float(2)) - img.WinHeight) + btn.WinTop;
            img.Image = btn.PBNormal;
            img.ImageStyle = 2;
            img.bBoundToParent = true;
            AppendComponent(img);
            img.bVisible = !bHidden;
        }
        btn = new Class'GUI2K4_Decompressed.UT2K4LadderHButton';
        btn.WinLeft = CurrentLeft;
        btn.WinTop = LadderTop;
        btn.WinHeight = btn.WinHeight;
        btn.WinWidth = btn.WinWidth;
        CurrentLeft = (btn.WinLeft + btn.WinWidth) + Spacing;
        btn.__OnClick__Delegate = onMatchClick;
        btn.__OnDblClick__Delegate = onMatchDblClick;
        btn.ProgresBar = img;
        btn.TabOrder = Controls.Length + 1;
        btn.bBoundToParent = true;
        buttonArray[i] = btn;
        AppendComponent(btn);
        btn.bVisible = !bHidden;
        updateButton(btn, LadderId, i);
        i++;
        // [Loop Continue]
        goto J0xA6;
    }
    return buttonArray;
    //return;    
}

function updateButton(UT2K4LadderButton btn, int LadderId, int MatchID)
{
    // End:0x9B
    if(btn.MatchInfo == none)
    {
        btn.MatchInfo = UT2K4MatchInfo(GP.GetMatchInfo(LadderId, MatchID));
        btn.MyMapRecord = Class'Engine.CacheManager'.static.GetMapRecord(btn.MatchInfo.LevelName);
        btn.MatchIndex = MatchID;
        btn.LadderIndex = LadderId;
    }
    //return;    
}

function bool onMatchClick(GUIComponent Sender)
{
    local export editinline UT2K4LadderButton tmp;

    // End:0x13A
    if((UT2K4LadderButton(Sender) != none) && GP != none)
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
    Warn(("" $ string(UT2K4LadderButton(Sender) != none)) @ string(GP != none));
    return false;
    //return;    
}

function int GetLadderProgress(int LadderIndex)
{
    // End:0x2A
    if(LadderIndex >= 10)
    {
        return GP.CustomLadders[LadderIndex - 10].Progress;
    }
    return GP.LadderProgress[LadderIndex];
    //return;    
}

function bool onMatchDblClick(GUIComponent Sender)
{
    // End:0x17
    if(UT2K4LadderButton(Sender) != none)
    {
        return onPlayClick();
    }
    return false;
    //return;    
}

function showMatchDetails(UT2K4MatchInfo mi)
{
    local Material Screenshot;
    local int minentryfee;

    // End:0x0D
    if(mi == none)
    {
        return;
    }
    minentryfee = GP.getMinimalEntryFeeFor(mi);
    // End:0xAA
    if(SelectedMatch != none)
    {
        lblNoMoney.bVisible = (minentryfee > GP.Balance) || minentryfee < 0;
        // End:0x90
        if(lblNoMoney.bVisible)
        {
            lblNoMoney.Caption = getMatchCaption(mi);
        }
        btnPlayEnabled(!lblNoMoney.bVisible);        
    }
    else
    {
        btnPlayEnabled(false);
    }
    ActiveMap = Class'Engine.CacheManager'.static.GetMapRecord(mi.LevelName);
    MainWindow.LastLadderPage = self;
    // End:0x112
    if(ActiveMap.ScreenshotRef != "")
    {
        Screenshot = Material(DynamicLoadObject(ActiveMap.ScreenshotRef, Class'Engine.Material'));
    }
    imgMatchShot.Image = Screenshot;
    sbDetails.SetContent(GetMapDecription(ActiveMap));
    // End:0x175
    if(mi.MenuName != "")
    {
        sbgDetail.Caption = mi.MenuName;        
    }
    else
    {
        // End:0x1A2
        if(ActiveMap.FriendlyName != "")
        {
            sbgDetail.Caption = ActiveMap.FriendlyName;            
        }
        else
        {
            sbgDetail.Caption = ActiveMap.MapName;
        }
    }
    // End:0x205
    if(mi.PrizeMoney != 0)
    {
        lblMatchPrice.Caption = PrizeMoney @ GP.MoneyToString(mi.PrizeMoney);        
    }
    else
    {
        lblMatchPrice.Caption = "";
    }
    // End:0x2AC
    if(mi.EntryFee != 0)
    {
        lblMatchEntryFee.Caption = EntryFee @ GP.MoneyToString(mi.EntryFee);
        // End:0x295
        if(mi.EntryFee <= GP.Balance)
        {
            lblMatchEntryFee.TextColor = clEntryMatch;            
        }
        else
        {
            lblMatchEntryFee.TextColor = clEntryFail;
        }        
    }
    else
    {
        lblMatchEntryFee.Caption = "";
    }
    btnChallengeMap.bVisible = GP.HasAltLevel(GP.CurrentLadder, GP.CurrentMenuRung);
    minentryfee = GP.getMinimalEntryFeeFor(mi, true);
    // End:0x361
    if((float(mi.PrizeMoney) * GP.MapChallengeCost) < float(GP.Balance - minentryfee))
    {
        btnChallengeMap.EnableMe();        
    }
    else
    {
        btnChallengeMap.DisableMe();
    }
    //return;    
}

function string getMatchCaption(UT2K4MatchInfo mi)
{
    local int nummates, healthymates, i, j;

    nummates = GP.GetNumTeammatesForMatch();
    // End:0xF1
    if(nummates > 0)
    {
        healthymates = 0;
        i = 0;
        J0x2E:

        // End:0xB2 [Loop If]
        if(i < GP.GetMaxTeamSize())
        {
            j = GP.GetBotPosition(GP.PlayerTeam[i]);
            // End:0xA8
            if(j > -1)
            {
                // End:0xA8
                if(int(GP.BotStats[j].Health) >= 100)
                {
                    healthymates++;
                }
            }
            i++;
            // [Loop Continue]
            goto J0x2E;
        }
        // End:0xF1
        if(healthymates < nummates)
        {
            return Repl(Repl(NotEnoughPlayers, "%healthy%", string(healthymates)), "%teammates%", string(nummates));
        }
    }
    return default.lblNoMoney.Caption;
    //return;    
}

function string GetMapDecription(MapRecord MR)
{
    local DecoText dt;
    local string Package, Item;

    // End:0xBF
    if(((MR.Description == "") && Class'Engine.CacheManager'.static.Is2003Content(MR.MapName)) && MR.TextName != "")
    {
        // End:0x7A
        if(!Divide(MR.TextName, ".", Package, Item))
        {
            Package = "XMaps";
            Item = MR.TextName;
        }
        dt = Class'WGame.wUtil'.static.LoadDecoText(Package, Item);
        // End:0xA7
        if(dt == none)
        {
            return "";
        }
        return JoinArray(dt.Rows, "|");
    }
    return MR.Description;
    //return;    
}

function bool onPlayClick()
{
    local int nummates, healthymates, i, j;
    local export editinline GUIQuestionPage QPage;

    // End:0x20D
    if((SelectedMatch != none) && GP != none)
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
            J0xB0:

            // End:0x134 [Loop If]
            if(i < GP.GetMaxTeamSize())
            {
                j = GP.GetBotPosition(GP.PlayerTeam[i]);
                // End:0x12A
                if(j > -1)
                {
                    // End:0x12A
                    if(int(GP.BotStats[j].Health) >= 100)
                    {
                        healthymates++;
                    }
                }
                i++;
                // [Loop Continue]
                goto J0xB0;
            }
            // End:0x1BF
            if(healthymates < nummates)
            {
                // End:0x1BD
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
        else
        {
            StartMatch();
        }
    }
    return true;
    //return;    
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
    //return;    
}

function selectNextMatch()
{
    //return;    
}

function array<AnimData> InitAnimData(array<export editinline UT2K4LadderButton> Buttons)
{
    local array<AnimData> res;
    local int i;

    res.Length = Buttons.Length;
    i = 0;
    J0x14:

    // End:0x78 [Loop If]
    if(i < Buttons.Length)
    {
        res[i].X = Buttons[i].WinLeft;
        res[i].Y = Buttons[i].WinTop;
        i++;
        // [Loop Continue]
        goto J0x14;
    }
    DoAnimate(Buttons, res, true);
    return res;
    //return;    
}

function DoAnimate(array<export editinline UT2K4LadderButton> Buttons, array<AnimData> Data, optional bool Reset)
{
    local int i;

    // End:0xD7
    if(Reset)
    {
        i = 1;
        J0x10:

        // End:0xD5 [Loop If]
        if(i < Buttons.Length)
        {
            Buttons[i].KillAnimation();
            Buttons[i].__OnArrival__Delegate = None;
            Buttons[i].WinLeft = Data[0].X;
            Buttons[i].WinTop = Data[0].Y;
            // End:0xCB
            if(Buttons[i].ProgresBar != none)
            {
                Buttons[i].ProgresBar.bVisible = false;
            }
            i++;
            // [Loop Continue]
            goto J0x10;
        }
        return;
    }
    i = 1;
    J0xDE:

    // End:0x199 [Loop If]
    if(i < Buttons.Length)
    {
        Buttons[i].__OnArrival__Delegate = LadderButtonOnArrival;
        // End:0x142
        if(Buttons[i].ProgresBar != none)
        {
            Buttons[i].ProgresBar.bVisible = false;
        }
        Buttons[i].Animate(Data[i].X, Data[i].Y, AnimTime * (float(i) / float(Buttons.Length)));
        i++;
        // [Loop Continue]
        goto J0xDE;
    }
    //return;    
}

function LadderButtonOnArrival(GUIComponent Sender, GUI.EAnimationType Type)
{
    // End:0x12
    if(UT2K4LadderButton(Sender) == none)
    {
        return;
    }
    // End:0x4A
    if(UT2K4LadderButton(Sender).ProgresBar != none)
    {
        UT2K4LadderButton(Sender).ProgresBar.bVisible = true;
    }
    //return;    
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
    //return;    
}

function MapChallengeUpdate()
{
    // End:0xC2
    if(SelectedMatch != none)
    {
        SelectedMatch.MatchInfo = UT2K4MatchInfo(GP.GetMatchInfo(SelectedMatch.LadderIndex, SelectedMatch.MatchIndex));
        SelectedMatch.MyMapRecord = Class'Engine.CacheManager'.static.GetMapRecord(SelectedMatch.MatchInfo.LevelName);
        SelectedMatch.SetState(GP.LadderProgress[SelectedMatch.LadderIndex]);
        showMatchDetails(SelectedMatch.MatchInfo);
        UpdateBalance();
    }
    //return;    
}

function UpdateBalance()
{
    lblBalance.Caption = BalanceLabel @ GP.MoneyToString(GP.Balance);
    //return;    
}

defaultproperties
{
    // Reference: AltSectionBackground'GUI2K4_Decompressed.UT2K4SPTab_LadderBase.SPPsbgMatch'
    begin object name="SPPsbgMatch" class=GUI2K4_Decompressed.AltSectionBackground
        Caption="?? ??"
        WinTop=0.0743290
        WinLeft=0.5150000
        WinWidth=0.4700000
        WinHeight=0.3766330
        bBoundToParent=true
        OnPreDraw=SPPsbgMatch.InternalPreDraw
    end object
    sbgMatch=SPPsbgMatch
    // Reference: AltSectionBackground'GUI2K4_Decompressed.UT2K4SPTab_LadderBase.SPPsbgDetail'
    begin object name="SPPsbgDetail" class=GUI2K4_Decompressed.AltSectionBackground
        Caption="????"
        WinTop=0.4734630
        WinLeft=0.5150000
        WinWidth=0.4700000
        WinHeight=0.4500000
        bBoundToParent=true
        OnPreDraw=SPPsbgDetail.InternalPreDraw
    end object
    sbgDetail=SPPsbgDetail
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4SPTab_LadderBase.SPLimgMatchShot'
    begin object name="SPLimgMatchShot" class=XInterface.GUIImage
        ImageStyle=2
        ImageRenderStyle=1
        WinTop=0.1284340
        WinLeft=0.5290050
        WinWidth=0.4432660
        WinHeight=0.2869390
        RenderWeight=0.2000000
        bBoundToParent=true
    end object
    imgMatchShot=SPLimgMatchShot
    // Reference: GUIScrollTextBox'GUI2K4_Decompressed.UT2K4SPTab_LadderBase.SPPsbDetails'
    begin object name="SPPsbDetails" class=XInterface.GUIScrollTextBox
        CharDelay=0.0025000
        EOLDelay=0.5000000
        OnCreateComponent=SPPsbDetails.InternalOnCreateComponent
        WinTop=0.5321790
        WinLeft=0.5313780
        WinWidth=0.4397960
        WinHeight=0.3337500
        RenderWeight=0.2000000
        TabOrder=1
        bBoundToParent=true
    end object
    sbDetails=SPPsbDetails
    // Reference: GUILabel'GUI2K4_Decompressed.UT2K4SPTab_LadderBase.SPLlblMatchPrice'
    begin object name="SPLlblMatchPrice" class=XInterface.GUILabel
        TextAlign=1
        TextColor=(R=207,G=185,B=103,A=255)
        ShadowOffsetX=1.0000000
        ShadowOffsetY=1.0000000
        WinTop=0.3740770
        WinLeft=0.5249990
        WinWidth=0.4500000
        WinHeight=0.0412500
        RenderWeight=0.2500000
        bBoundToParent=true
    end object
    lblMatchPrice=SPLlblMatchPrice
    // Reference: GUILabel'GUI2K4_Decompressed.UT2K4SPTab_LadderBase.SPLlblMatchEntryFee'
    begin object name="SPLlblMatchEntryFee" class=XInterface.GUILabel
        TextAlign=1
        TextColor=(R=185,G=207,B=103,A=255)
        ShadowOffsetX=1.0000000
        ShadowOffsetY=1.0000000
        WinTop=0.3404170
        WinLeft=0.5249990
        WinWidth=0.4500000
        WinHeight=0.0412500
        RenderWeight=0.2500000
        bBoundToParent=true
    end object
    lblMatchEntryFee=SPLlblMatchEntryFee
    // Reference: GUILabel'GUI2K4_Decompressed.UT2K4SPTab_LadderBase.SPLlblBalance'
    begin object name="SPLlblBalance" class=XInterface.GUILabel
        TextAlign=2
        ShadowColor=(R=0,G=0,B=0,A=64)
        ShadowOffsetX=1.5000000
        ShadowOffsetY=1.5000000
        StyleName="TextLabel"
        WinTop=0.0050000
        WinLeft=0.5462490
        WinWidth=0.4500000
        WinHeight=0.0412500
        RenderWeight=0.2500000
        bBoundToParent=true
    end object
    lblBalance=SPLlblBalance
    // Reference: GUILabel'GUI2K4_Decompressed.UT2K4SPTab_LadderBase.SPLlblNoMoney'
    begin object name="SPLlblNoMoney" class=XInterface.GUILabel
        Caption="? ??? ????? ???? ?????."
        TextAlign=1
        TextColor=(R=255,G=96,B=96,A=255)
        bMultiLine=true
        ShadowOffsetX=1.0000000
        ShadowOffsetY=1.0000000
        WinTop=0.1289460
        WinLeft=0.5301010
        WinWidth=0.4423470
        WinHeight=0.2084180
        RenderWeight=0.2500000
        bBoundToParent=true
        bVisible=false
    end object
    lblNoMoney=SPLlblNoMoney
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4SPTab_LadderBase.SPLbtnChallengeMap'
    begin object name="SPLbtnChallengeMap" class=XInterface.GUIButton
        Caption="??? ??"
        Hint="? ??? ?? ?? ???? ?????"
        WinTop=0.8682320
        WinLeft=0.5654330
        WinWidth=0.3715560
        WinHeight=0.0476280
        RenderWeight=0.3000000
        TabOrder=2
        bBoundToParent=true
        bVisible=false
        OnClick=UT2K4SPTab_LadderBase.OnMapChallenge
        OnKeyEvent=SPLbtnChallengeMap.InternalOnKeyEvent
    end object
    btnChallengeMap=SPLbtnChallengeMap
    clEntryMatch=(R=185,G=207,B=103,A=255)
    clEntryFail=(R=255,G=96,B=96,A=255)
    PrizeMoney="??:"
    EntryFee="???:"
    NotEnoughPlayers="? ??? ????? ???? ????? ??????.|%teammates% ??? ??? ?????, ??? ??? %healthy% ???? ???? ????."
    BalanceLabel="???:"
    TeamRoleWindow="GUI2K4.UT2K4SP_TeamRoles"
    MapChallengeWindow="GUI2K4.UT2K4SP_MapChallenge"
    AnimTime=1.0000000
    PropagateVisibility=false
}