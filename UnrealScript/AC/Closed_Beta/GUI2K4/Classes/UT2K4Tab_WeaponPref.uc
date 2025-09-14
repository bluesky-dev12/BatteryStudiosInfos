class UT2K4Tab_WeaponPref extends Settings_Tabs
    config(User)
    editinlinenew
    instanced;

struct WeapItem
{
    var Class<wWeapon> WeapClass;
    var int WeapPriority;
    var int CrosshairIndex;
    var bool bAltFireMode;
    var bool bClassicModel;
    var Color CustomColor;
    var float CrosshairScale;
};

var array<WeapItem> WeaponsList;
var() automated GUISectionBackground i_BG;
var() automated GUISectionBackground i_BG2;
var() automated GUISectionBackground i_BG3;
var() automated GUIImage i_Crosshair;
var() automated GUIImage i_CrosshairBG;
var() automated GUIImage i_Shadow;
var() automated GUIImage i_bk;
var() automated GUIGFXButton b_Up;
var() automated GUIGFXButton b_Down;
var() automated GUIListBox lb_Weapons;
var() automated GUIScrollTextBox lb_Desc;
var() automated moCheckBox ch_Swap;
var() automated moCheckBox ch_WeaponCrosshair;
var() automated moCheckBox ch_ClassicModel;
var() automated moComboBox co_Crosshair;
var() automated moSlider sl_Red;
var() automated moSlider sl_Blue;
var() automated moSlider sl_Green;
var() automated moSlider sl_Alpha;
var() automated moSlider sl_CrosshairScale;
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
    local Class<wWeapon> WA, WB;

    WA = Class<wWeapon>(ElemA.ExtraData);
    WB = Class<wWeapon>(ElemB.ExtraData);
    PA = int(WA.default.Priority);
    pB = int(WB.default.Priority);
    Result = pB - PA;
    // End:0x9F
    if(((Result != 0) || ElemA.Item == "") || ElemB.Item == "")
    {
        return Result;
    }
    Result = StrCmp(ElemA.Item, ElemB.Item);
    // End:0xCC
    if(Result != 0)
    {
        return Result;
    }
    return StrCmp(ElemA.ExtraStrData, ElemB.ExtraStrData);
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local array<CrosshairRecord> CustomCrosshairs;

    super.InitComponent(MyController, myOwner);
    cCrosshair = Class'Engine.HUD'.default.CrossHairColor;
    co_Crosshair.MyComboBox.MyListBox.MyList.bInitializeList = false;
    Class'Engine.CacheManager'.static.GetCrosshairList(CustomCrosshairs);
    i = 0;
    J0x68:

    // End:0xB1 [Loop If]
    if(i < CustomCrosshairs.Length)
    {
        co_Crosshair.AddItem(CustomCrosshairs[i].FriendlyName, CustomCrosshairs[i].CrosshairTexture);
        i++;
        // [Loop Continue]
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
    // End:0x1E6
    if(bDebugWeapon)
    {
        __OnKeyEvent__Delegate = CoolOnKeyEvent;
    }
    //return;    
}

function IntializeWeaponList()
{
    local export editinline UT2K4GenericMessageBox Page;

    // End:0x16C
    if(Controller.OpenMenu("GUI2K4.UT2K4GenericMessageBox", "", LoadingText))
    {
        Page = UT2K4GenericMessageBox(Controller.ActivePage);
        Page.RemoveComponent(Page.b_OK);
        Page.RemoveComponent(Page.l_Text);
        Page.l_Text2.FontScale = 2;
        Page.l_Text2.WinHeight = 1.0000000;
        Page.l_Text2.WinTop = 0.0000000;
        Page.l_Text2.bBoundToParent = true;
        Page.l_Text2.bScaleToParent = true;
        Page.l_Text2.VertAlign = 1;
        Page.l_Text2.TextAlign = 1;
        Page.bRenderWorld = false;
        Page.__OnRendered__Delegate = ReallyInitializeWeaponList;
    }
    //return;    
}

function ReallyInitializeWeaponList(Canvas C)
{
    local int i;
    local array<WeaponRecord> Records;

    // End:0x3A
    if(Controller.ActivePage.Tag != 55)
    {
        Controller.ActivePage.Tag = 55;
        return;
    }
    Class'Engine.CacheManager'.static.GetWeaponList(Records);
    lb_Weapons.List.bNotify = false;
    lb_Weapons.List.Clear();
    i = 0;
    J0x84:

    // End:0xF1 [Loop If]
    if(i < Records.Length)
    {
        lb_Weapons.List.Add(Records[i].FriendlyName, DynamicLoadObject(Records[i].ClassName, Class'Core.Class'), Records[i].Description);
        i++;
        // [Loop Continue]
        goto J0x84;
    }
    lb_Weapons.List.SortList();
    // End:0x129
    if(SpinnyWeap == none)
    {
        SpinnyWeap = PlayerOwner().Spawn(Class'XInterface.SpinnyWeap');
    }
    SpinnyWeap.SetRotation(PlayerOwner().Rotation);
    SpinnyWeap.SetStaticMesh(none);
    lb_Weapons.List.SetIndex(0);
    WeaponListInitialized();
    lb_Weapons.List.bNotify = true;
    // End:0x1B2
    if(Controller.ActivePage != PageOwner)
    {
        Controller.CloseMenu(true);
    }
    FocusFirst(none);
    //return;    
}

