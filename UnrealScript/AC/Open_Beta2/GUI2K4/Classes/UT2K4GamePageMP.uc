class UT2K4GamePageMP extends UT2K4GamePageBase
    config(User)
    editinlinenew
    instanced;

function InitComponent(GUIController InController, GUIComponent inOwner)
{
    super.InitComponent(InController, inOwner);
    mcServerRules = UT2K4Tab_ServerRulesPanel(c_Tabs.InsertTab(3, PanelCaption[5], PanelClass[5],, PanelHint[5]));
    p_Main.b_Primary = UT2K4GameFooter(t_Footer).b_Primary;
    p_Main.b_Secondary = UT2K4GameFooter(t_Footer).b_Secondary;
    //return;    
}

function PrepareToPlay(out string GameURL, optional string OverrideMap)
{
    local int i;
    local byte Value;

    super.PrepareToPlay(GameURL, OverrideMap);
    i = RuleInfo.FindIndex("BotMode");
    // End:0x11F
    if(i != -1)
    {
        Value = byte(int(byte(RuleInfo.Settings[i].Value)) & 28);
        // End:0x8C
        if(int(Value) == 8)
        {
            GameURL $= p_BotConfig.Play();            
        }
        else
        {
            // End:0xB4
            if(int(Value) == 16)
            {
                GameURL $= "?VsBots=true";                
            }
            else
            {
                i = RuleInfo.FindIndex("MinPlayers");
                // End:0x11F
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
    local GUIController C;

    C = Controller;
    // End:0x74
    if(bAlt)
    {
        // End:0x37
        if(mcServerRules != none)
        {
            GameURL $= mcServerRules.Play();
        }
        PlayerOwner().ConsoleCommand(("relaunch" @ GameURL) @ "-server -log=server.log");        
    }
    else
    {
        PlayerOwner().ClientTravel(GameURL $ "?Listen", 0, false);
    }
    C.CloseAll(false, true);
    //return;    
}

function SetupBotText(Class<GameInfo> GameClass)
{
    GameClass.static.AdjustBotInterface(false);
    //return;    
}

function InitRuleInfo(array< Class<Info> > InfoClasses)
{
    super.InitRuleInfo(InfoClasses);
    // End:0x25
    if(mcServerRules != none)
    {
        mcServerRules.Refresh();
    }
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
    Value = byte(int(byte(NewValue)) & 28);
    // End:0x62
    if(int(Value) == 1)
    {
        DisableComponent(BotControl);
        DisableComponent(BotTab);        
    }
    else
    {
        // End:0x99
        if((int(Value) == 8) || int(Value) == 16)
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
    PageCaption="??? ??"
    // Reference: UT2K4GameFooter'GUI2K4_Decompressed.UT2K4GamePageMP.MPFooter'
    begin object name="MPFooter" class=GUI2K4_Decompressed.UT2K4GameFooter
        PrimaryCaption="??"
        PrimaryHint="?? ??? ???? ?? ??? ?????."
        SecondaryCaption="??"
        SecondaryHint="?? ??? ???? ?? ??? ?????."
        Justification=0
        TextIndent=5
        FontScale=0
        WinTop=0.9579430
        RenderWeight=0.3000000
        TabOrder=8
        OnPreDraw=MPFooter.InternalOnPreDraw
    end object
    t_Footer=MPFooter
    PanelClass[0]="GUI2K4.UT2K4Tab_GameTypeMP"
    PanelClass[1]="GUI2K4.UT2K4Tab_MainSP"
    PanelClass[2]="GUI2K4.UT2K4Tab_RulesBase"
    PanelClass[3]="GUI2K4.UT2K4Tab_MutatorMP"
    PanelClass[4]="GUI2K4.UT2K4Tab_BotConfigMP"
    PanelClass[5]="GUI2K4.UT2K4Tab_ServerRulesPanel"
    PanelCaption[0]="?? ??"
    PanelCaption[1]="? ??"
    PanelCaption[2]="?? ??"
    PanelCaption[3]="????"
    PanelCaption[4]="? ??"
    PanelCaption[5]="?? ??"
    PanelHint[0]="?? ??? ?????"
    PanelHint[1]="???? ????? ?? ?? ??? ? ????."
    PanelHint[2]="? ????? ??? ?????."
    PanelHint[3]="???? ????? ??? ?????.."
    PanelHint[4]="?? ??? ??? ??? ?????..."
    PanelHint[5]="??? ??? ?????..."
}