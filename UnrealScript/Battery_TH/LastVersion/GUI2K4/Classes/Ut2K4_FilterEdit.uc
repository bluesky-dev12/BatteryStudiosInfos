class Ut2K4_FilterEdit extends LargeWindow
    editinlinenew
    instanced;

var() automated GUISectionBackground sb_Options;
var() automated GUISectionBackground sb_Mutators;
var() automated moEditBox eb_Name;
var() automated moComboBox cb_Stats;
var() automated moComboBox cb_WeaponStay;
var() automated moComboBox cb_Translocator;
var() automated moComboBox cb_Mutators;
var() automated moCheckBox ck_Full;
var() automated moCheckBox ck_Bots;
var() automated moCheckBox ck_Empty;
var() automated moCheckBox ck_Passworded;
var() automated GUIButton b_OK;
var() automated GUIButton b_Cancel;
var() automated GUIMultiOptionListBox lb_Mutators;
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
    J0xC7:

    // End:0x12B [Loop If]
    if(i < 3)
    {
        cb_Stats.AddItem(ComboOpts[i]);
        cb_WeaponStay.AddItem(ComboOpts[i]);
        cb_Translocator.AddItem(ComboOpts[i]);
        i++;
        // [Loop Continue]
        goto J0xC7;
    }
    cb_Mutators.AddItem(MutOpts[0]);
    cb_Mutators.AddItem(MutOpts[1]);
    cb_Mutators.AddItem(MutOpts[2]);
    li_Mutators = lb_Mutators.List;
    sb_Mutators.ManageComponent(lb_Mutators);
    Class'Engine.CacheManager'.static.GetMutatorList(MutRecords);
    i = 0;
    J0x1AE:

    // End:0x25D [Loop If]
    if(i < MutRecords.Length)
    {
        cb = moComboBox(li_Mutators.AddItem("XInterface.moCombobox",, MutRecords[i].FriendlyName));
        cb.AddItem(ComboOpts[0]);
        cb.AddItem(ComboOpts[1]);
        cb.AddItem(ComboOpts[2]);
        cb.ReadOnly(true);
        i++;
        // [Loop Continue]
        goto J0x1AE;
    }
    cb_Mutators.__OnChange__Delegate = MutChange;
    lb_Mutators.DisableMe();
    //return;    
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
    else
    {
        eb_Name.EnableMe();
    }
    Rules = FLP.FM.GetFilterRules(FilterIndex);
    i = 0;
    J0x7F:

    // End:0x403 [Loop If]
    if(i < Rules.Length)
    {
        FilterItem = Rules[i].FilterItem;
        // End:0xFF
        if(((FilterItem.key ~= "currentplayers") && FilterItem.Value == "0") && int(FilterItem.QueryType) == int(4))
        {
            ck_Empty.Checked(true);
        }
        // End:0x157
        if(((FilterItem.key ~= "password") && FilterItem.Value == "false") && int(FilterItem.QueryType) == int(0))
        {
            ck_Passworded.Checked(true);
        }
        // End:0x1AC
        if(((FilterItem.key ~= "freespace") && FilterItem.Value == "0") && int(FilterItem.QueryType) == int(4))
        {
            ck_Full.Checked(true);
        }
        // End:0x201
        if(((FilterItem.key ~= "nobots") && FilterItem.Value == "true") && int(FilterItem.QueryType) == int(0))
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
            else
            {
                cb_Stats.MyComboBox.SetIndex(2);
            }
        }
        // End:0x2C8
        if(FilterItem.key ~= "weaponstay")
        {
            // End:0x2AE
            if(FilterItem.Value ~= "true")
            {
                cb_WeaponStay.MyComboBox.SetIndex(1);                
            }
            else
            {
                cb_WeaponStay.MyComboBox.SetIndex(2);
            }
        }
        // End:0x32C
        if(FilterItem.key ~= "transloc")
        {
            // End:0x312
            if(FilterItem.Value ~= "true")
            {
                cb_Translocator.MyComboBox.SetIndex(1);                
            }
            else
            {
                cb_Translocator.MyComboBox.SetIndex(2);
            }
        }
        // End:0x377
        if((FilterItem.key ~= "nomutators") && FilterItem.Value == "true")
        {
            cb_Mutators.MyComboBox.SetIndex(0);
        }
        // End:0x3F9
        if(FilterItem.key ~= "mutator")
        {
            cb_Mutators.MyComboBox.SetIndex(2);
            // End:0x3D2
            if(int(FilterItem.QueryType) == int(0))
            {
                SetMutator(FilterItem.Value, 1);
                // [Explicit Continue]
                goto J0x3F9;
            }
            // End:0x3F9
            if(int(FilterItem.QueryType) == int(1))
            {
                SetMutator(FilterItem.Value, 2);
            }
        }
        J0x3F9:

        i++;
        // [Loop Continue]
        goto J0x7F;
    }
    //return;    
}

