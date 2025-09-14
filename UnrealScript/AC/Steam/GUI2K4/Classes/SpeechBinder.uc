/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\SpeechBinder.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:4
 *
 *******************************************************************************/
class SpeechBinder extends KeyBindMenu
    editinlinenew
    instanced;

var string VoiceType;
var class<TeamVoicePack> VoiceClass;
var export editinline UT2K4Tab_PlayerSettings tp_Player;
var transient bool bNoMatureLanguage;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local export editinline UT2K4SettingsPage Setting;

    super.InitComponent(MyController, myOwner);
    bNoMatureLanguage = MyController.ViewportOwner.Actor.bNoMatureLanguage;
    // End:0x164
    if(ParentPage != none && UT2K4SettingsPage(ParentPage) != none)
    {
        Setting = UT2K4SettingsPage(ParentPage);
        i = 0;
        J0x6c:
        // End:0x164 [While If]
        if(i < Setting.c_Tabs.TabStack.Length)
        {
            // End:0x15a
            if(Setting.c_Tabs.TabStack[i] != none && Setting.c_Tabs.TabStack[i].MyPanel != none && UT2K4Tab_PlayerSettings(Setting.c_Tabs.TabStack[i].MyPanel) != none)
            {
                tp_Player = UT2K4Tab_PlayerSettings(Setting.c_Tabs.TabStack[i].MyPanel);
                tp_Player.__VoiceTypeChanged__Delegate = VoiceChanged;
            }
            // End:0x164
            else
            {
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x6c;
            }
        }
    }
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
    CreateAliasMapping("", class'ExtendedConsole'.default.SMStateName[2], true);
    VoiceClass.static.GetAllAcks(VoiceCommands);
    i = 0;
    J0x4e:
    // End:0x8f [While If]
    if(i < VoiceCommands.Length)
    {
        CreateAliasMapping("speech ACK" @ string(i), VoiceCommands[i], false);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x4e;
    }
    CreateAliasMapping("", class'ExtendedConsole'.default.SMStateName[3], true);
    VoiceClass.static.GetAllFFire(VoiceCommands);
    i = 0;
    J0xc4:
    // End:0x10e [While If]
    if(i < VoiceCommands.Length)
    {
        CreateAliasMapping("speech FRIENDLYFIRE" @ string(i), VoiceCommands[i], false);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xc4;
    }
    CreateAliasMapping("", class'ExtendedConsole'.default.SMStateName[4], true);
    VoiceClass.static.GetAllOrder(VoiceCommands);
    i = 0;
    J0x143:
    // End:0x186 [While If]
    if(i < VoiceCommands.Length)
    {
        CreateAliasMapping("speech ORDER" @ string(i), VoiceCommands[i], false);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x143;
    }
    CreateAliasMapping("", class'ExtendedConsole'.default.SMStateName[5], true);
    VoiceClass.static.GetAllOther(VoiceCommands);
    i = 0;
    J0x1bb:
    // End:0x1fe [While If]
    if(i < VoiceCommands.Length)
    {
        CreateAliasMapping("speech OTHER" @ string(i), VoiceCommands[i], false);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1bb;
    }
    CreateAliasMapping("", class'ExtendedConsole'.default.SMStateName[6], true);
    VoiceClass.static.GetAllTaunt(VoiceCommands, bNoMatureLanguage);
    i = 0;
    J0x239:
    // End:0x27c [While If]
    if(i < VoiceCommands.Length)
    {
        CreateAliasMapping("speech TAUNT" @ string(i), VoiceCommands[i], false);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x239;
    }
}

function ResetVoiceClass()
{
    local PlayerController PC;

    PC = PlayerOwner();
    VoiceClass = none;
    VoiceType = "";
}

function VoiceChanged(string NewVoiceType)
{
    VoiceType = NewVoiceType;
}

defaultproperties
{
    Headings="???"
    PageCaption="??? ???"
}