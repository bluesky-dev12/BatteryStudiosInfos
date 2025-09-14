class UT2K4SP_TeamRoles extends LargeWindow
    editinlinenew
    instanced;

var UT2K4GameProfile GP;
var Material PortraitBGMat;
var array<export editinline GUIImage> imgFaces;
var array<export editinline GUIComboBox> cbRoles;
var() automated GUIButton btnOk;
var() automated GUIButton btnCancel;
var() automated GUILabel lblTitle;
var() automated GUILabel lblInfo;
var() automated GUILabel lblNoMoney;
var() automated GUILabel lblBalance;
var() automated GUIScrollTextBox sbCharInfo;
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
//var delegate<onOkClick> __onOkClick__Delegate;

delegate onOkClick()
{
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local MatchInfo mi;
    local MapRecord MR;

    bInit = true;
    super(FloatingWindow).InitComponent(MyController, myOwner);
    GP = UT2K4GameProfile(PlayerOwner().Level.Game.CurrentGameProfile);
    // End:0x6C
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
    mi = GP.GetMatchInfo(GP.CurrentLadder, GP.CurrentMenuRung);
    // End:0x1B2
    if(mi.MenuName != "")
    {
        lblInfo.Caption = Repl("%map%", mi.MenuName, lblInfo.Caption);        
    }
    else
    {
        MR = Class'Engine.CacheManager'.static.GetMapRecord(mi.LevelName);
        // End:0x216
        if(MR.FriendlyName != "")
        {
            lblInfo.Caption = Repl(lblInfo.Caption, "%map%", MR.FriendlyName);            
        }
        else
        {
            lblInfo.Caption = Repl(lblInfo.Caption, "%map%", MR.MapName);
        }
    }
    //return;    
}

