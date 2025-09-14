class UT2K4PlayInfoPanel extends UT2K4TabPanel
    abstract
    config(User)
    editinlinenew
    instanced;

var() int NumColumns;
var array<PlayInfoData> InfoRules;
var() automated GUIMultiOptionListBox lb_Rules;
var export editinline GUIMultiOptionList li_Rules;
var() config bool bVerticalLayout;
var() editconst noexport PlayInfo GamePI;
var() noexport bool bRefresh;
var() noexport bool bUpdate;
var() localized string EditText;

function InitComponent(GUIController MyC, GUIComponent MyO)
{
    lb_Rules.NumColumns = NumColumns;
    super(GUIPanel).InitComponent(MyC, MyO);
    li_Rules = lb_Rules.List;
    li_Rules.__OnCreateComponent__Delegate = InternalOnCreateComponent;
    li_Rules.bHotTrack = true;
    //return;    
}

function bool CanShowPanel()
{
    // End:0x0D
    if(GamePI == none)
    {
        return false;
    }
    return super(GUITabPanel).CanShowPanel();
    //return;    
}

function Refresh()
{
    GamePI.GetSettings(MyButton.Caption, InfoRules);
    ClearRules();
    LoadRules();
    //return;    
}

function LoadRules()
{
    // End:0x0F
    if(bUpdate)
    {
        UpdateRules();
    }
    //return;    
}

function UpdateRules()
{
    local int i, j;

    i = 0;
    J0x07:

    // End:0x173 [Loop If]
    if(i < li_Rules.Elements.Length)
    {
        // End:0x42
        if(GUIListSpacer(li_Rules.Elements[i]) != none)
        {
            // [Explicit Continue]
            goto J0x169;
        }
        j = li_Rules.Elements[i].Tag;
        // End:0xA7
        if(InfoRules[j].DisplayName != li_Rules.Elements[i].Caption)
        {
            DumpListElements(i, j);
        }
        assert(InfoRules[j].DisplayName == li_Rules.Elements[i].Caption);
        li_Rules.Elements[i].SetHint(InfoRules[j].Description);
        // End:0x146
        if(j < InfoRules.Length)
        {
            li_Rules.Elements[i].SetComponentValue(InfoRules[j].Value, true);
        }
        li_Rules.Elements[i].TabOrder = i;
        J0x169:

        i++;
        // [Loop Continue]
        goto J0x07;
    }
    bRefresh = false;
    bUpdate = false;
    //return;    
}

function DumpListElements(int BadListIndex, int BadPlayInfoIndex)
{
    local int i;

    Log("** DumpListElements **");
    Log((((((("Element[" $ string(BadListIndex)) $ "] caption:") $ li_Rules.Elements[BadListIndex].Caption) @ "Setting[") $ string(BadPlayInfoIndex)) $ "] caption:") $ GamePI.Settings[BadPlayInfoIndex].DisplayName);
    i = 0;
    J0xA1:

    // End:0x112 [Loop If]
    if(i < li_Rules.Elements.Length)
    {
        Log(((string(i) $ ")") @ li_Rules.Elements[i].Caption) @ string(li_Rules.Elements[i].Tag));
        i++;
        // [Loop Continue]
        goto J0xA1;
    }
    GamePI.Dump();
    //return;    
}

