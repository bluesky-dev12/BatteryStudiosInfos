/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\IAMultiColumnRulesPanel.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:7
 *	Functions:12
 *
 *******************************************************************************/
class IAMultiColumnRulesPanel extends UT2K4PlayInfoPanel
    config(User)
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_Advanced;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moButton b_Symbols;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage i_bk;
var() config string RedSym;
var() config string BlueSym;
var() string TeamSymbolPage;
var() editconst export editinline UT2K4GamePageBase p_Anchor;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    // End:0x42
    if(UT2K4GamePageBase(Controller.ActivePage) != none)
    {
        p_Anchor = UT2K4GamePageBase(Controller.ActivePage);
    }
    ch_Advanced.Checked(Controller.bExpertMode);
    lb_Rules.SetPosition(0.0249120, 0.0807390, 0.9501750, 0.7131780);
    li_Rules.ColumnWidth = 0.960;
}

function Refresh()
{
    local int i;

    RedSym = default.RedSym;
    BlueSym = default.BlueSym;
    bRefresh = true;
    bUpdate = true;
    SetGamePI();
    // End:0x45
    if(InfoRules.Length > 0)
    {
        InfoRules.Remove(0, InfoRules.Length);
    }
    i = 0;
    J0x4c:
    // End:0x9e [While If]
    if(i < GamePI.Settings.Length)
    {
        // End:0x94
        if(ShouldDisplayRule(i))
        {
            InfoRules[InfoRules.Length] = GamePI.Settings[i];
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x4c;
    }
    ClearRules();
    LoadRules();
}

protected function SetGamePI()
{
    GamePI = p_Anchor.RuleInfo;
    GamePI.Sort(0);
}

protected function bool ShouldDisplayRule(int Index)
{
    // End:0x35
    if(GamePI.Settings[Index].bAdvanced && !Controller.bExpertMode)
    {
        return false;
    }
    return !GamePI.Settings[Index].bMPOnly;
}

function LoadRules()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x89 [While If]
    if(i < InfoRules.Length)
    {
        // End:0x69
        if(i == 0 || InfoRules[i].Grouping != InfoRules[i - 1].Grouping)
        {
            AddGroupHeader(i, li_Rules.Elements.Length == 0);
        }
        AddRule(InfoRules[i], i);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    super.LoadRules();
    // End:0xcf
    if(GamePI != none)
    {
        i = GamePI.FindIndex("BotMode");
        // End:0xcf
        if(i != -1)
        {
            UpdateBotSetting(i);
        }
    }
    UpdateAdvancedCheckbox();
    UpdateSymbolButton();
}

protected function StoreSetting(int Index, string NewValue)
{
    GamePI.StoreSetting(Index, NewValue);
    // End:0x4f
    if(InStr(GamePI.Settings[Index].SettingName, "BotMode") != -1)
    {
        UpdateBotSetting(Index);
    }
}

function UpdateBotSetting(int BotModeIndex)
{
    local int MinPlayerListIndex, MinPlayerIndex;
    local export editinline moNumericEdit nu;

    // End:0x65
    if(li_Rules == none || GamePI == none || p_Anchor == none || p_Anchor.c_Tabs == none || BotModeIndex < 0 || BotModeIndex >= GamePI.Settings.Length)
    {
        return;
    }
    MinPlayerIndex = 0;
    J0x6c:
    // End:0xb1 [While If]
    if(MinPlayerIndex < InfoRules.Length)
    {
        // End:0xa7
        if(InStr(InfoRules[MinPlayerIndex].SettingName, "MinPlayers") != -1)
        {
        }
        // End:0xb1
        else
        {
            ++ MinPlayerIndex;
            // This is an implied JumpToken; Continue!
            goto J0x6c;
        }
    }
    // End:0x108
    if(MinPlayerIndex < InfoRules.Length)
    {
        MinPlayerListIndex = FindComponentWithTag(MinPlayerIndex);
        // End:0x108
        if(li_Rules.ValidIndex(MinPlayerListIndex))
        {
            nu = moNumericEdit(li_Rules.Elements[MinPlayerListIndex]);
        }
    }
    p_Anchor.UpdateBotSetting(GamePI.Settings[BotModeIndex].Value, nu);
}

function SymbolConfigClosed(optional bool bCancelled)
{
    local export editinline TeamSymbolConfig SymConfig;
    local Material Sym;
    local bool bSave;

    SymConfig = TeamSymbolConfig(Controller.ActivePage);
    // End:0x56
    if(SymConfig.i_RedPreview.Image != none)
    {
        Sym = SymConfig.i_RedPreview.Image;
    }
    // End:0x5d
    else
    {
        Sym = none;
    }
    // End:0x8f
    if(Sym != none)
    {
        bSave = !string(Sym) ~= RedSym;
        RedSym = string(Sym);
    }
    // End:0xab
    else
    {
        // End:0xab
        if(RedSym != "")
        {
            RedSym = "";
            bSave = true;
        }
    }
    // End:0xe8
    if(SymConfig.i_BluePreview.Image != none)
    {
        Sym = SymConfig.i_BluePreview.Image;
    }
    // End:0xef
    else
    {
        Sym = none;
    }
    // End:0x12c
    if(Sym != none)
    {
        bSave = bSave || !string(Sym) ~= BlueSym;
        BlueSym = string(Sym);
    }
    // End:0x148
    else
    {
        // End:0x148
        if(BlueSym != "")
        {
            BlueSym = "";
            bSave = true;
        }
    }
    // End:0x154
    if(bSave)
    {
        SaveConfig();
    }
}

function InternalOnChange(GUIComponent Sender)
{
    local class<GameInfo> GameClass;

    // End:0x66
    if(Sender == ch_Advanced)
    {
        Controller.bExpertMode = ch_Advanced.IsChecked();
        Controller.SaveConfig();
        p_Anchor.SetRuleInfo();
        p_Anchor.p_Main.InitMaps();
        return;
    }
    // End:0x119
    else
    {
        // End:0x119
        if(Sender == b_Symbols)
        {
            GameClass = class<GameInfo>(GamePI.InfoClasses[0]);
            // End:0xb4
            if(RedSym == "")
            {
                RedSym = string(GameClass.static.GetRandomTeamSymbol(0));
            }
            // End:0xd9
            if(BlueSym == "")
            {
                BlueSym = string(GameClass.static.GetRandomTeamSymbol(10));
            }
            // End:0x117
            if(Controller.OpenMenu(TeamSymbolPage, RedSym, BlueSym))
            {
                Controller.ActivePage.__OnClose__Delegate = SymbolConfigClosed;
            }
            return;
        }
    }
    super.InternalOnChange(Sender);
}

function UpdateSymbolButton()
{
    // End:0x29
    if(p_Anchor.p_Main.GetIsTeamGame())
    {
        EnableComponent(b_Symbols);
    }
    // End:0x34
    else
    {
        DisableComponent(b_Symbols);
    }
}

function UpdateAdvancedCheckbox()
{
    // End:0x51
    if(Controller != none && Controller.bExpertMode != ch_Advanced.IsChecked())
    {
        ch_Advanced.SetComponentValue(string(Controller.bExpertMode), true);
    }
}

function string Play()
{
    local string S;

    // End:0x2d
    if(RedSym != "")
    {
        S $= "?RedTeamSymbol=" $ RedSym;
    }
    // End:0x5b
    if(BlueSym != "")
    {
        S $= "?BlueTeamSymbol=" $ BlueSym;
    }
    return S;
}

defaultproperties
{
    begin object name=AdvancedButton class=moCheckBox
        Caption="?? ?? ??"
        OnCreateComponent=InternalOnCreateComponent
        Hint="?? ??? ????? ??????."
        WinTop=0.9483340
        WinLeft=0.1367250
        WinWidth=0.30
        WinHeight=0.040
        RenderWeight=1.0
        TabOrder=1
        bBoundToParent=true
        bScaleToParent=true
        OnChange=InternalOnChange
    object end
    // Reference: moCheckBox'IAMultiColumnRulesPanel.AdvancedButton'
    ch_Advanced=AdvancedButton
    begin object name=SymbolButton class=moButton
        ButtonCaption="??"
        ComponentWidth=0.40
        Caption="? ??"
        OnCreateComponent=InternalOnCreateComponent
        Hint="? ?? ??? ?????."
        WinTop=0.9361820
        WinLeft=0.5236640
        WinWidth=0.3293460
        WinHeight=0.0562820
        TabOrder=2
        OnChange=InternalOnChange
    object end
    // Reference: moButton'IAMultiColumnRulesPanel.SymbolButton'
    b_Symbols=SymbolButton
    begin object name=Bk1 class=GUIImage
        ImageStyle=1
        WinTop=0.0147330
        WinLeft=0.0005050
        WinWidth=0.9969970
        WinHeight=0.907930
    object end
    // Reference: GUIImage'IAMultiColumnRulesPanel.Bk1'
    i_bk=Bk1
    TeamSymbolPage="GUI2K4.TeamSymbolConfig"
    NumColumns=2
}