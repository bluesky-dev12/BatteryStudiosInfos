/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XWebAdmin\Classes\xWebQueryHandler.uc
 * Package Imports:
 *	XWebAdmin
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:5
 *
 *******************************************************************************/
class xWebQueryHandler extends wAdminBase within UTServerAdmin;

var string DefaultPage;
var string Title;
var string NeededPrivs;

function bool Init()
{
    return true;
}

function bool PreQuery(WebRequest Request, WebResponse Response)
{
    return true;
}

function bool Query(WebRequest Request, WebResponse Response)
{
    return false;
}

function bool PostQuery(WebRequest Request, WebResponse Response)
{
    return true;
}

function Cleanup();
