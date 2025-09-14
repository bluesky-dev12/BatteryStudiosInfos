/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\Admin.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:2
 *
 *******************************************************************************/
class Admin extends AdminBase within PlayerController;

function DoLogin(string UserName, string Password)
{
    // End:0x75
    if(Outer.Level.Game.AccessControl.AdminLogin(Outer, UserName, Password))
    {
        bAdmin = true;
        Outer.Level.Game.AccessControl.AdminEntered(Outer, "");
    }
}

function DoLogout()
{
    // End:0x69
    if(Outer.Level.Game.AccessControl.AdminLogout(Outer))
    {
        bAdmin = false;
        Outer.Level.Game.AccessControl.AdminExited(Outer);
    }
}
