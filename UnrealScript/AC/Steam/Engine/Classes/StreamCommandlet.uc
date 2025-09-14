/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\StreamCommandlet.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:3
 *
 *******************************************************************************/
class StreamCommandlet extends Commandlet
    transient;

event int Main(string Parms)
{
    local string Src, Match;

    // End:0x1b
    if(!Divide(Parms, ";", Src, Match))
    {
        return 0;
    }
    Log("Source '" $ Src $ "'   Match '" $ Match $ "'");
    Log("Result of reverse search is" @ string(RevInStr(Src, Match)));
    Log("");
    chart(Src);
    return 0;
}

function chart(string Src)
{
    local int i, j, k;
    local string S, t;

    i = 0;
    J0x07:
    // End:0x80 [While If]
    if(i < Len(Src))
    {
        j = int(float(i) % float(10));
        // End:0x5a
        if(j == 0)
        {
            k = i / 10;
            t $= string(k);
        }
        // End:0x66
        else
        {
            t $= " ";
        }
        S $= string(j);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    Log(Src);
    Log(S);
    Log(t);
}

function int RevInStr(string Src, string Match)
{
    local int pos, i;
    local string S;

    // End:0x20
    if(Src == "" || Match == "")
    {
        return -1;
    }
    S = Src;
    i = InStr(S, Match);
    pos += i;
    S = Mid(Src, pos + 1);
    i = InStr(S, Match) + 1;
    // End:0x3d
    if(i == 0)
    	goto J0x3d;
    return pos;
}
