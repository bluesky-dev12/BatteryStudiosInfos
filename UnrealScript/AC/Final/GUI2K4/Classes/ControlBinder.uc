class ControlBinder extends KeyBindMenu
    editinlinenew
    instanced;

var localized string BindingLabel[150];

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
        if(BindingLabel[i] != "")
        {
            Bindings[i].KeyLabel = BindingLabel[i];
        }
        i++;
        // [Loop Continue]
        goto J0x28;
    }
    //return;    
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
    BindingLabel[15]="?? \"3?? ??\""
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
    Bindings[0]=(bIsSectionLabel=true,KeyLabel="Movement",Alias="",BoundKeys=none)
    Bindings[1]=(bIsSectionLabel=false,KeyLabel="Forward",Alias="MoveForward",BoundKeys=none)
    Bindings[2]=(bIsSectionLabel=false,KeyLabel="Backward",Alias="MoveBackward",BoundKeys=none)
    Bindings[3]=(bIsSectionLabel=false,KeyLabel="Strafe Left",Alias="StrafeLeft",BoundKeys=none)
    Bindings[4]=(bIsSectionLabel=false,KeyLabel="Strafe Right",Alias="StrafeRight",BoundKeys=none)
    Bindings[5]=(bIsSectionLabel=false,KeyLabel="Jump",Alias="Jump",BoundKeys=none)
    Bindings[6]=(bIsSectionLabel=false,KeyLabel="Walk",Alias="Walking",BoundKeys=none)
    Bindings[7]=(bIsSectionLabel=false,KeyLabel="Crouch",Alias="Duck",BoundKeys=none)
    Bindings[8]=(bIsSectionLabel=false,KeyLabel="Strafe Toggle",Alias="Strafe",BoundKeys=none)
    Bindings[9]=(bIsSectionLabel=true,KeyLabel="Looking",Alias="",BoundKeys=none)
    Bindings[10]=(bIsSectionLabel=false,KeyLabel="Turn Left",Alias="TurnLeft",BoundKeys=none)
    Bindings[11]=(bIsSectionLabel=false,KeyLabel="Turn Right",Alias="TurnRight",BoundKeys=none)
    Bindings[12]=(bIsSectionLabel=false,KeyLabel="Look Up",Alias="LookUp",BoundKeys=none)
    Bindings[13]=(bIsSectionLabel=false,KeyLabel="Look Down",Alias="LookDown",BoundKeys=none)
    Bindings[14]=(bIsSectionLabel=false,KeyLabel="Center View",Alias="CenterView",BoundKeys=none)
    Bindings[15]=(bIsSectionLabel=false,KeyLabel="Toggle \"BehindView\"",Alias="ToggleBehindView",BoundKeys=none)
    Bindings[16]=(bIsSectionLabel=false,KeyLabel="Toggle Camera Mode",Alias="ToggleFreeCam",BoundKeys=none)
    Bindings[17]=(bIsSectionLabel=true,KeyLabel="Weapons",Alias="",BoundKeys=none)
    Bindings[18]=(bIsSectionLabel=false,KeyLabel="Fire",Alias="Fire",BoundKeys=none)
    Bindings[19]=(bIsSectionLabel=false,KeyLabel="Alt-Fire",Alias="AltFire",BoundKeys=none)
    Bindings[20]=(bIsSectionLabel=false,KeyLabel="Throw Weapon",Alias="ThrowWeapon",BoundKeys=none)
    Bindings[21]=(bIsSectionLabel=false,KeyLabel="Best Weapon",Alias="SwitchToBestWeapon",BoundKeys=none)
    Bindings[22]=(bIsSectionLabel=false,KeyLabel="Next Weapon",Alias="NextWeapon",BoundKeys=none)
    Bindings[23]=(bIsSectionLabel=false,KeyLabel="Prev Weapon",Alias="PrevWeapon",BoundKeys=none)
    Bindings[24]=(bIsSectionLabel=false,KeyLabel="Last Weapon",Alias="SwitchToLastWeapon",BoundKeys=none)
    Bindings[25]=(bIsSectionLabel=false,KeyLabel="Weapon Selection",Alias="",BoundKeys=none)
    Bindings[26]=(bIsSectionLabel=false,KeyLabel="Super Weapon",Alias="SwitchWeapon 0",BoundKeys=none)
    Bindings[27]=(bIsSectionLabel=false,KeyLabel="Shield Gun",Alias="SwitchWeapon 1",BoundKeys=none)
    Bindings[28]=(bIsSectionLabel=false,KeyLabel="Assault Rifle",Alias="SwitchWeapon 2",BoundKeys=none)
    Bindings[29]=(bIsSectionLabel=false,KeyLabel="Bio-Rifle",Alias="SwitchWeapon 3",BoundKeys=none)
    Bindings[30]=(bIsSectionLabel=false,KeyLabel="Shock Rifle",Alias="SwitchWeapon 4",BoundKeys=none)
    Bindings[31]=(bIsSectionLabel=false,KeyLabel="Link Gun",Alias="SwitchWeapon 5",BoundKeys=none)
    Bindings[32]=(bIsSectionLabel=false,KeyLabel="Minigun",Alias="SwitchWeapon 6",BoundKeys=none)
    Bindings[33]=(bIsSectionLabel=false,KeyLabel="Flak Cannon",Alias="SwitchWeapon 7",BoundKeys=none)
    Bindings[34]=(bIsSectionLabel=false,KeyLabel="Rocket Launcher",Alias="SwitchWeapon 8",BoundKeys=none)
    Bindings[35]=(bIsSectionLabel=false,KeyLabel="Lightning Rifle",Alias="SwitchWeapon 9",BoundKeys=none)
    Bindings[36]=(bIsSectionLabel=false,KeyLabel="Translocator",Alias="SwitchWeapon 10",BoundKeys=none)
    Bindings[37]=(bIsSectionLabel=true,KeyLabel="Communication",Alias="",BoundKeys=none)
    Bindings[38]=(bIsSectionLabel=false,KeyLabel="Say",Alias="Talk",BoundKeys=none)
    Bindings[39]=(bIsSectionLabel=false,KeyLabel="Team Say",Alias="TeamTalk",BoundKeys=none)
    Bindings[40]=(bIsSectionLabel=false,KeyLabel="In Game Chat",Alias="InGameChat",BoundKeys=none)
    Bindings[41]=(bIsSectionLabel=false,KeyLabel="Speech Menu",Alias="SpeechMenuToggle",BoundKeys=none)
    Bindings[42]=(bIsSectionLabel=false,KeyLabel="Activate Microphone",Alias="VoiceTalk",BoundKeys=none)
    Bindings[43]=(bIsSectionLabel=false,KeyLabel="Speak in Public Channel",Alias="Speak Public",BoundKeys=none)
    Bindings[44]=(bIsSectionLabel=false,KeyLabel="Speak in local Channel",Alias="Speak Local",BoundKeys=none)
    Bindings[45]=(bIsSectionLabel=false,KeyLabel="Speak in Team Channel",Alias="Speak Team",BoundKeys=none)
    Bindings[46]=(bIsSectionLabel=false,KeyLabel="Toggle Public Chatroom",Alias="TogglePublicChat",BoundKeys=none)
    Bindings[47]=(bIsSectionLabel=false,KeyLabel="Toggle Local Chatroom",Alias="ToggleLocalChat",BoundKeys=none)
    Bindings[48]=(bIsSectionLabel=false,KeyLabel="Toggle Team Chatroom",Alias="ToggleTeamChat",BoundKeys=none)
    Bindings[49]=(bIsSectionLabel=true,KeyLabel="Taunts",Alias="",BoundKeys=none)
    Bindings[50]=(bIsSectionLabel=false,KeyLabel="Pelvic Thrust",Alias="taunt pthrust",BoundKeys=none)
    Bindings[51]=(bIsSectionLabel=false,KeyLabel="Ass Smack",Alias="taunt asssmack",BoundKeys=none)
    Bindings[52]=(bIsSectionLabel=false,KeyLabel="Throat Cut",Alias="taunt throatcut",BoundKeys=none)
    Bindings[53]=(bIsSectionLabel=false,KeyLabel="Brag",Alias="taunt gesture_point",BoundKeys=none)
    Bindings[54]=(bIsSectionLabel=true,KeyLabel="Hud",Alias="",BoundKeys=none)
    Bindings[55]=(bIsSectionLabel=false,KeyLabel="Grow Hud",Alias="GrowHud",BoundKeys=none)
    Bindings[56]=(bIsSectionLabel=false,KeyLabel="Shrink Hud",Alias="ShrinkHud",BoundKeys=none)
    Bindings[57]=(bIsSectionLabel=false,KeyLabel="Show Radar Map",Alias="ToggleRadarMap",BoundKeys=none)
    Bindings[58]=(bIsSectionLabel=false,KeyLabel="ScoreBoard",Alias="ShowScores",BoundKeys=none)
    Bindings[59]=(bIsSectionLabel=false,KeyLabel="ScoreBoard (QuickView)",Alias="ScoreToggle",BoundKeys=none)
    Bindings[60]=(bIsSectionLabel=true,KeyLabel="Game",Alias="",BoundKeys=none)
    Bindings[61]=(bIsSectionLabel=false,KeyLabel="Use",Alias="use",BoundKeys=none)
    Bindings[62]=(bIsSectionLabel=false,KeyLabel="Pause",Alias="Pause",BoundKeys=none)
    Bindings[63]=(bIsSectionLabel=false,KeyLabel="Screenshot",Alias="shot",BoundKeys=none)
    Bindings[64]=(bIsSectionLabel=false,KeyLabel="Find Red Base",Alias="basepath 0",BoundKeys=none)
    Bindings[65]=(bIsSectionLabel=false,KeyLabel="Find Blue Base",Alias="basepath 1",BoundKeys=none)
    Bindings[66]=(bIsSectionLabel=false,KeyLabel="Next Inventory Item",Alias="InventoryNext",BoundKeys=none)
    Bindings[67]=(bIsSectionLabel=false,KeyLabel="Previous Inventory Item",Alias="InventoryPrevious",BoundKeys=none)
    Bindings[68]=(bIsSectionLabel=false,KeyLabel="Activate Current Inventory Item",Alias="InventoryActivate",BoundKeys=none)
    Bindings[69]=(bIsSectionLabel=false,KeyLabel="Show Personal Stats",Alias="ShowStats",BoundKeys=none)
    Bindings[70]=(bIsSectionLabel=false,KeyLabel="View Next Player's Stats",Alias="NextStats",BoundKeys=none)
    Bindings[71]=(bIsSectionLabel=false,KeyLabel="Server Info",Alias="ServerInfo",BoundKeys=none)
    Bindings[72]=(bIsSectionLabel=false,KeyLabel="Vehicle Horn",Alias="playvehiclehorn 0",BoundKeys=none)
    Bindings[73]=(bIsSectionLabel=true,KeyLabel="Miscellaneous",Alias="",BoundKeys=none)
    Bindings[74]=(bIsSectionLabel=false,KeyLabel="Menu",Alias="ShowMenu",BoundKeys=none)
    Bindings[75]=(bIsSectionLabel=false,KeyLabel="Music Player",Alias="MusicMenu",BoundKeys=none)
    Bindings[76]=(bIsSectionLabel=false,KeyLabel="Voting Menu",Alias="ShowVoteMenu",BoundKeys=none)
    Bindings[77]=(bIsSectionLabel=false,KeyLabel="Toggle Console",Alias="ConsoleToggle",BoundKeys=none)
    Bindings[78]=(bIsSectionLabel=false,KeyLabel="View Connection Status",Alias="Stat Net",BoundKeys=none)
    Bindings[79]=(bIsSectionLabel=false,KeyLabel="Cancel Pending Connection",Alias="Cancel",BoundKeys=none)
    Headings="??"
    PageCaption="? ??"
}