function ResetClicked()
{
    local int i;
    local bool bTemp;

    super.ResetClicked();
    Class'Engine.HUD'.static.ResetConfig("CrosshairStyle");
    Class'Engine.HUD'.static.ResetConfig("bCrosshairShow");
    Class'Engine.HUD'.static.ResetConfig("CrosshairColor");
    Class'Engine.HUD'.static.ResetConfig("CrosshairOpacity");
    Class'Engine.HUD'.static.ResetConfig("CrosshairScale");
    Class'XInterface.HudBase'.static.ResetConfig("bUseCustomWeaponCrosshairs");
    i = 0;
    J0xD5:

    // End:0x22E [Loop If]
    if(i < WeaponsList.Length)
    {
        WeaponsList[i].WeapClass.static.ResetConfig("Priority");
        WeaponsList[i].WeapClass.static.ResetConfig("ExchangeFireModes");
        WeaponsList[i].WeapClass.static.ResetConfig("bUseOldWeaponMesh");
        WeaponsList[i].WeapClass.static.ResetConfig("CustomCrosshairScale");
        WeaponsList[i].WeapClass.static.ResetConfig("CustomCrosshairTextureName");
        WeaponsList[i].WeapClass.static.ResetConfig("CustomCrosshair");
        WeaponsList[i].WeapClass.static.ResetConfig("CustomCrosshairColor");
        i++;
        // [Loop Continue]
        goto J0xD5;
    }
    bTemp = Controller.bCurMenuInitialized;
    Controller.bCurMenuInitialized = false;
    i = 0;
    J0x25C:

    // End:0x28C [Loop If]
    if(i < Controls.Length)
    {
        Controls[i].LoadINI();
        i++;
        // [Loop Continue]
        goto J0x25C;
    }
    lb_Weapons.List.SortList();
    Controller.bCurMenuInitialized = bTemp;
    WeaponListInitialized();
    //return;    
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
    if((PC != none) && PC.myHUD != none)
    {
        // End:0x76
        if(PC.myHUD.CrosshairStyle != iCrossHair)
        {
            PC.myHUD.CrosshairStyle = iCrossHair;
            bSave = true;
        }
        // End:0xFC
        if(PC.myHUD.bCrosshairShow != (bWeaponCrosshair || iCrossHair < (co_Crosshair.ItemCount() - 1)))
        {
            PC.myHUD.bCrosshairShow = bWeaponCrosshair || iCrossHair < (co_Crosshair.ItemCount() - 1);
            bSave = true;
        }
        // End:0x145
        if(PC.myHUD.CrossHairColor != cCrosshair)
        {
            PC.myHUD.CrossHairColor = cCrosshair;
            bSave = true;
        }
        // End:0x18B
        if(PC.myHUD.CrosshairScale != fScale)
        {
            PC.myHUD.CrosshairScale = fScale;
            bSave = true;
        }
        // End:0x1FB
        if(HudBase(PC.myHUD) != none)
        {
            // End:0x1F8
            if(HudBase(PC.myHUD).bUseCustomWeaponCrosshairs != bWeaponCrosshair)
            {
                HudBase(PC.myHUD).bUseCustomWeaponCrosshairs = bWeaponCrosshair;
                bSave = true;
            }            
        }
        else
        {
            // End:0x257
            if(Class'XInterface.HudBase'.default.bUseCustomWeaponCrosshairs != bWeaponCrosshair)
            {
                Class'XInterface.HudBase'.default.bUseCustomWeaponCrosshairs = bWeaponCrosshair;
                PC.myHUD.SaveConfig();
                Class'XInterface.HudBase'.static.StaticSaveConfig();
                bSave = false;
            }
        }
        // End:0x275
        if(bSave)
        {
            PC.myHUD.SaveConfig();
        }        
    }
    else
    {
        // End:0x2AC
        if(Class'Engine.HUD'.default.CrosshairStyle != iCrossHair)
        {
            Class'Engine.HUD'.default.CrosshairStyle = iCrossHair;
            bSave = true;
        }
        // End:0x31A
        if(Class'Engine.HUD'.default.bCrosshairShow != (bWeaponCrosshair || iCrossHair < co_Crosshair.ItemCount()))
        {
            Class'Engine.HUD'.default.bCrosshairShow = bWeaponCrosshair || iCrossHair < co_Crosshair.ItemCount();
            bSave = true;
        }
        // End:0x351
        if(Class'Engine.HUD'.default.CrossHairColor != cCrosshair)
        {
            Class'Engine.HUD'.default.CrossHairColor = cCrosshair;
            bSave = true;
        }
        // End:0x385
        if(Class'Engine.HUD'.default.CrosshairScale != fScale)
        {
            Class'Engine.HUD'.default.CrosshairScale = fScale;
            bSave = true;
        }
        // End:0x3CC
        if(Class'XInterface.HudBase'.default.bUseCustomWeaponCrosshairs != bWeaponCrosshair)
        {
            Class'XInterface.HudBase'.default.bUseCustomWeaponCrosshairs = bWeaponCrosshair;
            Class'XInterface.HudBase'.static.StaticSaveConfig();
            bSave = false;
        }
        // End:0x3E4
        if(bSave)
        {
            Class'Engine.HUD'.static.StaticSaveConfig();
        }
    }
    i = 0;
    J0x3EB:

    // End:0xA96 [Loop If]
    if(i < WeaponsList.Length)
    {
        bSave = false;
        // End:0x467
        if(WeaponsList[i].WeapPriority != int(WeaponsList[i].WeapClass.default.Priority))
        {
            WeaponsList[i].WeapClass.default.Priority = byte(WeaponsList[i].WeapPriority);
            bSave = true;
        }
        // End:0x4D1
        if(int(byte(WeaponsList[i].bAltFireMode)) != int(WeaponsList[i].WeapClass.default.ExchangeFireModes))
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
        // End:0x69A
        if(WeaponTex == none)
        {
            // End:0x600
            if(WeaponsList[i].WeapClass.default.CustomCrossHairTextureName != "")
            {
                WeaponsList[i].WeapClass.default.CustomCrossHairTextureName = "";
                bSave = true;
            }
            // End:0x64A
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
        else
        {
            // End:0x6E8
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
            // End:0x7AB
            if(WeaponsList[i].WeapClass.default.CustomCrossHairColor != WeaponsList[i].CustomColor)
            {
                WeaponsList[i].WeapClass.default.CustomCrossHairColor = WeaponsList[i].CustomColor;
                bSave = true;
            }
        }
        // End:0xA69
        if((PC != none) && PC.Pawn != none)
        {
            InvWeap = wWeapon(PC.Pawn.FindInventoryType(WeaponsList[i].WeapClass));
            // End:0xA0B
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
                else
                {
                    InvWeap.CustomCrossHairTexture = WeaponTex;
                    InvWeap.CustomCrossHairTextureName = string(WeaponTex);
                    InvWeap.CustomCrossHairColor = WeaponsList[i].CustomColor;
                    InvWeap.CustomCrosshair = WeaponsList[i].CrosshairIndex;
                }
                InvWeap.CustomCrossHairScale = WeaponsList[i].CrosshairScale;
                InvWeap.ExchangeFireModes = byte(WeaponsList[i].bAltFireMode);
                // End:0x9B2
                if(bDebugPriority)
                {
                    Log((((((("Found weapon of class" @ string(WeaponsList[i].WeapClass)) @ "in Pawn inventory '") $ string(InvWeap.Name)) $ "'. Priority:") $ string(InvWeap.Priority)) @ "New value:") $ string(WeaponsList[i].WeapPriority), 'DebugPriority');
                }
                InvWeap.Priority = byte(WeaponsList[i].WeapPriority);
                InvWeap.bUseOldWeaponMesh = WeaponsList[i].bClassicModel;
                InvWeap.SaveConfig();
                bSave = false;                
            }
            else
            {
                // End:0xA69
                if(bDebugPriority)
                {
                    Log(("Did not find any weapons of class" @ string(WeaponsList[i].WeapClass)) @ "in pawn's inventory", 'DebugPriority');
                }
            }
        }
        // End:0xA8C
        if(bSave)
        {
            WeaponsList[i].WeapClass.static.StaticSaveConfig();
        }
        i++;
        // [Loop Continue]
        goto J0x3EB;
    }
    //return;    
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
    //return;    
}

