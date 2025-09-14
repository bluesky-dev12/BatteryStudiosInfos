class BTTPOptionInputHK extends BTTPOptionBaseHK
    editinlinenew
    instanced;

struct OptionInputInfo
{
    var float MouseSensibility;
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
var localized string strLabel[43];
var string strFunc[43];
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

    i = 7;
    J0x08:

    // End:0x4C [Loop If]
    if(i < 43)
    {
        InitInfo.StoreKey[i - 7] = BTOptionKeyButtonHK(Content[i]).BindName;
        i++;
        // [Loop Continue]
        goto J0x08;
    }
    InitInfo.bMouseInvert = Class'Engine.PlayerInput'.default.bInvertMouse;
    InitInfo.MouseSensibility = Class'Engine.PlayerInput'.default.MouseSensitivity * float(20);
    InitInfo.bMouseAccel = false;
    InitInfo.bMouseRevision = PlayerOwner().Level.GetIsUseMouseRevision();
    InitInfo.bStanceToggle = PlayerOwner().Level.GetIsUseStanceToggle();
    InitInfo.bUseAdvCamShake = PlayerOwner().Level.GetIsUseAdvCamShake();
    CurrentInfo = InitInfo;
    //return;    
}

function DefaultResetData()
{
    local int i;

    CurrentInfo = InitInfo;
    CurrentInfo.MouseSensibility = 40.0000000;
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
    CurrentInfo.StoreKey[i++] = "M";
    CurrentInfo.StoreKey[i++] = "B";
    CurrentInfo.StoreKey[i++] = "Tab";
    CurrentInfo.StoreKey[i++] = "LeftBracket";
    CurrentInfo.StoreKey[i++] = "RightBracket";
    CurrentInfo.StoreKey[i++] = "";
    CurrentInfo.StoreKey[i++] = "";
    CurrentInfo.StoreKey[i++] = "G";
    CurrentInfo.StoreKey[i++] = "F11";
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

    BTSliderHK(Content[0]).SetCurrentValue(CurrentInfo.MouseSensibility);
    BTTPOptionRadioButtonHK(Content[1]).ButtonRadio.SetData(CurrentInfo.bMouseInvert);
    BTTPOptionRadioButtonHK(Content[3]).ButtonRadio.SetData(CurrentInfo.bMouseRevision);
    BTTPOptionRadioButtonHK(Content[4]).ButtonRadio.SetData(CurrentInfo.bStanceToggle);
    BTTPOptionRadioButtonHK(Content[5]).ButtonRadio.SetData(CurrentInfo.bUseAdvCamShake);
    i = 7;
    J0xD3:

    // End:0x117 [Loop If]
    if(i < 43)
    {
        BTOptionKeyButtonHK(Content[i]).SetKey(CurrentInfo.StoreKey[i - 7]);
        i++;
        // [Loop Continue]
        goto J0xD3;
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

    // End:0x43A [Loop If]
    if(i < 33)
    {
        switch(i)
        {
            // End:0x36
            case 0:
                strAlias = "Shot";
                // End:0x39B
                break;
            // End:0x4F
            case 1:
                strAlias = "StrafeLeft";
                // End:0x39B
                break;
            // End:0x63
            case 2:
                strAlias = "Duck";
                // End:0x39B
                break;
            // End:0x7E
            case 3:
                strAlias = "StrafeRight";
                // End:0x39B
                break;
            // End:0x94
            case 4:
                strAlias = "UseKey";
                // End:0x39B
                break;
            // End:0xAC
            case 5:
                strAlias = "QGrenade";
                // End:0x39B
                break;
            // End:0xC9
            case 6:
                strAlias = "SelPrevWeapon";
                // End:0x39B
                break;
            // End:0xE5
            case 7:
                strAlias = "WeaponReload";
                // End:0x39B
                break;
            // End:0x101
            case 8:
                strAlias = "MoveBackward";
                // End:0x39B
                break;
            // End:0x11C
            case 9:
                strAlias = "MeleeAttack";
                // End:0x39B
                break;
            // End:0x137
            case 10:
                strAlias = "MoveForward";
                // End:0x39B
                break;
            // End:0x151
            case 11:
                strAlias = "ShowBigmap";
                // End:0x39B
                break;
            // End:0x171
            case 12:
                strAlias = "ShowRadioMessage";
                // End:0x39B
                break;
            // End:0x186
            case 13:
                strAlias = "Prone";
                // End:0x39B
                break;
            // End:0x19E
            case 14:
                strAlias = "ShowMenu";
                // End:0x39B
                break;
            // End:0x1BC
            case 15:
                strAlias = "MouseSenseDown";
                // End:0x39B
                break;
            // End:0x1D8
            case 16:
                strAlias = "MouseSenseUp";
                // End:0x39B
                break;
            // End:0x1EF
            case 17:
                strAlias = "Walking";
                // End:0x39B
                break;
            // End:0x203
            case 18:
                strAlias = "Jump";
                // End:0x39B
                break;
            // End:0x21E
            case 19:
                strAlias = "ScoreToggle";
                // End:0x39B
                break;
            // End:0x232
            case 20:
                strAlias = "Fire";
                // End:0x39B
                break;
            // End:0x249
            case 21:
                strAlias = "AltFire";
                // End:0x39B
                break;
            // End:0x26C
            case 22:
                strAlias = "CallToggleQuickSlot";
                // End:0x39B
                break;
            // End:0x287
            case 23:
                strAlias = "QSubGrenade";
                // End:0x39B
                break;
            // End:0x2A3
            case 24:
                strAlias = "CallChatMode";
                // End:0x39B
                break;
            // End:0x2BE
            case 25:
                strAlias = "CallChatAll";
                // End:0x39B
                break;
            // End:0x2DA
            case 26:
                strAlias = "CallChatTeam";
                // End:0x39B
                break;
            // End:0x2F6
            case 27:
                strAlias = "CallChatClan";
                // End:0x39B
                break;
            // End:0x315
            case 28:
                strAlias = "CallChatWhisper";
                // End:0x39B
                break;
            // End:0x33B
            case 29:
                strAlias = "ShowRadioMessage_Alarm";
                // End:0x39B
                break;
            // End:0x362
            case 30:
                strAlias = "ShowRadioMessage_Notify";
                // End:0x39B
                break;
            // End:0x381
            case 31:
                strAlias = "ThrowsTheWeapon";
                // End:0x39B
                break;
            // End:0x398
            case 32:
                strAlias = "ShowHud";
                // End:0x39B
                break;
            // End:0xFFFF
            default:
                break;
        }
        // End:0x3FC
        if(Controller.GetAssignedKeys(strAlias, BindNames, LocBindNames))
        {
            PC.ConsoleCommand(("SETCONFIG_STRING Controll" @ string(i)) @ BindNames[0]);
            // [Explicit Continue]
            goto J0x430;
        }
        PC.ConsoleCommand("SETCONFIG_STRING Controll" @ string(i));
        J0x430:

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

function Content1_OnSelect(bool bOn)
{
    local PlayerController PC;

    PC = PlayerOwner();
    CurrentInfo.bMouseInvert = bOn;
    PC.InvertMouse(string(CurrentInfo.bMouseInvert));
    Class'Engine.PlayerInput'.default.bInvertMouse = CurrentInfo.bMouseInvert;
    //return;    
}

function Content2_OnSelect(bool bOn)
{
    CurrentInfo.bMouseAccel = bOn;
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
    local PlayerController PC;

    PC = PlayerOwner();
    CurrentInfo.bStanceToggle = bOn;
    PC.UseStanceToggle(bOn);
    //return;    
}

function Content5_OnSelect(bool bOn)
{
    local PlayerController PC;

    PC = PlayerOwner();
    CurrentInfo.bUseAdvCamShake = bOn;
    PC.UseAdvCamShake(bOn);
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
            BTOptionKeyButtonHK(Content[i + 7]).SetKey("");
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
    Label.Length = 43;
    Content.Length = 43;
    InternalPadding.Length = 43;
    i = 0;
    J0x32:

    // End:0x5E [Loop If]
    if(i < 43)
    {
        InternalPadding[i].Y2 = 9.0000000;
        i++;
        // [Loop Continue]
        goto J0x32;
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
    Content[1] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPOptionRadioButtonHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7700000);
    BTTPOptionRadioButtonHK(Content[1]).ButtonRadio.__OnSelect__Delegate = Content1_OnSelect;
    Content[2] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPOptionRadioButtonHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7700000);
    BTTPOptionRadioButtonHK(Content[2]).ButtonRadio.ButtonOn.DisableMe();
    BTTPOptionRadioButtonHK(Content[2]).ButtonRadio.ButtonOff.DisableMe();
    Content[3] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPOptionRadioButtonHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7700000);
    BTTPOptionRadioButtonHK(Content[3]).perc = 1.0000000;
    BTTPOptionRadioButtonHK(Content[3]).ButtonRadio.__OnSelect__Delegate = Content3_OnSelect;
    BTTPOptionRadioButtonHK(Content[3]).ButtonRadio.ButtonOn.Caption = strOn;
    BTTPOptionRadioButtonHK(Content[3]).ButtonRadio.ButtonOff.Caption = strOff;
    Content[4] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPOptionRadioButtonHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7700000);
    BTTPOptionRadioButtonHK(Content[4]).perc = 1.0000000;
    BTTPOptionRadioButtonHK(Content[4]).ButtonRadio.__OnSelect__Delegate = Content4_OnSelect;
    BTTPOptionRadioButtonHK(Content[4]).ButtonRadio.ButtonOn.Caption = strToggle;
    BTTPOptionRadioButtonHK(Content[4]).ButtonRadio.ButtonOff.Caption = strButton;
    Content[5] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPOptionRadioButtonHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7700000);
    BTTPOptionRadioButtonHK(Content[5]).ButtonRadio.__OnSelect__Delegate = Content5_OnSelect;
    BTTPOptionRadioButtonHK(Content[5]).ButtonRadio.ButtonOn.Caption = strStrong;
    BTTPOptionRadioButtonHK(Content[5]).ButtonRadio.ButtonOff.Caption = strWeak;
    i = 7;
    J0x3FB:

    // End:0x4D1 [Loop If]
    if(i < 43)
    {
        Content[i] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTOptionKeyButtonHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7700000);
        BTOptionKeyButtonHK(Content[i]).ButtonID = i - 7;
        // End:0x483
        if(strFunc[i] == "")
        {
            Content[i].DisableMe();
            // [Explicit Continue]
            goto J0x4C7;
        }
        BTOptionKeyButtonHK(Content[i]).__OnChangeKey__Delegate = BTOptionKeyButtonHK_OnChangeKey;
        BTOptionKeyButtonHK(Content[i]).SetBindFuncName(strFunc[i]);
        J0x4C7:

        i++;
        // [Loop Continue]
        goto J0x3FB;
    }
    //return;    
}

