/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4GUIController.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:13
 *
 *******************************************************************************/
class UT2K4GUIController extends GUIController
    transient;

function ReturnToMainMenu()
{
    CloseAll(true);
    // End:0x1f
    if(MenuStack.Length == 0)
    {
        OpenMenu(GetMainMenuClass());
    }
}

function bool SetFocusTo(FloatingWindow Menu)
{
    local int i;

    // End:0x11
    if(ActivePage == Menu)
    {
        return true;
    }
    i = 0;
    J0x18:
    // End:0xe2 [While If]
    if(i < MenuStack.Length)
    {
        // End:0x41
        if(FloatingWindow(MenuStack[i]) == none)
        {
        }
        // End:0xd8
        else
        {
            // End:0xd8
            if(MenuStack[i] == Menu)
            {
                // End:0xad
                if(i + 1 < MenuStack.Length)
                {
                    MenuStack[i + 1].ParentPage = Menu.ParentPage;
                    Menu.ParentPage = MenuStack[MenuStack.Length - 1];
                }
                MenuStack[MenuStack.Length] = Menu;
                MenuStack.Remove(i, 1);
                ActivePage = Menu;
                return true;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x18;
    }
    return false;
}

event bool OpenMenu(string NewMenuName, optional string Param1, optional string Param2)
{
    // End:0xcb
    if(NewMenuName ~= class'GameEngine'.default.DisconnectMenuClass && InStr(Param1, "?closed") != -1 || InStr(Param1, "?failed") != -1 || InStr(Param1, "?disconnect") != -1)
    {
        // End:0xc3
        if(bModAuthor)
        {
            Log("Opening disconnect menu with failed, closed, or disconnect in URL", 'ModAuthor');
        }
        CloseAll(true, true);
    }
    return super.OpenMenu(NewMenuName, Param1, Param2);
}

static simulated event Validate()
{
    // End:0x13
    if(default.MainMenuOptions.Length < 7)
    {
        ResetConfig();
    }
}

static simulated function string GetSinglePlayerPage()
{
    Validate();
    return default.MainMenuOptions[0];
}

static simulated function string GetServerBrowserPage()
{
    Validate();
    return default.MainMenuOptions[1];
}

static simulated function string GetMultiplayerPage()
{
    Validate();
    return default.MainMenuOptions[2];
}

static simulated function string GetInstantActionPage()
{
    Validate();
    return default.MainMenuOptions[3];
}

static simulated function string GetModPage()
{
    Validate();
    return default.MainMenuOptions[4];
}

static simulated function string GetSettingsPage()
{
    Validate();
    return default.MainMenuOptions[5];
}

static simulated function string GetQuitPage()
{
    Validate();
    return default.MainMenuOptions[6];
}

function class<GUIComponent> AddComponentClass(string ClassName)
{
    local int i;
    local class<GUIComponent> cls;

    i = 0;
    J0x07:
    // End:0x44 [While If]
    if(i < RegisteredClasses.Length)
    {
        // End:0x3a
        if(string(RegisteredClasses[i]) ~= ClassName)
        {
            return RegisteredClasses[i];
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    cls = class<GUIComponent>(DynamicLoadObject(ClassName, class'Class'));
    // End:0x7c
    if(cls != none)
    {
        RegisteredClasses[RegisteredClasses.Length] = cls;
    }
    return cls;
}

function PurgeComponentClasses()
{
    // End:0x19
    if(RegisteredClasses.Length > 0)
    {
        RegisteredClasses.Remove(0, RegisteredClasses.Length);
    }
    super.PurgeComponentClasses();
}

defaultproperties
{
    FONT_NUM=11
    STYLE_NUM=67
    FontStack=// Object reference not set to an instance of an object.
    
    DefaultStyleNames=// Object reference not set to an instance of an object.
    
    AutoLoad=// Object reference not set to an instance of an object.
    
    MenuMouseSens=1.50
    MouseOverSound=Sound'Warfare_Sound_UI.Button.ui_button_over'
    ClickSound=Sound'Warfare_Sound_UI.Button.ui_button_click'
    EditSound=Sound'Warfare_Sound_UI.Button.ui_button_click'
    MainMenuOptions=// Object reference not set to an instance of an object.
    
    QuestionMenuClass="GUI2K4.GUI2K4QuestionPage"
}