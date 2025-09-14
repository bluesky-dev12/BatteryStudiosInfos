class RenderObject extends Object;

var FloatBox AWinPos;
var bool bVisible;
var bool bMouseOn;
var bool bFocused;
var bool bvisibleBtn;
var bool bMouseClick;
var bool bMouseRelease;
var bool bQuickSlot;
var bool bNeedUpdate;

function Init()
{
    bMouseOn = false;
    bFocused = false;
    //return;    
}

function bool CheckIn(float X, float Y, float ClientRatioX, float ClientRatioY)
{
    // End:0x72
    if(((AWinPos.X1 * ClientRatioX) <= X) && (X * ClientRatioX) <= AWinPos.X2)
    {
        // End:0x72
        if(((AWinPos.Y1 * ClientRatioY) <= Y) && Y <= (AWinPos.Y2 * ClientRatioY))
        {
            return true;
        }
    }
    return false;
    //return;    
}

function Update(optional Canvas C, optional float Delta)
{
    bvisibleBtn = false;
    //return;    
}

function bool Render(Canvas C, optional float Delta)
{
    // End:0x0E
    if(bVisible == false)
    {
        return false;
    }
    // End:0x22
    if(bNeedUpdate)
    {
        Update(C);
    }
    return true;
    //return;    
}

defaultproperties
{
    bVisible=true
}