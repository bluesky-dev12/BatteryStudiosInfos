/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\MOTDConfigPage.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Functions:4
 *
 *******************************************************************************/
class MOTDConfigPage extends GUIArrayPropPage
    editinlinenew
    instanced;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    sb_Bk1.WinWidth = 0.6218750;
    sb_Bk1.WinHeight = 0.3406250;
    sb_Bk1.WinLeft = 0.043750;
    sb_Bk1.WinTop = 0.1166660;
    sb_Bk1.TopPadding = 0.010;
    sb_Bk1.LeftPadding = 0.010;
    sb_Bk1.RightPadding = 0.010;
}

function SetOwner(GUIComponent NewOwner)
{
    super.SetOwner(NewOwner);
    PropValue.Length = 4;
}

function string GetDataString()
{
    return JoinArray(PropValue, "|", true);
}

function SetItemOptions(GUIMenuOption Mo)
{
    local export editinline moEditBox ed;

    ed = moEditBox(Mo);
    // End:0x35
    if(ed != none)
    {
        ed.MyEditBox.MaxWidth = 60;
    }
}

defaultproperties
{
    Delim="|"
    WinTop=0.218750
    WinLeft=0.1669920
    WinWidth=0.684570
    WinHeight=0.5093750
}