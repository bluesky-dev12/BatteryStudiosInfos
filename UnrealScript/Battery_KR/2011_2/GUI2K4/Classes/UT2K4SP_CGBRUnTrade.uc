class UT2K4SP_CGBRUnTrade extends LargeWindow
    editinlinenew
    instanced;

var() automated GUIScrollTextBox sbMessage;
var() automated GUIButton btnOk;
var() automated GUIImage imgPicture;
var() automated GUIImage imgPictureBg;
var() automated GUILabel lblTitle;
var Class<UT2K4TeamRoster> ETI;
var string TargetPlayerName;
var localized string Message;

event HandleParameters(string Param1, string Param2)
{
    local PlayerRecord pR;

    ETI = Class<UT2K4TeamRoster>(DynamicLoadObject(Param1, Class'Core.Class'));
    TargetPlayerName = Param2;
    pR = Class'WGame.wUtil'.static.FindPlayerRecord(Param2);
    imgPicture.Image = pR.Portrait;
    SetDescription();
    //return;    
}

function SetDescription()
{
    local string tmp;

    tmp = Repl(Message, "%player%", TargetPlayerName);
    tmp = Repl(tmp, "%enemyteam%", ETI.default.TeamName);
    sbMessage.SetContent(tmp);
    //return;    
}

function bool onOkClick(GUIComponent Sender)
{
    Controller.CloseMenu(false);
    return true;
    //return;    
}

defaultproperties
{
    // Reference: GUIScrollTextBox'GUI2K4_Decompressed.UT2K4SP_CGBRUnTrade.SPCsbDetails'
    begin object name="SPCsbDetails" class=XInterface.GUIScrollTextBox
        bNoTeletype=true
        OnCreateComponent=SPCsbDetails.InternalOnCreateComponent
        WinTop=0.1664880
        WinLeft=0.3168750
        WinWidth=0.3770820
        WinHeight=0.3186110
        RenderWeight=0.2000000
        TabOrder=1
        bBoundToParent=true
    end object
    sbMessage=SPCsbDetails
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4SP_CGBRUnTrade.SPMbtnOk'
    begin object name="SPMbtnOk" class=XInterface.GUIButton
        Caption="??"
        FontScale=0
        WinTop=0.8210640
        WinLeft=0.3100700
        WinWidth=0.2222220
        WinHeight=0.0506940
        TabOrder=1
        bBoundToParent=true
        OnClick=UT2K4SP_CGBRUnTrade.onOkClick
        OnKeyEvent=SPMbtnOk.InternalOnKeyEvent
    end object
    btnOk=SPMbtnOk
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4SP_CGBRUnTrade.SPCimgPicture'
    begin object name="SPCimgPicture" class=XInterface.GUIImage
        ImageStyle=2
        WinTop=0.1725310
        WinLeft=0.0609720
        WinWidth=0.1166670
        WinHeight=0.3125000
        RenderWeight=0.1500000
        bBoundToParent=true
    end object
    imgPicture=SPCimgPicture
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4SP_CGBRUnTrade.SPCimgPictureBg'
    begin object name="SPCimgPictureBg" class=XInterface.GUIImage
        ImageStyle=2
        WinTop=0.1575310
        WinLeft=0.0572220
        WinWidth=0.1216670
        WinHeight=0.3262500
        bBoundToParent=true
    end object
    imgPictureBg=SPCimgPictureBg
    // Reference: GUILabel'GUI2K4_Decompressed.UT2K4SP_CGBRUnTrade.SPClblTitle'
    begin object name="SPClblTitle" class=XInterface.GUILabel
        Caption="??????"
        TextAlign=1
        FontScale=2
        StyleName="TextLabel"
        WinTop=0.0678460
        WinLeft=0.0240630
        WinWidth=0.5687500
        WinHeight=0.0462500
        RenderWeight=0.2000000
        bBoundToParent=true
    end object
    lblTitle=SPClblTitle
    Message="%enemyteam% (?)?? ?????? ??????. ??? ? ???? %player%(?)? ?? %enemyteam%? ???????."
    DefaultTop=0.2500000
    DefaultHeight=0.5000000
    WinTop=0.2500000
    WinHeight=0.5000000
}