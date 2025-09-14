/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\Browser_Prefs.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:7
 *	Functions:6
 *
 *******************************************************************************/
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
    // End:0x1b
    if(bIsInitialised)
    {
        return;
    }
    GUIButton(GUIPanel(Controls[0]).Controls[0]).__OnClick__Delegate = BackClick;
    moComboBox(Controls[5]).AddItem(ViewStatsStrings[0]);
    moComboBox(Controls[5]).AddItem(ViewStatsStrings[1]);
    moComboBox(Controls[5]).AddItem(ViewStatsStrings[2]);
    moComboBox(Controls[5]).ReadOnly(true);
    class'wUtil'.static.GetMutatorList(MutatorRecords);
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
    J0x1da:
    // End:0x264 [While If]
    if(i < MutatorRecords.Length)
    {
        moComboBox(Controls[6]).AddItem(MutatorRecords[i].FriendlyName, none, MutatorRecords[i].ClassName);
        moComboBox(Controls[14]).AddItem(MutatorRecords[i].FriendlyName, none, MutatorRecords[i].ClassName);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1da;
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
    J0x3ae:
    // End:0x3f8 [While If]
    if(i < 17)
    {
        Controls[i].__OnLoadINI__Delegate = MyOnLoadINI;
        Controls[i].__OnChange__Delegate = MyOnChange;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x3ae;
    }
    StatusBar = GUITitleBar(GUIPanel(Controls[0]).Controls[1]);
    GUIButton(GUIPanel(Controls[0]).Controls[2]).__OnClick__Delegate = InternalShowIconKey;
    bIsInitialised = true;
}

function bool BackClick(GUIComponent Sender)
{
    Controller.CloseMenu(true);
    return true;
}

function UpdateMutatorVisibility()
{
    // End:0x73
    if(Browser.ViewMutatorMode == 0 || Browser.ViewMutatorMode == 1)
    {
        Controls[6].bVisible = false;
        Controls[13].bVisible = false;
        Controls[14].bVisible = false;
    }
    // End:0xdf
    else
    {
        Controls[6].bVisible = true;
        Controls[13].bVisible = true;
        // End:0xcb
        if(Browser.ViewMutator2Mode == 0)
        {
            Controls[14].bVisible = false;
        }
        // End:0xdf
        else
        {
            Controls[14].bVisible = true;
        }
    }
}

function bool InternalShowIconKey(GUIComponent Sender)
{
    Controller.OpenMenu("XInterface.Browser_IconKey");
    return true;
}

