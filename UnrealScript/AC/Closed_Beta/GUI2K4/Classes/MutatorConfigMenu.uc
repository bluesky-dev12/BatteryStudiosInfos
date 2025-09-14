class MutatorConfigMenu extends LockedFloatingWindow
    editinlinenew
    instanced;

var PlayInfo MutInfo;
var array<string> ActiveMuts;
var localized string CustomConfigText;
var localized string ConfigButtonText;
var localized string EditButtonText;
var localized string NoPropsMessage;
var() automated GUIMultiOptionListBox lb_Config;
var export editinline GUIMultiOptionList li_Config;
var() automated moCheckBox ch_Advanced;
var bool bIsMultiplayer;

function InitComponent(GUIController MyController, GUIComponent MyComponent)
{
    super.InitComponent(MyController, MyComponent);
    sb_Main.LeftPadding = 0.0100000;
    sb_Main.RightPadding = 0.0100000;
    sb_Main.ManageComponent(lb_Config);
    MutInfo = new (none) Class'Engine.PlayInfo';
    li_Config = lb_Config.List;
    li_Config.__OnCreateComponent__Delegate = ListOnCreateComponent;
    li_Config.bHotTrack = true;
    ch_Advanced.Checked(MyController.bExpertMode);
    //return;    
}

function Initialized()
{
    // End:0x0B
    if(bInit)
    {
        return;
    }
    // End:0x3F
    if(li_Config.Elements.Length == 0)
    {
        sb_Main.Caption = NoPropsMessage;
        RemoveComponent(lb_Config);
    }
    //return;    
}

function Initialize()
{
    local array< Class<Mutator> > MutClasses;
    local int i, j;
    local bool bTemp, bFoundMutatorSettings;
    local export editinline GUIMenuOption NewComp;

    li_Config.Clear();
    bTemp = Controller.bCurMenuInitialized;
    Controller.bCurMenuInitialized = false;
    MutClasses = Class'WGame.wUtil'.static.GetMutatorClasses(ActiveMuts);
    MutInfo.Init(MutClasses);
    i = 0;
    J0x6B:

    // End:0x407 [Loop If]
    if(i < MutClasses.Length)
    {
        // End:0x17C
        if(MutClasses[i].default.ConfigMenuClassName != "")
        {
            AddMutatorHeader(MutClasses[i].default.FriendlyName, i == 0);
            NewComp = li_Config.AddItem("XInterface.moButton",, CustomConfigText);
            // End:0xF6
            if(NewComp == none)
            {
                // [Explicit Break]
                goto J0x407;
            }
            NewComp.bAutoSizeCaption = true;
            NewComp.ComponentWidth = 0.2500000;
            NewComp.__OnChange__Delegate = OpenCustomConfigMenu;
            moButton(NewComp).MyButton.Caption = ConfigButtonText;
            moButton(NewComp).Value = MutClasses[i].default.ConfigMenuClassName;
            // [Explicit Continue]
            goto J0x3FD;
        }
        // End:0x195
        if(!MutatorHasProps(MutClasses[i]))
        {
            // [Explicit Continue]
            goto J0x3FD;
        }
        AddMutatorHeader(MutClasses[i].default.FriendlyName, i == 0);
        bFoundMutatorSettings = false;
        j = 0;
        J0x1C6:

        // End:0x3A2 [Loop If]
        if(j < MutInfo.Settings.Length)
        {
            // End:0x390
            if((MutInfo.Settings[j].ClassFrom == MutClasses[i]) || bFoundMutatorSettings && Class<Mutator>(MutInfo.Settings[j].ClassFrom) == none)
            {
                bFoundMutatorSettings = true;
                // End:0x38D
                if((Controller.bExpertMode || !MutInfo.Settings[j].bAdvanced) && bIsMultiplayer || !MutInfo.Settings[j].bMPOnly)
                {
                    NewComp = AddRule(MutInfo.Settings[j]);
                    // End:0x33D
                    if(NewComp != none)
                    {
                        NewComp.Tag = j;
                        NewComp.LabelJustification = 0;
                        NewComp.ComponentJustification = 2;
                        NewComp.bAutoSizeCaption = true;
                        NewComp.SetComponentValue(MutInfo.Settings[j].Value);                        
                    }
                    else
                    {
                        Warn("Error adding new component to multi-options list:" $ MutInfo.Settings[j].SettingName);
                    }
                }
                // [Explicit Continue]
                goto J0x398;
            }
            bFoundMutatorSettings = false;
            J0x398:

            j++;
            // [Loop Continue]
            goto J0x1C6;
        }
        // End:0x3FD
        if(GUIListSpacer(li_Config.Elements[li_Config.Elements.Length - 1]) != none)
        {
            li_Config.AddItem("XInterface.GUIListSpacer",, NoPropsMessage);
        }
        J0x3FD:

        i++;
        // [Loop Continue]
        goto J0x6B;
    }
    J0x407:

    bInit = false;
    Initialized();
    Controller.bCurMenuInitialized = bTemp;
    //return;    
}

