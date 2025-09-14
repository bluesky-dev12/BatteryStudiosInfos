class WControlBinder extends WKeyBindMenu
    editinlinenew
    instanced;

var localized string BindLabl[150];

function LoadCommands()
{
    local int i;

    super.LoadCommands();
    i = 0;
    J0x0D:

    // End:0x36 [Loop If]
    if(i < Bindings.Length)
    {
        li_Binds.AddedItem();
        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

function MapBindings()
{
    LoadCustomBindings();
    super.MapBindings();
    //return;    
}

protected function LoadCustomBindings()
{
    local int i;
    local array<string> KeyBindClasses;
    local Class<GUIUserKeyBinding> CustomKeyBindClass;

    PlayerOwner().GetAllInt("XInterface.GUIUserKeyBinding", KeyBindClasses);
    i = 0;
    J0x37:

    // End:0x91 [Loop If]
    if(i < KeyBindClasses.Length)
    {
        CustomKeyBindClass = Class<GUIUserKeyBinding>(DynamicLoadObject(KeyBindClasses[i], Class'Core.Class'));
        // End:0x87
        if(CustomKeyBindClass != none)
        {
            AddCustomBindings(CustomKeyBindClass.default.KeyData);
        }
        i++;
        // [Loop Continue]
        goto J0x37;
    }
    //return;    
}

function AddCustomBindings(array<KeyInfo> KeyData)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x58 [Loop If]
    if(i < KeyData.Length)
    {
        CreateAliasMapping(KeyData[i].Alias, KeyData[i].KeyLabel, KeyData[i].bIsSection);
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function ClearBindings()
{
    local int i, Max;

    super.ClearBindings();
    Bindings = default.Bindings;
    Max = Min(Bindings.Length, 150);
    i = 0;
    J0x28:

    // End:0x6F [Loop If]
    if(i < Max)
    {
        // End:0x65
        if(BindLabl[i] != "")
        {
            Bindings[i].KeyLabel = BindLabl[i];
        }
        i++;
        // [Loop Continue]
        goto J0x28;
    }
    //return;    
}

defaultproperties
{
    BindLabl[0]="??? ??"
    BindLabl[1]="?? ??"
    BindLabl[2]="?? ??"
    BindLabl[3]="?? ??"
    BindLabl[4]="?? ??"
    BindLabl[5]="??"
    BindLabl[6]="??"
    BindLabl[7]="??"
    BindLabl[8]="?? ??"
    BindLabl[9]="??? ??"
    BindLabl[10]="???"
    BindLabl[11]="?? ??"
    BindLabl[12]="????"
    BindLabl[13]="???"
    Bindings[0]=(bIsSectionLabel=false,KeyLabel="Forward",Alias="MoveForward",BoundKeys=none,DefaultKey=87)
    Bindings[1]=(bIsSectionLabel=false,KeyLabel="Backward",Alias="MoveBackward",BoundKeys=none,DefaultKey=83)
    Bindings[2]=(bIsSectionLabel=false,KeyLabel="Strafe Left",Alias="StrafeLeft",BoundKeys=none,DefaultKey=65)
    Bindings[3]=(bIsSectionLabel=false,KeyLabel="Strafe Right",Alias="StrafeRight",BoundKeys=none,DefaultKey=68)
    Bindings[4]=(bIsSectionLabel=false,KeyLabel="Sprint",Alias="Walking",BoundKeys=none,DefaultKey=16)
    Bindings[5]=(bIsSectionLabel=false,KeyLabel="Jump",Alias="Jump",BoundKeys=none,DefaultKey=32)
    Bindings[6]=(bIsSectionLabel=false,KeyLabel="Crouch",Alias="Duck",BoundKeys=none,DefaultKey=67)
    Bindings[7]=(bIsSectionLabel=false,KeyLabel="Prone",Alias="Prone",BoundKeys=none,DefaultKey=17)
    Bindings[8]=(bIsSectionLabel=false,KeyLabel="Lean Left",Alias="LeanL",BoundKeys=none,DefaultKey=81)
    Bindings[9]=(bIsSectionLabel=false,KeyLabel="Lean Right",Alias="LeanR",BoundKeys=none,DefaultKey=69)
    Bindings[10]=(bIsSectionLabel=false,KeyLabel="Reload",Alias="WeaponReload",BoundKeys=none,DefaultKey=82)
    Bindings[11]=(bIsSectionLabel=false,KeyLabel="Melee Attack",Alias="MeleeAttack",BoundKeys=none,DefaultKey=86)
    Bindings[12]=(bIsSectionLabel=false,KeyLabel="Screenshot",Alias="shot",BoundKeys=none,DefaultKey=120)
    Bindings[13]=(bIsSectionLabel=false,KeyLabel="ScoreBoard",Alias="ScoreToggle",BoundKeys=none,DefaultKey=9)
    Headings="Action"
    PageCaption="Configure Keys"
}