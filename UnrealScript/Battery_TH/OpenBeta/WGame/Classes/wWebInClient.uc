class wWebInClient extends Object
    native;

var bool bOpened;
var bool bInitialized;

// Export UwWebInClient::execOpenWeb(FFrame&, void* const)
native final function OpenWeb(string strUrl)
{
    //native.strUrl;        
}

// Export UwWebInClient::execCloseWeb(FFrame&, void* const)
native final function CloseWeb();

simulated function StartWeb(string strUrl)
{
    OpenWeb(strUrl);
    //return;    
}
