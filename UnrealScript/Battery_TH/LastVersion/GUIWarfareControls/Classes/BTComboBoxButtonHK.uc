class BTComboBoxButtonHK extends GUIScrollButtonBase
    editinlinenew
    instanced;

var() Image buttonImage[5];

function bool OwnerDraw(Canvas C)
{
    local float X, Y, width, Height;

    X = self.ActualLeft();
    Y = self.ActualTop();
    width = self.ActualWidth();
    Height = self.ActualHeight();
    C.Style = 5;
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, buttonImage[int(self.MenuState)], X, Y, X + width, Y + Height);
    return true;
    //return;    
}

defaultproperties
{
    OnDraw=BTComboBoxButtonHK.OwnerDraw
}