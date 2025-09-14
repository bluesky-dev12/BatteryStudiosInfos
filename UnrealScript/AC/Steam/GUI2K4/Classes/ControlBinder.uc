/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\ControlBinder.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:5
 *
 *******************************************************************************/
class ControlBinder extends KeyBindMenu
    editinlinenew
    instanced;

var localized string BindingLabel[150];

function LoadCommands()
{
    local int i;

    super.LoadCommands();
    i = 0;
    J0x0d:
    // End:0x36 [While If]
    if(i < Bindings.Length)
    {
        li_Binds.AddedItem();
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0d;
    }
}

function MapBindings()
{
    LoadCustomBindings();
    super.MapBindings();
}

protected function LoadCustomBindings()
{
    local int i;
    local array<string> KeyBindClasses;
    local class<GUIUserKeyBinding> CustomKeyBindClass;

    PlayerOwner().GetAllInt("XInterface.GUIUserKeyBinding", KeyBindClasses);
    i = 0;
    J0x37:
    // End:0x91 [While If]
    if(i < KeyBindClasses.Length)
    {
        CustomKeyBindClass = class<GUIUserKeyBinding>(DynamicLoadObject(KeyBindClasses[i], class'Class'));
        // End:0x87
        if(CustomKeyBindClass != none)
        {
            AddCustomBindings(CustomKeyBindClass.default.KeyData);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x37;
    }
}

function AddCustomBindings(array<KeyInfo> KeyData)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x58 [While If]
    if(i < KeyData.Length)
    {
        CreateAliasMapping(KeyData[i].Alias, KeyData[i].KeyLabel, KeyData[i].bIsSection);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function ClearBindings()
{
    local int i, Max;

    super.ClearBindings();
    Bindings = default.Bindings;
    Max = Min(Bindings.Length, 150);
    i = 0;
    J0x28:
    // End:0x6f [While If]
    if(i < Max)
    {
        // End:0x65
        if(BindingLabel[i] != "")
        {
            Bindings[i].KeyLabel = BindingLabel[i];
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x28;
    }
}

defaultproperties
{
    BindingLabel[0]="???"
    BindingLabel[1]="??? ??"
    BindingLabel[2]="?? ??"
    BindingLabel[3]="?? ??"
    BindingLabel[4]="?? ??"
    BindingLabel[5]="??"
    BindingLabel[6]="???"
    BindingLabel[7]="????"
    BindingLabel[8]="?? ??"
    BindingLabel[9]="??"
    BindingLabel[10]="?? ??"
    BindingLabel[11]="??? ??"
    BindingLabel[12]="?? ??"
    BindingLabel[13]="??? ??"
    BindingLabel[14]="?? ??"
    BindingLabel[15]="?? "3?? ??""
    BindingLabel[16]="?? ??? ??"
    BindingLabel[17]="??"
    BindingLabel[18]="??"
    BindingLabel[19]="?? ??"
    BindingLabel[20]="?? ???"
    BindingLabel[21]="?? ?? ??"
    BindingLabel[22]="?? ??"
    BindingLabel[23]="?? ??"
    BindingLabel[24]="??? ??"
    BindingLabel[25]="?? ??"
    BindingLabel[26]="?? ??"
    BindingLabel[27]="?? ?"
    BindingLabel[28]="??? ???"
    BindingLabel[29]="??? ???"
    BindingLabel[30]="?? ???"
    BindingLabel[31]="?? ?"
    BindingLabel[32]="???"
    BindingLabel[33]="?? ??"
    BindingLabel[34]="?? ??"
    BindingLabel[35]="???? ???"
    BindingLabel[36]="???????"
    BindingLabel[37]="??????"
    BindingLabel[38]="???"
    BindingLabel[39]="??? ???"
    BindingLabel[40]="????? ??"
    BindingLabel[41]="??? ??"
    BindingLabel[42]="????? ??"
    BindingLabel[43]="??? ???? ???"
    BindingLabel[44]="?? ???? ???"
    BindingLabel[45]="? ???? ???"
    BindingLabel[46]="?? ??? ??"
    BindingLabel[47]="?? ?? ??"
    BindingLabel[48]="?? ? ??"
    BindingLabel[49]="??"
    BindingLabel[50]="?? ???"
    BindingLabel[51]="??? ???"
    BindingLabel[52]="? ??"
    BindingLabel[53]="??"
    BindingLabel[54]="Hud ??"
    BindingLabel[55]="Hud ?? ??"
    BindingLabel[56]="Hud ?? ??"
    BindingLabel[57]="??? ? ??"
    BindingLabel[58]="????? ??"
    BindingLabel[59]="?????"
    BindingLabel[60]="??"
    BindingLabel[61]="??"
    BindingLabel[62]="?? ??"
    BindingLabel[63]="????"
    BindingLabel[64]="?? ?? ??"
    BindingLabel[65]="?? ?? ??"
    BindingLabel[66]="?? ?? ??"
    BindingLabel[67]="?? ?? ??"
    BindingLabel[68]="?? ???? ?? ??"
    BindingLabel[69]="?? ?? ??"
    BindingLabel[70]="?? ???? ?? ??"
    BindingLabel[71]="?? ??"
    BindingLabel[72]="?? ??"
    BindingLabel[73]="? ??"
    BindingLabel[74]="??"
    BindingLabel[75]="??? ????"
    BindingLabel[76]="?? ??"
    BindingLabel[77]="?? ??"
    BindingLabel[78]="?? ?? ??"
    BindingLabel[79]="???? ?? ?? "
    Bindings=// Object reference not set to an instance of an object.
    
    Headings="??"
    PageCaption="? ??"
}