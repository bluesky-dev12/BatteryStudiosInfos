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
    //return;    
}

function HandleParameters(string Title, string FailCode)
{
    ChatRoomTitle = Title;
    // End:0x45
    if(FailCode ~= "WRONGPW")
    {
        l_Text.Caption = Repl(IncorrectPassword, "%ChatRoom%", ChatRoomTitle);
    }
    //return;    
}

function bool InternalOnClick(GUIComponent Sender)
{
    // End:0x18
    if(Sender == b_OK)
    {
        RetryPassword();        
    }
    else
    {
        // End:0x37
        if(Sender == b_Cancel)
        {
            Controller.CloseMenu(true);
        }
    }
    return true;
    //return;    
}

function RetryPassword()
{
    local string Password;
    local PlayerController PC;

    Password = GetDataString();
    PC = PlayerOwner();
    // End:0x30
    if((Password == "") || PC == none)
    {
        return;
    }
    Controller.CloseAll(false, true);
    PC.Join(ChatRoomTitle, Password);
    //return;    
}

defaultproperties
{
    IncorrectPassword="'%ChatRoom%'? ??? ??? ????? ????."
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4ChatPassword.GetPassFail'
    begin object name="GetPassFail" class=XInterface.GUIButton
        Caption="??"
        WinTop=0.5616670
        WinLeft=0.5865230
        WinWidth=0.1475000
        WinHeight=0.0450000
        TabOrder=2
        bBoundToParent=true
        OnClick=UT2K4ChatPassword.InternalOnClick
        OnKeyEvent=GetPassFail.InternalOnKeyEvent
    end object
    b_Cancel=GetPassFail
    // Reference: moEditBox'GUI2K4_Decompressed.UT2K4ChatPassword.GetPassPW'
    begin object name="GetPassPW" class=XInterface.moEditBox
        CaptionWidth=0.4000000
        Caption="??? ????"
        OnCreateComponent=GetPassPW.InternalOnCreateComponent
        WinTop=0.4974500
        WinLeft=0.2125000
        WinWidth=0.6437510
        WinHeight=0.0473050
        TabOrder=0
    end object
    ed_Data=GetPassPW
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4ChatPassword.GetPassRetry'
    begin object name="GetPassRetry" class=XInterface.GUIButton
        Caption="???"
        WinTop=0.5616670
        WinLeft=0.3462890
        WinWidth=0.1316410
        TabOrder=1
        bBoundToParent=true
        OnClick=UT2K4ChatPassword.InternalOnClick
        OnKeyEvent=GetPassRetry.InternalOnKeyEvent
    end object
    b_OK=GetPassRetry
    // Reference: GUILabel'GUI2K4_Decompressed.UT2K4ChatPassword.GetPassLabel'
    begin object name="GetPassLabel" class=XInterface.GUILabel
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
    end object
    l_Text=GetPassLabel
    bAllowedAsLast=true
}