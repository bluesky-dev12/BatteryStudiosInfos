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
    var string StoreKey[37];
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

    i = 5;
    J0x08:

    // End:0x50 [Loop If]
    if(i < Content.Length)
    {
        InitInfo.StoreKey[i - 5] = BTOptionKeyButtonHK(Content[i]).BindName;
        i++;
        // [Loop Continue]
        goto J0x08;
    }
    InitInfo.bMouseInvert = Class'Engine.PlayerInput'.default.bInvertMouse;
    InitInfo.MouseSensibility = Class'Engine.PlayerInput'.default.MouseSensitivity * float(20);
    InitInfo.MouseSensibilityAim = Class'Engine.PlayerInput'.default.MouseSensitivityAim * float(20);
    InitInfo.bMouseAccel = false;
    InitInfo.bMouseRevision = PlayerOwner().Level.GetIsUseMouseRevision();
    InitInfo.bStanceToggle = PlayerOwner().Level.GetIsUseStanceToggle();
    InitInfo.bUseAdvCamShake = PlayerOwner().Level.GetIsUseAdvCamShake();
    CurrentInfo = InitInfo;
    //return;    
}

function DefaultResetData()
{
    SetStoreKey_KR();
    Controller.SetKeyBind("Escape", "ShowMenu");
    Controller.SetKeyBind("MouseX", "Count bXAxis | Axis aMouseX Speed=2.0");
    Controller.SetKeyBind("MouseY", "Count bYAxis | Axis aMouseY Speed=2.0");
    CurrentInfo.bMouseInvert = false;
    CurrentInfo.bMouseAccel = false;
    CurrentInfo.bMouseRevision = false;
    CurrentInfo.bStanceToggle = true;
    SaveData();
    LoadData();
    //return;    
}

function SetStoreKey_KR()
{
    local int i;

    CurrentInfo = InitInfo;
    CurrentInfo.MouseSensibility = 40.0000000;
    CurrentInfo.MouseSensibilityAim = 50.0000000;
    i = 0;
    CurrentInfo.StoreKey[i++] = "W";
    CurrentInfo.StoreKey[i++] = "S";
    CurrentInfo.StoreKey[i++] = "A";
    CurrentInfo.StoreKey[i++] = "D";
    CurrentInfo.StoreKey[i++] = "Shift";
    CurrentInfo.StoreKey[i++] = "Space";
    CurrentInfo.StoreKey[i++] = "C";
    CurrentInfo.StoreKey[i++] = "Ctrl";
    CurrentInfo.StoreKey[i++] = "Q";
    CurrentInfo.StoreKey[i++] = "R";
    CurrentInfo.StoreKey[i++] = "F";
    CurrentInfo.StoreKey[i++] = "E";
    CurrentInfo.StoreKey[i++] = "LeftMouse";
    CurrentInfo.StoreKey[i++] = "RightMouse";
    CurrentInfo.StoreKey[i++] = "MiddleMouse";
    CurrentInfo.StoreKey[i++] = "V";
    CurrentInfo.StoreKey[i++] = "Z";
    CurrentInfo.StoreKey[i++] = "ALT";
    CurrentInfo.StoreKey[i++] = "X";
    CurrentInfo.StoreKey[i++] = "Enter";
    CurrentInfo.StoreKey[i++] = "F2";
    CurrentInfo.StoreKey[i++] = "F3";
    CurrentInfo.StoreKey[i++] = "F4";
    CurrentInfo.StoreKey[i++] = "F5";
    CurrentInfo.StoreKey[i++] = "";
    CurrentInfo.StoreKey[i++] = "";
    CurrentInfo.StoreKey[i++] = "F12";
    CurrentInfo.StoreKey[i++] = "B";
    CurrentInfo.StoreKey[i++] = "Tab";
    CurrentInfo.StoreKey[i++] = "LeftBracket";
    CurrentInfo.StoreKey[i++] = "RightBracket";
    CurrentInfo.StoreKey[i++] = "Semicolon";
    CurrentInfo.StoreKey[i++] = "SingleQuote";
    CurrentInfo.StoreKey[i++] = "G";
    CurrentInfo.StoreKey[i++] = "F11";
    //return;    
}

