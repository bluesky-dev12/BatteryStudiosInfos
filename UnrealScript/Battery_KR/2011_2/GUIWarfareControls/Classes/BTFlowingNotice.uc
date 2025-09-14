class BTFlowingNotice extends GUIMultiComponent
    editinlinenew
    instanced;

var localized string Text;
var float Delta;
var float Pace;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    //return;    
}

function SetText(coerce string Value)
{
    Text = Value;
    //return;    
}

function bool InternalDraw(Canvas C)
{
    local export editinline GUIStyles DrawStyle;
    local float XL, YL, X1, Y1, X2, Y2;

    DrawStyle = Style;
    C.Style = 1;
    C.BtrTextSize(Text, 10, XL, YL);
    X1 = (ActualLeft() + ActualWidth()) + Delta;
    Y1 = ActualTop();
    X2 = X1 + ActualWidth();
    Y2 = Y1 + ActualHeight();
    C.SetDrawColor(byte(255), 64, 64);
    C.BtrDrawTextJustified(Text, 0, X1, Y1, X2, Y2, 10);
    Delta += (Controller.RenderDelta * Pace);
    // End:0xFA
    if(Delta <= -ActualWidth() + XL)
    {
        Delta = 0.0000000;
    }
    return true;
    //return;    
}

defaultproperties
{
    Text="??! ??? ??+?? ??? ?? ??? ??? ??+?? ???? ????? ???????."
    Pace=-60.0000000
    StyleName="TextLabel"
    OnDraw=BTFlowingNotice.InternalDraw
}