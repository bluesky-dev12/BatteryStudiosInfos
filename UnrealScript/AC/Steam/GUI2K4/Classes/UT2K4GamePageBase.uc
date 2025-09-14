/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4GamePageBase.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:14
 *	Functions:17
 *
 *******************************************************************************/
class UT2K4GamePageBase extends UT2k4MainPage
    dependson(UT2k4MainPage)
    dependson(UT2K4Tab_RulesBase)
    dependson(IAMultiColumnRulesPanel)
    dependson(UT2K4Tab_MainBase)
    dependson(UT2K4Tab_MutatorBase)
    dependson(UT2K4Tab_BotConfigBase)
    dependson(UT2K4Tab_GameTypeBase)
    dependson(UT2K4GameFooter)
    config(User)
    editinlinenew
    instanced;

var() localized string PageCaption;
var() config bool bUseTabs;
var() editconst noexport editinline GUIButton b_Primary;
var() editconst noexport editinline GUIButton b_Secondary;
var() editconst noexport editinline GUIButton b_Back;
var() editconst noexport PlayInfo RuleInfo;
var() editconst noexport GameRecord currentGame;
var() editconst noexport editinline UT2K4Tab_GameTypeBase p_Game;
var() editconst noexport editinline UT2K4Tab_MainBase p_Main;
var() editconst noexport editinline UT2K4Tab_RulesBase p_Rules;
var() editconst noexport editinline IAMultiColumnRulesPanel mcRules;
var() editconst noexport editinline UT2K4Tab_ServerRulesPanel mcServerRules;
var() editconst noexport editinline UT2K4Tab_MutatorBase p_Mutators;
var() editconst noexport editinline UT2K4Tab_BotConfigBase p_BotConfig;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    RuleInfo = new (none) class'PlayInfo';
    p_Game = UT2K4Tab_GameTypeBase(c_Tabs.AddTab(PanelCaption[i], PanelClass[i],, PanelHint[++ i], true));
    p_Game.__OnChangeGameType__Delegate = ChangeGameType;
    p_Main = UT2K4Tab_MainBase(c_Tabs.AddTab(PanelCaption[i], PanelClass[i],, PanelHint[++ i]));
    p_Game.tp_Main = p_Main;
    // End:0x10e
    if(bUseTabs)
    {
        p_Rules = UT2K4Tab_RulesBase(c_Tabs.AddTab(PanelCaption[i], PanelClass[i],, PanelHint[++ i]));
    }
    // End:0x161
    else
    {
        mcRules = IAMultiColumnRulesPanel(c_Tabs.AddTab(PanelCaption[i], "GUI2K4.IAMultiColumnRulesPanel",, PanelHint[++ i]));
    }
    p_Mutators = UT2K4Tab_MutatorBase(c_Tabs.AddTab(PanelCaption[i], PanelClass[i],, PanelHint[++ i]));
    p_BotConfig = UT2K4Tab_BotConfigBase(c_Tabs.AddTab(PanelCaption[i], PanelClass[i],, PanelHint[++ i]));
    b_Back = UT2K4GameFooter(t_Footer).b_Back;
    b_Secondary = UT2K4GameFooter(t_Footer).b_Secondary;
    b_Primary = UT2K4GameFooter(t_Footer).b_Primary;
}

function InternalOnOpen()
{
    ChangeGameType(false);
}