function SetStoreKey_CHINA()
{
    local int i;

    CurrentInfo = InitInfo;
    CurrentInfo.MouseSensibility = 40.0000000;
    CurrentInfo.MouseSensibilityAim = 50.0000000;
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
    CurrentInfo.StoreKey[i++] = "";
    CurrentInfo.StoreKey[i++] = "F5";
    CurrentInfo.StoreKey[i++] = "";
    CurrentInfo.StoreKey[i++] = "";
    CurrentInfo.StoreKey[i++] = "F12";
    CurrentInfo.StoreKey[i++] = "B";
    CurrentInfo.StoreKey[i++] = "Tab";
    CurrentInfo.StoreKey[i++] = "LeftBracket";
    CurrentInfo.StoreKey[i++] = "RightBracket";
    CurrentInfo.StoreKey[i++] = "Semicolon";
    CurrentInfo.StoreKey[i++] = "SingleQuote";
    CurrentInfo.StoreKey[i++] = "H";
    CurrentInfo.StoreKey[i++] = "F11";
    //return;    
}

function SetStoreKey_THAILAND()
{
    local int i;

    CurrentInfo = InitInfo;
    CurrentInfo.MouseSensibility = 40.0000000;
    CurrentInfo.MouseSensibilityAim = 50.0000000;
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
    CurrentInfo.StoreKey[i++] = "";
    CurrentInfo.StoreKey[i++] = "F5";
    CurrentInfo.StoreKey[i++] = "";
    CurrentInfo.StoreKey[i++] = "";
    CurrentInfo.StoreKey[i++] = "F12";
    CurrentInfo.StoreKey[i++] = "B";
    CurrentInfo.StoreKey[i++] = "Tab";
    CurrentInfo.StoreKey[i++] = "LeftBracket";
    CurrentInfo.StoreKey[i++] = "RightBracket";
    CurrentInfo.StoreKey[i++] = "Semicolon";
    CurrentInfo.StoreKey[i++] = "SingleQuote";
    CurrentInfo.StoreKey[i++] = "H";
    CurrentInfo.StoreKey[i++] = "F11";
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
    i = 5;
    J0xC0:

    // End:0x104 [Loop If]
    if(i < 41)
    {
        BTOptionKeyButtonHK(Content[i]).SetKey(CurrentInfo.StoreKey[i - 5]);
        i++;
        // [Loop Continue]
        goto J0xC0;
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

    // End:0x486 [Loop If]
    if(i < 35)
    {
        switch(i)
        {
            // End:0x36
            case 0:
                strAlias = "Shot";
                // End:0x3DB
                break;
            // End:0x4F
            case 1:
                strAlias = "StrafeLeft";
                // End:0x3DB
                break;
            // End:0x63
            case 2:
                strAlias = "Duck";
                // End:0x3DB
                break;
            // End:0x7E
            case 3:
                strAlias = "StrafeRight";
                // End:0x3DB
                break;
            // End:0x94
            case 4:
                strAlias = "UseKey";
                // End:0x3DB
                break;
            // End:0xAC
            case 5:
                strAlias = "QGrenade";
                // End:0x3DB
                break;
            // End:0xC9
            case 6:
                strAlias = "SelPrevWeapon";
                // End:0x3DB
                break;
            // End:0xE5
            case 7:
                strAlias = "WeaponReload";
                // End:0x3DB
                break;
            // End:0x101
            case 8:
                strAlias = "MoveBackward";
                // End:0x3DB
                break;
            // End:0x11C
            case 9:
                strAlias = "MeleeAttack";
                // End:0x3DB
                break;
            // End:0x137
            case 10:
                strAlias = "MoveForward";
                // End:0x3DB
                break;
            // End:0x151
            case 11:
                strAlias = "ShowBigmap";
                // End:0x3DB
                break;
            // End:0x171
            case 12:
                strAlias = "ShowRadioMessage";
                // End:0x3DB
                break;
            // End:0x186
            case 13:
                strAlias = "Prone";
                // End:0x3DB
                break;
            // End:0x19E
            case 14:
                strAlias = "ShowMenu";
                // End:0x3DB
                break;
            // End:0x1BC
            case 15:
                strAlias = "MouseSenseDown";
                // End:0x3DB
                break;
            // End:0x1D8
            case 16:
                strAlias = "MouseSenseUp";
                // End:0x3DB
                break;
            // End:0x1EF
            case 17:
                strAlias = "Walking";
                // End:0x3DB
                break;
            // End:0x203
            case 18:
                strAlias = "Jump";
                // End:0x3DB
                break;
            // End:0x21E
            case 19:
                strAlias = "ScoreToggle";
                // End:0x3DB
                break;
            // End:0x232
            case 20:
                strAlias = "Fire";
                // End:0x3DB
                break;
            // End:0x249
            case 21:
                strAlias = "AltFire";
                // End:0x3DB
                break;
            // End:0x26C
            case 22:
                strAlias = "CallToggleQuickSlot";
                // End:0x3DB
                break;
            // End:0x287
            case 23:
                strAlias = "QSubGrenade";
                // End:0x3DB
                break;
            // End:0x2A3
            case 24:
                strAlias = "CallChatMode";
                // End:0x3DB
                break;
            // End:0x2BE
            case 25:
                strAlias = "CallChatAll";
                // End:0x3DB
                break;
            // End:0x2DA
            case 26:
                strAlias = "CallChatTeam";
                // End:0x3DB
                break;
            // End:0x2F6
            case 27:
                strAlias = "CallChatClan";
                // End:0x3DB
                break;
            // End:0x315
            case 28:
                strAlias = "CallChatWhisper";
                // End:0x3DB
                break;
            // End:0x33B
            case 29:
                strAlias = "ShowRadioMessage_Alarm";
                // End:0x3DB
                break;
            // End:0x362
            case 30:
                strAlias = "ShowRadioMessage_Notify";
                // End:0x3DB
                break;
            // End:0x381
            case 31:
                strAlias = "ThrowsTheWeapon";
                // End:0x3DB
                break;
            // End:0x398
            case 32:
                strAlias = "ShowHud";
                // End:0x3DB
                break;
            // End:0x3B9
            case 33:
                strAlias = "MouseSenseDownAim";
                // End:0x3DB
                break;
            // End:0x3D8
            case 34:
                strAlias = "MouseSenseUpAim";
                // End:0x3DB
                break;
            // End:0xFFFF
            default:
                break;
        }
        // End:0x47C
        if(strAlias != "")
        {
            // End:0x448
            if(Controller.GetAssignedKeys(strAlias, BindNames, LocBindNames))
            {
                PC.ConsoleCommand(("SETCONFIG_STRING Controll" @ string(i)) @ BindNames[0]);
                // [Explicit Continue]
                goto J0x47C;
            }
            PC.ConsoleCommand("SETCONFIG_STRING Controll" @ string(i));
        }
        J0x47C:

        i++;
        // [Loop Continue]
        goto J0x10;
    }
    return true;
    //return;    
}

function Content0_OnChangeValue(int ChangeValue)
{
    local PlayerController PC;

    PC = PlayerOwner();
    CurrentInfo.MouseSensibility = float(ChangeValue);
    PC.SetSensitivity(CurrentInfo.MouseSensibility / 20.0000000);
    Class'Engine.PlayerInput'.default.MouseSensitivity = CurrentInfo.MouseSensibility / 20.0000000;
    //return;    
}

function Content0_OnChangeValueAim(int ChangeValue)
{
    local PlayerController PC;

    PC = PlayerOwner();
    CurrentInfo.MouseSensibilityAim = float(ChangeValue);
    PC.SetSensitivity(CurrentInfo.MouseSensibilityAim / 20.0000000, true);
    Class'Engine.PlayerInput'.default.MouseSensitivityAim = CurrentInfo.MouseSensibilityAim / 20.0000000;
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

function BTOptionKeyButtonHK_OnChangeKey(GUIComponent Sender, string NewKey)
{
    local int i;
    local export editinline BTOptionKeyButtonHK btn;

    btn = BTOptionKeyButtonHK(Sender);
    i = 0;
    J0x17:

    // End:0x7A [Loop If]
    if(i < 37)
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
    local RenderObject ro;

    i = 0;
    J0x07:

    // End:0xCE [Loop If]
    if(i < Label.Length)
    {
        ro = new Class'GUIWarfareControls_Decompressed.RenderObject';
        ro.Init();
        ACLList.AddRenderObject(ro);
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
    local FloatBox fb;
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
    Content[2] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPOptionRadioButtonHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7700000);
    BTTPOptionRadioButtonHK(Content[2]).ButtonRadio.__OnSelect__Delegate = Content1_OnSelect;
    Content[3] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPOptionRadioButtonHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7700000);
    BTTPOptionRadioButtonHK(Content[3]).perc = 1.0000000;
    BTTPOptionRadioButtonHK(Content[3]).ButtonRadio.__OnSelect__Delegate = Content3_OnSelect;
    BTTPOptionRadioButtonHK(Content[3]).ButtonRadio.ButtonOn.Caption = strOn;
    BTTPOptionRadioButtonHK(Content[3]).ButtonRadio.ButtonOff.Caption = strOff;
    BTTPOptionRadioButtonHK(Content[3]).ButtonRadio.OnOffSpaceRange = 157;
    i = 5;
    J0x309:

    // End:0x3F4 [Loop If]
    if(i < 41)
    {
        Content[i] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTOptionKeyButtonHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7700000);
        BTOptionKeyButtonHK(Content[i]).ButtonID = i - 5;
        // End:0x391
        if(strFunc[i] == "")
        {
            Content[i].DisableMe();
            // [Explicit Continue]
            goto J0x3EA;
        }
        BTOptionKeyButtonHK(Content[i]).__OnChangeKey__Delegate = BTOptionKeyButtonHK_OnChangeKey;
        BTOptionKeyButtonHK(Content[i]).SetBindFuncName(strFunc[i]);
        Content[i].EnableMe();
        J0x3EA:

        i++;
        // [Loop Continue]
        goto J0x309;
    }
    //return;    
}