function SetMutator(string ClassName, int Index)
{
    local int i, j;
    local string S;
    local export editinline moComboBox Box;

    i = 0;
    J0x07:

    // End:0xEC [Loop If]
    if(i < MutRecords.Length)
    {
        j = InStr(MutRecords[i].ClassName, ".");
        S = Mid(MutRecords[i].ClassName, j + 1);
        // End:0xE2
        if(S ~= ClassName)
        {
            j = 0;
            J0x68:

            // End:0xE2 [Loop If]
            if(j < li_Mutators.ItemCount)
            {
                Box = moComboBox(li_Mutators.GetItem(j));
                // End:0xD8
                if(Box.Caption ~= MutRecords[i].FriendlyName)
                {
                    Box.SetIndex(Index);
                    return;
                }
                j++;
                // [Loop Continue]
                goto J0x68;
            }
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
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
        else
        {
            lb_Mutators.EnableMe();
        }
    }
    //return;    
}

function bool CancelClick(GUIComponent Sender)
{
    Controller.CloseMenu(true);
    return true;
    //return;    
}

function AFilterRule BuildRule(string key, string Value, MasterServerClient.EQueryType QType)
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
    else
    {
        NewRule.FilterType = 0;
    }
    NewRule.ItemName = key;
    return NewRule;
    //return;    
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
        Rules[cnt++] = BuildRule("currentplayers", "0", 4);
    }
    // End:0x78
    if(ck_Full.IsChecked())
    {
        Rules[cnt++] = BuildRule("freespace", "0", 4);
    }
    // End:0xB1
    if(ck_Passworded.IsChecked())
    {
        Rules[cnt++] = BuildRule("password", "false", 0);
    }
    // End:0xE7
    if(ck_Bots.IsChecked())
    {
        Rules[cnt++] = BuildRule("nobots", "true", 0);
    }
    // End:0x122
    if(cb_Stats.GetIndex() == 1)
    {
        Rules[cnt++] = BuildRule("stats", "true", 0);        
    }
    else
    {
        // End:0x15C
        if(cb_Stats.GetIndex() == 2)
        {
            Rules[cnt++] = BuildRule("stats", "false", 0);
        }
    }
    // End:0x19C
    if(cb_WeaponStay.GetIndex() == 1)
    {
        Rules[cnt++] = BuildRule("weaponstay", "true", 0);        
    }
    else
    {
        // End:0x1DB
        if(cb_WeaponStay.GetIndex() == 2)
        {
            Rules[cnt++] = BuildRule("weaponstay", "false", 0);
        }
    }
    // End:0x219
    if(cb_Translocator.GetIndex() == 1)
    {
        Rules[cnt++] = BuildRule("transloc", "true", 0);        
    }
    else
    {
        // End:0x256
        if(cb_Translocator.GetIndex() == 2)
        {
            Rules[cnt++] = BuildRule("transloc", "false", 0);
        }
    }
    // End:0x296
    if(cb_Mutators.GetIndex() == 0)
    {
        Rules[cnt++] = BuildRule("nomutators", "true", 0);        
    }
    else
    {
        // End:0x388
        if(cb_Mutators.GetIndex() == 2)
        {
            i = 0;
            J0x2B3:

            // End:0x388 [Loop If]
            if(i < li_Mutators.ItemCount)
            {
                cb = moComboBox(li_Mutators.GetItem(i));
                // End:0x335
                if(cb.GetIndex() == 1)
                {
                    Rules[cnt++] = BuildRule("mutator", FindMutClassFromFriendly(cb.Caption), 0);
                    // [Explicit Continue]
                    goto J0x37E;
                }
                // End:0x37E
                if(cb.GetIndex() == 2)
                {
                    Rules[cnt++] = BuildRule("mutator", FindMutClassFromFriendly(cb.Caption), 1);
                }
                J0x37E:

                i++;
                // [Loop Continue]
                goto J0x2B3;
            }
        }
    }
    FLP.FM.PostEdit(FilterIndex, eb_Name.GetComponentValue(), Rules);
    Controller.CloseMenu(true);
    FLP.InitFilterList();
    FLP.li_Filters.SetIndex(FLP.li_Filters.Find(eb_Name.GetComponentValue()));
    return true;
    //return;    
}

