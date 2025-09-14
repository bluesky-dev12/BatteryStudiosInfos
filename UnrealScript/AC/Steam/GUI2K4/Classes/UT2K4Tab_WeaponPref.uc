/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4Tab_WeaponPref.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:36
 *	Functions:28
 *
 *******************************************************************************/
class UT2K4Tab_WeaponPref extends Settings_Tabs
    config(User)
    editinlinenew
    instanced;

struct WeapItem
{
    var class<wWeapon> WeapClass;
    var int WeapPriority;
    var int CrosshairIndex;
    var bool bAltFireMode;
    var bool bClassicModel;
    var Color CustomColor;
    var float CrosshairScale;
};

var array<WeapItem> WeaponsList;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground i_BG;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground i_BG2;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground i_BG3;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage i_Crosshair;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage i_CrosshairBG;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage i_Shadow;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage i_bk;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIGFXButton b_Up;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIGFXButton b_Down;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIListBox lb_Weapons;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIScrollTextBox lb_Desc;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_Swap;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_WeaponCrosshair;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_ClassicModel;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moComboBox co_Crosshair;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moSlider sl_Red;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moSlider sl_Blue;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moSlider sl_Green;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moSlider sl_Alpha;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moSlider sl_CrosshairScale;
var SpinnyWeap SpinnyWeap;
var() Vector SpinnyWeapOffset;
var bool bWeaponCrosshair;
var bool bSwap;
var int iCrossHair;
var int WeaponIndex;
var Color cCrosshair;
var float MaxCrosshairWidth;
var float MaxCrosshairHeight;
var float fScale;
var localized string HiddenText;
var localized string LoadingText;
var config bool bDebugPriority;
var config bool bDebugScale;
var config bool bDebugWeapon;

function int CompareWeaponPriority(GUIListElem ElemA, GUIListElem ElemB)
{
    local int PA, pB, Result;
    local class<wWeapon> WA, WB;

    WA = class<wWeapon>(ElemA.ExtraData);
    WB = class<wWeapon>(ElemB.ExtraData);
    PA = WA.default.Priority;
    pB = WB.default.Priority;
    Result = pB - PA;
    // End:0x9f
    if(Result != 0 || ElemA.Item == "" || ElemB.Item == "")
    {
        return Result;
    }
    Result = StrCmp(ElemA.Item, ElemB.Item);
    // End:0xcc
    if(Result != 0)
    {
        return Result;
    }
    return StrCmp(ElemA.ExtraStrData, ElemB.ExtraStrData);
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local array<CrosshairRecord> CustomCrosshairs;

    super.InitComponent(MyController, myOwner);
    cCrosshair = class'HUD'.default.CrossHairColor;
    co_Crosshair.MyComboBox.MyListBox.MyList.bInitializeList = false;
    class'CacheManager'.static.GetCrosshairList(CustomCrosshairs);
    i = 0;
    J0x68:
    // End:0xb1 [While If]
    if(i < CustomCrosshairs.Length)
    {
        co_Crosshair.AddItem(CustomCrosshairs[i].FriendlyName, CustomCrosshairs[i].CrosshairTexture);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x68;
    }
    co_Crosshair.ReadOnly(true);
    co_Crosshair.MyComboBox.Edit.bAlwaysNotify = true;
    lb_Weapons.List.bDropSource = true;
    lb_Weapons.List.bDropTarget = true;
    lb_Weapons.List.bMultiSelect = false;
    i_BG2.ManageComponent(lb_Weapons);
    i_BG3.ManageComponent(ch_WeaponCrosshair);
    i_BG3.ManageComponent(sl_Red);
    i_BG3.ManageComponent(sl_Green);
    i_BG3.ManageComponent(sl_Blue);
    i_BG3.ManageComponent(sl_Alpha);
    i_BG3.ManageComponent(sl_CrosshairScale);
    i_BG3.ManageComponent(co_Crosshair);
    // End:0x1e6
    if(bDebugWeapon)
    {
        __OnKeyEvent__Delegate = CoolOnKeyEvent;
    }
}

function IntializeWeaponList()
{
    local export editinline UT2K4GenericMessageBox Page;

    // End:0x16c
    if(Controller.OpenMenu("GUI2K4.UT2K4GenericMessageBox", "", LoadingText))
    {
        Page = UT2K4GenericMessageBox(Controller.ActivePage);
        Page.RemoveComponent(Page.b_OK);
        Page.RemoveComponent(Page.l_Text);
        Page.l_Text2.FontScale = 2;
        Page.l_Text2.WinHeight = 1.0;
        Page.l_Text2.WinTop = 0.0;
        Page.l_Text2.bBoundToParent = true;
        Page.l_Text2.bScaleToParent = true;
        Page.l_Text2.VertAlign = 1;
        Page.l_Text2.TextAlign = 1;
        Page.bRenderWorld = false;
        Page.__OnRendered__Delegate = ReallyInitializeWeaponList;
    }
}

function ReallyInitializeWeaponList(Canvas C)
{
    local int i;
    local array<WeaponRecord> Records;

    // End:0x3a
    if(Controller.ActivePage.Tag != 55)
    {
        Controller.ActivePage.Tag = 55;
        return;
    }
    class'CacheManager'.static.GetWeaponList(Records);
    lb_Weapons.List.bNotify = false;
    lb_Weapons.List.Clear();
    i = 0;
    J0x84:
    // End:0xf1 [While If]
    if(i < Records.Length)
    {
        lb_Weapons.List.Add(Records[i].FriendlyName, DynamicLoadObject(Records[i].ClassName, class'Class'), Records[i].Description);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x84;
    }
    lb_Weapons.List.SortList();
    // End:0x129
    if(SpinnyWeap == none)
    {
        SpinnyWeap = PlayerOwner().Spawn(class'SpinnyWeap');
    }
    SpinnyWeap.SetRotation(PlayerOwner().Rotation);
    SpinnyWeap.SetStaticMesh(none);
    lb_Weapons.List.SetIndex(0);
    WeaponListInitialized();
    lb_Weapons.List.bNotify = true;
    // End:0x1b2
    if(Controller.ActivePage != PageOwner)
    {
        Controller.CloseMenu(true);
    }
    FocusFirst(none);
}

function ResetClicked()
{
    local int i;
    local bool bTemp;

    super.ResetClicked();
    class'HUD'.static.ResetConfig("CrosshairStyle");
    class'HUD'.static.ResetConfig("bCrosshairShow");
    class'HUD'.static.ResetConfig("CrosshairColor");
    class'HUD'.static.ResetConfig("CrosshairOpacity");
    class'HUD'.static.ResetConfig("CrosshairScale");
    class'HudBase'.static.ResetConfig("bUseCustomWeaponCrosshairs");
    i = 0;
    J0xd5:
    // End:0x22e [While If]
    if(i < WeaponsList.Length)
    {
        WeaponsList[i].WeapClass.static.ResetConfig("Priority");
        WeaponsList[i].WeapClass.static.ResetConfig("ExchangeFireModes");
        WeaponsList[i].WeapClass.static.ResetConfig("bUseOldWeaponMesh");
        WeaponsList[i].WeapClass.static.ResetConfig("CustomCrosshairScale");
        WeaponsList[i].WeapClass.static.ResetConfig("CustomCrosshairTextureName");
        WeaponsList[i].WeapClass.static.ResetConfig("CustomCrosshair");
        WeaponsList[i].WeapClass.static.ResetConfig("CustomCrosshairColor");
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xd5;
    }
    bTemp = Controller.bCurMenuInitialized;
    Controller.bCurMenuInitialized = false;
    i = 0;
    J0x25c:
    // End:0x28c [While If]
    if(i < Controls.Length)
    {
        Controls[i].LoadINI();
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x25c;
    }
    lb_Weapons.List.SortList();
    Controller.bCurMenuInitialized = bTemp;
    WeaponListInitialized();
}

