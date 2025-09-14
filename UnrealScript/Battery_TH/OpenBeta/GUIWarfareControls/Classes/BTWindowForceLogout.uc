class BTWindowForceLogout extends BTWindowInfoHK
    editinlinenew
    instanced;

var localized string MessageForcedLogout;
var localized string MessageExit;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    ButtonOK.__OnClick__Delegate = Internal_OnOK;
    //return;    
}

static function bool ShowWindow(GUIController con, string Title, string Msg, optional string btnOk)
{
    // End:0x47
    if(con == none)
    {
        Log("[BTWindowForceLogout::ShowWindow] GUIController = none");
        return false;
    }
    // End:0xE2
    if(con.OpenMenu("GUIWarfareControls.BTWindowForceLogout"))
    {
        BTWindowForceLogout(con.TopPage()).SetData("", 5, BTWindowForceLogout(con.TopPage()).MessageForcedLogout, BTWindowForceLogout(con.TopPage()).MessageExit);
        return true;        
    }
    else
    {
        Log("[BTWindowForceLogout::ShowWindow] OpenMenu Failed!");
    }
    return true;
    //return;    
}

function bool Internal_OnOK(GUIComponent Sender)
{
    PlayerOwner().ConsoleCommand("exit");
    return true;
    //return;    
}

defaultproperties
{
    MessageForcedLogout="???????????????????????????????? ????????? PC ???????? ID ????????_gc190"
    MessageExit="???_gc191"
}