function AddRule(PlayInfoData NewRule, int Index)
{
    local bool bTemp;
    local string Width, Op;
    local array<string> Range;
    local export editinline moComboBox co;
    local export editinline moFloatEdit fl;
    local export editinline moEditBox ed;
    local export editinline moCheckBox ch;
    local export editinline moNumericEdit nu;
    local export editinline moButton bu;
    local int i, pos;

    bTemp = Controller.bCurMenuInitialized;
    Controller.bCurMenuInitialized = false;
    switch(NewRule.RenderType)
    {
        // End:0xAB
        case 0:
            ch = moCheckBox(li_Rules.AddItem("XInterface.moCheckbox",, NewRule.DisplayName, true));
            // End:0x83
            if(ch == none)
            {
                // [Explicit Continue]
                goto J0x604;
            }
            ch.Tag = Index;
            ch.bAutoSizeCaption = true;
            // End:0x604
            break;
        // End:0x1B7
        case 1:
            co = moComboBox(li_Rules.AddItem("XInterface.moComboBox",, NewRule.DisplayName, true));
            // End:0xFB
            if(co == none)
            {
                // [Explicit Continue]
                goto J0x604;
            }
            co.ReadOnly(true);
            co.bAutoSizeCaption = true;
            co.Tag = Index;
            co.CaptionWidth = 0.5000000;
            GamePI.SplitStringToArray(Range, NewRule.Data, ";");
            i = 0;
            J0x16C:

            // End:0x1B4 [Loop If]
            if((i + 1) < Range.Length)
            {
                co.AddItem(Range[i + 1],, Range[i]);
                i += 2;
                // [Loop Continue]
                goto J0x16C;
            }
            // End:0x604
            break;
        // End:0x56B
        case 2:
            // End:0x1EA
            if(!Divide(NewRule.Data, ";", Width, Op))
            {
                Width = NewRule.Data;
            }
            pos = InStr(Width, ",");
            // End:0x21B
            if(pos != -1)
            {
                Width = Left(Width, pos);
            }
            // End:0x237
            if(Width != "")
            {
                i = int(Width);                
            }
            else
            {
                i = -1;
            }
            GamePI.SplitStringToArray(Range, Op, ":");
            // End:0x420
            if(Range.Length > 1)
            {
                // End:0x34F
                if(InStr(Range[0], ".") != -1)
                {
                    fl = moFloatEdit(li_Rules.AddItem("XInterface.moFloatEdit",, NewRule.DisplayName, true));
                    // End:0x2CC
                    if(fl == none)
                    {
                        // [Explicit Continue]
                        goto J0x604;
                    }
                    fl.Tag = Index;
                    fl.bAutoSizeCaption = true;
                    fl.ComponentWidth = 0.2500000;
                    // End:0x34C
                    if(i != -1)
                    {
                        fl.Setup(float(Range[0]), float(Range[1]), fl.MyNumericEdit.Step);
                    }                    
                }
                else
                {
                    nu = moNumericEdit(li_Rules.AddItem("XInterface.moNumericEdit",, NewRule.DisplayName, true));
                    // End:0x39D
                    if(nu == none)
                    {
                        // [Explicit Continue]
                        goto J0x604;
                    }
                    nu.Tag = Index;
                    nu.bAutoSizeCaption = true;
                    nu.ComponentWidth = 0.2500000;
                    // End:0x41D
                    if(i != -1)
                    {
                        nu.Setup(int(Range[0]), int(Range[1]), nu.MyNumericEdit.Step);
                    }
                }                
            }
            else
            {
                // End:0x4CD
                if(NewRule.ArrayDim != -1)
                {
                    bu = moButton(li_Rules.AddItem("XInterface.moButton",, NewRule.DisplayName, true));
                    // End:0x47D
                    if(bu == none)
                    {
                        // [Explicit Continue]
                        goto J0x604;
                    }
                    bu.Tag = Index;
                    bu.bAutoSizeCaption = true;
                    bu.ComponentWidth = 0.2500000;
                    bu.__OnChange__Delegate = ArrayPropClicked;                    
                }
                else
                {
                    ed = moEditBox(li_Rules.AddItem("XInterface.moEditBox",, NewRule.DisplayName, true));
                    // End:0x517
                    if(ed == none)
                    {
                        // [Explicit Continue]
                        goto J0x604;
                    }
                    ed.Tag = Index;
                    ed.bAutoSizeCaption = true;
                    // End:0x568
                    if(i != -1)
                    {
                        ed.MyEditBox.MaxWidth = i;
                    }
                }
            }
            // End:0x604
            break;
        // End:0xFFFF
        default:
            bu = moButton(li_Rules.AddItem("XInterface.moButton",, NewRule.DisplayName, true));
            // End:0x5B7
            if(bu == none)
            {                
            }
            else
            {
                bu.Tag = Index;
                bu.bAutoSizeCaption = true;
                bu.ComponentWidth = 0.2500000;
                bu.__OnChange__Delegate = CustomClicked;
            }
            break;
    }
    J0x604:

    Controller.bCurMenuInitialized = bTemp;
    //return;    
}

