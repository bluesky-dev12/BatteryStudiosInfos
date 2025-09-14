class UT2K4SP_DetailsTeam extends LargeWindow
    editinlinenew
    instanced;

var() automated GUIImage imgPicture;
var() automated GUIButton btnOk;
var() automated GUILabel lblTitle;
var() automated GUIScrollTextBox cbDescription;

event HandleParameters(string Param1, string Param2)
{
    local Class<UT2K4TeamRoster> ETI;

    super(GUIPage).HandleParameters(Param1, Param2);
    ETI = Class<UT2K4TeamRoster>(DynamicLoadObject(Param1, Class'Core.Class'));
    // End:0x6D
    if(ETI == none)
    {
        Warn(Param1 @ "is not a valid subclass of UT2K4TeamRoster");
        return;
    }
    lblTitle.Caption = ETI.default.TeamName;
    // End:0xCD
    if(ETI.default.TeamSymbolName != "")
    {
        imgPicture.Image = Material(DynamicLoadObject(ETI.default.TeamSymbolName, Class'Engine.Material', true));
    }
    cbDescription.SetContent(ETI.default.TeamDescription);
    //return;    
}

function bool btnOkOnClick(GUIComponent Sender)
{
    Controller.CloseMenu(false);
    return true;
    //return;    
}

defaultproperties
{
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4SP_DetailsTeam.SPDTimgPicture'
    begin object name="SPDTimgPicture" class=XInterface.GUIImage
        ImageStyle=4
        ImageAlign=1
        WinTop=0.1625000
        WinLeft=0.0312500
        WinWidth=0.2250000
        WinHeight=0.4125000
        RenderWeight=0.3000000
        bBoundToParent=true
    end object
    imgPicture=SPDTimgPicture
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4SP_DetailsTeam.SPDTbtnOk'
    begin object name="SPDTbtnOk" class=XInterface.GUIButton
        Caption="??"
        FontScale=0
        WinTop=0.8656250
        WinLeft=0.3378130
        WinWidth=0.2000000
        bBoundToParent=true
        OnClick=UT2K4SP_DetailsTeam.btnOkOnClick
        OnKeyEvent=SPDTbtnOk.InternalOnKeyEvent
    end object
    btnOk=SPDTbtnOk
    // Reference: GUILabel'GUI2K4_Decompressed.UT2K4SP_DetailsTeam.SPDTlblTitle'
    begin object name="SPDTlblTitle" class=XInterface.GUILabel
        TextAlign=1
        FontScale=2
        StyleName="TextLabel"
        WinTop=0.0683330
        WinLeft=0.0275000
        WinWidth=0.5675000
        WinHeight=0.0537500
        bBoundToParent=true
    end object
    lblTitle=SPDTlblTitle
    // Reference: GUIScrollTextBox'GUI2K4_Decompressed.UT2K4SP_DetailsTeam.SPDTcbDescription'
    begin object name="SPDTcbDescription" class=XInterface.GUIScrollTextBox
        bNoTeletype=true
        OnCreateComponent=SPDTcbDescription.InternalOnCreateComponent
        WinTop=0.1666670
        WinLeft=0.4250000
        WinWidth=0.3249990
        WinHeight=0.4125000
        bBoundToParent=true
    end object
    cbDescription=SPDTcbDescription
    DefaultLeft=0.0800000
    DefaultTop=0.1933330
    DefaultWidth=0.8275000
    DefaultHeight=0.5987490
    WinTop=0.1933330
    WinLeft=0.0800000
    WinWidth=0.8275000
    WinHeight=0.5987490
}