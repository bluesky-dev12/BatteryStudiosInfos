class Browser_Prefs extends Browser_Page
    editinlinenew
    instanced;

var export editinline GUITitleBar StatusBar;
var localized string ViewStatsStrings[3];
var localized string MutatorModeStrings[4];
var localized string WeaponStayStrings[3];
var localized string TranslocatorStrings[3];
var bool bIsInitialised;
var array<MutatorRecord> MutatorRecords;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super(GUIPanel).InitComponent(MyController, myOwner);
    // End:0x1B
    if(bIsInitialised)
    {
        return;
    }
    GUIButton(GUIPanel(Controls[0]).Controls[0]).__OnClick__Delegate = BackClick;
    moComboBox(Controls[5]).AddItem(ViewStatsStrings[0]);
    moComboBox(Controls[5]).AddItem(ViewStatsStrings[1]);
    moComboBox(Controls[5]).AddItem(ViewStatsStrings[2]);
    moComboBox(Controls[5]).ReadOnly(true);
    Class'WGame.wUtil'.static.GetMutatorList(MutatorRecords);
    moComboBox(Controls[9]).AddItem(MutatorModeStrings[0]);
    moComboBox(Controls[9]).AddItem(MutatorModeStrings[1]);
    moComboBox(Controls[9]).AddItem(MutatorModeStrings[2]);
    moComboBox(Controls[9]).AddItem(MutatorModeStrings[3]);
    moComboBox(Controls[9]).ReadOnly(true);
    moComboBox(Controls[13]).AddItem(MutatorModeStrings[0]);
    moComboBox(Controls[13]).AddItem(MutatorModeStrings[2]);
    moComboBox(Controls[13]).AddItem(MutatorModeStrings[3]);
    moComboBox(Controls[13]).ReadOnly(true);
    i = 0;
    J0x1DA:

    // End:0x264 [Loop If]
    if(i < MutatorRecords.Length)
    {
        moComboBox(Controls[6]).AddItem(MutatorRecords[i].FriendlyName, none, MutatorRecords[i].ClassName);
        moComboBox(Controls[14]).AddItem(MutatorRecords[i].FriendlyName, none, MutatorRecords[i].ClassName);
        i++;
        // [Loop Continue]
        goto J0x1DA;
    }
    moComboBox(Controls[6]).ReadOnly(true);
    moComboBox(Controls[11]).AddItem(WeaponStayStrings[0]);
    moComboBox(Controls[11]).AddItem(WeaponStayStrings[1]);
    moComboBox(Controls[11]).AddItem(WeaponStayStrings[2]);
    moComboBox(Controls[11]).ReadOnly(true);
    moComboBox(Controls[12]).AddItem(TranslocatorStrings[0]);
    moComboBox(Controls[12]).AddItem(TranslocatorStrings[1]);
    moComboBox(Controls[12]).AddItem(TranslocatorStrings[2]);
    moComboBox(Controls[12]).ReadOnly(true);
    moNumericEdit(Controls[15]).MyNumericEdit.Step = 10;
    moNumericEdit(Controls[16]).MyNumericEdit.Step = 10;
    i = 2;
    J0x3AE:

    // End:0x3F8 [Loop If]
    if(i < 17)
    {
        Controls[i].__OnLoadINI__Delegate = MyOnLoadINI;
        Controls[i].__OnChange__Delegate = MyOnChange;
        i++;
        // [Loop Continue]
        goto J0x3AE;
    }
    StatusBar = GUITitleBar(GUIPanel(Controls[0]).Controls[1]);
    GUIButton(GUIPanel(Controls[0]).Controls[2]).__OnClick__Delegate = InternalShowIconKey;
    bIsInitialised = true;
    //return;    
}

function bool BackClick(GUIComponent Sender)
{
    Controller.CloseMenu(true);
    return true;
    //return;    
}

function UpdateMutatorVisibility()
{
    // End:0x73
    if((int(Browser.ViewMutatorMode) == int(0)) || int(Browser.ViewMutatorMode) == int(1))
    {
        Controls[6].bVisible = false;
        Controls[13].bVisible = false;
        Controls[14].bVisible = false;        
    }
    else
    {
        Controls[6].bVisible = true;
        Controls[13].bVisible = true;
        // End:0xCB
        if(int(Browser.ViewMutator2Mode) == int(0))
        {
            Controls[14].bVisible = false;            
        }
        else
        {
            Controls[14].bVisible = true;
        }
    }
    //return;    
}