function string InternalOnSaveINI(GUIComponent Sender)
{
    local int i, j, cnt;

    // End:0x175
    if(Sender == lb_Weapons)
    {
        cnt = lb_Weapons.ItemCount();
        i = 0;
        J0x2B:

        // End:0x175 [Loop If]
        if(i < cnt)
        {
            // End:0x91
            if(bDebugPriority)
            {
                Log(("Searching for WeaponList Index for" @ string(i)) @ lb_Weapons.List.GetItemAtIndex(i));
            }
            j = FindWeaponListIndexAt(i);
            // End:0x16B
            if(j != -1)
            {
                // End:0x14B
                if(bDebugPriority)
                {
                    Log(((("Found WeaponListIndex for" @ string(i)) @ ":") $ string(j)) @ string(WeaponsList[j].WeapClass));
                    Log((("Setting WeaponList[" $ string(j)) $ "].WeapPriority to:") $ string((cnt - i) - 1));
                }
                WeaponsList[j].WeapPriority = (cnt - i) - 1;
            }
            i++;
            // [Loop Continue]
            goto J0x2B;
        }
    }
    return "";
    //return;    
}

function InternalOnLoadINI(GUIComponent Sender, string S)
{
    local HudBase Base;

    Base = HudBase(PlayerOwner().myHUD);
    // End:0x4B4
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
                // End:0xC6
                case co_Crosshair:
                    iCrossHair = Base.CrosshairStyle;
                    // End:0xC3
                    if(!Base.bUseCustomWeaponCrosshairs)
                    {
                        co_Crosshair.SetIndex(iCrossHair);
                        SetCrossHairGraphic(iCrossHair);
                    }
                    // End:0x256
                    break;
                // End:0x100
                case sl_Red:
                    // End:0xFD
                    if(!Base.bUseCustomWeaponCrosshairs)
                    {
                        sl_Red.SetValue(float(cCrosshair.R));
                    }
                    // End:0x256
                    break;
                // End:0x13A
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
                // End:0x1AE
                case sl_Alpha:
                    // End:0x1AB
                    if(!Base.bUseCustomWeaponCrosshairs)
                    {
                        sl_Alpha.SetValue(float(cCrosshair.A));
                    }
                    // End:0x256
                    break;
                // End:0x1F5
                case sl_CrosshairScale:
                    fScale = Base.CrosshairScale;
                    // End:0x1F2
                    if(!Base.bUseCustomWeaponCrosshairs)
                    {
                        sl_CrosshairScale.SetValue(fScale);
                    }
                    // End:0x256
                    break;
                // End:0xFFFF
                default:
                    Log((string(Name) @ "Unknown component calling LoadINI:") $ GUIMenuOption(Sender).Caption);
                    GUIMenuOption(Sender).SetComponentValue(S, true);
                    break;
            }            
        }
        else
        {
            switch(GUIMenuOption(Sender))
            {
                // End:0x29B
                case ch_WeaponCrosshair:
                    bWeaponCrosshair = Class'XInterface.HudBase'.default.bUseCustomWeaponCrosshairs;
                    ch_WeaponCrosshair.Checked(bWeaponCrosshair);
                    // End:0x4B4
                    break;
                // End:0x2ED
                case co_Crosshair:
                    iCrossHair = Class'Engine.HUD'.default.CrosshairStyle;
                    // End:0x2EA
                    if(!Class'XInterface.HudBase'.default.bUseCustomWeaponCrosshairs)
                    {
                        co_Crosshair.SetIndex(iCrossHair);
                        SetCrossHairGraphic(iCrossHair);
                    }
                    // End:0x4B4
                    break;
                // End:0x327
                case sl_Red:
                    // End:0x324
                    if(!Class'XInterface.HudBase'.default.bUseCustomWeaponCrosshairs)
                    {
                        sl_Red.SetValue(float(cCrosshair.R));
                    }
                    // End:0x4B4
                    break;
                // End:0x361
                case sl_Green:
                    // End:0x35E
                    if(!Class'XInterface.HudBase'.default.bUseCustomWeaponCrosshairs)
                    {
                        sl_Green.SetValue(float(cCrosshair.G));
                    }
                    // End:0x4B4
                    break;
                // End:0x39B
                case sl_Blue:
                    // End:0x398
                    if(!Class'XInterface.HudBase'.default.bUseCustomWeaponCrosshairs)
                    {
                        sl_Blue.SetValue(float(cCrosshair.B));
                    }
                    // End:0x4B4
                    break;
                // End:0x3D5
                case sl_Alpha:
                    // End:0x3D2
                    if(!Class'XInterface.HudBase'.default.bUseCustomWeaponCrosshairs)
                    {
                        sl_Alpha.SetValue(float(cCrosshair.A));
                    }
                    // End:0x4B4
                    break;
                // End:0x453
                case sl_CrosshairScale:
                    fScale = Class'Engine.HUD'.default.CrosshairScale;
                    // End:0x419
                    if(!Class'XInterface.HudBase'.default.bUseCustomWeaponCrosshairs)
                    {
                        sl_CrosshairScale.SetValue(fScale);
                    }
                    // End:0x450
                    if(bDebugScale)
                    {
                        Log("Initial global crosshair scale is" @ string(fScale));
                    }
                    // End:0x4B4
                    break;
                // End:0xFFFF
                default:
                    Log((string(Name) @ "Unknown component calling LoadINI:") $ GUIMenuOption(Sender).Caption);
                    GUIMenuOption(Sender).SetComponentValue(S, true);
                    break;
            }
        }
    }
    //return;    
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
        else
        {
            UpdateCurrentWeapon();
        }
        return;
    }
    switch(GUIMenuOption(Sender))
    {
        // End:0xCC
        case co_Crosshair:
            i = co_Crosshair.GetIndex();
            // End:0xB3
            if(bWeaponCrosshair)
            {
                WeaponsList[WeaponIndex].CrosshairIndex = i;                
            }
            else
            {
                iCrossHair = i;
            }
            SetCrossHairGraphic(i);
            // End:0x4A7
            break;
        // End:0x12C
        case ch_WeaponCrosshair:
            bWeaponCrosshair = ch_WeaponCrosshair.IsChecked();
            // End:0x115
            if(bWeaponCrosshair)
            {
                co_Crosshair.SetIndex(WeaponsList[WeaponIndex].CrosshairIndex);                
            }
            else
            {
                co_Crosshair.SetIndex(iCrossHair);
            }
            // End:0x4A7
            break;
        // End:0x158
        case ch_Swap:
            WeaponsList[WeaponIndex].bAltFireMode = ch_Swap.IsChecked();
            // End:0x4A7
            break;
        // End:0x18A
        case ch_ClassicModel:
            WeaponsList[WeaponIndex].bClassicModel = ch_ClassicModel.IsChecked();
            UpdateCurrentWeapon();
            // End:0x4A7
            break;
        // End:0x202
        case sl_Red:
            i = int(sl_Red.GetValue());
            // End:0x1D2
            if(bWeaponCrosshair)
            {
                WeaponsList[WeaponIndex].CustomColor.R = byte(i);                
            }
            else
            {
                cCrosshair.R = byte(i);
            }
            i_Crosshair.ImageColor.R = byte(i);
            // End:0x4A7
            break;
        // End:0x27A
        case sl_Blue:
            i = int(sl_Blue.GetValue());
            // End:0x24A
            if(bWeaponCrosshair)
            {
                WeaponsList[WeaponIndex].CustomColor.B = byte(i);                
            }
            else
            {
                cCrosshair.B = byte(i);
            }
            i_Crosshair.ImageColor.B = byte(i);
            // End:0x4A7
            break;
        // End:0x2F2
        case sl_Green:
            i = int(sl_Green.GetValue());
            // End:0x2C2
            if(bWeaponCrosshair)
            {
                WeaponsList[WeaponIndex].CustomColor.G = byte(i);                
            }
            else
            {
                cCrosshair.G = byte(i);
            }
            i_Crosshair.ImageColor.G = byte(i);
            // End:0x4A7
            break;
        // End:0x36A
        case sl_Alpha:
            i = int(sl_Alpha.GetValue());
            // End:0x33A
            if(bWeaponCrosshair)
            {
                WeaponsList[WeaponIndex].CustomColor.A = byte(i);                
            }
            else
            {
                cCrosshair.A = byte(i);
            }
            i_Crosshair.ImageColor.A = byte(i);
            // End:0x4A7
            break;
        // End:0x4A4
        case sl_CrosshairScale:
            f = sl_CrosshairScale.GetValue();
            // End:0x419
            if(bWeaponCrosshair)
            {
                // End:0x400
                if(bDebugScale)
                {
                    Log((((("Changing custom crosshair scale for " $ string(WeaponsList[WeaponIndex].WeapClass)) @ "from") @ string(WeaponsList[WeaponIndex].CrosshairScale)) @ "to") @ string(f));
                }
                WeaponsList[WeaponIndex].CrosshairScale = f;                
            }
            else
            {
                // End:0x463
                if(bDebugScale)
                {
                    Log((("Changing global crosshair scale from " $ string(fScale)) @ "to") @ string(f));
                }
                fScale = f;
            }
            i_Crosshair.WinHeight = f * MaxCrosshairHeight;
            i_Crosshair.WinWidth = f * MaxCrosshairWidth;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
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

    // End:0x4A9 [Loop If]
    if(i < lb_Weapons.List.ItemCount)
    {
        WI.WeapClass = Class<wWeapon>(lb_Weapons.List.GetObjectAtIndex(i));
        WI.WeapPriority = int(WI.WeapClass.default.Priority);
        WI.CrosshairScale = WI.WeapClass.default.CustomCrossHairScale;
        // End:0x113
        if(bDebugScale)
        {
            Log((("Crosshair scale for " $ string(WI.WeapClass)) $ " is") @ string(WI.CrosshairScale));
        }
        CustomTex = WI.WeapClass.default.CustomCrossHairTexture;
        // End:0x2FE
        if(CustomTex == none)
        {
            // End:0x28E
            if(WI.WeapClass.default.CustomCrossHairTextureName != "")
            {
                WI.CrosshairIndex = FindTextureNameIndex(WI.WeapClass.default.CustomCrossHairTextureName);
                // End:0x275
                if(WI.CrosshairIndex < 0)
                {
                    CustomTex = Texture(DynamicLoadObject(WI.WeapClass.default.CustomCrossHairTextureName, Class'Engine.Texture'));
                    // End:0x1D2
                    if(CustomTex != none)
                    {
                        WI.CrosshairIndex = FindTextureIndex(CustomTex);                        
                    }
                    else
                    {
                        Log(((("Could not load specified custom crosshair texture '" $ WI.WeapClass.default.CustomCrossHairTextureName) $ "' for weapon") @ string(WI.WeapClass)) $ ". Removing weapon's crosshair from crosshair list.");
                    }                    
                }
                else
                {
                    CustomTex = GetTexture(WI.CrosshairIndex);
                }                
            }
            else
            {
                // End:0x2EB
                if(WI.WeapClass.default.CustomCrosshair != -1)
                {
                    CustomTex = GetTexture(WI.WeapClass.default.CustomCrosshair);
                    WI.CrosshairIndex = WI.WeapClass.default.CustomCrosshair;                    
                }
                else
                {
                    WI.CrosshairIndex = -1;
                }
            }            
        }
        else
        {
            CustomTex = WI.WeapClass.default.CustomCrossHairTexture;
            WI.CrosshairIndex = FindTextureIndex(CustomTex);
        }
        // End:0x3B8
        if((CustomTex == none) && WI.WeapClass.default.CustomCrosshair != -1)
        {
            Warn(("Could not load crosshair for weapon" @ string(WI.WeapClass)) @ "so removing from custom weapons list.");
            // [Explicit Continue]
            goto J0x49F;
        }
        // End:0x3F1
        if(WI.WeapClass.default.OldMesh != none)
        {
            WI.bClassicModel = WI.WeapClass.default.bUseOldWeaponMesh;
        }
        WI.bAltFireMode = int(WI.WeapClass.default.ExchangeFireModes) == 1;
        WI.CustomColor = WI.WeapClass.default.CustomCrossHairColor;
        // End:0x48D
        if(WI.CrosshairIndex == co_Crosshair.ItemCount())
        {
            co_Crosshair.AddItem(co_Crosshair.GetItem(FindTextureNameIndex(WI.WeapClass.default.CustomCrossHairTextureName)), CustomTex);
        }
        WeaponsList[WeaponsList.Length] = WI;
        J0x49F:

        i++;
        // [Loop Continue]
        goto J0x43;
    }
    // End:0x4DB
    if(co_Crosshair.FindIndex(HiddenText) == -1)
    {
        co_Crosshair.AddItem(HiddenText);
    }
    co_Crosshair.MyComboBox.List.bNotify = true;
    UpdateCurrentWeapon();
    //return;    
}

