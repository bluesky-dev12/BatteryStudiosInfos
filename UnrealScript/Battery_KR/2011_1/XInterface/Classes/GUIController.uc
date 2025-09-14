class GUIController extends BaseGUIController
    abstract
    transient
    native;

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
var protected array<export editinline GUIPage> PersistentStack;
var protected editinline array<export editinline GUIFont> FontStack;
var protected array<export editinline GUIStyles> StyleStack;
var protected editinline array<editinline Material> MouseCursors;
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
var array< Class<GUIComponent> > RegisteredClasses;
var bool bECEEdition;
var int iTempWeaponId;
var array<export editinline GUIPage> SavedPage;
//var delegate<OnNeedRawKeyPress> __OnNeedRawKeyPress__Delegate;
//var delegate<AddBuddy> __AddBuddy__Delegate;

function PushPage()
{
    local int i;

    Log("[GUIController::PushPage] Start MenuStackCount=" $ string(Count()));
    SavedPage.Length = Count();
    i = 0;
    J0x51:

    // End:0x82 [Loop If]
    if(i < (Count()))
    {
        SavedPage[i] = GetMenuByIndex(i);
        i++;
        // [Loop Continue]
        goto J0x51;
    }
    Log("[GUIController::PushPage] End MenuStackCount=" $ string(Count()));
    //return;    
}

function PopPage()
{
    local int i, j;

    Log("[GUIController::PopPage] Start MenuStackCount=" $ string(Count()));
    i = 0;
    J0x43:

    // End:0xBF [Loop If]
    if(i < (Count()))
    {
        j = 0;
        J0x5A:

        // End:0x92 [Loop If]
        if(j < SavedPage.Length)
        {
            // End:0x88
            if((GetMenuByIndex(i)) == SavedPage[j])
            {
                // [Explicit Break]
                goto J0x92;
            }
            j++;
            // [Loop Continue]
            goto J0x5A;
        }
        J0x92:

        // End:0xB5
        if(j == SavedPage.Length)
        {
            RemoveMenuAt(i, false);
            i--;
        }
        i++;
        // [Loop Continue]
        goto J0x43;
    }
    Log("[GUIController::PopPage] End MenuStackCount=" $ string(Count()));
    //return;    
}

delegate bool OnNeedRawKeyPress(byte NewKey)
{
    //return;    
}

delegate AddBuddy(optional string NewBuddyName)
{
    //return;    
}

// Export UGUIController::execGetMenuFont(FFrame&, void* const)
native event GUIFont GetMenuFont(string FontName)
{
    //native.FontName;        
}

// Export UGUIController::execGetStyle(FFrame&, void* const)
native event GUIStyles GetStyle(string StyleName, out GUI.eFontScale FontScale)
{
    //native.StyleName;
    //native.FontScale;        
}

// Export UGUIController::execGetCurrentRes(FFrame&, void* const)
native final function string GetCurrentRes();

// Export UGUIController::execSetRenderDevice(FFrame&, void* const)
native final function bool SetRenderDevice(string NewRenderDevice)
{
    //native.NewRenderDevice;        
}

// Export UGUIController::execResetDesigner(FFrame&, void* const)
private native final function ResetDesigner();

// Export UGUIController::execResetInput(FFrame&, void* const)
native final function ResetInput();

// Export UGUIController::execGetProfileList(FFrame&, void* const)
native final function GetProfileList(string Prefix, out array<string> ProfileList)
{
    //native.Prefix;
    //native.ProfileList;        
}

// Export UGUIController::execResetKeyboard(FFrame&, void* const)
native final function ResetKeyboard();

// Export UGUIController::execGetOGGList(FFrame&, void* const)
native final function GetOGGList(out array<string> OGGFiles)
{
    //native.OGGFiles;        
}

// Export UGUIController::execPlayInterfaceSound(FFrame&, void* const)
native final function PlayInterfaceSound(GUIComponent.EClickSound soundType)
{
    //native.soundType;        
}

// Export UGUIController::execSetMoveControl(FFrame&, void* const)
native final function SetMoveControl(GUIComponent C)
{
    //native.C;        
}

// Export UGUIController::execProfile(FFrame&, void* const)
native function Profile(string ProfileName)
{
    //native.ProfileName;        
}

// Export UGUIController::execGetDEMList(FFrame&, void* const)
native function GetDEMList(out array<string> DEMFiles)
{
    //native.DEMFiles;        
}

// Export UGUIController::execGetDEMHeader(FFrame&, void* const)
native function bool GetDEMHeader(string DemoName, out string MapName, out string GameType, out int ScoreLimit, out int TimeLimit, out int ClientSide, out string RecordedBy, out string TimeStamp, out string ReqPackages)
{
    //native.DemoName;
    //native.MapName;
    //native.GameType;
    //native.ScoreLimit;
    //native.TimeLimit;
    //native.ClientSide;
    //native.RecordedBy;
    //native.TimeStamp;
    //native.ReqPackages;        
}

// Export UGUIController::execGetOwnageList(FFrame&, void* const)
native function GetOwnageList(out array<int> RLevel, out array<string> MNames, out array<string> MDesc, out array<string> mURL)
{
    //native.RLevel;
    //native.MNames;
    //native.MDesc;
    //native.mURL;        
}

// Export UGUIController::execSaveOwnageList(FFrame&, void* const)
native function SaveOwnageList(array<eOwnageMap> Maps)
{
    //native.Maps;        
}

// Export UGUIController::execGetWeaponList(FFrame&, void* const)
native final function GetWeaponList(out array< Class<wWeapon> > WeaponClass, out array<string> WeaponDesc)
{
    //native.WeaponClass;
    //native.WeaponDesc;        
}

// Export UGUIController::execGetMapList(FFrame&, void* const)
native final function GetMapList(string Prefix, GUIList List, optional bool bDecoText)
{
    //native.Prefix;
    //native.List;
    //native.bDecoText;        
}

// Export UGUIController::execLaunchURL(FFrame&, void* const)
native function LaunchURL(string URL)
{
    //native.URL;        
}

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
        else
        {
            DecoTextName = Mid(DecoTextName, InStr(DecoTextName, ".") + 1);
        }
    }
    Deco = Class'WGame.wUtil'.static.LoadDecoText(PackageName, DecoTextName);
    // End:0x7E
    if(Deco == none)
    {
        return "";
    }
    i = 0;
    J0x85:

    // End:0xDD [Loop If]
    if(i < Deco.Rows.Length)
    {
        // End:0xB6
        if(DecoText != "")
        {
            DecoText $= "|";
        }
        DecoText $= Deco.Rows[i];
        i++;
        // [Loop Continue]
        goto J0x85;
    }
    return DecoText;
    //return;    
}

