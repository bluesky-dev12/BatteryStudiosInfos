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
    //return;    
}

function ResetVoiceClass()
{
    local PlayerController PC;

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