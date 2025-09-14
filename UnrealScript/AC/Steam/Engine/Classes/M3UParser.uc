/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\M3UParser.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:3
 *
 *******************************************************************************/
class M3UParser extends PlaylistParserBase within StreamPlaylistManager
    config();

var FilePath ParsedPath;

function bool Import(int PlaylistIndex, int InsertPosition, string Path)
{
    // End:0x4c
    if(Outer.FileManager.LoadPlaylist(Path, Lines) && ParsePath(Path, ParsedPath))
    {
        ImportedPlaylist(PlaylistIndex, InsertPosition);
        return true;
    }
    return false;
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
    J0x1b:
    // End:0xac [While If]
    if(i < Lines.Length)
    {
        // End:0x58
        if(Left(Lines[i], 1) == "#" || Lines[i] == "")
        {
        }
        // End:0xa2
        else
        {
            str = Lines[i];
            // End:0x8a
            if(Left(str, 1) == GetPathSeparator())
            {
                str = Mid(str, 1);
            }
            Paths[Paths.Length] = MatchPath(str);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1b;
    }
}

function string MatchPath(string str)
{
    local int i;
    local array<string> Parts;
    local string Result;

    Split(str, GetPathSeparator(), Parts);
    i = 0;
    J0x19:
    // End:0x8f [While If]
    if(i < ParsedPath.DirectoryParts.Length)
    {
        // End:0x51
        if(CompareNames(ParsedPath.DirectoryParts[i], Parts[0]))
        {
        }
        // End:0x8f
        else
        {
            // End:0x6c
            if(Result != "")
            {
                Result $= GetPathSeparator();
            }
            Result $= ParsedPath.DirectoryParts[i];
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x19;
        }
    }
    // End:0xac
    if(i == ParsedPath.DirectoryParts.Length)
    {
        Result = "";
    }
    i = 0;
    J0xb3:
    // End:0xfc [While If]
    if(i < Parts.Length)
    {
        // End:0xde
        if(Result != "")
        {
            Result $= GetPathSeparator();
        }
        Result $= Parts[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xb3;
    }
    return Result;
}
