class BTNetGUIChildPage extends BTNetGUIPage
    editinlinenew
    instanced;

var bool bOpened;

function bool OpenChildPage(GUIPage Parent)
{
    // End:0x0E
    if(bOpened == true)
    {
        return false;
    }
    // End:0x3B
    if(Parent.AppendComponent(self) != none)
    {
        ParentPage = Parent;
        FocusFirst(self);
        return true;        
    }
    else
    {
        return false;
    }
    //return;    
}

function bool CloseChildPage()
{
    // End:0x44
    if(ParentPage != none)
    {
        ParentPage.RemoveComponent(self);
        bOpened = false;
        Closed(ParentPage, false);
        ParentPage.FocusLast(self);
        return true;        
    }
    else
    {
        return false;
    }
    //return;    
}

function bool MyKeyEvent(out byte key, out byte State, float Delta)
{
    // End:0x28
    if((int(key) == 27) && int(State) == 1)
    {
        CloseChildPage();
        return true;        
    }
    else
    {
        return false;
    }
    //return;    
}

defaultproperties
{
    OnKeyEvent=BTNetGUIChildPage.MyKeyEvent
}