function SwapWeapons(int OriginalLoc, int NewLoc)
{
    lb_Weapons.List.Swap(OriginalLoc, NewLoc);
    lb_Weapons.List.SetIndex(NewLoc);
    //return;    
}

function bool ChangePriority(GUIComponent Sender)
{
    // End:0x103
    if(lb_Weapons.List.ItemCount > 1)
    {
        // End:0x85
        if((Sender == b_Up) && lb_Weapons.List.Index > 0)
        {
            SwapWeapons(lb_Weapons.List.Index, lb_Weapons.List.Index - 1);            
        }
        else
        {
            // End:0x103
            if((Sender == b_Down) && lb_Weapons.List.Index < (lb_Weapons.List.ItemCount - 1))
            {
                SwapWeapons(lb_Weapons.List.Index, lb_Weapons.List.Index + 1);
            }
        }
    }
    return true;
    //return;    
}

function InternalDraw(Canvas Canvas)
{
    local Vector CamPos, X, Y, Z, WX, WY,
	    WZ;

    local Rotator camRot;

    // End:0x0D
    if(WeaponIndex < 0)
    {
        return;
    }
    Canvas.GetCameraLocation(CamPos, camRot);
    GetAxes(camRot, X, Y, Z);
    // End:0xCE
    if(int(SpinnyWeap.DrawType) == int(2))
    {
        GetAxes(SpinnyWeap.Rotation, WX, WY, WZ);
        SpinnyWeap.SetLocation((((CamPos + (SpinnyWeapOffset.X * X)) + (SpinnyWeapOffset.Y * Y)) + (SpinnyWeapOffset.Z * Z)) + (float(30) * WX));        
    }
    else
    {
        SpinnyWeap.SetLocation(((CamPos + (SpinnyWeapOffset.X * X)) + (SpinnyWeapOffset.Y * Y)) + (SpinnyWeapOffset.Z * Z));
    }
    Canvas.DrawActorClipped(SpinnyWeap, false, i_BG.ClientBounds[0], i_BG.ClientBounds[1], i_BG.ClientBounds[2] - i_BG.ClientBounds[0], (i_BG.ClientBounds[3] - i_BG.ClientBounds[1]) / float(2), true, 90.0000000);
    //return;    
}

