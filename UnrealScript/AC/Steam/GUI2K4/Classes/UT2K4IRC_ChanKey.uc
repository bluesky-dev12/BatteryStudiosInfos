/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4IRC_ChanKey.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:4
 *
 *******************************************************************************/
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
    ed_Data.WinWidth = 0.50;
    ed_Data.WinHeight = 0.0473050;
    ed_Data.WinLeft = 0.250;
    ed_Data.SetCaption(EditCaption);
    ed_Data.SetHint(EditHint);
}

function InternalOnCreateComponent(GUIComponent NewComp, GUIComponent Owner)
{
    // End:0x58
    if(moEditBox(NewComp) != none)
    {
        moEditBox(NewComp).LabelJustification = 2;
        moEditBox(NewComp).CaptionWidth = 0.550;
        moEditBox(NewComp).ComponentWidth = -1.0;
    }
}

function HandleParameters(string A, string B)
{
    kchan = A;
    l_Text.Caption = Repl(msgCaption, "%chan%", A);
}

function string GetDataString()
{
    return kchan @ ed_Data.GetText();
}

defaultproperties
{
    EditCaption="?? ?: "
    EditHint="?? ?? ?????."
    msgCaption="%chan%? ???? ?????."
    OnCreateComponent=InternalOnCreateComponent
}