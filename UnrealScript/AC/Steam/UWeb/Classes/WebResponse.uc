/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UWeb\Classes\WebResponse.uc
 * Package Imports:
 *	UWeb
 *	Core
 *
 * Stats:
 *	Properties:6
 *	Functions:16
 *
 *******************************************************************************/
class WebResponse extends Object
    dependson(WebConnection)
    dependson(WebServer)
    native
    config()
    noexport;

var private native const TMultiMap ReplacementMap;
var const config string IncludePath;
var localized string CharSet;
var WebConnection Connection;
var bool bSentText;
var bool bSentResponse;

// Export UWebResponse::execSubst(FFrame&, void* const)
native final function Subst(string Variable, coerce string Value, optional bool bClear);
// Export UWebResponse::execClearSubst(FFrame&, void* const)
native final function ClearSubst();
// Export UWebResponse::execIncludeUHTM(FFrame&, void* const)
native final function IncludeUHTM(string fileName);
// Export UWebResponse::execIncludeBinaryFile(FFrame&, void* const)
native final function IncludeBinaryFile(string fileName);
// Export UWebResponse::execLoadParsedUHTM(FFrame&, void* const)
native final function string LoadParsedUHTM(string fileName);
// Export UWebResponse::execGetHTTPExpiration(FFrame&, void* const)
native final function string GetHTTPExpiration(optional int OffsetSeconds);
// Export UWebResponse::execDump(FFrame&, void* const)
native final function Dump();
event SendText(string Text, optional bool bNoCRLF)
{
    // End:0x19
    if(!bSentText)
    {
        SendStandardHeaders();
        bSentText = true;
    }
    // End:0x39
    if(bNoCRLF)
    {
        Connection.SendText(Text);
    }
    // End:0x59
    else
    {
        Connection.SendText(Text $ Chr(13) $ Chr(10));
    }
}

event SendBinary(int Count, byte B[255])
{
    Connection.SendBinary(Count, B);
}

function SendCachedFile(string fileName, optional string ContentType)
{
    // End:0x1f
    if(!bSentText)
    {
        SendStandardHeaders(ContentType, true);
        bSentText = true;
    }
    IncludeUHTM(fileName);
}

function FailAuthentication(string Realm)
{
    HTTPError(401, Realm);
}

function HTTPResponse(string Header)
{
    HTTPHeader(Header);
    bSentResponse = true;
}

function HTTPHeader(string Header)
{
    // End:0x3b
    if(bSentText)
    {
        Log("Can't send headers - already called SendText()");
    }
    Connection.SendText(Header $ Chr(13) $ Chr(10));
}

function HTTPError(int ErrorNum, optional string Data)
{
    switch(ErrorNum)
    {
        // End:0xda
        case 400:
            HTTPResponse("HTTP/1.1 400 Bad Request");
            SendText("<TITLE>400 Bad Request</TITLE><H1>400 Bad Request</H1>If you got this error from a standard web browser, please mail jack@epicgames.com and submit a bug report.");
            // End:0x217
            break;
        // End:0x179
        case 401:
            HTTPResponse("HTTP/1.1 401 Unauthorized");
            HTTPHeader("WWW-authenticate: basic realm=\\"" $ Data $ "\\"");
            SendText("<TITLE>401 Unauthorized</TITLE><H1>401 Unauthorized</H1>");
            // End:0x217
            break;
        // End:0x211
        case 404:
            HTTPResponse("HTTP/1.1 404 Object Not Found");
            SendText("<TITLE>404 File Not Found</TITLE><H1>404 File Not Found</H1>The URL you requested was not found.");
            // End:0x217
            break;
        // End:0xffff
        default:
            // End:0x217 Break;
            break;
    }
}

function SendStandardHeaders(optional string ContentType, optional bool bCache)
{
    // End:0x1d
    if(ContentType == "")
    {
        ContentType = "text/html";
    }
    // End:0x3f
    if(!bSentResponse)
    {
        HTTPResponse("HTTP/1.1 200 OK");
    }
    HTTPHeader("Server: UnrealEngine UWeb Web Server Build " $ Connection.Level.EngineVersion);
    HTTPHeader("Content-Type: " $ ContentType);
    // End:0x11a
    if(bCache)
    {
        HTTPHeader("Cache-Control: max-age=" $ string(Connection.WebServer.ExpirationSeconds));
        HTTPHeader("Expires:" @ GetHTTPExpiration(Connection.WebServer.ExpirationSeconds));
    }
    HTTPHeader("Connection: Close");
    HTTPHeader("");
}

function Redirect(string URL)
{
    HTTPResponse("HTTP/1.1 302 Document Moved");
    HTTPHeader("Location: " $ URL);
    SendText("<head><title>Document Moved</title></head>");
    SendText("<body><h1>Object Moved</h1>This document may be found <a HREF=\\"" $ URL $ "\\">here</a>.");
}

defaultproperties
{
    IncludePath="/Web"
    CharSet="iso-8859-1"
}