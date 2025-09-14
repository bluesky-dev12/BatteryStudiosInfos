class UT2K4GamePageSP extends UT2K4GamePageBase
    config(User)
    editinlinenew
    instanced;

function PrepareToPlay(out string GameURL, optional string OverrideMap)
{
    local int i;
    local byte Value;

    super.PrepareToPlay(GameURL, OverrideMap);
    i = RuleInfo.FindIndex("BotMode");
    // End:0x124
    if(i != -1)
    {
        Value = byte(int(byte(RuleInfo.Settings[i].Value)) & 3);
        // End:0x90
        if(int(Value) == 1)
        {
            GameURL $= "?bAutoNumBots=True";            
        }
        else
        {
            // End:0xB9
            if(int(Value) == 2)
            {
                GameURL $= p_BotConfig.Play();                
            }
            else
            {
                i = RuleInfo.FindIndex("MinPlayers");
                // End:0x124
                if(i >= 0)
                {
                    GameURL $= ("?bAutoNumBots=False?NumBots=" $ RuleInfo.Settings[i].Value);
                }
            }
        }
    }
    //return;    
}

function StartGame(string GameURL, bool bAlt)
{
    // End:0x24
    if(bAlt)
    {
        GameURL $= "?SpectatorOnly=1";
    }
    Console(Controller.Master.Console).DelayedConsoleCommand("start" @ GameURL);
    Controller.CloseAll(false, true);
    //return;    
}

function SetupBotText(Class<GameInfo> GameClass)
{
    GameClass.static.AdjustBotInterface(true);
    //return;    
}

function string GetBotTabName()
{
    // End:0x16
    if(PanelCaption.Length > 4)
    {
        return PanelCaption[4];
    }
    return "";
    //return;    
}

function UpdateBotSetting(string NewValue, moNumericEdit BotControl)
{
    local export editinline GUITabButton BotTab;
    local byte Value;

    // End:0x1B
    if((BotControl == none) || NewValue == "")
    {
        return;
    }
    BotTab = GetBotTab();
    Value = byte(int(byte(NewValue)) & 3);
    // End:0x62
    if(int(Value) == 1)
    {
        DisableComponent(BotControl);
        DisableComponent(BotTab);        
    }
    else
    {
        // End:0x89
        if(int(Value) == 2)
        {
            DisableComponent(BotControl);
            EnableComponent(BotTab);            
        }
        else
        {
            EnableComponent(BotControl);
            DisableComponent(BotTab);
        }
    }
    //return;    
}

defaultproperties
{
    PageCaption="???? ??"
    // Reference: UT2K4GameFooter'GUI2K4_Decompressed.UT2K4GamePageSP.SPFooter'
    begin object name="SPFooter" class=GUI2K4_Decompressed.UT2K4GameFooter
        PrimaryCaption="???"
        PrimaryHint="?? ??? ???? ??? ?????."
        SecondaryCaption="??"
        SecondaryHint="?? ??? ???? ??? ?????."
        Justification=0
        TextIndent=5
        FontScale=0
        WinTop=0.9579430
        RenderWeight=0.3000000
        TabOrder=8
        OnPreDraw=SPFooter.InternalOnPreDraw
    end object
    t_Footer=SPFooter
    PanelClass[0]="GUI2K4.UT2K4Tab_GameTypeSP"
    PanelClass[1]="GUI2K4.UT2K4Tab_MainSP"
    PanelClass[2]="GUI2K4.UT2K4Tab_RulesBase"
    PanelClass[3]="GUI2K4.UT2K4Tab_MutatorSP"
    PanelClass[4]="GUI2K4.UT2K4Tab_BotConfigSP"
}