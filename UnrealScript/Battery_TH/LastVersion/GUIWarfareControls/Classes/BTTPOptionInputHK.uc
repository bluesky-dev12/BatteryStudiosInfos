class BTTPOptionInputHK extends BTTPOptionBaseHK
    editinlinenew
    instanced;

struct OptionInputInfo
{
    var float MouseSensibility;
    var float MouseSensibilityAim;
    var bool bMouseInvert;
    var bool bMouseAccel;
    var bool bMouseRevision;
    var bool bStanceToggle;
    var bool bUseAdvCamShake;
    var bool bUseInverseWeapon;
    var string StoreKey[35];
};

struct InputKeyInfo
{
    var int KeyNumber;
    var string KeyName;
    var string LocalizedKeyName;
    var string Alias;
};

var localized string strLow;
var localized string strHigh;
var localized string strLabel[40];
var string strFunc[40];
var localized string strOn;
var localized string strOff;
var localized string strToggle;
var localized string strButton;
var localized string strWeak;
var localized string strStrong;
var localized string strDefaultSensAim;
var localized string strUseLeftHand;
var localized string strUseRightHand;
var OptionInputInfo InitInfo;
var OptionInputInfo CurrentInfo;
var() editconst noexport InputKeyInfo AllKeys[255];

function InitializeBindingsArray()
{
    local int i;
    local string Alias;

    i = 0;
    J0x07:

    // End:0xB1 [Loop If]
    if(i < 255)
    {
        AllKeys[i].KeyNumber = i;
        Controller.KeyNameFromIndex(byte(i), AllKeys[i].KeyName, AllKeys[i].LocalizedKeyName);
        // End:0xA7
        if(Controller.GetCurrentBind(AllKeys[i].KeyName, Alias))
        {
            Controller.SetKeyBind(AllKeys[i].KeyName, "");
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function InitData()
{
    local int i;
    local PlayerController PC;

    PC = PlayerOwner();
    i = 5;
    J0x11:

    // End:0x59 [Loop If]
    if(i < Content.Length)
    {
        InitInfo.StoreKey[i - 5] = BTOptionKeyButtonHK(Content[i]).BindName;
        i++;
        // [Loop Continue]
        goto J0x11;
    }
    InitInfo.bMouseInvert = Class'Engine.PlayerInput'.default.bInvertMouse;
    InitInfo.MouseSensibility = Class'Engine.PlayerInput'.default.MouseSensitivity * float(20);
    InitInfo.MouseSensibilityAim = Class'Engine.PlayerInput'.default.MouseSensitivityAim * float(20);
    InitInfo.bUseInverseWeapon = bool(PC.ConsoleCommand("GETCONFIG_BOOL Controll UseInverseWeapon"));
    InitInfo.bMouseAccel = false;
    InitInfo.bMouseRevision = PlayerOwner().Level.GetIsUseMouseRevision();
    InitInfo.bStanceToggle = PlayerOwner().Level.GetIsUseStanceToggle();
    InitInfo.bUseAdvCamShake = PlayerOwner().Level.GetIsUseAdvCamShake();
    CurrentInfo = InitInfo;
    //return;    
}

function DefaultResetData()
{
    SetStoreKey_THAILAND();
    Controller.SetKeyBind("Escape", "ShowMenu");
    Controller.SetKeyBind("MouseX", "Count bXAxis | Axis aMouseX Speed=2.0");
    Controller.SetKeyBind("MouseY", "Count bYAxis | Axis aMouseY Speed=2.0");
    CurrentInfo.bMouseInvert = false;
    CurrentInfo.bMouseAccel = false;
    CurrentInfo.bMouseRevision = true;
    CurrentInfo.bStanceToggle = true;
    CurrentInfo.bUseInverseWeapon = false;
    SaveData();
    LoadData();
    //return;    
}

function SetStoreKey_KR()
{
    local int i;

    CurrentInfo = InitInfo;
    CurrentInfo.MouseSensibility = 40.0000000;
    CurrentInfo.MouseSensibilityAim = 40.0000000;
    i = 0;
    CurrentInfo.StoreKey[i++] = "W";
    CurrentInfo.StoreKey[i++] = "S";
    CurrentInfo.StoreKey[i++] = "A";
    CurrentInfo.StoreKey[i++] = "D";
    CurrentInfo.StoreKey[i++] = "Shift";
    CurrentInfo.StoreKey[i++] = "Space";
    CurrentInfo.StoreKey[i++] = "Ctrl";
    CurrentInfo.StoreKey[i++] = "C";
    CurrentInfo.StoreKey[i++] = "Q";
    CurrentInfo.StoreKey[i++] = "R";
    CurrentInfo.StoreKey[i++] = "F";
    CurrentInfo.StoreKey[i++] = "E";
    CurrentInfo.StoreKey[i++] = "LeftMouse";
    CurrentInfo.StoreKey[i++] = "RightMouse";
    CurrentInfo.StoreKey[i++] = "G";
    CurrentInfo.StoreKey[i++] = "V";
    CurrentInfo.StoreKey[i++] = "Z";
    CurrentInfo.StoreKey[i++] = "ALT";
    CurrentInfo.StoreKey[i++] = "X";
    CurrentInfo.StoreKey[i++] = "Enter";
    CurrentInfo.StoreKey[i++] = "F2";
    CurrentInfo.StoreKey[i++] = "F3";
    CurrentInfo.StoreKey[i++] = "F4";
    CurrentInfo.StoreKey[i++] = "F5";
    CurrentInfo.StoreKey[i++] = "B";
    CurrentInfo.StoreKey[i++] = "Tab";
    CurrentInfo.StoreKey[i++] = "LeftBracket";
    CurrentInfo.StoreKey[i++] = "RightBracket";
    CurrentInfo.StoreKey[i++] = "Semicolon";
    CurrentInfo.StoreKey[i++] = "SingleQuote";
    CurrentInfo.StoreKey[i++] = "H";
    CurrentInfo.StoreKey[i++] = "F11";
    CurrentInfo.StoreKey[i++] = "Tilde";
    CurrentInfo.StoreKey[i++] = "F12";
    //return;    
}

function SetStoreKey_CHINA()
{
    local int i;

    CurrentInfo = InitInfo;
    CurrentInfo.MouseSensibility = 40.0000000;
    CurrentInfo.MouseSensibilityAim = 40.0000000;
    i = 0;
    CurrentInfo.StoreKey[i++] = "W";
    CurrentInfo.StoreKey[i++] = "S";
    CurrentInfo.StoreKey[i++] = "A";
    CurrentInfo.StoreKey[i++] = "D";
    CurrentInfo.StoreKey[i++] = "Shift";
    CurrentInfo.StoreKey[i++] = "Space";
    CurrentInfo.StoreKey[i++] = "Ctrl";
    CurrentInfo.StoreKey[i++] = "C";
    CurrentInfo.StoreKey[i++] = "Q";
    CurrentInfo.StoreKey[i++] = "R";
    CurrentInfo.StoreKey[i++] = "F";
    CurrentInfo.StoreKey[i++] = "E";
    CurrentInfo.StoreKey[i++] = "LeftMouse";
    CurrentInfo.StoreKey[i++] = "RightMouse";
    CurrentInfo.StoreKey[i++] = "G";
    CurrentInfo.StoreKey[i++] = "V";
    CurrentInfo.StoreKey[i++] = "Z";
    CurrentInfo.StoreKey[i++] = "ALT";
    CurrentInfo.StoreKey[i++] = "X";
    CurrentInfo.StoreKey[i++] = "Enter";
    CurrentInfo.StoreKey[i++] = "F2";
    CurrentInfo.StoreKey[i++] = "F3";
    CurrentInfo.StoreKey[i++] = "F4";
    CurrentInfo.StoreKey[i++] = "F5";
    CurrentInfo.StoreKey[i++] = "B";
    CurrentInfo.StoreKey[i++] = "Tab";
    CurrentInfo.StoreKey[i++] = "LeftBracket";
    CurrentInfo.StoreKey[i++] = "RightBracket";
    CurrentInfo.StoreKey[i++] = "Semicolon";
    CurrentInfo.StoreKey[i++] = "SingleQuote";
    CurrentInfo.StoreKey[i++] = "H";
    CurrentInfo.StoreKey[i++] = "F11";
    CurrentInfo.StoreKey[i++] = "Tilde";
    CurrentInfo.StoreKey[i++] = "F12";
    //return;    
}

function SetStoreKey_THAILAND()
{
    local int i;

    CurrentInfo = InitInfo;
    CurrentInfo.MouseSensibility = 40.0000000;
    CurrentInfo.MouseSensibilityAim = 40.0000000;
    i = 0;
    CurrentInfo.StoreKey[i++] = "W";
    CurrentInfo.StoreKey[i++] = "S";
    CurrentInfo.StoreKey[i++] = "A";
    CurrentInfo.StoreKey[i++] = "D";
    CurrentInfo.StoreKey[i++] = "Shift";
    CurrentInfo.StoreKey[i++] = "Space";
    CurrentInfo.StoreKey[i++] = "Ctrl";
    CurrentInfo.StoreKey[i++] = "C";
    CurrentInfo.StoreKey[i++] = "Q";
    CurrentInfo.StoreKey[i++] = "R";
    CurrentInfo.StoreKey[i++] = "F";
    CurrentInfo.StoreKey[i++] = "E";
    CurrentInfo.StoreKey[i++] = "LeftMouse";
    CurrentInfo.StoreKey[i++] = "RightMouse";
    CurrentInfo.StoreKey[i++] = "G";
    CurrentInfo.StoreKey[i++] = "V";
    CurrentInfo.StoreKey[i++] = "Z";
    CurrentInfo.StoreKey[i++] = "ALT";
    CurrentInfo.StoreKey[i++] = "X";
    CurrentInfo.StoreKey[i++] = "Enter";
    CurrentInfo.StoreKey[i++] = "F2";
    CurrentInfo.StoreKey[i++] = "F3";
    CurrentInfo.StoreKey[i++] = "F4";
    CurrentInfo.StoreKey[i++] = "F5";
    CurrentInfo.StoreKey[i++] = "B";
    CurrentInfo.StoreKey[i++] = "Tab";
    CurrentInfo.StoreKey[i++] = "LeftBracket";
    CurrentInfo.StoreKey[i++] = "RightBracket";
    CurrentInfo.StoreKey[i++] = "Semicolon";
    CurrentInfo.StoreKey[i++] = "SingleQuote";
    CurrentInfo.StoreKey[i++] = "H";
    CurrentInfo.StoreKey[i++] = "F11";
    CurrentInfo.StoreKey[i++] = "Tilde";
    CurrentInfo.StoreKey[i++] = "F12";
    //return;    
}

function ResetData()
{
    CurrentInfo = InitInfo;
    SaveData();
    LoadData();
    //return;    
}

function SaveData()
{
    local PlayerController PC;

    PC = PlayerOwner();
    PC.InvertMouse(string(CurrentInfo.bMouseInvert));
    PC.ConsoleCommand("SETCONFIG_BOOL Controll InvertMouse" @ string(CurrentInfo.bMouseInvert));
    PC.SetSensitivity(CurrentInfo.MouseSensibility / 20.0000000);
    PC.ConsoleCommand("SETCONFIG_FLOAT Controll MouseSensitivity" @ string(CurrentInfo.MouseSensibility / 20.0000000));
    PC.SetSensitivity(CurrentInfo.MouseSensibilityAim / 20.0000000, true);
    PC.ConsoleCommand("SETCONFIG_FLOAT Controll MouseSensitivityAim" @ string(CurrentInfo.MouseSensibilityAim / 20.0000000));
    PC.UseMouseRevision(CurrentInfo.bMouseRevision);
    PC.ConsoleCommand("SETCONFIG_BOOL Controll UseMouseRevision" @ string(CurrentInfo.bMouseRevision));
    PC.UseStanceToggle(CurrentInfo.bStanceToggle);
    PC.ConsoleCommand("SETCONFIG_BOOL Controll UseStanceToggle" @ string(CurrentInfo.bStanceToggle));
    PC.UseAdvCamShake(CurrentInfo.bUseAdvCamShake);
    PC.ConsoleCommand("SETCONFIG_BOOL Controll UseAdvCamShake" @ string(CurrentInfo.bUseAdvCamShake));
    PC.ConsoleCommand("SETCONFIG_BOOL Controll UseInverseWeapon" @ string(CurrentInfo.bUseInverseWeapon));
    PC.ConsoleCommand("setdata WinDrv.WindowsClient UseInverseWeapon" @ string(CurrentInfo.bUseInverseWeapon));
    PlayerOwner().Level.GetMatchMaker().bInverseWeapon = CurrentInfo.bUseInverseWeapon;
    SaveUserKeySet();
    //return;    
}

function LoadData()
{
    local int i;

    // End:0x22
    if(CurrentInfo.MouseSensibilityAim <= float(0))
    {
        CurrentInfo.MouseSensibilityAim = 50.0000000;
    }
    BTSliderHK(Content[0]).SetCurrentValue(CurrentInfo.MouseSensibility);
    BTSliderHK(Content[1]).SetCurrentValue(CurrentInfo.MouseSensibilityAim);
    BTTPOptionRadioButtonHK(Content[2]).ButtonRadio.SetData(CurrentInfo.bMouseInvert);
    BTTPOptionRadioButtonHK(Content[3]).ButtonRadio.SetData(CurrentInfo.bMouseRevision);
    BTTPOptionRadioButtonHK(Content[4]).ButtonRadio.SetData(CurrentInfo.bUseInverseWeapon);
    PlayerOwner().Level.GetMatchMaker().bInverseWeapon = CurrentInfo.bUseInverseWeapon;
    i = 5;
    J0x117:

    // End:0x15F [Loop If]
    if(i < (35 + 5))
    {
        BTOptionKeyButtonHK(Content[i]).SetKey(CurrentInfo.StoreKey[i - 5]);
        i++;
        // [Loop Continue]
        goto J0x117;
    }
    //return;    
}

function bool SaveUserKeySet()
{
    local array<string> BindNames, LocBindNames;
    local string strAlias;
    local int i;
    local PlayerController PC;

    PC = PlayerOwner();
    i = 0;
    J0x10:

    // End:0x4C4 [Loop If]
    if(i < 37)
    {
        switch(i)
        {
            // End:0x36
            case 0:
                strAlias = "Shot";
                // End:0x419
                break;
            // End:0x4F
            case 1:
                strAlias = "StrafeLeft";
                // End:0x419
                break;
            // End:0x63
            case 2:
                strAlias = "Duck";
                // End:0x419
                break;
            // End:0x7E
            case 3:
                strAlias = "StrafeRight";
                // End:0x419
                break;
            // End:0x94
            case 4:
                strAlias = "UseKey";
                // End:0x419
                break;
            // End:0xAC
            case 5:
                strAlias = "QGrenade";
                // End:0x419
                break;
            // End:0xC9
            case 6:
                strAlias = "SelPrevWeapon";
                // End:0x419
                break;
            // End:0xE5
            case 7:
                strAlias = "WeaponReload";
                // End:0x419
                break;
            // End:0x101
            case 8:
                strAlias = "MoveBackward";
                // End:0x419
                break;
            // End:0x11C
            case 9:
                strAlias = "MeleeAttack";
                // End:0x419
                break;
            // End:0x137
            case 10:
                strAlias = "MoveForward";
                // End:0x419
                break;
            // End:0x151
            case 11:
                strAlias = "ShowBigmap";
                // End:0x419
                break;
            // End:0x171
            case 12:
                strAlias = "ShowRadioMessage";
                // End:0x419
                break;
            // End:0x186
            case 13:
                strAlias = "Prone";
                // End:0x419
                break;
            // End:0x19E
            case 14:
                strAlias = "ShowMenu";
                // End:0x419
                break;
            // End:0x1BC
            case 15:
                strAlias = "MouseSenseDown";
                // End:0x419
                break;
            // End:0x1D8
            case 16:
                strAlias = "MouseSenseUp";
                // End:0x419
                break;
            // End:0x1EF
            case 17:
                strAlias = "Walking";
                // End:0x419
                break;
            // End:0x203
            case 18:
                strAlias = "Jump";
                // End:0x419
                break;
            // End:0x21E
            case 19:
                strAlias = "ScoreToggle";
                // End:0x419
                break;
            // End:0x232
            case 20:
                strAlias = "Fire";
                // End:0x419
                break;
            // End:0x249
            case 21:
                strAlias = "AltFire";
                // End:0x419
                break;
            // End:0x26C
            case 22:
                strAlias = "CallToggleQuickSlot";
                // End:0x419
                break;
            // End:0x287
            case 23:
                strAlias = "QSubGrenade";
                // End:0x419
                break;
            // End:0x2A3
            case 24:
                strAlias = "CallChatMode";
                // End:0x419
                break;
            // End:0x2BE
            case 25:
                strAlias = "CallChatAll";
                // End:0x419
                break;
            // End:0x2DA
            case 26:
                strAlias = "CallChatTeam";
                // End:0x419
                break;
            // End:0x2F6
            case 27:
                strAlias = "CallChatClan";
                // End:0x419
                break;
            // End:0x315
            case 28:
                strAlias = "CallChatWhisper";
                // End:0x419
                break;
            // End:0x33B
            case 29:
                strAlias = "ShowRadioMessage_Alarm";
                // End:0x419
                break;
            // End:0x362
            case 30:
                strAlias = "ShowRadioMessage_Notify";
                // End:0x419
                break;
            // End:0x381
            case 31:
                strAlias = "ThrowsTheWeapon";
                // End:0x419
                break;
            // End:0x398
            case 32:
                strAlias = "ShowHud";
                // End:0x419
                break;
            // End:0x3B9
            case 33:
                strAlias = "MouseSenseDownAim";
                // End:0x419
                break;
            // End:0x3D8
            case 34:
                strAlias = "MouseSenseUpAim";
                // End:0x419
                break;
            // End:0x3F5
            case 35:
                strAlias = "MapInfoToggle";
                // End:0x419
                break;
            // End:0x416
            case 36:
                strAlias = "ShowItemBuyWindow";
                // End:0x419
                break;
            // End:0xFFFF
            default:
                break;
        }
        // End:0x4BA
        if(strAlias != "")
        {
            // End:0x486
            if(Controller.GetAssignedKeys(strAlias, BindNames, LocBindNames))
            {
                PC.ConsoleCommand(("SETCONFIG_STRING Controll" @ string(i)) @ BindNames[0]);
                // [Explicit Continue]
                goto J0x4BA;
            }
            PC.ConsoleCommand("SETCONFIG_STRING Controll" @ string(i));
        }
        J0x4BA:

        i++;
        // [Loop Continue]
        goto J0x10;
    }
    return true;
    //return;    
}

function Content0_OnChangeValue(int changeValue)
{
    local PlayerController PC;

    PC = PlayerOwner();
    CurrentInfo.MouseSensibility = float(changeValue);
    PC.SetSensitivity(CurrentInfo.MouseSensibility / 20.0000000);
    Class'Engine.PlayerInput'.default.MouseSensitivity = CurrentInfo.MouseSensibility / 20.0000000;
    //return;    
}

function Content0_OnChangeValueAim(int changeValue)
{
    local PlayerController PC;

    PC = PlayerOwner();
    CurrentInfo.MouseSensibilityAim = float(changeValue);
    PC.SetSensitivity(CurrentInfo.MouseSensibilityAim / 20.0000000, true);
    Class'Engine.PlayerInput'.default.MouseSensitivityAim = CurrentInfo.MouseSensibilityAim / 20.0000000;
    //return;    
}

function string Content0_ValueToStringAim(int Value)
{
    // End:0x12
    if(Value == 50)
    {
        return strDefaultSensAim;
    }
    return string(Value);
    //return;    
}

function Content1_OnSelect(bool bOn)
{
    local PlayerController PC;

    PC = PlayerOwner();
    CurrentInfo.bMouseInvert = bOn;
    PC.InvertMouse(string(CurrentInfo.bMouseInvert));
    Class'Engine.PlayerInput'.default.bInvertMouse = CurrentInfo.bMouseInvert;
    //return;    
}

function Content3_OnSelect(bool bOn)
{
    local PlayerController PC;

    PC = PlayerOwner();
    CurrentInfo.bMouseRevision = bOn;
    PC.UseMouseRevision(bOn);
    //return;    
}

function Content4_OnSelect(bool bOn)
{
    CurrentInfo.bUseInverseWeapon = bOn;
    //return;    
}

function BTOptionKeyButtonHK_OnChangeKey(GUIComponent Sender, string NewKey)
{
    local int i;
    local export editinline BTOptionKeyButtonHK btn;

    btn = BTOptionKeyButtonHK(Sender);
    i = 0;
    J0x17:

    // End:0x7A [Loop If]
    if(i < 35)
    {
        // End:0x70
        if(CurrentInfo.StoreKey[i] == NewKey)
        {
            BTOptionKeyButtonHK(Content[i + 5]).SetKey("");
            CurrentInfo.StoreKey[i] = "";
        }
        i++;
        // [Loop Continue]
        goto J0x17;
    }
    CurrentInfo.StoreKey[btn.ButtonID] = NewKey;
    btn.SetKey(NewKey);
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    Label.Length = 40;
    Content.Length = 40;
    InternalPadding.Length = 40;
    i = 0;
    J0x32:

    // End:0x5E [Loop If]
    if(i < 5)
    {
        InternalPadding[i].Y2 = 9.0000000;
        i++;
        // [Loop Continue]
        goto J0x32;
    }
    i = 5;
    J0x66:

    // End:0x96 [Loop If]
    if(i < InternalPadding.Length)
    {
        InternalPadding[i].Y2 = 5.0000000;
        i++;
        // [Loop Continue]
        goto J0x66;
    }
    InitializeLabel();
    InitializeContent();
    InitData();
    LoadData();
    ACLList_PositionChanged(0);
    //return;    
}

function InitializeLabel()
{
    local int i;
    local RenderObject Ro;

    i = 0;
    J0x07:

    // End:0xCE [Loop If]
    if(i < Label.Length)
    {
        Ro = new Class'GUIWarfareControls_Decompressed.RenderObject';
        Ro.Init();
        ACLList.AddRenderObject(Ro);
        Label[i] = NewLabelComponent(Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
        Label[i].SetDefaultFontColor();
        Label[i].CaptionDrawType = 3;
        Label[i].Caption = strLabel[i];
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function InitializeContent()
{
    local int i;
    local PlayerController PC;

    PC = PlayerOwner();
    Content[0] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTSliderHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7600000);
    BTSliderHK(Content[0]).SetData(36, 16);
    BTSliderHK(Content[0]).ButtonLeft.Caption = strLow;
    BTSliderHK(Content[0]).ButtonRight.Caption = strHigh;
    BTSliderHK(Content[0]).__OnChangeValue__Delegate = Content0_OnChangeValue;
    BTSliderHK(Content[0]).MinValue = 1.0000000;
    BTSliderHK(Content[0]).MinValue = 1.0000000;
    Content[1] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTSliderHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7600000);
    BTSliderHK(Content[1]).SetData(36, 16);
    BTSliderHK(Content[1]).ButtonLeft.Caption = strLow;
    BTSliderHK(Content[1]).ButtonRight.Caption = strHigh;
    BTSliderHK(Content[1]).__OnChangeValue__Delegate = Content0_OnChangeValueAim;
    BTSliderHK(Content[1]).MinValue = 1.0000000;
    BTSliderHK(Content[1]).MinValue = 1.0000000;
    BTSliderHK(Content[1]).__SliderValueToString__Delegate = Content0_ValueToStringAim;
    Content[2] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPOptionRadioButtonHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7700000);
    BTTPOptionRadioButtonHK(Content[2]).ButtonRadio.__OnSelect__Delegate = Content1_OnSelect;
    Content[3] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPOptionRadioButtonHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7700000);
    BTTPOptionRadioButtonHK(Content[3]).perc = 1.0000000;
    BTTPOptionRadioButtonHK(Content[3]).ButtonRadio.__OnSelect__Delegate = Content3_OnSelect;
    BTTPOptionRadioButtonHK(Content[3]).ButtonRadio.ButtonOn.Caption = strOn;
    BTTPOptionRadioButtonHK(Content[3]).ButtonRadio.ButtonOff.Caption = strOff;
    BTTPOptionRadioButtonHK(Content[3]).ButtonRadio.OnOffSpaceRange = 157;
    Content[4] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPOptionRadioButtonHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7700000);
    BTTPOptionRadioButtonHK(Content[4]).perc = 1.0000000;
    BTTPOptionRadioButtonHK(Content[4]).ButtonRadio.__OnSelect__Delegate = Content4_OnSelect;
    BTTPOptionRadioButtonHK(Content[4]).ButtonRadio.ButtonOn.Caption = strUseLeftHand;
    BTTPOptionRadioButtonHK(Content[4]).ButtonRadio.ButtonOff.Caption = strUseRightHand;
    BTTPOptionRadioButtonHK(Content[4]).ButtonRadio.OnOffSpaceRange = 157;
    i = 5;
    J0x40F:

    // End:0x4FE [Loop If]
    if(i < Content.Length)
    {
        Content[i] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTOptionKeyButtonHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7700000);
        BTOptionKeyButtonHK(Content[i]).ButtonID = i - 5;
        // End:0x49B
        if(strFunc[i] == "")
        {
            Content[i].DisableMe();
            // [Explicit Continue]
            goto J0x4F4;
        }
        BTOptionKeyButtonHK(Content[i]).__OnChangeKey__Delegate = BTOptionKeyButtonHK_OnChangeKey;
        BTOptionKeyButtonHK(Content[i]).SetBindFuncName(strFunc[i]);
        Content[i].EnableMe();
        J0x4F4:

        i++;
        // [Loop Continue]
        goto J0x40F;
    }
    Content[38].DisableMe();
    Content[39].DisableMe();
    //return;    
}

