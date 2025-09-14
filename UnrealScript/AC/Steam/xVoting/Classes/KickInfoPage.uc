/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path xVoting\Classes\KickInfoPage.uc
 * Package Imports:
 *	xVoting
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:14
 *	Functions:4
 *
 *******************************************************************************/
class KickInfoPage extends LargeWindow
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_ReturnButton;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage i_PlayerPortrait;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel l_PlayerName;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify PlayerInfoMultiColumnListBox lb_PlayerInfoBox;
var localized string PlayerText;
var localized string PingText;
var localized string ScoreText;
var localized string IDText;
var localized string IPText;
var localized string KillsText;
var localized string DeathsText;
var localized string SuicidesText;
var localized string MultiKillsText;
var localized string SpreesText;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(FloatingWindow).InitComponent(MyController, myOwner);
    b_ReturnButton.__OnClick__Delegate = ReturnButtonOnClick;
}

function HandleParameters(string Param1, string Param2)
{
    LoadInfo(Param1);
}

function LoadInfo(string PlayerName)
{
    local int i, MultiKills, Sprees;
    local Material Portrait;
    local PlayerReplicationInfo PRI;

    // End:0x0e
    if(PlayerName == "")
    {
        return;
    }
    // End:0x24
    if(!Controller.bCurMenuInitialized)
    {
        return;
    }
    i = 0;
    J0x2b:
    // End:0xa7 [While If]
    if(i < PlayerOwner().GameReplicationInfo.PRIArray.Length)
    {
        // End:0x9d
        if(PlayerOwner().GameReplicationInfo.PRIArray[i].PlayerName == PlayerName)
        {
            PRI = PlayerOwner().GameReplicationInfo.PRIArray[i];
        }
        // End:0xa7
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x2b;
        }
    }
    Portrait = PRI.GetPortrait();
    // End:0xf6
    if(Portrait == none)
    {
        Portrait = Material(DynamicLoadObject("PlayerPictures.cDefault", class'Material'));
    }
    i_PlayerPortrait.Image = Portrait;
    l_PlayerName.Caption = PlayerName;
    lb_PlayerInfoBox.Add(PingText, string(PRI.Ping));
    lb_PlayerInfoBox.Add(ScoreText, string(PRI.Score));
    lb_PlayerInfoBox.Add(KillsText, string(PRI.Kills));
    lb_PlayerInfoBox.Add(DeathsText, string(PRI.Deaths));
    // End:0x29b
    if(TeamPlayerReplicationInfo(PRI) != none)
    {
        lb_PlayerInfoBox.Add(SuicidesText, string(TeamPlayerReplicationInfo(PRI).Suicides));
        i = 0;
        J0x1ee:
        // End:0x226 [While If]
        if(i < 7)
        {
            MultiKills += TeamPlayerReplicationInfo(PRI).MultiKills[i];
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x1ee;
        }
        lb_PlayerInfoBox.Add(MultiKillsText, string(MultiKills));
        i = 0;
        J0x248:
        // End:0x280 [While If]
        if(i < 6)
        {
            Sprees += TeamPlayerReplicationInfo(PRI).Spree[i];
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x248;
        }
        lb_PlayerInfoBox.Add(SpreesText, string(Sprees));
    }
}

function bool ReturnButtonOnClick(GUIComponent Sender)
{
    Controller.CloseMenu(true);
    return true;
}

defaultproperties
{
    begin object name=ExitButton class=GUIButton
        Caption="????"
        WinTop=0.5316920
        WinLeft=0.6709340
        WinWidth=0.120
        WinHeight=0.0332030
        RenderWeight=1.0
        TabOrder=2
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'KickInfoPage.ExitButton'
    b_ReturnButton=ExitButton
    begin object name=KickImagePlayerPortrait class=GUIImage
        ImageStyle=2
        ImageRenderStyle=1
        WinTop=0.1931990
        WinLeft=0.2069240
        WinWidth=0.1558140
        WinHeight=0.3585250
    object end
    // Reference: GUIImage'KickInfoPage.KickImagePlayerPortrait'
    i_PlayerPortrait=KickImagePlayerPortrait
    begin object name=PlayerNameLabel class=GUILabel
        Caption="???? ??"
        TextAlign=1
        TextColor=(R=255,G=255,B=255,A=255)
        TextFont="UT2SmallHeaderFont"
        WinTop=0.1954290
        WinLeft=0.3656790
        WinWidth=0.4253710
        WinHeight=0.0382970
        RenderWeight=0.30
    object end
    // Reference: GUILabel'KickInfoPage.PlayerNameLabel'
    l_PlayerName=PlayerNameLabel
    begin object name=PlayerInfoBoxControl class=PlayerInfoMultiColumnListBox
        bVisibleWhenEmpty=true
        OnCreateComponent=InternalOnCreateComponent
        StyleName="ServerBrowserGrid"
        WinTop=0.2342860
        WinLeft=0.366960
        WinWidth=0.4224770
        WinHeight=0.2994830
    object end
    // Reference: PlayerInfoMultiColumnListBox'KickInfoPage.PlayerInfoBoxControl'
    lb_PlayerInfoBox=PlayerInfoBoxControl
    PingText="?"
    ScoreText="??"
    IDText="???? ID"
    IPText="IP ??"
    KillsText="??"
    DeathsText="Deaths"
    SuicidesText="??"
    MultiKillsText="????"
    SpreesText="???"
    bRequire640x480=true
    bAllowedAsLast=true
    WinTop=0.1512760
    WinLeft=0.1887430
    WinWidth=0.6225020
    WinHeight=0.4407030
    bAcceptsInput=true
}