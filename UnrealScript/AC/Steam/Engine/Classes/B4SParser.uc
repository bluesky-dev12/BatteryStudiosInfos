/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\B4SParser.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class B4SParser extends PlaylistParserBase within StreamPlaylistManager
    config();

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
    J0x1b:
    // End:0x18b [While If]
    if(i < Lines.Length)
    {
        // End:0x66
        if(InStr(Lines[i], "</playlist>") != -1 || Lines[i] == "")
        {
        }
        // End:0x18b
        else
        {
            // End:0x105
            if(PlaylistName == "")
            {
                pos = InStr(Lines[i], "num_entries");
                // End:0xa4
                if(pos == -1)
                {
                }
                // End:0x181
                else
                {
                    pos = InStr(Lines[i], "label");
                    // End:0xe4
                    if(pos == -1)
                    {
                        PlaylistName = Outer.DefaultPlaylistName;
                    }
                    // End:0x181
                    else
                    {
                        PlaylistName = GetValue(Mid(Lines[i], pos));
                        // This is an implied JumpToken;
                        goto J0x181;
                    }
                    // End:0x181
                    if(InStr(Lines[i], "<entry ") != -1)
                    {
                        str = GetValue(Lines[i]);
                        // End:0x162
                        if(str == "" || Left(str, 5) != "file:")
                        {
                        }
                        // End:0x181
                        else
                        {
                            Paths[Paths.Length] = HtmlDecode(Mid(str, 5));
                            // This is an implied JumpToken;
                            goto J0x181;
                        }
                    }
                }
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x1b;
        }
    }
}
