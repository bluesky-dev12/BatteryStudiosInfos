class PlaylistParserBase extends StreamInterface within StreamPlaylistManager
    config;

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
    //return;    
}

function SetType(StreamBase.EStreamPlaylistType InType)
{
    // End:0x12
    if(int(Type) != int(0))
    {
        return;
    }
    Type = InType;
    //return;    
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
    //return;    
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

    // End:0xD1 [Loop If]
    if(i >= 0)
    {
        Outer.InsertInPlaylist(PlaylistIndex, InsertPosition, Paths[i], i > 0);
        i--;
        // [Loop Continue]
        goto J0x90;
    }
    Outer.Save();
    //return;    
}

function ParseLines()
{
    Paths.Remove(0, Paths.Length);
    //return;    
}

static function string GetValue(string KeyValuePair, optional bool bAllowSpaces)
{
    local int i;
    local string str;

    i = InStr(KeyValuePair, "=");
    // End:0xD1
    if(i != -1)
    {
        str = Mid(KeyValuePair, i + 1);
        // End:0x8D
        if(Left(str, 1) == "\"")
        {
            str = Mid(str, 1);
            i = RevInStr(str, "\"");
            // End:0x87
            if(i != -1)
            {
                str = Left(str, i);
            }
            return str;
        }
        i = InStr(str, " ");
        // End:0xCB
        if((i != -1) && !bAllowSpaces)
        {
            str = Left(str, i);
        }
        return str;
    }
    return "";
    //return;    
}

static function string GetTagged(out string Text)
{
    local string Tag;
    local int opos, cpos;

    opos = InStr(Text, "<");
    // End:0xCB
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
        opos = InStr(Locs(Text), ("</" $ Locs(Tag)) $ ">");
        // End:0xB3
        if(opos == -1)
        {
            return Tag;
        }
        Text = Left(Text, opos);
        return Tag;
    }
    return "";
    //return;    
}

static function string HtmlDecode(string Src)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x4E [Loop If]
    if(i < default.SpecialChars.Length)
    {
        Src = Repl(Src, default.SpecialChars[i].Coded, default.SpecialChars[i].Plain);
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return Src;
    //return;    
}

defaultproperties
{
    SpecialChars[0]=(Plain="&",Coded="&amp;")
    SpecialChars[1]=(Plain="\"",Coded="&quot;")
    SpecialChars[2]=(Plain=" ",Coded="&nbsp;")
    SpecialChars[3]=(Plain="<",Coded="&lt;")
    SpecialChars[4]=(Plain=">",Coded="&gt;")
    SpecialChars[5]=(Plain="©",Coded="&copy;")
    SpecialChars[6]=(Plain="™",Coded="&#8482;")
    SpecialChars[7]=(Plain="®",Coded="&reg;")
    SpecialChars[8]=(Plain="'",Coded="&apos;")
}