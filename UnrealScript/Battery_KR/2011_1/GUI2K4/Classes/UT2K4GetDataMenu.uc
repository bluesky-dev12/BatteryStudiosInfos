class UT2K4GetDataMenu extends UT2K4GenericMessageBox
    editinlinenew
    instanced;

var() automated GUIButton b_Cancel;
var() automated moEditBox ed_Data;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    ed_Data.TabOrder = 0;
    b_OK.TabOrder = 1;
    b_Cancel.TabOrder = 2;
    super(GUIPage).InitComponent(MyController, myOwner);
    RemoveComponent(l_Text2);
    b_OK.bBoundToParent = true;
    b_OK.bStandardized = true;
    b_OK.bScaleToParent = true;
    b_Cancel.bBoundToParent = true;
    b_Cancel.bStandardized = true;
    b_Cancel.bScaleToParent = true;
    //return;    
}

function HandleParameters(string A, string B)
{
    l_Text.Caption = A;
    ed_Data.SetCaption(B);
    //return;    
}

function string GetDataString()
{
    return ed_Data.GetText();
    //return;    
}

function SetDataString(string str)
{
    super(GUIPage).SetDataString(str);
    ed_Data.SetText(str);
    //return;    
}

function bool InternalOnClick(GUIComponent Sender)
{
    Controller.CloseMenu(Sender == b_Cancel);
    return true;
    //return;    
}

function bool InternalOnKeyEvent(out byte key, out byte State, float Delta)
{
    // End:0x2A
    if((int(State) == 3) && int(key) == 11)
    {
        return InternalOnClick(b_Cancel);
    }
    return super.InternalOnKeyEvent(key, State, Delta);
    //return;    
}

function bool InternalOnPreDraw(Canvas C)
{
    local bool B;
    local float W, L, t;

    B = super(PopupPageBase).InternalOnPreDraw(C);
    t = (1.0000000 - (float(64) / ActualHeight())) - b_Cancel.WinHeight;
    W = 0.1500000 + (b_Cancel.WinWidth * float(2));
    L = 0.5000000 - (W * 0.5000000);
    b_Cancel.SetPosition(L, t, b_Cancel.WinWidth, b_Cancel.WinHeight);
    L += (0.1500000 + b_Cancel.WinWidth);
    b_OK.SetPosition(L, t, b_Cancel.WinWidth, b_Cancel.WinHeight);
    return B;
    //return;    
}

defaultproperties
{
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4GetDataMenu.CancelButton'
    begin object name="CancelButton" class=XInterface.GUIButton
        Caption="??"
        Hint="??? ??? ???? ??? ????."
        WinTop=0.5541670
        WinLeft=0.5730470
        WinWidth=0.1316410
        WinHeight=0.0478120
        OnClick=UT2K4GetDataMenu.InternalOnClick
        OnKeyEvent=CancelButton.InternalOnKeyEvent
    end object
    b_Cancel=CancelButton
    // Reference: moEditBox'GUI2K4_Decompressed.UT2K4GetDataMenu.Data'
    begin object name="Data" class=XInterface.moEditBox
        CaptionWidth=0.4000000
        OnCreateComponent=Data.InternalOnCreateComponent
        WinTop=0.4877100
        WinLeft=0.2500000
        WinHeight=0.0473050
        TabOrder=0
    end object
    ed_Data=Data
    // Reference: GUILabel'GUI2K4_Decompressed.UT2K4GetDataMenu.DialogText'
    begin object name="DialogText" class=XInterface.GUILabel
        TextAlign=1
        FontScale=2
        StyleName="TextButton"
        WinTop=0.3882810
        WinHeight=0.0937500
    end object
    l_Text=DialogText
    WinTop=0.2895830
    WinHeight=0.4234380
}