/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4ChatPassword.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:4
 *
 *******************************************************************************/
class UT2K4ChatPassword extends UT2K4GetDataMenu
    editinlinenew
    instanced;

var string ChatRoomTitle;
var localized string IncorrectPassword;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    PlayerOwner().ClearProgressMessages();
    ed_Data.MyEditBox.bConvertSpaces = true;
    ed_Data.MaskText(true);
}

function HandleParameters(string Title, string FailCode)
{
    ChatRoomTitle = Title;
    // End:0x45
    if(FailCode ~= "WRONGPW")
    {
        l_Text.Caption = Repl(IncorrectPassword, "%ChatRoom%", ChatRoomTitle);
    }
}

function bool InternalOnClick(GUIComponent Sender)
{
    // End:0x18
    if(Sender == b_OK)
    {
        RetryPassword();
    }
    // End:0x37
    else
    {
        // End:0x37
        if(Sender == b_Cancel)
        {
            Controller.CloseMenu(true);
        }
    }
    return true;
}

function RetryPassword()
{
    local string Password;
    local PlayerController PC;

    Password = GetDataString();
    PC = PlayerOwner();
    // End:0x30
    if(Password == "" || PC == none)
    {
        return;
    }
    Controller.CloseAll(false, true);
    PC.Join(ChatRoomTitle, Password);
}

defaultproperties
{
    IncorrectPassword="'%ChatRoom%'? ??? ??? ????? ????."
    begin object name=GetPassFail class=GUIButton
        Caption="??"
        WinTop=0.5616670
        WinLeft=0.5865230
        WinWidth=0.14750
        WinHeight=0.0450
        TabOrder=2
        bBoundToParent=true
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4ChatPassword.GetPassFail'
    b_Cancel=GetPassFail
    begin object name=GetPassPW class=moEditBox
        CaptionWidth=0.40
        Caption="??? ????"
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.497450
        WinLeft=0.21250
        WinWidth=0.6437510
        WinHeight=0.0473050
        TabOrder=0
    object end
    // Reference: moEditBox'UT2K4ChatPassword.GetPassPW'
    ed_Data=GetPassPW
    begin object name=GetPassRetry class=GUIButton
        Caption="???"
        WinTop=0.5616670
        WinLeft=0.3462890
        WinWidth=0.1316410
        TabOrder=1
        bBoundToParent=true
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4ChatPassword.GetPassRetry'
    b_OK=GetPassRetry
    begin object name=GetPassLabel class=GUILabel
        Caption="? ???? ???? ???? ????? ?????"
        TextAlign=1
        bMultiLine=true
        FontScale=2
        StyleName="TextLabel"
        WinTop=0.3188970
        WinLeft=0.0107420
        WinWidth=0.9951170
        WinHeight=0.0546880
        bBoundToParent=true
    object end
    // Reference: GUILabel'UT2K4ChatPassword.GetPassLabel'
    l_Text=GetPassLabel
    bAllowedAsLast=true
}