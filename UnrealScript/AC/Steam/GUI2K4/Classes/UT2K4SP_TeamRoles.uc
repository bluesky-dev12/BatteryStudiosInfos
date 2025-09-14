/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4SP_TeamRoles.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:24
 *	Functions:8
 *
 *******************************************************************************/
class UT2K4SP_TeamRoles extends LargeWindow
    editinlinenew
    instanced;

var UT2K4GameProfile GP;
var Material PortraitBGMat;
var array<export editinline GUIImage> imgFaces;
var array<export editinline GUIComboBox> cbRoles;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton btnOk;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton btnCancel;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel lblTitle;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel lblInfo;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel lblNoMoney;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel lblBalance;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIScrollTextBox sbCharInfo;
var localized string InactiveMsg;
var localized string MinimalFeeCaption;
var localized string InjuredCaption;
var localized string AggressionCaption;
var localized string AccuracyCaption;
var localized string AgilityCaption;
var localized string TacticsCaption;
var int MaxTeamMates;
var int AssignedRoles;
var array<int> TeamFee;
var int CurrentFee;
var bool bNoBalanceCheck;
var delegate<onOkClick> __onOkClick__Delegate;

delegate onOkClick();
function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local MatchInfo MI;
    local MapRecord MR;

    bInit = true;
    super(FloatingWindow).InitComponent(MyController, myOwner);
    GP = UT2K4GameProfile(PlayerOwner().Level.Game.CurrentGameProfile);
    // End:0x6c
    if(GP == none)
    {
        Log("GP == none");
        Controller.CloseMenu(false);
        return;
    }
    MaxTeamMates = GP.GetNumTeammatesForMatch();
    lblInfo.Caption = Repl(lblInfo.Caption, "%teammates%", string(MaxTeamMates));
    lblInfo.Caption = Repl(lblInfo.Caption, "%gametype%", GP.GetMatchDescription());
    lblBalance.Caption = Repl(lblBalance.Caption, "%balance%", GP.MoneyToString(GP.Balance));
    MI = GP.GetMatchInfo(GP.CurrentLadder, GP.CurrentMenuRung);
    // End:0x1b2
    if(MI.MenuName != "")
    {
        lblInfo.Caption = Repl("%map%", MI.MenuName, lblInfo.Caption);
    }
    // End:0x246
    else
    {
        MR = class'CacheManager'.static.GetMapRecord(MI.LevelName);
        // End:0x216
        if(MR.FriendlyName != "")
        {
            lblInfo.Caption = Repl(lblInfo.Caption, "%map%", MR.FriendlyName);
        }
        // End:0x246
        else
        {
            lblInfo.Caption = Repl(lblInfo.Caption, "%map%", MR.MapName);
        }
    }
}

event HandleParameters(string Param1, string Param2)
{
    bNoBalanceCheck = Param1 != "";
    drawButtons();
    bInit = false;
}