function UpdateCurrentWeapon()
{
    local PlayerController PC;
    local Class<Pickup> PickupClass;
    local Class<InventoryAttachment> attachClass;
    local Mesh OldMesh;
    local StaticMesh OldPickup;
    local float defscale;
    local Vector Scale3D;
    local int i;

    // End:0x0D
    if(SpinnyWeap == none)
    {
        return;
    }
    WeaponIndex = FindWeaponListIndex();
    // End:0xE1
    if(WeaponIndex < 0)
    {
        PC = PlayerOwner();
        // End:0xCF
        if(((PC != none) && PC.Pawn != none) && PC.Pawn.Weapon != none)
        {
            i = 0;
            J0x74:

            // End:0xCF [Loop If]
            if(i < WeaponsList.Length)
            {
                // End:0xC5
                if(ClassIsChildOf(PC.Pawn.Weapon.Class, WeaponsList[i].WeapClass))
                {
                    WeaponIndex = i;
                }
                i++;
                // [Loop Continue]
                goto J0x74;
            }
        }
        // End:0xE1
        if(WeaponIndex < 0)
        {
            WeaponIndex = 0;
        }
    }
    PickupClass = WeaponsList[WeaponIndex].WeapClass.default.PickupClass;
    attachClass = WeaponsList[WeaponIndex].WeapClass.default.AttachmentClass;
    OldMesh = WeaponsList[WeaponIndex].WeapClass.default.OldMesh;
    // End:0x18A
    if((PickupClass != none) && PickupClass.default.StaticMesh != none)
    {
        defscale = PickupClass.default.DrawScale;
        Scale3D = PickupClass.default.DrawScale3D;        
    }
    else
    {
        // End:0x21E
        if((attachClass != none) && attachClass.default.Mesh != none)
        {
            defscale = attachClass.default.DrawScale;
            Scale3D = attachClass.default.DrawScale3D;
            // End:0x1F7
            if(Scale3D.X > 1.0000000)
            {
                Scale3D.X = 1.0000000;
            }
            // End:0x21B
            if(Scale3D.Y > 1.0000000)
            {
                Scale3D.Y = 1.0000000;
            }            
        }
        else
        {
            defscale = 0.5000000;
            Scale3D = vect(1.0000000, 1.0000000, 1.0000000);
        }
    }
    // End:0x399
    if((OldMesh != none) && !Class'Engine.LevelInfo'.static.IsDemoBuild())
    {
        EnableComponent(ch_ClassicModel);
        ch_ClassicModel.SetComponentValue(string(WeaponsList[WeaponIndex].bClassicModel), true);
        // End:0x396
        if(WeaponsList[WeaponIndex].bClassicModel)
        {
            // End:0x2EE
            if(WeaponsList[WeaponIndex].WeapClass.default.OldPickup != "")
            {
                OldPickup = StaticMesh(DynamicLoadObject(WeaponsList[WeaponIndex].WeapClass.default.OldPickup, Class'Engine.StaticMesh'));
            }
            // End:0x396
            if(OldPickup != none)
            {
                SpinnyWeap.LinkMesh(none);
                SpinnyWeap.SetStaticMesh(OldPickup);
                SpinnyWeap.SetDrawScale(defscale);
                SpinnyWeap.SetDrawScale3D(Scale3D);
                i = 0;
                J0x34C:

                // End:0x385 [Loop If]
                if(i < SpinnyWeap.Skins.Length)
                {
                    SpinnyWeap.Skins[i] = none;
                    i++;
                    // [Loop Continue]
                    goto J0x34C;
                }
                SpinnyWeap.SetDrawType(8);
            }
        }        
    }
    else
    {
        ch_ClassicModel.SetComponentValue("False", true);
        DisableComponent(ch_ClassicModel);
    }
    // End:0x6B4
    if(OldPickup == none)
    {
        // End:0x4C2
        if((PickupClass != none) && PickupClass.default.StaticMesh != none)
        {
            SpinnyWeap.LinkMesh(none);
            SpinnyWeap.SetStaticMesh(PickupClass.default.StaticMesh);
            SpinnyWeap.SetDrawScale(defscale);
            SpinnyWeap.SetDrawScale3D(Scale3D);
            SpinnyWeap.Skins.Length = PickupClass.default.Skins.Length;
            i = 0;
            J0x462:

            // End:0x4AE [Loop If]
            if(i < PickupClass.default.Skins.Length)
            {
                SpinnyWeap.Skins[i] = PickupClass.default.Skins[i];
                i++;
                // [Loop Continue]
                goto J0x462;
            }
            SpinnyWeap.SetDrawType(8);            
        }
        else
        {
            // End:0x679
            if((attachClass != none) && attachClass.default.Mesh != none)
            {
                SpinnyWeap.SetStaticMesh(none);
                SpinnyWeap.LinkMesh(attachClass.default.Mesh);
                SpinnyWeap.SetDrawScale(1.3000000 * defscale);
                SpinnyWeap.Skins.Length = attachClass.default.Skins.Length;
                i = 0;
                J0x551:

                // End:0x59D [Loop If]
                if(i < attachClass.default.Skins.Length)
                {
                    SpinnyWeap.Skins[i] = attachClass.default.Skins[i];
                    i++;
                    // [Loop Continue]
                    goto J0x551;
                }
                // End:0x5DD
                if(string(WeaponsList[WeaponIndex].WeapClass) == "XWeapons.Translauncher")
                {
                    Scale3D.Z *= -1.0000000;
                }
                // End:0x665
                if(((string(WeaponsList[WeaponIndex].WeapClass) != "XWeapons.ShockRifle") && string(WeaponsList[WeaponIndex].WeapClass) != "XWeapons.LinkGun") || WeaponsList[WeaponIndex].bClassicModel)
                {
                    SpinnyWeap.SetDrawScale3D(1.3000000 * Scale3D);
                }
                SpinnyWeap.SetDrawType(2);                
            }
            else
            {
                Log("Could not find graphic for weapon: " $ string(WeaponsList[WeaponIndex].WeapClass));
            }
        }
    }
    i_BG.Caption = lb_Weapons.List.Get();
    lb_Desc.SetContent(lb_Weapons.List.GetExtra());
    ch_Swap.SetComponentValue(string(WeaponsList[WeaponIndex].bAltFireMode), true);
    // End:0x7A3
    if(bWeaponCrosshair)
    {
        // End:0x76B
        if(WeaponsList[WeaponIndex].CrosshairIndex == -1)
        {
            WeaponsList[WeaponIndex].CrosshairIndex = co_Crosshair.ItemCount() - 1;
        }
        co_Crosshair.SetIndex(WeaponsList[WeaponIndex].CrosshairIndex);
        SetCrossHairGraphic(WeaponsList[WeaponIndex].CrosshairIndex);        
    }
    else
    {
        co_Crosshair.SetIndex(iCrossHair);
        SetCrossHairGraphic(iCrossHair);
    }
    //return;    
}

