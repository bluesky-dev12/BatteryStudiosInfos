class UT2K4GamePageBase extends UT2k4MainPage
    config(User)
    editinlinenew
    instanced;

var() localized string PageCaption;
var() config bool bUseTabs;
var() /*0x00000000-0x00000008*/ editconst noexport editinline GUIButton b_Primary;
var() /*0x00000000-0x00000008*/ editconst noexport editinline GUIButton b_Secondary;
var() /*0x00000000-0x00000008*/ editconst noexport editinline GUIButton b_Back;
var() editconst noexport PlayInfo RuleInfo;
var() editconst noexport GameRecord currentGame;
var() /*0x00000000-0x00000008*/ editconst noexport editinline UT2K4Tab_GameTypeBase p_Game;
var() /*0x00000000-0x00000008*/ editconst noexport editinline UT2K4Tab_MainBase p_Main;
var() /*0x00000000-0x00000008*/ editconst noexport editinline UT2K4Tab_RulesBase p_Rules;
var() /*0x00000000-0x00000008*/ editconst noexport editinline IAMultiColumnRulesPanel mcRules;
var() /*0x00000000-0x00000008*/ editconst noexport editinline UT2K4Tab_ServerRulesPanel mcServerRules;
var() /*0x00000000-0x00000008*/ editconst noexport editinline UT2K4Tab_MutatorBase p_Mutators;
var() /*0x00000000-0x00000008*/ editconst noexport editinline UT2K4Tab_BotConfigBase p_BotConfig;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    RuleInfo = new (none) Class'Engine.PlayInfo';
    p_Game = UT2K4Tab_GameTypeBase(c_Tabs.AddTab(PanelCaption[i], PanelClass[i],, PanelHint[i++], true));
    p_Game.__OnChangeGameType__Delegate = ChangeGameType;
    p_Main = UT2K4Tab_MainBase(c_Tabs.AddTab(PanelCaption[i], PanelClass[i],, PanelHint[i++]));
    p_Game.tp_Main = p_Main;
    // End:0x10E
    if(bUseTabs)
    {
        p_Rules = UT2K4Tab_RulesBase(c_Tabs.AddTab(PanelCaption[i], PanelClass[i],, PanelHint[i++]));        
    }
    else
    {
        mcRules = IAMultiColumnRulesPanel(c_Tabs.AddTab(PanelCaption[i], "GUI2K4.IAMultiColumnRulesPanel",, PanelHint[i++]));
    }
    p_Mutators = UT2K4Tab_MutatorBase(c_Tabs.AddTab(PanelCaption[i], PanelClass[i],, PanelHint[i++]));
    p_BotConfig = UT2K4Tab_BotConfigBase(c_Tabs.AddTab(PanelCaption[i], PanelClass[i],, PanelHint[i++]));
    b_Back = UT2K4GameFooter(t_Footer).b_Back;
    b_Secondary = UT2K4GameFooter(t_Footer).b_Secondary;
    b_Primary = UT2K4GameFooter(t_Footer).b_Primary;
    //return;    
}

function InternalOnOpen()
{
    ChangeGameType(false);
    //return;    
}

function bool GameTypeLocked()
{
    local int i;
    local export editinline GUITabButton tB;

    // End:0x0D
    if(p_Game == none)
    {
        return false;
    }
    // End:0xB1
    if(Controller.LastGameType == "")
    {
        i = 0;
        J0x29:

        // End:0x96 [Loop If]
        if(i < c_Tabs.TabStack.Length)
        {
            tB = c_Tabs.TabStack[i];
            // End:0x8C
            if((tB != none) && tB != p_Game.MyButton)
            {
                DisableComponent(tB);
            }
            i++;
            // [Loop Continue]
            goto J0x29;
        }
        DisableComponent(b_Primary);
        DisableComponent(b_Secondary);
        return true;        
    }
    else
    {
        i = 0;
        J0xB8:

        // End:0x145 [Loop If]
        if(i < c_Tabs.TabStack.Length)
        {
            tB = c_Tabs.TabStack[i];
            // End:0x13B
            if(tB != none)
            {
                // End:0x130
                if((tB.MyPanel == p_Mutators) && Class'Engine.LevelInfo'.static.IsDemoBuild())
                {
                    DisableComponent(tB);
                    // [Explicit Continue]
                    goto J0x13B;
                }
                EnableComponent(tB);
            }
            J0x13B:

            i++;
            // [Loop Continue]
            goto J0xB8;
        }
        EnableComponent(b_Primary);
        EnableComponent(b_Secondary);
        // End:0x1B1
        if((RuleInfo != none) && mcRules != none)
        {
            i = RuleInfo.FindIndex("BotMode");
            // End:0x1B1
            if(i != -1)
            {
                mcRules.UpdateBotSetting(i);
            }
        }
    }
    return false;
    //return;    
}

function bool InternalOnClick(GUIComponent Sender)
{
    local string URL;

    // End:0x38
    if(Sender == b_Back)
    {
        // End:0x26
        if(RuleInfo != none)
        {
            RuleInfo.SaveSettings();
        }
        Controller.CloseMenu(true);
        return true;
    }
    // End:0x7C
    if((Sender == b_Primary) || Sender == b_Secondary)
    {
        PrepareToPlay(URL);
        StartGame(URL, Sender == b_Secondary);
        return true;
    }
    return false;
    //return;    
}

