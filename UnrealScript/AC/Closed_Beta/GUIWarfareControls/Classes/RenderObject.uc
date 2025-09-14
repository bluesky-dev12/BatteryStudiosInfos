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

function bool CheckIn(float X, float Y)
{
    // End:0x56
    if((AWinPos.X1 <= X) && X <= AWinPos.X2)
    {
        // End:0x56
        if((AWinPos.Y1 <= Y) && Y <= AWinPos.Y2)
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