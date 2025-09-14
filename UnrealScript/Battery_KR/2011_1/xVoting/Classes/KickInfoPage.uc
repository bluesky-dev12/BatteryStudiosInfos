class KickInfoPage extends LargeWindow
    editinlinenew
    instanced;

var() automated GUIButton b_ReturnButton;
var() automated GUIImage i_PlayerPortrait;
var() automated GUILabel l_PlayerName;
var() automated PlayerInfoMultiColumnListBox lb_PlayerInfoBox;
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
    //return;    
}

function HandleParameters(string Param1, string Param2)
{
    LoadInfo(Param1);
    //return;    
}

function LoadInfo(string PlayerName)
{
    local int i, MultiKills, Sprees;
    local Material Portrait;
    local PlayerReplicationInfo PRI;

    // End:0x0E
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
    J0x2B:

    // End:0xA7 [Loop If]
    if(i < PlayerOwner().GameReplicationInfo.PRIArray.Length)
    {
        // End:0x9D
        if(PlayerOwner().GameReplicationInfo.PRIArray[i].PlayerName == PlayerName)
        {
            PRI = PlayerOwner().GameReplicationInfo.PRIArray[i];
            // [Explicit Break]
            goto J0xA7;
        }
        i++;
        // [Loop Continue]
        goto J0x2B;
    }
    J0xA7:

    Portrait = PRI.GetPortrait();
    // End:0xF6
    if(Portrait == none)
    {
        Portrait = Material(DynamicLoadObject("PlayerPictures.cDefault", Class'Engine.Material'));
    }
    i_PlayerPortrait.Image = Portrait;
    l_PlayerName.Caption = PlayerName;
    lb_PlayerInfoBox.Add(PingText, string(PRI.Ping));
    lb_PlayerInfoBox.Add(ScoreText, string(PRI.Score));
    lb_PlayerInfoBox.Add(KillsText, string(PRI.Kills));
    lb_PlayerInfoBox.Add(DeathsText, string(PRI.Deaths));
    // End:0x29B
    if(TeamPlayerReplicationInfo(PRI) != none)
    {
        lb_PlayerInfoBox.Add(SuicidesText, string(TeamPlayerReplicationInfo(PRI).Suicides));
        i = 0;
        J0x1EE:

        // End:0x226 [Loop If]
        if(i < 7)
        {
            MultiKills += int(TeamPlayerReplicationInfo(PRI).MultiKills[i]);
            i++;
            // [Loop Continue]
            goto J0x1EE;
        }
        lb_PlayerInfoBox.Add(MultiKillsText, string(MultiKills));
        i = 0;
        J0x248:

        // End:0x280 [Loop If]
        if(i < 6)
        {
            Sprees += int(TeamPlayerReplicationInfo(PRI).Spree[i]);
            i++;
            // [Loop Continue]
            goto J0x248;
        }
        lb_PlayerInfoBox.Add(SpreesText, string(Sprees));
    }
    //return;    
}

function bool ReturnButtonOnClick(GUIComponent Sender)
{
    Controller.CloseMenu(true);
    return true;
    //return;    
}

defaultproperties
{
    // Reference: GUIButton'xVoting_Decompressed.KickInfoPage.ExitButton'
    begin object name="ExitButton" class=XInterface.GUIButton
        Caption="????"
        WinTop=0.5316920
        WinLeft=0.6709340
        WinWidth=0.1200000
        WinHeight=0.0332030
        RenderWeight=1.0000000
        TabOrder=2
        OnKeyEvent=ExitButton.InternalOnKeyEvent
    end object
    b_ReturnButton=ExitButton
    // Reference: GUIImage'xVoting_Decompressed.KickInfoPage.KickImagePlayerPortrait'
    begin object name="KickImagePlayerPortrait" class=XInterface.GUIImage
        ImageStyle=2
        ImageRenderStyle=1
        WinTop=0.1931990
        WinLeft=0.2069240
        WinWidth=0.1558140
        WinHeight=0.3585250
    end object
    i_PlayerPortrait=KickImagePlayerPortrait
    // Reference: GUILabel'xVoting_Decompressed.KickInfoPage.PlayerNameLabel'
    begin object name="PlayerNameLabel" class=XInterface.GUILabel
        Caption="???? ??"
        TextAlign=1
        TextColor=(R=255,G=255,B=255,A=255)
        TextFont="UT2SmallHeaderFont"
        WinTop=0.1954290
        WinLeft=0.3656790
        WinWidth=0.4253710
        WinHeight=0.0382970
        RenderWeight=0.3000000
    end object
    l_PlayerName=PlayerNameLabel
    // Reference: PlayerInfoMultiColumnListBox'xVoting_Decompressed.KickInfoPage.PlayerInfoBoxControl'
    begin object name="PlayerInfoBoxControl" class=xVoting_Decompressed.PlayerInfoMultiColumnListBox
        bVisibleWhenEmpty=true
        OnCreateComponent=PlayerInfoBoxControl.InternalOnCreateComponent
        StyleName="ServerBrowserGrid"
        WinTop=0.2342860
        WinLeft=0.3669600
        WinWidth=0.4224770
        WinHeight=0.2994830
    end object
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
    bRequire640x480=false
    bAllowedAsLast=true
    WinTop=0.1512760
    WinLeft=0.1887430
    WinWidth=0.6225020
    WinHeight=0.4407030
    bAcceptsInput=false
}