defaultproperties
{
    strLow="??"
    strHigh="??"
    strLabel[0]="??? ??"
    strLabel[1]="??? ?? ??"
    strLabel[2]="??? ??"
    strLabel[3]="??? ??? ??"
    strLabel[4]="??/???? ??"
    strLabel[5]="??? ??? ??"
    strLabel[7]="??? ??"
    strLabel[8]="?? ??"
    strLabel[9]="?? ??"
    strLabel[10]="?? ??"
    strLabel[11]="?? ??"
    strLabel[12]="??"
    strLabel[13]="??"
    strLabel[14]="????"
    strLabel[15]="?? ??"
    strLabel[16]="???"
    strLabel[17]="?? ??"
    strLabel[18]="?? ??"
    strLabel[19]="??"
    strLabel[20]="??"
    strLabel[21]="??? ??"
    strLabel[22]="??? ??"
    strLabel[23]="????(??)"
    strLabel[24]="????(??)"
    strLabel[25]="????(??)"
    strLabel[26]="??"
    strLabel[27]="?? ??"
    strLabel[28]="? ??"
    strLabel[29]="?? ??"
    strLabel[30]="???"
    strLabel[31]="?? ??"
    strLabel[32]="?? ???"
    strLabel[33]="????"
    strLabel[34]="??? On/Off"
    strLabel[35]="???? ??"
    strLabel[36]="??? ??"
    strLabel[37]="??? ?? ??"
    strLabel[38]="??? ?? ??"
    strLabel[39]="?? ?? -"
    strLabel[40]="?? ?? +"
    strLabel[41]="?? ???"
    strLabel[42]="????? ???"
    strFunc[7]="MoveForward"
    strFunc[8]="MoveBackward"
    strFunc[9]="StrafeLeft"
    strFunc[10]="StrafeRight"
    strFunc[11]="Walking"
    strFunc[12]="Jump"
    strFunc[13]="Duck"
    strFunc[14]="Prone"
    strFunc[15]="SelPrevWeapon"
    strFunc[16]="WeaponReload"
    strFunc[17]="UseKey"
    strFunc[18]="MeleeAttack"
    strFunc[19]="Fire"
    strFunc[20]="AltFire"
    strFunc[21]="QGrenade"
    strFunc[22]="QSubGrenade"
    strFunc[23]="ShowRadioMessage"
    strFunc[24]="ShowRadioMessage_Alarm"
    strFunc[25]="ShowRadioMessage_Notify"
    strFunc[26]="CallChatMode"
    strFunc[27]="CallChatAll"
    strFunc[28]="CallChatTeam"
    strFunc[29]="CallChatClan"
    strFunc[30]="CallChatWhisper"
    strFunc[33]="Shot"
    strFunc[34]="ShowBigmap"
    strFunc[35]="CallToggleQuickSlot"
    strFunc[36]="ScoreToggle"
    strFunc[37]="MouseSenseDown"
    strFunc[38]="MouseSenseUp"
    strFunc[41]="ThrowsTheWeapon"
    strFunc[42]="ShowHud"
    strOn="??? ??? ?? ???"
    strOff="?? ??"
    strToggle="? ??? ??? ???"
    strButton="? ?? ??? ?? ??"
    strWeak="?"
    strStrong="?"
}