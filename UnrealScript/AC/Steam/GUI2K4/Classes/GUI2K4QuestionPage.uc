/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\GUI2K4QuestionPage.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
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
        Controller.CloseMenu(bool(t & 2 | 64));
    }
    OnButtonClick(byte(t));
    return true;
}

defaultproperties
{
    Controls=// Object reference not set to an instance of an object.
    
    WinTop=0.0
    WinHeight=1.0
}