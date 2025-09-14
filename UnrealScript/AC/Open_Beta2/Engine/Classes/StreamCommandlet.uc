class StreamCommandlet extends Commandlet
    transient;

event int Main(string Parms)
{
    local string Src, Match;

    // End:0x1B
    if(!Divide(Parms, ";", Src, Match))
    {
        return 0;
    }
    Log(((("Source '" $ Src) $ "'   Match '") $ Match) $ "'");
    Log("Result of reverse search is" @ string(RevInStr(Src, Match)));
    Log("");
    chart(Src);
    return 0;
    //return;    
}

function chart(string Src)
{
    local int i, j, k;
    local string S, t;

    i = 0;
    J0x07:

    // End:0x80 [Loop If]
    if(i < Len(Src))
    {
        j = int(float(i) % float(10));
        // End:0x5A
        if(j == 0)
        {
            k = i / 10;
            t $= string(k);            
        }
        else
        {
            t $= " ";
        }
        S $= string(j);
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    Log(Src);
    Log(S);
    Log(t);
    //return;    
}

function int RevInStr(string Src, string Match)
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
