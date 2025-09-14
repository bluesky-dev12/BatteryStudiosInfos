class GUIHorzPageList extends GUIHorzList
    editinlinenew
    instanced;

function bool Up()
{
    return false;
    //return;    
}

function bool Down()
{
    return false;
    //return;    
}

function bool MoveRight()
{
    return false;
    //return;    
}

function bool MoveLeft()
{
    return false;
    //return;    
}

function WheelUp()
{
    //return;    
}

function WheelDown()
{
    //return;    
}

function PgUp()
{
    //return;    
}

function PgDn()
{
    //return;    
}

function home()
{
    //return;    
}

function End()
{
    //return;    
}

function SetTopItem(int Item)
{
    // End:0x12
    if(Item >= ItemCount)
    {        
    }
    else
    {
        // End:0x34
        if((Top < 0) || ItemsPerPage == 0)
        {
            Top = 0;            
        }
        else
        {
            Top = Item;
        }
    }
    // End:0x53
    if(bNotify)
    {
        CheckLinkedObjects(self);
    }
    OnAdjustTop(self);
    // End:0x7C
    if(MyScrollBar != none)
    {
        MyScrollBar.AlignThumb();
    }
    //return;    
}
