class BTROSliderGripHK extends BTROImageObjectHK;

var int HightLight;

function SetHighLight(int Value)
{
    HightLight = Value;
    //return;    
}

function bool Render(Canvas C, optional float Delta)
{
    // End:0x0E
    if(bVisible == false)
    {
        return true;
    }
    // End:0xC0
    if(SelectImageIndex != -1)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Images[SelectImageIndex], AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
        // End:0xC0
        if(SelectImageIndex == 2)
        {
            Class'Engine.BTCustomDrawHK'.static.DrawString(C, string(HightLight), 1, 9.0000000, AWinPos.X1, AWinPos.Y1 - float(19), AWinPos.X2, AWinPos.Y1);
        }
    }
    return true;
    //return;    
}
