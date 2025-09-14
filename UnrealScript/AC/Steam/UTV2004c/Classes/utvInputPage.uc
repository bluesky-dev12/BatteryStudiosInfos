/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UTV2004c\Classes\utvInputPage.uc
 * Package Imports:
 *	UTV2004c
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:4
 *
 *******************************************************************************/
class utvInputPage extends UT2K3GUIPage
    editinlinenew
    instanced;

var string TypedStr;
var bool bIgnoreKeys;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPage).InitComponent(MyController, myOwner);
    bIgnoreKeys = true;
    TypedStr = "";
}

function bool MyOnDraw(Canvas Canvas)
{
    local PlayerController PC;

    PC = PlayerOwner();
    // End:0x5a
    if(PC != none && PC.myHUD != none)
    {
        PC.myHUD.DrawTypingPrompt(Canvas, "UTVSAY " $ TypedStr);
    }
    // End:0x9b
    else
    {
        Log("utv: Current player has no hud, closing chat");
        Controller.CloseMenu();
        return true;
    }
    return true;
}

function bool MyOnKeyType(out byte key, optional string Unicode)
{
    // End:0x0b
    if(bIgnoreKeys)
    {
        return true;
    }
    // End:0x52
    if(key >= 32)
    {
        // End:0x3a
        if(Unicode != "")
        {
            TypedStr = TypedStr $ Unicode;
        }
        // End:0x50
        else
        {
            TypedStr = TypedStr $ Chr(key);
        }
        return true;
    }
    return false;
}

function bool MyOnKeyEvent(out byte key, out byte Action, float Delta)
{
    // End:0x15
    if(Action == 1)
    {
        bIgnoreKeys = false;
    }
    // End:0x37
    if(key == 27)
    {
        Controller.CloseMenu();
        return true;
    }
    // End:0xcf
    else
    {
        // End:0x49
        if(Action != 1)
        {
            return false;
        }
        // End:0xcf
        else
        {
            // End:0x8b
            if(key == 13)
            {
                // End:0x77
                if(TypedStr != "")
                {
                    class'utvReplication'.default.chatString = TypedStr;
                }
                Controller.CloseMenu();
                return true;
            }
            // End:0xcf
            else
            {
                // End:0xcf
                if(key == 8 || key == 37)
                {
                    // End:0xcd
                    if(Len(TypedStr) > 0)
                    {
                        TypedStr = Left(TypedStr, Len(TypedStr) - 1);
                    }
                    return true;
                }
            }
        }
    }
    return false;
}

defaultproperties
{
    bRenderWorld=true
    bRequire640x480=true
    bAllowedAsLast=true
    OnDraw=MyOnDraw
    OnKeyType=MyOnKeyType
    OnKeyEvent=MyOnKeyEvent
}