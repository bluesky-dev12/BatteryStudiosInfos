class B4SParser extends PlaylistParserBase within StreamPlaylistManager
    config;

function ParseLines()
{
    local int i, pos;
    local string str;

    super.ParseLines();
    // End:0x14
    if(Lines.Length == 0)
    {
        return;
    }
    i = 0;
    J0x1B:

    // End:0x18B [Loop If]
    if(i < Lines.Length)
    {
        // End:0x66
        if((InStr(Lines[i], "</playlist>") != -1) || Lines[i] == "")
        {
            // [Explicit Break]
            goto J0x18B;
        }
        // End:0x105
        if(PlaylistName == "")
        {
            pos = InStr(Lines[i], "num_entries");
            // End:0xA4
            if(pos == -1)
            {
                // [Explicit Continue]
                goto J0x181;
            }
            pos = InStr(Lines[i], "label");
            // End:0xE4
            if(pos == -1)
            {
                PlaylistName = Outer.DefaultPlaylistName;
                // [Explicit Continue]
                goto J0x181;
            }
            PlaylistName = GetValue(Mid(Lines[i], pos));
            // [Explicit Continue]
            goto J0x181;
        }
        // End:0x181
        if(InStr(Lines[i], "<entry ") != -1)
        {
            str = GetValue(Lines[i]);
            // End:0x162
            if((str == "") || Left(str, 5) != "file:")
            {
                // [Explicit Continue]
                goto J0x181;
            }
            Paths[Paths.Length] = HtmlDecode(Mid(str, 5));
            // [Explicit Continue]
        }
        J0x181:

        i++;
        // [Loop Continue]
        goto J0x1B;
    }
    J0x18B:

    //return;    
}
