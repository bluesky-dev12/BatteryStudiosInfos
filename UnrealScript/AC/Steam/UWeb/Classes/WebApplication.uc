/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UWeb\Classes\WebApplication.uc
 * Package Imports:
 *	UWeb
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:6
 *
 *******************************************************************************/
class WebApplication extends Object;

var LevelInfo Level;
var WebServer WebServer;
var string Path;

function Init();
final function Cleanup();
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
}

function bool PreQuery(WebRequest Request, WebResponse Response)
{
    return true;
}

function Query(WebRequest Request, WebResponse Response);
function PostQuery(WebRequest Request, WebResponse Response);
