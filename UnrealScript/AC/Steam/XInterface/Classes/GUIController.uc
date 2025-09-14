/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\GUIController.uc
 * Package Imports:
 *	XInterface
 *	Engine
 *	Core
 *
 * Stats:
 *	Constants:1
 *	Structs:5
 *	Properties:113
 *	Functions:93
 *
 *******************************************************************************/
class GUIController extends BaseGUIController
    dependson(GUIQuestionPage)
    dependson(GUIPage)
    dependson(GUIStyles)
    dependson(GUIFont)
    native
    transient
    abstract;

const DoCounter = 1;

struct native ProfileStruct
{
    var string ProfileName;
    var float ProfileSeconds;
};

struct native eOwnageMap
{
    var int RLevel;
    var string MapName;
    var string MapDesc;
    var string MapURL;
};

struct native AutoLoadMenu
{
    var string MenuClassName;
    var bool bPreInitialize;
};

struct native init RestoreMenuItem
{
    var() string MenuClassName;
    var() string Param1;
    var() string Param2;
};

struct native DesignModeHint
{
    var() localized string key;
    var() localized string Description;
};

var export editinline GUIPage SaveFadeOutPage;
var bool bSaveCancelled;
var BTTcpLink_Channel TcpHandler;
var const int FONT_NUM;
var const int STYLE_NUM;
var const int CURSOR_NUM;
var array<ProfileStruct> Profilers;
var const FloatBox MouseCursorBounds;
var editinline array<editinline Vector> MouseCursorOffset;
var export editinline array<export editinline GUIPage> MenuStack;
var array<export editinline GUIPage> PersistentStack;
var editinline array<export editinline GUIFont> FontStack;
var array<export editinline GUIStyles> StyleStack;
var editinline array<editinline Material> MouseCursors;
var array<Material> ImageList;
var array<string> DefaultStyleNames;
var array<string> StyleNames;
var array<AutoLoadMenu> AutoLoad;
var array<RestoreMenuItem> RestoreMenus;
var array<DesignModeHint> DesignModeHints;
var float MenuMouseSens;
var float MouseX;
var float MouseY;
var float LastMouseX;
var float LastMouseY;
var float DblClickWindow;
var float LastClickTime;
var float ButtonRepeatDelay;
var float RepeatDelta;
var float RepeatTime;
var float CursorFade;
var float FastCursorFade;
var int MaxSimultaneousPings;
var int FastCursorStep;
var const int ResX;
var const int ResY;
var int LastClickX;
var int LastClickY;
var int CursorStep;
var private const transient pointer Designer;
var private const transient pointer PawnDesigner;
var private const transient pointer WeaponDesigner;
var Sound MouseOverSound;
var Sound ClickSound;
var Sound EditSound;
var Sound UpSound;
var Sound DownSound;
var Sound DragSound;
var Sound FadeSound;
var Sound ItemEquipSuccessSound;
var Sound ItemEquipFailSound;
var Sound ItemTakeoffSound;
var Sound ItemAddPartsSound;
var Sound ItemRepairSound;
var Sound ItemClickSound;
var Sound ItemBuySound;
var Sound ItemSellSound;
var Sound TrophyWindowSound;
var Sound TrophyReceiverUserSound;
var export editinline GUIPage ActivePage;
var export editinline GUIComponent FocusedControl;
var export editinline GUIComponent ActiveControl;
var export editinline deprecated GUIComponent SkipControl;
var export editinline GUIComponent MoveControl;
var export editinline GUIComponent DropSource;
var export editinline GUIComponent DropTarget;
var export editinline GUIContextMenu ContextMenu;
var export editinline GUIToolTip MouseOver;
var Material WhiteBorder;
var string GameResolution;
var transient string LastGameType;
var string RequestDataMenu;
var string ArrayPropertyMenu;
var string DynArrayPropertyMenu;
var string FilterMenu;
var string MapVotingMenu;
var string KickVotingMenu;
var string MatchSetupMenu;
var string EditFavoriteMenu;
var array<string> MainMenuOptions;
var string DesignerMenu;
var byte RepeatKey;
var bool bIgnoreNextRelease;
var bool ShiftPressed;
var bool AltPressed;
var bool CtrlPressed;
var bool bModulateStackedMenus;
var bool bQuietMenu;
var bool bNoToolTips;
var bool bDesignModeToolTips;
var bool bAutoRefreshBrowser;
var bool bModAuthor;
var bool bExpertMode;
var bool bDesignMode;
var bool bInteractiveMode;
var bool bHighlightCurrent;
var bool bDrawFullPaths;
var bool MainNotWanted;
var bool bCurMenuInitialized;
var bool bForceMouseCheck;
var bool bIgnoreUntilPress;
var bool bSnapCursor;
var float RenderDelta;
var float LastRenderTime;
var bool bFixedMouseSize;
var const byte KeyDown[255];
var array< class<GUIComponent> > RegisteredClasses;
var bool bECEEdition;
var int iTempWeaponId;
var array<export editinline GUIPage> SavedPage;
var delegate<OnNeedRawKeyPress> __OnNeedRawKeyPress__Delegate;
var delegate<AddBuddy> __AddBuddy__Delegate;
var delegate<PressedCloseWndBtn> __PressedCloseWndBtn__Delegate;

function PushPage()
{
    local int i;

    Log("[GUIController::PushPage] Start MenuStackCount=" $ string(Count()));
    SavedPage.Length = Count();
    i = 0;
    J0x51:
    // End:0x82 [While If]
    if(i < Count())
    {
        SavedPage[i] = GetMenuByIndex(i);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x51;
    }
    Log("[GUIController::PushPage] End MenuStackCount=" $ string(Count()));
}

