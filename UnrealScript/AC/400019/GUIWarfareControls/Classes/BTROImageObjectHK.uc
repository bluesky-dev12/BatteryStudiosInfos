class BTROImageObjectHK extends RenderObject;

var int SelectImageIndex;
var array<Image> Images;

function SetData(int si)
{
    SelectImageIndex = si;
    //return;    
}

function bool Render(Canvas C, optional float Delta)
{
    // End:0x0E
    if(bVisible == false)
    {
        return true;
    }
    // End:0x64
    if(SelectImageIndex != -1)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Images[SelectImageIndex], AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
    }
    return true;
    //return;    
}
