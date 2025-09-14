class WebApplication extends Object;

var LevelInfo Level;
var WebServer WebServer;
var string Path;

function Init()
{
    //return;    
}

final function Cleanup()
{
    //return;    
}

function CleanupApp()
{
    // End:0x12
    if(Level != none)
    {
        Level = none;
    }
    // End:0x24
    if(WebServer != none)
    {
        WebServer = none;
    }
    //return;    
}

function bool PreQuery(WebRequest Request, WebResponse Response)
{
    return true;
    //return;    
}

function Query(WebRequest Request, WebResponse Response)
{
    //return;    
}

function PostQuery(WebRequest Request, WebResponse Response)
{
    //return;    
}
