class UT2K4SP_Injury extends LargeWindow
    editinlinenew
    instanced;

var() automated GUIImage imgPictureBg;
var() automated GUIImage imgPicture;
var() automated GUIButton btnCancel;
var() automated GUIButton btnTreat;
var() automated GUILabel lblTitle;
var() automated GUILabel lblMessage;
var UT2K4GameProfile GP;
var int TreatmentCost;
var int InjuredPlayer;

event HandleParameters(string Param1, string Param2)
{
    local PlayerRecord pR;

    InjuredPlayer = int(Param1);
    GP = UT2K4GameProfile(PlayerOwner().Level.Game.CurrentGameProfile);
    // End:0xCD
    if(((GP == none) || InjuredPlayer < 0) || InjuredPlayer >= GP.BotStats.Length)
    {
        Warn((("Invalid injury menu request:" @ string(GP == none)) @ string(InjuredPlayer < 0)) @ string(InjuredPlayer >= GP.BotStats.Length));
        Controller.CloseMenu(true);
        return;
    }
    // End:0x101
    if(int(GP.BotStats[InjuredPlayer].Health) >= 100)
    {
        Controller.CloseMenu(true);
        return;
    }
    lblMessage.Caption = Repl(lblMessage.Caption, "%player%", GP.BotStats[InjuredPlayer].Name);
    lblMessage.Caption = Repl(lblMessage.Caption, "%health%", string(GP.BotStats[InjuredPlayer].Health));
    TreatmentCost = int(Round((((100.0000000 - float(GP.BotStats[InjuredPlayer].Health)) * float(GP.BotStats[InjuredPlayer].Price)) / float(100)) * GP.InjuryTreatment));
    lblMessage.Caption = Repl(lblMessage.Caption, "%treatment%", GP.MoneyToString(TreatmentCost));
    lblMessage.Caption = Repl(lblMessage.Caption, "%balance%", GP.MoneyToString(GP.Balance));
    pR = Class'WGame.wUtil'.static.FindPlayerRecord(GP.BotStats[InjuredPlayer].Name);
    imgPicture.Image = pR.Portrait;
    // End:0x2EC
    if(TreatmentCost > (GP.Balance - GP.MinBalance))
    {
        btnTreat.DisableMe();
    }
    //return;    
}

function bool btnCancelOnClick(GUIComponent Sender)
{
    Controller.CloseMenu(true);
    return true;
    //return;    
}

function bool btnTreatOnClick(GUIComponent Sender)
{
    GP.BotStats[InjuredPlayer].Health = 100;
    GP.Balance -= TreatmentCost;
    Controller.CloseMenu(false);
    return true;
    //return;    
}

defaultproperties
{
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4SP_Injury.SPMimgPictureBg'
    begin object name="SPMimgPictureBg" class=XInterface.GUIImage
        ImageStyle=2
        ImageRenderStyle=1
        WinTop=0.1364990
        WinLeft=0.0577500
        WinWidth=0.1770000
        WinHeight=0.4645000
        RenderWeight=0.2000000
        bBoundToParent=true
    end object
    imgPictureBg=SPMimgPictureBg
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4SP_Injury.SPMimgPicture'
    begin object name="SPMimgPicture" class=XInterface.GUIImage
        ImageStyle=2
        ImageRenderStyle=1
        WinTop=0.1465000
        WinLeft=0.0590000
        WinWidth=0.1745000
        WinHeight=0.4520000
        RenderWeight=0.3000000
        bBoundToParent=true
    end object
    imgPicture=SPMimgPicture
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4SP_Injury.SPMbtnCancel'
    begin object name="SPMbtnCancel" class=XInterface.GUIButton
        Caption="??"
        FontScale=0
        WinTop=0.8572920
        WinLeft=0.0515630
        WinWidth=0.2000000
        bBoundToParent=true
        OnClick=UT2K4SP_Injury.btnCancelOnClick
        OnKeyEvent=SPMbtnCancel.InternalOnKeyEvent
    end object
    btnCancel=SPMbtnCancel
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4SP_Injury.SPMbtnTreat'
    begin object name="SPMbtnTreat" class=XInterface.GUIButton
        Caption="?? ???"
        FontScale=0
        WinTop=0.8572920
        WinLeft=0.6640630
        WinWidth=0.2000000
        bBoundToParent=true
        OnClick=UT2K4SP_Injury.btnTreatOnClick
        OnKeyEvent=SPMbtnTreat.InternalOnKeyEvent
    end object
    btnTreat=SPMbtnTreat
    // Reference: GUILabel'GUI2K4_Decompressed.UT2K4SP_Injury.SPLlblTitle'
    begin object name="SPLlblTitle" class=XInterface.GUILabel
        Caption="??"
        TextAlign=1
        FontScale=2
        StyleName="TextLabel"
        WinTop=0.0516670
        WinLeft=0.0287500
        WinWidth=0.6612500
        WinHeight=0.0725000
        bBoundToParent=true
    end object
    lblTitle=SPLlblTitle
    // Reference: GUILabel'GUI2K4_Decompressed.UT2K4SP_Injury.SPLlblMessage'
    begin object name="SPLlblMessage" class=XInterface.GUILabel
        Caption="%player%(?)? ?? ???? ??? ?????.|%player%? ??? %health%%(?)? ?????, ? ??? ???? ??? %treatment% ??? ??? ??? ???.|???: %balance%"
        bMultiLine=true
        StyleName="TextLabel"
        WinTop=0.1766670
        WinLeft=0.3725000
        WinWidth=0.3737490
        WinHeight=0.3912500
        bBoundToParent=true
    end object
    lblMessage=SPLlblMessage
    DefaultLeft=0.1500000
    DefaultTop=0.1500000
    DefaultWidth=0.7000000
    DefaultHeight=0.7000000
    WinTop=0.1500000
    WinLeft=0.1500000
    WinWidth=0.7000000
    WinHeight=0.7000000
}