function bool GameTypeLocked()
{
    local int i;
    local export editinline GUITabButton tB;

    // End:0x0d
    if(p_Game == none)
    {
        return false;
    }
    // End:0xb1
    if(Controller.LastGameType == "")
    {
        i = 0;
        J0x29:
        // End:0x96 [While If]
        if(i < c_Tabs.TabStack.Length)
        {
            tB = c_Tabs.TabStack[i];
            // End:0x8c
            if(tB != none && tB != p_Game.MyButton)
            {
                DisableComponent(tB);
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x29;
        }
        DisableComponent(b_Primary);
        DisableComponent(b_Secondary);
        return true;
    }
    // End:0x1b1
    else
    {
        i = 0;
        J0xb8:
        // End:0x145 [While If]
        if(i < c_Tabs.TabStack.Length)
        {
            tB = c_Tabs.TabStack[i];
            // End:0x13b
            if(tB != none)
            {
                // End:0x130
                if(tB.MyPanel == p_Mutators && class'LevelInfo'.static.IsDemoBuild())
                {
                    DisableComponent(tB);
                }
                // End:0x13b
                else
                {
                    EnableComponent(tB);
                }
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0xb8;
        }
        EnableComponent(b_Primary);
        EnableComponent(b_Secondary);
        // End:0x1b1
        if(RuleInfo != none && mcRules != none)
        {
            i = RuleInfo.FindIndex("BotMode");
            // End:0x1b1
            if(i != -1)
            {
                mcRules.UpdateBotSetting(i);
            }
        }
    }
    return false;
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
    // End:0x7c
    if(Sender == b_Primary || Sender == b_Secondary)
    {
        PrepareToPlay(URL);
        StartGame(URL, Sender == b_Secondary);
        return true;
    }
    return false;
}

function PrepareToPlay(out string GameURL, optional string OverrideMap)
{
    GameURL = p_Main.Play();
    // End:0x2c
    if(OverrideMap != "")
    {
        GameURL = OverrideMap;
    }
    GameURL $= "?Game=" $ p_Main.GetGameClass();
    GameURL $= p_Mutators.Play();
    // End:0x89
    if(mcRules != none)
    {
        GameURL $= mcRules.Play();
    }
    RuleInfo.SaveSettings();
}

function StartGame(string GameURL, bool bAlt);
function InternalOnChange(GUIComponent Sender)
{
    // End:0x12
    if(GUITabButton(Sender) == none)
    {
        return;
    }
    t_Header.SetCaption(PageCaption @ "|" @ GUITabButton(Sender).Caption);
}

function ChangeGameType(bool bIsCustom)
{
    // End:0x0b
    if(GameTypeLocked())
    {
        return;
    }
    // End:0x4d
    if(p_Main != none)
    {
        p_Main.InitGameType();
        // End:0x4d
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
    // End:0xb2
    if(p_BotConfig != none)
    {
        p_BotConfig.SetupBotLists(p_Main.GetIsTeamGame());
    }
}

function ChangeMutators(string ActiveMutatorString)
{
    SetRuleInfo();
}

function SetRuleInfo(optional string GameName)
{
    local int i;
    local class<GameInfo> GameClass;
    local class<AccessControl> ACClass;
    local array< class<Info> > PIClasses;

    // End:0x2e
    if(RuleInfo != none && RuleInfo.InfoClasses.Length > 0)
    {
        RuleInfo.SaveSettings();
    }
    // End:0x83
    if(GameName == "")
    {
        // End:0x6f
        if(Controller.LastGameType == "")
        {
            GameName = "UnrealGame.DeathMatch";
        }
        // End:0x83
        else
        {
            GameName = Controller.LastGameType;
        }
    }
    GameClass = class<GameInfo>(DynamicLoadObject(GameName, class'Class'));
    // End:0x114
    if(GameClass != none)
    {
        PIClasses[++ i] = GameClass;
        SetupBotText(GameClass);
        ACClass = class<AccessControl>(DynamicLoadObject(GameClass.default.AccessControlClass, class'Class'));
        // End:0x109
        if(ACClass != none)
        {
            PIClasses[++ i] = ACClass;
        }
        InitRuleInfo(PIClasses);
    }
}

function InitRuleInfo(array< class<Info> > PIClasses)
{
    RuleInfo.Init(PIClasses);
    // End:0x31
    if(p_Rules != none)
    {
        p_Rules.Refresh();
    }
    // End:0x4b
    else
    {
        // End:0x4b
        if(mcRules != none)
        {
            mcRules.Refresh();
        }
    }
}

function SetupBotText(class<GameInfo> GameClass);
event free()
{
    // End:0x12
    if(!bPersistent)
    {
        RuleInfo = none;
    }
    super(GUIPage).free();
}

event bool NotifyLevelChange()
{
    bPersistent = false;
    LevelChanged();
    return true;
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

function GUITabButton GetBotTab()
{
    local string S;
    local int i;

    S = GetBotTabName();
    // End:0x1a
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
    // End:0x7c
    if(i > 0 && i < c_Tabs.TabStack.Length)
    {
        return c_Tabs.TabStack[i];
    }
    return none;
}

function UpdateBotSetting(string NewValue, moNumericEdit BotControl);

defaultproperties
{
    begin object name=GamePageHeader class=GUIHeader
        RenderWeight=0.30
    object end
    // Reference: GUIHeader'UT2K4GamePageBase.GamePageHeader'
    t_Header=GamePageHeader
    PanelCaption=// Object reference not set to an instance of an object.
    
    PanelHint=// Object reference not set to an instance of an object.
    
    OnOpen=InternalOnOpen
}