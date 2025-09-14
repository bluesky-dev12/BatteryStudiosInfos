class BTScrollButtonHK extends GUIScrollButtonBase
    editinlinenew
    instanced;

var() Image buttonImage[6];

function bool OwnerDraw(Canvas C)
{
    local float X, Y, width, Height;

    X = self.ActualLeft();
    Y = self.ActualTop();
    width = self.ActualWidth();
    Height = self.ActualHeight();
    C.Style = 5;
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, buttonImage[5], X, Y, X + width, Y + Height);
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, buttonImage[int(self.MenuState)], X + float(1), Y + float(1), (X + width) - float(1), (Y + Height) - float(1));
    return true;
    //return;    
}

defaultproperties
{
    OnDraw=BTScrollButtonHK.OwnerDraw
}