function AddGroupHeader(int PlayInfoIndex, bool InitialRow)
{
    local int ModResult, i;
    local export editinline GUIMenuOption Mo;

    // End:0xD5
    if(!li_Rules.bVerticalLayout)
    {
        ModResult = int(float(li_Rules.Elements.Length) % float(lb_Rules.NumColumns));
        J0x3F:

        // End:0x78 [Loop If]
        if(ModResult-- > 0)
        {
            li_Rules.AddItem("XInterface.GUIListSpacer");
            // [Loop Continue]
            goto J0x3F;
        }
        // End:0xD5
        if(!InitialRow)
        {
            i = 0;
            J0x8A:

            // End:0xD5 [Loop If]
            if(i < lb_Rules.NumColumns)
            {
                li_Rules.AddItem("XInterface.GUIListSpacer");
                i++;
                // [Loop Continue]
                goto J0x8A;
            }
        }
    }
    Mo = li_Rules.AddItem("XInterface.GUIListHeader",, InfoRules[PlayInfoIndex].Grouping);
    // End:0x131
    if(Mo != none)
    {
        Mo.bAutoSizeCaption = true;
    }
    // End:0x1B4
    if(!li_Rules.bVerticalLayout)
    {
        i = 0;
        J0x14C:

        // End:0x1B4 [Loop If]
        if(++i < lb_Rules.NumColumns)
        {
            Mo = li_Rules.AddItem("XInterface.GUIListHeader");
            // End:0x1B1
            if(Mo != none)
            {
                Mo.bAutoSizeCaption = true;
            }
            // [Loop Continue]
            goto J0x14C;
        }
    }
    //return;    
}

function ClearRules()
{
    li_Rules.Clear();
    //return;    
}

function InternalOnActivate()
{
    // End:0x12
    if(bRefresh)
    {
        Refresh();        
    }
    else
    {
        // End:0x21
        if(bUpdate)
        {
            UpdateRules();
        }
    }
    //return;    
}

function ListBoxCreateComponent(GUIComponent NewComp, GUIComponent Sender)
{
    // End:0x5A
    if(GUIMultiOptionList(NewComp) != none)
    {
        GUIMultiOptionList(NewComp).bVerticalLayout = bVerticalLayout;
        GUIMultiOptionList(NewComp).bDrawSelectionBorder = false;
        GUIMultiOptionList(NewComp).ItemPadding = 0.1500000;
    }
    // End:0x82
    if(Sender == lb_Rules)
    {
        lb_Rules.InternalOnCreateComponent(NewComp, Sender);
    }
    //return;    
}

function InternalOnCreateComponent(GUIMenuOption NewComp, GUIMultiOptionList Sender)
{
    // End:0x90
    if(Sender == li_Rules)
    {
        NewComp.ComponentJustification = 2;
        NewComp.LabelJustification = 0;
        NewComp.CaptionWidth = 0.6500000;
        // End:0x90
        if(moButton(NewComp) != none)
        {
            moButton(NewComp).ButtonStyleName = "SquareButton";
            moButton(NewComp).ButtonCaption = EditText;
        }
    }
    //return;    
}

function InternalOnChange(GUIComponent Sender)
{
    // End:0x3F
    if(GUIMultiOptionList(Sender) != none)
    {
        // End:0x3C
        if(Controller.bCurMenuInitialized)
        {
            UpdateSetting(GUIMultiOptionList(Sender).Get());
        }        
    }
    else
    {
        // End:0x73
        if((GUIMenuOption(Sender) != none) && Controller.bCurMenuInitialized)
        {
            UpdateSetting(GUIMenuOption(Sender));
        }
    }
    //return;    
}

function UpdateSetting(GUIMenuOption Sender)
{
    local int i, Index;

    // End:0x0D
    if(Sender == none)
    {
        return;
    }
    i = Sender.Tag;
    // End:0x2E
    if(i < 0)
    {
        return;
    }
    // End:0xBE
    if(InfoRules[i].DisplayName != Sender.Caption)
    {
        // End:0xBC
        if(Controller.bModAuthor)
        {
            Log("Corrupt list index detected in component" @ string(Sender.Name), 'ModAuthor');
            DumpListElements(FindComponentIndex(Sender), i);
        }
        return;
    }
    Index = GamePI.FindIndex(InfoRules[i].SettingName);
    // End:0x16F
    if((InfoRules[i].DisplayName != Sender.Caption) || Index == -1)
    {
        // End:0x16D
        if(Controller.bModAuthor)
        {
            Log("Invalid setting requested from PlayInfo!", 'ModAuthor');
            DumpListElements(FindComponentIndex(Sender), i);
        }
        return;
    }
    StoreSetting(Index, Sender.GetComponentValue());
    //return;    
}