event HandleParameters(string Param1, string Param2)
{
    bNoBalanceCheck = Param1 != "";
    drawButtons();
    bInit = false;
    //return;    
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
    J0x9F:

    // End:0xC0A [Loop If]
    if(i < GP.GetMaxTeamSize())
    {
        pR = Class'WGame.wUtil'.static.FindPlayerRecord(GP.PlayerTeam[i]);
        j = GP.GetBotPosition(pR.DefaultName);
        // End:0x127
        if(j == -1)
        {
            TeamFee[i] = 0;
            Health = 100;            
        }
        else
        {
            TeamFee[i] = GP.BotStats[j].Price;
            Health = int(GP.BotStats[j].Health);
        }
        img = new Class'XInterface.GUIImage';
        img.WinLeft = X;
        img.WinTop = Y;
        img.WinWidth = BaseWidth;
        img.WinHeight = img.WinWidth * 2.7000000;
        img.Image = PortraitBGMat;
        img.ImageStyle = 2;
        img.RenderWeight = 0.1100000;
        img.Hint = pR.DefaultName;
        img.bBoundToParent = true;
        AppendComponent(img, true);
        btn = new Class'XInterface.GUIButton';
        btn.WinLeft = img.WinLeft;
        btn.WinTop = img.WinTop;
        btn.WinWidth = img.WinWidth;
        btn.WinHeight = img.WinHeight;
        btn.RenderWeight = 0.5000000;
        btn.__OnHover__Delegate = showPlayerDetails;
        btn.StyleName = "NoBackground";
        btn.Tag = i;
        btn.bBoundToParent = true;
        AppendComponent(btn, true);
        img2 = new Class'XInterface.GUIImage';
        img2.WinLeft = img.WinLeft + 0.0012500;
        img2.WinTop = img.WinTop + 0.0080000;
        img2.WinWidth = img.WinWidth - 0.0025000;
        img2.WinHeight = img.WinHeight - 0.0150000;
        img2.Image = pR.Portrait;
        img2.ImageStyle = 2;
        img2.RenderWeight = 0.1200000;
        img2.Hint = pR.DefaultName;
        img2.ImageRenderStyle = 5;
        img2.ImageColor.A = byte(255);
        img2.bBoundToParent = true;
        // End:0x4C8
        if(Health < 100)
        {
            img2.ImageColor.G = byte(float(Health) * 1.5000000);
            img2.ImageColor.B = byte(float(Health) * 1.5000000);
        }
        AppendComponent(img2, true);
        imgFaces[i] = img2;
        lbl = new Class'XInterface.GUILabel';
        lbl.WinLeft = img.WinLeft;
        lbl.WinWidth = img.WinWidth;
        lbl.WinHeight = 0.0900000;
        lbl.WinTop = img.WinTop + 0.0100000;
        lbl.RenderWeight = 0.1300000;
        lbl.StyleName = "TextLabel";
        lbl.bMultiLine = true;
        // End:0x5DC
        if(j > -1)
        {
            lbl.Caption = GP.BotStats[j].Name;
        }
        lbl.TextAlign = 1;
        lbl.ShadowOffsetX = 1.5000000;
        lbl.ShadowOffsetY = 1.5000000;
        lbl.bBoundToParent = true;
        AppendComponent(lbl, true);
        // End:0x7CF
        if(!bNoBalanceCheck)
        {
            lbl = new Class'XInterface.GUILabel';
            lbl.WinLeft = img.WinLeft - 0.0100000;
            lbl.WinWidth = img.WinWidth;
            lbl.WinHeight = 0.0900000;
            lbl.WinTop = (img.WinTop + (img.WinHeight * (WinWidth / WinHeight))) - lbl.WinHeight;
            lbl.RenderWeight = 0.1300000;
            lbl.StyleName = "TextLabel";
            lbl.bMultiLine = true;
            lbl.Caption = Repl(MinimalFeeCaption, "%fee%", GP.MoneyToString(int(Round(float(TeamFee[i]) * GP.LoserFee))));
            lbl.TextAlign = 2;
            lbl.ShadowOffsetX = 1.5000000;
            lbl.ShadowOffsetY = 1.5000000;
            lbl.bBoundToParent = true;
            AppendComponent(lbl, true);
        }
        // End:0x905
        if(Health < 100)
        {
            lbl = new Class'XInterface.GUILabel';
            lbl.WinLeft = img.WinLeft;
            lbl.WinWidth = img.WinWidth;
            lbl.WinHeight = 0.0500000;
            lbl.WinTop = img.WinTop + (img.WinHeight / float(3));
            lbl.RenderWeight = 0.1300000;
            lbl.TextColor.R = byte(255);
            lbl.TextColor.G = 0;
            lbl.TextColor.B = 0;
            lbl.Caption = InjuredCaption;
            lbl.TextAlign = 1;
            lbl.bBoundToParent = true;
            AppendComponent(lbl, true);
        }
        cb = new Class'XInterface.GUIComboBox';
        cb.WinLeft = X - 0.0050000;
        cb.WinTop = img.WinTop + (img.WinHeight * (WinWidth / WinHeight));
        cb.WinWidth = BaseWidth + 0.0100000;
        cb.WinHeight = 0.0360000;
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
        J0xA49:

        // End:0xA8F [Loop If]
        if(j < GP.GetNumPositions())
        {
            cb.AddItem(GP.PositionName[j]);
            j++;
            // [Loop Continue]
            goto J0xA49;
        }
        cb.AddItem(InactiveMsg);
        cb.Find(InactiveMsg);
        // End:0xB8B
        if(((AssignedRoles < MaxTeamMates) && img2.Image != none) && Health >= 100)
        {
            j = 0;
            J0xAF2:

            // End:0xB8B [Loop If]
            if(j < GP.4)
            {
                // End:0xB81
                if(GP.PlayerLineup[j] == i)
                {
                    cb.Find(GP.TextPositionDescription(int(GP.PlayerPositions[i])));
                    // End:0xB77
                    if(!bNoBalanceCheck)
                    {
                        CurrentFee += TeamFee[i];
                    }
                    AssignedRoles++;
                    // [Explicit Break]
                    goto J0xB8B;
                }
                j++;
                // [Loop Continue]
                goto J0xAF2;
            }
        }
        J0xB8B:

        // End:0xBED
        if(((cb.Get() ~= InactiveMsg) || img2.Image == none) || Health < 100)
        {
            cb.DisableMe();
            img2.ImageColor.A = 128;
        }
        X += (BaseWidth + Spacing);
        i++;
        // [Loop Continue]
        goto J0x9F;
    }
    i = 0;
    J0xC11:

    // End:0xD11 [Loop If]
    if(i < GP.GetMaxTeamSize())
    {
        // End:0xD07
        if((((cbRoles[i].Get() ~= InactiveMsg) && imgFaces[i].Image != none) && int(imgFaces[i].ImageColor.G) >= 255) && AssignedRoles < MaxTeamMates)
        {
            cbRoles[i].SetIndex(0);
            cbRoles[i].EnableMe();
            imgFaces[i].ImageColor.A = byte(255);
            AssignedRoles++;
            // End:0xD07
            if(!bNoBalanceCheck)
            {
                CurrentFee += TeamFee[i];
            }
        }
        i++;
        // [Loop Continue]
        goto J0xC11;
    }
    setOkButtonState();
    //return;    
}

