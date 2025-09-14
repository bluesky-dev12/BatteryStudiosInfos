/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\PlaylistParserBase.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:5
 *	Functions:8
 *
 *******************************************************************************/
class PlaylistParserBase extends StreamInterface within StreamPlaylistManager
    config();

struct HtmlChar
{
    var string Plain;
    var string Coded;
};

var private StreamBase.EStreamPlaylistType Type;
var string PlaylistName;
var array<string> Paths;
var array<string> Lines;
var array<HtmlChar> SpecialChars;

function StreamBase.EStreamPlaylistType GetType()
{
    return Type;
}

function SetType(StreamBase.EStreamPlaylistType InType)
{
    // End:0x12
    if(Type != 0)
    {
        return;
    }
    Type = InType;
}

function bool Import(int PlaylistIndex, int InsertPosition, string Path)
{
    // End:0x37
    if(Outer.FileManager.LoadPlaylist(Path, Lines))
    {
        ImportedPlaylist(PlaylistIndex, InsertPosition);
        return true;
    }
    return false;
}

function ImportedPlaylist(int PlaylistIndex, int InsertPosition)
{
    local StreamPlaylist Playlist;
    local int i;

    ParseLines();
    // End:0x39
    if(!Outer.ValidIndex(PlaylistIndex))
    {
        PlaylistIndex = Outer.AddPlaylist(PlaylistName);
    }
    Playlist = Outer.Playlists[PlaylistIndex];
    // End:0x81
    if(!Playlist.ValidStreamIndex(InsertPosition))
    {
        InsertPosition = Playlist.GetPlaylistLength();
    }
    i = Paths.Length - 1;
    J0x90:
    // End:0xd1 [While If]
    if(i >= 0)
    {
        Outer.InsertInPlaylist(PlaylistIndex, InsertPosition, Paths[i], i > 0);
        -- i;
        // This is an implied JumpToken; Continue!
        goto J0x90;
    }
    Outer.Save();
}

function ParseLines()
{
    Paths.Remove(0, Paths.Length);
}

static function string GetValue(string KeyValuePair, optional bool bAllowSpaces)
{
    local int i;
    local string str;

    i = InStr(KeyValuePair, "=");
    // End:0xd1
    if(i != -1)
    {
        str = Mid(KeyValuePair, i + 1);
        // End:0x8d
        if(Left(str, 1) == "\\"")
        {
            str = Mid(str, 1);
            i = RevInStr(str, "\\"");
            // End:0x87
            if(i != -1)
            {
                str = Left(str, i);
            }
            return str;
        }
        i = InStr(str, " ");
        // End:0xcb
        if(i != -1 && !bAllowSpaces)
        {
            str = Left(str, i);
        }
        return str;
    }
    return "";
}

static function string GetTagged(out string Text)
{
    local string Tag;
    local int opos, cpos;

    opos = InStr(Text, "<");
    // End:0xcb
    if(opos != -1)
    {
        Text = Mid(Text, opos + 1);
        cpos = InStr(Text, ">");
        // End:0x56
        if(cpos == -1)
        {
            return "";
        }
        Tag = Left(Text, cpos);
        Text = Mid(Text, cpos + 1);
        opos = InStr(Locs(Text), "</" $ Locs(Tag) $ ">");
        // End:0xb3
        if(opos == -1)
        {
            return Tag;
        }
        Text = Left(Text, opos);
        return Tag;
    }
    return "";
}

static function string HtmlDecode(string Src)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x4e [While If]
    if(i < default.SpecialChars.Length)
    {
        Src = Repl(Src, default.SpecialChars[i].Coded, default.SpecialChars[i].Plain);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return Src;
}

defaultproperties
{
    SpecialChars=// Object reference not set to an instance of an object.
    
}