final function GetTeamSymbolList(out array<string> SymbolNames, optional bool bNoSinglePlayer)
{
    Class'Engine.CacheManager'.static.GetTeamSymbolList(SymbolNames, bNoSinglePlayer);
    //return;    
}

function GUIPage TopPage()
{
    return ActivePage;
    //return;    
}

event InitializeController()
{
    local int i;
    local Class<GUIStyles> NewStyleClass;

    i = 0;
    J0x07:

    // End:0x8E [Loop If]
    if(i < DefaultStyleNames.Length)
    {
        NewStyleClass = Class<GUIStyles>(DynamicLoadObject(DefaultStyleNames[i], Class'Core.Class'));
        // End:0x84
        if(NewStyleClass != none)
        {
            // End:0x84
            if(!RegisterStyle(NewStyleClass))
            {
                Log("Could not create requested style" @ DefaultStyleNames[i]);
            }
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    i = 0;
    J0x95:

    // End:0x11C [Loop If]
    if(i < StyleNames.Length)
    {
        NewStyleClass = Class<GUIStyles>(DynamicLoadObject(StyleNames[i], Class'Core.Class'));
        // End:0x112
        if(NewStyleClass != none)
        {
            // End:0x112
            if(!RegisterStyle(NewStyleClass))
            {
                Log("Could not create requested style" @ StyleNames[i]);
            }
        }
        i++;
        // [Loop Continue]
        goto J0x95;
    }
    i = 0;
    J0x123:

    // End:0x153 [Loop If]
    if(i < FontStack.Length)
    {
        FontStack[i].Controller = self;
        i++;
        // [Loop Continue]
        goto J0x123;
    }
    Class'Engine.CacheManager'.static.InitCache();
    bECEEdition = CheckForECE();
    //return;    
}

function PrecachePlayerRecords()
{
    local PlayerRecord Rec;

    Rec = Class'WGame.wUtil'.static.GetPlayerRecord(0);
    //return;    
}

function bool RegisterStyle(Class<GUIStyles> StyleClass, optional bool bTemporary)
{
    local export editinline GUIStyles NewStyle;
    local int i, Index;

    Index = -1;
    // End:0x195
    if(StyleClass != none)
    {
        i = 0;
        J0x1D:

        // End:0xB5 [Loop If]
        if(i < StyleStack.Length)
        {
            // End:0x79
            if(StyleStack[i].Class == StyleClass)
            {
                Log(("Style already registered '" $ string(StyleClass)) $ "'");
                return true;
            }
            // End:0xAB
            if(StyleStack[i].KeyName == StyleClass.default.KeyName)
            {
                Index = i;
            }
            i++;
            // [Loop Continue]
            goto J0x1D;
        }
        NewStyle = new (none) StyleClass;
        // End:0x195
        if(NewStyle != none)
        {
            // End:0xEF
            if(Index < 0)
            {
                StyleStack[StyleStack.Length] = NewStyle;                
            }
            else
            {
                // End:0x137
                if(bModAuthor)
                {
                    Log((("Replacing Style" @ StyleStack[Index].KeyName) @ "with") @ string(NewStyle), 'ModAuthor');
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
    //return;    
}

event Class<GUIComponent> AddComponentClass(string ClassName)
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

event GUIPage FindPersistentMenuByName(string MenuClass)
{
    local int i;

    // End:0x0E
    if(MenuClass == "")
    {
        return none;
    }
    i = 0;
    J0x15:

    // End:0x5B [Loop If]
    if(i < PersistentStack.Length)
    {
        // End:0x51
        if(MenuClass ~= string(PersistentStack[i].Class))
        {
            return PersistentStack[i];
        }
        i++;
        // [Loop Continue]
        goto J0x15;
    }
    return none;
    //return;    
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

    // End:0x59 [Loop If]
    if(i < MenuStack.Length)
    {
        // End:0x4F
        if(MenuClass ~= string(MenuStack[i].Class))
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x19;
    }
    return -1;
    //return;    
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

    // End:0x4D [Loop If]
    if(i < MenuStack.Length)
    {
        // End:0x43
        if(MenuStack[i] == Menu)
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x18;
    }
    return -1;
    //return;    
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

    // End:0x4D [Loop If]
    if(i < PersistentStack.Length)
    {
        // End:0x43
        if(Menu == PersistentStack[i])
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x18;
    }
    return -1;
    //return;    
}

function GUIPage FindPersistentMenuByClass(Class<GUIPage> PageClass)
{
    local int i;

    // End:0x0D
    if(PageClass == none)
    {
        return none;
    }
    i = 0;
    J0x14:

    // End:0x59 [Loop If]
    if(i < PersistentStack.Length)
    {
        // End:0x4F
        if(ClassIsChildOf(PersistentStack[i].Class, PageClass))
        {
            return PersistentStack[i];
        }
        i++;
        // [Loop Continue]
        goto J0x14;
    }
    return none;
    //return;    
}

function GUIPage FindMenuByClass(Class<GUIPage> PageClass)
{
    local int i;

    // End:0x0D
    if(PageClass == none)
    {
        return none;
    }
    i = 0;
    J0x14:

    // End:0x59 [Loop If]
    if(i < MenuStack.Length)
    {
        // End:0x4F
        if(ClassIsChildOf(MenuStack[i].Class, PageClass))
        {
            return MenuStack[i];
        }
        i++;
        // [Loop Continue]
        goto J0x14;
    }
    return none;
    //return;    
}

function GUIPage GetMenuByIndex(int Index)
{
    // End:0x12
    if((Count()) <= Index)
    {
        return none;
    }
    return MenuStack[Index];
    //return;    
}

function LogMenuStack()
{
    local int i;
    local export editinline GUIPage Page;

    Log("[CallMenuStack] Start");
    Log("-------------------------------------------");
    Log("Controller.MenuStack.Length = " $ string(Count()));
    i = 0;
    J0x7B:

    // End:0xC1 [Loop If]
    if(i < (Count()))
    {
        Page = GetMenuByIndex(i);
        Log(string(i) @ string(Page.Name));
        i++;
        // [Loop Continue]
        goto J0x7B;
    }
    Log("-------------------------------------------");
    Log("[CallMenuStack] End");
    //return;    
}

function LogControllerInfo()
{
    Log("[ControllerInfo] Start");
    Log("-------------------------------------------");
    Log("Controller Log!!!!!!");
    // End:0x9F
    if(FocusedControl != none)
    {
        Log("    FocusedControl = " $ string(self.FocusedControl.Name));        
    }
    else
    {
        Log("    FocusedControl = none");
    }
    // End:0xF9
    if(ActiveControl != none)
    {
        Log("    ActiveControl = " $ string(self.ActiveControl.Name));        
    }
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
        // End:0x1D4
        if(ActivePage.FocusedControl != none)
        {
            Log("    FocusedControl = " $ string(ActivePage.FocusedControl.Name));            
        }
        else
        {
            Log("    FocusedControl = none");
        }
        // End:0x23A
        if(ActivePage.FocusInstead != none)
        {
            Log("    FocusInstead = " $ string(ActivePage.FocusInstead.Name));            
        }
        else
        {
            Log("    FocusInstead = none");
        }
        // End:0x29B
        if(ActivePage.PageOwner != none)
        {
            Log("    PageOwner = " $ string(ActivePage.PageOwner.Name));            
        }
        else
        {
            Log("    PageOwner = none");
        }
        // End:0x2F9
        if(ActivePage.MenuOwner != none)
        {
            Log("    MenuOwner = " $ string(ActivePage.MenuOwner.Name));            
        }
        else
        {
            Log("    MenuOwner = none");
        }        
    }
    else
    {
        Log("ActivePage = none");
    }
    // End:0x4E9
    if((TopPage()) != none)
    {
        Log("TopPage = " $ string(TopPage().Name));
        // End:0x3A3
        if(TopPage().FocusedControl != none)
        {
            Log("    FocusedControl = " $ string(TopPage().FocusedControl.Name));            
        }
        else
        {
            Log("    FocusedControl = none");
        }
        // End:0x40B
        if(TopPage().FocusInstead != none)
        {
            Log("    FocusInstead = " $ string(TopPage().FocusInstead.Name));            
        }
        else
        {
            Log("    FocusInstead = none");
        }
        // End:0x46E
        if(TopPage().PageOwner != none)
        {
            Log("    PageOwner = " $ string(TopPage().PageOwner.Name));            
        }
        else
        {
            Log("    PageOwner = none");
        }
        // End:0x4CE
        if(TopPage().MenuOwner != none)
        {
            Log("    MenuOwner = " $ string(TopPage().MenuOwner.Name));            
        }
        else
        {
            Log("    MenuOwner = none");
        }        
    }
    else
    {
        Log("TopPage = none");
    }
    Log("-------------------------------------------");
    Log("[ControllerInfo] End");
    //return;    
}

function LogControlInfo(GUIComponent Sender)
{
    Log("[ControlInfo] Start");
    Log("-------------------------------------------");
    // End:0x1BC
    if(Sender != none)
    {
        Log("Sender = " $ string(Sender.Name));
        Log("Sender.MenuState = " $ string(Sender.MenuState));
        // End:0xE2
        if(Sender.FocusInstead != none)
        {
            Log("    FocusInstead = " $ string(Sender.FocusInstead.Name));            
        }
        else
        {
            Log("    FocusInstead = none");
        }
        // End:0x143
        if(Sender.PageOwner != none)
        {
            Log("    PageOwner = " $ string(Sender.PageOwner.Name));            
        }
        else
        {
            Log("    PageOwner = none");
        }
        // End:0x1A1
        if(Sender.MenuOwner != none)
        {
            Log("    MenuOwner = " $ string(Sender.MenuOwner.Name));            
        }
        else
        {
            Log("    MenuOwner = none");
        }        
    }
    else
    {
        Log("Sender = none");
    }
    Log("-------------------------------------------");
    Log("[ControlInfo] End");
    //return;    
}

function GUIPage GetLastMenu()
{
    return MenuStack[MenuStack.Length - 1];
    //return;    
}

event GUIPage CreateMenu(string NewMenuName)
{
    local Class<GUIPage> NewMenuClass;
    local export editinline GUIPage NewMenu;
    local int i;

    // End:0x2E
    if(NewMenuName ~= "XInterface.UT2MainMenu")
    {
        NewMenuName = GetMainMenuClass();
    }
    NewMenuClass = Class<GUIPage>(AddComponentClass(NewMenuName));
    // End:0x154
    if(NewMenuClass != none)
    {
        // End:0xB4
        if(NewMenuClass.default.bPersistent)
        {
            i = 0;
            J0x68:

            // End:0xB4 [Loop If]
            if(i < PersistentStack.Length)
            {
                // End:0xAA
                if(PersistentStack[i].Class == NewMenuClass)
                {
                    NewMenu = PersistentStack[i];
                    // [Explicit Break]
                    goto J0xB4;
                }
                i++;
                // [Loop Continue]
                goto J0x68;
            }
        }
        J0xB4:

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
    Log(("Could not DLO menu '" $ NewMenuName) $ "'");
    return none;
    //return;    
}

event bool OpenMenu(string NewMenuName, optional string Param1, optional string Param2)
{
    local export editinline GUIPage NewMenu;

    // End:0x4D
    if(bModAuthor)
    {
        Log(((((((string(Class) @ "OpenMenu [") $ NewMenuName) $ "] (") $ Param1) $ ") (") $ Param2) $ ")", 'ModAuthor');
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
    // End:0xD7
    if(!bCurMenuInitialized && MenuStack.Length > 0)
    {
        // End:0xD5
        if(bModAuthor)
        {
            Log("Cannot open menu until menu initialization is complete!", 'ModAuthor');
        }
        return false;
    }
    NewMenu = CreateMenu(NewMenuName);
    // End:0x16D
    if(NewMenu != none)
    {
        // End:0x112
        if((FindMenuIndex(NewMenu)) != -1)
        {
            bCurMenuInitialized = true;
            return false;
        }
        NewMenu.ParentPage = ActivePage;
        ResetFocus();
        PushMenu(MenuStack.Length, NewMenu, Param1, Param2);
        // End:0x16B
        if(NewMenu.bDisconnectOnOpen)
        {
            ConsoleCommand("DISCONNECT");
        }
        return true;
    }
    Log("Could not open menu" @ NewMenuName);
    return false;
    //return;    
}

function bool OpenMenuByObject(GUIPage NewMenu, optional string Param1, optional string Param2)
{
    // End:0x85
    if(NewMenu != none)
    {
        // End:0x2A
        if((FindMenuIndex(NewMenu)) != -1)
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
    //return;    
}

event AutoLoadMenus()
{
    local export editinline GUIPage NewMenu;
    local int i;

    super.AutoLoadMenus();
    i = 0;
    J0x0D:

    // End:0x9F [Loop If]
    if(i < AutoLoad.Length)
    {
        NewMenu = CreateMenu(AutoLoad[i].MenuClassName);
        // End:0x70
        if(NewMenu == none)
        {
            Log("Could not auto-load" @ AutoLoad[i].MenuClassName);
            // [Explicit Continue]
            goto J0x95;
        }
        // End:0x95
        if(AutoLoad[i].bPreInitialize)
        {
            NewMenu.InitComponent(self, none);
        }
        J0x95:

        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

event bool ReplaceMenu(string NewMenuName, optional string Param1, optional string Param2, optional bool bCancelled)
{
    local export editinline GUIPage NewMenu;

    // End:0x2F
    if((ActivePage == none) || MenuStack.Length == 0)
    {
        return OpenMenu(NewMenuName, Param1, Param2);
    }
    // End:0x81
    if(bModAuthor)
    {
        Log(((((((string(Class) @ "ReplaceMenu [") $ NewMenuName) $ "]  (") $ Param1) $ ")  (") $ Param2) $ ")", 'ModAuthor');
    }
    // End:0xE8
    if(!bCurMenuInitialized && MenuStack.Length > 0)
    {
        // End:0xE6
        if(bModAuthor)
        {
            Log("Cannot replace menu until menu initialization is complete!", 'ModAuthor');
        }
        return false;
    }
    NewMenu = CreateMenu(NewMenuName);
    // End:0x15D
    if(NewMenu != none)
    {
        NewMenu.ParentPage = ActivePage.ParentPage;
        ResetFocus();
        PopMenu(-1, ActivePage, bCancelled);
        PushMenu(MenuStack.Length - 1, NewMenu, Param1, Param2);
        return true;
    }
    return false;
    //return;    
}

function CloseMenuPage(GUIPage SelectPage, optional bool bCancelled)
{
    // End:0x4B
    if((MenuStack.Length == 0) || SelectPage == none)
    {
        Log("Attempting to close a non-existing menu page");
        return;
    }
    // End:0x88
    if(bModAuthor)
    {
        Log(((string(Class) @ "CloseMenu [") $ string(ActivePage.Name)) $ "]", 'ModAuthor');
    }
    // End:0xDA
    if(!bCurMenuInitialized)
    {
        // End:0xD8
        if(bModAuthor)
        {
            Log("Cannot close menu until initialization is complete!", 'ModAuthor');
        }
        return;
    }
    // End:0xFA
    if(!SelectPage.OnCanClose(bCancelled))
    {
        return;
    }
    ResetInput();
    SelectPage.PlayCloseSound();
    PopMenu(FindMenuIndex(SelectPage), SelectPage, bCancelled);
    SelectPage.CheckResolution(true, self);
    bCurMenuInitialized = false;
    // End:0x1B6
    if(MenuStack.Length > 0)
    {
        ActivePage = MenuStack[MenuStack.Length - 1];
        ActivePage.MenuState = 2;
        ResetFocus();
        ActivePage.FocusFirst(none);
        // End:0x1B3
        if(!ActivePage.bNeverFocus)
        {
            ActivePage.OnActivate();
        }        
    }
    else
    {
        // End:0x1EC
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
    //return;    
}

function ReplaceMenu2_FadedOut()
{
    CloseMenuPage(SaveFadeOutPage, bSaveCancelled);
    //return;    
}

function ReplaceMenu2(string NewMenuName, optional bool bCancelled)
{
    local export editinline GUIPage ppage;

    ppage = TopPage();
    // End:0x2F
    if(ppage == none)
    {
        ReplaceMenu(NewMenuName, "", "", bCancelled);        
    }
    else
    {
        SaveFadeOutPage = ppage;
        ppage.__FadedOut__Delegate = ReplaceMenu2_FadedOut;
        ppage.FadeOut(false, true);
        OpenMenu(NewMenuName, "", "");
    }
    //return;    
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
    // End:0xA8
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
    //return;    
}

protected event PopMenu(int Index, GUIPage CurMenu, optional bool bCancelled)
{
    CloseOverlays();
    CurMenu.Closed(CurMenu, bCancelled);
    // End:0x7C
    if(((Index >= 0) && (Index + 1) < MenuStack.Length) && MenuStack[Index + 1] != none)
    {
        MenuStack[Index + 1].ParentPage = CurMenu.ParentPage;
    }
    CurMenu.ParentPage = none;
    CurMenu.free();
    // End:0xA8
    if(Index < 0)
    {
        return;
    }
    // End:0xE0
    if((Index >= MenuStack.Length) || MenuStack[Index] != CurMenu)
    {
        Index = FindMenuIndex(CurMenu);
    }
    // End:0x109
    if((Index >= 0) && Index < MenuStack.Length)
    {
        MenuStack.Remove(Index, 1);
    }
    //return;    
}

function bool RemoveMenuAt(int Index, optional bool bCancelled)
{
    // End:0x1F
    if((Index < 0) || Index >= MenuStack.Length)
    {
        return false;
    }
    return RemoveMenu(MenuStack[Index], bCancelled);
    //return;    
}

event bool RemoveMenu(GUIPage Menu, optional bool bCancelled)
{
    // End:0x5B
    if(MenuStack.Length == 0)
    {
        Log("GUIController.RemoveMenu() - Attempting to close a non-existing menu page");
        return false;
    }
    // End:0x84
    if((Menu == none) || Menu == ActivePage)
    {
        return CloseMenu(bCancelled);
    }
    // End:0xC2
    if(bModAuthor)
    {
        Log(((string(Class) @ "RemoveMenu [") $ string(Menu.Name)) $ "]", 'ModAuthor');
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
    // End:0x1AE
    if(MenuStack.Length == 0)
    {
        // End:0x1A0
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
    //return;    
}

event bool CloseMenu(optional bool bCancelled)
{
    // End:0x4B
    if((MenuStack.Length == 0) || ActivePage == none)
    {
        Log("Attempting to close a non-existing menu page");
        return false;
    }
    // End:0x88
    if(bModAuthor)
    {
        Log(((string(Class) @ "CloseMenu [") $ string(ActivePage.Name)) $ "]", 'ModAuthor');
    }
    // End:0xDA
    if(!bCurMenuInitialized)
    {
        // End:0xD8
        if(bModAuthor)
        {
            Log("Cannot close menu until initialization is complete!", 'ModAuthor');
        }
        return false;
    }
    // End:0xFA
    if(!ActivePage.OnCanClose(bCancelled))
    {
        return false;
    }
    ResetInput();
    ActivePage.PlayCloseSound();
    PopMenu(FindMenuIndex(ActivePage), ActivePage, bCancelled);
    ActivePage.CheckResolution(true, self);
    bCurMenuInitialized = false;
    // End:0x1B6
    if(MenuStack.Length > 0)
    {
        ActivePage = MenuStack[MenuStack.Length - 1];
        ActivePage.MenuState = 2;
        ResetFocus();
        ActivePage.FocusFirst(none);
        // End:0x1B3
        if(!ActivePage.bNeverFocus)
        {
            ActivePage.OnActivate();
        }        
    }
    else
    {
        // End:0x1EB
        if(!ActivePage.bAllowedAsLast && !MainNotWanted)
        {
            ActivePage = none;
            return OpenMenu(GetMainMenuClass());
        }
        ActivePage = none;
        SetControllerStatus(false);
    }
    bCurMenuInitialized = true;
    // End:0x21F
    if(ActivePage != none)
    {
        ActivePage.OnReOpen();
    }
    bForceMouseCheck = true;
    return true;
    //return;    
}

event CloseAll(bool bCancel, optional bool bForced)
{
    local int i;

    // End:0x104
    if(bModAuthor)
    {
        Log(((((((string(Name) @ "CloseAll bCancel:") $ string(bCancel)) @ "Forced:") $ string(bForced)) @ "(Currently") @ string(MenuStack.Length)) @ "menus open)", 'ModAuthor');
        i = 0;
        J0x79:

        // End:0x104 [Loop If]
        if(i < MenuStack.Length)
        {
            // End:0xC2
            if(MenuStack[i] == none)
            {
                Log(("   Menu[" $ string(i)) $ "]: None", 'ModAuthor');
                // [Explicit Continue]
                goto J0xFA;
            }
            Log((("   Menu[" $ string(i)) $ "]:") $ string(MenuStack[i].Name), 'ModAuthor');
            J0xFA:

            i++;
            // [Loop Continue]
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
    // End:0x13F
    if(MenuStack.Length >= 0)
    {
        CloseMenu(bCancel);
    }
    MainNotWanted = false;
    i = MenuStack.Length - 1;
    J0x156:

    // End:0x187 [Loop If]
    if(i >= 0)
    {
        PopMenu(i, MenuStack[i], bCancel);
        i--;
        // [Loop Continue]
        goto J0x156;
    }
    // End:0x1C7
    if(GameResolution != "")
    {
        Console(Master.Console).DelayedConsoleCommand("SETRES" @ GameResolution);
        GameResolution = "";
    }
    ActivePage = none;
    SetControllerStatus(false);
    //return;    
}

function int Count()
{
    return MenuStack.Length;
    //return;    
}

function SaveRestorePages()
{
    local int i;
    local string Param1, Param2, MenuClass;

    RestoreMenus.Remove(0, RestoreMenus.Length);
    i = MenuStack.Length - 1;
    J0x1C:

    // End:0xE6 [Loop If]
    if(i >= 0)
    {
        // End:0xDC
        if(MenuStack[i] != none)
        {
            // End:0xDC
            if(MenuStack[i].bRestorable)
            {
                MenuClass = string(MenuStack[i].Class);
                Param1 = "";
                Param2 = "";
                // End:0xDC
                if(MenuStack[i].GetRestoreParams(Param1, Param2))
                {
                    RestoreMenus.Insert(0, 1);
                    RestoreMenus[0].MenuClassName = MenuClass;
                    RestoreMenus[0].Param1 = Param1;
                    RestoreMenus[0].Param2 = Param2;
                }
            }
        }
        i--;
        // [Loop Continue]
        goto J0x1C;
    }
    //return;    
}

function PerformRestore()
{
    local int i, idx;

    // End:0x53
    if(bModAuthor)
    {
        Log(("Restoring previously open menus (" $ string(RestoreMenus.Length)) $ " menus to restore)", 'ModAuthor');
    }
    i = 0;
    J0x5A:

    // End:0xD5 [Loop If]
    if(i < RestoreMenus.Length)
    {
        idx = FindMenuIndexByName(RestoreMenus[i].MenuClassName);
        // End:0xCB
        if(idx == -1)
        {
            OpenMenu(RestoreMenus[i].MenuClassName, RestoreMenus[i].Param1, RestoreMenus[i].Param2);
        }
        i++;
        // [Loop Continue]
        goto J0x5A;
    }
    RestoreMenus.Remove(0, RestoreMenus.Length);
    //return;    
}

function SetControllerStatus(bool On)
{
    local bool bWasActive;

    // End:0x51
    if(((bActive && !On) && ViewportOwner != none) && ViewportOwner.Actor != none)
    {
        ViewportOwner.Actor.UnPressButtons();
    }
    bWasActive = bActive;
    bActive = On;
    bVisible = On;
    bRequiresTick = On;
    // End:0xD6
    if(((bActive && !bWasActive) && ViewportOwner != none) && ViewportOwner.Actor != none)
    {
        ViewportOwner.Actor.UnPressButtons();
    }
    ViewportOwner.bShowWindowsMouse = On && ViewportOwner.bWindowsMouseAvailable;
    // End:0x114
    if(On)
    {
        bIgnoreUntilPress = true;        
    }
    else
    {
        ResetDesigner();
    }
    PurgeComponentClasses();
    //return;    
}

event ChangeFocus(GUIComponent Who)
{
    // End:0x1B
    if(Who != none)
    {
        Who.SetFocus(none);
    }
    return;
    //return;    
}

function ResetFocus()
{
    MoveControl = none;
    // End:0x2A
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
    RepeatTime = 0.0000000;
    //return;    
}

event MoveFocused(GUIComponent C, int bmLeft, int bmTop, int bmWidth, int bmHeight, float ClipX, float ClipY, float val)
{
    // End:0x5E
    if(C.bScaleToParent && C.MenuOwner != none)
    {
        ClipX = C.MenuOwner.ActualWidth();
        ClipY = C.MenuOwner.ActualHeight();
    }
    // End:0xF7
    if(bmLeft != 0)
    {
        // End:0xD9
        if(((C.WinLeft < 2.0000000) && C.WinLeft > -2.0000000) && !C.bNeverScale)
        {
            C.WinLeft += ((val / ClipX) * float(bmLeft));            
        }
        else
        {
            C.WinLeft += (val * float(bmLeft));
        }
    }
    // End:0x190
    if(bmTop != 0)
    {
        // End:0x172
        if(((C.WinTop < 2.0000000) && C.WinTop > -2.0000000) && !C.bNeverScale)
        {
            C.WinTop += ((val / ClipY) * float(bmTop));            
        }
        else
        {
            C.WinTop += (val * float(bmTop));
        }
    }
    // End:0x229
    if(bmWidth != 0)
    {
        // End:0x20B
        if(((C.WinWidth < 2.0000000) && C.WinWidth > -2.0000000) && !C.bNeverScale)
        {
            C.WinWidth += ((val / ClipX) * float(bmWidth));            
        }
        else
        {
            C.WinWidth += (val * float(bmWidth));
        }
    }
    // End:0x292
    if(bmHeight != 0)
    {
        // End:0x274
        if(C.WinHeight <= 2.0000000)
        {
            C.WinHeight += ((val / ClipX) * float(bmHeight));            
        }
        else
        {
            C.WinHeight += (val * float(bmHeight));
        }
    }
    //return;    
}

function bool HasMouseMoved(optional float ErrorMargin)
{
    return (Abs(MouseX - LastMouseX) > Abs(ErrorMargin)) || Abs(MouseY - LastMouseY) > Abs(ErrorMargin);
    //return;    
}

event bool CanShowHints()
{
    // End:0x0B
    if(bNoToolTips)
    {
        return false;
    }
    // End:0x2C
    if((ActivePage != none) && ActivePage.bCaptureMouse)
    {
        return false;
    }
    // End:0x46
    if((DropSource != none) || DropTarget != none)
    {
        return false;
    }
    // End:0x69
    if((!bDesignModeToolTips && bDesignMode) && bHighlightCurrent)
    {
        return false;
    }
    return true;
    //return;    
}

event bool NeedsMenuResolution()
{
    local int i;

    i = MenuStack.Length - 1;
    J0x0F:

    // End:0x6E [Loop If]
    if(i >= 0)
    {
        // End:0x47
        if((MenuStack[i] != none) && MenuStack[i].bRequire640x480)
        {
            return true;
        }
        // End:0x64
        if(!MenuStack[i].bRenderWorld)
        {
            // [Explicit Break]
            goto J0x6E;
        }
        i--;
        // [Loop Continue]
        goto J0x0F;
    }
    J0x6E:

    return false;
    //return;    
}

event SetRequiredGameResolution(string GameRes)
{
    GameResolution = GameRes;
    //return;    
}

event NotifyLevelChange()
{
    local int i;

    // End:0x2E
    if(bModAuthor)
    {
        Log(string(Class) @ "NotifyLevelChange()", 'ModAuthor');
    }
    ResetDesigner();
    // End:0x9E
    if(((bActive && ViewportOwner.Actor != none) && ViewportOwner.Actor.Level != none) && ViewportOwner.Actor.Level.IsPendingConnection())
    {
        SaveRestorePages();
    }
    i = MenuStack.Length - 1;
    J0xAD:

    // End:0x126 [Loop If]
    if((i >= 0) && MenuStack.Length != 0)
    {
        // End:0x11C
        if(MenuStack[i] != none)
        {
            // End:0xF2
            if(MenuStack[i].bPersistent)
            {
                // [Explicit Continue]
                goto J0x11C;
            }
            // End:0x11C
            if(MenuStack[i].NotifyLevelChange())
            {
                RemoveMenu(MenuStack[i], true);
            }
        }
        J0x11C:

        i--;
        // [Loop Continue]
        goto J0xAD;
    }
    i = PersistentStack.Length - 1;
    J0x135:

    // End:0x1DD [Loop If]
    if(i >= 0)
    {
        // End:0x1D3
        if((PersistentStack[i] != none) && PersistentStack[i].NotifyLevelChange())
        {
            // End:0x198
            if(PersistentStack[i].IsOpen())
            {
                RemoveMenu(PersistentStack[i], true);                
            }
            else
            {
                PersistentStack[i].free();
            }
            // End:0x1D3
            if(!PersistentStack[i].bPersistent)
            {
                PersistentStack.Remove(i, 1);
            }
        }
        i--;
        // [Loop Continue]
        goto J0x135;
    }
    PurgeObjectReferences();
    VerifyStack();
    // End:0x202
    if(MenuStack.Length > 0)
    {
        RestoreMenus.Remove(0, RestoreMenus.Length);
    }
    //return;    
}

function CloseOverlays()
{
    MouseOver = none;
    ContextMenu = none;
    //return;    
}

function VerifyStack()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x98 [Loop If]
    if(i < MenuStack.Length)
    {
        // End:0x60
        if((MenuStack[i] == none) || (MenuStack[i].Controller == none) && bCurMenuInitialized)
        {
            MenuStack.Remove(i--, 1);
            // [Explicit Continue]
            goto J0x8E;
        }
        // End:0x8E
        if(i > 0)
        {
            MenuStack[i].ParentPage = MenuStack[i - 1];
        }
        J0x8E:

        i++;
        // [Loop Continue]
        goto J0x07;
    }
    ConsolidateMenus();
    //return;    
}

function PurgeObjectReferences()
{
    local Class<GUIStyles> OriginalStyle;
    local int i;

    i = 0;
    J0x07:

    // End:0x145 [Loop If]
    if(i < STYLE_NUM)
    {
        // End:0xA0
        if(StyleStack[i] == none)
        {
            OriginalStyle = Class<GUIStyles>(DynamicLoadObject(DefaultStyleNames[i], Class'Core.Class'));
            // End:0xA0
            if(!RegisterStyle(OriginalStyle))
            {
                Log(((("Could not restore default style " $ string(i)) $ " (") $ DefaultStyleNames[i]) $ ")");
                // [Explicit Continue]
                goto J0x13B;
            }
        }
        // End:0x13B
        if(StyleStack[i].bTemporary)
        {
            OriginalStyle = Class<GUIStyles>(DynamicLoadObject(DefaultStyleNames[i], Class'Core.Class'));
            // End:0x13B
            if(!RegisterStyle(OriginalStyle))
            {
                Log(((("Could not restore default style " $ string(i)) $ " (") $ DefaultStyleNames[i]) $ ")");
                StyleStack[i] = none;
            }
        }
        J0x13B:

        i++;
        // [Loop Continue]
        goto J0x07;
    }
    // End:0x16D
    if(StyleStack.Length > STYLE_NUM)
    {
        StyleStack.Remove(STYLE_NUM, StyleStack.Length - STYLE_NUM);
    }
    // End:0x195
    if(FontStack.Length > FONT_NUM)
    {
        FontStack.Remove(FONT_NUM, FontStack.Length - FONT_NUM);
    }
    // End:0x1BD
    if(MouseCursors.Length > CURSOR_NUM)
    {
        MouseCursors.Remove(CURSOR_NUM, MouseCursors.Length - CURSOR_NUM);
    }
    PurgeComponentClasses();
    //return;    
}

function PurgeComponentClasses()
{
    //return;    
}

function ConsolidateMenus()
{
    local int i, j;

    i = MenuStack.Length - 1;
    J0x0F:

    // End:0xAC [Loop If]
    if(i >= 0)
    {
        j = 0;
        J0x21:

        // End:0xA2 [Loop If]
        if(j < i)
        {
            // End:0x98
            if(MenuStack[i].Class == MenuStack[j].Class)
            {
                MenuStack[j + 1].ParentPage = MenuStack[j].ParentPage;
                MenuStack.Remove(j, 1);
                // [Explicit Break]
                goto J0xA2;
            }
            j++;
            // [Loop Continue]
            goto J0x21;
        }
        J0xA2:

        i--;
        // [Loop Continue]
        goto J0x0F;
    }
    //return;    
}

static event Validate()
{
    //return;    
}

// Export UGUIController::execGetMainMenuClass(FFrame&, void* const)
native static final function string GetMainMenuClass();

static function string GetSinglePlayerPage()
{
    //return;    
}

static function string GetServerBrowserPage()
{
    //return;    
}

static function string GetMultiplayerPage()
{
    //return;    
}

static function string GetInstantActionPage()
{
    //return;    
}

static function string GetModPage()
{
    //return;    
}

static function string GetSettingsPage()
{
    //return;    
}

static function string GetQuitPage()
{
    //return;    
}

final function bool SetKeyBind(string BindKeyName, string BindKeyValue)
{
    ViewportOwner.Actor.ConsoleCommand(("set Input" @ BindKeyName) @ BindKeyValue);
    return true;
    //return;    
}

final function bool KeyNameFromIndex(byte iKey, out string KeyName, out string LocalizedKeyName)
{
    KeyName = ViewportOwner.Actor.ConsoleCommand("KEYNAME" @ string(iKey));
    LocalizedKeyName = ViewportOwner.Actor.ConsoleCommand("LOCALIZEDKEYNAME" @ string(iKey));
    return KeyName != "";
    //return;    
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
    //return;    
}

final function bool GetAssignedKeys(string BindAlias, out array<string> BindKeyNames, out array<string> LocalizedBindKeyNames)
{
    local int i, iKey;
    local string S;

    BindKeyNames.Length = 0;
    LocalizedBindKeyNames.Length = 0;
    S = ViewportOwner.Actor.ConsoleCommand((("BINDINGTOKEY" @ "\"") $ BindAlias) $ "\"");
    // End:0x10F
    if(S != "")
    {
        Split(S, ",", BindKeyNames);
        i = 0;
        J0x6F:

        // End:0x10F [Loop If]
        if(i < BindKeyNames.Length)
        {
            iKey = int(ViewportOwner.Actor.ConsoleCommand("KEYNUMBER" @ BindKeyNames[i]));
            // End:0x105
            if(iKey != -1)
            {
                LocalizedBindKeyNames[i] = ViewportOwner.Actor.ConsoleCommand("LOCALIZEDKEYNAME" @ string(iKey));
            }
            i++;
            // [Loop Continue]
            goto J0x6F;
        }
    }
    return BindKeyNames.Length > 0;
    //return;    
}

final function bool SearchBinds(string BindAliasMask, out array<string> BindAliases)
{
    local string S;

    BindAliases.Length = 0;
    S = ViewportOwner.Actor.ConsoleCommand((("FINDKEYBINDS" @ "\"") $ BindAliasMask) $ "\"");
    // End:0x60
    if(S != "")
    {
        Split(S, ",", BindAliases);
    }
    return BindAliases.Length > 0;
    //return;    
}

final function bool KeyPressed(Interactions.EInputKey iKey)
{
    return int(KeyDown[int(iKey)]) != 0;
    //return;    
}

function GUIQuestionPage ShowQuestionDialog(string Question, optional byte Buttons, optional byte defButton)
{
    local export editinline GUIQuestionPage QPage;

    // End:0x15
    if(int(Buttons) == 0)
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
    //return;    
}

defaultproperties
{
    FONT_NUM=9
    STYLE_NUM=31
    CURSOR_NUM=7
    MouseCursorOffset[0]=none
    MouseCursorOffset[1]=none
    MouseCursorOffset[2]=none
    MouseCursorOffset[3]=none
    MouseCursorOffset[4]=none
    MouseCursorOffset[5]=none
    MouseCursorOffset[6]=none
    // Reference: UT2MenuFont'XInterface_Decompressed.GUIController.GUIMenuFont'
    begin object name="GUIMenuFont" class=XInterface_Decompressed.UT2MenuFont
    end object
    FontStack[0]=GUIMenuFont
    // Reference: UT2DefaultFont'XInterface_Decompressed.GUIController.GUIDefaultFont'
    begin object name="GUIDefaultFont" class=XInterface_Decompressed.UT2DefaultFont
    end object
    FontStack[1]=GUIDefaultFont
    // Reference: UT2LargeFont'XInterface_Decompressed.GUIController.GUILargeFont'
    begin object name="GUILargeFont" class=XInterface_Decompressed.UT2LargeFont
    end object
    FontStack[2]=GUILargeFont
    // Reference: UT2HeaderFont'XInterface_Decompressed.GUIController.GUIHeaderFont'
    begin object name="GUIHeaderFont" class=XInterface_Decompressed.UT2HeaderFont
    end object
    FontStack[3]=GUIHeaderFont
    // Reference: UT2SmallFont'XInterface_Decompressed.GUIController.GUISmallFont'
    begin object name="GUISmallFont" class=XInterface_Decompressed.UT2SmallFont
    end object
    FontStack[4]=GUISmallFont
    // Reference: UT2MidGameFont'XInterface_Decompressed.GUIController.GUIMidGameFont'
    begin object name="GUIMidGameFont" class=XInterface_Decompressed.UT2MidGameFont
    end object
    FontStack[5]=GUIMidGameFont
    // Reference: UT2SmallHeaderFont'XInterface_Decompressed.GUIController.GUISmallHeaderFont'
    begin object name="GUISmallHeaderFont" class=XInterface_Decompressed.UT2SmallHeaderFont
    end object
    FontStack[6]=GUISmallHeaderFont
    // Reference: UT2ServerListFont'XInterface_Decompressed.GUIController.GUIServerListFont'
    begin object name="GUIServerListFont" class=XInterface_Decompressed.UT2ServerListFont
    end object
    FontStack[7]=GUIServerListFont
    // Reference: UT2IRCFont'XInterface_Decompressed.GUIController.GUIIRCFont'
    begin object name="GUIIRCFont" class=XInterface_Decompressed.UT2IRCFont
    end object
    FontStack[8]=GUIIRCFont
    MouseCursors[0]=Texture'InterfaceContent.Menu.MouseCursor'
    MouseCursors[1]=Texture'InterfaceContent.Menu.SplitterCursor'
    MouseCursors[2]=Texture'InterfaceContent.Menu.SplitterCursor'
    MouseCursors[3]=Texture'InterfaceContent.Menu.SplitterCursorVert'
    MouseCursors[4]=Texture'InterfaceContent.Menu.SplitterCursor'
    MouseCursors[5]=Texture'InterfaceContent.Menu.SplitterCursor'
    MouseCursors[6]=Texture'InterfaceContent.Menu.MouseCursor'
    DefaultStyleNames[0]="XInterface.STY_RoundButton"
    DefaultStyleNames[1]="XInterface.STY_RoundScaledButton"
    DefaultStyleNames[2]="XInterface.STY_SquareButton"
    DefaultStyleNames[3]="XInterface.STY_ListBox"
    DefaultStyleNames[4]="XInterface.STY_ScrollZone"
    DefaultStyleNames[5]="XInterface.STY_TextButton"
    DefaultStyleNames[6]="XInterface.STY_Page"
    DefaultStyleNames[7]="XInterface.STY_Header"
    DefaultStyleNames[8]="XInterface.STY_Footer"
    DefaultStyleNames[9]="XInterface.STY_TabButton"
    DefaultStyleNames[10]="XInterface.STY_CharButton"
    DefaultStyleNames[11]="XInterface.STY_ArrowLeft"
    DefaultStyleNames[12]="XInterface.STY_ArrowRight"
    DefaultStyleNames[13]="XInterface.STY_ServerBrowserGrid"
    DefaultStyleNames[14]="XInterface.STY_NoBackground"
    DefaultStyleNames[15]="XInterface.STY_ServerBrowserGridHeader"
    DefaultStyleNames[16]="XInterface.STY_SliderCaption"
    DefaultStyleNames[17]="XInterface.STY_LadderButton"
    DefaultStyleNames[18]="XInterface.STY_LadderButtonHi"
    DefaultStyleNames[19]="XInterface.STY_LadderButtonActive"
    DefaultStyleNames[20]="XInterface.STY_BindBox"
    DefaultStyleNames[21]="XInterface.STY_SquareBar"
    DefaultStyleNames[22]="XInterface.STY_MidGameButton"
    DefaultStyleNames[23]="XInterface.STY_TextLabel"
    DefaultStyleNames[24]="XInterface.STY_ComboListBox"
    DefaultStyleNames[25]="XInterface.STY_SquareMenuButton"
    DefaultStyleNames[26]="XInterface.STY_IRCText"
    DefaultStyleNames[27]="XInterface.STY_IRCEntry"
    DefaultStyleNames[28]="XInterface.STY_ListSelection"
    DefaultStyleNames[29]="XInterface.STY_EditBox"
    DefaultStyleNames[30]="GUIWarfare.STY2WarfareListBox"
    DesignModeHints[0]=(key=" Key",Description="                                Description")
    DesignModeHints[1]=(key=" (F1)",Description="                                View this help screen")
    DesignModeHints[2]=(key=" Ctrl + Alt + D",Description="                      Toggles design mode")
    DesignModeHints[3]=(key=" Ctrl + Alt + E",Description="                      Toggles property editor mode")
    DesignModeHints[4]=(key=" [Ctrl +] H",Description="                          Toggles active/focused info")
    DesignModeHints[5]=(key=" [Ctrl +] I",Description="                          Toggle interactive mode")
    DesignModeHints[6]=(key=" [Ctrl +] P",Description="                          Toggles full MenuOwner chains for active/focused")
    DesignModeHints[7]=(key=" [Ctrl +] C",Description="                          Copy MoveControl position to clipboard")
    DesignModeHints[8]=(key=" [Ctrl +] X",Description="                          Export MoveControl to clipboard")
    DesignModeHints[9]=(key=" [Ctrl +] U",Description="                          Refresh the property window in the designer")
    DesignModeHints[10]=(key=" [Ctrl +] Up/Down/Left/Right",Description="         Reposition MoveControl using arrow keys")
    DesignModeHints[11]=(key=" [Ctrl +] +/-",Description="                        Resize MoveControl vertically")
    DesignModeHints[12]=(key=" [Ctrl +] Num+/Num-",Description="                  Resize selected component horizontally")
    DesignModeHints[13]=(key=" [Ctrl +] WheelUp",Description="                    Set MoveControl to MoveControl's menuowner")
    DesignModeHints[14]=(key=" [Ctrl +] WheenDown",Description="                  Set MoveControl to MoveControl's focused control")
    DesignModeHints[15]=(key=" [(Ctrl + Alt) +] MouseX/Y+LMouse",Description="    Reposition MoveControl using mouse")
    DesignModeHints[16]=(key=" (Shift)",Description="                             Hides all design mode indicators")
    DesignModeHints[17]=(key=" (Ctrl + Alt)",Description="                        View focus chain")
    DesignModeHints[18]=(key=" [Ctrl +] Tab",Description="                        Select new MoveControl")
    DesignModeHints[19]=(key=" [Ctrl +] LMouse",Description="                     Select new MoveControl")
    MenuMouseSens=1.2500000
    DblClickWindow=1.0000000
    ButtonRepeatDelay=0.2500000
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