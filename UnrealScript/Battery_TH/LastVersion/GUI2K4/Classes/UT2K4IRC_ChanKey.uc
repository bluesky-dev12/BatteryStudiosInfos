class UT2K4IRC_ChanKey extends UT2K4GetDataMenu
    editinlinenew
    instanced;

var localized string EditCaption;
var localized string EditHint;
var localized string msgCaption;
var string kchan;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    ed_Data.SetText("");
    ed_Data.WinWidth = 0.5000000;
    ed_Data.WinHeight = 0.0473050;
    ed_Data.WinLeft = 0.2500000;
    ed_Data.SetCaption(EditCaption);
    ed_Data.SetHint(EditHint);
    //return;    
}

function InternalOnCreateComponent(GUIComponent NewComp, GUIComponent Owner)
{
    // End:0x58
    if(moEditBox(NewComp) != none)
    {
        moEditBox(NewComp).LabelJustification = 2;
        moEditBox(NewComp).CaptionWidth = 0.5500000;
        moEditBox(NewComp).ComponentWidth = -1.0000000;
    }
    //return;    
}

function HandleParameters(string A, string B)
{
    kchan = A;
    l_Text.Caption = Repl(msgCaption, "%chan%", A);
    //return;    
}

function string GetDataString()
{
    return kchan @ ed_Data.GetText();
    //return;    
}

defaultproperties
{
    EditCaption="?? ?: "
    EditHint="?? ?? ?????."
    msgCaption="%chan%? ???? ?????."
    OnCreateComponent=UT2K4IRC_ChanKey.InternalOnCreateComponent
}