protected function StoreSetting(int Index, string NewValue)
{
    GamePI.StoreSetting(Index, NewValue);
    //return;    
}

function ArrayPropClicked(GUIComponent Sender)
{
    local int i, Index;
    local export editinline GUIArrayPropPage ArrayPage;
    local string ArrayMenu;

    i = Sender.Tag;
    // End:0x21
    if(i < 0)
    {
        return;
    }
    Index = GamePI.FindIndex(InfoRules[i].SettingName);
    // End:0x79
    if(GamePI.Settings[Index].ArrayDim > 1)
    {
        ArrayMenu = Controller.ArrayPropertyMenu;        
    }
    else
    {
        ArrayMenu = Controller.DynArrayPropertyMenu;
    }
    // End:0x13A
    if(Controller.OpenMenu(ArrayMenu, GamePI.Settings[Index].DisplayName, GamePI.Settings[Index].Value))
    {
        ArrayPage = GUIArrayPropPage(Controller.ActivePage);
        ArrayPage.Item = GamePI.Settings[Index];
        ArrayPage.__OnClose__Delegate = CustomPageClosed;
        ArrayPage.SetOwner(Sender);
    }
    //return;    
}

function CustomClicked(GUIComponent Sender)
{
    local int i, Index;
    local export editinline GUICustomPropertyPage Page;
    local string CustomMenu;
    local array<string> Parts;

    i = Sender.Tag;
    // End:0x21
    if(i < 0)
    {
        return;
    }
    Index = GamePI.FindIndex(InfoRules[i].SettingName);
    Split(GamePI.Settings[Index].Data, ";", Parts);
    // End:0xFC
    if(Parts.Length > 2)
    {
        CustomMenu = Parts[2];
        // End:0xFC
        if(Controller.OpenMenu(CustomMenu))
        {
            Page = GUICustomPropertyPage(Controller.ActivePage);
            Page.Item = GamePI.Settings[Index];
            Page.__OnClose__Delegate = CustomPageClosed;
            Page.SetOwner(Sender);
        }
    }
    //return;    
}

function CustomPageClosed(optional bool bCancelled)
{
    local export editinline GUICustomPropertyPage Page;
    local export editinline GUIComponent CompOwner;

    Page = GUICustomPropertyPage(Controller.ActivePage);
    // End:0x92
    if((Page != none) && !bCancelled)
    {
        CompOwner = Page.GetOwner();
        // End:0x92
        if((CompOwner != none) && moButton(CompOwner) != none)
        {
            moButton(CompOwner).SetComponentValue(Page.GetDataString(), true);
            InternalOnChange(CompOwner);
        }
    }
    //return;    
}

function int FindComponentWithTag(int FindTag)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x57 [Loop If]
    if(i < li_Rules.Elements.Length)
    {
        // End:0x4D
        if(li_Rules.Elements[i].Tag == FindTag)
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return -1;
    //return;    
}

function int FindGroupIndex(string Group)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x4E [Loop If]
    if(i < GamePI.Groups.Length)
    {
        // End:0x44
        if(GamePI.Groups[i] ~= Group)
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return -1;
    //return;    
}

function free()
{
    GamePI = none;
    super(GUITabPanel).free();
    //return;    
}

defaultproperties
{
    NumColumns=1
    // Reference: GUIMultiOptionListBox'GUI2K4_Decompressed.UT2K4PlayInfoPanel.RuleListBox'
    begin object name="RuleListBox" class=XInterface.GUIMultiOptionListBox
        bVisibleWhenEmpty=true
        OnCreateComponent=UT2K4PlayInfoPanel.ListBoxCreateComponent
        WinHeight=0.9300090
        TabOrder=0
        bBoundToParent=true
        bScaleToParent=true
        OnChange=UT2K4PlayInfoPanel.InternalOnChange
    end object
    lb_Rules=RuleListBox
    bRefresh=true
    EditText="??"
    FadeInTime=0.2500000
    OnActivate=UT2K4PlayInfoPanel.InternalOnActivate
}