function bool InternalShowIconKey(GUIComponent Sender)
{
    Controller.OpenMenu("XInterface.Browser_IconKey");
    return true;
    //return;    
}

function MyOnLoadINI(GUIComponent Sender, string S)
{
    local int i;

    // End:0x3B
    if(Sender == Controls[8])
    {
        moCheckBox(Controls[8]).Checked(Browser.bOnlyShowStandard);        
    }
    else
    {
        // End:0x76
        if(Sender == Controls[2])
        {
            moCheckBox(Controls[2]).Checked(Browser.bOnlyShowNonPassword);            
        }
        else
        {
            // End:0xB1
            if(Sender == Controls[3])
            {
                moCheckBox(Controls[3]).Checked(Browser.bDontShowFull);                
            }
            else
            {
                // End:0xEC
                if(Sender == Controls[4])
                {
                    moCheckBox(Controls[4]).Checked(Browser.bDontShowEmpty);                    
                }
                else
                {
                    // End:0x12E
                    if(Sender == Controls[5])
                    {
                        moComboBox(Controls[5]).SetText(ViewStatsStrings[int(Browser.StatsServerView)]);                        
                    }
                    else
                    {
                        // End:0x1B0
                        if(Sender == Controls[6])
                        {
                            i = 0;
                            J0x147:

                            // End:0x1AD [Loop If]
                            if(i < MutatorRecords.Length)
                            {
                                // End:0x1A3
                                if(Browser.DesiredMutator == MutatorRecords[i].ClassName)
                                {
                                    moComboBox(Controls[6]).SetText(MutatorRecords[i].FriendlyName);
                                    return;
                                }
                                i++;
                                // [Loop Continue]
                                goto J0x147;
                            }                            
                        }
                        else
                        {
                            // End:0x1EA
                            if(Sender == Controls[7])
                            {
                                moEditBox(Controls[7]).SetText(Browser.CustomQuery);                                
                            }
                            else
                            {
                                // End:0x232
                                if(Sender == Controls[9])
                                {
                                    moComboBox(Controls[9]).SetText(MutatorModeStrings[int(Browser.ViewMutatorMode)]);
                                    UpdateMutatorVisibility();                                    
                                }
                                else
                                {
                                    // End:0x26D
                                    if(Sender == Controls[10])
                                    {
                                        moCheckBox(Controls[10]).Checked(Browser.bDontShowWithBots);                                        
                                    }
                                    else
                                    {
                                        // End:0x2AF
                                        if(Sender == Controls[11])
                                        {
                                            moComboBox(Controls[11]).SetText(WeaponStayStrings[int(Browser.WeaponStayServerView)]);                                            
                                        }
                                        else
                                        {
                                            // End:0x2F1
                                            if(Sender == Controls[12])
                                            {
                                                moComboBox(Controls[12]).SetText(TranslocatorStrings[int(Browser.TranslocServerView)]);                                                
                                            }
                                            else
                                            {
                                                // End:0x339
                                                if(Sender == Controls[13])
                                                {
                                                    moComboBox(Controls[13]).SetText(MutatorModeStrings[int(Browser.ViewMutator2Mode)]);
                                                    UpdateMutatorVisibility();                                                    
                                                }
                                                else
                                                {
                                                    // End:0x3BB
                                                    if(Sender == Controls[14])
                                                    {
                                                        i = 0;
                                                        J0x352:

                                                        // End:0x3B8 [Loop If]
                                                        if(i < MutatorRecords.Length)
                                                        {
                                                            // End:0x3AE
                                                            if(Browser.DesiredMutator2 == MutatorRecords[i].ClassName)
                                                            {
                                                                moComboBox(Controls[14]).SetText(MutatorRecords[i].FriendlyName);
                                                                return;
                                                            }
                                                            i++;
                                                            // [Loop Continue]
                                                            goto J0x352;
                                                        }                                                        
                                                    }
                                                    else
                                                    {
                                                        // End:0x3F5
                                                        if(Sender == Controls[15])
                                                        {
                                                            moNumericEdit(Controls[15]).SetValue(Browser.MinGamespeed);                                                            
                                                        }
                                                        else
                                                        {
                                                            // End:0x42C
                                                            if(Sender == Controls[16])
                                                            {
                                                                moNumericEdit(Controls[16]).SetValue(Browser.MaxGamespeed);
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    //return;    
}

function MyOnChange(GUIComponent Sender)
{
    local string t;

    // End:0x3C
    if(Sender == Controls[8])
    {
        Browser.bOnlyShowStandard = moCheckBox(Controls[8]).IsChecked();        
    }
    else
    {
        // End:0x78
        if(Sender == Controls[2])
        {
            Browser.bOnlyShowNonPassword = moCheckBox(Controls[2]).IsChecked();            
        }
        else
        {
            // End:0xB4
            if(Sender == Controls[3])
            {
                Browser.bDontShowFull = moCheckBox(Controls[3]).IsChecked();                
            }
            else
            {
                // End:0xF0
                if(Sender == Controls[4])
                {
                    Browser.bDontShowEmpty = moCheckBox(Controls[4]).IsChecked();                    
                }
                else
                {
                    // End:0x18F
                    if(Sender == Controls[5])
                    {
                        t = moComboBox(Controls[5]).GetText();
                        // End:0x144
                        if(t == ViewStatsStrings[0])
                        {
                            Browser.StatsServerView = 0;                            
                        }
                        else
                        {
                            // End:0x169
                            if(t == ViewStatsStrings[1])
                            {
                                Browser.StatsServerView = 1;                                
                            }
                            else
                            {
                                // End:0x18C
                                if(t == ViewStatsStrings[2])
                                {
                                    Browser.StatsServerView = 2;
                                }
                            }
                        }                        
                    }
                    else
                    {
                        // End:0x1CA
                        if(Sender == Controls[6])
                        {
                            Browser.DesiredMutator = moComboBox(Controls[6]).GetExtra();                            
                        }
                        else
                        {
                            // End:0x205
                            if(Sender == Controls[7])
                            {
                                Browser.CustomQuery = moEditBox(Controls[7]).GetText();                                
                            }
                            else
                            {
                                // End:0x2D0
                                if(Sender == Controls[9])
                                {
                                    t = moComboBox(Controls[9]).GetText();
                                    // End:0x259
                                    if(t == MutatorModeStrings[0])
                                    {
                                        Browser.ViewMutatorMode = 0;                                        
                                    }
                                    else
                                    {
                                        // End:0x27E
                                        if(t == MutatorModeStrings[1])
                                        {
                                            Browser.ViewMutatorMode = 1;                                            
                                        }
                                        else
                                        {
                                            // End:0x2A4
                                            if(t == MutatorModeStrings[2])
                                            {
                                                Browser.ViewMutatorMode = 2;                                                
                                            }
                                            else
                                            {
                                                // End:0x2C7
                                                if(t == MutatorModeStrings[3])
                                                {
                                                    Browser.ViewMutatorMode = 3;
                                                }
                                            }
                                        }
                                    }
                                    UpdateMutatorVisibility();                                    
                                }
                                else
                                {
                                    // End:0x30C
                                    if(Sender == Controls[10])
                                    {
                                        Browser.bDontShowWithBots = moCheckBox(Controls[10]).IsChecked();                                        
                                    }
                                    else
                                    {
                                        // End:0x3AB
                                        if(Sender == Controls[11])
                                        {
                                            t = moComboBox(Controls[11]).GetText();
                                            // End:0x360
                                            if(t == WeaponStayStrings[0])
                                            {
                                                Browser.WeaponStayServerView = 0;                                                
                                            }
                                            else
                                            {
                                                // End:0x385
                                                if(t == WeaponStayStrings[1])
                                                {
                                                    Browser.WeaponStayServerView = 1;                                                    
                                                }
                                                else
                                                {
                                                    // End:0x3A8
                                                    if(t == WeaponStayStrings[2])
                                                    {
                                                        Browser.WeaponStayServerView = 2;
                                                    }
                                                }
                                            }                                            
                                        }
                                        else
                                        {
                                            // End:0x44A
                                            if(Sender == Controls[12])
                                            {
                                                t = moComboBox(Controls[12]).GetText();
                                                // End:0x3FF
                                                if(t == TranslocatorStrings[0])
                                                {
                                                    Browser.TranslocServerView = 0;                                                    
                                                }
                                                else
                                                {
                                                    // End:0x424
                                                    if(t == TranslocatorStrings[1])
                                                    {
                                                        Browser.TranslocServerView = 1;                                                        
                                                    }
                                                    else
                                                    {
                                                        // End:0x447
                                                        if(t == TranslocatorStrings[2])
                                                        {
                                                            Browser.TranslocServerView = 2;
                                                        }
                                                    }
                                                }                                                
                                            }
                                            else
                                            {
                                                // End:0x4F0
                                                if(Sender == Controls[13])
                                                {
                                                    t = moComboBox(Controls[13]).GetText();
                                                    // End:0x49E
                                                    if(t == MutatorModeStrings[0])
                                                    {
                                                        Browser.ViewMutator2Mode = 0;                                                        
                                                    }
                                                    else
                                                    {
                                                        // End:0x4C4
                                                        if(t == MutatorModeStrings[2])
                                                        {
                                                            Browser.ViewMutator2Mode = 2;                                                            
                                                        }
                                                        else
                                                        {
                                                            // End:0x4E7
                                                            if(t == MutatorModeStrings[3])
                                                            {
                                                                Browser.ViewMutator2Mode = 3;
                                                            }
                                                        }
                                                    }
                                                    UpdateMutatorVisibility();                                                    
                                                }
                                                else
                                                {
                                                    // End:0x52B
                                                    if(Sender == Controls[14])
                                                    {
                                                        Browser.DesiredMutator2 = moComboBox(Controls[14]).GetExtra();                                                        
                                                    }
                                                    else
                                                    {
                                                        // End:0x59B
                                                        if(Sender == Controls[15])
                                                        {
                                                            // End:0x572
                                                            if(moNumericEdit(Controls[15]).GetValue() < 0)
                                                            {
                                                                moNumericEdit(Controls[15]).SetValue(0);
                                                            }
                                                            Browser.MinGamespeed = moNumericEdit(Controls[15]).GetValue();                                                            
                                                        }
                                                        else
                                                        {
                                                            // End:0x60A
                                                            if(Sender == Controls[16])
                                                            {
                                                                // End:0x5E4
                                                                if(moNumericEdit(Controls[16]).GetValue() > 200)
                                                                {
                                                                    moNumericEdit(Controls[16]).SetValue(200);
                                                                }
                                                                Browser.MaxGamespeed = moNumericEdit(Controls[16]).GetValue();
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    Browser.SaveConfig();
    //return;    
}

defaultproperties
{
    ViewStatsStrings[0]="All servers"
    ViewStatsStrings[1]="Stats servers only"
    ViewStatsStrings[2]="Exclude stats servers"
    MutatorModeStrings[0]="All mutators"
    MutatorModeStrings[1]="Exclude mutators"
    MutatorModeStrings[2]="Selected mutator server"
    MutatorModeStrings[3]="Exclude selected mutator server"
    WeaponStayStrings[0]="All servers"
    WeaponStayStrings[1]="Weapons stay servers only"
    WeaponStayStrings[2]="Exclude weapons stay servers"
    TranslocatorStrings[0]="All servers"
    TranslocatorStrings[1]="Translocator servers only"
    TranslocatorStrings[2]="Exclude translocator servers"
    // Reference: GUIPanel'XInterface_Decompressed.Browser_Prefs.FooterPanel'
    begin object name="FooterPanel" class=XInterface_Decompressed.GUIPanel
        Controls[0]=GUIButton'XInterface_Decompressed.Browser_Prefs.MyBackButton'
        Controls[1]=GUITitleBar'XInterface_Decompressed.Browser_Prefs.MyStatus'
        Controls[2]=GUIButton'XInterface_Decompressed.Browser_Prefs.MyKeyButton'
        WinTop=0.9000000
        WinHeight=0.1000000
    end object
    Controls[0]=FooterPanel
    // Reference: GUILabel'XInterface_Decompressed.Browser_Prefs.FilterTitle'
    begin object name="FilterTitle" class=XInterface_Decompressed.GUILabel
        Caption="Server is filtering options: "
        TextColor=(R=230,G=200,B=0,A=255)
        TextFont="UT2HeaderFont"
        WinTop=0.0500000
        WinLeft=0.1500000
        WinWidth=0.7200030
        WinHeight=0.0562500
    end object
    Controls[1]=FilterTitle
    // Reference: moCheckBox'XInterface_Decompressed.Browser_Prefs.NoPasswdCheckBox'
    begin object name="NoPasswdCheckBox" class=XInterface_Decompressed.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="Exclude password protected servers"
        OnCreateComponent=NoPasswdCheckBox.InternalOnCreateComponent
        IniOption="@Internal"
        WinTop=0.2100000
        WinLeft=0.0500000
        WinWidth=0.3400000
        WinHeight=0.0400000
    end object
    Controls[2]=NoPasswdCheckBox
    // Reference: moCheckBox'XInterface_Decompressed.Browser_Prefs.NoFullCheckBox'
    begin object name="NoFullCheckBox" class=XInterface_Decompressed.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="Exclude full servers"
        OnCreateComponent=NoFullCheckBox.InternalOnCreateComponent
        IniOption="@Internal"
        WinTop=0.2700000
        WinLeft=0.0500000
        WinWidth=0.3400000
        WinHeight=0.0400000
    end object
    Controls[3]=NoFullCheckBox
    // Reference: moCheckBox'XInterface_Decompressed.Browser_Prefs.NoEmptyCheckBox'
    begin object name="NoEmptyCheckBox" class=XInterface_Decompressed.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="Exclude empty servers"
        OnCreateComponent=NoEmptyCheckBox.InternalOnCreateComponent
        IniOption="@Internal"
        WinTop=0.3300000
        WinLeft=0.0500000
        WinWidth=0.3400000
        WinHeight=0.0400000
    end object
    Controls[4]=NoEmptyCheckBox
    // Reference: moComboBox'XInterface_Decompressed.Browser_Prefs.StatsViewCombo'
    begin object name="StatsViewCombo" class=XInterface_Decompressed.moComboBox
        ComponentJustification=0
        CaptionWidth=0.4000000
        Caption="Stats Server"
        OnCreateComponent=StatsViewCombo.InternalOnCreateComponent
        IniOption="@INTERNAL"
        WinTop=0.3900000
        WinLeft=0.0500000
        WinWidth=0.7600000
        WinHeight=0.0400000
    end object
    Controls[5]=StatsViewCombo
    // Reference: moComboBox'XInterface_Decompressed.Browser_Prefs.MutatorCombo'
    begin object name="MutatorCombo" class=XInterface_Decompressed.moComboBox
        ComponentJustification=0
        CaptionWidth=0.0000000
        OnCreateComponent=MutatorCombo.InternalOnCreateComponent
        IniOption="@INTERNAL"
        WinTop=0.4500000
        WinLeft=0.6750040
        WinWidth=0.3087500
        WinHeight=0.0600000
    end object
    Controls[6]=MutatorCombo
    // Reference: moEditBox'XInterface_Decompressed.Browser_Prefs.CustomQuery'
    begin object name="CustomQuery" class=XInterface_Decompressed.moEditBox
        CaptionWidth=0.4000000
        Caption="Custom query"
        OnCreateComponent=CustomQuery.InternalOnCreateComponent
        IniOption="@INTERNAL"
        WinTop=0.7500000
        WinLeft=0.0500000
        WinWidth=0.7600000
        WinHeight=0.0400000
    end object
    Controls[7]=CustomQuery
    // Reference: moCheckBox'XInterface_Decompressed.Browser_Prefs.OnlyStandardCheckBox'
    begin object name="OnlyStandardCheckBox" class=XInterface_Decompressed.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="Basic servers only"
        OnCreateComponent=OnlyStandardCheckBox.InternalOnCreateComponent
        IniOption="@Internal"
        WinTop=0.1500000
        WinLeft=0.0500000
        WinWidth=0.3400000
        WinHeight=0.0400000
    end object
    Controls[8]=OnlyStandardCheckBox
    // Reference: moComboBox'XInterface_Decompressed.Browser_Prefs.MutatorModeCombo'
    begin object name="MutatorModeCombo" class=XInterface_Decompressed.moComboBox
        ComponentJustification=0
        Caption="Mutator"
        OnCreateComponent=MutatorModeCombo.InternalOnCreateComponent
        IniOption="@INTERNAL"
        WinTop=0.4500000
        WinLeft=0.0500000
        WinWidth=0.6100000
        WinHeight=0.0400000
    end object
    Controls[9]=MutatorModeCombo
    // Reference: moCheckBox'XInterface_Decompressed.Browser_Prefs.NoBotServersCheckBox'
    begin object name="NoBotServersCheckBox" class=XInterface_Decompressed.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="Exclude servers with bots"
        OnCreateComponent=NoBotServersCheckBox.InternalOnCreateComponent
        IniOption="@Internal"
        WinTop=0.3900000
        WinLeft=0.0500000
        WinWidth=0.3400000
        WinHeight=0.0400000
        bVisible=false
    end object
    Controls[10]=NoBotServersCheckBox
    // Reference: moComboBox'XInterface_Decompressed.Browser_Prefs.WeaponStayCombo'
    begin object name="WeaponStayCombo" class=XInterface_Decompressed.moComboBox
        ComponentJustification=0
        CaptionWidth=0.4000000
        Caption="Weapons Stay"
        OnCreateComponent=WeaponStayCombo.InternalOnCreateComponent
        IniOption="@INTERNAL"
        WinTop=0.5700000
        WinLeft=0.0500000
        WinWidth=0.7600000
        WinHeight=0.0400000
    end object
    Controls[11]=WeaponStayCombo
    // Reference: moComboBox'XInterface_Decompressed.Browser_Prefs.TranslocatorCombo'
    begin object name="TranslocatorCombo" class=XInterface_Decompressed.moComboBox
        ComponentJustification=0
        CaptionWidth=0.4000000
        Caption="Translocator"
        OnCreateComponent=TranslocatorCombo.InternalOnCreateComponent
        IniOption="@INTERNAL"
        WinTop=0.6300000
        WinLeft=0.0500000
        WinWidth=0.7600000
        WinHeight=0.0400000
    end object
    Controls[12]=TranslocatorCombo
    // Reference: moComboBox'XInterface_Decompressed.Browser_Prefs.MutatorModeCombo2'
    begin object name="MutatorModeCombo2" class=XInterface_Decompressed.moComboBox
        ComponentJustification=0
        OnCreateComponent=MutatorModeCombo2.InternalOnCreateComponent
        IniOption="@INTERNAL"
        WinTop=0.5100000
        WinLeft=0.0500000
        WinWidth=0.6100000
        WinHeight=0.0400000
    end object
    Controls[13]=MutatorModeCombo2
    // Reference: moComboBox'XInterface_Decompressed.Browser_Prefs.MutatorCombo2'
    begin object name="MutatorCombo2" class=XInterface_Decompressed.moComboBox
        ComponentJustification=0
        CaptionWidth=0.0000000
        OnCreateComponent=MutatorCombo2.InternalOnCreateComponent
        IniOption="@INTERNAL"
        WinTop=0.5100000
        WinLeft=0.6750040
        WinWidth=0.3087500
        WinHeight=0.0600000
    end object
    Controls[14]=MutatorCombo2
    // Reference: moNumericEdit'XInterface_Decompressed.Browser_Prefs.MinGamespeed'
    begin object name="MinGamespeed" class=XInterface_Decompressed.moNumericEdit
        MinValue=0
        MaxValue=200
        ComponentJustification=0
        CaptionWidth=0.7000000
        Caption="Min. Game Speed"
        OnCreateComponent=MinGamespeed.InternalOnCreateComponent
        IniOption="@INTERNAL"
        WinTop=0.6900000
        WinLeft=0.0500000
        WinWidth=0.4337500
        WinHeight=0.0600000
    end object
    Controls[15]=MinGamespeed
    // Reference: moNumericEdit'XInterface_Decompressed.Browser_Prefs.MaxGamespeed'
    begin object name="MaxGamespeed" class=XInterface_Decompressed.moNumericEdit
        MinValue=0
        MaxValue=200
        ComponentJustification=0
        CaptionWidth=0.4000000
        Caption="Max"
        OnCreateComponent=MaxGamespeed.InternalOnCreateComponent
        IniOption="@INTERNAL"
        WinTop=0.6900000
        WinLeft=0.5575010
        WinWidth=0.2350000
        WinHeight=0.0600000
    end object
    Controls[16]=MaxGamespeed
}