function AddMutatorHeader(string MutatorName, bool InitialRow)
{
    local int ModResult, i;

    ModResult = int(float(li_Config.Elements.Length) % float(lb_Config.NumColumns));
    J0x2B:

    // End:0x64 [Loop If]
    if(ModResult-- > 0)
    {
        li_Config.AddItem("XInterface.GUIListSpacer");
        // [Loop Continue]
        goto J0x2B;
    }
    // End:0xC1
    if(!InitialRow)
    {
        i = 0;
        J0x76:

        // End:0xC1 [Loop If]
        if(i < lb_Config.NumColumns)
        {
            li_Config.AddItem("XInterface.GUIListSpacer");
            i++;
            // [Loop Continue]
            goto J0x76;
        }
    }
    i = 0;
    li_Config.AddItem("XInterface.GUIListHeader",, MutatorName);
    J0xF7:

    // End:0x13D [Loop If]
    if(++i < lb_Config.NumColumns)
    {
        li_Config.AddItem("XInterface.GUIListHeader");
        // [Loop Continue]
        goto J0xF7;
    }
    //return;    
}

function GUIMenuOption AddRule(PlayInfoData NewRule)
{
    local bool bTemp;
    local string Width, Op;
    local array<string> Range;
    local export editinline GUIMenuOption NewComp;
    local int i, pos;

    bTemp = Controller.bCurMenuInitialized;
    Controller.bCurMenuInitialized = false;
    switch(NewRule.RenderType)
    {
        // End:0x91
        case 0:
            NewComp = li_Config.AddItem("XInterface.moCheckbox",, NewRule.DisplayName);
            // End:0x7D
            if(NewComp == none)
            {
                // [Explicit Continue]
                goto J0x4CC;
            }
            NewComp.bAutoSizeCaption = true;
            // End:0x4CC
            break;
        // End:0x16C
        case 1:
            NewComp = li_Config.AddItem("XInterface.moComboBox",, NewRule.DisplayName);
            // End:0xDB
            if(NewComp == none)
            {
                // [Explicit Continue]
                goto J0x4CC;
            }
            moComboBox(NewComp).ReadOnly(true);
            NewComp.bAutoSizeCaption = true;
            Split(NewRule.Data, ";", Range);
            i = 0;
            J0x11C:

            // End:0x169 [Loop If]
            if((i + 1) < Range.Length)
            {
                moComboBox(NewComp).AddItem(Range[i + 1],, Range[i]);
                i += 2;
                // [Loop Continue]
                goto J0x11C;
            }
            // End:0x4CC
            break;
        // End:0x4C9
        case 2:
            // End:0x19F
            if(!Divide(NewRule.Data, ";", Width, Op))
            {
                Width = NewRule.Data;
            }
            pos = InStr(Width, ",");
            // End:0x1D0
            if(pos != -1)
            {
                Width = Left(Width, pos);
            }
            // End:0x1EC
            if(Width != "")
            {
                i = int(Width);                
            }
            else
            {
                i = -1;
            }
            Split(Op, ":", Range);
            // End:0x3AD
            if(Range.Length > 1)
            {
                // End:0x2E7
                if(InStr(Range[0], ".") != -1)
                {
                    NewComp = li_Config.AddItem("XInterface.moFloatEdit",, NewRule.DisplayName);
                    // End:0x26E
                    if(NewComp == none)
                    {
                        // [Explicit Continue]
                        goto J0x4CC;
                    }
                    NewComp.bAutoSizeCaption = true;
                    NewComp.ComponentWidth = 0.2500000;
                    // End:0x2E4
                    if(i != -1)
                    {
                        moFloatEdit(NewComp).Setup(float(Range[0]), float(Range[1]), moFloatEdit(NewComp).MyNumericEdit.Step);
                    }                    
                }
                else
                {
                    NewComp = li_Config.AddItem("XInterface.moNumericEdit",, NewRule.DisplayName);
                    // End:0x32F
                    if(NewComp == none)
                    {
                        // [Explicit Continue]
                        goto J0x4CC;
                    }
                    moNumericEdit(NewComp).bAutoSizeCaption = true;
                    NewComp.ComponentWidth = 0.2500000;
                    // End:0x3AA
                    if(i != -1)
                    {
                        moNumericEdit(NewComp).Setup(int(Range[0]), int(Range[1]), moNumericEdit(NewComp).MyNumericEdit.Step);
                    }
                }                
            }
            else
            {
                // End:0x440
                if(NewRule.ArrayDim != -1)
                {
                    NewComp = li_Config.AddItem("XInterface.moButton",, NewRule.DisplayName);
                    // End:0x404
                    if(NewComp == none)
                    {
                        // [Explicit Continue]
                        goto J0x4CC;
                    }
                    NewComp.bAutoSizeCaption = true;
                    NewComp.ComponentWidth = 0.2500000;
                    NewComp.__OnChange__Delegate = ArrayPropClicked;                    
                }
                else
                {
                    NewComp = li_Config.AddItem("XInterface.moEditBox",, NewRule.DisplayName);
                    // End:0x484
                    if(NewComp == none)
                    {
                        // [Explicit Continue]
                        goto J0x4CC;
                    }
                    NewComp.bAutoSizeCaption = true;
                    // End:0x4C6
                    if(i != -1)
                    {
                        moEditBox(NewComp).MyEditBox.MaxWidth = i;
                    }
                }
            }
            // End:0x4CC
            break;
        // End:0xFFFF
        default:
            break;
    }
    J0x4CC:

    NewComp.SetHint(NewRule.Description);
    Controller.bCurMenuInitialized = bTemp;
    return NewComp;
    //return;    
}

