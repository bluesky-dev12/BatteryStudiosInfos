/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\PLSParser.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class PLSParser extends PlaylistParserBase within StreamPlaylistManager
    config();

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
    J0x1b:
    // End:0xf4 [While If]
    if(i < Lines.Length)
    {
        // End:0x58
        if(Left(Lines[i], 1) == "[" || Lines[i] == "")
        {
        }
        // End:0xea
        else
        {
            // End:0xb1
            if(PlaylistName == "" && Left(Lines[i], InStr(Lines[i], "=")) ~= "PlaylistName")
            {
                PlaylistName = GetValue(Lines[i], true);
            }
            // End:0xea
            else
            {
                // End:0xea
                if(Left(Lines[i], 4) ~= "File")
                {
                    Paths[Paths.Length] = GetValue(Lines[i], true);
                }
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1b;
    }
}
