class UT2K4SPTab_DetailPhantom extends UT2K4SPTab_Base
    editinlinenew
    instanced;

var() automated MultiSelectListBox lbMatches;
var() automated GUISectionBackground sbgMatchesBg;
var localized string VS;
var localized string msgMatchInfo;
var localized string msgGameTime;
var localized string msgScore;
var string TeamDetailPage;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local UT2K4MatchInfo mi;

    super.InitComponent(MyController, myOwner);
    lbMatches.List.TextAlign = 1;
    lbMatches.List.OnClickSound = 0;
    lbMatches.List.bHotTrack = true;
    lbMatches.List.__OnTrack__Delegate = OnPhantomTrack;
    lbMatches.List.__OnClick__Delegate = None;
    i = 0;
    J0x9F:

    // End:0x2F2 [Loop If]
    if(i < GP.PhantomMatches.Length)
    {
        lbMatches.List.Add(((GetTeamName(GP.TeamStats[GP.PhantomMatches[i].Team1].Name)) @ VS) @ (GetTeamName(GP.TeamStats[GP.PhantomMatches[i].Team2].Name)));
        mi = UT2K4MatchInfo(GP.GetMatchInfo(GP.PhantomMatches[i].LadderId, GP.PhantomMatches[i].MatchID));
        lbMatches.List.Add(Repl(Repl(msgMatchInfo, "%gametype%", GP.GetLadderDescription(GP.PhantomMatches[i].LadderId, GP.PhantomMatches[i].MatchID)), "%map%", mi.LevelName));
        lbMatches.List.Add(Repl(Repl(msgScore, "%team1%", string(int(Round(GP.PhantomMatches[i].ScoreTeam1)))), "%team2%", string(int(Round(GP.PhantomMatches[i].ScoreTeam2)))));
        lbMatches.List.Add(Repl(msgGameTime, "%gametime%", string(GP.PhantomMatches[i].GameTime / float(60))));
        lbMatches.List.Add(" ");
        i++;
        // [Loop Continue]
        goto J0x9F;
    }
    //return;    
}

function string GetTeamName(string TeamClass)
{
    local Class<UT2K4TeamRoster> ETI;

    ETI = Class<UT2K4TeamRoster>(DynamicLoadObject(TeamClass, Class'Core.Class'));
    // End:0x62
    if(ETI == none)
    {
        Warn(TeamClass @ "is not a valid subclass of UT2K4TeamRoster");
        return "????";
    }
    return ETI.default.TeamName;
    //return;    
}

function cmMatchesOnClick(GUIContextMenu Sender, int ClickIndex)
{
    local int tIndex;

    // End:0xD8
    if(ClickIndex == 0)
    {
        // End:0x76
        if(Controller.MouseX > (lbMatches.ActualLeft() + (lbMatches.ActualWidth() / float(2))))
        {
            tIndex = GP.PhantomMatches[lbMatches.List.Index / 5].Team2;            
        }
        else
        {
            tIndex = GP.PhantomMatches[lbMatches.List.Index / 5].Team1;
        }
        Controller.OpenMenu(TeamDetailPage, GP.TeamStats[tIndex].Name);
    }
    //return;    
}

function OnPhantomTrack(GUIComponent Sender, int LastIndex)
{
    local int rindex, i, j;

    rindex = lbMatches.List.Index / 5;
    j = 0;
    J0x28:

    // End:0xEE [Loop If]
    if(j < (MultiSelectList(lbMatches.List).MElements.Length / 5))
    {
        i = 0;
        J0x5A:

        // End:0xE4 [Loop If]
        if((i < 4) && ((j * 5) + i) < MultiSelectList(lbMatches.List).MElements.Length)
        {
            MultiSelectList(lbMatches.List).MElements[(j * 5) + i].bSelected = rindex == j;
            i++;
            // [Loop Continue]
            goto J0x5A;
        }
        j++;
        // [Loop Continue]
        goto J0x28;
    }
    //return;    
}

defaultproperties
{
    // Reference: MultiSelectListBox'GUI2K4_Decompressed.UT2K4SPTab_DetailPhantom.SPDPlbMatches'
    begin object name="SPDPlbMatches" class=XInterface.MultiSelectListBox
        bVisibleWhenEmpty=true
        OnCreateComponent=SPDPlbMatches.InternalOnCreateComponent
        FontScale=1
        WinTop=0.1796970
        WinLeft=0.1178320
        WinWidth=0.7643370
        WinHeight=0.6860970
        RenderWeight=0.2000000
        bBoundToParent=true
    end object
    lbMatches=SPDPlbMatches
    // Reference: GUISectionBackground'GUI2K4_Decompressed.UT2K4SPTab_DetailPhantom.SPDPimgMatchesBg'
    begin object name="SPDPimgMatchesBg" class=XInterface.GUISectionBackground
        Caption="??? ?? ?? ?? ??? ?? ???? ?? ???"
        WinTop=0.1000000
        WinLeft=0.1000000
        WinWidth=0.8000000
        WinHeight=0.8000000
        bBoundToParent=true
        OnPreDraw=SPDPimgMatchesBg.InternalPreDraw
    end object
    sbgMatchesBg=SPDPimgMatchesBg
    VS="vs"
    msgMatchInfo="%map% ??? %gametype% ??"
    msgGameTime="?? ??: %gametime% ?"
    msgScore="??: %team1% - %team2%"
    TeamDetailPage="GUI2K4.UT2K4SP_DetailsTeam"
    PanelCaption="?? ???? ???"
    // Reference: GUIContextMenu'GUI2K4_Decompressed.UT2K4SPTab_DetailPhantom.SPDPcmMatches'
    begin object name="SPDPcmMatches" class=XInterface.GUIContextMenu
        ContextItems=/* Array type was not detected. */
        OnSelect=UT2K4SPTab_DetailPhantom.cmMatchesOnClick
    end object
    ContextMenu=SPDPcmMatches
}