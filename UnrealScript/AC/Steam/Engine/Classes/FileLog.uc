/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\FileLog.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:3
 *
 *******************************************************************************/
class FileLog extends Info
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    native
    notplaceable;

var transient pointer LogAr;
var const string LogFileName;
var const string TempFileName;

// Export UFileLog::execOpenLog(FFrame&, void* const)
native final function OpenLog(string FName, optional string FExt, optional bool bOverwrite);
// Export UFileLog::execCloseLog(FFrame&, void* const)
native final function CloseLog();
// Export UFileLog::execLogf(FFrame&, void* const)
native final function Logf(string LogString);
