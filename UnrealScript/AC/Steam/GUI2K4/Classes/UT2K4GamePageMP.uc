/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4GamePageMP.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Functions:6
 *
 *******************************************************************************/
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
}

function PrepareToPlay(out string GameURL, optional string OverrideMap)
{
    local int i;
    local byte Value;

    super.PrepareToPlay(GameURL, OverrideMap);
    i = RuleInfo.FindIndex("BotMode");
    // End:0x11f
    if(i != -1)
    {
        Value = byte(byte(RuleInfo.Settings[i].Value) & 28);
        // End:0x8c
        if(Value == 8)
        {
            GameURL $= p_BotConfig.Play();
        }
        // End:0x11f
        else
        {
            // End:0xb4
            if(Value == 16)
            {
                GameURL $= "?VsBots=true";
            }
            // End:0x11f
            else
            {
                i = RuleInfo.FindIndex("MinPlayers");
                // End:0x11f
                if(i >= 0)
                {
                    GameURL $= "?bAutoNumBots=False?NumBots=" $ RuleInfo.Settings[i].Value;
                }
            }
        }
    }
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
        PlayerOwner().ConsoleCommand("relaunch" @ GameURL @ "-server -log=server.log");
    }
    // End:0x94
    else
    {
        PlayerOwner().ClientTravel(GameURL $ "?Listen", 0, false);
    }
    C.CloseAll(false, true);
}

function SetupBotText(class<GameInfo> GameClass)
{
    GameClass.static.AdjustBotInterface(false);
}

function InitRuleInfo(array< class<Info> > InfoClasses)
{
    super.InitRuleInfo(InfoClasses);
    // End:0x25
    if(mcServerRules != none)
    {
        mcServerRules.Refresh();
    }
}

function UpdateBotSetting(string NewValue, moNumericEdit BotControl)
{
    local export editinline GUITabButton BotTab;
    local byte Value;

    // End:0x1b
    if(BotControl == none || NewValue == "")
    {
        return;
    }
    BotTab = GetBotTab();
    Value = byte(byte(NewValue) & 28);
    // End:0x62
    if(Value == 1)
    {
        DisableComponent(BotControl);
        DisableComponent(BotTab);
    }
    // End:0xaf
    else
    {
        // End:0x99
        if(Value == 8 || Value == 16)
        {
            DisableComponent(BotControl);
            EnableComponent(BotTab);
        }
        // End:0xaf
        else
        {
            EnableComponent(BotControl);
            DisableComponent(BotTab);
        }
    }
}

defaultproperties
{
    PageCaption="??? ??"
    begin object name=MPFooter class=UT2K4GameFooter
        PrimaryCaption="??"
        PrimaryHint="?? ??? ???? ?? ??? ?????."
        SecondaryCaption="??"
        SecondaryHint="?? ??? ???? ?? ??? ?????."
        Justification=0
        TextIndent=5
        FontScale=0
        WinTop=0.9579430
        RenderWeight=0.30
        TabOrder=8
        OnPreDraw=InternalOnPreDraw
    object end
    // Reference: UT2K4GameFooter'UT2K4GamePageMP.MPFooter'
    t_Footer=MPFooter
    PanelClass=// Object reference not set to an instance of an object.
    
    PanelCaption=// Object reference not set to an instance of an object.
    
    PanelHint=// Object reference not set to an instance of an object.
    
}