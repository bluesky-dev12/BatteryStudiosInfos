class UT2K4Tab_MidGameRulesCombo extends MidGamePanel
    editinlinenew
    instanced;

struct AServerRule
{
    var string RuleName;
    var string RuleValue;
};

var() noexport array<AServerRule> ServerRules;
var /*0x00000000-0x00000008*/ noexport editinline GUIList li_Maps;
var /*0x00000000-0x00000008*/ noexport editinline GUIMultiColumnList li_Rules;
var() automated GUISectionBackground sb_Rules;
var() automated GUISectionBackground sb_Maps;
var() automated GUIListBox lb_Maps;
var() automated GUIMultiColumnListBox lb_Rules;
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
    //return;    
}

function ShowPanel(bool bShow)
{
    super(GUITabPanel).ShowPanel(bShow);
    // End:0x3E
    if(bShow && !bReceivedRules || !bReceivedMaps)
    {
        SetTimer(1.0000000, true);
        Timer();
    }
    //return;    
}

function Timer()
{
    local wPlayer PC;

    PC = wPlayer(PlayerOwner());
    // End:0x2E
    if(PC == none)
    {
        bReceivedMaps = true;
        bReceivedRules = true;
        KillTimer();
        return;
    }
    // End:0x5F
    if(!bReceivedRules)
    {
        PC.__ProcessRule__Delegate = ProcessRule;
        PC.ServerRequestRules();        
    }
    else
    {
        // End:0x8D
        if(!bReceivedMaps)
        {
            PC.__ProcessMapName__Delegate = ProcessMapName;
            PC.ServerRequestMapList();
        }
    }
    //return;    
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
    else
    {
        // End:0x75
        if(Divide(NewRule, "=", Rule.RuleName, Rule.RuleValue))
        {
            ServerRules[ServerRules.Length] = Rule;
            li_Rules.AddedItem();
        }
    }
    //return;    
}

function ProcessMapName(string MapName)
{
    bReceivedMaps = true;
    // End:0x26
    if(MapName == "")
    {
        li_Maps.Clear();        
    }
    else
    {
        li_Maps.Add(MapName);
    }
    //return;    
}

function bool RightClick(GUIComponent Sender)
{
    local PlayerController PC;

    // End:0x1A
    if(Controller.ActiveControl != li_Maps)
    {
        return false;
    }
    PC = PlayerOwner();
    // End:0x47
    if(int(PC.Level.NetMode) == int(NM_Standalone))
    {
        return true;
    }
    // End:0x7A
    if((PC.PlayerReplicationInfo != none) && PC.PlayerReplicationInfo.bAdmin)
    {
        return true;
    }
    return false;
    //return;    
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
            // End:0x8D
            if(int(PC.Level.NetMode) == int(NM_Standalone))
            {
                Console(Controller.Master.Console).DelayedConsoleCommand("open" @ MapName);                
            }
            else
            {
                // End:0xE7
                if(int(PC.Level.NetMode) == int(NM_ListenServer))
                {
                    Console(Controller.Master.Console).DelayedConsoleCommand("switch" @ MapName);                    
                }
                else
                {
                    PC.AdminCommand("switch" @ MapName);
                }
            }
            Controller.CloseAll(false, true);            
        }
        else
        {
            // End:0x147
            if(Index == 1)
            {
                PC.AdminCommand("maplist del" @ MapName);
            }
        }
    }
    //return;    
}

function DrawServerRule(Canvas Canvas, int i, float X, float Y, float W, float H, bool bSelected, bool bPending)
{
    local float CellLeft, CellWidth;

    li_Rules.GetCellLeftWidth(0, CellLeft, CellWidth);
    li_Rules.Style.DrawText(Canvas, li_Rules.MenuState, CellLeft, Y, CellWidth, H, 0, ServerRules[i].RuleName, li_Rules.FontScale);
    li_Rules.GetCellLeftWidth(1, CellLeft, CellWidth);
    li_Rules.Style.DrawText(Canvas, li_Rules.MenuState, CellLeft, Y, CellWidth, H, 0, ServerRules[i].RuleValue, li_Rules.FontScale);
    //return;    
}

defaultproperties
{
    // Reference: AltSectionBackground'GUI2K4_Decompressed.UT2K4Tab_MidGameRulesCombo.sbRules'
    begin object name="sbRules" class=GUI2K4_Decompressed.AltSectionBackground
        bFillClient=true
        Caption="?? ??"
        WinTop=0.0204380
        WinLeft=0.0236250
        WinWidth=0.9448750
        WinHeight=0.4557830
        bBoundToParent=true
        bScaleToParent=true
        OnPreDraw=sbRules.InternalPreDraw
    end object
    sb_Rules=sbRules
    // Reference: AltSectionBackground'GUI2K4_Decompressed.UT2K4Tab_MidGameRulesCombo.sbMaps'
    begin object name="sbMaps" class=GUI2K4_Decompressed.AltSectionBackground
        bFillClient=true
        Caption="? ????"
        WinTop=0.4829210
        WinLeft=0.0551250
        WinWidth=0.8818750
        WinHeight=0.4361250
        bBoundToParent=true
        bScaleToParent=true
        OnPreDraw=sbMaps.InternalPreDraw
    end object
    sb_Maps=sbMaps
    // Reference: GUIListBox'GUI2K4_Decompressed.UT2K4Tab_MidGameRulesCombo.ComboMaplistBox'
    begin object name="ComboMaplistBox" class=XInterface.GUIListBox
        SelectedStyleName="BrowserListSelection"
        bVisibleWhenEmpty=true
        OnCreateComponent=ComboMaplistBox.InternalOnCreateComponent
        StyleName="ServerBrowserGrid"
        WinTop=0.0459050
        WinLeft=0.5178290
        WinWidth=0.4781670
        WinHeight=0.9225160
        bBoundToParent=true
        bScaleToParent=true
    end object
    lb_Maps=ComboMaplistBox
    // Reference: GUIMultiColumnListBox'GUI2K4_Decompressed.UT2K4Tab_MidGameRulesCombo.ComboRulesListbox'
    begin object name="ComboRulesListbox" class=XInterface.GUIMultiColumnListBox
        bDisplayHeader=false
        HeaderColumnPerc=/* Array type was not detected. */
        SelectedStyleName="BrowserListSelection"
        bVisibleWhenEmpty=true
        OnCreateComponent=ComboRulesListbox.InternalOnCreateComponent
        StyleName="ServerBrowserGrid"
        WinTop=0.0459050
        WinLeft=0.0082130
        WinWidth=0.4781670
        WinHeight=0.9225160
        bBoundToParent=true
        bScaleToParent=true
    end object
    lb_Rules=ComboRulesListbox
    DefaultRulesText="???? ?? ??? ?? ?.."
    DefaultMapsText="???? ? ???? ?? ?.."
    // Reference: GUIContextMenu'GUI2K4_Decompressed.UT2K4Tab_MidGameRulesCombo.ComboContextMenu'
    begin object name="ComboContextMenu" class=XInterface.GUIContextMenu
        ContextItems=/* Array type was not detected. */
        OnSelect=UT2K4Tab_MidGameRulesCombo.ContextClick
    end object
    ContextMenu=ComboContextMenu
    OnRightClick=UT2K4Tab_MidGameRulesCombo.RightClick
}