function MyOnLoadINI(GUIComponent Sender, string S)
{
    local int i;

    // End:0x3b
    if(Sender == Controls[8])
    {
        moCheckBox(Controls[8]).Checked(Browser.bOnlyShowStandard);
    }
    // End:0x42c
    else
    {
        // End:0x76
        if(Sender == Controls[2])
        {
            moCheckBox(Controls[2]).Checked(Browser.bOnlyShowNonPassword);
        }
        // End:0x42c
        else
        {
            // End:0xb1
            if(Sender == Controls[3])
            {
                moCheckBox(Controls[3]).Checked(Browser.bDontShowFull);
            }
            // End:0x42c
            else
            {
                // End:0xec
                if(Sender == Controls[4])
                {
                    moCheckBox(Controls[4]).Checked(Browser.bDontShowEmpty);
                }
                // End:0x42c
                else
                {
                    // End:0x12e
                    if(Sender == Controls[5])
                    {
                        moComboBox(Controls[5]).SetText(ViewStatsStrings[Browser.StatsServerView]);
                    }
                    // End:0x42c
                    else
                    {
                        // End:0x1b0
                        if(Sender == Controls[6])
                        {
                            i = 0;
                            J0x147:
                            // End:0x1ad [While If]
                            if(i < MutatorRecords.Length)
                            {
                                // End:0x1a3
                                if(Browser.DesiredMutator == MutatorRecords[i].ClassName)
                                {
                                    moComboBox(Controls[6]).SetText(MutatorRecords[i].FriendlyName);
                                    return;
                                }
                                ++ i;
                                // This is an implied JumpToken; Continue!
                                goto J0x147;
                            }
                        }
                        // End:0x42c
                        else
                        {
                            // End:0x1ea
                            if(Sender == Controls[7])
                            {
                                moEditBox(Controls[7]).SetText(Browser.CustomQuery);
                            }
                            // End:0x42c
                            else
                            {
                                // End:0x232
                                if(Sender == Controls[9])
                                {
                                    moComboBox(Controls[9]).SetText(MutatorModeStrings[Browser.ViewMutatorMode]);
                                    UpdateMutatorVisibility();
                                }
                                // End:0x42c
                                else
                                {
                                    // End:0x26d
                                    if(Sender == Controls[10])
                                    {
                                        moCheckBox(Controls[10]).Checked(Browser.bDontShowWithBots);
                                    }
                                    // End:0x42c
                                    else
                                    {
                                        // End:0x2af
                                        if(Sender == Controls[11])
                                        {
                                            moComboBox(Controls[11]).SetText(WeaponStayStrings[Browser.WeaponStayServerView]);
                                        }
                                        // End:0x42c
                                        else
                                        {
                                            // End:0x2f1
                                            if(Sender == Controls[12])
                                            {
                                                moComboBox(Controls[12]).SetText(TranslocatorStrings[Browser.TranslocServerView]);
                                            }
                                            // End:0x42c
                                            else
                                            {
                                                // End:0x339
                                                if(Sender == Controls[13])
                                                {
                                                    moComboBox(Controls[13]).SetText(MutatorModeStrings[Browser.ViewMutator2Mode]);
                                                    UpdateMutatorVisibility();
                                                }
                                                // End:0x42c
                                                else
                                                {
                                                    // End:0x3bb
                                                    if(Sender == Controls[14])
                                                    {
                                                        i = 0;
                                                        J0x352:
                                                        // End:0x3b8 [While If]
                                                        if(i < MutatorRecords.Length)
                                                        {
                                                            // End:0x3ae
                                                            if(Browser.DesiredMutator2 == MutatorRecords[i].ClassName)
                                                            {
                                                                moComboBox(Controls[14]).SetText(MutatorRecords[i].FriendlyName);
                                                                return;
                                                            }
                                                            ++ i;
                                                            // This is an implied JumpToken; Continue!
                                                            goto J0x352;
                                                        }
                                                    }
                                                    // End:0x42c
                                                    else
                                                    {
                                                        // End:0x3f5
                                                        if(Sender == Controls[15])
                                                        {
                                                            moNumericEdit(Controls[15]).SetValue(Browser.MinGamespeed);
                                                        }
                                                        // End:0x42c
                                                        else
                                                        {
                                                            // End:0x42c
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
}

function MyOnChange(GUIComponent Sender)
{
    local string t;

    // End:0x3c
    if(Sender == Controls[8])
    {
        Browser.bOnlyShowStandard = moCheckBox(Controls[8]).IsChecked();
    }
    // End:0x60a
    else
    {
        // End:0x78
        if(Sender == Controls[2])
        {
            Browser.bOnlyShowNonPassword = moCheckBox(Controls[2]).IsChecked();
        }
        // End:0x60a
        else
        {
            // End:0xb4
            if(Sender == Controls[3])
            {
                Browser.bDontShowFull = moCheckBox(Controls[3]).IsChecked();
            }
            // End:0x60a
            else
            {
                // End:0xf0
                if(Sender == Controls[4])
                {
                    Browser.bDontShowEmpty = moCheckBox(Controls[4]).IsChecked();
                }
                // End:0x60a
                else
                {
                    // End:0x18f
                    if(Sender == Controls[5])
                    {
                        t = moComboBox(Controls[5]).GetText();
                        // End:0x144
                        if(t == ViewStatsStrings[0])
                        {
                            Browser.StatsServerView = 0;
                        }
                        // End:0x18c
                        else
                        {
                            // End:0x169
                            if(t == ViewStatsStrings[1])
                            {
                                Browser.StatsServerView = 1;
                            }
                            // End:0x18c
                            else
                            {
                                // End:0x18c
                                if(t == ViewStatsStrings[2])
                                {
                                    Browser.StatsServerView = 2;
                                }
                            }
                        }
                    }
                    // End:0x60a
                    else
                    {
                        // End:0x1ca
                        if(Sender == Controls[6])
                        {
                            Browser.DesiredMutator = moComboBox(Controls[6]).GetExtra();
                        }
                        // End:0x60a
                        else
                        {
                            // End:0x205
                            if(Sender == Controls[7])
                            {
                                Browser.CustomQuery = moEditBox(Controls[7]).GetText();
                            }
                            // End:0x60a
                            else
                            {
                                // End:0x2d0
                                if(Sender == Controls[9])
                                {
                                    t = moComboBox(Controls[9]).GetText();
                                    // End:0x259
                                    if(t == MutatorModeStrings[0])
                                    {
                                        Browser.ViewMutatorMode = 0;
                                    }
                                    // End:0x2c7
                                    else
                                    {
                                        // End:0x27e
                                        if(t == MutatorModeStrings[1])
                                        {
                                            Browser.ViewMutatorMode = 1;
                                        }
                                        // End:0x2c7
                                        else
                                        {
                                            // End:0x2a4
                                            if(t == MutatorModeStrings[2])
                                            {
                                                Browser.ViewMutatorMode = 2;
                                            }
                                            // End:0x2c7
                                            else
                                            {
                                                // End:0x2c7
                                                if(t == MutatorModeStrings[3])
                                                {
                                                    Browser.ViewMutatorMode = 3;
                                                }
                                            }
                                        }
                                    }
                                    UpdateMutatorVisibility();
                                }
                                // End:0x60a
                                else
                                {
                                    // End:0x30c
                                    if(Sender == Controls[10])
                                    {
                                        Browser.bDontShowWithBots = moCheckBox(Controls[10]).IsChecked();
                                    }
                                    // End:0x60a
                                    else
                                    {
                                        // End:0x3ab
                                        if(Sender == Controls[11])
                                        {
                                            t = moComboBox(Controls[11]).GetText();
                                            // End:0x360
                                            if(t == WeaponStayStrings[0])
                                            {
                                                Browser.WeaponStayServerView = 0;
                                            }
                                            // End:0x3a8
                                            else
                                            {
                                                // End:0x385
                                                if(t == WeaponStayStrings[1])
                                                {
                                                    Browser.WeaponStayServerView = 1;
                                                }
                                                // End:0x3a8
                                                else
                                                {
                                                    // End:0x3a8
                                                    if(t == WeaponStayStrings[2])
                                                    {
                                                        Browser.WeaponStayServerView = 2;
                                                    }
                                                }
                                            }
                                        }
                                        // End:0x60a
                                        else
                                        {
                                            // End:0x44a
                                            if(Sender == Controls[12])
                                            {
                                                t = moComboBox(Controls[12]).GetText();
                                                // End:0x3ff
                                                if(t == TranslocatorStrings[0])
                                                {
                                                    Browser.TranslocServerView = 0;
                                                }
                                                // End:0x447
                                                else
                                                {
                                                    // End:0x424
                                                    if(t == TranslocatorStrings[1])
                                                    {
                                                        Browser.TranslocServerView = 1;
                                                    }
                                                    // End:0x447
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
                                            // End:0x60a
                                            else
                                            {
                                                // End:0x4f0
                                                if(Sender == Controls[13])
                                                {
                                                    t = moComboBox(Controls[13]).GetText();
                                                    // End:0x49e
                                                    if(t == MutatorModeStrings[0])
                                                    {
                                                        Browser.ViewMutator2Mode = 0;
                                                    }
                                                    // End:0x4e7
                                                    else
                                                    {
                                                        // End:0x4c4
                                                        if(t == MutatorModeStrings[2])
                                                        {
                                                            Browser.ViewMutator2Mode = 2;
                                                        }
                                                        // End:0x4e7
                                                        else
                                                        {
                                                            // End:0x4e7
                                                            if(t == MutatorModeStrings[3])
                                                            {
                                                                Browser.ViewMutator2Mode = 3;
                                                            }
                                                        }
                                                    }
                                                    UpdateMutatorVisibility();
                                                }
                                                // End:0x60a
                                                else
                                                {
                                                    // End:0x52b
                                                    if(Sender == Controls[14])
                                                    {
                                                        Browser.DesiredMutator2 = moComboBox(Controls[14]).GetExtra();
                                                    }
                                                    // End:0x60a
                                                    else
                                                    {
                                                        // End:0x59b
                                                        if(Sender == Controls[15])
                                                        {
                                                            // End:0x572
                                                            if(moNumericEdit(Controls[15]).GetValue() < 0)
                                                            {
                                                                moNumericEdit(Controls[15]).SetValue(0);
                                                            }
                                                            Browser.MinGamespeed = moNumericEdit(Controls[15]).GetValue();
                                                        }
                                                        // End:0x60a
                                                        else
                                                        {
                                                            // End:0x60a
                                                            if(Sender == Controls[16])
                                                            {
                                                                // End:0x5e4
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
    Controls=// Object reference not set to an instance of an object.
    
}