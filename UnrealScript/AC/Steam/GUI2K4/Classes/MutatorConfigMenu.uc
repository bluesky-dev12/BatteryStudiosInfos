/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\MutatorConfigMenu.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:10
 *	Functions:14
 *
 *******************************************************************************/
class MutatorConfigMenu extends LockedFloatingWindow
    editinlinenew
    instanced;

var PlayInfo MutInfo;
var array<string> ActiveMuts;
var localized string CustomConfigText;
var localized string ConfigButtonText;
var localized string EditButtonText;
var localized string NoPropsMessage;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIMultiOptionListBox lb_Config;
var export editinline GUIMultiOptionList li_Config;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_Advanced;
var bool bIsMultiplayer;

function InitComponent(GUIController MyController, GUIComponent MyComponent)
{
    super.InitComponent(MyController, MyComponent);
    sb_Main.LeftPadding = 0.010;
    sb_Main.RightPadding = 0.010;
    sb_Main.ManageComponent(lb_Config);
    MutInfo = new (none) class'PlayInfo';
    li_Config = lb_Config.List;
    li_Config.__OnCreateComponent__Delegate = ListOnCreateComponent;
    li_Config.bHotTrack = true;
    ch_Advanced.Checked(MyController.bExpertMode);
}

function Initialized()
{
    // End:0x0b
    if(bInit)
    {
        return;
    }
    // End:0x3f
    if(li_Config.Elements.Length == 0)
    {
        sb_Main.Caption = NoPropsMessage;
        RemoveComponent(lb_Config);
    }
}

