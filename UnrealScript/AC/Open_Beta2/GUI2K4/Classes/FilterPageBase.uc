class FilterPageBase extends LargeWindow
    config(User)
    editinlinenew
    instanced;

var globalconfig float FilterSplitterPosition;
var BrowserFilters FM;
var export editinline GUIMultiOptionList li_Filter;
var export editinline UT2K4FilterControlPanel cp_Filter;
var int Index;
var array<MutatorRecord> MutatorRecords;
var() automated GUISplitter sp_Filter;
var() automated GUIImage i_BG;
var bool bNeedRefresh;
var localized string SaveString;
var string CurrentGameType;

function InitComponent(GUIController MyC, GUIComponent MyO)
{
    super(FloatingWindow).InitComponent(MyC, MyO);
    li_Filter = cp_Filter.li_Filters;
    //return;    
}

function ApplyRules(int FilterIndex, optional bool bRefresh)
{
    //return;    
}

function int FindFilterMasterIndex(int i)
{
    return FM.FindFilterIndex(li_Filter.GetItem(i).Caption);
    //return;    
}

event Opened(GUIComponent Sender)
{
    CheckFM();
    super(PopupPageBase).Opened(Sender);
    InitFilterList();
    //return;    
}

function CreateTemplateFilter(string TemplateName, array<KeyValuePair> RuleSet)
{
    local int i, idx;
    local string QueryType, RuleType;

    AddNewFilter(TemplateName);
    idx = FM.FindFilterIndex(TemplateName);
    i = 0;
    J0x2C:

    // End:0xAE [Loop If]
    if(i < RuleSet.Length)
    {
        // End:0x5F
        if(!CreateTemplateRule(RuleSet[i], QueryType, RuleType))
        {
            // [Explicit Continue]
            goto J0xA4;
        }
        FM.SetRule(idx, -1, "", RuleSet[i].key, RuleSet[i].Value, RuleType, QueryType);
        J0xA4:

        i++;
        // [Loop Continue]
        goto J0x2C;
    }
    li_Filter.SetIndex(idx);
    //return;    
}

function bool CreateTemplateRule(out KeyValuePair Rule, out string QueryType, out string RuleType)
{
    // End:0x4E
    if(((Rule.key ~= "IP") || Rule.key ~= "adminname") || Rule.key ~= "adminemail")
    {
        return false;
    }
    // End:0x8E
    if(IsNumber(Rule.Value))
    {
        RuleType = "DT_Ranged";
        QueryType = "QT_LessThanEquals";        
    }
    else
    {
        // End:0xE0
        if((Rule.Value ~= "true") || Rule.Value ~= "false")
        {
            RuleType = "DT_Unique";
            QueryType = "QT_Equals";            
        }
        else
        {
            // End:0x11F
            if(Rule.key ~= "mutator")
            {
                RuleType = "DT_Multiple";
                QueryType = "QT_Equals";                
            }
            else
            {
                RuleType = "DT_Unique";
                QueryType = "QT_Equals";
            }
        }
    }
    return true;
    //return;    
}

function bool IsNumber(string Test)
{
    // End:0x21
    if((int(Test) == 0) && Left(Test, 1) != "0")
    {
        return false;
    }
    return true;
    //return;    
}

function InitFilterList()
{
    local array<string> FilterNames;
    local export editinline moCheckBox ch;
    local int i;

    li_Filter.Clear();
    FilterNames = FM.GetFilterNames();
    i = 0;
    J0x2B:

    // End:0xB0 [Loop If]
    if(i < FilterNames.Length)
    {
        ch = moCheckBox(li_Filter.AddItem("XInterface.moCheckbox",, FilterNames[i]));
        // End:0xA6
        if(ch != none)
        {
            ch.Checked(FM.IsActiveAt(i));
        }
        i++;
        // [Loop Continue]
        goto J0x2B;
    }
    //return;    
}

