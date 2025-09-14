class MOTDConfigPage extends GUIArrayPropPage
    editinlinenew
    instanced;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    sb_Bk1.WinWidth = 0.6218750;
    sb_Bk1.WinHeight = 0.3406250;
    sb_Bk1.WinLeft = 0.0437500;
    sb_Bk1.WinTop = 0.1166660;
    sb_Bk1.TopPadding = 0.0100000;
    sb_Bk1.LeftPadding = 0.0100000;
    sb_Bk1.RightPadding = 0.0100000;
    //return;    
}

function SetOwner(GUIComponent NewOwner)
{
    super.SetOwner(NewOwner);
    PropValue.Length = 4;
    //return;    
}

function string GetDataString()
{
    return JoinArray(PropValue, "|", true);
    //return;    
}

function SetItemOptions(GUIMenuOption Mo)
{
    local export editinline moEditBox ed;

    ed = moEditBox(Mo);
    // End:0x35
    if(ed != none)
    {
        ed.MyEditBox.MaxWidth = 60;
    }
    //return;    
}

defaultproperties
{
    Delim="|"
    WinTop=0.2187500
    WinLeft=0.1669920
    WinWidth=0.6845700
    WinHeight=0.5093750
}