class Commandlet extends Object
    abstract
    transient
    native
    noexport;

var localized string HelpCmd;
var localized string HelpOneLiner;
var localized string HelpUsage;
var localized string HelpWebLink;
var localized string HelpParm[16];
var localized string HelpDesc[16];
var bool LogToStdout;
var bool IsServer;
var bool IsClient;
var bool IsEditor;
var bool LazyLoad;
var bool ShowErrorCount;
var bool ShowBanner;

// Export UCommandlet::execMain(FFrame&, void* const)
native event int Main(string Parms)
{
    //native.Parms;        
}

defaultproperties
{
    LogToStdout=true
    IsServer=true
    IsClient=true
    IsEditor=true
    LazyLoad=true
    ShowBanner=true
}