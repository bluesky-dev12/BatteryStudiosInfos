class IAMultiColumnRulesPanel extends UT2K4PlayInfoPanel
    config(User)
    editinlinenew
    instanced;

var() automated moCheckBox ch_Advanced;
var() automated moButton b_Symbols;
var() automated GUIImage i_bk;
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
    li_Rules.ColumnWidth = 0.9600000;
    //return;    
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
    J0x4C:

    // End:0x9E [Loop If]
    if(i < GamePI.Settings.Length)
    {
        // End:0x94
        if(ShouldDisplayRule(i))
        {
            InfoRules[InfoRules.Length] = GamePI.Settings[i];
        }
        i++;
        // [Loop Continue]
        goto J0x4C;
    }
    ClearRules();
    LoadRules();
    //return;    
}

protected function SetGamePI()
{
    GamePI = p_Anchor.RuleInfo;
    GamePI.Sort(0);
    //return;    
}

protected function bool ShouldDisplayRule(int Index)
{
    // End:0x35
    if(GamePI.Settings[Index].bAdvanced && !Controller.bExpertMode)
    {
        return false;
    }
    return !GamePI.Settings[Index].bMPOnly;
    //return;    
}

function LoadRules()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x89 [Loop If]
    if(i < InfoRules.Length)
    {
        // End:0x69
        if((i == 0) || InfoRules[i].Grouping != InfoRules[i - 1].Grouping)
        {
            AddGroupHeader(i, li_Rules.Elements.Length == 0);
        }
        AddRule(InfoRules[i], i);
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    super.LoadRules();
    // End:0xCF
    if(GamePI != none)
    {
        i = GamePI.FindIndex("BotMode");
        // End:0xCF
        if(i != -1)
        {
            UpdateBotSetting(i);
        }
    }
    UpdateAdvancedCheckbox();
    UpdateSymbolButton();
    //return;    
}

protected function StoreSetting(int Index, string NewValue)
{
    GamePI.StoreSetting(Index, NewValue);
    // End:0x4F
    if(InStr(GamePI.Settings[Index].SettingName, "BotMode") != -1)
    {
        UpdateBotSetting(Index);
    }
    //return;    
}

function UpdateBotSetting(int BotModeIndex)
{
    local int MinPlayerListIndex, MinPlayerIndex;
    local export editinline moNumericEdit nu;

    // End:0x65
    if((((((li_Rules == none) || GamePI == none) || p_Anchor == none) || p_Anchor.c_Tabs == none) || BotModeIndex < 0) || BotModeIndex >= GamePI.Settings.Length)
    {
        return;
    }
    MinPlayerIndex = 0;
    J0x6C:

    // End:0xB1 [Loop If]
    if(MinPlayerIndex < InfoRules.Length)
    {
        // End:0xA7
        if(InStr(InfoRules[MinPlayerIndex].SettingName, "MinPlayers") != -1)
        {
            // [Explicit Break]
            goto J0xB1;
        }
        MinPlayerIndex++;
        // [Loop Continue]
        goto J0x6C;
    }
    J0xB1:

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
    //return;    
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
    else
    {
        Sym = none;
    }
    // End:0x8F
    if(Sym != none)
    {
        bSave = !string(Sym) ~= RedSym;
        RedSym = string(Sym);        
    }
    else
    {
        // End:0xAB
        if(RedSym != "")
        {
            RedSym = "";
            bSave = true;
        }
    }
    // End:0xE8
    if(SymConfig.i_BluePreview.Image != none)
    {
        Sym = SymConfig.i_BluePreview.Image;        
    }
    else
    {
        Sym = none;
    }
    // End:0x12C
    if(Sym != none)
    {
        bSave = bSave || !string(Sym) ~= BlueSym;
        BlueSym = string(Sym);        
    }
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
    //return;    
}

function InternalOnChange(GUIComponent Sender)
{
    local Class<GameInfo> GameClass;

    // End:0x66
    if(Sender == ch_Advanced)
    {
        Controller.bExpertMode = ch_Advanced.IsChecked();
        Controller.SaveConfig();
        p_Anchor.SetRuleInfo();
        p_Anchor.p_Main.InitMaps();
        return;        
    }
    else
    {
        // End:0x119
        if(Sender == b_Symbols)
        {
            GameClass = Class<GameInfo>(GamePI.InfoClasses[0]);
            // End:0xB4
            if(RedSym == "")
            {
                RedSym = string(GameClass.static.GetRandomTeamSymbol(0));
            }
            // End:0xD9
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
    //return;    
}

function UpdateSymbolButton()
{
    // End:0x29
    if(p_Anchor.p_Main.GetIsTeamGame())
    {
        EnableComponent(b_Symbols);        
    }
    else
    {
        DisableComponent(b_Symbols);
    }
    //return;    
}

function UpdateAdvancedCheckbox()
{
    // End:0x51
    if((Controller != none) && Controller.bExpertMode != ch_Advanced.IsChecked())
    {
        ch_Advanced.SetComponentValue(string(Controller.bExpertMode), true);
    }
    //return;    
}

function string Play()
{
    local string S;

    // End:0x2D
    if(RedSym != "")
    {
        S $= ("?RedTeamSymbol=" $ RedSym);
    }
    // End:0x5B
    if(BlueSym != "")
    {
        S $= ("?BlueTeamSymbol=" $ BlueSym);
    }
    return S;
    //return;    
}

defaultproperties
{
    // Reference: moCheckBox'GUI2K4_Decompressed.IAMultiColumnRulesPanel.AdvancedButton'
    begin object name="AdvancedButton" class=XInterface.moCheckBox
        Caption="?? ?? ??"
        OnCreateComponent=AdvancedButton.InternalOnCreateComponent
        Hint="?? ??? ????? ??????."
        WinTop=0.9483340
        WinLeft=0.1367250
        WinWidth=0.3000000
        WinHeight=0.0400000
        RenderWeight=1.0000000
        TabOrder=1
        bBoundToParent=true
        bScaleToParent=true
        OnChange=IAMultiColumnRulesPanel.InternalOnChange
    end object
    ch_Advanced=AdvancedButton
    // Reference: moButton'GUI2K4_Decompressed.IAMultiColumnRulesPanel.SymbolButton'
    begin object name="SymbolButton" class=XInterface.moButton
        ButtonCaption="??"
        ComponentWidth=0.4000000
        Caption="? ??"
        OnCreateComponent=SymbolButton.InternalOnCreateComponent
        Hint="? ?? ??? ?????."
        WinTop=0.9361820
        WinLeft=0.5236640
        WinWidth=0.3293460
        WinHeight=0.0562820
        TabOrder=2
        OnChange=IAMultiColumnRulesPanel.InternalOnChange
    end object
    b_Symbols=SymbolButton
    // Reference: GUIImage'GUI2K4_Decompressed.IAMultiColumnRulesPanel.Bk1'
    begin object name="Bk1" class=XInterface.GUIImage
        ImageStyle=1
        WinTop=0.0147330
        WinLeft=0.0005050
        WinWidth=0.9969970
        WinHeight=0.9079300
    end object
    i_bk=Bk1
    TeamSymbolPage="GUI2K4.TeamSymbolConfig"
    NumColumns=2
}