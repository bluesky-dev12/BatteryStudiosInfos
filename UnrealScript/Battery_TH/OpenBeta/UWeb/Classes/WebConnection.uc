class WebConnection extends TcpLink
    transient
    config
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

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
    SetTimer(30.0000000, false);
    //return;    
}

event Closed()
{
    Destroy();
    //return;    
}

event Timer()
{
    bDelayCleanup = false;
    Cleanup();
    //return;    
}

event ReceivedText(string Text)
{
    local int i;
    local string S;

    ReceivedData $= Text;
    // End:0x2F
    if(RawBytesExpecting > 0)
    {
        RawBytesExpecting -= Len(Text);
        CheckRawBytes();
        return;
    }
    // End:0x4E
    if(Left(ReceivedData, 1) == Chr(10))
    {
        ReceivedData = Mid(ReceivedData, 1);
    }
    i = InStr(ReceivedData, Chr(13));
    J0x5F:

    // End:0xFA [Loop If]
    if(i != -1)
    {
        S = Left(ReceivedData, i);
        i++;
        // End:0xA4
        if(Mid(ReceivedData, i, 1) == Chr(10))
        {
            i++;
        }
        ReceivedData = Mid(ReceivedData, i);
        ReceivedLine(S);
        // End:0xD3
        if(int(LinkState) != int(4))
        {
            return;
        }
        // End:0xE6
        if(RawBytesExpecting > 0)
        {
            CheckRawBytes();
            return;
        }
        i = InStr(ReceivedData, Chr(13));
        // [Loop Continue]
        goto J0x5F;
    }
    //return;    
}

function ReceivedLine(string S)
{
    // End:0x15
    if(S == "")
    {
        EndOfHeaders();        
    }
    else
    {
        // End:0x37
        if(Left(S, 4) ~= "GET ")
        {
            ProcessGet(S);            
        }
        else
        {
            // End:0x5A
            if(Left(S, 5) ~= "POST ")
            {
                ProcessPost(S);                
            }
            else
            {
                // End:0x7D
                if(Left(S, 5) ~= "HEAD ")
                {
                    ProcessHead(S);                    
                }
                else
                {
                    // End:0x9C
                    if(Request != none)
                    {
                        Request.ProcessHeaderString(S);
                    }
                }
            }
        }
    }
    //return;    
}

function ProcessHead(string S)
{
    Log("Received Header: " $ S, 'Header');
    //return;    
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

    // End:0x52 [Loop If]
    if(Left(S, 1) == " ")
    {
        S = Mid(S, 1);
        // [Loop Continue]
        goto J0x31;
    }
    i = InStr(S, " ");
    // End:0x83
    if(i != -1)
    {
        S = Left(S, i);
    }
    i = InStr(S, "?");
    // End:0xD2
    if(i != -1)
    {
        Request.DecodeFormData(Mid(S, i + 1));
        S = Left(S, i);
    }
    Application = WebServer.GetApplication(S, Request.URI);
    // End:0x13E
    if((Application != none) && Request.URI == "")
    {
        Response.Redirect(S $ "/");
        Cleanup();        
    }
    else
    {
        // End:0x19A
        if((Application == none) && WebServer.DefaultApplication != -1)
        {
            Response.Redirect(WebServer.ApplicationPaths[WebServer.DefaultApplication] $ "/");
            Cleanup();
        }
    }
    //return;    
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

    // End:0x52 [Loop If]
    if(Left(S, 1) == " ")
    {
        S = Mid(S, 1);
        // [Loop Continue]
        goto J0x31;
    }
    i = InStr(S, " ");
    // End:0x83
    if(i != -1)
    {
        S = Left(S, i);
    }
    i = InStr(S, "?");
    // End:0xD2
    if(i != -1)
    {
        Request.DecodeFormData(Mid(S, i + 1));
        S = Left(S, i);
    }
    Application = WebServer.GetApplication(S, Request.URI);
    // End:0x13B
    if((Application != none) && Request.URI == "")
    {
        Response.Redirect(S $ "/");
        Cleanup();
    }
    //return;    
}

function CreateResponseObject()
{
    Request = new (none) Class'UWeb_Decompressed.WebRequest';
    Response = new (none) Class'UWeb_Decompressed.WebResponse';
    Response.Connection = self;
    //return;    
}

function EndOfHeaders()
{
    // End:0x2D
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
    // End:0xAE
    if((Request.ContentLength != 0) && int(Request.RequestType) == int(1))
    {
        RawBytesExpecting = Request.ContentLength;
        RawBytesExpecting -= Len(ReceivedData);
        CheckRawBytes();        
    }
    else
    {
        // End:0xFC
        if(Application.PreQuery(Request, Response))
        {
            Application.Query(Request, Response);
            Application.PostQuery(Request, Response);
        }
        Cleanup();
    }
    //return;    
}

function CheckRawBytes()
{
    // End:0x10D
    if(RawBytesExpecting <= 0)
    {
        // End:0x9D
        if(!Request.ContentType ~= "application/x-www-form-urlencoded")
        {
            Log("WebConnection: Unknown form data content-type: " $ Request.ContentType);
            Response.HTTPError(400);            
        }
        else
        {
            Request.DecodeFormData(ReceivedData);
            // End:0xFF
            if(Application.PreQuery(Request, Response))
            {
                Application.Query(Request, Response);
                Application.PostQuery(Request, Response);
            }
            ReceivedData = "";
        }
        Cleanup();
    }
    //return;    
}

function Cleanup()
{
    // End:0x0B
    if(bDelayCleanup)
    {
        return;
    }
    // End:0x1D
    if(Request != none)
    {
        Request = none;
    }
    // End:0x3F
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
    //return;    
}

final function bool IsHanging()
{
    return bDelayCleanup;
    //return;    
}

defaultproperties
{
    MaxValueLength=512
    MaxLineLength=4096
}