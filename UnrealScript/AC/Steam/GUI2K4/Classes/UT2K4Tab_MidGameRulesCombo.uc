/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4Tab_MidGameRulesCombo.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:12
 *	Functions:8
 *
 *******************************************************************************/
class UT2K4Tab_MidGameRulesCombo extends MidGamePanel
    editinlinenew
    instanced;

struct AServerRule
{
    var string RuleName;
    var string RuleValue;
};

var() noexport array<AServerRule> ServerRules;
var noexport editinline GUIList li_Maps;
var noexport editinline GUIMultiColumnList li_Rules;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sb_Rules;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sb_Maps;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIListBox lb_Maps;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIMultiColumnListBox lb_Rules;
var() localized string DefaultRulesText;
var() localized string DefaultMapsText;
var() bool bReceivedRules;
var() bool bReceivedMaps;
var() bool bClient;

function InitComponent(GUIController InController, GUIComponent inOwner)
{
    super(GUIPanel).InitComponent(InController, inOwner);
    li_Rules = lb_Rules.List;
    li_Maps = lb_Maps.List;
    li_Rules.bInitializeList = false;
    li_Maps.bInitializeList = false;
    li_Maps.TextAlign = 1;
    li_Maps.Add(DefaultMapsText);
    li_Rules.SortColumn = -1;
    li_Rules.__OnDrawItem__Delegate = DrawServerRule;
    sb_Rules.ManageComponent(lb_Rules);
    sb_Maps.ManageComponent(lb_Maps);
}

function ShowPanel(bool bShow)
{
    super(GUITabPanel).ShowPanel(bShow);
    // End:0x3e
    if(bShow && !bReceivedRules || !bReceivedMaps)
    {
        SetTimer(1.0, true);
        Timer();
    }
}

function Timer()
{
    local wPlayer PC;

    PC = wPlayer(PlayerOwner());
    // End:0x2e
    if(PC == none)
    {
        bReceivedMaps = true;
        bReceivedRules = true;
        KillTimer();
        return;
    }
    // End:0x5f
    if(!bReceivedRules)
    {
        PC.__ProcessRule__Delegate = ProcessRule;
        PC.ServerRequestRules();
    }
    // End:0x8d
    else
    {
        // End:0x8d
        if(!bReceivedMaps)
        {
            PC.__ProcessMapName__Delegate = ProcessMapName;
            PC.ServerRequestMapList();
        }
    }
}

function ProcessRule(string NewRule)
{
    local AServerRule Rule;

    bReceivedRules = true;
    // End:0x33
    if(NewRule == "")
    {
        ServerRules.Remove(0, ServerRules.Length);
        li_Rules.Clear();
    }
    // End:0x75
    else
    {
        // End:0x75
        if(Divide(NewRule, "=", Rule.RuleName, Rule.RuleValue))
        {
            ServerRules[ServerRules.Length] = Rule;
            li_Rules.AddedItem();
        }
    }
}

function ProcessMapName(string MapName)
{
    bReceivedMaps = true;
    // End:0x26
    if(MapName == "")
    {
        li_Maps.Clear();
    }
    // End:0x3a
    else
    {
        li_Maps.Add(MapName);
    }
}

function bool RightClick(GUIComponent Sender)
{
    local PlayerController PC;

    // End:0x1a
    if(Controller.ActiveControl != li_Maps)
    {
        return false;
    }
    PC = PlayerOwner();
    // End:0x47
    if(PC.Level.NetMode == 0)
    {
        return true;
    }
    // End:0x7a
    if(PC.PlayerReplicationInfo != none && PC.PlayerReplicationInfo.bAdmin)
    {
        return true;
    }
    return false;
}