function PopPage()
{
    local int i, j;

    Log("[GUIController::PopPage] Start MenuStackCount=" $ string(Count()));
    i = 0;
    J0x43:
    // End:0xbf [While If]
    if(i < Count())
    {
        j = 0;
        J0x5a:
        // End:0x92 [While If]
        if(j < SavedPage.Length)
        {
            // End:0x88
            if(GetMenuByIndex(i) == SavedPage[j])
            {
            }
            // End:0x92
            else
            {
                ++ j;
                // This is an implied JumpToken; Continue!
                goto J0x5a;
            }
        }
        // End:0xb5
        if(j == SavedPage.Length)
        {
            RemoveMenuAt(i, false);
            -- i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x43;
    }
    Log("[GUIController::PopPage] End MenuStackCount=" $ string(Count()));
}

delegate bool OnNeedRawKeyPress(byte NewKey);
delegate AddBuddy(optional string NewBuddyName);
// Export UGUIController::execGetMenuFont(FFrame&, void* const)
native event GUIFont GetMenuFont(string FontName);
// Export UGUIController::execGetStyle(FFrame&, void* const)
native event GUIStyles GetStyle(string StyleName, out GUI.eFontScale FontScale);
// Export UGUIController::execGetCurrentRes(FFrame&, void* const)
native final function string GetCurrentRes();
// Export UGUIController::execSetRenderDevice(FFrame&, void* const)
native final function bool SetRenderDevice(string NewRenderDevice);
// Export UGUIController::execResetDesigner(FFrame&, void* const)
private native final function ResetDesigner();
// Export UGUIController::execResetInput(FFrame&, void* const)
native final function ResetInput();
// Export UGUIController::execGetProfileList(FFrame&, void* const)
native final function GetProfileList(string Prefix, out array<string> ProfileList);
// Export UGUIController::execResetKeyboard(FFrame&, void* const)
native final function ResetKeyboard();
// Export UGUIController::execGetOGGList(FFrame&, void* const)
native final function GetOGGList(out array<string> OGGFiles);
// Export UGUIController::execPlayInterfaceSound(FFrame&, void* const)
native final function PlayInterfaceSound(GUIComponent.EClickSound soundType);
// Export UGUIController::execSetMoveControl(FFrame&, void* const)
native final function SetMoveControl(GUIComponent C);
// Export UGUIController::execProfile(FFrame&, void* const)
native function Profile(string ProfileName);
// Export UGUIController::execGetDEMList(FFrame&, void* const)
native function GetDEMList(out array<string> DEMFiles);
// Export UGUIController::execGetDEMHeader(FFrame&, void* const)
native function bool GetDEMHeader(string DemoName, out string MapName, out string GameType, out int ScoreLimit, out int TimeLimit, out int ClientSide, out string RecordedBy, out string TimeStamp, out string ReqPackages);
// Export UGUIController::execGetOwnageList(FFrame&, void* const)
native function GetOwnageList(out array<int> RLevel, out array<string> MNames, out array<string> MDesc, out array<string> mURL);
// Export UGUIController::execSaveOwnageList(FFrame&, void* const)
native function SaveOwnageList(array<eOwnageMap> Maps);
// Export UGUIController::execGetWeaponList(FFrame&, void* const)
native final function GetWeaponList(out array< class<wWeapon> > WeaponClass, out array<string> WeaponDesc);
// Export UGUIController::execGetMapList(FFrame&, void* const)
native final function GetMapList(string Prefix, GUIList List, optional bool bDecoText);
// Export UGUIController::execLaunchURL(FFrame&, void* const)
native function LaunchURL(string URL);
// Export UGUIController::execCheckFirewall(FFrame&, void* const)
native function bool CheckFirewall();
// Export UGUIController::execAuthroizeFirewall(FFrame&, void* const)
native function bool AuthroizeFirewall();
// Export UGUIController::execCheckForECE(FFrame&, void* const)
native function bool CheckForECE();
function string LoadDecoText(string PackageName, string DecoTextName)
{
    local int i;
    local DecoText Deco;
    local string DecoText;

    // End:0x51
    if(InStr(DecoTextName, ".") != -1)
    {
        // End:0x37
        if(PackageName == "")
        {
            Divide(DecoTextName, ".", PackageName, DecoTextName);
        }
        // End:0x51
        else
        {
            DecoTextName = Mid(DecoTextName, InStr(DecoTextName, ".") + 1);
        }
    }
    Deco = class'wUtil'.static.LoadDecoText(PackageName, DecoTextName);
    // End:0x7e
    if(Deco == none)
    {
        return "";
    }
    i = 0;
    J0x85:
    // End:0xdd [While If]
    if(i < Deco.Rows.Length)
    {
        // End:0xb6
        if(DecoText != "")
        {
            DecoText $= "|";
        }
        DecoText $= Deco.Rows[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x85;
    }
    return DecoText;
}

final function GetTeamSymbolList(out array<string> SymbolNames, optional bool bNoSinglePlayer)
{
    class'CacheManager'.static.GetTeamSymbolList(SymbolNames, bNoSinglePlayer);
}

function GUIPage TopPage()
{
    return ActivePage;
}

event InitializeController()
{
    local int i;
    local class<GUIStyles> NewStyleClass;

    i = 0;
    J0x07:
    // End:0x8e [While If]
    if(i < DefaultStyleNames.Length)
    {
        NewStyleClass = class<GUIStyles>(DynamicLoadObject(DefaultStyleNames[i], class'Class'));
        // End:0x84
        if(NewStyleClass != none)
        {
            // End:0x84
            if(!RegisterStyle(NewStyleClass))
            {
                Log("Could not create requested style" @ DefaultStyleNames[i]);
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    i = 0;
    J0x95:
    // End:0x11c [While If]
    if(i < StyleNames.Length)
    {
        NewStyleClass = class<GUIStyles>(DynamicLoadObject(StyleNames[i], class'Class'));
        // End:0x112
        if(NewStyleClass != none)
        {
            // End:0x112
            if(!RegisterStyle(NewStyleClass))
            {
                Log("Could not create requested style" @ StyleNames[i]);
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x95;
    }
    i = 0;
    J0x123:
    // End:0x153 [While If]
    if(i < FontStack.Length)
    {
        FontStack[i].Controller = self;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x123;
    }
    class'CacheManager'.static.InitCache();
    bECEEdition = CheckForECE();
}

function PrecachePlayerRecords()
{
    local PlayerRecord Rec;

    Rec = class'wUtil'.static.GetPlayerRecord(0);
}

function bool RegisterStyle(class<GUIStyles> StyleClass, optional bool bTemporary)
{
    local export editinline GUIStyles NewStyle;
    local int i, Index;

    Index = -1;
    // End:0x195
    if(StyleClass != none)
    {
        i = 0;
        J0x1d:
        // End:0xb5 [While If]
        if(i < StyleStack.Length)
        {
            // End:0x79
            if(StyleStack[i].Class == StyleClass)
            {
                Log("Style already registered '" $ string(StyleClass) $ "'");
                return true;
            }
            // End:0xab
            if(StyleStack[i].KeyName == StyleClass.default.KeyName)
            {
                Index = i;
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x1d;
        }
        NewStyle = new (none) StyleClass;
        // End:0x195
        if(NewStyle != none)
        {
            // End:0xef
            if(Index < 0)
            {
                StyleStack[StyleStack.Length] = NewStyle;
            }
            // End:0x15e
            else
            {
                // End:0x137
                if(bModAuthor)
                {
                    Log("Replacing Style" @ StyleStack[Index].KeyName @ "with" @ string(NewStyle), 'ModAuthor');
                }
                StyleStack[Index].Controller = none;
                StyleStack[Index] = NewStyle;
            }
            NewStyle.Controller = self;
            NewStyle.Initialize();
            NewStyle.bTemporary = bTemporary;
            return true;
        }
    }
    return false;
}

event class<GUIComponent> AddComponentClass(string ClassName)
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

event GUIPage FindPersistentMenuByName(string MenuClass)
{
    local int i;

    // End:0x0e
    if(MenuClass == "")
    {
        return none;
    }
    i = 0;
    J0x15:
    // End:0x5b [While If]
    if(i < PersistentStack.Length)
    {
        // End:0x51
        if(MenuClass ~= string(PersistentStack[i].Class))
        {
            return PersistentStack[i];
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x15;
    }
    return none;
}

event int FindMenuIndexByName(string MenuClass)
{
    local int i;

    // End:0x12
    if(MenuClass == "")
    {
        return -1;
    }
    i = 0;
    J0x19:
    // End:0x59 [While If]
    if(i < MenuStack.Length)
    {
        // End:0x4f
        if(MenuClass ~= string(MenuStack[i].Class))
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x19;
    }
    return -1;
}

event int FindMenuIndex(GUIPage Menu)
{
    local int i;

    // End:0x11
    if(Menu == none)
    {
        return -1;
    }
    i = 0;
    J0x18:
    // End:0x4d [While If]
    if(i < MenuStack.Length)
    {
        // End:0x43
        if(MenuStack[i] == Menu)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x18;
    }
    return -1;
}

event int FindPersistentMenuIndex(GUIPage Menu)
{
    local int i;

    // End:0x11
    if(Menu == none)
    {
        return -1;
    }
    i = 0;
    J0x18:
    // End:0x4d [While If]
    if(i < PersistentStack.Length)
    {
        // End:0x43
        if(Menu == PersistentStack[i])
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x18;
    }
    return -1;
}

function GUIPage FindPersistentMenuByClass(class<GUIPage> PageClass)
{
    local int i;

    // End:0x0d
    if(PageClass == none)
    {
        return none;
    }
    i = 0;
    J0x14:
    // End:0x59 [While If]
    if(i < PersistentStack.Length)
    {
        // End:0x4f
        if(ClassIsChildOf(PersistentStack[i].Class, PageClass))
        {
            return PersistentStack[i];
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
    return none;
}

function GUIPage FindMenuByClass(class<GUIPage> PageClass)
{
    local int i;

    // End:0x0d
    if(PageClass == none)
    {
        return none;
    }
    i = 0;
    J0x14:
    // End:0x59 [While If]
    if(i < MenuStack.Length)
    {
        // End:0x4f
        if(ClassIsChildOf(MenuStack[i].Class, PageClass))
        {
            return MenuStack[i];
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
    return none;
}

function GUIPage GetMenuByIndex(int Index)
{
    // End:0x12
    if(Count() <= Index)
    {
        return none;
    }
    return MenuStack[Index];
}

function LogMenuStack()
{
    local int i;
    local export editinline GUIPage Page;

    Log("[CallMenuStack] Start");
    Log("-------------------------------------------");
    Log("Controller.MenuStack.Length = " $ string(Count()));
    i = 0;
    J0x7b:
    // End:0xc1 [While If]
    if(i < Count())
    {
        Page = GetMenuByIndex(i);
        Log(string(i) @ string(Page.Name));
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x7b;
    }
    Log("-------------------------------------------");
    Log("[CallMenuStack] End");
}

function LogControllerInfo()
{
    Log("[ControllerInfo] Start");
    Log("-------------------------------------------");
    Log("Controller Log!!!!!!");
    // End:0x9f
    if(FocusedControl != none)
    {
        Log("    FocusedControl = " $ string(self.FocusedControl.Name));
    }
    // End:0xbc
    else
    {
        Log("    FocusedControl = none");
    }
    // End:0xf9
    if(ActiveControl != none)
    {
        Log("    ActiveControl = " $ string(self.ActiveControl.Name));
    }
    // End:0x115
    else
    {
        Log("    ActiveControl = none");
    }
    Log("-------------------------------------------");
    Log("Page Log!!!!!!");
    // End:0x314
    if(ActivePage != none)
    {
        Log("ActivePage = " $ string(self.ActivePage.Name));
        // End:0x1d4
        if(ActivePage.FocusedControl != none)
        {
            Log("    FocusedControl = " $ string(ActivePage.FocusedControl.Name));
        }
        // End:0x1f1
        else
        {
            Log("    FocusedControl = none");
        }
        // End:0x23a
        if(ActivePage.FocusInstead != none)
        {
            Log("    FocusInstead = " $ string(ActivePage.FocusInstead.Name));
        }
        // End:0x255
        else
        {
            Log("    FocusInstead = none");
        }
        // End:0x29b
        if(ActivePage.PageOwner != none)
        {
            Log("    PageOwner = " $ string(ActivePage.PageOwner.Name));
        }
        // End:0x2b3
        else
        {
            Log("    PageOwner = none");
        }
        // End:0x2f9
        if(ActivePage.MenuOwner != none)
        {
            Log("    MenuOwner = " $ string(ActivePage.MenuOwner.Name));
        }
        // End:0x311
        else
        {
            Log("    MenuOwner = none");
        }
    }
    // End:0x329
    else
    {
        Log("ActivePage = none");
    }
    // End:0x4e9
    if(TopPage() != none)
    {
        Log("TopPage = " $ string(TopPage().Name));
        // End:0x3a3
        if(TopPage().FocusedControl != none)
        {
            Log("    FocusedControl = " $ string(TopPage().FocusedControl.Name));
        }
        // End:0x3c0
        else
        {
            Log("    FocusedControl = none");
        }
        // End:0x40b
        if(TopPage().FocusInstead != none)
        {
            Log("    FocusInstead = " $ string(TopPage().FocusInstead.Name));
        }
        // End:0x426
        else
        {
            Log("    FocusInstead = none");
        }
        // End:0x46e
        if(TopPage().PageOwner != none)
        {
            Log("    PageOwner = " $ string(TopPage().PageOwner.Name));
        }
        // End:0x486
        else
        {
            Log("    PageOwner = none");
        }
        // End:0x4ce
        if(TopPage().MenuOwner != none)
        {
            Log("    MenuOwner = " $ string(TopPage().MenuOwner.Name));
        }
        // End:0x4e6
        else
        {
            Log("    MenuOwner = none");
        }
    }
    // End:0x4fb
    else
    {
        Log("TopPage = none");
    }
    Log("-------------------------------------------");
    Log("[ControllerInfo] End");
}

function LogControlInfo(GUIComponent Sender)
{
    Log("[ControlInfo] Start");
    Log("-------------------------------------------");
    // End:0x1bc
    if(Sender != none)
    {
        Log("Sender = " $ string(Sender.Name));
        Log("Sender.MenuState = " $ string(Sender.MenuState));
        // End:0xe2
        if(Sender.FocusInstead != none)
        {
            Log("    FocusInstead = " $ string(Sender.FocusInstead.Name));
        }
        // End:0xfd
        else
        {
            Log("    FocusInstead = none");
        }
        // End:0x143
        if(Sender.PageOwner != none)
        {
            Log("    PageOwner = " $ string(Sender.PageOwner.Name));
        }
        // End:0x15b
        else
        {
            Log("    PageOwner = none");
        }
        // End:0x1a1
        if(Sender.MenuOwner != none)
        {
            Log("    MenuOwner = " $ string(Sender.MenuOwner.Name));
        }
        // End:0x1b9
        else
        {
            Log("    MenuOwner = none");
        }
    }
    // End:0x1cd
    else
    {
        Log("Sender = none");
    }
    Log("-------------------------------------------");
    Log("[ControlInfo] End");
}

function GUIPage GetLastMenu()
{
    // End:0x0e
    if(MenuStack.Length == 0)
    {
        return none;
    }
    return MenuStack[MenuStack.Length - 1];
}

event GUIPage CreateMenu(string NewMenuName)
{
    local class<GUIPage> NewMenuClass;
    local export editinline GUIPage NewMenu;
    local int i;

    // End:0x2e
    if(NewMenuName ~= "XInterface.UT2MainMenu")
    {
        NewMenuName = GetMainMenuClass();
    }
    NewMenuClass = class<GUIPage>(AddComponentClass(NewMenuName));
    // End:0x154
    if(NewMenuClass != none)
    {
        // End:0xb4
        if(NewMenuClass.default.bPersistent)
        {
            i = 0;
            J0x68:
            // End:0xb4 [While If]
            if(i < PersistentStack.Length)
            {
                // End:0xaa
                if(PersistentStack[i].Class == NewMenuClass)
                {
                    NewMenu = PersistentStack[i];
                }
                // End:0xb4
                else
                {
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0x68;
                }
            }
        }
        // End:0x146
        if(NewMenu == none)
        {
            NewMenu = new (none) NewMenuClass;
            // End:0x108
            if(NewMenu == none)
            {
                Log("Could not create requested menu" @ NewMenuName);
                return none;
            }
            // End:0x146
            else
            {
                // End:0x146
                if(NewMenuClass.default.bPersistent)
                {
                    i = PersistentStack.Length;
                    PersistentStack.Length = i + 1;
                    PersistentStack[i] = NewMenu;
                }
            }
        }
        bCurMenuInitialized = false;
        return NewMenu;
    }
    Log("Could not DLO menu '" $ NewMenuName $ "'");
    return none;
}

event bool OpenMenu(string NewMenuName, optional string Param1, optional string Param2)
{
    local export editinline GUIPage NewMenu;

    // End:0x4d
    if(bModAuthor)
    {
        Log(string(Class) @ "OpenMenu [" $ NewMenuName $ "] (" $ Param1 $ ") (" $ Param2 $ ")", 'ModAuthor');
    }
    // End:0x73
    if(ActivePage != none)
    {
        // End:0x73
        if(!ActivePage.AllowOpen(NewMenuName))
        {
            return false;
        }
    }
    // End:0xd7
    if(!bCurMenuInitialized && MenuStack.Length > 0)
    {
        // End:0xd5
        if(bModAuthor)
        {
            Log("Cannot open menu until menu initialization is complete!", 'ModAuthor');
        }
        return false;
    }
    NewMenu = CreateMenu(NewMenuName);
    // End:0x16d
    if(NewMenu != none)
    {
        // End:0x112
        if(FindMenuIndex(NewMenu) != -1)
        {
            bCurMenuInitialized = true;
            return false;
        }
        NewMenu.ParentPage = ActivePage;
        ResetFocus();
        PushMenu(MenuStack.Length, NewMenu, Param1, Param2);
        // End:0x16b
        if(NewMenu.bDisconnectOnOpen)
        {
            ConsoleCommand("DISCONNECT");
        }
        return true;
    }
    Log("Could not open menu" @ NewMenuName);
    return false;
}

function bool OpenMenuByObject(GUIPage NewMenu, optional string Param1, optional string Param2)
{
    // End:0x85
    if(NewMenu != none)
    {
        // End:0x2a
        if(FindMenuIndex(NewMenu) != -1)
        {
            bCurMenuInitialized = true;
            return false;
        }
        NewMenu.ParentPage = ActivePage;
        ResetFocus();
        PushMenu(MenuStack.Length, NewMenu, Param1, Param2);
        // End:0x83
        if(NewMenu.bDisconnectOnOpen)
        {
            ConsoleCommand("DISCONNECT");
        }
        return true;
    }
    return false;
}

event AutoLoadMenus()
{
    local export editinline GUIPage NewMenu;
    local int i;

    super.AutoLoadMenus();
    i = 0;
    J0x0d:
    // End:0x9f [While If]
    if(i < AutoLoad.Length)
    {
        NewMenu = CreateMenu(AutoLoad[i].MenuClassName);
        // End:0x70
        if(NewMenu == none)
        {
            Log("Could not auto-load" @ AutoLoad[i].MenuClassName);
        }
        // End:0x95
        else
        {
            // End:0x95
            if(AutoLoad[i].bPreInitialize)
            {
                NewMenu.InitComponent(self, none);
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0d;
    }
}

event bool ReplaceMenu(string NewMenuName, optional string Param1, optional string Param2, optional bool bCancelled)
{
    local export editinline GUIPage NewMenu;

    // End:0x2f
    if(ActivePage == none || MenuStack.Length == 0)
    {
        return OpenMenu(NewMenuName, Param1, Param2);
    }
    // End:0x81
    if(bModAuthor)
    {
        Log(string(Class) @ "ReplaceMenu [" $ NewMenuName $ "]  (" $ Param1 $ ")  (" $ Param2 $ ")", 'ModAuthor');
    }
    // End:0xe8
    if(!bCurMenuInitialized && MenuStack.Length > 0)
    {
        // End:0xe6
        if(bModAuthor)
        {
            Log("Cannot replace menu until menu initialization is complete!", 'ModAuthor');
        }
        return false;
    }
    NewMenu = CreateMenu(NewMenuName);
    // End:0x15d
    if(NewMenu != none)
    {
        NewMenu.ParentPage = ActivePage.ParentPage;
        ResetFocus();
        PopMenu(-1, ActivePage, bCancelled);
        PushMenu(MenuStack.Length - 1, NewMenu, Param1, Param2);
        return true;
    }
    return false;
}

function CloseMenuPage(GUIPage SelectPage, optional bool bCancelled)
{
    // End:0x4b
    if(MenuStack.Length == 0 || SelectPage == none)
    {
        Log("Attempting to close a non-existing menu page");
        return;
    }
    // End:0x88
    if(bModAuthor)
    {
        Log(string(Class) @ "CloseMenu [" $ string(ActivePage.Name) $ "]", 'ModAuthor');
    }
    // End:0xda
    if(!bCurMenuInitialized)
    {
        // End:0xd8
        if(bModAuthor)
        {
            Log("Cannot close menu until initialization is complete!", 'ModAuthor');
        }
        return;
    }
    // End:0xfa
    if(!SelectPage.OnCanClose(bCancelled))
    {
        return;
    }
    ResetInput();
    SelectPage.PlayCloseSound();
    PopMenu(FindMenuIndex(SelectPage), SelectPage, bCancelled);
    SelectPage.CheckResolution(true, self);
    bCurMenuInitialized = false;
    // End:0x1b6
    if(MenuStack.Length > 0)
    {
        ActivePage = MenuStack[MenuStack.Length - 1];
        ActivePage.MenuState = 2;
        ResetFocus();
        ActivePage.FocusFirst(none);
        // End:0x1b3
        if(!ActivePage.bNeverFocus)
        {
            ActivePage.OnActivate();
        }
    }
    // End:0x1fa
    else
    {
        // End:0x1ec
        if(!ActivePage.bAllowedAsLast && !MainNotWanted)
        {
            ActivePage = none;
            OpenMenu(GetMainMenuClass());
            return;
        }
        ActivePage = none;
        SetControllerStatus(false);
    }
    bCurMenuInitialized = true;
    // End:0x220
    if(ActivePage != none)
    {
        ActivePage.OnReOpen();
    }
    bForceMouseCheck = true;
}

function ReplaceMenu2_FadedOut()
{
    CloseMenuPage(SaveFadeOutPage, bSaveCancelled);
}

function ReplaceMenu2(string NewMenuName, optional bool bCancelled)
{
    local export editinline GUIPage ppage;

    ppage = TopPage();
    // End:0x2f
    if(ppage == none)
    {
        ReplaceMenu(NewMenuName, "", "", bCancelled);
    }
    // End:0x6e
    else
    {
        SaveFadeOutPage = ppage;
        ppage.__FadedOut__Delegate = ReplaceMenu2_FadedOut;
        ppage.FadeOut(false, true);
        OpenMenu(NewMenuName, "", "");
    }
}

protected event PushMenu(int Index, GUIPage NewMenu, optional string Param1, optional string Param2)
{
    // End:0x49
    if(NewMenu == none)
    {
        Log("Call to GUIController.PushMenu() with invalid NewMenu!!!");
        return;
    }
    SetControllerStatus(true);
    // End:0x77
    if(Index >= 0)
    {
        MenuStack[Index] = NewMenu;
        ActivePage = NewMenu;
    }
    CloseOverlays();
    ResetInput();
    // End:0xa8
    if(NewMenu.Controller == none)
    {
        NewMenu.InitComponent(self, none);
    }
    NewMenu.CheckResolution(false, self);
    NewMenu.Opened(NewMenu);
    NewMenu.MenuState = 2;
    NewMenu.PlayOpenSound();
    bCurMenuInitialized = true;
    NewMenu.HandleParameters(Param1, Param2);
    bForceMouseCheck = true;
    NewMenu.OnOpen();
}

protected event PopMenu(int Index, GUIPage CurMenu, optional bool bCancelled)
{
    CloseOverlays();
    CurMenu.Closed(CurMenu, bCancelled);
    // End:0x7c
    if(Index >= 0 && Index + 1 < MenuStack.Length && MenuStack[Index + 1] != none)
    {
        MenuStack[Index + 1].ParentPage = CurMenu.ParentPage;
    }
    CurMenu.ParentPage = none;
    CurMenu.free();
    // End:0xa8
    if(Index < 0)
    {
        return;
    }
    // End:0xe0
    if(Index >= MenuStack.Length || MenuStack[Index] != CurMenu)
    {
        Index = FindMenuIndex(CurMenu);
    }
    // End:0x109
    if(Index >= 0 && Index < MenuStack.Length)
    {
        MenuStack.Remove(Index, 1);
    }
}

function bool RemoveMenuAt(int Index, optional bool bCancelled)
{
    // End:0x1f
    if(Index < 0 || Index >= MenuStack.Length)
    {
        return false;
    }
    return RemoveMenu(MenuStack[Index], bCancelled);
}

event bool RemoveMenu(GUIPage Menu, optional bool bCancelled)
{
    // End:0x5b
    if(MenuStack.Length == 0)
    {
        Log("GUIController.RemoveMenu() - Attempting to close a non-existing menu page");
        return false;
    }
    // End:0x84
    if(Menu == none || Menu == ActivePage)
    {
        return CloseMenu(bCancelled);
    }
    // End:0xc2
    if(bModAuthor)
    {
        Log(string(Class) @ "RemoveMenu [" $ string(Menu.Name) $ "]", 'ModAuthor');
    }
    // End:0x115
    if(!bCurMenuInitialized)
    {
        // End:0x113
        if(bModAuthor)
        {
            Log("Cannot remove menu until initialization is complete!", 'ModAuthor');
        }
        return false;
    }
    // End:0x135
    if(!Menu.OnCanClose(bCancelled))
    {
        return false;
    }
    ResetInput();
    Menu.PlayCloseSound();
    PopMenu(FindMenuIndex(Menu), Menu, bCancelled);
    // End:0x1ae
    if(MenuStack.Length == 0)
    {
        // End:0x1a0
        if(!Menu.bAllowedAsLast && !MainNotWanted)
        {
            return OpenMenu(GetMainMenuClass());
        }
        ActivePage = none;
        SetControllerStatus(false);
    }
    VerifyStack();
    bForceMouseCheck = true;
    return true;
}

event bool CloseMenu(optional bool bCancelled)
{
    // End:0x4b
    if(MenuStack.Length == 0 || ActivePage == none)
    {
        Log("Attempting to close a non-existing menu page");
        return false;
    }
    // End:0x88
    if(bModAuthor)
    {
        Log(string(Class) @ "CloseMenu [" $ string(ActivePage.Name) $ "]", 'ModAuthor');
    }
    // End:0xda
    if(!bCurMenuInitialized)
    {
        // End:0xd8
        if(bModAuthor)
        {
            Log("Cannot close menu until initialization is complete!", 'ModAuthor');
        }
        return false;
    }
    // End:0xfa
    if(!ActivePage.OnCanClose(bCancelled))
    {
        return false;
    }
    ResetInput();
    ActivePage.PlayCloseSound();
    PopMenu(FindMenuIndex(ActivePage), ActivePage, bCancelled);
    ActivePage.CheckResolution(true, self);
    bCurMenuInitialized = false;
    // End:0x1b6
    if(MenuStack.Length > 0)
    {
        ActivePage = MenuStack[MenuStack.Length - 1];
        ActivePage.MenuState = 2;
        ResetFocus();
        ActivePage.FocusFirst(none);
        // End:0x1b3
        if(!ActivePage.bNeverFocus)
        {
            ActivePage.OnActivate();
        }
    }
    // End:0x1f9
    else
    {
        // End:0x1eb
        if(!ActivePage.bAllowedAsLast && !MainNotWanted)
        {
            ActivePage = none;
            return OpenMenu(GetMainMenuClass());
        }
        ActivePage = none;
        SetControllerStatus(false);
    }
    bCurMenuInitialized = true;
    // End:0x21f
    if(ActivePage != none)
    {
        ActivePage.OnReOpen();
    }
    bForceMouseCheck = true;
    return true;
}

delegate PressedCloseWndBtn();
function bool ClickCloseWndBtn()
{
    PressedCloseWndBtn();
    return true;
}

event CloseAll(bool bCancel, optional bool bForced)
{
    local int i;

    // End:0x104
    if(bModAuthor)
    {
        Log(string(Name) @ "CloseAll bCancel:" $ string(bCancel) @ "Forced:" $ string(bForced) @ "(Currently" @ string(MenuStack.Length) @ "menus open)", 'ModAuthor');
        i = 0;
        J0x79:
        // End:0x104 [While If]
        if(i < MenuStack.Length)
        {
            // End:0xc2
            if(MenuStack[i] == none)
            {
                Log("   Menu[" $ string(i) $ "]: None", 'ModAuthor');
            }
            // End:0xfa
            else
            {
                Log("   Menu[" $ string(i) $ "]:" $ string(MenuStack[i].Name), 'ModAuthor');
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x79;
        }
    }
    // End:0x115
    if(bForced)
    {
        MainNotWanted = true;
    }
    // End:0x127
    if(MenuStack.Length > 0)
    {
        SaveRestorePages();
    }
    // End:0x13f
    if(MenuStack.Length >= 0)
    {
        CloseMenu(bCancel);
    }
    MainNotWanted = false;
    i = MenuStack.Length - 1;
    J0x156:
    // End:0x187 [While If]
    if(i >= 0)
    {
        PopMenu(i, MenuStack[i], bCancel);
        -- i;
        // This is an implied JumpToken; Continue!
        goto J0x156;
    }
    // End:0x1c7
    if(GameResolution != "")
    {
        Console(Master.Console).DelayedConsoleCommand("SETRES" @ GameResolution);
        GameResolution = "";
    }
    ActivePage = none;
    SetControllerStatus(false);
}

function int Count()
{
    return MenuStack.Length;
}

function SaveRestorePages()
{
    local int i;
    local string Param1, Param2, MenuClass;

    RestoreMenus.Remove(0, RestoreMenus.Length);
    i = MenuStack.Length - 1;
    J0x1c:
    // End:0xe6 [While If]
    if(i >= 0)
    {
        // End:0xdc
        if(MenuStack[i] != none)
        {
            // End:0xdc
            if(MenuStack[i].bRestorable)
            {
                MenuClass = string(MenuStack[i].Class);
                Param1 = "";
                Param2 = "";
                // End:0xdc
                if(MenuStack[i].GetRestoreParams(Param1, Param2))
                {
                    RestoreMenus.Insert(0, 1);
                    RestoreMenus[0].MenuClassName = MenuClass;
                    RestoreMenus[0].Param1 = Param1;
                    RestoreMenus[0].Param2 = Param2;
                }
            }
        }
        -- i;
        // This is an implied JumpToken; Continue!
        goto J0x1c;
    }
}

function PerformRestore()
{
    local int i, idx;

    // End:0x53
    if(bModAuthor)
    {
        Log("Restoring previously open menus (" $ string(RestoreMenus.Length) $ " menus to restore)", 'ModAuthor');
    }
    i = 0;
    J0x5a:
    // End:0xd5 [While If]
    if(i < RestoreMenus.Length)
    {
        idx = FindMenuIndexByName(RestoreMenus[i].MenuClassName);
        // End:0xcb
        if(idx == -1)
        {
            OpenMenu(RestoreMenus[i].MenuClassName, RestoreMenus[i].Param1, RestoreMenus[i].Param2);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x5a;
    }
    RestoreMenus.Remove(0, RestoreMenus.Length);
}

function SetControllerStatus(bool On)
{
    local bool bWasActive;

    // End:0x51
    if(bActive && !On && ViewportOwner != none && ViewportOwner.Actor != none)
    {
        ViewportOwner.Actor.UnPressButtons();
    }
    bWasActive = bActive;
    bActive = On;
    bVisible = On;
    bRequiresTick = On;
    // End:0xd6
    if(bActive && !bWasActive && ViewportOwner != none && ViewportOwner.Actor != none)
    {
        ViewportOwner.Actor.UnPressButtons();
    }
    ViewportOwner.bShowWindowsMouse = On && ViewportOwner.bWindowsMouseAvailable;
    // End:0x114
    if(On)
    {
        bIgnoreUntilPress = true;
    }
    // End:0x11a
    else
    {
        ResetDesigner();
    }
    PurgeComponentClasses();
}

event ChangeFocus(GUIComponent Who)
{
    // End:0x1b
    if(Who != none)
    {
        Who.SetFocus(none);
    }
    return;
}

function ResetFocus()
{
    MoveControl = none;
    // End:0x2a
    if(ActiveControl != none)
    {
        ActiveControl.MenuStateChange(0);
        ActiveControl = none;
    }
    // End:0x45
    if(FocusedControl != none)
    {
        FocusedControl.LoseFocus(none);
    }
    RepeatKey = 0;
    RepeatTime = 0.0;
}

event MoveFocused(GUIComponent C, int bmLeft, int bmTop, int bmWidth, int bmHeight, float ClipX, float ClipY, float val)
{
    // End:0x5e
    if(C.bScaleToParent && C.MenuOwner != none)
    {
        ClipX = C.MenuOwner.ActualWidth();
        ClipY = C.MenuOwner.ActualHeight();
    }
    // End:0xf7
    if(bmLeft != 0)
    {
        // End:0xd9
        if(C.WinLeft < 2.0 && C.WinLeft > -2.0 && !C.bNeverScale)
        {
            C.WinLeft += val / ClipX * float(bmLeft);
        }
        // End:0xf7
        else
        {
            C.WinLeft += val * float(bmLeft);
        }
    }
    // End:0x190
    if(bmTop != 0)
    {
        // End:0x172
        if(C.WinTop < 2.0 && C.WinTop > -2.0 && !C.bNeverScale)
        {
            C.WinTop += val / ClipY * float(bmTop);
        }
        // End:0x190
        else
        {
            C.WinTop += val * float(bmTop);
        }
    }
    // End:0x229
    if(bmWidth != 0)
    {
        // End:0x20b
        if(C.WinWidth < 2.0 && C.WinWidth > -2.0 && !C.bNeverScale)
        {
            C.WinWidth += val / ClipX * float(bmWidth);
        }
        // End:0x229
        else
        {
            C.WinWidth += val * float(bmWidth);
        }
    }
    // End:0x292
    if(bmHeight != 0)
    {
        // End:0x274
        if(C.WinHeight <= 2.0)
        {
            C.WinHeight += val / ClipX * float(bmHeight);
        }
        // End:0x292
        else
        {
            C.WinHeight += val * float(bmHeight);
        }
    }
}

function bool HasMouseMoved(optional float ErrorMargin)
{
    return Abs(MouseX - LastMouseX) > Abs(ErrorMargin) || Abs(MouseY - LastMouseY) > Abs(ErrorMargin);
}

event bool CanShowHints()
{
    // End:0x0b
    if(bNoToolTips)
    {
        return false;
    }
    // End:0x2c
    if(ActivePage != none && ActivePage.bCaptureMouse)
    {
        return false;
    }
    // End:0x46
    if(DropSource != none || DropTarget != none)
    {
        return false;
    }
    // End:0x69
    if(!bDesignModeToolTips && bDesignMode && bHighlightCurrent)
    {
        return false;
    }
    return true;
}

event bool NeedsMenuResolution()
{
    local int i;

    i = MenuStack.Length - 1;
    J0x0f:
    // End:0x6e [While If]
    if(i >= 0)
    {
        // End:0x47
        if(MenuStack[i] != none && MenuStack[i].bRequire640x480)
        {
            return true;
        }
        // End:0x64
        if(!MenuStack[i].bRenderWorld)
        {
        }
        // End:0x6e
        else
        {
            -- i;
            // This is an implied JumpToken; Continue!
            goto J0x0f;
        }
    }
    return false;
}

event SetRequiredGameResolution(string GameRes)
{
    GameResolution = GameRes;
}

event NotifyLevelChange()
{
    local int i;

    // End:0x2e
    if(bModAuthor)
    {
        Log(string(Class) @ "NotifyLevelChange()", 'ModAuthor');
    }
    ResetDesigner();
    // End:0x9e
    if(bActive && ViewportOwner.Actor != none && ViewportOwner.Actor.Level != none && ViewportOwner.Actor.Level.IsPendingConnection())
    {
        SaveRestorePages();
    }
    i = MenuStack.Length - 1;
    J0xad:
    // End:0x126 [While If]
    if(i >= 0 && MenuStack.Length != 0)
    {
        // End:0x11c
        if(MenuStack[i] != none)
        {
            // End:0xf2
            if(MenuStack[i].bPersistent)
            {
            }
            // End:0x11c
            else
            {
                // End:0x11c
                if(MenuStack[i].NotifyLevelChange())
                {
                    RemoveMenu(MenuStack[i], true);
                }
            }
        }
        -- i;
        // This is an implied JumpToken; Continue!
        goto J0xad;
    }
    i = PersistentStack.Length - 1;
    J0x135:
    // End:0x1dd [While If]
    if(i >= 0)
    {
        // End:0x1d3
        if(PersistentStack[i] != none && PersistentStack[i].NotifyLevelChange())
        {
            // End:0x198
            if(PersistentStack[i].IsOpen())
            {
                RemoveMenu(PersistentStack[i], true);
            }
            // End:0x1ad
            else
            {
                PersistentStack[i].free();
            }
            // End:0x1d3
            if(!PersistentStack[i].bPersistent)
            {
                PersistentStack.Remove(i, 1);
            }
        }
        -- i;
        // This is an implied JumpToken; Continue!
        goto J0x135;
    }
    PurgeObjectReferences();
    VerifyStack();
    // End:0x202
    if(MenuStack.Length > 0)
    {
        RestoreMenus.Remove(0, RestoreMenus.Length);
    }
}

function CloseOverlays()
{
    MouseOver = none;
    ContextMenu = none;
}

function VerifyStack()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x98 [While If]
    if(i < MenuStack.Length)
    {
        // End:0x60
        if(MenuStack[i] == none || MenuStack[i].Controller == none && bCurMenuInitialized)
        {
            MenuStack.Remove(-- i, 1);
        }
        // End:0x8e
        else
        {
            // End:0x8e
            if(i > 0)
            {
                MenuStack[i].ParentPage = MenuStack[i - 1];
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    ConsolidateMenus();
}

function PurgeObjectReferences()
{
    local class<GUIStyles> OriginalStyle;
    local int i;

    i = 0;
    J0x07:
    // End:0x145 [While If]
    if(i < STYLE_NUM)
    {
        // End:0xa0
        if(StyleStack[i] == none)
        {
            OriginalStyle = class<GUIStyles>(DynamicLoadObject(DefaultStyleNames[i], class'Class'));
            // End:0xa0
            if(!RegisterStyle(OriginalStyle))
            {
                Log("Could not restore default style " $ string(i) $ " (" $ DefaultStyleNames[i] $ ")");
            }
            // End:0x13b
            else
            {
            }
            // End:0x13b
            if(StyleStack[i].bTemporary)
            {
                OriginalStyle = class<GUIStyles>(DynamicLoadObject(DefaultStyleNames[i], class'Class'));
                // End:0x13b
                if(!RegisterStyle(OriginalStyle))
                {
                    Log("Could not restore default style " $ string(i) $ " (" $ DefaultStyleNames[i] $ ")");
                    StyleStack[i] = none;
                }
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    // End:0x16d
    if(StyleStack.Length > STYLE_NUM)
    {
        StyleStack.Remove(STYLE_NUM, StyleStack.Length - STYLE_NUM);
    }
    // End:0x195
    if(FontStack.Length > FONT_NUM)
    {
        FontStack.Remove(FONT_NUM, FontStack.Length - FONT_NUM);
    }
    // End:0x1bd
    if(MouseCursors.Length > CURSOR_NUM)
    {
        MouseCursors.Remove(CURSOR_NUM, MouseCursors.Length - CURSOR_NUM);
    }
    PurgeComponentClasses();
}

function PurgeComponentClasses();
function ConsolidateMenus()
{
    local int i, j;

    i = MenuStack.Length - 1;
    J0x0f:
    // End:0xac [While If]
    if(i >= 0)
    {
        j = 0;
        J0x21:
        // End:0xa2 [While If]
        if(j < i)
        {
            // End:0x98
            if(MenuStack[i].Class == MenuStack[j].Class)
            {
                MenuStack[j + 1].ParentPage = MenuStack[j].ParentPage;
                MenuStack.Remove(j, 1);
            }
            // End:0xa2
            else
            {
                ++ j;
                // This is an implied JumpToken; Continue!
                goto J0x21;
            }
        }
        -- i;
        // This is an implied JumpToken; Continue!
        goto J0x0f;
    }
}

static event Validate();
// Export UGUIController::execGetMainMenuClass(FFrame&, void* const)
native static final function string GetMainMenuClass();
static function string GetSinglePlayerPage();
static function string GetServerBrowserPage();
static function string GetMultiplayerPage();
static function string GetInstantActionPage();
static function string GetModPage();
static function string GetSettingsPage();
static function string GetQuitPage();
final function bool SetKeyBind(string BindKeyName, string BindKeyValue)
{
    ViewportOwner.Actor.ConsoleCommand("set Input" @ BindKeyName @ BindKeyValue);
    return true;
}

final function bool KeyNameFromIndex(byte iKey, out string KeyName, out string LocalizedKeyName)
{
    KeyName = ViewportOwner.Actor.ConsoleCommand("KEYNAME" @ string(iKey));
    LocalizedKeyName = ViewportOwner.Actor.ConsoleCommand("LOCALIZEDKEYNAME" @ string(iKey));
    return KeyName != "";
}

final function bool GetCurrentBind(string BindKeyName, out string BindKeyValue)
{
    // End:0x47
    if(BindKeyName != "")
    {
        BindKeyValue = ViewportOwner.Actor.ConsoleCommand("KEYBINDING" @ BindKeyName);
        return BindKeyValue != "";
    }
    return false;
}

final function bool GetAssignedKeys(string BindAlias, out array<string> BindKeyNames, out array<string> LocalizedBindKeyNames)
{
    local int i, iKey;
    local string S;

    BindKeyNames.Length = 0;
    LocalizedBindKeyNames.Length = 0;
    S = ViewportOwner.Actor.ConsoleCommand("BINDINGTOKEY" @ "\\"" $ BindAlias $ "\\"");
    // End:0x10f
    if(S != "")
    {
        Split(S, ",", BindKeyNames);
        i = 0;
        J0x6f:
        // End:0x10f [While If]
        if(i < BindKeyNames.Length)
        {
            iKey = int(ViewportOwner.Actor.ConsoleCommand("KEYNUMBER" @ BindKeyNames[i]));
            // End:0x105
            if(iKey != -1)
            {
                LocalizedBindKeyNames[i] = ViewportOwner.Actor.ConsoleCommand("LOCALIZEDKEYNAME" @ string(iKey));
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x6f;
        }
    }
    return BindKeyNames.Length > 0;
}

final function bool SearchBinds(string BindAliasMask, out array<string> BindAliases)
{
    local string S;

    BindAliases.Length = 0;
    S = ViewportOwner.Actor.ConsoleCommand("FINDKEYBINDS" @ "\\"" $ BindAliasMask $ "\\"");
    // End:0x60
    if(S != "")
    {
        Split(S, ",", BindAliases);
    }
    return BindAliases.Length > 0;
}

final function bool KeyPressed(Engine.Interactions.EInputKey iKey)
{
    return KeyDown[iKey] != 0;
}

function GUIQuestionPage ShowQuestionDialog(string Question, optional byte Buttons, optional byte defButton)
{
    local export editinline GUIQuestionPage QPage;

    // End:0x15
    if(Buttons == 0)
    {
        Buttons = 1;
    }
    // End:0x58
    if(OpenMenu(QuestionMenuClass))
    {
        QPage = GUIQuestionPage(TopPage());
        QPage.SetupQuestion(Question, Buttons, defButton);
        return QPage;
    }
    return none;
}

defaultproperties
{
    FONT_NUM=9
    STYLE_NUM=31
    CURSOR_NUM=7
    MouseCursorOffset=// Object reference not set to an instance of an object.
    
    FontStack=// Object reference not set to an instance of an object.
    
    MouseCursors=// Object reference not set to an instance of an object.
    
    DefaultStyleNames=// Object reference not set to an instance of an object.
    
    DesignModeHints=// Object reference not set to an instance of an object.
    
    MenuMouseSens=1.250
    DblClickWindow=1.0
    ButtonRepeatDelay=0.250
    FastCursorStep=1
    CursorStep=1
    ItemEquipSuccessSound=Sound'Warfare_Sound_UI.Item.ui_item_equip_success'
    ItemEquipFailSound=Sound'Warfare_Sound_UI.Item.ui_item_equip_fail'
    ItemTakeoffSound=Sound'Warfare_Sound_UI.Item.ui_item_takeoff'
    ItemAddPartsSound=Sound'Warfare_Sound_UI.Item.ui_item_parts'
    ItemRepairSound=Sound'Warfare_Sound_UI.Item.ui_item_repair'
    ItemClickSound=Sound'Warfare_Sound_UI.Item.ui_item_click'
    ItemBuySound=Sound'Warfare_Sound_UI.Shop.ui_shop_buy'
    ItemSellSound=Sound'Warfare_Sound_UI.Shop.ui_shop_sell'
    TrophyWindowSound=Sound'Warfare_Sound_UI.Result.ui_result_loot_item_open'
    TrophyReceiverUserSound=Sound'Warfare_Sound_UI.Result.ui_result_loot_user_open'
    RequestDataMenu="GUI2K4.UT2K4GetDataMenu"
    ArrayPropertyMenu="GUI2K4.GUIArrayPropPage"
    DynArrayPropertyMenu="GUI2K4.GUIDynArrayPage"
    FilterMenu="GUI2K4.UT2K4_FilterListPage"
    MapVotingMenu="xVoting.MapVotingPage"
    KickVotingMenu="xVoting.KickVotingPage"
    MatchSetupMenu="xVoting.MatchConfigPage"
    EditFavoriteMenu="GUI2K4.EditFavoritePage"
    DesignerMenu="GUIDesigner.PropertyManager"
    bModulateStackedMenus=true
    bHighlightCurrent=true
    bCurMenuInitialized=true
    NetworkMsgMenu="GUI2K4.UT2K4NetworkStatusMsg"
    QuestionMenuClass="XInterface.GUIQuestionPage"
}