class GUI2K4QuestionPage extends GUIQuestionPage
    editinlinenew
    instanced;

function bool ButtonClick(GUIComponent Sender)
{
    local int t;

    t = GUIButton(Sender).Tag;
    ParentPage.InactiveFadeColor = ParentPage.default.InactiveFadeColor;
    // End:0x68
    if(NewOnButtonClick(byte(t)))
    {
        Controller.CloseMenu(bool(t & (2 | 64)));
    }
    OnButtonClick(byte(t));
    return true;
    //return;    
}

defaultproperties
{
    // Reference: GUIImage'GUI2K4_Decompressed.GUI2K4QuestionPage.imgBack'
    begin object name="imgBack" class=XInterface.GUIImage
        ImageStyle=1
        ImageRenderStyle=1
        DropShadowY=10
        WinTop=0.2979170
        WinHeight=0.4015630
    end object
    Controls[0]=imgBack
    // Reference: GUILabel'GUI2K4_Decompressed.GUI2K4QuestionPage.lblQuestion'
    begin object name="lblQuestion" class=XInterface.GUILabel
        bMultiLine=true
        StyleName="TextLabel"
        WinTop=0.4500000
        WinLeft=0.1500000
        WinWidth=0.7000000
        WinHeight=0.2000000
    end object
    Controls[1]=lblQuestion
    WinTop=0.0000000
    WinHeight=1.0000000
}