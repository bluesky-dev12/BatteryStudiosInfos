class BTGripButtonHK extends GUIGripButtonBase
    editinlinenew
    instanced;

var() Image buttonImage[5];

function bool OwnerDraw(Canvas C)
{
    local float X, Y, Width, Height;

    X = self.ActualLeft();
    Y = self.ActualTop();
    Width = self.ActualWidth();
    Height = self.ActualHeight();
    C.Style = 5;
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, buttonImage[int(self.MenuState)], X, Y, X + Width, Y + Height);
    return true;
    //return;    
}

defaultproperties
{
    OnDraw=BTGripButtonHK.OwnerDraw
}