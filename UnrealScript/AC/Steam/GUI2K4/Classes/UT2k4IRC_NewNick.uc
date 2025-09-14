/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2k4IRC_NewNick.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:2
 *
 *******************************************************************************/
class UT2k4IRC_NewNick extends UT2K4GetDataMenu
    editinlinenew
    instanced;

var localized string EditCaption;
var localized string EditHint;

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

defaultproperties
{
    EditCaption="??? ???: "
    EditHint="??? ???? ??? ?? ?? ??? ????? ?????."
    OnCreateComponent=InternalOnCreateComponent
}