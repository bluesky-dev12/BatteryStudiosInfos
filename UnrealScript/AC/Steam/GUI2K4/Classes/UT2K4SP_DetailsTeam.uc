/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4SP_DetailsTeam.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:2
 *
 *******************************************************************************/
class UT2K4SP_DetailsTeam extends LargeWindow
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage imgPicture;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton btnOk;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel lblTitle;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIScrollTextBox cbDescription;

event HandleParameters(string Param1, string Param2)
{
    local class<UT2K4TeamRoster> ETI;

    super(GUIPage).HandleParameters(Param1, Param2);
    ETI = class<UT2K4TeamRoster>(DynamicLoadObject(Param1, class'Class'));
    // End:0x6d
    if(ETI == none)
    {
        Warn(Param1 @ "is not a valid subclass of UT2K4TeamRoster");
        return;
    }
    lblTitle.Caption = ETI.default.TeamName;
    // End:0xcd
    if(ETI.default.TeamSymbolName != "")
    {
        imgPicture.Image = Material(DynamicLoadObject(ETI.default.TeamSymbolName, class'Material', true));
    }
    cbDescription.SetContent(ETI.default.TeamDescription);
    // End:0x123
    if(ETI.default.VoiceOver != none)
    {
        PlayerOwner().PlayOwnedSound(ETI.default.VoiceOver, 6, 1.0);
    }
    // End:0x159
    else
    {
        // End:0x159
        if(ETI.default.TeamNameSound != none)
        {
            PlayerOwner().PlayOwnedSound(ETI.default.TeamNameSound, 6, 1.0);
        }
    }
}

function bool btnOkOnClick(GUIComponent Sender)
{
    Controller.CloseMenu(false);
    return true;
}

defaultproperties
{
    begin object name=SPDTimgPicture class=GUIImage
        ImageStyle=4
        ImageAlign=1
        WinTop=0.16250
        WinLeft=0.031250
        WinWidth=0.2250
        WinHeight=0.41250
        RenderWeight=0.30
        bBoundToParent=true
    object end
    // Reference: GUIImage'UT2K4SP_DetailsTeam.SPDTimgPicture'
    imgPicture=SPDTimgPicture
    begin object name=SPDTbtnOk class=GUIButton
        Caption="??"
        FontScale=0
        WinTop=0.8656250
        WinLeft=0.3378130
        WinWidth=0.20
        bBoundToParent=true
        OnClick=btnOkOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4SP_DetailsTeam.SPDTbtnOk'
    btnOk=SPDTbtnOk
    begin object name=SPDTlblTitle class=GUILabel
        TextAlign=1
        FontScale=2
        StyleName="TextLabel"
        WinTop=0.0683330
        WinLeft=0.02750
        WinWidth=0.56750
        WinHeight=0.053750
        bBoundToParent=true
    object end
    // Reference: GUILabel'UT2K4SP_DetailsTeam.SPDTlblTitle'
    lblTitle=SPDTlblTitle
    begin object name=SPDTcbDescription class=GUIScrollTextBox
        bNoTeletype=true
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.1666670
        WinLeft=0.4250
        WinWidth=0.3249990
        WinHeight=0.41250
        bBoundToParent=true
    object end
    // Reference: GUIScrollTextBox'UT2K4SP_DetailsTeam.SPDTcbDescription'
    cbDescription=SPDTcbDescription
    DefaultLeft=0.080
    DefaultTop=0.1933330
    DefaultWidth=0.82750
    DefaultHeight=0.5987490
    WinTop=0.1933330
    WinLeft=0.080
    WinWidth=0.82750
    WinHeight=0.5987490
}