function SaveSettings()
{
    local Color BlackColor;
    local wWeapon InvWeap;
    local PlayerController PC;
    local Texture WeaponTex;
    local bool bSave;
    local int i;

    super.SaveSettings();
    PC = PlayerOwner();
    // End:0x278
    if(PC != none && PC.myHUD != none)
    {
        // End:0x76
        if(PC.myHUD.CrosshairStyle != iCrossHair)
        {
            PC.myHUD.CrosshairStyle = iCrossHair;
            bSave = true;
        }
        // End:0xfc
        if(PC.myHUD.bCrosshairShow != bWeaponCrosshair || iCrossHair < co_Crosshair.ItemCount() - 1)
        {
            PC.myHUD.bCrosshairShow = bWeaponCrosshair || iCrossHair < co_Crosshair.ItemCount() - 1;
            bSave = true;
        }
        // End:0x145
        if(PC.myHUD.CrossHairColor != cCrosshair)
        {
            PC.myHUD.CrossHairColor = cCrosshair;
            bSave = true;
        }
        // End:0x18b
        if(PC.myHUD.CrosshairScale != fScale)
        {
            PC.myHUD.CrosshairScale = fScale;
            bSave = true;
        }
        // End:0x1fb
        if(HudBase(PC.myHUD) != none)
        {
            // End:0x1f8
            if(HudBase(PC.myHUD).bUseCustomWeaponCrosshairs != bWeaponCrosshair)
            {
                HudBase(PC.myHUD).bUseCustomWeaponCrosshairs = bWeaponCrosshair;
                bSave = true;
            }
        }
        // End:0x257
        else
        {
            // End:0x257
            if(class'HudBase'.default.bUseCustomWeaponCrosshairs != bWeaponCrosshair)
            {
                class'HudBase'.default.bUseCustomWeaponCrosshairs = bWeaponCrosshair;
                PC.myHUD.SaveConfig();
                class'HudBase'.static.StaticSaveConfig();
                bSave = false;
            }
        }
        // End:0x275
        if(bSave)
        {
            PC.myHUD.SaveConfig();
        }
    }
    // End:0x3e4
    else
    {
        // End:0x2ac
        if(class'HUD'.default.CrosshairStyle != iCrossHair)
        {
            class'HUD'.default.CrosshairStyle = iCrossHair;
            bSave = true;
        }
        // End:0x31a
        if(class'HUD'.default.bCrosshairShow != bWeaponCrosshair || iCrossHair < co_Crosshair.ItemCount())
        {
            class'HUD'.default.bCrosshairShow = bWeaponCrosshair || iCrossHair < co_Crosshair.ItemCount();
            bSave = true;
        }
        // End:0x351
        if(class'HUD'.default.CrossHairColor != cCrosshair)
        {
            class'HUD'.default.CrossHairColor = cCrosshair;
            bSave = true;
        }
        // End:0x385
        if(class'HUD'.default.CrosshairScale != fScale)
        {
            class'HUD'.default.CrosshairScale = fScale;
            bSave = true;
        }
        // End:0x3cc
        if(class'HudBase'.default.bUseCustomWeaponCrosshairs != bWeaponCrosshair)
        {
            class'HudBase'.default.bUseCustomWeaponCrosshairs = bWeaponCrosshair;
            class'HudBase'.static.StaticSaveConfig();
            bSave = false;
        }
        // End:0x3e4
        if(bSave)
        {
            class'HUD'.static.StaticSaveConfig();
        }
    }
    i = 0;
    J0x3eb:
    // End:0xa96 [While If]
    if(i < WeaponsList.Length)
    {
        bSave = false;
        // End:0x467
        if(WeaponsList[i].WeapPriority != WeaponsList[i].WeapClass.default.Priority)
        {
            WeaponsList[i].WeapClass.default.Priority = byte(WeaponsList[i].WeapPriority);
            bSave = true;
        }
        // End:0x4d1
        if(byte(WeaponsList[i].bAltFireMode) != WeaponsList[i].WeapClass.default.ExchangeFireModes)
        {
            WeaponsList[i].WeapClass.default.ExchangeFireModes = byte(WeaponsList[i].bAltFireMode);
            bSave = true;
        }
        // End:0x535
        if(WeaponsList[i].bClassicModel != WeaponsList[i].WeapClass.default.bUseOldWeaponMesh)
        {
            WeaponsList[i].WeapClass.default.bUseOldWeaponMesh = WeaponsList[i].bClassicModel;
            bSave = true;
        }
        // End:0x595
        if(WeaponsList[i].CrosshairScale != WeaponsList[i].WeapClass.default.CustomCrossHairScale)
        {
            WeaponsList[i].WeapClass.default.CustomCrossHairScale = WeaponsList[i].CrosshairScale;
            bSave = true;
        }
        WeaponTex = GetTexture(WeaponsList[i].CrosshairIndex);
        // End:0x69a
        if(WeaponTex == none)
        {
            // End:0x600
            if(WeaponsList[i].WeapClass.default.CustomCrossHairTextureName != "")
            {
                WeaponsList[i].WeapClass.default.CustomCrossHairTextureName = "";
                bSave = true;
            }
            // End:0x64a
            if(WeaponsList[i].WeapClass.default.CustomCrosshair != -1)
            {
                WeaponsList[i].WeapClass.default.CustomCrosshair = -1;
                bSave = true;
            }
            // End:0x697
            if(WeaponsList[i].WeapClass.default.CustomCrossHairColor != BlackColor)
            {
                WeaponsList[i].WeapClass.default.CustomCrossHairColor = BlackColor;
                bSave = true;
            }
        }
        // End:0x7ab
        else
        {
            // End:0x6e8
            if(WeaponsList[i].WeapClass.default.CustomCrossHairTextureName != string(WeaponTex))
            {
                WeaponsList[i].WeapClass.default.CustomCrossHairTextureName = string(WeaponTex);
                bSave = true;
            }
            // End:0x748
            if(WeaponsList[i].WeapClass.default.CustomCrosshair != WeaponsList[i].CrosshairIndex)
            {
                WeaponsList[i].WeapClass.default.CustomCrosshair = WeaponsList[i].CrosshairIndex;
                bSave = true;
            }
            // End:0x7ab
            if(WeaponsList[i].WeapClass.default.CustomCrossHairColor != WeaponsList[i].CustomColor)
            {
                WeaponsList[i].WeapClass.default.CustomCrossHairColor = WeaponsList[i].CustomColor;
                bSave = true;
            }
        }
        // End:0xa69
        if(PC != none && PC.Pawn != none)
        {
            InvWeap = wWeapon(PC.Pawn.FindInventoryType(WeaponsList[i].WeapClass));
            // End:0xa0b
            if(InvWeap != none)
            {
                // End:0x861
                if(WeaponTex == none)
                {
                    InvWeap.CustomCrossHairTexture = none;
                    InvWeap.CustomCrossHairTextureName = "";
                    InvWeap.CustomCrossHairColor = BlackColor;
                    InvWeap.CustomCrosshair = -1;
                }
                // End:0x8c9
                else
                {
                    InvWeap.CustomCrossHairTexture = WeaponTex;
                    InvWeap.CustomCrossHairTextureName = string(WeaponTex);
                    InvWeap.CustomCrossHairColor = WeaponsList[i].CustomColor;
                    InvWeap.CustomCrosshair = WeaponsList[i].CrosshairIndex;
                }
                InvWeap.CustomCrossHairScale = WeaponsList[i].CrosshairScale;
                InvWeap.ExchangeFireModes = byte(WeaponsList[i].bAltFireMode);
                // End:0x9b2
                if(bDebugPriority)
                {
                    Log("Found weapon of class" @ string(WeaponsList[i].WeapClass) @ "in Pawn inventory '" $ string(InvWeap.Name) $ "'. Priority:" $ string(InvWeap.Priority) @ "New value:" $ string(WeaponsList[i].WeapPriority), 'DebugPriority');
                }
                InvWeap.Priority = byte(WeaponsList[i].WeapPriority);
                InvWeap.bUseOldWeaponMesh = WeaponsList[i].bClassicModel;
                InvWeap.SaveConfig();
                bSave = false;
            }
            // End:0xa69
            else
            {
                // End:0xa69
                if(bDebugPriority)
                {
                    Log("Did not find any weapons of class" @ string(WeaponsList[i].WeapClass) @ "in pawn's inventory", 'DebugPriority');
                }
            }
        }
        // End:0xa8c
        if(bSave)
        {
            WeaponsList[i].WeapClass.static.StaticSaveConfig();
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x3eb;
    }
}

function ShowPanel(bool bShow)
{
    local Rotator R;

    super.ShowPanel(bShow);
    // End:0x87
    if(bShow)
    {
        // End:0x49
        if(bInit)
        {
            lb_Weapons.List.__CompareItem__Delegate = CompareWeaponPriority;
            IntializeWeaponList();
            bInit = false;
        }
        // End:0x87
        if(SpinnyWeap != none)
        {
            R = PlayerOwner().Rotation;
            R.Yaw = 31000;
            SpinnyWeap.SetRotation(R);
        }
    }
}

function string InternalOnSaveINI(GUIComponent Sender)
{
    local int i, j, cnt;

    // End:0x175
    if(Sender == lb_Weapons)
    {
        cnt = lb_Weapons.ItemCount();
        i = 0;
        J0x2b:
        // End:0x175 [While If]
        if(i < cnt)
        {
            // End:0x91
            if(bDebugPriority)
            {
                Log("Searching for WeaponList Index for" @ string(i) @ lb_Weapons.List.GetItemAtIndex(i));
            }
            j = FindWeaponListIndexAt(i);
            // End:0x16b
            if(j != -1)
            {
                // End:0x14b
                if(bDebugPriority)
                {
                    Log("Found WeaponListIndex for" @ string(i) @ ":" $ string(j) @ string(WeaponsList[j].WeapClass));
                    Log("Setting WeaponList[" $ string(j) $ "].WeapPriority to:" $ string(cnt - i - 1));
                }
                WeaponsList[j].WeapPriority = cnt - i - 1;
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x2b;
        }
    }
    return "";
}

function InternalOnLoadINI(GUIComponent Sender, string S)
{
    local HudBase Base;

    Base = HudBase(PlayerOwner().myHUD);
    // End:0x4b4
    if(GUIMenuOption(Sender) != none)
    {
        // End:0x259
        if(Base != none)
        {
            switch(GUIMenuOption(Sender))
            {
                // End:0x74
                case ch_WeaponCrosshair:
                    bWeaponCrosshair = Base.bUseCustomWeaponCrosshairs;
                    ch_WeaponCrosshair.Checked(bWeaponCrosshair);
                    // End:0x256
                    break;
                // End:0xc6
                case co_Crosshair:
                    iCrossHair = Base.CrosshairStyle;
                    // End:0xc3
                    if(!Base.bUseCustomWeaponCrosshairs)
                    {
                        co_Crosshair.SetIndex(iCrossHair);
                        SetCrossHairGraphic(iCrossHair);
                    }
                    // End:0x256
                    break;
                // End:0x100
                case sl_Red:
                    // End:0xfd
                    if(!Base.bUseCustomWeaponCrosshairs)
                    {
                        sl_Red.SetValue(float(cCrosshair.R));
                    }
                    // End:0x256
                    break;
                // End:0x13a
                case sl_Green:
                    // End:0x137
                    if(!Base.bUseCustomWeaponCrosshairs)
                    {
                        sl_Green.SetValue(float(cCrosshair.G));
                    }
                    // End:0x256
                    break;
                // End:0x174
                case sl_Blue:
                    // End:0x171
                    if(!Base.bUseCustomWeaponCrosshairs)
                    {
                        sl_Blue.SetValue(float(cCrosshair.B));
                    }
                    // End:0x256
                    break;
                // End:0x1ae
                case sl_Alpha:
                    // End:0x1ab
                    if(!Base.bUseCustomWeaponCrosshairs)
                    {
                        sl_Alpha.SetValue(float(cCrosshair.A));
                    }
                    // End:0x256
                    break;
                // End:0x1f5
                case sl_CrosshairScale:
                    fScale = Base.CrosshairScale;
                    // End:0x1f2
                    if(!Base.bUseCustomWeaponCrosshairs)
                    {
                        sl_CrosshairScale.SetValue(fScale);
                    }
                    // End:0x256
                    break;
                // End:0xffff
                default:
                    Log(string(Name) @ "Unknown component calling LoadINI:" $ GUIMenuOption(Sender).Caption);
                    GUIMenuOption(Sender).SetComponentValue(S, true);
                    // End:0x4b4 Break;
                    break;
                }
        }
        switch(GUIMenuOption(Sender))
        {
            // End:0x29b
            case ch_WeaponCrosshair:
                bWeaponCrosshair = class'HudBase'.default.bUseCustomWeaponCrosshairs;
                ch_WeaponCrosshair.Checked(bWeaponCrosshair);
                // End:0x4b4
                break;
            // End:0x2ed
            case co_Crosshair:
                iCrossHair = class'HUD'.default.CrosshairStyle;
                // End:0x2ea
                if(!class'HudBase'.default.bUseCustomWeaponCrosshairs)
                {
                    co_Crosshair.SetIndex(iCrossHair);
                    SetCrossHairGraphic(iCrossHair);
                }
                // End:0x4b4
                break;
            // End:0x327
            case sl_Red:
                // End:0x324
                if(!class'HudBase'.default.bUseCustomWeaponCrosshairs)
                {
                    sl_Red.SetValue(float(cCrosshair.R));
                }
                // End:0x4b4
                break;
            // End:0x361
            case sl_Green:
                // End:0x35e
                if(!class'HudBase'.default.bUseCustomWeaponCrosshairs)
                {
                    sl_Green.SetValue(float(cCrosshair.G));
                }
                // End:0x4b4
                break;
            // End:0x39b
            case sl_Blue:
                // End:0x398
                if(!class'HudBase'.default.bUseCustomWeaponCrosshairs)
                {
                    sl_Blue.SetValue(float(cCrosshair.B));
                }
                // End:0x4b4
                break;
            // End:0x3d5
            case sl_Alpha:
                // End:0x3d2
                if(!class'HudBase'.default.bUseCustomWeaponCrosshairs)
                {
                    sl_Alpha.SetValue(float(cCrosshair.A));
                }
                // End:0x4b4
                break;
            // End:0x453
            case sl_CrosshairScale:
                fScale = class'HUD'.default.CrosshairScale;
                // End:0x419
                if(!class'HudBase'.default.bUseCustomWeaponCrosshairs)
                {
                    sl_CrosshairScale.SetValue(fScale);
                }
                // End:0x450
                if(bDebugScale)
                {
                    Log("Initial global crosshair scale is" @ string(fScale));
                }
                // End:0x4b4
                break;
            // End:0xffff
            default:
                Log(string(Name) @ "Unknown component calling LoadINI:" $ GUIMenuOption(Sender).Caption);
                GUIMenuOption(Sender).SetComponentValue(S, true);
            }
}

function InternalOnChange(GUIComponent Sender)
{
    local int i;
    local float f;

    super.InternalOnChange(Sender);
    // End:0x68
    if(Sender == lb_Weapons)
    {
        i = FindWeaponListIndex();
        // End:0x60
        if(i == WeaponIndex)
        {
            WeaponsList[WeaponIndex].WeapPriority = lb_Weapons.List.Index;
        }
        // End:0x66
        else
        {
            UpdateCurrentWeapon();
        }
        return;
    }
    switch(GUIMenuOption(Sender))
    {
        // End:0xcc
        case co_Crosshair:
            i = co_Crosshair.GetIndex();
            // End:0xb3
            if(bWeaponCrosshair)
            {
                WeaponsList[WeaponIndex].CrosshairIndex = i;
            }
            // End:0xbe
            else
            {
                iCrossHair = i;
            }
            SetCrossHairGraphic(i);
            // End:0x4a7
            break;
        // End:0x12c
        case ch_WeaponCrosshair:
            bWeaponCrosshair = ch_WeaponCrosshair.IsChecked();
            // End:0x115
            if(bWeaponCrosshair)
            {
                co_Crosshair.SetIndex(WeaponsList[WeaponIndex].CrosshairIndex);
            }
            // End:0x129
            else
            {
                co_Crosshair.SetIndex(iCrossHair);
            }
            // End:0x4a7
            break;
        // End:0x158
        case ch_Swap:
            WeaponsList[WeaponIndex].bAltFireMode = ch_Swap.IsChecked();
            // End:0x4a7
            break;
        // End:0x18a
        case ch_ClassicModel:
            WeaponsList[WeaponIndex].bClassicModel = ch_ClassicModel.IsChecked();
            UpdateCurrentWeapon();
            // End:0x4a7
            break;
        // End:0x202
        case sl_Red:
            i = int(sl_Red.GetValue());
            // End:0x1d2
            if(bWeaponCrosshair)
            {
                WeaponsList[WeaponIndex].CustomColor.R = byte(i);
            }
            // End:0x1e4
            else
            {
                cCrosshair.R = byte(i);
            }
            i_Crosshair.ImageColor.R = byte(i);
            // End:0x4a7
            break;
        // End:0x27a
        case sl_Blue:
            i = int(sl_Blue.GetValue());
            // End:0x24a
            if(bWeaponCrosshair)
            {
                WeaponsList[WeaponIndex].CustomColor.B = byte(i);
            }
            // End:0x25c
            else
            {
                cCrosshair.B = byte(i);
            }
            i_Crosshair.ImageColor.B = byte(i);
            // End:0x4a7
            break;
        // End:0x2f2
        case sl_Green:
            i = int(sl_Green.GetValue());
            // End:0x2c2
            if(bWeaponCrosshair)
            {
                WeaponsList[WeaponIndex].CustomColor.G = byte(i);
            }
            // End:0x2d4
            else
            {
                cCrosshair.G = byte(i);
            }
            i_Crosshair.ImageColor.G = byte(i);
            // End:0x4a7
            break;
        // End:0x36a
        case sl_Alpha:
            i = int(sl_Alpha.GetValue());
            // End:0x33a
            if(bWeaponCrosshair)
            {
                WeaponsList[WeaponIndex].CustomColor.A = byte(i);
            }
            // End:0x34c
            else
            {
                cCrosshair.A = byte(i);
            }
            i_Crosshair.ImageColor.A = byte(i);
            // End:0x4a7
            break;
        // End:0x4a4
        case sl_CrosshairScale:
            f = sl_CrosshairScale.GetValue();
            // End:0x419
            if(bWeaponCrosshair)
            {
                // End:0x400
                if(bDebugScale)
                {
                    Log("Changing custom crosshair scale for " $ string(WeaponsList[WeaponIndex].WeapClass) @ "from" @ string(WeaponsList[WeaponIndex].CrosshairScale) @ "to" @ string(f));
                }
                WeaponsList[WeaponIndex].CrosshairScale = f;
            }
            // End:0x46e
            else
            {
                // End:0x463
                if(bDebugScale)
                {
                    Log("Changing global crosshair scale from " $ string(fScale) @ "to" @ string(f));
                }
                fScale = f;
            }
            i_Crosshair.WinHeight = f * MaxCrosshairHeight;
            i_Crosshair.WinWidth = f * MaxCrosshairWidth;
        // End:0xffff
        default:
}

function WeaponListInitialized()
{
    local int i;
    local WeapItem WI;
    local Texture CustomTex;

    // End:0x19
    if(WeaponsList.Length > 0)
    {
        WeaponsList.Remove(0, WeaponsList.Length);
    }
    co_Crosshair.MyComboBox.List.bNotify = false;
    i = 0;
    J0x43:
    // End:0x4a9 [While If]
    if(i < lb_Weapons.List.ItemCount)
    {
        WI.WeapClass = class<wWeapon>(lb_Weapons.List.GetObjectAtIndex(i));
        WI.WeapPriority = WI.WeapClass.default.Priority;
        WI.CrosshairScale = WI.WeapClass.default.CustomCrossHairScale;
        // End:0x113
        if(bDebugScale)
        {
            Log("Crosshair scale for " $ string(WI.WeapClass) $ " is" @ string(WI.CrosshairScale));
        }
        CustomTex = WI.WeapClass.default.CustomCrossHairTexture;
        // End:0x2fe
        if(CustomTex == none)
        {
            // End:0x28e
            if(WI.WeapClass.default.CustomCrossHairTextureName != "")
            {
                WI.CrosshairIndex = FindTextureNameIndex(WI.WeapClass.default.CustomCrossHairTextureName);
                // End:0x275
                if(WI.CrosshairIndex < 0)
                {
                    CustomTex = Texture(DynamicLoadObject(WI.WeapClass.default.CustomCrossHairTextureName, class'Texture'));
                    // End:0x1d2
                    if(CustomTex != none)
                    {
                        WI.CrosshairIndex = FindTextureIndex(CustomTex);
                    }
                    // End:0x272
                    else
                    {
                        Log("Could not load specified custom crosshair texture '" $ WI.WeapClass.default.CustomCrossHairTextureName $ "' for weapon" @ string(WI.WeapClass) $ ". Removing weapon's crosshair from crosshair list.");
                    }
                }
                // End:0x28b
                else
                {
                    CustomTex = GetTexture(WI.CrosshairIndex);
                }
            }
            // End:0x2fb
            else
            {
                // End:0x2eb
                if(WI.WeapClass.default.CustomCrosshair != -1)
                {
                    CustomTex = GetTexture(WI.WeapClass.default.CustomCrosshair);
                    WI.CrosshairIndex = WI.WeapClass.default.CustomCrosshair;
                }
                // End:0x2fb
                else
                {
                    WI.CrosshairIndex = -1;
                }
            }
        }
        // End:0x32d
        else
        {
            CustomTex = WI.WeapClass.default.CustomCrossHairTexture;
            WI.CrosshairIndex = FindTextureIndex(CustomTex);
        }
        // End:0x3b8
        if(CustomTex == none && WI.WeapClass.default.CustomCrosshair != -1)
        {
            Warn("Could not load crosshair for weapon" @ string(WI.WeapClass) @ "so removing from custom weapons list.");
        }
        // End:0x49f
        else
        {
            // End:0x3f1
            if(WI.WeapClass.default.OldMesh != none)
            {
                WI.bClassicModel = WI.WeapClass.default.bUseOldWeaponMesh;
            }
            WI.bAltFireMode = WI.WeapClass.default.ExchangeFireModes == 1;
            WI.CustomColor = WI.WeapClass.default.CustomCrossHairColor;
            // End:0x48d
            if(WI.CrosshairIndex == co_Crosshair.ItemCount())
            {
                co_Crosshair.AddItem(co_Crosshair.GetItem(FindTextureNameIndex(WI.WeapClass.default.CustomCrossHairTextureName)), CustomTex);
            }
            WeaponsList[WeaponsList.Length] = WI;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x43;
    }
    // End:0x4db
    if(co_Crosshair.FindIndex(HiddenText) == -1)
    {
        co_Crosshair.AddItem(HiddenText);
    }
    co_Crosshair.MyComboBox.List.bNotify = true;
    UpdateCurrentWeapon();
}

function SwapWeapons(int OriginalLoc, int NewLoc)
{
    lb_Weapons.List.Swap(OriginalLoc, NewLoc);
    lb_Weapons.List.SetIndex(NewLoc);
}

function bool ChangePriority(GUIComponent Sender)
{
    // End:0x103
    if(lb_Weapons.List.ItemCount > 1)
    {
        // End:0x85
        if(Sender == b_Up && lb_Weapons.List.Index > 0)
        {
            SwapWeapons(lb_Weapons.List.Index, lb_Weapons.List.Index - 1);
        }
        // End:0x103
        else
        {
            // End:0x103
            if(Sender == b_Down && lb_Weapons.List.Index < lb_Weapons.List.ItemCount - 1)
            {
                SwapWeapons(lb_Weapons.List.Index, lb_Weapons.List.Index + 1);
            }
        }
    }
    return true;
}

function InternalDraw(Canvas Canvas)
{
    local Vector CamPos, X, Y, Z, WX, WY,
	    WZ;

    local Rotator camRot;

    // End:0x0d
    if(WeaponIndex < 0)
    {
        return;
    }
    Canvas.GetCameraLocation(CamPos, camRot);
    GetAxes(camRot, X, Y, Z);
    // End:0xce
    if(SpinnyWeap.DrawType == 2)
    {
        GetAxes(SpinnyWeap.Rotation, WX, WY, WZ);
        SpinnyWeap.SetLocation(CamPos + SpinnyWeapOffset.X * X + SpinnyWeapOffset.Y * Y + SpinnyWeapOffset.Z * Z + float(30) * WX);
    }
    // End:0x118
    else
    {
        SpinnyWeap.SetLocation(CamPos + SpinnyWeapOffset.X * X + SpinnyWeapOffset.Y * Y + SpinnyWeapOffset.Z * Z);
    }
    Canvas.DrawActorClipped(SpinnyWeap, false, i_BG.ClientBounds[0], i_BG.ClientBounds[1], i_BG.ClientBounds[2] - i_BG.ClientBounds[0], i_BG.ClientBounds[3] - i_BG.ClientBounds[1] / float(2), true, 90.0);
}

function UpdateCurrentWeapon()
{
    local PlayerController PC;
    local class<Pickup> PickupClass;
    local class<InventoryAttachment> attachClass;
    local Mesh OldMesh;
    local StaticMesh OldPickup;
    local float defscale;
    local Vector Scale3D;
    local int i;

    // End:0x0d
    if(SpinnyWeap == none)
    {
        return;
    }
    WeaponIndex = FindWeaponListIndex();
    // End:0xe1
    if(WeaponIndex < 0)
    {
        PC = PlayerOwner();
        // End:0xcf
        if(PC != none && PC.Pawn != none && PC.Pawn.Weapon != none)
        {
            i = 0;
            J0x74:
            // End:0xcf [While If]
            if(i < WeaponsList.Length)
            {
                // End:0xc5
                if(ClassIsChildOf(PC.Pawn.Weapon.Class, WeaponsList[i].WeapClass))
                {
                    WeaponIndex = i;
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x74;
            }
        }
        // End:0xe1
        if(WeaponIndex < 0)
        {
            WeaponIndex = 0;
        }
    }
    PickupClass = WeaponsList[WeaponIndex].WeapClass.default.PickupClass;
    attachClass = WeaponsList[WeaponIndex].WeapClass.default.AttachmentClass;
    OldMesh = WeaponsList[WeaponIndex].WeapClass.default.OldMesh;
    // End:0x18a
    if(PickupClass != none && PickupClass.default.StaticMesh != none)
    {
        defscale = PickupClass.default.DrawScale;
        Scale3D = PickupClass.default.DrawScale3D;
    }
    // End:0x23c
    else
    {
        // End:0x21e
        if(attachClass != none && attachClass.default.Mesh != none)
        {
            defscale = attachClass.default.DrawScale;
            Scale3D = attachClass.default.DrawScale3D;
            // End:0x1f7
            if(Scale3D.X > 1.0)
            {
                Scale3D.X = 1.0;
            }
            // End:0x21b
            if(Scale3D.Y > 1.0)
            {
                Scale3D.Y = 1.0;
            }
        }
        // End:0x23c
        else
        {
            defscale = 0.50;
            Scale3D = vect(1.0, 1.0, 1.0);
        }
    }
    // End:0x399
    if(OldMesh != none && !class'LevelInfo'.static.IsDemoBuild())
    {
        EnableComponent(ch_ClassicModel);
        ch_ClassicModel.SetComponentValue(string(WeaponsList[WeaponIndex].bClassicModel), true);
        // End:0x396
        if(WeaponsList[WeaponIndex].bClassicModel)
        {
            // End:0x2ee
            if(WeaponsList[WeaponIndex].WeapClass.default.OldPickup != "")
            {
                OldPickup = StaticMesh(DynamicLoadObject(WeaponsList[WeaponIndex].WeapClass.default.OldPickup, class'StaticMesh'));
            }
            // End:0x396
            if(OldPickup != none)
            {
                SpinnyWeap.LinkMesh(none);
                SpinnyWeap.SetStaticMesh(OldPickup);
                SpinnyWeap.SetDrawScale(defscale);
                SpinnyWeap.SetDrawScale3D(Scale3D);
                i = 0;
                J0x34c:
                // End:0x385 [While If]
                if(i < SpinnyWeap.Skins.Length)
                {
                    SpinnyWeap.Skins[i] = none;
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0x34c;
                }
                SpinnyWeap.SetDrawType(8);
            }
        }
    }
    // End:0x3bb
    else
    {
        ch_ClassicModel.SetComponentValue("False", true);
        DisableComponent(ch_ClassicModel);
    }
    // End:0x6b4
    if(OldPickup == none)
    {
        // End:0x4c2
        if(PickupClass != none && PickupClass.default.StaticMesh != none)
        {
            SpinnyWeap.LinkMesh(none);
            SpinnyWeap.SetStaticMesh(PickupClass.default.StaticMesh);
            SpinnyWeap.SetDrawScale(defscale);
            SpinnyWeap.SetDrawScale3D(Scale3D);
            SpinnyWeap.Skins.Length = PickupClass.default.Skins.Length;
            i = 0;
            J0x462:
            // End:0x4ae [While If]
            if(i < PickupClass.default.Skins.Length)
            {
                SpinnyWeap.Skins[i] = PickupClass.default.Skins[i];
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x462;
            }
            SpinnyWeap.SetDrawType(8);
        }
        // End:0x6b4
        else
        {
            // End:0x679
            if(attachClass != none && attachClass.default.Mesh != none)
            {
                SpinnyWeap.SetStaticMesh(none);
                SpinnyWeap.LinkMesh(attachClass.default.Mesh);
                SpinnyWeap.SetDrawScale(1.30 * defscale);
                SpinnyWeap.Skins.Length = attachClass.default.Skins.Length;
                i = 0;
                J0x551:
                // End:0x59d [While If]
                if(i < attachClass.default.Skins.Length)
                {
                    SpinnyWeap.Skins[i] = attachClass.default.Skins[i];
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0x551;
                }
                // End:0x5dd
                if(string(WeaponsList[WeaponIndex].WeapClass) == "XWeapons.Translauncher")
                {
                    Scale3D.Z *= -1.0;
                }
                // End:0x665
                if(string(WeaponsList[WeaponIndex].WeapClass) != "XWeapons.ShockRifle" && string(WeaponsList[WeaponIndex].WeapClass) != "XWeapons.LinkGun" || WeaponsList[WeaponIndex].bClassicModel)
                {
                    SpinnyWeap.SetDrawScale3D(1.30 * Scale3D);
                }
                SpinnyWeap.SetDrawType(2);
            }
            // End:0x6b4
            else
            {
                Log("Could not find graphic for weapon: " $ string(WeaponsList[WeaponIndex].WeapClass));
            }
        }
    }
    i_BG.Caption = lb_Weapons.List.Get();
    lb_Desc.SetContent(lb_Weapons.List.GetExtra());
    ch_Swap.SetComponentValue(string(WeaponsList[WeaponIndex].bAltFireMode), true);
    // End:0x7a3
    if(bWeaponCrosshair)
    {
        // End:0x76b
        if(WeaponsList[WeaponIndex].CrosshairIndex == -1)
        {
            WeaponsList[WeaponIndex].CrosshairIndex = co_Crosshair.ItemCount() - 1;
        }
        co_Crosshair.SetIndex(WeaponsList[WeaponIndex].CrosshairIndex);
        SetCrossHairGraphic(WeaponsList[WeaponIndex].CrosshairIndex);
    }
    // End:0x7c2
    else
    {
        co_Crosshair.SetIndex(iCrossHair);
        SetCrossHairGraphic(iCrossHair);
    }
}

function SetCrossHairGraphic(int Index)
{
    local bool B;

    B = Index >= 0 && Index < co_Crosshair.ItemCount() - 1 && PlayerOwner().myHUD.bCrosshairShow;
    // End:0x74
    if(B)
    {
        i_Crosshair.Image = Texture(co_Crosshair.GetObject());
    }
    // End:0xa3
    if(B != i_Crosshair.bVisible)
    {
        i_Crosshair.SetVisibility(B);
    }
    UpdateCrosshairColor();
}

function UpdateCrosshairColor()
{
    // End:0x99
    if(bWeaponCrosshair)
    {
        i_Crosshair.WinHeight = WeaponsList[WeaponIndex].CrosshairScale * MaxCrosshairHeight;
        i_Crosshair.WinWidth = WeaponsList[WeaponIndex].CrosshairScale * MaxCrosshairWidth;
        i_Crosshair.ImageColor = WeaponsList[WeaponIndex].CustomColor;
        sl_CrosshairScale.SetComponentValue(string(WeaponsList[WeaponIndex].CrosshairScale), true);
    }
    // End:0xfa
    else
    {
        i_Crosshair.ImageColor = cCrosshair;
        i_Crosshair.WinHeight = fScale * MaxCrosshairHeight;
        i_Crosshair.WinWidth = fScale * MaxCrosshairWidth;
        sl_CrosshairScale.SetComponentValue(string(fScale), true);
    }
    sl_Red.SetComponentValue(string(i_Crosshair.ImageColor.R), true);
    sl_Blue.SetComponentValue(string(i_Crosshair.ImageColor.B), true);
    sl_Green.SetComponentValue(string(i_Crosshair.ImageColor.G), true);
    sl_Alpha.SetComponentValue(string(i_Crosshair.ImageColor.A), true);
}

function Texture GetTexture(int i)
{
    // End:0x40
    if(i >= 0 && i < co_Crosshair.ItemCount())
    {
        return Texture(co_Crosshair.GetItemObject(i));
    }
    return none;
}

function int FindWeaponListIndexAt(int Index)
{
    local int i;
    local class<wWeapon> WC;

    WC = class<wWeapon>(lb_Weapons.List.GetObjectAtIndex(Index));
    // End:0x74
    if(WC != none)
    {
        i = 0;
        J0x3a:
        // End:0x74 [While If]
        if(i < WeaponsList.Length)
        {
            // End:0x6a
            if(WC == WeaponsList[i].WeapClass)
            {
                return i;
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x3a;
        }
    }
    return -1;
}

function int FindWeaponListIndex()
{
    local int i;
    local class<wWeapon> WC;

    WC = class<wWeapon>(lb_Weapons.List.GetObject());
    i = 0;
    J0x2a:
    // End:0x64 [While If]
    if(i < WeaponsList.Length)
    {
        // End:0x5a
        if(WC == WeaponsList[i].WeapClass)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x2a;
    }
    return -1;
}

function int FindTextureNameIndex(string TextureName)
{
    local int i, cnt;

    cnt = co_Crosshair.ItemCount();
    i = 0;
    J0x1c:
    // End:0x52 [While If]
    if(i < cnt)
    {
        // End:0x48
        if(TextureName ~= string(GetTexture(i)))
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1c;
    }
    // End:0x15a
    if(Controller.bModAuthor)
    {
        Log("Number of crosshairs:" $ string(cnt) @ "Was looking for" @ TextureName, 'ModAuthor');
        i = 0;
        J0xac:
        // End:0x15a [While If]
        if(i < cnt)
        {
            Log(string(i) @ "TextureName[" $ string(i) $ "]:" $ co_Crosshair.MyComboBox.List.Elements[i].Item @ "Texture:" $ string(co_Crosshair.MyComboBox.List.Elements[i].ExtraData), 'ModAuthor');
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0xac;
        }
    }
    return -1;
}

function int FindTextureIndex(Texture WeapTexture)
{
    local int i, cnt;

    cnt = co_Crosshair.ItemCount();
    i = 0;
    J0x1c:
    // End:0x4d [While If]
    if(i < cnt)
    {
        // End:0x43
        if(WeapTexture == GetTexture(i))
        {
        }
        // End:0x4d
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x1c;
        }
    }
    return i;
}

event Opened(GUIComponent Sender)
{
    local Rotator R;

    super.Opened(Sender);
    // End:0x57
    if(SpinnyWeap != none)
    {
        R.Yaw = 32768;
        SpinnyWeap.SetRotation(R + PlayerOwner().Rotation);
        SpinnyWeap.bHidden = false;
    }
}

event Closed(GUIComponent Sender, bool bCancelled)
{
    super.Closed(Sender, bCancelled);
    // End:0x2d
    if(SpinnyWeap != none)
    {
        SpinnyWeap.bHidden = true;
    }
}

event free()
{
    WeaponsList.Remove(0, WeaponsList.Length);
    // End:0x2b
    if(SpinnyWeap != none)
    {
        SpinnyWeap.Destroy();
        SpinnyWeap = none;
    }
    super(GUITabPanel).free();
}

function bool CoolOnKeyEvent(out byte key, out byte State, float Delta)
{
    local Engine.Interactions.EInputKey iKey;
    local Vector V;

    iKey = key;
    V = SpinnyWeap.DrawScale3D;
    // End:0x282
    if(State == 1)
    {
        switch(iKey)
        {
            // End:0x5a
            case 69:
                SpinnyWeapOffset.X = SpinnyWeapOffset.X - float(1);
                LogSpinnyWeap();
                return true;
            // End:0x81
            case 67:
                SpinnyWeapOffset.X = SpinnyWeapOffset.X + float(1);
                LogSpinnyWeap();
                return true;
            // End:0xa8
            case 87:
                SpinnyWeapOffset.Z = SpinnyWeapOffset.Z + float(1);
                LogSpinnyWeap();
                return true;
            // End:0xcf
            case 65:
                SpinnyWeapOffset.Y = SpinnyWeapOffset.Y - float(1);
                LogSpinnyWeap();
                return true;
            // End:0xf6
            case 83:
                SpinnyWeapOffset.Z = SpinnyWeapOffset.Z - float(1);
                LogSpinnyWeap();
                return true;
            // End:0x11d
            case 68:
                SpinnyWeapOffset.Y = SpinnyWeapOffset.Y + float(1);
                LogSpinnyWeap();
                return true;
            // End:0x158
            case 104:
                V.Z = V.Z + float(1);
                SpinnyWeap.SetDrawScale3D(V);
                LogWeapScale();
                return true;
            // End:0x193
            case 100:
                V.Y = V.Y - float(1);
                SpinnyWeap.SetDrawScale3D(V);
                LogWeapScale();
                return true;
            // End:0x1ce
            case 102:
                V.Y = V.Y + float(1);
                SpinnyWeap.SetDrawScale3D(V);
                LogWeapScale();
                return true;
            // End:0x209
            case 98:
                V.Z = V.Z - float(1);
                SpinnyWeap.SetDrawScale3D(V);
                LogWeapScale();
                return true;
            // End:0x244
            case 103:
                V.X = V.X - float(1);
                SpinnyWeap.SetDrawScale3D(V);
                LogWeapScale();
                return true;
            // End:0x27f
            case 105:
                V.X = V.X + float(1);
                SpinnyWeap.SetDrawScale3D(V);
                LogWeapScale();
                return true;
            // End:0xffff
            default:
            }
            return false;
}

function LogSpinnyWeap()
{
    Log("Weapon Position X:" $ string(SpinnyWeapOffset.X) @ "Y:" $ string(SpinnyWeapOffset.Y) @ "Z:" $ string(SpinnyWeapOffset.Z));
}

function LogWeapScale()
{
    Log("DrawScale3D X:" $ string(SpinnyWeap.DrawScale3D.X) @ "Y:" $ string(SpinnyWeap.DrawScale3D.Y) @ "Z:" $ string(SpinnyWeap.DrawScale3D.Z));
}

defaultproperties
{
    begin object name=WeaponBK class=GUISectionBackground
        Caption="??"
        WinTop=0.0333340
        WinLeft=0.0316410
        WinWidth=0.4249990
        WinHeight=0.611250
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'UT2K4Tab_WeaponPref.WeaponBK'
    i_BG=WeaponBK
    begin object name=WeaponPriorityBK class=GUISectionBackground
        bFillClient=true
        Caption="?? ?? ??"
        LeftPadding=0.0
        RightPadding=0.0
        WinTop=0.6666670
        WinLeft=0.0465880
        WinWidth=0.3801570
        WinHeight=0.311250
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'UT2K4Tab_WeaponPref.WeaponPriorityBK'
    i_BG2=WeaponPriorityBK
    begin object name=WeaponOptionBK class=GUISectionBackground
        Caption="???-??"
        BottomPadding=0.30
        WinTop=0.0333340
        WinLeft=0.4816410
        WinWidth=0.4937490
        WinHeight=0.9425010
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'UT2K4Tab_WeaponPref.WeaponOptionBK'
    i_BG3=WeaponOptionBK
    begin object name=GameCrossHairImage class=GUIImage
        ImageStyle=2
        ImageAlign=1
        X1=0
        Y1=0
        X2=64
        Y2=64
        WinTop=0.8189150
        WinLeft=0.884110
        WinWidth=0.1394530
        WinHeight=0.2314450
        RenderWeight=0.550
    object end
    // Reference: GUIImage'UT2K4Tab_WeaponPref.GameCrossHairImage'
    i_Crosshair=GameCrossHairImage
    begin object name=CrosshairBK class=GUIImage
        ImageStyle=1
        DropShadowX=4
        DropShadowY=4
        WinTop=0.7031920
        WinLeft=0.8143330
        WinWidth=0.1394530
        WinHeight=0.2314450
        RenderWeight=0.520
    object end
    // Reference: GUIImage'UT2K4Tab_WeaponPref.CrosshairBK'
    i_CrosshairBG=CrosshairBK
    begin object name=Bk1 class=GUIImage
        ImageStyle=1
        WinTop=0.3008140
        WinLeft=0.0463440
        WinWidth=0.3941180
        WinHeight=0.3249810
    object end
    // Reference: GUIImage'UT2K4Tab_WeaponPref.Bk1'
    i_bk=Bk1
    begin object name=WeaponPrefWeapUp class=GUIGFXButton
        ImageIndex=6
        Position=2
        StyleName="ComboButton"
        Hint="??? ??? ???? ? ? ??? ?? ???? ????."
        WinTop=0.7733890
        WinLeft=0.4198470
        WinWidth=0.0289460
        WinHeight=0.0385940
        RenderWeight=0.510
        TabOrder=2
        bNeverFocus=true
        bRepeatClick=true
        OnClickSound=3
        OnClick=ChangePriority
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIGFXButton'UT2K4Tab_WeaponPref.WeaponPrefWeapUp'
    b_Up=WeaponPrefWeapUp
    begin object name=WeaponPrefWeapDown class=GUIGFXButton
        ImageIndex=7
        Position=2
        StyleName="ComboButton"
        Hint="?? ?? ??? ???? ? ? ??? ?? ???? ????."
        WinTop=0.8176190
        WinLeft=0.4198470
        WinWidth=0.0289460
        WinHeight=0.0385940
        RenderWeight=0.510
        TabOrder=3
        bNeverFocus=true
        bRepeatClick=true
        OnClickSound=4
        OnClick=ChangePriority
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIGFXButton'UT2K4Tab_WeaponPref.WeaponPrefWeapDown'
    b_Down=WeaponPrefWeapDown
    begin object name=WeaponPrefWeapList class=GUIListBox
        bVisibleWhenEmpty=true
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="???? ???? ?????."
        WinTop=0.7338680
        WinLeft=0.0685460
        WinWidth=0.3383380
        WinHeight=0.2210550
        RenderWeight=0.510
        TabOrder=1
        OnChange=InternalOnChange
        OnSaveINI=InternalOnSaveINI
    object end
    // Reference: GUIListBox'UT2K4Tab_WeaponPref.WeaponPrefWeapList'
    lb_Weapons=WeaponPrefWeapList
    begin object name=WeaponDescription class=GUIScrollTextBox
        CharDelay=0.00150
        EOLDelay=0.250
        bVisibleWhenEmpty=true
        OnCreateComponent=InternalOnCreateComponent
        FontScale=0
        WinTop=0.3780730
        WinLeft=0.0631250
        WinWidth=0.362170
        WinHeight=0.1889690
        RenderWeight=0.510
        TabOrder=0
        bAcceptsInput=true
        bNeverFocus=true
    object end
    // Reference: GUIScrollTextBox'UT2K4Tab_WeaponPref.WeaponDescription'
    lb_Desc=WeaponDescription
    begin object name=WeaponSwap class=moCheckBox
        Caption="?? ?? ??"
        OnCreateComponent=InternalOnCreateComponent
        Hint="??? ??? ?? ??? ??? ?? ?????."
        WinTop=0.7539460
        WinLeft=0.5409530
        WinWidth=0.2250
        WinHeight=0.040
        RenderWeight=1.030
        TabOrder=11
        OnChange=InternalOnChange
    object end
    // Reference: moCheckBox'UT2K4Tab_WeaponPref.WeaponSwap'
    ch_Swap=WeaponSwap
    begin object name=CustomWeaponCrosshair class=moCheckBox
        CaptionWidth=0.90
        Caption="???-?? ??"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="??? ?? ?? ??? ?? ??? ?????."
        WinTop=0.8814450
        WinLeft=0.0272030
        WinWidth=0.4639750
        WinHeight=0.040
        RenderWeight=1.010
        TabOrder=4
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'UT2K4Tab_WeaponPref.CustomWeaponCrosshair'
    ch_WeaponCrosshair=CustomWeaponCrosshair
    begin object name=WeaponMesh class=moCheckBox
        Caption="??? ??"
        OnCreateComponent=InternalOnCreateComponent
        Hint="? ??? ??? ??? ?????. (???? ??)"
        WinTop=0.8372790
        WinLeft=0.542070
        WinWidth=0.2240620
        WinHeight=0.040
        RenderWeight=1.030
        TabOrder=12
        OnChange=InternalOnChange
    object end
    // Reference: moCheckBox'UT2K4Tab_WeaponPref.WeaponMesh'
    ch_ClassicModel=WeaponMesh
    begin object name=GameCrossHair class=moComboBox
        ComponentJustification=0
        CaptionWidth=0.30
        Caption="???-?? ??"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="?? ??? ?????!"
        WinTop=0.8229360
        WinLeft=0.0272030
        WinWidth=0.4639750
        WinHeight=0.040
        RenderWeight=1.060
        TabOrder=5
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moComboBox'UT2K4Tab_WeaponPref.GameCrossHair'
    co_Crosshair=GameCrossHair
    begin object name=GameHudCrossHairR class=moSlider
        MaxValue=255.0
        bIntSlider=true
        CaptionWidth=0.30
        Caption="???:"
        LabelColor=(R=255,G=0,B=0,A=255)
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="???-??? ??? ?????."
        WinTop=0.4808220
        WinLeft=0.0272030
        WinWidth=0.6443660
        RenderWeight=0.550
        TabOrder=6
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moSlider'UT2K4Tab_WeaponPref.GameHudCrossHairR'
    sl_Red=GameHudCrossHairR
    begin object name=GameHudCrossHairB class=moSlider
        MaxValue=255.0
        bIntSlider=true
        CaptionWidth=0.30
        Caption="???:"
        LabelColor=(R=0,G=0,B=255,A=255)
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="???-??? ??? ?????."
        WinTop=0.6090940
        WinLeft=0.0272030
        WinWidth=0.6443660
        RenderWeight=0.550
        TabOrder=8
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moSlider'UT2K4Tab_WeaponPref.GameHudCrossHairB'
    sl_Blue=GameHudCrossHairB
    begin object name=GameHudCrossHairG class=moSlider
        MaxValue=255.0
        bIntSlider=true
        CaptionWidth=0.30
        Caption="??:"
        LabelColor=(R=0,G=255,B=0,A=255)
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="???-??? ??? ?????."
        WinTop=0.5449580
        WinLeft=0.0272030
        WinWidth=0.6443660
        RenderWeight=0.550
        TabOrder=7
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moSlider'UT2K4Tab_WeaponPref.GameHudCrossHairG'
    sl_Green=GameHudCrossHairG
    begin object name=GameHudCrossHairA class=moSlider
        MaxValue=255.0
        bIntSlider=true
        CaptionWidth=0.30
        Caption="????:"
        LabelColor=(R=255,G=255,B=255,A=255)
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="???-??? ??? ?????."
        WinTop=0.6719270
        WinLeft=0.0272030
        WinWidth=0.6443660
        RenderWeight=0.550
        TabOrder=9
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moSlider'UT2K4Tab_WeaponPref.GameHudCrossHairA'
    sl_Alpha=GameHudCrossHairA
    begin object name=GameHudCrosshairScale class=moSlider
        MaxValue=2.0
        CaptionWidth=0.30
        Caption="???-?? ??:"
        LabelColor=(R=255,G=255,B=255,A=255)
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="?? ??? ??? ????."
        WinTop=0.7331240
        WinLeft=0.0272030
        WinWidth=0.6443660
        RenderWeight=0.550
        TabOrder=10
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moSlider'UT2K4Tab_WeaponPref.GameHudCrosshairScale'
    sl_CrosshairScale=GameHudCrosshairScale
    SpinnyWeapOffset=(X=100.0,Y=1.50,Z=-10.0)
    WeaponIndex=-1
    MaxCrosshairWidth=0.0719220
    MaxCrosshairHeight=0.1210810
    HiddenText="??"
    LoadingText="...?? ?????? ?? ?..."
    PanelCaption="??"
    WinTop=0.150
    WinHeight=0.740
    OnRendered=InternalDraw
}