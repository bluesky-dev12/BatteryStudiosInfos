class UT2K4ArenaConfig extends BlackoutWindow
    editinlinenew
    instanced;

var() automated moComboBox co_Weapon;
var() automated GUIButton b_OK;
var() automated GUILabel l_Title;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local array<WeaponRecord> Recs;
    local int i;

    super(GUIPage).InitComponent(MyController, myOwner);
    Class'Engine.CacheManager'.static.GetWeaponList(Recs);
    i = 0;
    J0x28:

    // End:0x72 [Loop If]
    if(i < Recs.Length)
    {
        co_Weapon.AddItem(Recs[i].FriendlyName, none, Recs[i].ClassName);
        i++;
        // [Loop Continue]
        goto J0x28;
    }
    co_Weapon.ReadOnly(true);
    // End:0xA5
    if(i != -1)
    {
        co_Weapon.SetIndex(i);
    }
    //return;    
}

function bool InternalOnClick(GUIComponent Sender)
{
    Controller.CloseMenu(false);
    return true;
    //return;    
}

defaultproperties
{
    // Reference: moComboBox'GUI2K4_Decompressed.UT2K4ArenaConfig.WeaponSelect'
    begin object name="WeaponSelect" class=XInterface.moComboBox
        bReadOnly=true
        bVerticalLayout=true
        LabelJustification=1
        ComponentJustification=1
        ComponentWidth=0.2500000
        Caption="????? ??? ??? ?????"
        OnCreateComponent=WeaponSelect.InternalOnCreateComponent
        WinTop=0.4427600
        WinLeft=0.2550780
        WinWidth=0.5007820
        WinHeight=0.1265630
        TabOrder=0
        bStandardized=false
    end object
    co_Weapon=WeaponSelect
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4ArenaConfig.OkButton'
    begin object name="OkButton" class=XInterface.GUIButton
        Caption="??"
        WinTop=0.5633330
        WinLeft=0.4000000
        WinWidth=0.2000000
        TabOrder=1
        OnClick=UT2K4ArenaConfig.InternalOnClick
        OnKeyEvent=OkButton.InternalOnKeyEvent
    end object
    b_OK=OkButton
    // Reference: GUILabel'GUI2K4_Decompressed.UT2K4ArenaConfig.DialogText'
    begin object name="DialogText" class=XInterface.GUILabel
        Caption="?? ???"
        TextAlign=1
        FontScale=2
        StyleName="TextLabel"
        WinTop=0.3916670
        WinHeight=0.0587500
    end object
    l_Title=DialogText
}