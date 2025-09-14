class BTWindowUserPersonalInfo extends BTWindowHK
    editinlinenew
    instanced;

var localized string strButtonTab[2];
var export editinline TabControlMocker TabControl;
var FloatBox fbButtonTab[2];
var export editinline BTOwnerDrawCaptionButtonHK ButtonTab[2];
var FloatBox fbTPPanel;
var export editinline BTTPOptionBaseHK TPPanel[2];
var int VisiblePanelIdx;
var export editinline BTTPMyInfoBasicHK TPBasic;
var export editinline BTTPMyInfoStatHK TPStat;
var export editinline BTOwnerDrawImageHK BackgroundPanel;
var FloatBox fbBackgroundPanel;
var BTTcpLink_Channel kTcpChannel;
var ClanInfo kMyClanInfo;
var CharInfo kMyCharInfo;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local FloatBox fb, fbScrollBar;

    super.InitComponent(MyController, myOwner);
    TopLine.SetVisibility(false);
    BackgroundPanel = NewLabelComponent(Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(fbBackgroundPanel.X1, fbBackgroundPanel.Y1 + float(24), fbBackgroundPanel.X2, fbBackgroundPanel.Y2), Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_1);
    fb = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(fbBackgroundPanel.X1, fbBackgroundPanel.Y1 + float(24), fbBackgroundPanel.X2, fbBackgroundPanel.Y2);
    fbScrollBar = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox((fbBackgroundPanel.X2 - float(1)) - float(20), (fbBackgroundPanel.Y1 + float(1)) + float(24), fbBackgroundPanel.X2 - float(1), fbBackgroundPanel.Y2 - float(1));
    TPBasic = BTTPMyInfoBasicHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPMyInfoBasicHK', fb));
    TPStat = BTTPMyInfoStatHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPMyInfoStatHK', fb));
    TPPanel[0] = TPBasic;
    TPPanel[1] = TPStat;
    i = 0;
    J0x176:

    // End:0x347 [Loop If]
    if(i < 2)
    {
        fb = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox((fbBackgroundPanel.X1 + float(100 * i)) + float(i), fbBackgroundPanel.Y1 - float(2), (fbBackgroundPanel.X1 + float(100 * (i + 1))) + float(i), fbBackgroundPanel.Y1 + float(24));
        ButtonTab[i] = NewButtonComponent(fb);
        ButtonTab[i].SetDefaultBigTabButtonImage();
        ButtonTab[i].SetDefaultTabButtonFontColor();
        ButtonTab[i].Caption = strButtonTab[i];
        TPPanel[i].ACLList.ImageList.bForceScrollBarPosition = true;
        TPPanel[i].ACLList.ImageList.MyScrollBar.AWinPos = fbScrollBar;
        TPPanel[i].ACLList.ImageList.MyScrollBar.ApplyAWinPos();
        TPPanel[i].PostChangeScrollBarPos();
        TabControl.BindTabButtonAndPanel(ButtonTab[i], TPPanel[i]);
        ButtonTab[i].__OnClick__Delegate = ButtonTab_OnClick;
        i++;
        // [Loop Continue]
        goto J0x176;
    }
    TabControl.SetVisiblePanel(0);
    TPPanel[0].Internal_OnClick(none);
    VisiblePanelIdx = 0;
    //return;    
}

