/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4SPTab_DetailPhantom.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:7
 *	Functions:4
 *
 *******************************************************************************/
class UT2K4SPTab_DetailPhantom extends UT2K4SPTab_Base
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify MultiSelectListBox lbMatches;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sbgMatchesBg;
var localized string VS;
var localized string msgMatchInfo;
var localized string msgGameTime;
var localized string msgScore;
var string TeamDetailPage;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local UT2K4MatchInfo MI;

    super.InitComponent(MyController, myOwner);
    lbMatches.List.TextAlign = 1;
    lbMatches.List.OnClickSound = 0;
    lbMatches.List.bHotTrack = true;
    lbMatches.List.__OnTrack__Delegate = OnPhantomTrack;
    lbMatches.List.__OnClick__Delegate = None;
    i = 0;
    J0x9f:
    // End:0x2f2 [While If]
    if(i < GP.PhantomMatches.Length)
    {
        lbMatches.List.Add(GetTeamName(GP.TeamStats[GP.PhantomMatches[i].Team1].Name) @ VS @ GetTeamName(GP.TeamStats[GP.PhantomMatches[i].Team2].Name));
        MI = UT2K4MatchInfo(GP.GetMatchInfo(GP.PhantomMatches[i].LadderId, GP.PhantomMatches[i].MatchID));
        lbMatches.List.Add(Repl(Repl(msgMatchInfo, "%gametype%", GP.GetLadderDescription(GP.PhantomMatches[i].LadderId, GP.PhantomMatches[i].MatchID)), "%map%", MI.LevelName));
        lbMatches.List.Add(Repl(Repl(msgScore, "%team1%", string(int(Round(GP.PhantomMatches[i].ScoreTeam1)))), "%team2%", string(int(Round(GP.PhantomMatches[i].ScoreTeam2)))));
        lbMatches.List.Add(Repl(msgGameTime, "%gametime%", string(GP.PhantomMatches[i].GameTime / float(60))));
        lbMatches.List.Add(" ");
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x9f;
    }
}

function string GetTeamName(string TeamClass)
{
    local class<UT2K4TeamRoster> ETI;

    ETI = class<UT2K4TeamRoster>(DynamicLoadObject(TeamClass, class'Class'));
    // End:0x62
    if(ETI == none)
    {
        Warn(TeamClass @ "is not a valid subclass of UT2K4TeamRoster");
        return "????";
    }
    return ETI.default.TeamName;
}

function cmMatchesOnClick(GUIContextMenu Sender, int ClickIndex)
{
    local int tIndex;

    // End:0xd8
    if(ClickIndex == 0)
    {
        // End:0x76
        if(Controller.MouseX > lbMatches.ActualLeft() + lbMatches.ActualWidth() / float(2))
        {
            tIndex = GP.PhantomMatches[lbMatches.List.Index / 5].Team2;
        }
        // End:0xab
        else
        {
            tIndex = GP.PhantomMatches[lbMatches.List.Index / 5].Team1;
        }
        Controller.OpenMenu(TeamDetailPage, GP.TeamStats[tIndex].Name);
    }
}

function OnPhantomTrack(GUIComponent Sender, int LastIndex)
{
    local int rindex, i, j;

    rindex = lbMatches.List.Index / 5;
    j = 0;
    J0x28:
    // End:0xee [While If]
    if(j < MultiSelectList(lbMatches.List).MElements.Length / 5)
    {
        i = 0;
        J0x5a:
        // End:0xe4 [While If]
        if(i < 4 && j * 5 + i < MultiSelectList(lbMatches.List).MElements.Length)
        {
            MultiSelectList(lbMatches.List).MElements[j * 5 + i].bSelected = rindex == j;
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x5a;
        }
        ++ j;
        // This is an implied JumpToken; Continue!
        goto J0x28;
    }
}

defaultproperties
{
    begin object name=SPDPlbMatches class=MultiSelectListBox
        bVisibleWhenEmpty=true
        OnCreateComponent=InternalOnCreateComponent
        FontScale=1
        WinTop=0.1796970
        WinLeft=0.1178320
        WinWidth=0.7643370
        WinHeight=0.6860970
        RenderWeight=0.20
        bBoundToParent=true
    object end
    // Reference: MultiSelectListBox'UT2K4SPTab_DetailPhantom.SPDPlbMatches'
    lbMatches=SPDPlbMatches
    begin object name=SPDPimgMatchesBg class=GUISectionBackground
        Caption="??? ?? ?? ?? ??? ?? ???? ?? ???"
        WinTop=0.10
        WinLeft=0.10
        WinWidth=0.80
        WinHeight=0.80
        bBoundToParent=true
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'UT2K4SPTab_DetailPhantom.SPDPimgMatchesBg'
    sbgMatchesBg=SPDPimgMatchesBg
    VS="vs"
    msgMatchInfo="%map% ??? %gametype% ??"
    msgGameTime="?? ??: %gametime% ?"
    msgScore="??: %team1% - %team2%"
    TeamDetailPage="GUI2K4.UT2K4SP_DetailsTeam"
    PanelCaption="?? ???? ???"
    begin object name=SPDPcmMatches class=GUIContextMenu
        ContextItems=// Object reference not set to an instance of an object.
        
        OnSelect=cmMatchesOnClick
    object end
    // Reference: GUIContextMenu'UT2K4SPTab_DetailPhantom.SPDPcmMatches'
    ContextMenu=SPDPcmMatches
}