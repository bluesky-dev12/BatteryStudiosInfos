class BTScrollZoneHK extends GUIScrollZoneBase
    editinlinenew
    instanced;

var() Image zoneImage;

function bool OwnerDraw(Canvas C)
{
    local float X, Y, Width, Height;

    X = self.ActualLeft();
    Y = self.ActualTop();
    Width = self.ActualWidth();
    Height = self.ActualHeight();
    C.Style = 5;
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, zoneImage, X, Y, X + Width, Y + Height);
    return true;
    //return;    
}

defaultproperties
{
    OnDraw=BTScrollZoneHK.OwnerDraw
}