function bool ButtonTab_OnClick(GUIComponent Sender)
{
    local int lp1;

    lp1 = 0;
    J0x07:

    // End:0x80 [Loop If]
    if(lp1 < TabControl.Buttons.Length)
    {
        // End:0x76
        if(TabControl.Buttons[lp1] == Sender)
        {
            TabControl.SetVisiblePanel(lp1);
            TPPanel[lp1].Internal_OnClick(none);
            VisiblePanelIdx = lp1;
            // [Explicit Break]
            goto J0x80;
        }
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    J0x80:

    return true;
    //return;    
}

function Internal_OnOpen()
{
    Log("[BTWindowUserPersonalInfo::Internal_OnOpen] ");
    //return;    
}

function UpdateRequestServer()
{
    // End:0x29
    if(kTcpChannel != none)
    {
        kTcpChannel.sfReqCharInfo();
        kTcpChannel.sfReqCharDetailInfo();
    }
    //return;    
}

function UpdateCharInfo()
{
    local wMatchMaker MM;

    Log("[BTWindowUserPersonalInfo::UpdateCharInfo]");
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    // End:0xE4
    if(MM != none)
    {
        TPBasic.SetData(MM.kUID, MM.kUserName, MM.kClanName, MM.kClanPattern, MM.kClanBG, MM.kClanBL, kMyCharInfo, kMyClanInfo, MM.kClanLevel);
    }
    //return;    
}

function UpdateFriendCharInfo(string CharName, string ClanName, int CM_Pattern, int CM_BG, int CM_BL, string ClanPersonIntro, int MainWeaponItemID, int MainWeaponPartID, int SubWeaponItemID, int SubWeaponPartID, int AFSpecialCostumeItemID, int RSASpecialCostumeItemID, CharInfo stCharInfo, int ClanLevel)
{
    Log("[BTWindowUserPersonalInfo::UpdateFriendCharInfo]");
    //return;    
}

function UpdateCharDetailInfo(int MaxSerial, int MaxScore, int MaxKill, int MaxAssist, int Serial3, int Serial5, int Serial7, int Serial10, int Serial15, int AR, int SMG, int SR, int SW, int Melee, int Grenade, int FlashBang, int Foot, int AT4, int MG, int Fire, int RPG7, int TimeBomb, int IcendiaryBomb, int ClusterBomb, int ByChopper, int Artillery, int KillChopper, int FirstKill, int LastKill, int AllKill, int Dominate, int InstallBomb, int DefuseBomb)
{
    Log("[BTWindowUserPersonalInfo::UpdateCharDetailInfo]");
    TPStat.SetData(MaxSerial, MaxScore, MaxKill, MaxAssist, Serial3, Serial5, Serial7, Serial10, Serial15, AR, SMG, SR, SW, Melee, Grenade, FlashBang, Foot, AT4, MG, Fire, RPG7, TimeBomb, IcendiaryBomb, ClusterBomb, ByChopper, Artillery, KillChopper, FirstKill, LastKill, AllKill, Dominate, InstallBomb, DefuseBomb);
    //return;    
}

function UpdateRankingCount(byte RankingType, byte CommunityType, int TotalCount)
{
    Log("[BTWindowUserPersonalInfo::UpdateRankingCount]");
    //return;    
}

function UpdateRankingInfoList(byte RankingType, byte CommunityType, array<string> CharName, array<int> CharLevel, array<string> ClanName, array<int> ClanMarkPattern, array<int> ClanMarkBG, array<int> ClanMarkBL, array<int> Ranking_Accum, array<int> Ranking_Accum_Prev, array<int> Ranking_Accum_Exp, array<int> LevelMarkID, array<int> TitleMarkID, array<int> Reserved1, array<int> Reserved2, array<int> Reserved3)
{
    Log("[BTWindowUserPersonalInfo::UpdateRankingInfoList]");
    //return;    
}

function UpdateRankingInfoCompleted()
{
    Log("[BTWindowUserPersonalInfo::UpdateRankingInfoCompleted]");
    //return;    
}

function setTcpChannel(BTTcpLink_Channel TcpChannel)
{
    kTcpChannel = TcpChannel;
    //return;    
}

function SetCharInfo(CharInfo CharInfo)
{
    kMyCharInfo = CharInfo;
    //return;    
}

function SetClanInfo(ClanInfo ClanInfo)
{
    kMyClanInfo = ClanInfo;
    //return;    
}

defaultproperties
{
    strButtonTab[0]="????????????"
    strButtonTab[1]="????????????????"
    // Reference: TabControlMocker'GUIWarfareControls_Decompressed.BTWindowUserPersonalInfo.mTabControl'
    begin object name="mTabControl" class=GUIWarfareControls_Decompressed.TabControlMocker
    end object
    TabControl=mTabControl
    fbBackgroundPanel=(X1=188.0000000,Y1=41.0000000,X2=836.0000000,Y2=691.0000000)
    fbBackgroundImage=(X1=158.0000000,Y1=16.0000000,X2=866.0000000,Y2=753.0000000)
    fbTopLine=(X1=178.0000000,Y1=36.0000000,X2=846.0000000,Y2=62.0000000)
    fbBottomLine=(X1=178.0000000,Y1=690.0000000,X2=846.0000000,Y2=733.0000000)
    fbButtonOK=(X1=391.0000000,Y1=696.0000000,X2=510.0000000,Y2=728.0000000)
    fbButtonCancel=(X1=515.0000000,Y1=696.0000000,X2=634.0000000,Y2=728.0000000)
    CloseWeb=true
    strOK="?????? Clan"
    strCancel="??????"
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
    OnOpen=BTWindowUserPersonalInfo.Internal_OnOpen
}