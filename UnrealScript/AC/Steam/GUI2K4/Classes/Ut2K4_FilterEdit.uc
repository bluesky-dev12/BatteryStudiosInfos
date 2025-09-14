/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\Ut2K4_FilterEdit.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:22
 *	Functions:9
 *
 *******************************************************************************/
class Ut2K4_FilterEdit extends LargeWindow
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sb_Options;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sb_Mutators;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moEditBox eb_Name;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moComboBox cb_Stats;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moComboBox cb_WeaponStay;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moComboBox cb_Translocator;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moComboBox cb_Mutators;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ck_Full;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ck_Bots;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ck_Empty;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ck_Passworded;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_OK;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Cancel;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIMultiOptionListBox lb_Mutators;
var export editinline GUIMultiOptionList li_Mutators;
var int FilterIndex;
var BrowserFilters FM;
var export editinline UT2K4_FilterListPage FLP;
var localized string ComboOpts[3];
var localized string MutOpts[3];
var array<MutatorRecord> MutRecords;
var bool bInitialized;

function InitComponent(GUIController MyC, GUIComponent MyO)
{
    local int i;
    local export editinline moComboBox cb;

    super(FloatingWindow).InitComponent(MyC, MyO);
    FLP = UT2K4_FilterListPage(ParentPage);
    sb_Options.ManageComponent(ck_Full);
    sb_Options.ManageComponent(ck_Empty);
    sb_Options.ManageComponent(ck_Passworded);
    sb_Options.ManageComponent(ck_Bots);
    sb_Options.ManageComponent(cb_Stats);
    sb_Options.ManageComponent(cb_WeaponStay);
    sb_Options.ManageComponent(cb_Translocator);
    sb_Options.ManageComponent(cb_Mutators);
    i = 0;
    J0xc7:
    // End:0x12b [While If]
    if(i < 3)
    {
        cb_Stats.AddItem(ComboOpts[i]);
        cb_WeaponStay.AddItem(ComboOpts[i]);
        cb_Translocator.AddItem(ComboOpts[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xc7;
    }
    cb_Mutators.AddItem(MutOpts[0]);
    cb_Mutators.AddItem(MutOpts[1]);
    cb_Mutators.AddItem(MutOpts[2]);
    li_Mutators = lb_Mutators.List;
    sb_Mutators.ManageComponent(lb_Mutators);
    class'CacheManager'.static.GetMutatorList(MutRecords);
    i = 0;
    J0x1ae:
    // End:0x25d [While If]
    if(i < MutRecords.Length)
    {
        cb = moComboBox(li_Mutators.AddItem("XInterface.moCombobox",, MutRecords[i].FriendlyName));
        cb.AddItem(ComboOpts[0]);
        cb.AddItem(ComboOpts[1]);
        cb.AddItem(ComboOpts[2]);
        cb.ReadOnly(true);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1ae;
    }
    cb_Mutators.__OnChange__Delegate = MutChange;
    lb_Mutators.DisableMe();
}

event HandleParameters(string Param1, string Param2)
{
    local int i;
    local array<AFilterRule> Rules;
    local QueryData FilterItem;

    FilterIndex = int(Param1);
    eb_Name.SetComponentValue(Param2);
    // End:0x46
    if(Param2 ~= "Default")
    {
        eb_Name.DisableMe();
    }
    // End:0x55
    else
    {
        eb_Name.EnableMe();
    }
    Rules = FLP.FM.GetFilterRules(FilterIndex);
    i = 0;
    J0x7f:
    // End:0x403 [While If]
    if(i < Rules.Length)
    {
        FilterItem = Rules[i].FilterItem;
        // End:0xff
        if(FilterItem.key ~= "currentplayers" && FilterItem.Value == "0" && FilterItem.QueryType == 4)
        {
            ck_Empty.Checked(true);
        }
        // End:0x157
        if(FilterItem.key ~= "password" && FilterItem.Value == "false" && FilterItem.QueryType == 0)
        {
            ck_Passworded.Checked(true);
        }
        // End:0x1ac
        if(FilterItem.key ~= "freespace" && FilterItem.Value == "0" && FilterItem.QueryType == 4)
        {
            ck_Full.Checked(true);
        }
        // End:0x201
        if(FilterItem.key ~= "nobots" && FilterItem.Value == "true" && FilterItem.QueryType == 0)
        {
            ck_Bots.Checked(true);
        }
        // End:0x262
        if(FilterItem.key ~= "stats")
        {
            // End:0x248
            if(FilterItem.Value ~= "true")
            {
                cb_Stats.MyComboBox.SetIndex(1);
            }
            // End:0x262
            else
            {
                cb_Stats.MyComboBox.SetIndex(2);
            }
        }
        // End:0x2c8
        if(FilterItem.key ~= "weaponstay")
        {
            // End:0x2ae
            if(FilterItem.Value ~= "true")
            {
                cb_WeaponStay.MyComboBox.SetIndex(1);
            }
            // End:0x2c8
            else
            {
                cb_WeaponStay.MyComboBox.SetIndex(2);
            }
        }
        // End:0x32c
        if(FilterItem.key ~= "transloc")
        {
            // End:0x312
            if(FilterItem.Value ~= "true")
            {
                cb_Translocator.MyComboBox.SetIndex(1);
            }
            // End:0x32c
            else
            {
                cb_Translocator.MyComboBox.SetIndex(2);
            }
        }
        // End:0x377
        if(FilterItem.key ~= "nomutators" && FilterItem.Value == "true")
        {
            cb_Mutators.MyComboBox.SetIndex(0);
        }
        // End:0x3f9
        if(FilterItem.key ~= "mutator")
        {
            cb_Mutators.MyComboBox.SetIndex(2);
            // End:0x3d2
            if(FilterItem.QueryType == 0)
            {
                SetMutator(FilterItem.Value, 1);
            }
            // End:0x3f9
            else
            {
                // End:0x3f9
                if(FilterItem.QueryType == 1)
                {
                    SetMutator(FilterItem.Value, 2);
                }
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x7f;
    }
}

function SetMutator(string ClassName, int Index)
{
    local int i, j;
    local string S;
    local export editinline moComboBox Box;

    i = 0;
    J0x07:
    // End:0xec [While If]
    if(i < MutRecords.Length)
    {
        j = InStr(MutRecords[i].ClassName, ".");
        S = Mid(MutRecords[i].ClassName, j + 1);
        // End:0xe2
        if(S ~= ClassName)
        {
            j = 0;
            J0x68:
            // End:0xe2 [While If]
            if(j < li_Mutators.ItemCount)
            {
                Box = moComboBox(li_Mutators.GetItem(j));
                // End:0xd8
                if(Box.Caption ~= MutRecords[i].FriendlyName)
                {
                    Box.SetIndex(Index);
                    return;
                }
                ++ j;
                // This is an implied JumpToken; Continue!
                goto J0x68;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function MutChange(GUIComponent Sender)
{
    // End:0x46
    if(Sender == cb_Mutators)
    {
        // End:0x37
        if(cb_Mutators.GetIndex() < 2)
        {
            lb_Mutators.DisableMe();
        }
        // End:0x46
        else
        {
            lb_Mutators.EnableMe();
        }
    }
}

function bool CancelClick(GUIComponent Sender)
{
    Controller.CloseMenu(true);
    return true;
}

function AFilterRule BuildRule(string key, string Value, IpDrv.MasterServerClient.EQueryType QType)
{
    local AFilterRule NewRule;

    NewRule.FilterItem.key = key;
    NewRule.FilterItem.Value = Value;
    NewRule.FilterItem.QueryType = QType;
    // End:0x62
    if(key == "mutator")
    {
        NewRule.FilterType = 2;
    }
    // End:0x6f
    else
    {
        NewRule.FilterType = 0;
    }
    NewRule.ItemName = key;
    return NewRule;
}

function bool OkClick(GUIComponent Server)
{
    local array<AFilterRule> Rules;
    local int cnt, i;
    local export editinline moComboBox cb;

    cnt = 0;
    // End:0x42
    if(ck_Empty.IsChecked())
    {
        Rules[++ cnt] = BuildRule("currentplayers", "0", 4);
    }
    // End:0x78
    if(ck_Full.IsChecked())
    {
        Rules[++ cnt] = BuildRule("freespace", "0", 4);
    }
    // End:0xb1
    if(ck_Passworded.IsChecked())
    {
        Rules[++ cnt] = BuildRule("password", "false", 0);
    }
    // End:0xe7
    if(ck_Bots.IsChecked())
    {
        Rules[++ cnt] = BuildRule("nobots", "true", 0);
    }
    // End:0x122
    if(cb_Stats.GetIndex() == 1)
    {
        Rules[++ cnt] = BuildRule("stats", "true", 0);
    }
    // End:0x15c
    else
    {
        // End:0x15c
        if(cb_Stats.GetIndex() == 2)
        {
            Rules[++ cnt] = BuildRule("stats", "false", 0);
        }
    }
    // End:0x19c
    if(cb_WeaponStay.GetIndex() == 1)
    {
        Rules[++ cnt] = BuildRule("weaponstay", "true", 0);
    }
    // End:0x1db
    else
    {
        // End:0x1db
        if(cb_WeaponStay.GetIndex() == 2)
        {
            Rules[++ cnt] = BuildRule("weaponstay", "false", 0);
        }
    }
    // End:0x219
    if(cb_Translocator.GetIndex() == 1)
    {
        Rules[++ cnt] = BuildRule("transloc", "true", 0);
    }
    // End:0x256
    else
    {
        // End:0x256
        if(cb_Translocator.GetIndex() == 2)
        {
            Rules[++ cnt] = BuildRule("transloc", "false", 0);
        }
    }
    // End:0x296
    if(cb_Mutators.GetIndex() == 0)
    {
        Rules[++ cnt] = BuildRule("nomutators", "true", 0);
    }
    // End:0x388
    else
    {
        // End:0x388
        if(cb_Mutators.GetIndex() == 2)
        {
            i = 0;
            J0x2b3:
            // End:0x388 [While If]
            if(i < li_Mutators.ItemCount)
            {
                cb = moComboBox(li_Mutators.GetItem(i));
                // End:0x335
                if(cb.GetIndex() == 1)
                {
                    Rules[++ cnt] = BuildRule("mutator", FindMutClassFromFriendly(cb.Caption), 0);
                }
                // End:0x37e
                else
                {
                    // End:0x37e
                    if(cb.GetIndex() == 2)
                    {
                        Rules[++ cnt] = BuildRule("mutator", FindMutClassFromFriendly(cb.Caption), 1);
                    }
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x2b3;
            }
        }
    }
    FLP.FM.PostEdit(FilterIndex, eb_Name.GetComponentValue(), Rules);
    Controller.CloseMenu(true);
    FLP.InitFilterList();
    FLP.li_Filters.SetIndex(FLP.li_Filters.Find(eb_Name.GetComponentValue()));
    return true;
}

function string FindMutClassFromFriendly(string friendly)
{
    local int i, P;
    local string cls;

    i = 0;
    J0x07:
    // End:0x71 [While If]
    if(i < MutRecords.Length)
    {
        // End:0x67
        if(MutRecords[i].FriendlyName ~= friendly)
        {
            cls = MutRecords[i].ClassName;
            P = InStr(cls, ".");
            return Mid(cls, P + 1);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return "";
}

function bool ebPreDraw(Canvas Canvas)
{
    eb_Name.WinTop = sb_Options.ActualTop() + float(36);
    return true;
}

defaultproperties
{
    begin object name=sbOptions class=GUISectionBackground
        bFillClient=true
        Caption="Options..."
        LeftPadding=0.00250
        RightPadding=0.00250
        TopPadding=0.10
        BottomPadding=0.00250
        NumColumns=2
        WinTop=0.0574480
        WinLeft=0.0360940
        WinWidth=0.9277350
        WinHeight=0.3758230
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'Ut2K4_FilterEdit.sbOptions'
    sb_Options=sbOptions
    begin object name=sbMutators class=AltSectionBackground
        bFillClient=true
        Caption="Custom Mutator Config"
        LeftPadding=0.00250
        RightPadding=0.00250
        TopPadding=0.00250
        BottomPadding=0.00250
        WinTop=0.4366140
        WinLeft=0.0360940
        WinWidth=0.9292960
        WinHeight=0.4539480
        OnPreDraw=InternalPreDraw
    object end
    // Reference: AltSectionBackground'Ut2K4_FilterEdit.sbMutators'
    sb_Mutators=sbMutators
    begin object name=ebName class=moEditBox
        ComponentWidth=0.70
        Caption="Filter Name:"
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.1241140
        WinLeft=0.1845310
        WinWidth=0.6542970
        TabOrder=0
        OnPreDraw=ebPreDraw
    object end
    // Reference: moEditBox'Ut2K4_FilterEdit.ebName'
    eb_Name=ebName
    begin object name=cbStats class=moComboBox
        bReadOnly=true
        ComponentWidth=0.550
        Caption="Stats Servers:"
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.250
        WinLeft=0.250
        TabOrder=5
    object end
    // Reference: moComboBox'Ut2K4_FilterEdit.cbStats'
    cb_Stats=cbStats
    begin object name=cbWeaponStay class=moComboBox
        bReadOnly=true
        ComponentWidth=0.550
        Caption="Weapon Stay:"
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.250
        WinLeft=0.250
        TabOrder=6
    object end
    // Reference: moComboBox'Ut2K4_FilterEdit.cbWeaponStay'
    cb_WeaponStay=cbWeaponStay
    begin object name=cbTranslocator class=moComboBox
        bReadOnly=true
        ComponentWidth=0.550
        Caption="Translocator:"
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.250
        WinLeft=0.250
        TabOrder=7
    object end
    // Reference: moComboBox'Ut2K4_FilterEdit.cbTranslocator'
    cb_Translocator=cbTranslocator
    begin object name=cbMutators class=moComboBox
        bReadOnly=true
        ComponentWidth=0.550
        Caption="Mutators:"
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.250
        WinLeft=0.250
        TabOrder=8
    object end
    // Reference: moComboBox'Ut2K4_FilterEdit.cbMutators'
    cb_Mutators=cbMutators
    begin object name=ckFull class=moCheckBox
        ComponentWidth=0.10
        Caption="No Full Servers"
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.250
        WinLeft=0.250
        TabOrder=1
    object end
    // Reference: moCheckBox'Ut2K4_FilterEdit.ckFull'
    ck_Full=ckFull
    begin object name=ckBots class=moCheckBox
        ComponentWidth=0.10
        Caption="No Bots"
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.250
        WinLeft=0.250
        TabOrder=2
    object end
    // Reference: moCheckBox'Ut2K4_FilterEdit.ckBots'
    ck_Bots=ckBots
    begin object name=ckEmpty class=moCheckBox
        ComponentWidth=0.10
        Caption="No Empty Servers"
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.250
        WinLeft=0.250
        TabOrder=3
    object end
    // Reference: moCheckBox'Ut2K4_FilterEdit.ckEmpty'
    ck_Empty=ckEmpty
    begin object name=ckPassworded class=moCheckBox
        ComponentWidth=0.10
        Caption="No Passworded Servers"
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.250
        WinLeft=0.250
        TabOrder=4
    object end
    // Reference: moCheckBox'Ut2K4_FilterEdit.ckPassworded'
    ck_Passworded=ckPassworded
    begin object name=bOk class=GUIButton
        Caption="OK"
        WinTop=0.9036120
        WinLeft=0.6115640
        WinWidth=0.168750
        WinHeight=0.050
        OnClick=OkClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'Ut2K4_FilterEdit.bOk'
    b_OK=bOk
    begin object name=bCancel class=GUIButton
        Caption="Cancel"
        WinTop=0.9035070
        WinLeft=0.7928140
        WinWidth=0.168750
        WinHeight=0.050
        OnClick=CancelClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'Ut2K4_FilterEdit.bCancel'
    b_Cancel=bCancel
    begin object name=lbMutators class=GUIMultiOptionListBox
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.1032810
        WinLeft=0.2626560
        WinWidth=0.3433590
        WinHeight=0.7664480
        TabOrder=9
    object end
    // Reference: GUIMultiOptionListBox'Ut2K4_FilterEdit.lbMutators'
    lb_Mutators=lbMutators
    ComboOpts[0]="Does Not Matter"
    ComboOpts[1]="Must Be On"
    ComboOpts[2]="Must Be Off"
    MutOpts[0]="No Mutators"
    MutOpts[1]="Any Mutator"
    MutOpts[2]="Custom"
    WindowName="Edit Filter Rules..."
    WinTop=0.0
    WinLeft=0.0
    WinWidth=1.0
    WinHeight=1.0
}