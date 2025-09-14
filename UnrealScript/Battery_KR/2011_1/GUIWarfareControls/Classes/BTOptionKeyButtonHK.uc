class BTOptionKeyButtonHK extends BTOwnerDrawCaptionButtonHK
    editinlinenew
    instanced;

var string SaveKey;
var string SaveCaption;
var string BindName;
var string strBindFuncName;
var localized string strNewKey;
//var delegate<OnChangeKey> __OnChangeKey__Delegate;

function SetBindFuncName(string str)
{
    local array<string> BindNames, LocBindNames;

    strBindFuncName = str;
    Controller.GetAssignedKeys(strBindFuncName, BindNames, LocBindNames);
    BindName = BindNames[0];
    Caption = LocBindNames[0];
    self.SetDefaultFontColor();
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    __OnClick__Delegate = Internal_OnClick;
    self.SetDefaultButtonImage();
    self.SetDefaultFontColor();
    //return;    
}

function bool Internal_OnClick(GUIComponent Sender)
{
    Controller.__OnNeedRawKeyPress__Delegate = RawKey;
    Controller.Master.bRequireRawJoystick = true;
    PlayerOwner().ClientPlaySound(Controller.EditSound);
    PlayerOwner().ConsoleCommand("toggleime 0");
    self.SetFontColorAll(Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.LabelWarning());
    SaveKey = BindName;
    SaveCaption = Caption;
    Caption = strNewKey;
    return true;
    //return;    
}

function bool IsAllowedKey(byte NewKey)
{
    // End:0x20
    if((48 <= int(NewKey)) && int(NewKey) <= 57)
    {
        return false;
    }
    // End:0x40
    if((int(NewKey) == 84) || int(NewKey) == 112)
    {
        return false;
    }
    return true;
    //return;    
}

delegate OnChangeKey(GUIComponent Sender, string NewKey)
{
    //return;    
}

function SetKey(string KeyName)
{
    local int i;
    local array<string> BindNames, LocBindNames;

    Controller.GetAssignedKeys(strBindFuncName, BindNames, LocBindNames);
    i = 0;
    J0x25:

    // End:0x5B [Loop If]
    if(i < BindNames.Length)
    {
        Controller.SetKeyBind(BindNames[i], "");
        i++;
        // [Loop Continue]
        goto J0x25;
    }
    Controller.SetKeyBind(KeyName, strBindFuncName);
    Controller.GetAssignedKeys(strBindFuncName, BindNames, LocBindNames);
    BindName = KeyName;
    Caption = LocBindNames[0];
    //return;    
}

function bool RawKey(byte NewKey)
{
    local string KeyName, LocKeyName;

    // End:0x7A
    if(int(NewKey) == 27)
    {
        Controller.__OnNeedRawKeyPress__Delegate = None;
        Controller.Master.bRequireRawJoystick = false;
        BindName = SaveKey;
        Caption = SaveCaption;
        self.SetDefaultFontColor();
        PlayerOwner().ClientPlaySound(Controller.ClickSound);
        return true;
    }
    // End:0xB0
    if(!Controller.IsKeyboardKey(NewKey) && !Controller.IsMouseKey(NewKey))
    {
        return false;
    }
    // End:0xC2
    if(!IsAllowedKey(NewKey))
    {
        return false;
    }
    Controller.__OnNeedRawKeyPress__Delegate = None;
    Controller.Master.bRequireRawJoystick = false;
    Controller.KeyNameFromIndex(NewKey, KeyName, LocKeyName);
    SetKey(KeyName);
    OnChangeKey(self, KeyName);
    self.SetDefaultFontColor();
    PlayerOwner().ClientPlaySound(Controller.ClickSound);
    return true;
    //return;    
}

defaultproperties
{
    strNewKey="??? ?? ??? ???. ??? ESC? ???."
}