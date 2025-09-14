class StreamBase extends Object
    abstract
    native;

enum EFileType
{
    FILE_None,                      // 0
    FILE_Directory,                 // 1
    FILE_Log,                       // 2
    FILE_Ini,                       // 3
    FILE_Stream,                    // 4
    FILE_Playlist,                  // 5
    FILE_Music,                     // 6
    FILE_Map,                       // 7
    FILE_Texture,                   // 8
    FILE_Animation,                 // 9
    FILE_Static,                    // 10
    FILE_XML,                       // 11
    FILE_HTML,                      // 12
    FILE_Sound,                     // 13
    FILE_Demo,                      // 14
    FILE_DivX                       // 15
};

enum EStreamPlaylistType
{
    SPT_None,                       // 0
    SPT_M3U,                        // 1
    SPT_PLS,                        // 2
    SPT_B4S                         // 3
};

struct FilePath
{
    var string FullPath;
    var string Directory;
    var string fileName;
    var string Extension;
    var array<string> DirectoryParts;
};

struct ID3Field
{
    var transient pointer Reference;
    var string FieldName;
    var string FieldValue;
    var byte FieldID;
    var byte Code[4];
};

// Export UStreamBase::execMultiply_StrStr(FFrame&, void* const)
native static final operator(40) string *(coerce string A, coerce string B)
{
    //native.A;
    //native.B;        
}

// Export UStreamBase::execMultiplyEqual_StrStr(FFrame&, void* const)
native static final operator(44) string *=(out string A, coerce string B)
{
    //native.A;
    //native.B;        
}

// Export UStreamBase::execGetPathSeparator(FFrame&, void* const)
native static final function string GetPathSeparator();

// Export UStreamBase::execIsCaseSensitive(FFrame&, void* const)
native static final function bool IsCaseSensitive();

static final event string GetPathRoot(out string InPath)
{
    local int i;
    local string root;

    i = InStr(InPath, GetPathSeparator() $ GetPathSeparator());
    // End:0x42
    if(i == -1)
    {
        i = InStr(InPath, ":" $ GetPathSeparator());
    }
    // End:0x7C
    if(i != -1)
    {
        root = Left(InPath, i + 1);
        InPath = Mid(InPath, i + 2);
    }
    return root;
    //return;    
}

static final event bool HasExtension(string test)
{
    return ParseExtension(test) != "";
    //return;    
}

static final event bool ParsePath(string InPath, out FilePath ParsedPath)
{
    local int i;

    // End:0x0E
    if(InPath == "")
    {
        return false;
    }
    ParsedPath.FullPath = InPath;
    i = RevInStr(InPath, GetPathSeparator());
    // End:0x5E
    if(i != -1)
    {
        ParsedPath.Directory = Left(InPath, i + 1);
    }
    ParsedPath.DirectoryParts = ParseDirectories(InPath);
    ParsedPath.Extension = ParseExtension(InPath);
    ParsedPath.fileName = InPath;
    return (ParsedPath.DirectoryParts.Length > 0) || (ParsedPath.Extension != "") && ParsedPath.fileName != "";
    //return;    
}

static final event string ParseExtension(out string FileNameWithExtension)
{
    local int i;
    local string Ext;

    // End:0x0F
    if(FileNameWithExtension == "")
    {
        return "";
    }
    i = RevInStr(FileNameWithExtension, ".");
    // End:0x43
    if(i >= 0)
    {
        Ext = Mid(FileNameWithExtension, i + 1);
    }
    // End:0x73
    if(int(ConvertToFileType(Ext)) != int(0))
    {
        FileNameWithExtension = Left(FileNameWithExtension, i);
        return Locs(Ext);
    }
    return "";
    //return;    
}

static final event array<string> ParseDirectories(out string InPath)
{
    local array<string> Directories;
    local string root;

    root = GetPathRoot(InPath);
    Split(InPath, GetPathSeparator(), Directories);
    InPath = "";
    // End:0x4C
    if(root != "")
    {
        Directories.Insert(0, 1);
        Directories[0] = root;
    }
    // End:0x89
    if(HasExtension(Directories[Directories.Length - 1]))
    {
        InPath = Directories[Directories.Length - 1];
        Directories.Length = Directories.Length - 1;
    }
    return Directories;
    //return;    
}