function ArrayPropClicked(GUIComponent Sender)
{
    local int i;
    local export editinline GUIArrayPropPage ArrayPage;
    local string ArrayMenu;

    i = Sender.Tag;
    // End:0x21
    if(i < 0)
    {
        return;
    }
    // End:0x57
    if(MutInfo.Settings[i].ArrayDim > 1)
    {
        ArrayMenu = Controller.ArrayPropertyMenu;        
    }
    else
    {
        ArrayMenu = Controller.DynArrayPropertyMenu;
    }
    // End:0x118
    if(Controller.OpenMenu(ArrayMenu, MutInfo.Settings[i].DisplayName, MutInfo.Settings[i].Value))
    {
        ArrayPage = GUIArrayPropPage(Controller.ActivePage);
        ArrayPage.Item = MutInfo.Settings[i];
        ArrayPage.__OnClose__Delegate = ArrayPageClosed;
        ArrayPage.SetOwner(Sender);
    }
    //return;    
}

function ArrayPageClosed(optional bool bCancelled)
{
    local export editinline GUIArrayPropPage ArrayPage;
    local export editinline GUIComponent CompOwner;

    // End:0x83
    if(!bCancelled)
    {
        ArrayPage = GUIArrayPropPage(Controller.ActivePage);
        // End:0x83
        if(ArrayPage != none)
        {
            CompOwner = ArrayPage.GetOwner();
            // End:0x83
            if(moButton(CompOwner) != none)
            {
                moButton(CompOwner).SetComponentValue(ArrayPage.GetDataString(), true);
                InternalOnChange(CompOwner);
            }
        }
    }
    //return;    
}