function SetCrossHairGraphic(int Index)
{
    local bool B;

    B = ((Index >= 0) && Index < (co_Crosshair.ItemCount() - 1)) && PlayerOwner().myHUD.bCrosshairShow;
    // End:0x74
    if(B)
    {
        i_Crosshair.Image = Texture(co_Crosshair.GetObject());
    }
    // End:0xA3
    if(B != i_Crosshair.bVisible)
    {
        i_Crosshair.SetVisibility(B);
    }
    UpdateCrosshairColor();
    //return;    
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
    //return;    
}

function Texture GetTexture(int i)
{
    // End:0x40
    if((i >= 0) && i < co_Crosshair.ItemCount())
    {
        return Texture(co_Crosshair.GetItemObject(i));
    }
    return none;
    //return;    
}

function int FindWeaponListIndexAt(int Index)
{
    local int i;
    local Class<wWeapon> WC;

    WC = Class<wWeapon>(lb_Weapons.List.GetObjectAtIndex(Index));
    // End:0x74
    if(WC != none)
    {
        i = 0;
        J0x3A:

        // End:0x74 [Loop If]
        if(i < WeaponsList.Length)
        {
            // End:0x6A
            if(WC == WeaponsList[i].WeapClass)
            {
                return i;
            }
            i++;
            // [Loop Continue]
            goto J0x3A;
        }
    }
    return -1;
    //return;    
}

function int FindWeaponListIndex()
{
    local int i;
    local Class<wWeapon> WC;

    WC = Class<wWeapon>(lb_Weapons.List.GetObject());
    i = 0;
    J0x2A:

    // End:0x64 [Loop If]
    if(i < WeaponsList.Length)
    {
        // End:0x5A
        if(WC == WeaponsList[i].WeapClass)
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x2A;
    }
    return -1;
    //return;    
}

function int FindTextureNameIndex(string TextureName)
{
    local int i, cnt;

    cnt = co_Crosshair.ItemCount();
    i = 0;
    J0x1C:

    // End:0x52 [Loop If]
    if(i < cnt)
    {
        // End:0x48
        if(TextureName ~= string(GetTexture(i)))
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x1C;
    }
    // End:0x15A
    if(Controller.bModAuthor)
    {
        Log((("Number of crosshairs:" $ string(cnt)) @ "Was looking for") @ TextureName, 'ModAuthor');
        i = 0;
        J0xAC:

        // End:0x15A [Loop If]
        if(i < cnt)
        {
            Log((((((string(i) @ "TextureName[") $ string(i)) $ "]:") $ co_Crosshair.MyComboBox.List.Elements[i].Item) @ "Texture:") $ string(co_Crosshair.MyComboBox.List.Elements[i].ExtraData), 'ModAuthor');
            i++;
            // [Loop Continue]
            goto J0xAC;
        }
    }
    return -1;
    //return;    
}

function int FindTextureIndex(Texture WeapTexture)
{
    local int i, cnt;

    cnt = co_Crosshair.ItemCount();
    i = 0;
    J0x1C:

    // End:0x4D [Loop If]
    if(i < cnt)
    {
        // End:0x43
        if(WeapTexture == (GetTexture(i)))
        {
            // [Explicit Break]
            goto J0x4D;
        }
        i++;
        // [Loop Continue]
        goto J0x1C;
    }
    J0x4D:

    return i;
    //return;    
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
    //return;    
}

event Closed(GUIComponent Sender, bool bCancelled)
{
    super.Closed(Sender, bCancelled);
    // End:0x2D
    if(SpinnyWeap != none)
    {
        SpinnyWeap.bHidden = true;
    }
    //return;    
}

event free()
{
    WeaponsList.Remove(0, WeaponsList.Length);
    // End:0x2B
    if(SpinnyWeap != none)
    {
        SpinnyWeap.Destroy();
        SpinnyWeap = none;
    }
    super(GUITabPanel).free();
    //return;    
}

function bool CoolOnKeyEvent(out byte key, out byte State, float Delta)
{
    local Interactions.EInputKey iKey;
    local Vector V;

    iKey = key;
    V = SpinnyWeap.DrawScale3D;
    // End:0x282
    if(int(State) == 1)
    {
        switch(iKey)
        {
            // End:0x5A
            case 69:
                SpinnyWeapOffset.X = SpinnyWeapOffset.X - float(1);
                LogSpinnyWeap();
                return true;
            // End:0x81
            case 67:
                SpinnyWeapOffset.X = SpinnyWeapOffset.X + float(1);
                LogSpinnyWeap();
                return true;
            // End:0xA8
            case 87:
                SpinnyWeapOffset.Z = SpinnyWeapOffset.Z + float(1);
                LogSpinnyWeap();
                return true;
            // End:0xCF
            case 65:
                SpinnyWeapOffset.Y = SpinnyWeapOffset.Y - float(1);
                LogSpinnyWeap();
                return true;
            // End:0xF6
            case 83:
                SpinnyWeapOffset.Z = SpinnyWeapOffset.Z - float(1);
                LogSpinnyWeap();
                return true;
            // End:0x11D
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
            // End:0x1CE
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
            // End:0x27F
            case 105:
                V.X = V.X + float(1);
                SpinnyWeap.SetDrawScale3D(V);
                LogWeapScale();
                return true;
            // End:0xFFFF
            default:
                break;
            }
    }
    else
    {
        return false;
        //return;        
    }
}

function LogSpinnyWeap()
{
    Log((((("Weapon Position X:" $ string(SpinnyWeapOffset.X)) @ "Y:") $ string(SpinnyWeapOffset.Y)) @ "Z:") $ string(SpinnyWeapOffset.Z));
    //return;    
}