static final function int RevInStr(string Src, string Match)
{
    local int pos, i;
    local string S;

    // End:0x20
    if((Src == "") || Match == "")
    {
        return -1;
    }
    S = Src;
    i = InStr(S, Match);
    J0x3D:

    pos += i;
    S = Mid(Src, pos + 1);
    i = InStr(S, Match) + 1;
    // End:0x3D
    if(!(i == 0))
        goto J0x3D;
    return pos;
    //return;    
}

static final function string FormatTimeDisplay(coerce float Seconds)
{
    local int i;
    local string TimeString;

    i = int(Seconds / float(3600));
    // End:0x33
    if(i > 0)
    {
        TimeString = string(i) $ ":";
    }
    i = int(Seconds / float(60));
    // End:0x6C
    if((TimeString != "") && i < 10)
    {
        TimeString $= "0";
    }
    TimeString $= (string(i) $ ":");
    i = int(Seconds % float(60));
    // End:0xAC
    if(i < 10)
    {
        TimeString $= "0";
    }
    TimeString $= string(i);
    return TimeString;
    //return;    
}

static final event string ConvertToFileExtension(StreamBase.EFileType Type)
{
    switch(Type)
    {
        // End:0x13
        case 2:
            return ".log";
        // End:0x1F
        case 3:
            return ".ini";
        // End:0x35
        case 5:
            return ".m3u;.pls;.b4s";
        // End:0x41
        case 6:
            return ".umx";
        // End:0x53
        case 7:
            return ".ebtr;.ut2";
        // End:0x65
        case 8:
            return ".ebtx;.utx";
        // End:0x77
        case 9:
            return ".ebkx;.ukx";
        // End:0x89
        case 10:
            return ".ebsx;.usx";
        // End:0x9B
        case 13:
            return ".ebax;.uax";
        // End:0xA7
        case 11:
            return ".xml";
        // End:0xB9
        case 12:
            return ".html;.htm";
        // End:0xC7
        case 14:
            return ".DEMO4";
        // End:0xD3
        case 15:
            return ".avi";
        // End:0xE4
        case 4:
            return ".mp3;.ogg";
        // End:0xFFFF
        default:
            return "";
            break;
    }
    //return;    
}

static final event StreamBase.EFileType ConvertToFileType(string Extension)
{
    local string Ext;

    // End:0x0F
    if(Extension == "")
    {
        return 0;
    }
    Ext = ParseExtension(Extension);
    // End:0x37
    if(Ext == "")
    {
        Ext = Extension;
    }
    Ext = Locs(Ext);
    switch(Ext)
    {
        // End:0x53
        case "mp3":
        // End:0x5E
        case "ogg":
            return 4;
        // End:0x66
        case "wav":
        // End:0x71
        case "umx":
            return 6;
        // End:0x7C
        case "ut2":
            return 7;
        // End:0x88
        case "ebtr":
            return 7;
        // End:0x94
        case "ebkx":
            return 9;
        // End:0xA0
        case "ebtx":
            return 8;
        // End:0xAC
        case "ebsx":
            return 10;
        // End:0xB8
        case "ebax":
            return 13;
        // End:0xC3
        case "ukx":
            return 9;
        // End:0xCE
        case "uax":
            return 13;
        // End:0xD9
        case "utx":
            return 8;
        // End:0xE4
        case "dem":
            return 14;
        // End:0xEF
        case "usx":
            return 10;
        // End:0xFA
        case "ini":
            return 3;
        // End:0x105
        case "log":
            return 2;
        // End:0x110
        case "avi":
            return 15;
        // End:0x11B
        case "xml":
            return 11;
        // End:0x124
        case "html":
        // End:0x12F
        case "htm":
            return 12;
        // End:0x137
        case "m3u":
        // End:0x13F
        case "b4s":
        // End:0x14A
        case "pls":
            return 5;
        // End:0xFFFF
        default:
            return 0;
            break;
    }
    //return;    
}

static function bool CompareNames(string NameA, string NameB)
{
    // End:0x16
    if(IsCaseSensitive())
    {
        return NameA == NameB;
    }
    return NameA ~= NameB;
    //return;    
}

function bool HandleDebugExec(string Command, string Param)
{
    return false;
    //return;    
}
