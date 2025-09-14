class FileLog extends Info
    native
    notplaceable
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var transient pointer LogAr;
var const string LogFileName;
var const string TempFileName;

// Export UFileLog::execOpenLog(FFrame&, void* const)
native final function OpenLog(string FName, optional string FExt, optional bool bOverwrite)
{
    //native.FName;
    //native.FExt;
    //native.bOverwrite;        
}

// Export UFileLog::execCloseLog(FFrame&, void* const)
native final function CloseLog();

// Export UFileLog::execLogf(FFrame&, void* const)
native final function Logf(string LogString)
{
    //native.LogString;        
}
