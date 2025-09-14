/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\StreamInterface.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:12
 *
 *******************************************************************************/
class StreamInterface extends StreamBase
    dependson(StreamBase)
    native
    config();

var private globalconfig string CurrentDirectory;

// Export UStreamInterface::execGetBaseDirectory(FFrame&, void* const)
private native final function string GetBaseDirectory();
// Export UStreamInterface::execGetDriveLetters(FFrame&, void* const)
native final function bool GetDriveLetters(out array<string> Letters);
// Export UStreamInterface::execGetDirectoryContents(FFrame&, void* const)
native final function bool GetDirectoryContents(out array<string> contents, optional string DirectoryName, optional StreamBase.EFileType FileType);
// Export UStreamInterface::execCreateDirectory(FFrame&, void* const)
native final function string CreateDirectory(string DirectoryName);
// Export UStreamInterface::execRemoveDirectory(FFrame&, void* const)
native final function bool RemoveDirectory(string DirectoryName);
// Export UStreamInterface::execValidDirectory(FFrame&, void* const)
native final function bool ValidDirectory(optional string DirectoryPath);
// Export UStreamInterface::execCreateStream(FFrame&, void* const)
native final function Stream CreateStream(string fileName, optional bool bStrict);
// Export UStreamInterface::execValidFile(FFrame&, void* const)
native final function bool ValidFile(string fileName);
// Export UStreamInterface::execLoadPlaylist(FFrame&, void* const)
native final function bool LoadPlaylist(string fileName, out array<string> Lines, optional bool bStrict);
function string GetCurrentDirectory()
{
    // End:0x2a
    if(CurrentDirectory == "" || !ValidDirectory(CurrentDirectory))
    {
        ChangeDirectory(GetBaseDirectory());
    }
    return CurrentDirectory;
}

function ChangeDirectory(string DirectoryName)
{
    local bool bSave;

    bSave = DirectoryName != CurrentDirectory;
    CurrentDirectory = DirectoryName;
    // End:0x2a
    if(bSave)
    {
        SaveConfig();
    }
}

function bool HandleDebugExec(string Command, string Param)
{
    local string str;
    local array<string> Test;
    local int i;

    // End:0x15
    if(super.HandleDebugExec(Command, Param))
    {
        return true;
    }
    switch(Locs(Command))
    {
        // End:0x34
        case "getbase":
            Log(GetBaseDirectory());
            return true;
        // End:0x4d
        case "getcurrent":
            Log(GetCurrentDirectory());
            return true;
        // End:0x70
        case "validfilename":
            Log(string(ValidFile(Param)));
            return true;
        // End:0xdd
        case "dir":
            GetDirectoryContents(Test, Param);
            Log("directory list for" @ Param);
            i = 0;
            J0xac:
            // End:0xdb [While If]
            if(i < Test.Length)
            {
                Log("   >" @ Test[i]);
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0xac;
            }
            return true;
        // End:0x11f
        case "chdir":
            str = GetCurrentDirectory();
            ChangeDirectory(Param);
            Log("old:" $ str @ "new:" $ GetCurrentDirectory());
            return true;
        // End:0xffff
        default:
            return false;
    }
}
