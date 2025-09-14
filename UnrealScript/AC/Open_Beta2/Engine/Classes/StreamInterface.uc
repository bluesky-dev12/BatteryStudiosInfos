class StreamInterface extends StreamBase
    native
    config;

var private globalconfig string CurrentDirectory;

// Export UStreamInterface::execGetBaseDirectory(FFrame&, void* const)
private native final function string GetBaseDirectory();

// Export UStreamInterface::execGetDriveLetters(FFrame&, void* const)
native final function bool GetDriveLetters(out array<string> Letters)
{
    //native.Letters;        
}

// Export UStreamInterface::execGetDirectoryContents(FFrame&, void* const)
native final function bool GetDirectoryContents(out array<string> contents, optional string DirectoryName, optional StreamBase.EFileType FileType)
{
    //native.contents;
    //native.DirectoryName;
    //native.FileType;        
}

// Export UStreamInterface::execCreateDirectory(FFrame&, void* const)
native final function string CreateDirectory(string DirectoryName)
{
    //native.DirectoryName;        
}

// Export UStreamInterface::execRemoveDirectory(FFrame&, void* const)
native final function bool RemoveDirectory(string DirectoryName)
{
    //native.DirectoryName;        
}

// Export UStreamInterface::execValidDirectory(FFrame&, void* const)
native final function bool ValidDirectory(optional string DirectoryPath)
{
    //native.DirectoryPath;        
}

// Export UStreamInterface::execCreateStream(FFrame&, void* const)
native final function Stream CreateStream(string fileName, optional bool bStrict)
{
    //native.fileName;
    //native.bStrict;        
}

// Export UStreamInterface::execValidFile(FFrame&, void* const)
native final function bool ValidFile(string fileName)
{
    //native.fileName;        
}

// Export UStreamInterface::execLoadPlaylist(FFrame&, void* const)
native final function bool LoadPlaylist(string fileName, out array<string> Lines, optional bool bStrict)
{
    //native.fileName;
    //native.Lines;
    //native.bStrict;        
}

function string GetCurrentDirectory()
{
    // End:0x2A
    if((CurrentDirectory == "") || !ValidDirectory(CurrentDirectory))
    {
        ChangeDirectory(GetBaseDirectory());
    }
    return CurrentDirectory;
    //return;    
}

function ChangeDirectory(string DirectoryName)
{
    local bool bSave;

    bSave = DirectoryName != CurrentDirectory;
    CurrentDirectory = DirectoryName;
    // End:0x2A
    if(bSave)
    {
        SaveConfig();
    }
    //return;    
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
        // End:0x4D
        case "getcurrent":
            Log(GetCurrentDirectory());
            return true;
        // End:0x70
        case "validfilename":
            Log(string(ValidFile(Param)));
            return true;
        // End:0xDD
        case "dir":
            GetDirectoryContents(Test, Param);
            Log("directory list for" @ Param);
            i = 0;
            J0xAC:

            // End:0xDB [Loop If]
            if(i < Test.Length)
            {
                Log("   >" @ Test[i]);
                i++;
                // [Loop Continue]
                goto J0xAC;
            }
            return true;
        // End:0x11F
        case "chdir":
            str = GetCurrentDirectory();
            ChangeDirectory(Param);
            Log((("old:" $ str) @ "new:") $ (GetCurrentDirectory()));
            return true;
        // End:0xFFFF
        default:
            return false;
            break;
    }
    //return;    
}