function bool InternalOnClick(GUIComponent Sender)
{
    local int i, cpos;
    local bool res;

    res = Controller.CloseMenu(Sender != btnOk);
    // End:0x10B
    if(Sender == btnOk)
    {
        i = 0;
        J0x38:

        // End:0x71 [Loop If]
        if(i < GP.4)
        {
            GP.PlayerLineup[i] = -1;
            i++;
            // [Loop Continue]
            goto J0x38;
        }
        cpos = 0;
        i = 0;
        J0x7F:

        // End:0x101 [Loop If]
        if(i < cbRoles.Length)
        {
            // End:0xF7
            if(cbRoles[i].Get() != InactiveMsg)
            {
                GP.SetLineup(cpos, i);
                GP.SetPosition(cpos, cbRoles[i].Get());
                cpos++;
            }
            i++;
            // [Loop Continue]
            goto J0x7F;
        }
        onOkClick();
    }
    return res;
    //return;    
}

function onRoleChange(GUIComponent Sender)
{
    local int i;

    // End:0x0B
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
    else
    {
        imgFaces[Sender.Tag].ImageColor.A = byte(255);
    }
    i = 0;
    J0x97:

    // End:0xF4 [Loop If]
    if(i < cbRoles.Length)
    {
        // End:0xEA
        if(cbRoles[i].Get() != InactiveMsg)
        {
            AssignedRoles++;
            // End:0xEA
            if(!bNoBalanceCheck)
            {
                CurrentFee += TeamFee[i];
            }
        }
        i++;
        // [Loop Continue]
        goto J0x97;
    }
    i = 0;
    J0xFB:

    // End:0x1B0 [Loop If]
    if(i < cbRoles.Length)
    {
        // End:0x1A6
        if(((cbRoles[i].Get() ~= InactiveMsg) && imgFaces[i].Image != none) && int(imgFaces[i].ImageColor.G) >= 255)
        {
            // End:0x191
            if(AssignedRoles < MaxTeamMates)
            {
                cbRoles[i].EnableMe();
                // [Explicit Continue]
                goto J0x1A6;
            }
            cbRoles[i].DisableMe();
        }
        J0x1A6:

        i++;
        // [Loop Continue]
        goto J0xFB;
    }
    setOkButtonState();
    //return;    
}

function setOkButtonState()
{
    local bool Enable;

    Enable = AssignedRoles == MaxTeamMates;
    // End:0x8D
    if(!bNoBalanceCheck)
    {
        // End:0x71
        if((float(CurrentFee) * GP.LoserFee) < float(GP.Balance))
        {
            Enable = Enable && true;
            lblNoMoney.bVisible = false;            
        }
        else
        {
            Enable = false;
            lblNoMoney.bVisible = true;
        }        
    }
    else
    {
        lblNoMoney.bVisible = false;
    }
    // End:0xB9
    if(Enable)
    {
        btnOk.EnableMe();        
    }
    else
    {
        btnOk.DisableMe();
    }
    //return;    
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
    ActivePR = Class'WGame.wUtil'.static.FindPlayerRecord(GP.PlayerTeam[Sender.Tag]);
    PlayerDetails = ActivePR.DefaultName;
    PlayerDetails $= ((("|" $ AccuracyCaption) @ string(Class'WGame.wUtil'.static.AccuracyRating(ActivePR))) $ "%");
    PlayerDetails $= ((("|" $ AggressionCaption) @ string(Class'WGame.wUtil'.static.AggressivenessRating(ActivePR))) $ "%");
    PlayerDetails $= ((("|" $ AgilityCaption) @ string(Class'WGame.wUtil'.static.AgilityRating(ActivePR))) $ "%");
    PlayerDetails $= ((("|" $ TacticsCaption) @ string(Class'WGame.wUtil'.static.TacticsRating(ActivePR))) $ "%");
    PlayerDetails $= ("|" $ Class'WGame.wUtil'.static.GetFavoriteWeaponFor(ActivePR));
    sbCharInfo.SetContent(PlayerDetails);
    return true;
    //return;    
}

