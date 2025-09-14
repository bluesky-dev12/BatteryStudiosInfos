class BTTcpHandler_DStoDP_Script_Interface extends BTTcpLink_Process2Agent
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