function drawButtons()
{
    local int i, j, Health;
    local export editinline GUIImage img, img2;
    local export editinline GUIComboBox cb;
    local export editinline GUILabel lbl;
    local export editinline GUIButton btn;
    local float X, Y, BaseWidth, Spacing;
    local PlayerRecord pR;

    BaseWidth = i_FrameBG.WinWidth / float(1 + GP.GetMaxTeamSize());
    Spacing = BaseWidth / float(1 + GP.GetMaxTeamSize());
    X = i_FrameBG.WinLeft + Spacing;
    Y = lblInfo.WinTop + lblInfo.WinHeight;
    AssignedRoles = 0;
    CurrentFee = 0;
    i = 0;
    J0x9f:
    // End:0xc0a [While If]
    if(i < GP.GetMaxTeamSize())
    {
        pR = class'wUtil'.static.FindPlayerRecord(GP.PlayerTeam[i]);
        j = GP.GetBotPosition(pR.DefaultName);
        // End:0x127
        if(j == -1)
        {
            TeamFee[i] = 0;
            Health = 100;
        }
        // End:0x16d
        else
        {
            TeamFee[i] = GP.BotStats[j].Price;
            Health = GP.BotStats[j].Health;
        }
        img = new class'GUIImage';
        img.WinLeft = X;
        img.WinTop = Y;
        img.WinWidth = BaseWidth;
        img.WinHeight = img.WinWidth * 2.70;
        img.Image = PortraitBGMat;
        img.ImageStyle = 2;
        img.RenderWeight = 0.110;
        img.Hint = pR.DefaultName;
        img.bBoundToParent = true;
        AppendComponent(img, true);
        btn = new class'GUIButton';
        btn.WinLeft = img.WinLeft;
        btn.WinTop = img.WinTop;
        btn.WinWidth = img.WinWidth;
        btn.WinHeight = img.WinHeight;
        btn.RenderWeight = 0.50;
        btn.__OnHover__Delegate = showPlayerDetails;
        btn.StyleName = "NoBackground";
        btn.Tag = i;
        btn.bBoundToParent = true;
        AppendComponent(btn, true);
        img2 = new class'GUIImage';
        img2.WinLeft = img.WinLeft + 0.001250;
        img2.WinTop = img.WinTop + 0.0080;
        img2.WinWidth = img.WinWidth - 0.00250;
        img2.WinHeight = img.WinHeight - 0.0150;
        img2.Image = pR.Portrait;
        img2.ImageStyle = 2;
        img2.RenderWeight = 0.120;
        img2.Hint = pR.DefaultName;
        img2.ImageRenderStyle = 5;
        img2.ImageColor.A = byte(255);
        img2.bBoundToParent = true;
        // End:0x4c8
        if(Health < 100)
        {
            img2.ImageColor.G = byte(float(Health) * 1.50);
            img2.ImageColor.B = byte(float(Health) * 1.50);
        }
        AppendComponent(img2, true);
        imgFaces[i] = img2;
        lbl = new class'GUILabel';
        lbl.WinLeft = img.WinLeft;
        lbl.WinWidth = img.WinWidth;
        lbl.WinHeight = 0.090;
        lbl.WinTop = img.WinTop + 0.010;
        lbl.RenderWeight = 0.130;
        lbl.StyleName = "TextLabel";
        lbl.bMultiLine = true;
        // End:0x5dc
        if(j > -1)
        {
            lbl.Caption = GP.BotStats[j].Name;
        }
        lbl.TextAlign = 1;
        lbl.ShadowOffsetX = 1.50;
        lbl.ShadowOffsetY = 1.50;
        lbl.bBoundToParent = true;
        AppendComponent(lbl, true);
        // End:0x7cf
        if(!bNoBalanceCheck)
        {
            lbl = new class'GUILabel';
            lbl.WinLeft = img.WinLeft - 0.010;
            lbl.WinWidth = img.WinWidth;
            lbl.WinHeight = 0.090;
            lbl.WinTop = img.WinTop + img.WinHeight * WinWidth / WinHeight - lbl.WinHeight;
            lbl.RenderWeight = 0.130;
            lbl.StyleName = "TextLabel";
            lbl.bMultiLine = true;
            lbl.Caption = Repl(MinimalFeeCaption, "%fee%", GP.MoneyToString(int(Round(float(TeamFee[i]) * GP.LoserFee))));
            lbl.TextAlign = 2;
            lbl.ShadowOffsetX = 1.50;
            lbl.ShadowOffsetY = 1.50;
            lbl.bBoundToParent = true;
            AppendComponent(lbl, true);
        }
        // End:0x905
        if(Health < 100)
        {
            lbl = new class'GUILabel';
            lbl.WinLeft = img.WinLeft;
            lbl.WinWidth = img.WinWidth;
            lbl.WinHeight = 0.050;
            lbl.WinTop = img.WinTop + img.WinHeight / float(3);
            lbl.RenderWeight = 0.130;
            lbl.TextColor.R = byte(255);
            lbl.TextColor.G = 0;
            lbl.TextColor.B = 0;
            lbl.Caption = InjuredCaption;
            lbl.TextAlign = 1;
            lbl.bBoundToParent = true;
            AppendComponent(lbl, true);
        }
        cb = new class'GUIComboBox';
        cb.WinLeft = X - 0.0050;
        cb.WinTop = img.WinTop + img.WinHeight * WinWidth / WinHeight;
        cb.WinWidth = BaseWidth + 0.010;
        cb.WinHeight = 0.0360;
        cb.bReadOnly = true;
        cb.bShowListOnFocus = true;
        cb.__OnChange__Delegate = onRoleChange;
        cb.Tag = i;
        cb.TabOrder = 3 + i;
        cb.bBoundToParent = true;
        cb.Edit.FontScale = 0;
        AppendComponent(cb);
        cbRoles[i] = cb;
        j = 0;
        J0xa49:
        // End:0xa8f [While If]
        if(j < GP.GetNumPositions())
        {
            cb.AddItem(GP.PositionName[j]);
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0xa49;
        }
        cb.AddItem(InactiveMsg);
        cb.Find(InactiveMsg);
        // End:0xb8b
        if(AssignedRoles < MaxTeamMates && img2.Image != none && Health >= 100)
        {
            j = 0;
            J0xaf2:
            // End:0xb8b [While If]
            if(j < GP.4)
            {
                // End:0xb81
                if(GP.PlayerLineup[j] == i)
                {
                    cb.Find(GP.TextPositionDescription(GP.PlayerPositions[i]));
                    // End:0xb77
                    if(!bNoBalanceCheck)
                    {
                        CurrentFee += TeamFee[i];
                    }
                    ++ AssignedRoles;
                }
                // End:0xb8b
                else
                {
                    ++ j;
                    // This is an implied JumpToken; Continue!
                    goto J0xaf2;
                }
            }
        }
        // End:0xbed
        if(cb.Get() ~= InactiveMsg || img2.Image == none || Health < 100)
        {
            cb.DisableMe();
            img2.ImageColor.A = 128;
        }
        X += BaseWidth + Spacing;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x9f;
    }
    i = 0;
    J0xc11:
    // End:0xd11 [While If]
    if(i < GP.GetMaxTeamSize())
    {
        // End:0xd07
        if(cbRoles[i].Get() ~= InactiveMsg && imgFaces[i].Image != none && imgFaces[i].ImageColor.G >= 255 && AssignedRoles < MaxTeamMates)
        {
            cbRoles[i].SetIndex(0);
            cbRoles[i].EnableMe();
            imgFaces[i].ImageColor.A = byte(255);
            ++ AssignedRoles;
            // End:0xd07
            if(!bNoBalanceCheck)
            {
                CurrentFee += TeamFee[i];
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xc11;
    }
    setOkButtonState();
}

function bool InternalOnClick(GUIComponent Sender)
{
    local int i, cpos;
    local bool res;

    res = Controller.CloseMenu(Sender != btnOk);
    // End:0x10b
    if(Sender == btnOk)
    {
        i = 0;
        J0x38:
        // End:0x71 [While If]
        if(i < GP.4)
        {
            GP.PlayerLineup[i] = -1;
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x38;
        }
        cpos = 0;
        i = 0;
        J0x7f:
        // End:0x101 [While If]
        if(i < cbRoles.Length)
        {
            // End:0xf7
            if(cbRoles[i].Get() != InactiveMsg)
            {
                GP.SetLineup(cpos, i);
                GP.SetPosition(cpos, cbRoles[i].Get());
                ++ cpos;
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x7f;
        }
        onOkClick();
    }
    return res;
}

function onRoleChange(GUIComponent Sender)
{
    local int i;

    // End:0x0b
    if(bInit)
    {
        return;
    }
    AssignedRoles = 0;
    CurrentFee = 0;
    // End:0x69
    if(cbRoles[Sender.Tag].Get() ~= InactiveMsg)
    {
        imgFaces[Sender.Tag].ImageColor.A = 128;
    }
    // End:0x90
    else
    {
        imgFaces[Sender.Tag].ImageColor.A = byte(255);
    }
    i = 0;
    J0x97:
    // End:0xf4 [While If]
    if(i < cbRoles.Length)
    {
        // End:0xea
        if(cbRoles[i].Get() != InactiveMsg)
        {
            ++ AssignedRoles;
            // End:0xea
            if(!bNoBalanceCheck)
            {
                CurrentFee += TeamFee[i];
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x97;
    }
    i = 0;
    J0xfb:
    // End:0x1b0 [While If]
    if(i < cbRoles.Length)
    {
        // End:0x1a6
        if(cbRoles[i].Get() ~= InactiveMsg && imgFaces[i].Image != none && imgFaces[i].ImageColor.G >= 255)
        {
            // End:0x191
            if(AssignedRoles < MaxTeamMates)
            {
                cbRoles[i].EnableMe();
            }
            // End:0x1a6
            else
            {
                cbRoles[i].DisableMe();
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xfb;
    }
    setOkButtonState();
}

function setOkButtonState()
{
    local bool Enable;

    Enable = AssignedRoles == MaxTeamMates;
    // End:0x8d
    if(!bNoBalanceCheck)
    {
        // End:0x71
        if(float(CurrentFee) * GP.LoserFee < float(GP.Balance))
        {
            Enable = Enable && true;
            lblNoMoney.bVisible = false;
        }
        // End:0x8a
        else
        {
            Enable = false;
            lblNoMoney.bVisible = true;
        }
    }
    // End:0x9e
    else
    {
        lblNoMoney.bVisible = false;
    }
    // End:0xb9
    if(Enable)
    {
        btnOk.EnableMe();
    }
    // End:0xc8
    else
    {
        btnOk.DisableMe();
    }
}

function bool showPlayerDetails(GUIComponent Sender)
{
    local string PlayerDetails;
    local PlayerRecord ActivePR;

    // End:0x16
    if(Sender.Tag < 0)
    {
        return false;
    }
    ActivePR = class'wUtil'.static.FindPlayerRecord(GP.PlayerTeam[Sender.Tag]);
    PlayerDetails = ActivePR.DefaultName;
    PlayerDetails $= "|" $ AccuracyCaption @ string(class'wUtil'.static.AccuracyRating(ActivePR)) $ "%";
    PlayerDetails $= "|" $ AggressionCaption @ string(class'wUtil'.static.AggressivenessRating(ActivePR)) $ "%";
    PlayerDetails $= "|" $ AgilityCaption @ string(class'wUtil'.static.AgilityRating(ActivePR)) $ "%";
    PlayerDetails $= "|" $ TacticsCaption @ string(class'wUtil'.static.TacticsRating(ActivePR)) $ "%";
    PlayerDetails $= "|" $ class'wUtil'.static.GetFavoriteWeaponFor(ActivePR);
    sbCharInfo.SetContent(PlayerDetails);
    return true;
}

defaultproperties
{
    begin object name=SPMbtnOk class=GUIButton
        Caption="??"
        FontScale=0
        WinTop=0.9122920
        WinLeft=0.7640640
        WinWidth=0.20
        RenderWeight=0.20
        TabOrder=1
        bBoundToParent=true
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4SP_TeamRoles.SPMbtnOk'
    btnOk=SPMbtnOk
    begin object name=SPTbtnCancel class=GUIButton
        Caption="??"
        FontScale=0
        WinTop=0.9122920
        WinLeft=0.5328130
        WinWidth=0.20
        RenderWeight=0.20
        TabOrder=2
        bBoundToParent=true
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4SP_TeamRoles.SPTbtnCancel'
    btnCancel=SPTbtnCancel
    begin object name=SPTlblTitle class=GUILabel
        Caption="? ??"
        TextAlign=1
        FontScale=2
        StyleName="TextLabel"
        WinTop=0.0416660
        WinLeft=0.0890630
        WinWidth=0.8062510
        WinHeight=0.0650
        RenderWeight=0.20
        bBoundToParent=true
    object end
    // Reference: GUILabel'UT2K4SP_TeamRoles.SPTlblTitle'
    lblTitle=SPTlblTitle
    begin object name=SPTlblInfo class=GUILabel
        Caption="%map% ???? %gametype% ??, ??? %teammates% "
        TextAlign=1
        bMultiLine=true
        StyleName="TextLabel"
        WinTop=0.10
        WinLeft=0.0328130
        WinWidth=0.9312510
        WinHeight=0.058750
        RenderWeight=0.20
        bBoundToParent=true
    object end
    // Reference: GUILabel'UT2K4SP_TeamRoles.SPTlblInfo'
    lblInfo=SPTlblInfo
    begin object name=SPTlblNoMoney class=GUILabel
        Caption="? ?? ?? ??? ??? ?? ????."
        TextAlign=1
        TextColor=(R=228,G=0,B=0,A=255)
        bMultiLine=true
        ShadowOffsetX=1.0
        ShadowOffsetY=1.0
        WinTop=0.7583340
        WinLeft=0.5328130
        WinWidth=0.431250
        WinHeight=0.10250
        RenderWeight=0.20
        bBoundToParent=true
    object end
    // Reference: GUILabel'UT2K4SP_TeamRoles.SPTlblNoMoney'
    lblNoMoney=SPTlblNoMoney
    begin object name=SPTlblBalance class=GUILabel
        Caption="???: %balance%"
        TextAlign=2
        bMultiLine=true
        StyleName="TextLabel"
        WinTop=0.0499990
        WinLeft=0.5565630
        WinWidth=0.4150
        WinHeight=0.040
        RenderWeight=0.20
        bBoundToParent=true
    object end
    // Reference: GUILabel'UT2K4SP_TeamRoles.SPTlblBalance'
    lblBalance=SPTlblBalance
    begin object name=SPTsbCharInfo class=GUIScrollTextBox
        bNoTeletype=true
        bVisibleWhenEmpty=true
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.7266660
        WinLeft=0.03250
        WinWidth=0.468750
        WinHeight=0.21250
        RenderWeight=0.20
        TabOrder=3
        bBoundToParent=true
    object end
    // Reference: GUIScrollTextBox'UT2K4SP_TeamRoles.SPTsbCharInfo'
    sbCharInfo=SPTsbCharInfo
    InactiveMsg="?? ??"
    MinimalFeeCaption="?? ??:|%fee%"
    InjuredCaption="??"
    AggressionCaption="???:"
    AccuracyCaption="???:"
    AgilityCaption="???:"
    TacticsCaption="??:"
    DefaultLeft=0.0
    DefaultTop=0.060
    DefaultWidth=1.0
    DefaultHeight=0.880
    WinTop=0.060
    WinLeft=0.0
    WinWidth=1.0
    WinHeight=0.880
}