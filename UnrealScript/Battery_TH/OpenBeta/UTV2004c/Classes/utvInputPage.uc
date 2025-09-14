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
    //return;    
}

function bool MyOnDraw(Canvas Canvas)
{
    local PlayerController PC;

    PC = PlayerOwner();
    // End:0x5A
    if((PC != none) && PC.myHUD != none)
    {
        PC.myHUD.DrawTypingPrompt(Canvas, "UTVSAY " $ TypedStr);        
    }
    else
    {
        Log("utv: Current player has no hud, closing chat");
        Controller.CloseMenu();
        return true;
    }
    return true;
    //return;    
}

function bool MyOnKeyType(out byte key, optional string Unicode)
{
    // End:0x0B
    if(bIgnoreKeys)
    {
        return true;
    }
    // End:0x52
    if(int(key) >= 32)
    {
        // End:0x3A
        if(Unicode != "")
        {
            TypedStr = TypedStr $ Unicode;            
        }
        else
        {
            TypedStr = TypedStr $ Chr(int(key));
        }
        return true;
    }
    return false;
    //return;    
}

function bool MyOnKeyEvent(out byte key, out byte Action, float Delta)
{
    // End:0x15
    if(int(Action) == 1)
    {
        bIgnoreKeys = false;
    }
    // End:0x37
    if(int(key) == 27)
    {
        Controller.CloseMenu();
        return true;        
    }
    else
    {
        // End:0x49
        if(int(Action) != 1)
        {
            return false;            
        }
        else
        {
            // End:0x8B
            if(int(key) == 13)
            {
                // End:0x77
                if(TypedStr != "")
                {
                    Class'UTV2004c_Decompressed.utvReplication'.default.chatString = TypedStr;
                }
                Controller.CloseMenu();
                return true;                
            }
            else
            {
                // End:0xCF
                if((int(key) == 8) || int(key) == 37)
                {
                    // End:0xCD
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
    //return;    
}

defaultproperties
{
    bRenderWorld=true
    bRequire640x480=false
    bAllowedAsLast=true
    OnDraw=utvInputPage.MyOnDraw
    OnKeyType=utvInputPage.MyOnKeyType
    OnKeyEvent=utvInputPage.MyOnKeyEvent
}