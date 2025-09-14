/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4SP_Injury.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:9
 *	Functions:3
 *
 *******************************************************************************/
class UT2K4SP_Injury extends LargeWindow
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage imgPictureBg;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage imgPicture;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton btnCancel;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton btnTreat;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel lblTitle;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel lblMessage;
var UT2K4GameProfile GP;
var int TreatmentCost;
var int InjuredPlayer;

event HandleParameters(string Param1, string Param2)
{
    local PlayerRecord pR;

    InjuredPlayer = int(Param1);
    GP = UT2K4GameProfile(PlayerOwner().Level.Game.CurrentGameProfile);
    // End:0xcd
    if(GP == none || InjuredPlayer < 0 || InjuredPlayer >= GP.BotStats.Length)
    {
        Warn("Invalid injury menu request:" @ string(GP == none) @ string(InjuredPlayer < 0) @ string(InjuredPlayer >= GP.BotStats.Length));
        Controller.CloseMenu(true);
        return;
    }
    // End:0x101
    if(GP.BotStats[InjuredPlayer].Health >= 100)
    {
        Controller.CloseMenu(true);
        return;
    }
    lblMessage.Caption = Repl(lblMessage.Caption, "%player%", GP.BotStats[InjuredPlayer].Name);
    lblMessage.Caption = Repl(lblMessage.Caption, "%health%", string(GP.BotStats[InjuredPlayer].Health));
    TreatmentCost = int(Round(100.0 - float(GP.BotStats[InjuredPlayer].Health) * float(GP.BotStats[InjuredPlayer].Price) / float(100) * GP.InjuryTreatment));
    lblMessage.Caption = Repl(lblMessage.Caption, "%treatment%", GP.MoneyToString(TreatmentCost));
    lblMessage.Caption = Repl(lblMessage.Caption, "%balance%", GP.MoneyToString(GP.Balance));
    pR = class'wUtil'.static.FindPlayerRecord(GP.BotStats[InjuredPlayer].Name);
    imgPicture.Image = pR.Portrait;
    // End:0x2ec
    if(TreatmentCost > GP.Balance - GP.MinBalance)
    {
        btnTreat.DisableMe();
    }
}

function bool btnCancelOnClick(GUIComponent Sender)
{
    Controller.CloseMenu(true);
    return true;
}

function bool btnTreatOnClick(GUIComponent Sender)
{
    GP.BotStats[InjuredPlayer].Health = 100;
    GP.Balance -= TreatmentCost;
    Controller.CloseMenu(false);
    return true;
}

defaultproperties
{
    begin object name=SPMimgPictureBg class=GUIImage
        ImageStyle=2
        ImageRenderStyle=1
        WinTop=0.1364990
        WinLeft=0.057750
        WinWidth=0.1770
        WinHeight=0.46450
        RenderWeight=0.20
        bBoundToParent=true
    object end
    // Reference: GUIImage'UT2K4SP_Injury.SPMimgPictureBg'
    imgPictureBg=SPMimgPictureBg
    begin object name=SPMimgPicture class=GUIImage
        ImageStyle=2
        ImageRenderStyle=1
        WinTop=0.14650
        WinLeft=0.0590
        WinWidth=0.17450
        WinHeight=0.4520
        RenderWeight=0.30
        bBoundToParent=true
    object end
    // Reference: GUIImage'UT2K4SP_Injury.SPMimgPicture'
    imgPicture=SPMimgPicture
    begin object name=SPMbtnCancel class=GUIButton
        Caption="??"
        FontScale=0
        WinTop=0.8572920
        WinLeft=0.0515630
        WinWidth=0.20
        bBoundToParent=true
        OnClick=btnCancelOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4SP_Injury.SPMbtnCancel'
    btnCancel=SPMbtnCancel
    begin object name=SPMbtnTreat class=GUIButton
        Caption="?? ???"
        FontScale=0
        WinTop=0.8572920
        WinLeft=0.6640630
        WinWidth=0.20
        bBoundToParent=true
        OnClick=btnTreatOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4SP_Injury.SPMbtnTreat'
    btnTreat=SPMbtnTreat
    begin object name=SPLlblTitle class=GUILabel
        Caption="??"
        TextAlign=1
        FontScale=2
        StyleName="TextLabel"
        WinTop=0.0516670
        WinLeft=0.028750
        WinWidth=0.661250
        WinHeight=0.07250
        bBoundToParent=true
    object end
    // Reference: GUILabel'UT2K4SP_Injury.SPLlblTitle'
    lblTitle=SPLlblTitle
    begin object name=SPLlblMessage class=GUILabel
        Caption="%player%(?)? ?? ???? ??? ?????.|%player%? ??? %health%%(?)? ?????, ? ??? ???? ??? %treatment% ??? ??? ??? ???.|???: %balance%"
        bMultiLine=true
        StyleName="TextLabel"
        WinTop=0.1766670
        WinLeft=0.37250
        WinWidth=0.3737490
        WinHeight=0.391250
        bBoundToParent=true
    object end
    // Reference: GUILabel'UT2K4SP_Injury.SPLlblMessage'
    lblMessage=SPLlblMessage
    DefaultLeft=0.150
    DefaultTop=0.150
    DefaultWidth=0.70
    DefaultHeight=0.70
    WinTop=0.150
    WinLeft=0.150
    WinWidth=0.70
    WinHeight=0.70
}