function ContextClick(GUIContextMenu Sender, int Index)
{
    local PlayerController PC;
    local string MapName;

    PC = PlayerOwner();
    MapName = li_Maps.Get();
    // End:0x147
    if(MapName != "")
    {
        // End:0x119
        if(Index == 0)
        {
            // End:0x8d
            if(PC.Level.NetMode == 0)
            {
                Console(Controller.Master.Console).DelayedConsoleCommand("open" @ MapName);
            }
            // End:0x105
            else
            {
                // End:0xe7
                if(PC.Level.NetMode == 2)
                {
                    Console(Controller.Master.Console).DelayedConsoleCommand("switch" @ MapName);
                }
                // End:0x105
                else
                {
                    PC.AdminCommand("switch" @ MapName);
                }
            }
            Controller.CloseAll(false, true);
        }
        // End:0x147
        else
        {
            // End:0x147
            if(Index == 1)
            {
                PC.AdminCommand("maplist del" @ MapName);
            }
        }
    }
}

function DrawServerRule(Canvas Canvas, int i, float X, float Y, float W, float H, bool bSelected, bool bPending)
{
    local float CellLeft, CellWidth;

    li_Rules.GetCellLeftWidth(0, CellLeft, CellWidth);
    li_Rules.Style.DrawText(Canvas, li_Rules.MenuState, CellLeft, Y, CellWidth, H, 0, ServerRules[i].RuleName, li_Rules.FontScale);
    li_Rules.GetCellLeftWidth(1, CellLeft, CellWidth);
    li_Rules.Style.DrawText(Canvas, li_Rules.MenuState, CellLeft, Y, CellWidth, H, 0, ServerRules[i].RuleValue, li_Rules.FontScale);
}

defaultproperties
{
    begin object name=sbRules class=AltSectionBackground
        bFillClient=true
        Caption="?? ??"
        WinTop=0.0204380
        WinLeft=0.0236250
        WinWidth=0.9448750
        WinHeight=0.4557830
        bBoundToParent=true
        bScaleToParent=true
        OnPreDraw=InternalPreDraw
    object end
    // Reference: AltSectionBackground'UT2K4Tab_MidGameRulesCombo.sbRules'
    sb_Rules=sbRules
    begin object name=sbMaps class=AltSectionBackground
        bFillClient=true
        Caption="? ????"
        WinTop=0.4829210
        WinLeft=0.0551250
        WinWidth=0.8818750
        WinHeight=0.4361250
        bBoundToParent=true
        bScaleToParent=true
        OnPreDraw=InternalPreDraw
    object end
    // Reference: AltSectionBackground'UT2K4Tab_MidGameRulesCombo.sbMaps'
    sb_Maps=sbMaps
    begin object name=ComboMaplistBox class=GUIListBox
        SelectedStyleName="BrowserListSelection"
        bVisibleWhenEmpty=true
        OnCreateComponent=InternalOnCreateComponent
        StyleName="ServerBrowserGrid"
        WinTop=0.0459050
        WinLeft=0.5178290
        WinWidth=0.4781670
        WinHeight=0.9225160
        bBoundToParent=true
        bScaleToParent=true
    object end
    // Reference: GUIListBox'UT2K4Tab_MidGameRulesCombo.ComboMaplistBox'
    lb_Maps=ComboMaplistBox
    begin object name=ComboRulesListbox class=GUIMultiColumnListBox
        bDisplayHeader=true
        HeaderColumnPerc=// Object reference not set to an instance of an object.
        
        SelectedStyleName="BrowserListSelection"
        bVisibleWhenEmpty=true
        OnCreateComponent=InternalOnCreateComponent
        StyleName="ServerBrowserGrid"
        WinTop=0.0459050
        WinLeft=0.0082130
        WinWidth=0.4781670
        WinHeight=0.9225160
        bBoundToParent=true
        bScaleToParent=true
    object end
    // Reference: GUIMultiColumnListBox'UT2K4Tab_MidGameRulesCombo.ComboRulesListbox'
    lb_Rules=ComboRulesListbox
    DefaultRulesText="???? ?? ??? ?? ?.."
    DefaultMapsText="???? ? ???? ?? ?.."
    begin object name=ComboContextMenu class=GUIContextMenu
        ContextItems=// Object reference not set to an instance of an object.
        
        OnSelect=ContextClick
    object end
    // Reference: GUIContextMenu'UT2K4Tab_MidGameRulesCombo.ComboContextMenu'
    ContextMenu=ComboContextMenu
    OnRightClick=RightClick
}