function string FindMutClassFromFriendly(string friendly)
{
    local int i, P;
    local string cls;

    i = 0;
    J0x07:

    // End:0x71 [Loop If]
    if(i < MutRecords.Length)
    {
        // End:0x67
        if(MutRecords[i].FriendlyName ~= friendly)
        {
            cls = MutRecords[i].ClassName;
            P = InStr(cls, ".");
            return Mid(cls, P + 1);
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return "";
    //return;    
}

function bool ebPreDraw(Canvas Canvas)
{
    eb_Name.WinTop = sb_Options.ActualTop() + float(36);
    return true;
    //return;    
}

defaultproperties
{
    // Reference: GUISectionBackground'GUI2K4_Decompressed.Ut2K4_FilterEdit.sbOptions'
    begin object name="sbOptions" class=XInterface.GUISectionBackground
        bFillClient=true
        Caption="Options..."
        LeftPadding=0.0025000
        RightPadding=0.0025000
        TopPadding=0.1000000
        BottomPadding=0.0025000
        NumColumns=2
        WinTop=0.0574480
        WinLeft=0.0360940
        WinWidth=0.9277350
        WinHeight=0.3758230
        OnPreDraw=sbOptions.InternalPreDraw
    end object
    sb_Options=sbOptions
    // Reference: AltSectionBackground'GUI2K4_Decompressed.Ut2K4_FilterEdit.sbMutators'
    begin object name="sbMutators" class=GUI2K4_Decompressed.AltSectionBackground
        bFillClient=true
        Caption="Custom Mutator Config"
        LeftPadding=0.0025000
        RightPadding=0.0025000
        TopPadding=0.0025000
        BottomPadding=0.0025000
        WinTop=0.4366140
        WinLeft=0.0360940
        WinWidth=0.9292960
        WinHeight=0.4539480
        OnPreDraw=sbMutators.InternalPreDraw
    end object
    sb_Mutators=sbMutators
    // Reference: moEditBox'GUI2K4_Decompressed.Ut2K4_FilterEdit.ebName'
    begin object name="ebName" class=XInterface.moEditBox
        ComponentWidth=0.7000000
        Caption="Filter Name:"
        OnCreateComponent=ebName.InternalOnCreateComponent
        WinTop=0.1241140
        WinLeft=0.1845310
        WinWidth=0.6542970
        TabOrder=0
        OnPreDraw=Ut2K4_FilterEdit.ebPreDraw
    end object
    eb_Name=ebName
    // Reference: moComboBox'GUI2K4_Decompressed.Ut2K4_FilterEdit.cbStats'
    begin object name="cbStats" class=XInterface.moComboBox
        bReadOnly=true
        ComponentWidth=0.5500000
        Caption="Stats Servers:"
        OnCreateComponent=cbStats.InternalOnCreateComponent
        WinTop=0.2500000
        WinLeft=0.2500000
        TabOrder=5
    end object
    cb_Stats=cbStats
    // Reference: moComboBox'GUI2K4_Decompressed.Ut2K4_FilterEdit.cbWeaponStay'
    begin object name="cbWeaponStay" class=XInterface.moComboBox
        bReadOnly=true
        ComponentWidth=0.5500000
        Caption="Weapon Stay:"
        OnCreateComponent=cbWeaponStay.InternalOnCreateComponent
        WinTop=0.2500000
        WinLeft=0.2500000
        TabOrder=6
    end object
    cb_WeaponStay=cbWeaponStay
    // Reference: moComboBox'GUI2K4_Decompressed.Ut2K4_FilterEdit.cbTranslocator'
    begin object name="cbTranslocator" class=XInterface.moComboBox
        bReadOnly=true
        ComponentWidth=0.5500000
        Caption="Translocator:"
        OnCreateComponent=cbTranslocator.InternalOnCreateComponent
        WinTop=0.2500000
        WinLeft=0.2500000
        TabOrder=7
    end object
    cb_Translocator=cbTranslocator
    // Reference: moComboBox'GUI2K4_Decompressed.Ut2K4_FilterEdit.cbMutators'
    begin object name="cbMutators" class=XInterface.moComboBox
        bReadOnly=true
        ComponentWidth=0.5500000
        Caption="Mutators:"
        OnCreateComponent=cbMutators.InternalOnCreateComponent
        WinTop=0.2500000
        WinLeft=0.2500000
        TabOrder=8
    end object
    cb_Mutators=cbMutators
    // Reference: moCheckBox'GUI2K4_Decompressed.Ut2K4_FilterEdit.ckFull'
    begin object name="ckFull" class=XInterface.moCheckBox
        ComponentWidth=0.1000000
        Caption="No Full Servers"
        OnCreateComponent=ckFull.InternalOnCreateComponent
        WinTop=0.2500000
        WinLeft=0.2500000
        TabOrder=1
    end object
    ck_Full=ckFull
    // Reference: moCheckBox'GUI2K4_Decompressed.Ut2K4_FilterEdit.ckBots'
    begin object name="ckBots" class=XInterface.moCheckBox
        ComponentWidth=0.1000000
        Caption="No Bots"
        OnCreateComponent=ckBots.InternalOnCreateComponent
        WinTop=0.2500000
        WinLeft=0.2500000
        TabOrder=2
    end object
    ck_Bots=ckBots
    // Reference: moCheckBox'GUI2K4_Decompressed.Ut2K4_FilterEdit.ckEmpty'
    begin object name="ckEmpty" class=XInterface.moCheckBox
        ComponentWidth=0.1000000
        Caption="No Empty Servers"
        OnCreateComponent=ckEmpty.InternalOnCreateComponent
        WinTop=0.2500000
        WinLeft=0.2500000
        TabOrder=3
    end object
    ck_Empty=ckEmpty
    // Reference: moCheckBox'GUI2K4_Decompressed.Ut2K4_FilterEdit.ckPassworded'
    begin object name="ckPassworded" class=XInterface.moCheckBox
        ComponentWidth=0.1000000
        Caption="No Passworded Servers"
        OnCreateComponent=ckPassworded.InternalOnCreateComponent
        WinTop=0.2500000
        WinLeft=0.2500000
        TabOrder=4
    end object
    ck_Passworded=ckPassworded
    // Reference: GUIButton'GUI2K4_Decompressed.Ut2K4_FilterEdit.bOk'
    begin object name="bOk" class=XInterface.GUIButton
        Caption="OK"
        WinTop=0.9036120
        WinLeft=0.6115640
        WinWidth=0.1687500
        WinHeight=0.0500000
        OnClick=Ut2K4_FilterEdit.OkClick
        OnKeyEvent=bOk.InternalOnKeyEvent
    end object
    b_OK=bOk
    // Reference: GUIButton'GUI2K4_Decompressed.Ut2K4_FilterEdit.bCancel'
    begin object name="bCancel" class=XInterface.GUIButton
        Caption="Cancel"
        WinTop=0.9035070
        WinLeft=0.7928140
        WinWidth=0.1687500
        WinHeight=0.0500000
        OnClick=Ut2K4_FilterEdit.CancelClick
        OnKeyEvent=bCancel.InternalOnKeyEvent
    end object
    b_Cancel=bCancel
    // Reference: GUIMultiOptionListBox'GUI2K4_Decompressed.Ut2K4_FilterEdit.lbMutators'
    begin object name="lbMutators" class=XInterface.GUIMultiOptionListBox
        OnCreateComponent=lbMutators.InternalOnCreateComponent
        WinTop=0.1032810
        WinLeft=0.2626560
        WinWidth=0.3433590
        WinHeight=0.7664480
        TabOrder=9
    end object
    lb_Mutators=lbMutators
    ComboOpts[0]="Does Not Matter"
    ComboOpts[1]="Must Be On"
    ComboOpts[2]="Must Be Off"
    MutOpts[0]="No Mutators"
    MutOpts[1]="Any Mutator"
    MutOpts[2]="Custom"
    WindowName="Edit Filter Rules..."
    WinTop=0.0000000
    WinLeft=0.0000000
    WinWidth=1.0000000
    WinHeight=1.0000000
}