function LogWeapScale()
{
    Log((((("DrawScale3D X:" $ string(SpinnyWeap.DrawScale3D.X)) @ "Y:") $ string(SpinnyWeap.DrawScale3D.Y)) @ "Z:") $ string(SpinnyWeap.DrawScale3D.Z));
    //return;    
}

defaultproperties
{
    // Reference: GUISectionBackground'GUI2K4_Decompressed.UT2K4Tab_WeaponPref.WeaponBK'
    begin object name="WeaponBK" class=XInterface.GUISectionBackground
        Caption="??"
        WinTop=0.0333340
        WinLeft=0.0316410
        WinWidth=0.4249990
        WinHeight=0.6112500
        OnPreDraw=WeaponBK.InternalPreDraw
    end object
    i_BG=WeaponBK
    // Reference: GUISectionBackground'GUI2K4_Decompressed.UT2K4Tab_WeaponPref.WeaponPriorityBK'
    begin object name="WeaponPriorityBK" class=XInterface.GUISectionBackground
        bFillClient=true
        Caption="?? ?? ??"
        LeftPadding=0.0000000
        RightPadding=0.0000000
        WinTop=0.6666670
        WinLeft=0.0465880
        WinWidth=0.3801570
        WinHeight=0.3112500
        OnPreDraw=WeaponPriorityBK.InternalPreDraw
    end object
    i_BG2=WeaponPriorityBK
    // Reference: GUISectionBackground'GUI2K4_Decompressed.UT2K4Tab_WeaponPref.WeaponOptionBK'
    begin object name="WeaponOptionBK" class=XInterface.GUISectionBackground
        Caption="???-??"
        BottomPadding=0.3000000
        WinTop=0.0333340
        WinLeft=0.4816410
        WinWidth=0.4937490
        WinHeight=0.9425010
        OnPreDraw=WeaponOptionBK.InternalPreDraw
    end object
    i_BG3=WeaponOptionBK
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4Tab_WeaponPref.GameCrossHairImage'
    begin object name="GameCrossHairImage" class=XInterface.GUIImage
        ImageStyle=2
        ImageAlign=1
        X1=0
        Y1=0
        X2=64
        Y2=64
        WinTop=0.8189145
        WinLeft=0.8841095
        WinWidth=0.1394530
        WinHeight=0.2314450
        RenderWeight=0.5500000
    end object
    i_Crosshair=GameCrossHairImage
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4Tab_WeaponPref.CrosshairBK'
    begin object name="CrosshairBK" class=XInterface.GUIImage
        ImageStyle=1
        DropShadowX=4
        DropShadowY=4
        WinTop=0.7031920
        WinLeft=0.8143330
        WinWidth=0.1394530
        WinHeight=0.2314450
        RenderWeight=0.5200000
    end object
    i_CrosshairBG=CrosshairBK
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4Tab_WeaponPref.Bk1'
    begin object name="Bk1" class=XInterface.GUIImage
        ImageStyle=1
        WinTop=0.3008140
        WinLeft=0.0463440
        WinWidth=0.3941180
        WinHeight=0.3249810
    end object
    i_bk=Bk1
    // Reference: GUIGFXButton'GUI2K4_Decompressed.UT2K4Tab_WeaponPref.WeaponPrefWeapUp'
    begin object name="WeaponPrefWeapUp" class=XInterface.GUIGFXButton
        ImageIndex=6
        Position=2
        StyleName="ComboButton"
        Hint="??? ??? ???? ? ? ??? ?? ???? ????."
        WinTop=0.7733890
        WinLeft=0.4198470
        WinWidth=0.0289460
        WinHeight=0.0385940
        RenderWeight=0.5100000
        TabOrder=2
        bNeverFocus=true
        bRepeatClick=true
        OnClickSound=3
        OnClick=UT2K4Tab_WeaponPref.ChangePriority
        OnKeyEvent=WeaponPrefWeapUp.InternalOnKeyEvent
    end object
    b_Up=WeaponPrefWeapUp
    // Reference: GUIGFXButton'GUI2K4_Decompressed.UT2K4Tab_WeaponPref.WeaponPrefWeapDown'
    begin object name="WeaponPrefWeapDown" class=XInterface.GUIGFXButton
        ImageIndex=7
        Position=2
        StyleName="ComboButton"
        Hint="?? ?? ??? ???? ? ? ??? ?? ???? ????."
        WinTop=0.8176190
        WinLeft=0.4198470
        WinWidth=0.0289460
        WinHeight=0.0385940
        RenderWeight=0.5100000
        TabOrder=3
        bNeverFocus=true
        bRepeatClick=true
        OnClickSound=4
        OnClick=UT2K4Tab_WeaponPref.ChangePriority
        OnKeyEvent=WeaponPrefWeapDown.InternalOnKeyEvent
    end object
    b_Down=WeaponPrefWeapDown
    // Reference: GUIListBox'GUI2K4_Decompressed.UT2K4Tab_WeaponPref.WeaponPrefWeapList'
    begin object name="WeaponPrefWeapList" class=XInterface.GUIListBox
        bVisibleWhenEmpty=true
        OnCreateComponent=WeaponPrefWeapList.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="???? ???? ?????."
        WinTop=0.7338680
        WinLeft=0.0685460
        WinWidth=0.3383380
        WinHeight=0.2210550
        RenderWeight=0.5100000
        TabOrder=1
        OnChange=UT2K4Tab_WeaponPref.InternalOnChange
        OnSaveINI=UT2K4Tab_WeaponPref.InternalOnSaveINI
    end object
    lb_Weapons=WeaponPrefWeapList
    // Reference: GUIScrollTextBox'GUI2K4_Decompressed.UT2K4Tab_WeaponPref.WeaponDescription'
    begin object name="WeaponDescription" class=XInterface.GUIScrollTextBox
        CharDelay=0.0015000
        EOLDelay=0.2500000
        bVisibleWhenEmpty=true
        OnCreateComponent=WeaponDescription.InternalOnCreateComponent
        FontScale=0
        WinTop=0.3780730
        WinLeft=0.0631250
        WinWidth=0.3621700
        WinHeight=0.1889690
        RenderWeight=0.5100000
        TabOrder=0
        bAcceptsInput=false
        bNeverFocus=true
    end object
    lb_Desc=WeaponDescription
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_WeaponPref.WeaponSwap'
    begin object name="WeaponSwap" class=XInterface.moCheckBox
        Caption="?? ?? ??"
        OnCreateComponent=WeaponSwap.InternalOnCreateComponent
        Hint="??? ??? ?? ??? ??? ?? ?????."
        WinTop=0.7539460
        WinLeft=0.5409530
        WinWidth=0.2250000
        WinHeight=0.0400000
        RenderWeight=1.0300000
        TabOrder=11
        OnChange=UT2K4Tab_WeaponPref.InternalOnChange
    end object
    ch_Swap=WeaponSwap
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_WeaponPref.CustomWeaponCrosshair'
    begin object name="CustomWeaponCrosshair" class=XInterface.moCheckBox
        CaptionWidth=0.9000000
        Caption="???-?? ??"
        OnCreateComponent=CustomWeaponCrosshair.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="??? ?? ?? ??? ?? ??? ?????."
        WinTop=0.8814450
        WinLeft=0.0272030
        WinWidth=0.4639750
        WinHeight=0.0400000
        RenderWeight=1.0100000
        TabOrder=4
        OnChange=UT2K4Tab_WeaponPref.InternalOnChange
        OnLoadINI=UT2K4Tab_WeaponPref.InternalOnLoadINI
    end object
    ch_WeaponCrosshair=CustomWeaponCrosshair
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_WeaponPref.WeaponMesh'
    begin object name="WeaponMesh" class=XInterface.moCheckBox
        Caption="??? ??"
        OnCreateComponent=WeaponMesh.InternalOnCreateComponent
        Hint="? ??? ??? ??? ?????. (???? ??)"
        WinTop=0.8372790
        WinLeft=0.5420700
        WinWidth=0.2240620
        WinHeight=0.0400000
        RenderWeight=1.0300000
        TabOrder=12
        OnChange=UT2K4Tab_WeaponPref.InternalOnChange
    end object
    ch_ClassicModel=WeaponMesh
    // Reference: moComboBox'GUI2K4_Decompressed.UT2K4Tab_WeaponPref.GameCrossHair'
    begin object name="GameCrossHair" class=XInterface.moComboBox
        ComponentJustification=0
        CaptionWidth=0.3000000
        Caption="???-?? ??"
        OnCreateComponent=GameCrossHair.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="?? ??? ?????!"
        WinTop=0.8229360
        WinLeft=0.0272030
        WinWidth=0.4639750
        WinHeight=0.0400000
        RenderWeight=1.0599999
        TabOrder=5
        OnChange=UT2K4Tab_WeaponPref.InternalOnChange
        OnLoadINI=UT2K4Tab_WeaponPref.InternalOnLoadINI
    end object
    co_Crosshair=GameCrossHair
    // Reference: moSlider'GUI2K4_Decompressed.UT2K4Tab_WeaponPref.GameHudCrossHairR'
    begin object name="GameHudCrossHairR" class=XInterface.moSlider
        MaxValue=255.0000000
        bIntSlider=true
        CaptionWidth=0.3000000
        Caption="???:"
        LabelColor=(R=255,G=0,B=0,A=255)
        OnCreateComponent=GameHudCrossHairR.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="???-??? ??? ?????."
        WinTop=0.4808220
        WinLeft=0.0272030
        WinWidth=0.6443660
        RenderWeight=0.5500000
        TabOrder=6
        OnChange=UT2K4Tab_WeaponPref.InternalOnChange
        OnLoadINI=UT2K4Tab_WeaponPref.InternalOnLoadINI
    end object
    sl_Red=GameHudCrossHairR
    // Reference: moSlider'GUI2K4_Decompressed.UT2K4Tab_WeaponPref.GameHudCrossHairB'
    begin object name="GameHudCrossHairB" class=XInterface.moSlider
        MaxValue=255.0000000
        bIntSlider=true
        CaptionWidth=0.3000000
        Caption="???:"
        LabelColor=(R=0,G=0,B=255,A=255)
        OnCreateComponent=GameHudCrossHairB.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="???-??? ??? ?????."
        WinTop=0.6090940
        WinLeft=0.0272030
        WinWidth=0.6443660
        RenderWeight=0.5500000
        TabOrder=8
        OnChange=UT2K4Tab_WeaponPref.InternalOnChange
        OnLoadINI=UT2K4Tab_WeaponPref.InternalOnLoadINI
    end object
    sl_Blue=GameHudCrossHairB
    // Reference: moSlider'GUI2K4_Decompressed.UT2K4Tab_WeaponPref.GameHudCrossHairG'
    begin object name="GameHudCrossHairG" class=XInterface.moSlider
        MaxValue=255.0000000
        bIntSlider=true
        CaptionWidth=0.3000000
        Caption="??:"
        LabelColor=(R=0,G=255,B=0,A=255)
        OnCreateComponent=GameHudCrossHairG.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="???-??? ??? ?????."
        WinTop=0.5449580
        WinLeft=0.0272030
        WinWidth=0.6443660
        RenderWeight=0.5500000
        TabOrder=7
        OnChange=UT2K4Tab_WeaponPref.InternalOnChange
        OnLoadINI=UT2K4Tab_WeaponPref.InternalOnLoadINI
    end object
    sl_Green=GameHudCrossHairG
    // Reference: moSlider'GUI2K4_Decompressed.UT2K4Tab_WeaponPref.GameHudCrossHairA'
    begin object name="GameHudCrossHairA" class=XInterface.moSlider
        MaxValue=255.0000000
        bIntSlider=true
        CaptionWidth=0.3000000
        Caption="????:"
        LabelColor=(R=255,G=255,B=255,A=255)
        OnCreateComponent=GameHudCrossHairA.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="???-??? ??? ?????."
        WinTop=0.6719270
        WinLeft=0.0272030
        WinWidth=0.6443660
        RenderWeight=0.5500000
        TabOrder=9
        OnChange=UT2K4Tab_WeaponPref.InternalOnChange
        OnLoadINI=UT2K4Tab_WeaponPref.InternalOnLoadINI
    end object
    sl_Alpha=GameHudCrossHairA
    // Reference: moSlider'GUI2K4_Decompressed.UT2K4Tab_WeaponPref.GameHudCrosshairScale'
    begin object name="GameHudCrosshairScale" class=XInterface.moSlider
        MaxValue=2.0000000
        CaptionWidth=0.3000000
        Caption="???-?? ??:"
        LabelColor=(R=255,G=255,B=255,A=255)
        OnCreateComponent=GameHudCrosshairScale.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="?? ??? ??? ????."
        WinTop=0.7331240
        WinLeft=0.0272030
        WinWidth=0.6443660
        RenderWeight=0.5500000
        TabOrder=10
        OnChange=UT2K4Tab_WeaponPref.InternalOnChange
        OnLoadINI=UT2K4Tab_WeaponPref.InternalOnLoadINI
    end object
    sl_CrosshairScale=GameHudCrosshairScale
    SpinnyWeapOffset=(X=100.0000000,Y=1.5000000,Z=-10.0000000)
    WeaponIndex=-1
    MaxCrosshairWidth=0.0719220
    MaxCrosshairHeight=0.1210810
    HiddenText="??"
    LoadingText="...?? ?????? ?? ?..."
    PanelCaption="??"
    WinTop=0.1500000
    WinHeight=0.7400000
    OnRendered=UT2K4Tab_WeaponPref.InternalDraw
}