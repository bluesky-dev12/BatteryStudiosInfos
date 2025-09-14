class SPProfileExporter extends Object;

var string ResultFile;
var protected string fileName;
var protected string FileExt;
var protected UT2K4GameProfile GP;
var protected FileLog output;
var protected LevelInfo Level;

function bool Create(UT2K4GameProfile myGP, LevelInfo myLevel, optional string myFilename, optional string myExt)
{
    GP = myGP;
    Level = myLevel;
    // End:0x2D
    if(myFilename != "")
    {
        fileName = myFilename;
    }
    fileName = FormatString(fileName);
    // End:0x55
    if(myExt != "")
    {
        FileExt = myExt;
    }
    return (GP != none) && Level != none;
    //return;    
}

function ExportProfile()
{
    // End:0x1C
    if(!GP != none && Level != none)
    {
        return;
    }
    output = Level.Spawn(Class'Engine.FileLog');
    output.OpenLog(fileName, FileExt, true);
    ResultFile = output.LogFileName;
    expHeader();
    expBody();
    expFooter();
    output.CloseLog();
    //return;    
}

protected function expHeader()
{
    output.Logf("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">");
    output.Logf("<html><head>");
    output.Logf(("<title>UT2004 Exported Single Player Details -" @ GP.PackageName) @ "</title>");
    output.Logf(((("<meta name=\"Generator\" content=\"UnrealEngine2 build " $ Level.EngineVersion) $ " - exporter: ") $ string(self.Class)) $ "\">");
    expStyle();
    output.Logf("</head><body>");
    output.Logf("<div class=\"title\">UT2004 Exported Profile</div>");
    output.Logf("<table class=\"tabpages\">");
    output.Logf("<colgroup><col width=\"1*\"><col width=\"1*\"><col width=\"1*\"><col width=\"1*\"><col width=\"1*\"><col width=\"1*\"><col width=\"1*\"></colgroup>");
    output.Logf("<tr>");
    output.Logf("<td class=\"tab\" id=\"a_d_basic\" onclick=\"showDiv('d_basic');\" onmouseover=\"tabHover('a_d_basic', true);\" onmouseout=\"tabHover('a_d_basic', false);\">Basic</td>");
    output.Logf("<td class=\"tab\" id=\"a_d_awards\" onclick=\"showDiv('d_awards');\" onmouseover=\"tabHover('a_d_awards', true);\" onmouseout=\"tabHover('a_d_awards', false);\">Awards</td>");
    output.Logf("<td class=\"tab\" id=\"a_d_ladders\" onclick=\"showDiv('d_ladders');\" onmouseover=\"tabHover('a_d_ladders', true);\" onmouseout=\"tabHover('a_d_ladders', false);\">Ladders</td>");
    output.Logf("<td class=\"tab\" id=\"a_d_botstats\" onclick=\"showDiv('d_botstats');\" onmouseover=\"tabHover('a_d_botstats', true);\" onmouseout=\"tabHover('a_d_botstats', false);\">Bot stats</td>");
    output.Logf("<td class=\"tab\" id=\"a_d_teamstats\" onclick=\"showDiv('d_teamstats');\" onmouseover=\"tabHover('a_d_teamstats', true);\" onmouseout=\"tabHover('a_d_teamstats', false);\">Team stats</td>");
    output.Logf("<td class=\"tab\" id=\"a_d_lastmatch\" onclick=\"showDiv('d_lastmatch');\" onmouseover=\"tabHover('a_d_lastmatch', true);\" onmouseout=\"tabHover('a_d_lastmatch', false);\">Last match</td>");
    output.Logf("<td class=\"tab\" id=\"a_d_history\" onclick=\"showDiv('d_history');\" onmouseover=\"tabHover('a_d_history', true);\" onmouseout=\"tabHover('a_d_history', false);\">Fight history</td>");
    output.Logf("</tr>");
    output.Logf("</table>");
    //return;    
}

protected function expStyle()
{
    output.Logf("<style>");
    output.Logf("BODY { font-family: sans-serif; color: white; background-color: midnightblue; }");
    output.Logf("TABLE { border: 2px outset navy;  text-align: center; width: 100%; }");
    output.Logf("TH { color: gold; font-size: smaller; text-align: center; }");
    output.Logf("TD { vertical-align: top; border: 1px inset navy;  empty-cells: show; padding: 2px; text-align: center; }");
    output.Logf("TD.right { text-align: right; }");
    output.Logf("DIV.title { font-size: xx-large; width: 100%; border: 3px outset gold;  text-align: center;  font-weight: bold;  background-color: gold;  color: midnightblue;  margin-bottom: 10px;      }");
    output.Logf("H1 { border-bottom: 2px solid gold; text-align: center; }");
    output.Logf("H2 { border-bottom: 2px solid gold; text-align: center; }");
    output.Logf("H3 { border-bottom: 1px solid gold; text-align: center; }");
    output.Logf("TR:Hover { background-color: navy; }");
    output.Logf("DIV.hidden { visibility: hidden; position: absolute; width: 75%; margin-left: 12.5%; }");
    output.Logf("TABLE.tabpages { border: none; }");
    output.Logf("TD.tab { vertical-align: top; border: 2px outset navy; padding: 2px; background-color: midnightblue; cursor: pointer; }");
    output.Logf("TD.tab_hover { border: 2px outset gold; background-color: navy; cursor: pointer; }");
    output.Logf("TD.activetab { vertical-align: top; border: 2px outset gold; padding: 2px; background-color: gold; color: navy; cursor: default; }");
    output.Logf("</style>");
    //return;    
}

protected function expFooter()
{
    output.Logf("<script language=\"javascript\">");
    output.Logf("curtd = null;");
    output.Logf("curlb = null;");
    output.Logf("function showDiv(divname)");
    output.Logf("{");
    output.Logf("	seltd = document.getElementById(divname);");
    output.Logf("	if (curtd && seltd == curtd) return;");
    output.Logf("	seltd.style.visibility = 'visible';");
    output.Logf("	if (curtd) curtd.style.visibility = 'hidden';");
    output.Logf("	curtd = seltd;");
    output.Logf("	seltb = document.getElementById(\"a_\"+divname);");
    output.Logf("	seltb.className = \"activetab\";");
    output.Logf("	if (curlb) curlb.className = \"tab\";");
    output.Logf("	curlb = seltb;");
    output.Logf("}");
    output.Logf("function tabHover(divname, active)");
    output.Logf("{");
    output.Logf("	hovertd = document.getElementById(divname);");
    output.Logf("	if (hovertd == curlb) return;");
    output.Logf("	if (hovertd) ");
    output.Logf("	{");
    output.Logf("		if (active) hovertd.className = \"tab_hover\"");
    output.Logf("		else hovertd.className = \"tab\";");
    output.Logf("	}");
    output.Logf("}");
    output.Logf("showDiv(\"d_basic\");");
    output.Logf("</script>");
    output.Logf("</body></html>");
    //return;    
}

protected function expBody()
{
    expBasic();
    expSprees();
    expMultiKills();
    expSpecialAwards();
    expLadderStatus();
    expBotstats();
    expTeamstats();
    expLastmatch();
    expOtherMatches();
    expHistory();
    //return;    
}

protected function expBasic()
{
    output.Logf("<div id=\"d_basic\" class=\"hidden\">");
    output.Logf("<h1>Profile</h1>");
    output.Logf("<table id=\"t_basic\">");
    output.Logf(("<tr id=\"b_profile\"><td>Profile name</td><td>" @ GP.PackageName) @ "</td></tr>");
    output.Logf(("<tr id=\"b_name\"><td>Player name</td><td>" @ GP.PlayerName) @ "</td></tr>");
    output.Logf(("<tr id=\"b_difficulty\"><td>Difficulty</td><td>" @ string(GP.BaseDifficulty)) @ "</td></tr>");
    // End:0x1E0
    if(GP.IsCheater())
    {
        output.Logf("<tr id=\"b_cheated\"><td>CHEATED</td><td>true</td></tr>");
    }
    output.Logf(("<tr id=\"b_character\"><td>Character</td><td>" @ GP.PlayerCharacter) @ "</td></tr>");
    output.Logf(("<tr id=\"b_teamname\"><td>Team name</td><td>" @ GP.TeamName) @ "</td></tr>");
    output.Logf(("<tr id=\"b_teammembers\"><td>Team members</td><td>" @ JoinArray(GP.PlayerTeam, "<br />", true)) @ "</td></tr>");
    output.Logf(("<tr id=\"b_balance\"><td>Balance</td><td class=\"right\">" @ GP.MoneyToString(GP.Balance)) @ "</td></tr>");
    output.Logf(("<tr id=\"b_matches\"><td>Matches</td><td class=\"right\">" @ string(GP.Matches)) @ "</td></tr>");
    output.Logf(("<tr id=\"b_wins\"><td>Wins</td><td class=\"right\">" @ string(GP.Wins)) @ "</td></tr>");
    output.Logf(("<tr id=\"b_kills\"><td>Kills</td><td class=\"right\">" @ string(GP.Kills)) @ "</td></tr>");
    output.Logf(("<tr id=\"b_deaths\"><td>Deaths</td><td class=\"right\">" @ string(GP.Deaths)) @ "</td></tr>");
    output.Logf("</table>");
    output.Logf("</div>");
    //return;    
}

protected function expSprees()
{
    output.Logf("<div id=\"d_awards\" class=\"hidden\">");
    output.Logf("<h1>Killing sprees</h1>");
    output.Logf("<table id=\"t_sprees\">");
    output.Logf(("<tr id=\"ks_spree\"><td>Killing Spree</td><td class=\"right\">" @ string(GP.Spree[0])) @ "</td></tr>");
    output.Logf(("<tr id=\"ks_rampage\"><td>Rampage</td><td class=\"right\">" @ string(GP.Spree[1])) @ "</td></tr>");
    output.Logf(("<tr id=\"ks_dominating\"><td>Dominating</td><td class=\"right\">" @ string(GP.Spree[2])) @ "</td></tr>");
    output.Logf(("<tr id=\"ks_unstoppable\"><td>Unstoppable</td><td class=\"right\">" @ string(GP.Spree[3])) @ "</td></tr>");
    output.Logf(("<tr id=\"ks_godlike\"><td>GODLIKE</td><td class=\"right\">" @ string(GP.Spree[4])) @ "</td></tr>");
    output.Logf(("<tr id=\"ks_wickedsick\"><td>WICKED SICK</td><td class=\"right\">" @ string(GP.Spree[5])) @ "</td></tr>");
    output.Logf("</table>");
    //return;    
}

protected function expMultiKills()
{
    output.Logf("<h1>Multi kills</h1>");
    output.Logf("<table id=\"t_multikills\">");
    output.Logf(("<tr id=\"mk_double\"><td>Double Kill</td><td class=\"right\">" @ string(GP.MultiKills[0])) @ "</td></tr>");
    output.Logf(("<tr id=\"mk_multi\"><td>MultiKill</td><td class=\"right\">" @ string(GP.MultiKills[1])) @ "</td></tr>");
    output.Logf(("<tr id=\"mk_mega\"><td>MegaKill</td><td class=\"right\">" @ string(GP.MultiKills[2])) @ "</td></tr>");
    output.Logf(("<tr id=\"mk_ultra\"><td>UltraKill</td><td class=\"right\">" @ string(GP.MultiKills[3])) @ "</td></tr>");
    output.Logf(("<tr id=\"mk_monster\"><td>MONSTER KILL</td><td class=\"right\">" @ string(GP.MultiKills[4])) @ "</td></tr>");
    output.Logf(("<tr id=\"mk_ludicrous\"><td>LUDICROUS KILL</td><td class=\"right\">" @ string(GP.MultiKills[5])) @ "</td></tr>");
    output.Logf(("<tr id=\"mk_holyshit\"><td>HOLY SHIT</td><td class=\"right\">" @ string(GP.MultiKills[6])) @ "</td></tr>");
    output.Logf("</table>");
    //return;    
}

protected function expSpecialAwards()
{
    output.Logf("<h1>Special awards</h1>");
    output.Logf("<table id=\"t_awards\">");
    output.Logf(("<tr id=\"sa_monkey\"><td>Flak Monkey</td><td class=\"right\">" @ string(GP.SpecialAwards[0])) @ "</td></tr>");
    output.Logf(("<tr id=\"sa_whore\"><td>Combo Whore</td><td class=\"right\">" @ string(GP.SpecialAwards[1])) @ "</td></tr>");
    output.Logf(("<tr id=\"sa_hunter\"><td>Head Hunter</td><td class=\"right\">" @ string(GP.SpecialAwards[2])) @ "</td></tr>");
    output.Logf(("<tr id=\"sa_rampage\"><td>Road Rampage</td><td class=\"right\">" @ string(GP.SpecialAwards[3])) @ "</td></tr>");
    output.Logf(("<tr id=\"sa_trick\"><td>Hat Trick</td><td class=\"right\">" @ string(GP.SpecialAwards[4])) @ "</td></tr>");
    output.Logf(("<tr id=\"sa_untouchable\"><td>Untouchable</td><td class=\"right\">" @ string(GP.SpecialAwards[5])) @ "</td></tr>");
    output.Logf("</table>");
    output.Logf("</div>");
    //return;    
}

protected function expLadderStatus()
{
    local int i;
    local Class<CustomLadderInfo> cL;

    output.Logf("<div id=\"d_ladders\" class=\"hidden\">");
    output.Logf("<h1>Ladder status</h1>");
    output.Logf("<table id=\"t_ladders\">");
    // End:0x16D
    if(GP.LadderProgress[GP.UT2K4GameLadder.default.LID_DM] > -1)
    {
        output.Logf(("<tr id=\"ls_qualification\"><td>Qualification</td><td class=\"right\">" $ string((GP.LadderProgress[GP.UT2K4GameLadder.default.LID_DM] * 100) / GP.LengthOfLadder(GP.UT2K4GameLadder.default.LID_DM))) $ "%</td></tr>");        
    }
    else
    {
        output.Logf("<tr id=\"ls_qualification\"><td>Qualification</td><td>locked</td></tr>");
    }
    // End:0x2B6
    if(GP.LadderProgress[GP.UT2K4GameLadder.default.LID_TDM] > -1)
    {
        output.Logf(("<tr id=\"ls_teamqualification\"><td>Team Qualification</td><td class=\"right\">" $ string((GP.LadderProgress[GP.UT2K4GameLadder.default.LID_TDM] * 100) / GP.LengthOfLadder(GP.UT2K4GameLadder.default.LID_TDM))) $ "%</td></tr>");        
    }
    else
    {
        output.Logf("<tr id=\"ls_teamqualification\"><td>Team Qualification</td><td>locked</td></tr>");
    }
    // End:0x3F8
    if(GP.LadderProgress[GP.UT2K4GameLadder.default.LID_CTF] > -1)
    {
        output.Logf(("<tr id=\"ls_ctf\"><td>Capture The Flag</td><td class=\"right\">" $ string((GP.LadderProgress[GP.UT2K4GameLadder.default.LID_CTF] * 100) / GP.LengthOfLadder(GP.UT2K4GameLadder.default.LID_CTF))) $ "%</td></tr>");        
    }
    else
    {
        output.Logf("<tr id=\"ls_ctf\"><td>Capture The Flag</td><td>locked</td></tr>");
    }
    // End:0x524
    if(GP.LadderProgress[GP.UT2K4GameLadder.default.LID_BR] > -1)
    {
        output.Logf(("<tr id=\"ls_br\"><td>Bombing Run</td><td class=\"right\">" $ string((GP.LadderProgress[GP.UT2K4GameLadder.default.LID_BR] * 100) / GP.LengthOfLadder(GP.UT2K4GameLadder.default.LID_BR))) $ "%</td></tr>");        
    }
    else
    {
        output.Logf("<tr id=\"ls_br\"><td>Bombing Run</td><td>locked</td></tr>");
    }
    // End:0x651
    if(GP.LadderProgress[GP.UT2K4GameLadder.default.LID_DOM] > -1)
    {
        output.Logf(("<tr id=\"ls_dom\"><td>Double Domination</td><td class=\"right\">" $ string((GP.LadderProgress[GP.UT2K4GameLadder.default.LID_DOM] * 100) / GP.LengthOfLadder(GP.UT2K4GameLadder.default.LID_DOM))) $ "%</td></tr>");        
    }
    else
    {
        output.Logf("<tr id=\"ls_dom\"><td>Double Domination</td><td>locked</td></tr>");
    }
    // End:0x77A
    if(GP.LadderProgress[GP.UT2K4GameLadder.default.LID_AS] > -1)
    {
        output.Logf(("<tr id=\"ls_as\"><td>Assault</td><td class=\"right\">" $ string((GP.LadderProgress[GP.UT2K4GameLadder.default.LID_AS] * 100) / GP.LengthOfLadder(GP.UT2K4GameLadder.default.LID_AS))) $ "%</td></tr>");        
    }
    else
    {
        output.Logf("<tr id=\"ls_as\"><td>Assault</td><td>locked</td></tr>");
    }
    // End:0x8A0
    if(GP.LadderProgress[GP.UT2K4GameLadder.default.LID_CHAMP] > -1)
    {
        output.Logf(("<tr id=\"ls_champ\"><td>Championship</td><td class=\"right\">" $ string((GP.LadderProgress[GP.UT2K4GameLadder.default.LID_CHAMP] * 100) / GP.LengthOfLadder(GP.UT2K4GameLadder.default.LID_CHAMP))) $ "%</td></tr>");        
    }
    else
    {
        output.Logf("<tr id=\"ls_champ\"><td>Championship</td><td>locked</td></tr>");
    }
    // End:0xB03
    if(GP.CustomLadders.Length > 0)
    {
        output.Logf("<tr><td colspan=\"2\">Additional ladders</tr></td>");
        i = 0;
        J0x949:

        // End:0xB03 [Loop If]
        if(i < GP.CustomLadders.Length)
        {
            cL = Class<CustomLadderInfo>(DynamicLoadObject(GP.CustomLadders[i].LadderClass, Class'Core.Class'));
            // End:0xA55
            if(cL != none)
            {
                output.Logf(((((("<tr id=\"lsc_" $ Repl(GP.CustomLadders[i].LadderClass, ".", "_")) $ "\"><td>") $ cL.default.LadderName) $ "</td><td class=\"right\">") $ string((GP.CustomLadders[i].Progress * 100) / cL.default.Matches.Length)) $ "%</td></tr>");
                // [Explicit Continue]
                goto J0xAF9;
            }
            output.Logf(((((("<tr id=\"lsc_" $ Repl(GP.CustomLadders[i].LadderClass, ".", "_")) $ "\"><td>") $ GP.CustomLadders[i].LadderClass) $ "</td><td>") $ string(GP.CustomLadders[i].Progress)) @ "matches</td></tr>");
            J0xAF9:

            i++;
            // [Loop Continue]
            goto J0x949;
        }
    }
    output.Logf("</table>");
    output.Logf("</div>");
    //return;    
}

protected function expBotstats()
{
    local int i;

    output.Logf("<div id=\"d_botstats\" class=\"hidden\">");
    output.Logf("<h1>Bot stats</h1>");
    output.Logf("<table id=\"t_botstats\">");
    output.Logf("<tr><th>Name</th><th>Price</th><th>Health</th><th>Team ID</th><tr>");
    i = 0;
    J0xDA:

    // End:0x225 [Loop If]
    if(i < GP.BotStats.Length)
    {
        output.Logf(((((((((("<tr id=\"bs_" $ Repl(GP.BotStats[i].Name, ".", "_")) $ "\"><td>") $ GP.BotStats[i].Name) $ "</td><td class=\"right\">") $ GP.MoneyToString(GP.BotStats[i].Price)) $ "</td><td class=\"right\">") $ string(GP.BotStats[i].Health)) $ "%</td><td class=\"right\">") $ string(GP.BotStats[i].TeamID)) $ "</td></tr>");
        i++;
        // [Loop Continue]
        goto J0xDA;
    }
    output.Logf("</table>");
    output.Logf("</div>");
    //return;    
}

protected function expTeamstats()
{
    local int i;
    local string tmp;

    output.Logf("<div id=\"d_teamstats\" class=\"hidden\">");
    output.Logf("<h1>Team stats</h1>");
    output.Logf("<table id=\"t_teamstats\">");
    output.Logf("<tr><th>ID</th><th>Name</th><th>Matches</th><th>Lost from</th><th>Rating</th><th>Level</th><th>Roster</th><tr>");
    i = 0;
    J0x109:

    // End:0x2E4 [Loop If]
    if(i < GP.TeamStats.Length)
    {
        // End:0x145
        if(GP.TeamStats[i].Name == "")
        {
            // [Explicit Continue]
            goto J0x2DA;
        }
        output.Logf(((((((((((((((("<tr id=\"ts_" $ Repl(GP.TeamStats[i].Name, ".", "_")) $ "\"><td class=\"right\">") $ string(i)) $ "</td><td>") $ (GetTeamName(GP.TeamStats[i].Name, tmp))) $ "</td><td class=\"right\">") $ string(GP.TeamStats[i].Matches)) $ "</td><td class=\"right\">") $ string(GP.TeamStats[i].Won)) $ "</td><td class=\"right\">") $ string(GP.TeamStats[i].rating)) $ "</td><td class=\"right\">") $ string(GP.TeamStats[i].Level)) $ "</td><td>") $ tmp) $ "</td></tr>");
        J0x2DA:

        i++;
        // [Loop Continue]
        goto J0x109;
    }
    output.Logf("</table>");
    output.Logf("</div>");
    //return;    
}

protected function expLastmatch()
{
    local int i;
    local string tmp;

    output.Logf("<div id=\"d_lastmatch\" class=\"hidden\">");
    output.Logf("<h1>Last match</h1>");
    output.Logf("<table id=\"t_lastmatch_basic\">");
    output.Logf(("<tr id=\"lm_gametype\"><td>Game type</td><td>" $ GP.lmdGameType) $ "</td></tr>");
    output.Logf(("<tr id=\"lm_map\"><td>Map</td><td>" $ GP.lmdMap) $ "</td></tr>");
    output.Logf(("<tr id=\"lm_won\"><td>Won match</td><td>" $ string(GP.lmdWonMatch)) $ "</td></tr>");
    output.Logf(("<tr id=\"lm_time\"><td>Game time</td><td>" $ string(GP.lmdGameTime / float(60))) @ "minutes</td></tr>");
    output.Logf(("<tr id=\"lm_prize\"><td>Prize money</td><td>" $ GP.MoneyToString(GP.lmdPrizeMoney)) $ "</td></tr>");
    output.Logf(("<tr id=\"lm_bonus\"><td>Total bonus money</td><td>" $ GP.MoneyToString(GP.lmdTotalBonusMoney)) $ "</td></tr>");
    output.Logf(("<tr id=\"lm_balance\"><td>Balance change</td><td>" $ GP.MoneyToString(GP.lmdBalanceChange)) $ "</td></tr>");
    // End:0x495
    if(GP.lmdInjury > -1)
    {
        output.Logf(("<tr id=\"lm_injured\"><td>Injured team mate</td><td>" $ GP.BotStats[GP.lmdInjury].Name) $ "</td></tr>");
        output.Logf(("<tr id=\"lm_injury_health\"><td>Injury health</td><td>" $ string(GP.lmdInjuryHealth)) $ "</td></tr>");
        output.Logf(("<tr id=\"lm_treatment\"><td>Injury treatment</td><td>" $ GP.MoneyToString(GP.lmdInjuryTreatment)) $ "</td></tr>");
    }
    output.Logf("</table>");
    // End:0x67B
    if(GP.PayCheck.Length > 0)
    {
        output.Logf("<h2>Pay check overview</h2>");
        output.Logf("<table id=\"t_lastmatch_paycheck\">");
        output.Logf("<tr><th>Name</th><th>Payment</th></tr>");
        i = 0;
        J0x55F:

        // End:0x662 [Loop If]
        if(i < GP.PayCheck.Length)
        {
            output.Logf(((((("<tr id=\"lmp_" $ Repl(GP.BotStats[GP.PayCheck[i].BotID].Name, ".", "_")) $ "\"><td>") $ GP.BotStats[GP.PayCheck[i].BotID].Name) $ "</td><td class=\"right\">") $ GP.MoneyToString(GP.PayCheck[i].Payment)) $ "</td></tr>");
            i++;
            // [Loop Continue]
            goto J0x55F;
        }
        output.Logf("</table>");
    }
    output.Logf("<h2>Last match player overview</h2>");
    output.Logf("<table id=\"t_lastmatch_overview\">");
    output.Logf("<tr><th>Name</th><th>Kills</th><th>Score</th><th>Deaths</th><th>Special Awards</th></tr>");
    // End:0xB34
    if(GP.lmdTeamGame)
    {
        output.Logf(("<tr><th colspan=\"5\">" $ GP.TeamName) $ "</th></tr>");
        i = 0;
        J0x7A6:

        // End:0x941 [Loop If]
        if(i < GP.PlayerMatchDetails.Length)
        {
            // End:0x937
            if(GP.PlayerMatchDetails[i].Team == GP.lmdMyTeam)
            {
                output.Logf(((((((((((("<tr id=\"lmd_" $ Repl(GP.PlayerMatchDetails[i].Name, ".", "_")) $ "\"><td>") $ GP.PlayerMatchDetails[i].Name) $ "</td><td class=\"right\">") $ string(GP.PlayerMatchDetails[i].Kills)) $ "</td><td class=\"right\">") $ string(GP.PlayerMatchDetails[i].Score)) $ "</td><td class=\"right\">") $ string(GP.PlayerMatchDetails[i].Deaths)) $ "</td><td>") $ JoinArray(GP.PlayerMatchDetails[i].SpecialAwards, ", ")) $ "</td></tr");
            }
            i++;
            // [Loop Continue]
            goto J0x7A6;
        }
        output.Logf(("<tr><th colspan=\"5\">" $ (GetTeamName(GP.lmdEnemyTeam, tmp))) $ "</th></tr>");
        i = 0;
        J0x996:

        // End:0xB31 [Loop If]
        if(i < GP.PlayerMatchDetails.Length)
        {
            // End:0xB27
            if(GP.PlayerMatchDetails[i].Team != GP.lmdMyTeam)
            {
                output.Logf(((((((((((("<tr id=\"lmd_" $ Repl(GP.PlayerMatchDetails[i].Name, ".", "_")) $ "\"><td>") $ GP.PlayerMatchDetails[i].Name) $ "</td><td class=\"right\">") $ string(GP.PlayerMatchDetails[i].Kills)) $ "</td><td class=\"right\">") $ string(GP.PlayerMatchDetails[i].Score)) $ "</td><td class=\"right\">") $ string(GP.PlayerMatchDetails[i].Deaths)) $ "</td><td>") $ JoinArray(GP.PlayerMatchDetails[i].SpecialAwards, ", ")) $ "</td></tr");
            }
            i++;
            // [Loop Continue]
            goto J0x996;
        }        
    }
    else
    {
        i = 0;
        J0xB3B:

        // End:0xCAA [Loop If]
        if(i < GP.PlayerMatchDetails.Length)
        {
            output.Logf(((((((((((("<tr id=\"lmd_" $ Repl(GP.PlayerMatchDetails[i].Name, ".", "_")) $ "\"><td>") $ GP.PlayerMatchDetails[i].Name) $ "</td><td class=\"right\">") $ string(GP.PlayerMatchDetails[i].Kills)) $ "</td><td class=\"right\">") $ string(GP.PlayerMatchDetails[i].Score)) $ "</td><td class=\"right\">") $ string(GP.PlayerMatchDetails[i].Deaths)) $ "</td><td>") $ JoinArray(GP.PlayerMatchDetails[i].SpecialAwards, ", ")) $ "</td></tr");
            i++;
            // [Loop Continue]
            goto J0xB3B;
        }
    }
    output.Logf("</table>");
    //return;    
}

protected function expOtherMatches()
{
    local int i;
    local string tmp;
    local UT2K4MatchInfo MI;

    // End:0x2E
    if(GP.PhantomMatches.Length <= 0)
    {
        output.Logf("</div>");
        return;
    }
    output.Logf("<h2>Other tournament matches</h2>");
    output.Logf("<table id=\"t_othermatches\">");
    i = 0;
    J0x93:

    // End:0x392 [Loop If]
    if(i < GP.PhantomMatches.Length)
    {
        output.Logf(((((("<tr id=\"om_" $ string(i)) $ "_vs\"><th>") $ (GetTeamName(GP.TeamStats[GP.PhantomMatches[i].Team1].Name, tmp))) @ "</th><td>vs</td><th>") @ (GetTeamName(GP.TeamStats[GP.PhantomMatches[i].Team2].Name, tmp))) $ "</th><tr>");
        MI = UT2K4MatchInfo(GP.GetMatchInfo(GP.PhantomMatches[i].LadderId, GP.PhantomMatches[i].MatchID));
        output.Logf(((((("<tr id=\"om_" $ string(i)) $ "_game\"><td colspan=\"3\">") $ GP.GetLadderDescription(GP.PhantomMatches[i].LadderId, GP.PhantomMatches[i].MatchID)) @ "in") @ MI.LevelName) $ "</td></tr>");
        output.Logf(((((("<tr id=\"om_" $ string(i)) $ "_score\"><td colspan=\"3\">Score") @ string(int(Round(GP.PhantomMatches[i].ScoreTeam1)))) @ "-") @ string(int(Round(GP.PhantomMatches[i].ScoreTeam2)))) $ "</td></tr>");
        output.Logf(((("<tr id=\"om_" $ string(i)) $ "_time\"><td colspan=\"3\">Game time") @ string(GP.PhantomMatches[i].GameTime / float(60))) @ "minutes</td></tr>");
        i++;
        // [Loop Continue]
        goto J0x93;
    }
    output.Logf("</table>");
    output.Logf("</div>");
    //return;    
}

protected function expHistory()
{
    local int i;
    local array<string> tmpa;
    local string tmp;

    // End:0x17
    if(GP.FightHistory.Length == 0)
    {
        return;
    }
    output.Logf("<div id=\"d_history\" class=\"hidden\">");
    output.Logf("<h1>Fight history</h1>");
    i = 0;
    J0x79:

    // End:0xBE6 [Loop If]
    if(i < GP.FightHistory.Length)
    {
        output.Logf(("<table id=\"history_" $ string(i)) $ "\">");
        output.Logf(((((((((((("<tr id=\"his_date_" $ string(i)) $ "\"><th colspan=\"2\">") $ string(GP.FightHistory[i].Date[0])) $ "-") $ Right("0" $ string(GP.FightHistory[i].Date[1]), 2)) $ "-") $ Right("0" $ string(GP.FightHistory[i].Date[2]), 2)) $ " ") $ Right("0" $ string(GP.FightHistory[i].Time[0]), 2)) $ ":") $ Right("0" $ string(GP.FightHistory[i].Time[1]), 2)) $ "</th></tr>");
        Split(GP.FightHistory[i].MatchData, ";", tmpa);
        output.Logf(((((("<tr id=\"his_matchtype_" $ string(i)) $ "\"><td>") $ tmpa[0]) $ "</td><td>") $ tmpa[1]) $ "</td></tr>");
        // End:0x30D
        if(GP.FightHistory[i].MatchExtra != "")
        {
            output.Logf(((("<tr id=\"his_matchdata_" $ string(i)) $ "\"><td>Additional info</td><td>") $ GP.FightHistory[i].MatchExtra) $ "</td></tr>");
        }
        output.Logf(((("<tr id=\"his_gametype_" $ string(i)) $ "\"><td>Game type</td><td>") $ (getGameTypeString(GP.FightHistory[i].GameType))) @ "</td></tr>");
        output.Logf(((("<tr id=\"his_level_" $ string(i)) $ "\"><td>Map</td><td>") $ GP.FightHistory[i].Level) $ "</td></tr>");
        output.Logf(((("<tr id=\"his_prize_" $ string(i)) $ "\"><td>Prize money</td><td>") $ GP.MoneyToString(int(GP.FightHistory[i].PriceMoney))) $ "</td></tr>");
        output.Logf(((("<tr id=\"his_balancechange_" $ string(i)) $ "\"><td>Balance change</td><td>") $ GP.MoneyToString(int(GP.FightHistory[i].BalanceChange))) $ "</td></tr>");
        output.Logf(((("<tr id=\"his_bonus_" $ string(i)) $ "\"><td>Bonus money</td><td>") $ GP.MoneyToString(int(GP.FightHistory[i].BonusMoney))) $ "</td></tr>");
        output.Logf(((("<tr id=\"his_time_" $ string(i)) $ "\"><td>Game time</td><td>") $ string(GP.FightHistory[i].GameTime / float(60))) $ " minutes</td></tr>");
        output.Logf(((("<tr id=\"his_won_" $ string(i)) $ "\"><td>Won game</td><td>") $ string(GP.FightHistory[i].WonGame)) $ "</td></tr>");
        // End:0x977
        if(GP.FightHistory[i].TeamGame)
        {
            output.Logf(((("<tr id=\"his_team1name_" $ string(i)) $ "\"><td>Team 1 name</td><td>") $ (GetTeamName(GP.FightHistory[i].EnemyTeam, tmp))) $ "</td></tr>");
            output.Logf(((("<tr id=\"his_team1score_" $ string(i)) $ "\"><td>Team 1 layout</td><td>") $ GP.FightHistory[i].TeamLayout[0]) $ "</td></tr>");
            output.Logf(((("<tr id=\"his_team1score_" $ string(i)) $ "\"><td>Team 1 score</td><td>") $ string(GP.FightHistory[i].TeamScore[0])) $ "</td></tr>");
            output.Logf(((("<tr id=\"his_team2name_" $ string(i)) $ "\"><td>Team 2 name</td><td>") $ GP.TeamName) $ "</td></tr>");
            output.Logf(((("<tr id=\"his_team2score_" $ string(i)) $ "\"><td>Team 2 layout</td><td>") $ GP.FightHistory[i].TeamLayout[1]) $ "</td></tr>");
            output.Logf(((("<tr id=\"his_team2score_" $ string(i)) $ "\"><td>Team 2 score</td><td>") $ string(GP.FightHistory[i].TeamScore[1])) $ "</td></tr>");
        }
        output.Logf(((("<tr id=\"his_myscore_" $ string(i)) $ "\"><td>My score</td><td>") $ string(GP.FightHistory[i].MyScore)) $ "</td></tr>");
        output.Logf(((("<tr id=\"his_mykills_" $ string(i)) $ "\"><td>My kills</td><td>") $ string(GP.FightHistory[i].MyKills)) $ "</td></tr>");
        output.Logf(((("<tr id=\"his_mydeath_" $ string(i)) $ "\"><td>My deaths</td><td>") $ string(GP.FightHistory[i].MyDeaths)) $ "</td></tr>");
        output.Logf(((("<tr id=\"his_myaward_" $ string(i)) $ "\"><td>My awards</td><td>") $ GP.FightHistory[i].MyAwards) $ "</td></tr>");
        output.Logf(((("<tr id=\"his_myrating_" $ string(i)) $ "\"><td>My rating</td><td>") $ string(GP.FightHistory[i].MyRating)) $ "</td></tr>");
        output.Logf("</table><br />");
        i++;
        // [Loop Continue]
        goto J0x79;
    }
    output.Logf("</div>");
    //return;    
}

function string getGameTypeString(string GameType)
{
    local GameRecord GR;

    GR = Class'Engine.CacheManager'.static.GetGameRecord(GameType);
    // End:0x33
    if(GR.GameName != "")
    {
        return GR.GameName;
    }
    return GameType;
    //return;    
}

function string GetTeamName(string TeamClass, out string TeamRoster)
{
    local Class<UT2K4TeamRoster> ETI;
    local array<string> Roster;

    ETI = Class<UT2K4TeamRoster>(DynamicLoadObject(TeamClass, Class'Core.Class'));
    // End:0x5B
    if(ETI == none)
    {
        Warn(TeamClass @ "is not a valid UT2K4TeamRoster subclass");
        return "";
    }
    // End:0x8D
    if(!GP.GetAltTeamRoster(TeamClass, Roster))
    {
        Roster = ETI.default.RosterNames;
    }
    TeamRoster = JoinArray(Roster, ", ", true);
    return ETI.default.TeamName;
    //return;    
}

protected function string FormatString(string LogFileName)
{
    local string Result;

    Result = LogFileName;
    Result = Repl(Result, "%Y", Right("0000" $ string(Level.Year), 4));
    Result = Repl(Result, "%M", Right("00" $ string(Level.Month), 2));
    Result = Repl(Result, "%D", Right("00" $ string(Level.Day), 2));
    Result = Repl(Result, "%H", Right("00" $ string(Level.Hour), 2));
    Result = Repl(Result, "%I", Right("00" $ string(Level.Minute), 2));
    Result = Repl(Result, "%W", Right("0" $ string(Level.DayOfWeek), 1));
    Result = Repl(Result, "%S", Right("00" $ string(Level.Second), 2));
    Result = Repl(Result, "%%", "%");
    Result = Repl(Result, "%N", GP.PackageName);
    Result = Repl(Result, "%P", GP.PlayerName);
    return Result;
    //return;    
}

static final function string JoinArray(array<string> StringArray, optional string Delim, optional bool bIgnoreBlanks)
{
    local int i;
    local string S;

    // End:0x15
    if(Delim == "")
    {
        Delim = ",";
    }
    i = 0;
    J0x1C:

    // End:0x83 [Loop If]
    if(i < StringArray.Length)
    {
        // End:0x79
        if((StringArray[i] != "") || !bIgnoreBlanks)
        {
            // End:0x65
            if(S != "")
            {
                S $= Delim;
            }
            S $= StringArray[i];
        }
        i++;
        // [Loop Continue]
        goto J0x1C;
    }
    return S;
    //return;    
}

defaultproperties
{
    fileName="%N_%Y_%M_%D_%H_%I"
    FileExt="html"
}