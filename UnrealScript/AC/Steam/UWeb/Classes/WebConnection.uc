/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UWeb\Classes\WebConnection.uc
 * Package Imports:
 *	UWeb
 *	IpDrv
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:9
 *	Functions:13
 *
 *******************************************************************************/
class WebConnection extends TcpLink
    dependson(WebServer)
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    config()
    transient;

var WebServer WebServer;
var string ReceivedData;
var WebRequest Request;
var WebResponse Response;
var WebApplication Application;
var bool bDelayCleanup;
var int RawBytesExpecting;
var config int MaxValueLength;
var config int MaxLineLength;

event Accepted()
{
    WebServer = WebServer(Owner);
    SetTimer(30.0, false);
}

event Closed()
{
    Destroy();
}

event Timer()
{
    bDelayCleanup = false;
    Cleanup();
}

event ReceivedText(string Text)
{
    local int i;
    local string S;

    ReceivedData $= Text;
    // End:0x2f
    if(RawBytesExpecting > 0)
    {
        RawBytesExpecting -= Len(Text);
        CheckRawBytes();
        return;
    }
    // End:0x4e
    if(Left(ReceivedData, 1) == Chr(10))
    {
        ReceivedData = Mid(ReceivedData, 1);
    }
    i = InStr(ReceivedData, Chr(13));
    J0x5f:
    // End:0xfa [While If]
    if(i != -1)
    {
        S = Left(ReceivedData, i);
        ++ i;
        // End:0xa4
        if(Mid(ReceivedData, i, 1) == Chr(10))
        {
            ++ i;
        }
        ReceivedData = Mid(ReceivedData, i);
        ReceivedLine(S);
        // End:0xd3
        if(LinkState != 4)
        {
            return;
        }
        // End:0xe6
        if(RawBytesExpecting > 0)
        {
            CheckRawBytes();
            return;
        }
        i = InStr(ReceivedData, Chr(13));
        // This is an implied JumpToken; Continue!
        goto J0x5f;
    }
}

function ReceivedLine(string S)
{
    // End:0x15
    if(S == "")
    {
        EndOfHeaders();
    }
    // End:0x9c
    else
    {
        // End:0x37
        if(Left(S, 4) ~= "GET ")
        {
            ProcessGet(S);
        }
        // End:0x9c
        else
        {
            // End:0x5a
            if(Left(S, 5) ~= "POST ")
            {
                ProcessPost(S);
            }
            // End:0x9c
            else
            {
                // End:0x7d
                if(Left(S, 5) ~= "HEAD ")
                {
                    ProcessHead(S);
                }
                // End:0x9c
                else
                {
                    // End:0x9c
                    if(Request != none)
                    {
                        Request.ProcessHeaderString(S);
                    }
                }
            }
        }
    }
}

function ProcessHead(string S)
{
    Log("Received Header: " $ S, 'Header');
}

function ProcessGet(string S)
{
    local int i;

    // End:0x11
    if(Request == none)
    {
        CreateResponseObject();
    }
    Request.RequestType = 0;
    S = Mid(S, 4);
    J0x31:
    // End:0x52 [While If]
    if(Left(S, 1) == " ")
    {
        S = Mid(S, 1);
        // This is an implied JumpToken; Continue!
        goto J0x31;
    }
    i = InStr(S, " ");
    // End:0x83
    if(i != -1)
    {
        S = Left(S, i);
    }
    i = InStr(S, "?");
    // End:0xd2
    if(i != -1)
    {
        Request.DecodeFormData(Mid(S, i + 1));
        S = Left(S, i);
    }
    Application = WebServer.GetApplication(S, Request.URI);
    // End:0x13e
    if(Application != none && Request.URI == "")
    {
        Response.Redirect(S $ "/");
        Cleanup();
    }
    // End:0x19a
    else
    {
        // End:0x19a
        if(Application == none && WebServer.DefaultApplication != -1)
        {
            Response.Redirect(WebServer.ApplicationPaths[WebServer.DefaultApplication] $ "/");
            Cleanup();
        }
    }
}

function ProcessPost(string S)
{
    local int i;

    // End:0x11
    if(Request == none)
    {
        CreateResponseObject();
    }
    Request.RequestType = 1;
    S = Mid(S, 5);
    J0x31:
    // End:0x52 [While If]
    if(Left(S, 1) == " ")
    {
        S = Mid(S, 1);
        // This is an implied JumpToken; Continue!
        goto J0x31;
    }
    i = InStr(S, " ");
    // End:0x83
    if(i != -1)
    {
        S = Left(S, i);
    }
    i = InStr(S, "?");
    // End:0xd2
    if(i != -1)
    {
        Request.DecodeFormData(Mid(S, i + 1));
        S = Left(S, i);
    }
    Application = WebServer.GetApplication(S, Request.URI);
    // End:0x13b
    if(Application != none && Request.URI == "")
    {
        Response.Redirect(S $ "/");
        Cleanup();
    }
}

function CreateResponseObject()
{
    Request = new (none) class'WebRequest';
    Response = new (none) class'WebResponse';
    Response.Connection = self;
}

function EndOfHeaders()
{
    // End:0x2d
    if(Response == none)
    {
        CreateResponseObject();
        Response.HTTPError(400);
        Cleanup();
        return;
    }
    // End:0x54
    if(Application == none)
    {
        Response.HTTPError(404);
        Cleanup();
        return;
    }
    // End:0xae
    if(Request.ContentLength != 0 && Request.RequestType == 1)
    {
        RawBytesExpecting = Request.ContentLength;
        RawBytesExpecting -= Len(ReceivedData);
        CheckRawBytes();
    }
    // End:0x102
    else
    {
        // End:0xfc
        if(Application.PreQuery(Request, Response))
        {
            Application.Query(Request, Response);
            Application.PostQuery(Request, Response);
        }
        Cleanup();
    }
}

function CheckRawBytes()
{
    // End:0x10d
    if(RawBytesExpecting <= 0)
    {
        // End:0x9d
        if(!Request.ContentType ~= "application/x-www-form-urlencoded")
        {
            Log("WebConnection: Unknown form data content-type: " $ Request.ContentType);
            Response.HTTPError(400);
        }
        // End:0x107
        else
        {
            Request.DecodeFormData(ReceivedData);
            // End:0xff
            if(Application.PreQuery(Request, Response))
            {
                Application.Query(Request, Response);
                Application.PostQuery(Request, Response);
            }
            ReceivedData = "";
        }
        Cleanup();
    }
}

function Cleanup()
{
    // End:0x0b
    if(bDelayCleanup)
    {
        return;
    }
    // End:0x1d
    if(Request != none)
    {
        Request = none;
    }
    // End:0x3f
    if(Response != none)
    {
        Response.Connection = none;
        Response = none;
    }
    // End:0x51
    if(Application != none)
    {
        Application = none;
    }
    Close();
}

final function bool IsHanging()
{
    return bDelayCleanup;
}

defaultproperties
{
    MaxValueLength=512
    MaxLineLength=4096
}