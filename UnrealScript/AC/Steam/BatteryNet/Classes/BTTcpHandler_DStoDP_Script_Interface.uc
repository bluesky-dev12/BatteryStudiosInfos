/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path BatteryNet\Classes\BTTcpHandler_DStoDP_Script_Interface.uc
 * Package Imports:
 *	BatteryNet
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:2
 *
 *******************************************************************************/
class BTTcpHandler_DStoDP_Script_Interface extends BTTcpLink_Process2Agent
    native;

var wMatchMaker MM;
var wGameManager GameMgr;

event SetMatchMaker(wMatchMaker pMM)
{
    MM = pMM;
}

event SetGameManager(wGameManager pgameMgr)
{
    GameMgr = pgameMgr;
}
