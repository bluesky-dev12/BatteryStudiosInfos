/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\SPHighScoreBase.uc
 * Package Imports:
 *	GUI2K4
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:2
 *
 *******************************************************************************/
class SPHighScoreBase extends Object
    abstract;

var array<string> UnlockedChars;

function UnlockChar(string char, optional string PlayerHash);
function string StoredPlayerID();
