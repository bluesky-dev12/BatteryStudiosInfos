class ModsAndDemosTabs extends UT2K4TabPanel
    abstract
    editinlinenew
    instanced;

var export editinline UT2K4ModsAndDemos MyPage;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(MyController, myOwner);
    MyPage = UT2K4ModsAndDemos(myOwner.MenuOwner);
    //return;    
}

function ShowPanel(bool bShow)
{
    // End:0x26
    if(bShow)
    {
        MyPage.MyFooter.TabChange(Tag);
    }
    super(GUITabPanel).ShowPanel(bShow);
    //return;    
}
