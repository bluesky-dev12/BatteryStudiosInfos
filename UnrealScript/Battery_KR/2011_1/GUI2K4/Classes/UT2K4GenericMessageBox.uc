class UT2K4GenericMessageBox extends MessageWindow
    editinlinenew
    instanced;

var() automated GUIButton b_OK;
var() automated GUILabel l_Text;
var() automated GUILabel l_Text2;

function bool InternalOnClick(GUIComponent Sender)
{
    Controller.CloseMenu(false);
    return true;
    //return;    
}

function HandleParameters(string Param1, string Param2)
{
    // End:0x20
    if(Param1 != "")
    {
        l_Text.Caption = Param1;
    }
    // End:0x40
    if(Param2 != "")
    {
        l_Text2.Caption = Param2;
    }
    //return;    
}

function bool InternalOnKeyEvent(out byte key, out byte State, float Delta)
{
    // End:0x2A
    if((int(key) == 13) && int(State) == 3)
    {
        return InternalOnClick(b_OK);
    }
    return false;
    //return;    
}

defaultproperties
{
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4GenericMessageBox.OkButton'
    begin object name="OkButton" class=XInterface.GUIButton
        Caption="??"
        StyleName="STY2Warfare_MainButton"
        WinTop=0.5494790
        WinLeft=0.4000000
        WinWidth=0.2000000
        OnClick=UT2K4GenericMessageBox.InternalOnClick
        OnKeyEvent=OkButton.InternalOnKeyEvent
    end object
    b_OK=OkButton
    // Reference: GUILabel'GUI2K4_Decompressed.UT2K4GenericMessageBox.DialogText'
    begin object name="DialogText" class=XInterface.GUILabel
        Caption="??"
        TextAlign=1
        VertAlign=1
        FontScale=2
        StyleName="TextButton"
        WinTop=0.3898430
        WinLeft=0.0567710
        WinWidth=0.8847220
        WinHeight=0.0421490
    end object
    l_Text=DialogText
    // Reference: GUILabel'GUI2K4_Decompressed.UT2K4GenericMessageBox.DialogText2'
    begin object name="DialogText2" class=XInterface.GUILabel
        TextAlign=1
        bMultiLine=true
        StyleName="TextLabel"
        WinTop=0.4312490
        WinLeft=0.0437500
        WinWidth=0.9125000
        WinHeight=0.1265240
    end object
    l_Text2=DialogText2
    OnKeyEvent=UT2K4GenericMessageBox.InternalOnKeyEvent
}