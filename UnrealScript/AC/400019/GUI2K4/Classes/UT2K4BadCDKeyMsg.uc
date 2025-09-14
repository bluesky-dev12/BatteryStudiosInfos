class UT2K4BadCDKeyMsg extends BlackoutWindow
    editinlinenew
    instanced;

var() automated GUIButton b_OK;
var() automated GUILabel l_Title;

function bool InternalOnClick(GUIComponent Sender)
{
    // End:0x2C
    if(Sender == b_OK)
    {
        Controller.ReplaceMenu(Class'Engine.GameEngine'.default.MainMenuClass);
    }
    return true;
    //return;    
}

function bool InternalOnKeyEvent(out byte key, out byte State, float Delta)
{
    // End:0x3A
    if((int(State) == 3) && (int(key) == 13) || int(key) == 11)
    {
        return InternalOnClick(b_OK);
    }
    return false;
    //return;    
}

defaultproperties
{
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4BadCDKeyMsg.OkButton'
    begin object name="OkButton" class=XInterface.GUIButton
        Caption="??"
        WinTop=0.5500000
        WinLeft=0.4000000
        WinWidth=0.2000000
        OnClick=UT2K4BadCDKeyMsg.InternalOnClick
        OnKeyEvent=OkButton.InternalOnKeyEvent
    end object
    b_OK=OkButton
    // Reference: GUILabel'GUI2K4_Decompressed.UT2K4BadCDKeyMsg.BadCDLabel'
    begin object name="BadCDLabel" class=XInterface.GUILabel
        Caption="???? ??? ?? ???? ??????"
        TextAlign=1
        bMultiLine=true
        FontScale=2
        StyleName="TextLabel"
        WinTop=0.3833330
        WinHeight=0.2312500
        bBoundToParent=true
    end object
    l_Title=BadCDLabel
    OnKeyEvent=UT2K4BadCDKeyMsg.InternalOnKeyEvent
}