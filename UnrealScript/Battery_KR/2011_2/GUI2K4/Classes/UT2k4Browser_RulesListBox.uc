class UT2k4Browser_RulesListBox extends ServerBrowserMCListBox
    editinlinenew
    instanced;

event Opened(GUIComponent Sender)
{
    super(GUIMultiComponent).Opened(Sender);
    MyScrollBar.MyGripButton.__OnMousePressed__Delegate = tp_Anchor.MousePressed;
    MyScrollBar.MyGripButton.__OnMouseRelease__Delegate = tp_Anchor.MouseReleased;
    //return;    
}

defaultproperties
{
    DefaultListClass="GUI2K4.UT2K4Browser_RulesList"
}