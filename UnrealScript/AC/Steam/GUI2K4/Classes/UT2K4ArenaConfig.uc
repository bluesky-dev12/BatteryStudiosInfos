/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4ArenaConfig.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:2
 *
 *******************************************************************************/
class UT2K4ArenaConfig extends BlackoutWindow
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moComboBox co_Weapon;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_OK;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel l_Title;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local array<WeaponRecord> Recs;
    local int i;

    super(GUIPage).InitComponent(MyController, myOwner);
    class'CacheManager'.static.GetWeaponList(Recs);
    i = 0;
    J0x28:
    // End:0x72 [While If]
    if(i < Recs.Length)
    {
        co_Weapon.AddItem(Recs[i].FriendlyName, none, Recs[i].ClassName);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x28;
    }
    co_Weapon.ReadOnly(true);
    // End:0xa5
    if(i != -1)
    {
        co_Weapon.SetIndex(i);
    }
}

function bool InternalOnClick(GUIComponent Sender)
{
    Controller.CloseMenu(false);
    return true;
}

defaultproperties
{
    begin object name=WeaponSelect class=moComboBox
        bReadOnly=true
        bVerticalLayout=true
        LabelJustification=1
        ComponentJustification=1
        ComponentWidth=0.250
        Caption="????? ??? ??? ?????"
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.442760
        WinLeft=0.2550780
        WinWidth=0.5007820
        WinHeight=0.1265630
        TabOrder=0
        bStandardized=true
    object end
    // Reference: moComboBox'UT2K4ArenaConfig.WeaponSelect'
    co_Weapon=WeaponSelect
    begin object name=OkButton class=GUIButton
        Caption="??"
        WinTop=0.5633330
        WinLeft=0.40
        WinWidth=0.20
        TabOrder=1
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4ArenaConfig.OkButton'
    b_OK=OkButton
    begin object name=DialogText class=GUILabel
        Caption="?? ???"
        TextAlign=1
        FontScale=2
        StyleName="TextLabel"
        WinTop=0.3916670
        WinHeight=0.058750
    object end
    // Reference: GUILabel'UT2K4ArenaConfig.DialogText'
    l_Title=DialogText
}