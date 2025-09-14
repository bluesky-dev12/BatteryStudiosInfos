class Admin extends AdminBase within PlayerController;

function DoLogin(string UserName, string Password)
{
    // End:0x75
    if(Outer.Level.Game.AccessControl.AdminLogin(Outer, UserName, Password))
    {
        bAdmin = true;
        Outer.Level.Game.AccessControl.AdminEntered(Outer, "");
    }
    //return;    
}

function DoLogout()
{
    // End:0x69
    if(Outer.Level.Game.AccessControl.AdminLogout(Outer))
    {
        bAdmin = false;
        Outer.Level.Game.AccessControl.AdminExited(Outer);
    }
    //return;    
}