defaultproperties
{
    strLow="???"
    strHigh="???"
    strLabel[0]="?????????"
    strLabel[1]="?????????(SR)"
    strLabel[2]="???????????????"
    strLabel[3]="?????????"
    strLabel[5]="??????????????"
    strLabel[6]="??????????????"
    strLabel[7]="?????????????"
    strLabel[8]="????????????"
    strLabel[9]="????????"
    strLabel[10]="??????"
    strLabel[11]="????"
    strLabel[12]="????"
    strLabel[13]="?????????"
    strLabel[14]="????"
    strLabel[15]="??????????"
    strLabel[16]="???????????????"
    strLabel[17]="???"
    strLabel[18]="????"
    strLabel[19]="??????????????"
    strLabel[20]="???????????????"
    strLabel[21]="??????????"
    strLabel[22]="????????"
    strLabel[23]="???????"
    strLabel[24]="???????"
    strLabel[25]="??????????????"
    strLabel[26]="??????????"
    strLabel[27]="???????????"
    strLabel[28]="????????"
    strLabel[29]="????????????"
    strLabel[30]="????????"
    strLabel[31]="????????? -"
    strLabel[32]="????????? +"
    strLabel[33]="?????????(SR) -"
    strLabel[34]="?????????(SR) +"
    strLabel[35]="??????????"
    strLabel[36]="???? Interface"
    strLabel[38]="ScreenShot"
    strFunc[5]="MoveForward"
    strFunc[6]="MoveBackward"
    strFunc[7]="StrafeLeft"
    strFunc[8]="StrafeRight"
    strFunc[9]="Walking"
    strFunc[10]="Jump"
    strFunc[11]="Duck"
    strFunc[12]="Prone"
    strFunc[13]="SelPrevWeapon"
    strFunc[14]="WeaponReload"
    strFunc[15]="UseKey"
    strFunc[16]="MeleeAttack"
    strFunc[17]="Fire"
    strFunc[18]="AltFire"
    strFunc[19]="QGrenade"
    strFunc[20]="QSubGrenade"
    strFunc[21]="ShowRadioMessage"
    strFunc[22]="ShowRadioMessage_Alarm"
    strFunc[23]="ShowRadioMessage_Notify"
    strFunc[24]="CallChatMode"
    strFunc[25]="CallChatAll"
    strFunc[26]="CallChatTeam"
    strFunc[27]="CallChatClan"
    strFunc[28]="CallChatWhisper"
    strFunc[29]="CallToggleQuickSlot"
    strFunc[30]="ScoreToggle"
    strFunc[31]="MouseSenseDown"
    strFunc[32]="MouseSenseUp"
    strFunc[33]="MouseSenseDownAim"
    strFunc[34]="MouseSenseUpAim"
    strFunc[35]="ThrowsTheWeapon"
    strFunc[36]="ShowHud"
    strFunc[37]="MapInfoToggle"
    strFunc[38]="Shot"
    strFunc[39]="ShowItemBuyWindow"
    strOn="????????????"
    strOff="??????????"
    strToggle="???????????"
    strButton="????????"
    strWeak="???"
    strStrong="????"
    strDefaultSensAim="???????????"
}