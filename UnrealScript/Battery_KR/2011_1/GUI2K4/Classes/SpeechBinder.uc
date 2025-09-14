class SpeechBinder extends KeyBindMenu
    editinlinenew
    instanced;

var string VoiceType;
var Class<TeamVoicePack> VoiceClass;
var export editinline UT2K4Tab_PlayerSettings tp_Player;
var transient bool bNoMatureLanguage;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local export editinline UT2K4SettingsPage Setting;

    super.InitComponent(MyController, myOwner);
    bNoMatureLanguage = MyController.ViewportOwner.Actor.bNoMatureLanguage;
    // End:0x164
    if((ParentPage != none) && UT2K4SettingsPage(ParentPage) != none)
    {
        Setting = UT2K4SettingsPage(ParentPage);
        i = 0;
        J0x6C:

        // End:0x164 [Loop If]
        if(i < Setting.c_Tabs.TabStack.Length)
        {
            // End:0x15A
            if(((Setting.c_Tabs.TabStack[i] != none) && Setting.c_Tabs.TabStack[i].MyPanel != none) && UT2K4Tab_PlayerSettings(Setting.c_Tabs.TabStack[i].MyPanel) != none)
            {
                tp_Player = UT2K4Tab_PlayerSettings(Setting.c_Tabs.TabStack[i].MyPanel);
                tp_Player.__VoiceTypeChanged__Delegate = VoiceChanged;
                // [Explicit Break]
                goto J0x164;
            }
            i++;
            // [Loop Continue]
            goto J0x6C;
        }
    }
    J0x164:

    //return;    
}

function LoadCommands()
{
    local int i;
    local array<string> VoiceCommands;

    super.LoadCommands();
    ResetVoiceClass();
    // End:0x19
    if(VoiceClass == none)
    {
        return;
    }
    CreateAliasMapping("", Class'XInterface.ExtendedConsole'.default.SMStateName[2], true);
    VoiceClass.static.GetAllAcks(VoiceCommands);
    i = 0;
    J0x4E:

    // End:0x8F [Loop If]
    if(i < VoiceCommands.Length)
    {
        CreateAliasMapping("speech ACK" @ string(i), VoiceCommands[i], false);
        i++;
        // [Loop Continue]
        goto J0x4E;
    }
    CreateAliasMapping("", Class'XInterface.ExtendedConsole'.default.SMStateName[3], true);
    VoiceClass.static.GetAllFFire(VoiceCommands);
    i = 0;
    J0xC4:

    // End:0x10E [Loop If]
    if(i < VoiceCommands.Length)
    {
        CreateAliasMapping("speech FRIENDLYFIRE" @ string(i), VoiceCommands[i], false);
        i++;
        // [Loop Continue]
        goto J0xC4;
    }
    CreateAliasMapping("", Class'XInterface.ExtendedConsole'.default.SMStateName[4], true);
    VoiceClass.static.GetAllOrder(VoiceCommands);
    i = 0;
    J0x143:

    // End:0x186 [Loop If]
    if(i < VoiceCommands.Length)
    {
        CreateAliasMapping("speech ORDER" @ string(i), VoiceCommands[i], false);
        i++;
        // [Loop Continue]
        goto J0x143;
    }
    CreateAliasMapping("", Class'XInterface.ExtendedConsole'.default.SMStateName[5], true);
    VoiceClass.static.GetAllOther(VoiceCommands);
    i = 0;
    J0x1BB:

    // End:0x1FE [Loop If]
    if(i < VoiceCommands.Length)
    {
        CreateAliasMapping("speech OTHER" @ string(i), VoiceCommands[i], false);
        i++;
        // [Loop Continue]
        goto J0x1BB;
    }
    CreateAliasMapping("", Class'XInterface.ExtendedConsole'.default.SMStateName[6], true);
    VoiceClass.static.GetAllTaunt(VoiceCommands, bNoMatureLanguage);
    i = 0;
    J0x239:

    // End:0x27C [Loop If]
    if(i < VoiceCommands.Length)
    {
        CreateAliasMapping("speech TAUNT" @ string(i), VoiceCommands[i], false);
        i++;
        // [Loop Continue]
        goto J0x239;
    }
    //return;    
}

function ResetVoiceClass()
{
    local PlayerController PC;
    local string CharString;
    local PlayerRecord Rec;

    PC = PlayerOwner();
    VoiceClass = none;
    VoiceType = "";
    //return;    
}

function VoiceChanged(string NewVoiceType)
{
    VoiceType = NewVoiceType;
    //return;    
}

defaultproperties
{
    Headings="???"
    PageCaption="??? ???"
}