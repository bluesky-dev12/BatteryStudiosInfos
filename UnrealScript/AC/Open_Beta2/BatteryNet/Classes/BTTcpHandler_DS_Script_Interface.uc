class BTTcpHandler_DS_Script_Interface extends BTTcpLink_Channel
    native;

var wMatchMaker MM;
var wGameManager GameMgr;

event SetMatchMaker(wMatchMaker pMM)
{
    MM = pMM;
    //return;    
}

event SetGameManager(wGameManager pgameMgr)
{
    GameMgr = pgameMgr;
    //return;    
}
