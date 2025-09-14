/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wAILevelBase.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:5
 *
 *******************************************************************************/
class wAILevelBase extends Actor
    native
    notplaceable;

function Initialize();
function KillBot(AIController Bot);
function KillBots(int Num);
function KillBotsTeam(int Num, int inTeam);
function ClearReferences();