defaultproperties
{
    strLow="Low"
    strHigh="High"
    strLabel[0]="Mouse Sensitivity"
    strLabel[1]="Zoom Sensitivity"
    strLabel[2]="Invert Mouse"
    strLabel[3]="Aiming Sensitivity"
    strLabel[5]="Move Forward"
    strLabel[6]="Move Backward"
    strLabel[7]="Move Left"
    strLabel[8]="Move Right"
    strLabel[9]="Sprint"
    strLabel[10]="Jump"
    strLabel[11]="Crouch"
    strLabel[12]="Prone"
    strLabel[13]="Previous Weapon"
    strLabel[14]="Reload"
    strLabel[15]="Action"
    strLabel[16]="Melee Attack"
    strLabel[17]="Fire"
    strLabel[18]="Aim"
    strLabel[19]="Grenade"
    strLabel[20]="Special Bomb"
    strLabel[21]="Quick Msg [Order]"
    strLabel[22]="Quick Msg [Alert]"
    strLabel[23]="Quick Msg [Reply]"
    strLabel[24]="Chat"
    strLabel[25]="Regular Chat"
    strLabel[26]="Team Chat"
    strLabel[27]="Clan Chat"
    strLabel[28]="Whisper"
    strLabel[29]="Voice Chat"
    strLabel[30]="Chat Macro"
    strLabel[31]="Take Screenshot"
    strLabel[32]="Open Quick Slots"
    strLabel[33]="View Status"
    strLabel[34]="Mouse Sensitivity -"
    strLabel[35]="Mouse Sensitivity +"
    strLabel[36]="Zoom Sensitivity -"
    strLabel[37]="Zoom Sensitivity +"
    strLabel[38]="Drop Bomb"
    strLabel[39]="Hide UI"
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
    strFunc[28]="CallChatWhisper"
    strFunc[31]="Shot"
    strFunc[32]="CallToggleQuickSlot"
    strFunc[33]="ScoreToggle"
    strFunc[34]="MouseSenseDown"
    strFunc[35]="MouseSenseUp"
    strFunc[36]="MouseSenseDownAim"
    strFunc[37]="MouseSenseUpAim"
    strFunc[38]="ThrowsTheWeapon"
    strFunc[39]="ShowHud"
    strOn="Enabled"
    strOff="Disabled"
    strToggle="Toggle stance"
    strButton="Hold to maintain stance"
    strWeak="Weak"
    strStrong="Strong"
}