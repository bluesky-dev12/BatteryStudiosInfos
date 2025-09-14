class M3UParser extends PlaylistParserBase within StreamPlaylistManager
    config;

var FilePath ParsedPath;

function bool Import(int PlaylistIndex, int InsertPosition, string Path)
{
    // End:0x4C
    if(Outer.FileManager.LoadPlaylist(Path, Lines) && ParsePath(Path, ParsedPath))
    {
        ImportedPlaylist(PlaylistIndex, InsertPosition);
        return true;
    }
    return false;
    //return;    
}

function ParseLines()
{
    local int i;
    local string str;

    super.ParseLines();
    // End:0x14
    if(Lines.Length == 0)
    {
        return;
    }
    i = 0;
    J0x1B:

    // End:0xAC [Loop If]
    if(i < Lines.Length)
    {
        // End:0x58
        if((Left(Lines[i], 1) == "#") || Lines[i] == "")
        {
            // [Explicit Continue]
            goto J0xA2;
        }
        str = Lines[i];
        // End:0x8A
        if(Left(str, 1) == GetPathSeparator())
        {
            str = Mid(str, 1);
        }
        Paths[Paths.Length] = MatchPath(str);
        J0xA2:

        i++;
        // [Loop Continue]
        goto J0x1B;
    }
    //return;    
}

function string MatchPath(string str)
{
    local int i;
    local array<string> Parts;
    local string Result;

    Split(str, GetPathSeparator(), Parts);
    i = 0;
    J0x19:

    // End:0x8F [Loop If]
    if(i < ParsedPath.DirectoryParts.Length)
    {
        // End:0x51
        if(CompareNames(ParsedPath.DirectoryParts[i], Parts[0]))
        {
            // [Explicit Break]
            goto J0x8F;
        }
        // End:0x6C
        if(Result != "")
        {
            Result $= GetPathSeparator();
        }
        Result $= ParsedPath.DirectoryParts[i];
        i++;
        // [Loop Continue]
        goto J0x19;
    }
    J0x8F:

    // End:0xAC
    if(i == ParsedPath.DirectoryParts.Length)
    {
        Result = "";
    }
    i = 0;
    J0xB3:

    // End:0xFC [Loop If]
    if(i < Parts.Length)
    {
        // End:0xDE
        if(Result != "")
        {
            Result $= GetPathSeparator();
        }
        Result $= Parts[i];
        i++;
        // [Loop Continue]
        goto J0xB3;
    }
    return Result;
    //return;    
}
