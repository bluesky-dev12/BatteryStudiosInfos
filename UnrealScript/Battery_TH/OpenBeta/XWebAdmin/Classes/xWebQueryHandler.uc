class xWebQueryHandler extends wAdminBase within UTServerAdmin;

var string DefaultPage;
var string Title;
var string NeededPrivs;

function bool Init()
{
    return true;
    //return;    
}

function bool PreQuery(WebRequest Request, WebResponse Response)
{
    return true;
    //return;    
}

function bool Query(WebRequest Request, WebResponse Response)
{
    return false;
    //return;    
}

function bool PostQuery(WebRequest Request, WebResponse Response)
{
    return true;
    //return;    
}

function Cleanup()
{
    //return;    
}
