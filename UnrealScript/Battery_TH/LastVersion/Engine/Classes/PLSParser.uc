class PLSParser extends PlaylistParserBase within StreamPlaylistManager
    config;

function ParseLines()
{
    local int i;

    super.ParseLines();
    // End:0x14
    if(Lines.Length == 0)
    {
        return;
    }
    i = 0;
    J0x1B:

    // End:0xF4 [Loop If]
    if(i < Lines.Length)
    {
        // End:0x58
        if((Left(Lines[i], 1) == "[") || Lines[i] == "")
        {
            // [Explicit Continue]
            goto J0xEA;
        }
        // End:0xB1
        if((PlaylistName == "") && Left(Lines[i], InStr(Lines[i], "=")) ~= "PlaylistName")
        {
            PlaylistName = GetValue(Lines[i], true);
            // [Explicit Continue]
            goto J0xEA;
        }
        // End:0xEA
        if(Left(Lines[i], 4) ~= "File")
        {
            Paths[Paths.Length] = GetValue(Lines[i], true);
        }
        J0xEA:

        i++;
        // [Loop Continue]
        goto J0x1B;
    }
    //return;    
}