function bool AddNewFilter(out string NewFilterName, optional bool bFocus)
{
    // End:0x71
    if(FM.AddCustomFilter(NewFilterName))
    {
        li_Filter.AddItem("XInterface.moCheckBox",, NewFilterName);
        // End:0x6F
        if(bFocus)
        {
            li_Filter.SetIndex(li_Filter.Find(NewFilterName));
        }
        return true;
    }
    return false;
    //return;    
}

function bool RemoveExistingFilter(string FilterName)
{
    // End:0x64
    if((FilterName != "") && li_Filter.ValidIndex(li_Filter.Index))
    {
        // End:0x64
        if(FM.RemoveFilter(FilterName))
        {
            li_Filter.RemoveItem(li_Filter.Index);
            return true;
        }
    }
    return false;
    //return;    
}

function bool RenameFilter(int Index, string NewName)
{
    // End:0x61
    if(li_Filter.ValidIndex(Index) && NewName != "")
    {
        // End:0x61
        if(FM.RenameFilter(Index, NewName))
        {
            li_Filter.Get().SetCaption(NewName);
            return true;
        }
    }
    return false;
    //return;    
}

function bool CopyFilter(int Index, out string NewName)
{
    // End:0x92
    if(li_Filter.ValidIndex(Index) && NewName != "")
    {
        // End:0x92
        if(FM.CopyFilter(Index, NewName))
        {
            li_Filter.AddItem("XInterface.moCheckbox",, NewName);
            li_Filter.SetIndex(li_Filter.Find(NewName));
            return true;
        }
    }
    return false;
    //return;    
}

function SaveFilters()
{
    FM.SaveFilters();
    //return;    
}

function ResetFilters()
{
    FM.ResetFilters();
    InitFilterList();
    //return;    
}

function CheckFM()
{
    // End:0x24
    if(FM == none)
    {
        FM = UT2k4ServerBrowser(ParentPage).FilterMaster;
    }
    //return;    
}

function InternalOnChange(GUIComponent Sender)
{
    local int i;
    local export editinline moCheckBox Sent;

    // End:0xD0
    if(Sender == li_Filter)
    {
        // End:0xC5
        if(li_Filter.ValidIndex(li_Filter.Index))
        {
            Sent = moCheckBox(li_Filter.Get());
            i = FM.FindFilterIndex(Sent.Caption);
            // End:0xB7
            if(Sent.IsChecked() != FM.IsActiveAt(i))
            {
                FM.ActivateFilter(i, Sent.IsChecked());
            }
            ApplyRules(i);            
        }
        else
        {
            ApplyRules(-1);
        }
    }
    //return;    
}

event Closed(GUIComponent Sender, bool bCancelled)
{
    // End:0x1B
    if(bCancelled)
    {
        FM.ResetFilters();        
    }
    else
    {
        SaveFilters();
        Index = -1;
        bNeedRefresh = true;
    }
    super(GUIPage).Closed(Sender, bCancelled);
    //return;    
}

function InternalOnLoad(GUIComponent Sender, string S)
{
    // End:0x23
    if(Sender == sp_Filter)
    {
        sp_Filter.SplitPosition = FilterSplitterPosition;
    }
    //return;    
}

function InternalOnCreateComponent(GUIComponent NewComp, GUIComponent Sender)
{
    // End:0x54
    if(GUISplitter(Sender) != none)
    {
        // End:0x54
        if(UT2K4FilterControlPanel(NewComp) != none)
        {
            cp_Filter = UT2K4FilterControlPanel(NewComp);
            cp_Filter.p_Anchor = self;
            cp_Filter.__OnChange__Delegate = InternalOnChange;
        }
    }
    // End:0x6F
    if(Sender == self)
    {
        super(FloatingWindow).InternalOnCreateComponent(NewComp, Sender);
    }
    //return;    
}

defaultproperties
{
    FilterSplitterPosition=0.3697660
    Index=-1
    SaveString="??? ????? ???????!"
    OnCreateComponent=FilterPageBase.InternalOnCreateComponent
    StyleName="TabBackground"
    WinTop=0.0361980
    WinLeft=0.0404300
    WinWidth=0.9093750
    WinHeight=0.9044920
}