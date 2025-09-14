class UT2K4GUIController extends GUIController
    transient;

function ReturnToMainMenu()
{
    CloseAll(true);
    // End:0x1F
    if(MenuStack.Length == 0)
    {
        OpenMenu(GetMainMenuClass());
    }
    //return;    
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

    // End:0xE2 [Loop If]
    if(i < MenuStack.Length)
    {
        // End:0x41
        if(FloatingWindow(MenuStack[i]) == none)
        {
            // [Explicit Continue]
            goto J0xD8;
        }
        // End:0xD8
        if(MenuStack[i] == Menu)
        {
            // End:0xAD
            if((i + 1) < MenuStack.Length)
            {
                MenuStack[i + 1].ParentPage = Menu.ParentPage;
                Menu.ParentPage = MenuStack[MenuStack.Length - 1];
            }
            MenuStack[MenuStack.Length] = Menu;
            MenuStack.Remove(i, 1);
            ActivePage = Menu;
            return true;
        }
        J0xD8:

        i++;
        // [Loop Continue]
        goto J0x18;
    }
    return false;
    //return;    
}

event bool OpenMenu(string NewMenuName, optional string Param1, optional string Param2)
{
    // End:0xCB
    if((NewMenuName ~= Class'Engine.GameEngine'.default.DisconnectMenuClass) && ((InStr(Param1, "?closed") != -1) || InStr(Param1, "?failed") != -1) || InStr(Param1, "?disconnect") != -1)
    {
        // End:0xC3
        if(bModAuthor)
        {
            Log("Opening disconnect menu with failed, closed, or disconnect in URL", 'ModAuthor');
        }
        CloseAll(true, true);
    }
    return super.OpenMenu(NewMenuName, Param1, Param2);
    //return;    
}

static simulated event Validate()
{
    // End:0x13
    if(default.MainMenuOptions.Length < 7)
    {
        ResetConfig();
    }
    //return;    
}

static simulated function string GetSinglePlayerPage()
{
    Validate();
    return default.MainMenuOptions[0];
    //return;    
}

static simulated function string GetServerBrowserPage()
{
    Validate();
    return default.MainMenuOptions[1];
    //return;    
}

static simulated function string GetMultiplayerPage()
{
    Validate();
    return default.MainMenuOptions[2];
    //return;    
}

static simulated function string GetInstantActionPage()
{
    Validate();
    return default.MainMenuOptions[3];
    //return;    
}

static simulated function string GetModPage()
{
    Validate();
    return default.MainMenuOptions[4];
    //return;    
}

static simulated function string GetSettingsPage()
{
    Validate();
    return default.MainMenuOptions[5];
    //return;    
}

static simulated function string GetQuitPage()
{
    Validate();
    return default.MainMenuOptions[6];
    //return;    
}

function Class<GUIComponent> AddComponentClass(string ClassName)
{
    local int i;
    local Class<GUIComponent> cls;

    i = 0;
    J0x07:

    // End:0x44 [Loop If]
    if(i < RegisteredClasses.Length)
    {
        // End:0x3A
        if(string(RegisteredClasses[i]) ~= ClassName)
        {
            return RegisteredClasses[i];
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    cls = Class<GUIComponent>(DynamicLoadObject(ClassName, Class'Core.Class'));
    // End:0x7C
    if(cls != none)
    {
        RegisteredClasses[RegisteredClasses.Length] = cls;
    }
    return cls;
    //return;    
}

function PurgeComponentClasses()
{
    // End:0x19
    if(RegisteredClasses.Length > 0)
    {
        RegisteredClasses.Remove(0, RegisteredClasses.Length);
    }
    super.PurgeComponentClasses();
    //return;    
}

defaultproperties
{
    FONT_NUM=11
    STYLE_NUM=67
    FontStack=/* Array type was not detected. */
    DefaultStyleNames=/* Array type was not detected. */
    AutoLoad=/* Array type was not detected. */
    MenuMouseSens=1.5000000
    MouseOverSound="Warfare_Sound_UI/Button/over"
    ClickSound="Warfare_Sound_UI/Button/click"
    EditSound="Warfare_Sound_UI/Button/click"
    MainMenuOptions=/* Array type was not detected. */
    QuestionMenuClass="GUI2K4.GUI2K4QuestionPage"
}