/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path xVoting\Classes\MapVoteHistory_INI.uc
 * Package Imports:
 *	xVoting
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:9
 *
 *******************************************************************************/
class MapVoteHistory_INI extends MapVoteHistory
    config(MapVoteHistory)
    perobjectconfig;

var config array<MapHistoryInfo> H;
var config int LastMapIndex;
var bool bUpdated;

function AddMap(MapHistoryInfo mapInfo)
{
    local int X;

    // End:0x13
    if(mapInfo.M == "")
    {
        return;
    }
    bUpdated = true;
    // End:0x9c
    if(LastMapIndex == -1)
    {
        H.Insert(0, 1);
        H[0].M = mapInfo.M;
        H[0].P = 0;
        H[0].S = 0;
        H[0].G = mapInfo.G;
        H[0].U = mapInfo.U;
        LastMapIndex = 0;
        return;
    }
    X = 0;
    J0xa3:
    // End:0x1c0 [While If]
    if(X <= LastMapIndex)
    {
        // End:0x109
        if(mapInfo.M ~= H[X].M)
        {
            H[X].G = mapInfo.G;
            H[X].U = mapInfo.U;
            return;
        }
        // End:0x1b6
        if(Caps(H[X].M) > Caps(mapInfo.M))
        {
            H.Insert(X, 1);
            ++ LastMapIndex;
            H[X].M = mapInfo.M;
            H[X].P = 0;
            H[X].S = 0;
            H[X].G = mapInfo.G;
            H[X].U = mapInfo.U;
            return;
        }
        ++ X;
        // This is an implied JumpToken; Continue!
        goto J0xa3;
    }
    ++ LastMapIndex;
    H.Insert(LastMapIndex, 1);
    H[LastMapIndex].M = mapInfo.M;
    H[LastMapIndex].P = 0;
    H[LastMapIndex].S = 0;
    H[LastMapIndex].G = mapInfo.G;
    H[LastMapIndex].U = mapInfo.U;
    return;
}

function MapHistoryInfo PlayMap(string MapName)
{
    local int X, Y;
    local bool bFound;
    local MapHistoryInfo mapInfo;

    // End:0x12
    if(MapName == "")
    {
        return mapInfo;
    }
    bUpdated = true;
    // End:0x3c
    if(LastMapIndex > H.Length - 1)
    {
        LastMapIndex = H.Length - 1;
    }
    // End:0xb9
    if(LastMapIndex == -1)
    {
        H.Insert(0, 1);
        H[0].M = MapName;
        H[0].P = 1;
        H[0].S = 1;
        H[0].G = "";
        H[0].U = "";
        LastMapIndex = 0;
        mapInfo = H[0];
        return mapInfo;
    }
    bFound = false;
    X = 0;
    J0xc8:
    // End:0x264 [While If]
    if(X <= LastMapIndex)
    {
        // End:0x131
        if(MapName ~= H[X].M)
        {
            H[X].S = 1;
            ++ H[X].P;
            mapInfo = H[X];
            bFound = true;
        }
        // End:0x159
        else
        {
            // End:0x159
            if(H[X].S > 0)
            {
                ++ H[X].S;
            }
        }
        // End:0x25a
        if(Caps(H[X].M) > Caps(MapName) && !bFound)
        {
            H.Insert(X, 1);
            ++ LastMapIndex;
            Y = LastMapIndex;
            J0x1a2:
            // End:0x1e3 [While If]
            if(Y > X)
            {
                // End:0x1d9
                if(H[Y].S > 0)
                {
                    ++ H[Y].S;
                }
                -- Y;
                // This is an implied JumpToken; Continue!
                goto J0x1a2;
            }
            H[X].M = MapName;
            H[X].P = 1;
            H[X].S = 1;
            H[X].G = "";
            H[X].U = "";
            mapInfo = H[X];
            return mapInfo;
        }
        ++ X;
        // This is an implied JumpToken; Continue!
        goto J0xc8;
    }
    // End:0x2f3
    if(!bFound)
    {
        ++ LastMapIndex;
        H.Insert(LastMapIndex, 1);
        H[LastMapIndex].M = MapName;
        H[LastMapIndex].P = 1;
        H[LastMapIndex].S = 1;
        H[LastMapIndex].G = "";
        H[LastMapIndex].U = "";
        mapInfo = H[LastMapIndex];
    }
    return mapInfo;
}

function MapHistoryInfo GetMapHistory(string MapName)
{
    local int Index;
    local MapHistoryInfo mapInfo;

    Index = FindIndex(MapName);
    // End:0x43
    if(Index > -1 && Index < H.Length)
    {
        mapInfo = H[Index];
    }
    return mapInfo;
}

function Save()
{
    // End:0x0c
    if(bUpdated)
    {
        SaveConfig();
    }
    bUpdated = false;
}

function RemoveOldestMap()
{
    local int X, Lowest;

    bUpdated = true;
    Lowest = 1;
    X = 2;
    J0x17:
    // End:0x60 [While If]
    if(X <= LastMapIndex)
    {
        // End:0x56
        if(H[X].S < H[Lowest].S)
        {
            Lowest = X;
        }
        ++ X;
        // This is an implied JumpToken; Continue!
        goto J0x17;
    }
    RemoveMapByIndex(Lowest);
}

function RemoveMap(string MapName)
{
    local int Index;

    bUpdated = true;
    Index = FindIndex(MapName);
    // End:0x2f
    if(Index > 0)
    {
        RemoveMapByIndex(Index);
    }
}

function RemoveMapByIndex(int Index)
{
    bUpdated = true;
    H.Remove(Index, 1);
    -- LastMapIndex;
}

function int FindIndex(string MapName)
{
    local int A, B, i;

    // End:0x15
    if(LastMapIndex == -1)
    {
        return -1;
    }
    A = 1;
    B = LastMapIndex + 1;
    J0x2a:
    // End:0xe0 [While If]
    if(true)
    {
        i = B - A / 2 + A;
        // End:0x71
        if(H[i - 1].M ~= MapName)
        {
            return i - 1;
        }
        // End:0x86
        if(A == B)
        {
            return -1;
        }
        // End:0xb5
        if(Caps(H[i - 1].M) > Caps(MapName))
        {
            B = i;
        }
        // End:0xdd
        else
        {
            // End:0xd2
            if(A == i)
            {
                A = B;
            }
            // End:0xdd
            else
            {
                A = i;
            }
        }
        // This is an implied JumpToken; Continue!
        goto J0x2a;
    }
}

function Swap(int A, int B)
{
    local MapHistoryInfo mapInfo;

    mapInfo = H[A];
    H[A] = H[B];
    H[B] = mapInfo;
}

defaultproperties
{
    LastMapIndex=-1
}