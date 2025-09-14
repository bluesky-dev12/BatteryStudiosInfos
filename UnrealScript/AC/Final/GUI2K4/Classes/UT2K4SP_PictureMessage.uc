class UT2K4SP_PictureMessage extends LargeWindow
    editinlinenew
    instanced;

var() automated GUIImage imgPictureBg;
var() automated GUIImage imgPicture;
var() automated GUIButton btnOk;
var() automated GUILabel lblTitle;

function bool btnOkOnClick(GUIComponent Sender)
{
    Controller.CloseMenu(false);
    return true;
    //return;    
}

event HandleParameters(string Param1, string Param2)
{
    local Material img;

    super(GUIPage).HandleParameters(Param1, Param2);
    lblTitle.Caption = Param1;
    img = Material(DynamicLoadObject(Param2, Class'Engine.Material'));
    // End:0x5E
    if(img != none)
    {
        imgPicture.Image = img;
    }
    //return;    
}

defaultproperties
{
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4SP_PictureMessage.SPMimgPictureBg'
    begin object name="SPMimgPictureBg" class=XInterface.GUIImage
        ImageStyle=2
        ImageRenderStyle=1
        WinTop=0.2781660
        WinLeft=0.2390000
        WinWidth=0.5207500
        WinHeight=0.4632500
        RenderWeight=0.2000000
    end object
    imgPictureBg=SPMimgPictureBg
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4SP_PictureMessage.SPMimgPicture'
    begin object name="SPMimgPicture" class=XInterface.GUIImage
        ImageStyle=2
        ImageRenderStyle=1
        X1=0
        Y1=0
        X2=1023
        Y2=767
        WinTop=0.2925000
        WinLeft=0.2400000
        WinWidth=0.5187500
        WinHeight=0.4350000
        RenderWeight=0.3000000
    end object
    imgPicture=SPMimgPicture
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4SP_PictureMessage.SPMbtnOk'
    begin object name="SPMbtnOk" class=XInterface.GUIButton
        Caption="??"
        FontScale=0
        WinTop=0.7656250
        WinLeft=0.4015630
        WinWidth=0.2000000
        OnClick=UT2K4SP_PictureMessage.btnOkOnClick
        OnKeyEvent=SPMbtnOk.InternalOnKeyEvent
    end object
    btnOk=SPMbtnOk
    // Reference: GUILabel'GUI2K4_Decompressed.UT2K4SP_PictureMessage.SPLlblTitle'
    begin object name="SPLlblTitle" class=XInterface.GUILabel
        Caption="??? ??"
        TextAlign=1
        FontScale=2
        StyleName="TextLabel"
        WinTop=0.1766670
        WinLeft=0.1600000
        WinWidth=0.6800000
        WinHeight=0.0787500
    end object
    lblTitle=SPLlblTitle
    WinTop=0.1500000
    WinLeft=0.1500000
    WinWidth=0.7000000
    WinHeight=0.7000000
}