function InternalOnChange(GUIComponent Sender)
{
    local int i;
    local export editinline GUIMenuOption Mo;

    // End:0x43
    if(Sender == ch_Advanced)
    {
        Controller.bExpertMode = ch_Advanced.IsChecked();
        Controller.SaveConfig();
        Initialize();        
    }
    else
    {
        // End:0xCA
        if(GUIMultiOptionList(Sender) != none)
        {
            Mo = GUIMultiOptionList(Sender).Get();
            i = Mo.Tag;
            // End:0xC7
            if((i >= 0) && i < MutInfo.Settings.Length)
            {
                MutInfo.StoreSetting(i, Mo.GetComponentValue());
            }            
        }
        else
        {
            // End:0x139
            if(GUIMenuOption(Sender) != none)
            {
                i = Sender.Tag;
                // End:0x139
                if((i >= 0) && i < MutInfo.Settings.Length)
                {
                    MutInfo.StoreSetting(i, GUIMenuOption(Sender).GetComponentValue());
                }
            }
        }
    }
    //return;    
}

function OpenCustomConfigMenu(GUIComponent Sender)
{
    // End:0x32
    if(moButton(Sender) != none)
    {
        Controller.OpenMenu(moButton(Sender).Value);
    }
    //return;    
}

function ListOnCreateComponent(GUIMenuOption NewComp, GUIMultiOptionList Sender)
{
    // End:0x4B
    if(moButton(NewComp) != none)
    {
        moButton(NewComp).ButtonStyleName = "SquareButton";
        moButton(NewComp).ButtonCaption = EditButtonText;
    }
    NewComp.LabelJustification = 0;
    NewComp.ComponentJustification = 2;
    //return;    
}

function InternalOnCreateComponent(GUIComponent NewComp, GUIComponent Sender)
{
    // End:0x67
    if(GUIMultiOptionList(NewComp) != none)
    {
        GUIMultiOptionList(NewComp).bDrawSelectionBorder = false;
        GUIMultiOptionList(NewComp).ItemPadding = 0.1500000;
        // End:0x67
        if(Sender == lb_Config)
        {
            lb_Config.InternalOnCreateComponent(NewComp, Sender);
        }
    }
    super.InternalOnCreateComponent(NewComp, Sender);
    //return;    
}

function bool MutatorHasProps(Class<Mutator> MutatorClass)
{
    local int i;

    // End:0x0D
    if(MutInfo == none)
    {
        return false;
    }
    i = 0;
    J0x14:

    // End:0x5C [Loop If]
    if(i < MutInfo.Settings.Length)
    {
        // End:0x52
        if(MutInfo.Settings[i].ClassFrom == MutatorClass)
        {
            return true;
        }
        i++;
        // [Loop Continue]
        goto J0x14;
    }
    return false;
    //return;    
}

function AlignButtons()
{
    super.AlignButtons();
    ch_Advanced.WinTop = b_OK.WinTop + 0.0065110;
    //return;    
}

event Closed(GUIComponent Sender, bool bCancelled)
{
    super(GUIPage).Closed(Sender, bCancelled);
    // End:0x28
    if(!bCancelled)
    {
        MutInfo.SaveSettings();
    }
    //return;    
}

defaultproperties
{
    ConfigButtonText="??"
    EditButtonText="??"
    NoPropsMessage="????? ??? ????."
    // Reference: GUIMultiOptionListBox'GUI2K4_Decompressed.MutatorConfigMenu.ConfigList'
    begin object name="ConfigList" class=XInterface.GUIMultiOptionListBox
        bVisibleWhenEmpty=true
        OnCreateComponent=MutatorConfigMenu.InternalOnCreateComponent
        WinTop=0.1433330
        WinLeft=0.0375000
        WinWidth=0.9187530
        WinHeight=0.6975020
        RenderWeight=0.9000000
        TabOrder=1
        bBoundToParent=true
        bScaleToParent=true
        OnChange=MutatorConfigMenu.InternalOnChange
    end object
    lb_Config=ConfigList
    // Reference: moCheckBox'GUI2K4_Decompressed.MutatorConfigMenu.AdvancedButton'
    begin object name="AdvancedButton" class=XInterface.moCheckBox
        Caption="View Advanced Options"
        OnCreateComponent=AdvancedButton.InternalOnCreateComponent
        Hint="Toggles whether advanced properties are displayed"
        WinTop=0.9119820
        WinLeft=0.0375000
        WinWidth=0.3100000
        WinHeight=0.0400000
        RenderWeight=1.0000000
        TabOrder=1
        bBoundToParent=true
        OnChange=MutatorConfigMenu.InternalOnChange
    end object
    ch_Advanced=AdvancedButton
    SubCaption="???? ??"
    WindowName="??? ?? ???"
}