function Initialize()
{
    local array< class<Mutator> > MutClasses;
    local int i, j;
    local bool bTemp, bFoundMutatorSettings;
    local export editinline GUIMenuOption NewComp;

    li_Config.Clear();
    bTemp = Controller.bCurMenuInitialized;
    Controller.bCurMenuInitialized = false;
    MutClasses = class'wUtil'.static.GetMutatorClasses(ActiveMuts);
    MutInfo.Init(MutClasses);
    i = 0;
    J0x6b:
    // End:0x407 [While If]
    if(i < MutClasses.Length)
    {
        // End:0x17c
        if(MutClasses[i].default.ConfigMenuClassName != "")
        {
            AddMutatorHeader(MutClasses[i].default.FriendlyName, i == 0);
            NewComp = li_Config.AddItem("XInterface.moButton",, CustomConfigText);
            // End:0xf6
            if(NewComp == none)
            {
            }
            // End:0x407
            else
            {
                NewComp.bAutoSizeCaption = true;
                NewComp.ComponentWidth = 0.250;
                NewComp.__OnChange__Delegate = OpenCustomConfigMenu;
                moButton(NewComp).MyButton.Caption = ConfigButtonText;
                moButton(NewComp).Value = MutClasses[i].default.ConfigMenuClassName;
                // This is an implied JumpToken;
                goto J0x3fd;
            }
            // End:0x195
            if(!MutatorHasProps(MutClasses[i]))
            {
            }
            // End:0x3fd
            else
            {
                AddMutatorHeader(MutClasses[i].default.FriendlyName, i == 0);
                bFoundMutatorSettings = false;
                j = 0;
                J0x1c6:
                // End:0x3a2 [While If]
                if(j < MutInfo.Settings.Length)
                {
                    // End:0x390
                    if(MutInfo.Settings[j].ClassFrom == MutClasses[i] || bFoundMutatorSettings && class<Mutator>(MutInfo.Settings[j].ClassFrom) == none)
                    {
                        bFoundMutatorSettings = true;
                        // End:0x38d
                        if(Controller.bExpertMode || !MutInfo.Settings[j].bAdvanced && bIsMultiplayer || !MutInfo.Settings[j].bMPOnly)
                        {
                            NewComp = AddRule(MutInfo.Settings[j]);
                            // End:0x33d
                            if(NewComp != none)
                            {
                                NewComp.Tag = j;
                                NewComp.LabelJustification = 0;
                                NewComp.ComponentJustification = 2;
                                NewComp.bAutoSizeCaption = true;
                                NewComp.SetComponentValue(MutInfo.Settings[j].Value);
                            }
                            // End:0x38d
                            else
                            {
                                Warn("Error adding new component to multi-options list:" $ MutInfo.Settings[j].SettingName);
                            }
                        }
                    }
                    // End:0x398
                    else
                    {
                        bFoundMutatorSettings = false;
                    }
                    ++ j;
                    // This is an implied JumpToken; Continue!
                    goto J0x1c6;
                }
                // End:0x3fd
                if(GUIListSpacer(li_Config.Elements[li_Config.Elements.Length - 1]) != none)
                {
                    li_Config.AddItem("XInterface.GUIListSpacer",, NoPropsMessage);
                }
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x6b;
        }
    }
    bInit = false;
    Initialized();
    Controller.bCurMenuInitialized = bTemp;
}

function AddMutatorHeader(string MutatorName, bool InitialRow)
{
    local int ModResult, i;

    ModResult = int(float(li_Config.Elements.Length) % float(lb_Config.NumColumns));
    J0x2b:
    // End:0x64 [While If]
    if(-- ModResult > 0)
    {
        li_Config.AddItem("XInterface.GUIListSpacer");
        // This is an implied JumpToken; Continue!
        goto J0x2b;
    }
    // End:0xc1
    if(!InitialRow)
    {
        i = 0;
        J0x76:
        // End:0xc1 [While If]
        if(i < lb_Config.NumColumns)
        {
            li_Config.AddItem("XInterface.GUIListSpacer");
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x76;
        }
    }
    i = 0;
    li_Config.AddItem("XInterface.GUIListHeader",, MutatorName);
    J0xf7:
    // End:0x13d [While If]
    if(++ i < lb_Config.NumColumns)
    {
        li_Config.AddItem("XInterface.GUIListHeader");
        // This is an implied JumpToken; Continue!
        goto J0xf7;
    }
}

function GUIMenuOption AddRule(PlayInfoData NewRule)
{
    local bool bTemp;
    local string width, Op;
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
            // End:0x7d
            if(NewComp == none)
            {
            }
            // End:0x4cc
            else
            {
                NewComp.bAutoSizeCaption = true;
                // This is an implied JumpToken;
                goto J0x4cc;
        // End:0x16c
        case 1:
        NewComp = li_Config.AddItem("XInterface.moComboBox",, NewRule.DisplayName);
        // End:0xdb
        if(NewComp == none)
        {
        }
        // End:0x4cc
        else
        {
            moComboBox(NewComp).ReadOnly(true);
            NewComp.bAutoSizeCaption = true;
            Split(NewRule.Data, ";", Range);
            i = 0;
            J0x11c:
            // End:0x169 [While If]
            if(i + 1 < Range.Length)
            {
                moComboBox(NewComp).AddItem(Range[i + 1],, Range[i]);
                i += 2;
                // This is an implied JumpToken; Continue!
                goto J0x11c;
            }
            // This is an implied JumpToken;
            goto J0x4cc;
        // End:0x4c9
        case 2:
            // End:0x19f
            if(!Divide(NewRule.Data, ";", width, Op))
            {
                width = NewRule.Data;
            }
            pos = InStr(width, ",");
            // End:0x1d0
            if(pos != -1)
            {
                width = Left(width, pos);
            }
            // End:0x1ec
            if(width != "")
            {
                i = int(width);
            }
            // End:0x1f7
            else
            {
                i = -1;
            }
            Split(Op, ":", Range);
            // End:0x3ad
            if(Range.Length > 1)
            {
                // End:0x2e7
                if(InStr(Range[0], ".") != -1)
                {
                    NewComp = li_Config.AddItem("XInterface.moFloatEdit",, NewRule.DisplayName);
                    // End:0x26e
                    if(NewComp == none)
                    {
                    }
                    // End:0x4cc
                    else
                    {
                        NewComp.bAutoSizeCaption = true;
                        NewComp.ComponentWidth = 0.250;
                        // End:0x2e4
                        if(i != -1)
                        {
                            moFloatEdit(NewComp).Setup(float(Range[0]), float(Range[1]), moFloatEdit(NewComp).MyNumericEdit.Step);
                        }
                        // This is an implied JumpToken;
                        goto J0x3aa;
                    }
                    NewComp = li_Config.AddItem("XInterface.moNumericEdit",, NewRule.DisplayName);
                    // End:0x32f
                    if(NewComp == none)
                    {
                    }
                    // End:0x4cc
                    else
                    {
                        moNumericEdit(NewComp).bAutoSizeCaption = true;
                        NewComp.ComponentWidth = 0.250;
                        // End:0x3aa
                        if(i != -1)
                        {
                            moNumericEdit(NewComp).Setup(int(Range[0]), int(Range[1]), moNumericEdit(NewComp).MyNumericEdit.Step);
                        }
                        J0x3aa:
                        // This is an implied JumpToken;
                        goto J0x4c6;
                    }
                    // End:0x440
                    if(NewRule.ArrayDim != -1)
                    {
                        NewComp = li_Config.AddItem("XInterface.moButton",, NewRule.DisplayName);
                        // End:0x404
                        if(NewComp == none)
                        {
                        }
                        // End:0x4cc
                        else
                        {
                            NewComp.bAutoSizeCaption = true;
                            NewComp.ComponentWidth = 0.250;
                            NewComp.__OnChange__Delegate = ArrayPropClicked;
                            // This is an implied JumpToken;
                            goto J0x4c6;
                        }
                        NewComp = li_Config.AddItem("XInterface.moEditBox",, NewRule.DisplayName);
                        // End:0x484
                        if(NewComp == none)
                        {
                        }
                        // End:0x4cc
                        else
                        {
                            NewComp.bAutoSizeCaption = true;
                            // End:0x4c6
                            if(i != -1)
                            {
                                moEditBox(NewComp).MyEditBox.MaxWidth = i;
                            }
                            J0x4c6:
                            // This is an implied JumpToken;
                            goto J0x4cc;
                    // End:0xffff
                    default:
                    }
                }
            }
        }
    }
}
NewComp.SetHint(NewRule.Description);
Controller.bCurMenuInitialized = bTemp;
return NewComp;
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
    // End:0x6b
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
    // End:0x139
    else
    {
        // End:0xca
        if(GUIMultiOptionList(Sender) != none)
        {
            Mo = GUIMultiOptionList(Sender).Get();
            i = Mo.Tag;
            // End:0xc7
            if(i >= 0 && i < MutInfo.Settings.Length)
            {
                MutInfo.StoreSetting(i, Mo.GetComponentValue());
            }
        }
        // End:0x139
        else
        {
            // End:0x139
            if(GUIMenuOption(Sender) != none)
            {
                i = Sender.Tag;
                // End:0x139
                if(i >= 0 && i < MutInfo.Settings.Length)
                {
                    MutInfo.StoreSetting(i, GUIMenuOption(Sender).GetComponentValue());
                }
            }
        }
    }
}

function OpenCustomConfigMenu(GUIComponent Sender)
{
    // End:0x32
    if(moButton(Sender) != none)
    {
        Controller.OpenMenu(moButton(Sender).Value);
    }
}

function ListOnCreateComponent(GUIMenuOption NewComp, GUIMultiOptionList Sender)
{
    // End:0x4b
    if(moButton(NewComp) != none)
    {
        moButton(NewComp).ButtonStyleName = "SquareButton";
        moButton(NewComp).ButtonCaption = EditButtonText;
    }
    NewComp.LabelJustification = 0;
    NewComp.ComponentJustification = 2;
}

function InternalOnCreateComponent(GUIComponent NewComp, GUIComponent Sender)
{
    // End:0x67
    if(GUIMultiOptionList(NewComp) != none)
    {
        GUIMultiOptionList(NewComp).bDrawSelectionBorder = false;
        GUIMultiOptionList(NewComp).ItemPadding = 0.150;
        // End:0x67
        if(Sender == lb_Config)
        {
            lb_Config.InternalOnCreateComponent(NewComp, Sender);
        }
    }
    super.InternalOnCreateComponent(NewComp, Sender);
}

function bool MutatorHasProps(class<Mutator> MutatorClass)
{
    local int i;

    // End:0x0d
    if(MutInfo == none)
    {
        return false;
    }
    i = 0;
    J0x14:
    // End:0x5c [While If]
    if(i < MutInfo.Settings.Length)
    {
        // End:0x52
        if(MutInfo.Settings[i].ClassFrom == MutatorClass)
        {
            return true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
    return false;
}

function AlignButtons()
{
    super.AlignButtons();
    ch_Advanced.WinTop = b_OK.WinTop + 0.0065110;
}

event Closed(GUIComponent Sender, bool bCancelled)
{
    super(GUIPage).Closed(Sender, bCancelled);
    // End:0x28
    if(!bCancelled)
    {
        MutInfo.SaveSettings();
    }
}

defaultproperties
{
    ConfigButtonText="??"
    EditButtonText="??"
    NoPropsMessage="????? ??? ????."
    begin object name=ConfigList class=GUIMultiOptionListBox
        bVisibleWhenEmpty=true
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.1433330
        WinLeft=0.03750
        WinWidth=0.9187530
        WinHeight=0.6975020
        RenderWeight=0.90
        TabOrder=1
        bBoundToParent=true
        bScaleToParent=true
        OnChange=InternalOnChange
    object end
    // Reference: GUIMultiOptionListBox'MutatorConfigMenu.ConfigList'
    lb_Config=ConfigList
    begin object name=AdvancedButton class=moCheckBox
        Caption="View Advanced Options"
        OnCreateComponent=InternalOnCreateComponent
        Hint="Toggles whether advanced properties are displayed"
        WinTop=0.9119820
        WinLeft=0.03750
        WinWidth=0.310
        WinHeight=0.040
        RenderWeight=1.0
        TabOrder=1
        bBoundToParent=true
        OnChange=InternalOnChange
    object end
    // Reference: moCheckBox'MutatorConfigMenu.AdvancedButton'
    ch_Advanced=AdvancedButton
    SubCaption="???? ??"
    WindowName="??? ?? ???"
}