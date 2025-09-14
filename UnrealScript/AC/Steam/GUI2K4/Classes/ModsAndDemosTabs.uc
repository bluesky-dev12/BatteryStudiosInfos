/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\ModsAndDemosTabs.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:2
 *
 *******************************************************************************/
class ModsAndDemosTabs extends UT2K4TabPanel
    editinlinenew
    abstract
    instanced;

var export editinline UT2K4ModsAndDemos MyPage;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(MyController, myOwner);
    MyPage = UT2K4ModsAndDemos(myOwner.MenuOwner);
}

function ShowPanel(bool bShow)
{
    // End:0x26
    if(bShow)
    {
        MyPage.MyFooter.TabChange(Tag);
    }
    super(GUITabPanel).ShowPanel(bShow);
}