defaultproperties
{
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4SP_TeamRoles.SPMbtnOk'
    begin object name="SPMbtnOk" class=XInterface.GUIButton
        Caption="??"
        FontScale=0
        WinTop=0.9122920
        WinLeft=0.7640640
        WinWidth=0.2000000
        RenderWeight=0.2000000
        TabOrder=1
        bBoundToParent=true
        OnClick=UT2K4SP_TeamRoles.InternalOnClick
        OnKeyEvent=SPMbtnOk.InternalOnKeyEvent
    end object
    btnOk=SPMbtnOk
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4SP_TeamRoles.SPTbtnCancel'
    begin object name="SPTbtnCancel" class=XInterface.GUIButton
        Caption="??"
        FontScale=0
        WinTop=0.9122920
        WinLeft=0.5328130
        WinWidth=0.2000000
        RenderWeight=0.2000000
        TabOrder=2
        bBoundToParent=true
        OnClick=UT2K4SP_TeamRoles.InternalOnClick
        OnKeyEvent=SPTbtnCancel.InternalOnKeyEvent
    end object
    btnCancel=SPTbtnCancel
    // Reference: GUILabel'GUI2K4_Decompressed.UT2K4SP_TeamRoles.SPTlblTitle'
    begin object name="SPTlblTitle" class=XInterface.GUILabel
        Caption="? ??"
        TextAlign=1
        FontScale=2
        StyleName="TextLabel"
        WinTop=0.0416660
        WinLeft=0.0890630
        WinWidth=0.8062510
        WinHeight=0.0650000
        RenderWeight=0.2000000
        bBoundToParent=true
    end object
    lblTitle=SPTlblTitle
    // Reference: GUILabel'GUI2K4_Decompressed.UT2K4SP_TeamRoles.SPTlblInfo'
    begin object name="SPTlblInfo" class=XInterface.GUILabel
        Caption="%map% ???? %gametype% ??, ??? %teammates% "
        TextAlign=1
        bMultiLine=true
        StyleName="TextLabel"
        WinTop=0.1000000
        WinLeft=0.0328130
        WinWidth=0.9312510
        WinHeight=0.0587500
        RenderWeight=0.2000000
        bBoundToParent=true
    end object
    lblInfo=SPTlblInfo
    // Reference: GUILabel'GUI2K4_Decompressed.UT2K4SP_TeamRoles.SPTlblNoMoney'
    begin object name="SPTlblNoMoney" class=XInterface.GUILabel
        Caption="? ?? ?? ??? ??? ?? ????."
        TextAlign=1
        TextColor=(R=228,G=0,B=0,A=255)
        bMultiLine=true
        ShadowOffsetX=1.0000000
        ShadowOffsetY=1.0000000
        WinTop=0.7583340
        WinLeft=0.5328130
        WinWidth=0.4312500
        WinHeight=0.1025000
        RenderWeight=0.2000000
        bBoundToParent=true
    end object
    lblNoMoney=SPTlblNoMoney
    // Reference: GUILabel'GUI2K4_Decompressed.UT2K4SP_TeamRoles.SPTlblBalance'
    begin object name="SPTlblBalance" class=XInterface.GUILabel
        Caption="???: %balance%"
        TextAlign=2
        bMultiLine=true
        StyleName="TextLabel"
        WinTop=0.0499990
        WinLeft=0.5565630
        WinWidth=0.4150000
        WinHeight=0.0400000
        RenderWeight=0.2000000
        bBoundToParent=true
    end object
    lblBalance=SPTlblBalance
    // Reference: GUIScrollTextBox'GUI2K4_Decompressed.UT2K4SP_TeamRoles.SPTsbCharInfo'
    begin object name="SPTsbCharInfo" class=XInterface.GUIScrollTextBox
        bNoTeletype=true
        bVisibleWhenEmpty=true
        OnCreateComponent=SPTsbCharInfo.InternalOnCreateComponent
        WinTop=0.7266660
        WinLeft=0.0325000
        WinWidth=0.4687500
        WinHeight=0.2125000
        RenderWeight=0.2000000
        TabOrder=3
        bBoundToParent=true
    end object
    sbCharInfo=SPTsbCharInfo
    InactiveMsg="?? ??"
    MinimalFeeCaption="?? ??:|%fee%"
    InjuredCaption="??"
    AggressionCaption="???:"
    AccuracyCaption="???:"
    AgilityCaption="???:"
    TacticsCaption="??:"
    DefaultLeft=0.0000000
    DefaultTop=0.0600000
    DefaultWidth=1.0000000
    DefaultHeight=0.8800000
    WinTop=0.0600000
    WinLeft=0.0000000
    WinWidth=1.0000000
    WinHeight=0.8800000
}