function PrepareToPlay(out string GameURL, optional string OverrideMap)
{
    GameURL = p_Main.Play();
    // End:0x2C
    if(OverrideMap != "")
    {
        GameURL = OverrideMap;
    }
    GameURL $= ("?Game=" $ p_Main.GetGameClass());
    GameURL $= p_Mutators.Play();
    // End:0x89
    if(mcRules != none)
    {
        GameURL $= mcRules.Play();
    }
    RuleInfo.SaveSettings();
    //return;    
}

function StartGame(string GameURL, bool bAlt)
{
    //return;    
}

function InternalOnChange(GUIComponent Sender)
{
    // End:0x12
    if(GUITabButton(Sender) == none)
    {
        return;
    }
    t_Header.SetCaption((PageCaption @ "|") @ GUITabButton(Sender).Caption);
    //return;    
}

function ChangeGameType(bool bIsCustom)
{
    // End:0x0B
    if(GameTypeLocked())
    {
        return;
    }
    // End:0x4D
    if(p_Main != none)
    {
        p_Main.InitGameType();
        // End:0x4D
        if(p_Mutators != none)
        {
            p_Mutators.SetCurrentGame(p_Main.CurrentGameType);
        }
    }
    SetRuleInfo();
    // End:0x89
    if(!bIsCustom && Controller.bCurMenuInitialized)
    {
        c_Tabs.ActivateTabByName(PanelCaption[1], true);
    }
    // End:0xB2
    if(p_BotConfig != none)
    {
        p_BotConfig.SetupBotLists(p_Main.GetIsTeamGame());
    }
    //return;    
}

function ChangeMutators(string ActiveMutatorString)
{
    SetRuleInfo();
    //return;    
}

function SetRuleInfo(optional string GameName)
{
    local int i;
    local Class<GameInfo> GameClass;
    local Class<AccessControl> ACClass;
    local array< Class<Info> > PIClasses;

    // End:0x2E
    if((RuleInfo != none) && RuleInfo.InfoClasses.Length > 0)
    {
        RuleInfo.SaveSettings();
    }
    // End:0x83
    if(GameName == "")
    {
        // End:0x6F
        if(Controller.LastGameType == "")
        {
            GameName = "UnrealGame.DeathMatch";            
        }
        else
        {
            GameName = Controller.LastGameType;
        }
    }
    GameClass = Class<GameInfo>(DynamicLoadObject(GameName, Class'Core.Class'));
    // End:0x114
    if(GameClass != none)
    {
        PIClasses[i++] = GameClass;
        SetupBotText(GameClass);
        ACClass = Class<AccessControl>(DynamicLoadObject(GameClass.default.AccessControlClass, Class'Core.Class'));
        // End:0x109
        if(ACClass != none)
        {
            PIClasses[i++] = ACClass;
        }
        InitRuleInfo(PIClasses);
    }
    //return;    
}

function InitRuleInfo(array< Class<Info> > PIClasses)
{
    RuleInfo.Init(PIClasses);
    // End:0x31
    if(p_Rules != none)
    {
        p_Rules.Refresh();        
    }
    else
    {
        // End:0x4B
        if(mcRules != none)
        {
            mcRules.Refresh();
        }
    }
    //return;    
}

function SetupBotText(Class<GameInfo> GameClass)
{
    //return;    
}

event free()
{
    // End:0x12
    if(!bPersistent)
    {
        RuleInfo = none;
    }
    super(GUIPage).free();
    //return;    
}

event bool NotifyLevelChange()
{
    bPersistent = false;
    LevelChanged();
    return true;
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

function GUITabButton GetBotTab()
{
    local string S;
    local int i;

    S = GetBotTabName();
    // End:0x1A
    if(S == "")
    {
        return none;
    }
    // End:0x27
    if(c_Tabs == none)
    {
        return none;
    }
    i = c_Tabs.TabIndex(S);
    // End:0x7C
    if((i > 0) && i < c_Tabs.TabStack.Length)
    {
        return c_Tabs.TabStack[i];
    }
    return none;
    //return;    
}

function UpdateBotSetting(string NewValue, moNumericEdit BotControl)
{
    //return;    
}

defaultproperties
{
    // Reference: GUIHeader'GUI2K4_Decompressed.UT2K4GamePageBase.GamePageHeader'
    begin object name="GamePageHeader" class=XInterface.GUIHeader
        RenderWeight=0.3000000
    end object
    t_Header=GamePageHeader
    PanelCaption[0]="?? ??"
    PanelCaption[1]="? ??"
    PanelCaption[2]="?? ??"
    PanelCaption[3]="????"
    PanelCaption[4]="? ??"
    PanelHint[0]="?? ??? ?????"
    PanelHint[1]="???? ????? ?? ?? ???? ????."
    PanelHint[2]="? ????? ??? ?????."
    PanelHint[3]="???? ????? ??? ?????.."
    PanelHint[4]="?? ??? ??? ??? ?????..."
    OnOpen=UT2K4GamePageBase.InternalOnOpen
}