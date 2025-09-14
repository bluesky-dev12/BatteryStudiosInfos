/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4GamePageSP.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Functions:5
 *
 *******************************************************************************/
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
        Value = byte(byte(RuleInfo.Settings[i].Value) & 3);
        // End:0x90
        if(Value == 1)
        {
            GameURL $= "?bAutoNumBots=True";
        }
        // End:0x124
        else
        {
            // End:0xb9
            if(Value == 2)
            {
                GameURL $= p_BotConfig.Play();
            }
            // End:0x124
            else
            {
                i = RuleInfo.FindIndex("MinPlayers");
                // End:0x124
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
    // End:0x24
    if(bAlt)
    {
        GameURL $= "?SpectatorOnly=1";
    }
    Console(Controller.Master.Console).DelayedConsoleCommand("start" @ GameURL);
    Controller.CloseAll(false, true);
}

function SetupBotText(class<GameInfo> GameClass)
{
    GameClass.static.AdjustBotInterface(true);
}

function string GetBotTabName()
{
    // End:0x16
    if(PanelCaption.Length > 4)
    {
        return PanelCaption[4];
    }
    return "";
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
    Value = byte(byte(NewValue) & 3);
    // End:0x62
    if(Value == 1)
    {
        DisableComponent(BotControl);
        DisableComponent(BotTab);
    }
    // End:0x9f
    else
    {
        // End:0x89
        if(Value == 2)
        {
            DisableComponent(BotControl);
            EnableComponent(BotTab);
        }
        // End:0x9f
        else
        {
            EnableComponent(BotControl);
            DisableComponent(BotTab);
        }
    }
}

defaultproperties
{
    PageCaption="???? ??"
    begin object name=SPFooter class=UT2K4GameFooter
        PrimaryCaption="???"
        PrimaryHint="?? ??? ???? ??? ?????."
        SecondaryCaption="??"
        SecondaryHint="?? ??? ???? ??? ?????."
        Justification=0
        TextIndent=5
        FontScale=0
        WinTop=0.9579430
        RenderWeight=0.30
        TabOrder=8
        OnPreDraw=InternalOnPreDraw
    object end
    // Reference: UT2K4GameFooter'UT2K4GamePageSP.SPFooter'
    t_Footer=SPFooter
    PanelClass=// Object reference not set to an instance of an object.
    
}