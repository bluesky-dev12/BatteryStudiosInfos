/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\ScoreBoard.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:16
 *
 *******************************************************************************/
class ScoreBoard extends Info
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    notplaceable;

var() GameReplicationInfo GRI;
var() class<HUD> HudClass;
var bool bDisplayMessages;
var HUD HudOwner;

simulated function PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    InitGRI();
    Init();
}

function Font GetSmallerFontFor(Canvas Canvas, int offset)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x69 [While If]
    if(i < 8 - offset)
    {
        // End:0x5f
        if(float(HudClass.default.FontScreenWidthMedium[i]) <= Canvas.ClipX)
        {
            return HudClass.static.LoadFontStatic(i + offset);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return HudClass.static.LoadFontStatic(8);
}

function bool HaveHalfFont(Canvas Canvas, int offset)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x4f [While If]
    if(i < 9 - offset)
    {
        // End:0x45
        if(float(HudClass.default.FontScreenWidthSmall[i]) <= Canvas.ClipX)
        {
            return true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return false;
}

function Font GetSmallFontFor(int ScreenWidth, int offset)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x5e [While If]
    if(i < 8 - offset)
    {
        // End:0x54
        if(HudClass.default.FontScreenWidthSmall[i] <= ScreenWidth)
        {
            return HudClass.static.LoadFontStatic(i + offset);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return HudClass.static.LoadFontStatic(8);
}

simulated function InitGRI()
{
    GRI = PlayerController(Owner).GameReplicationInfo;
}

simulated function string InitTitle()
{
    return Caps(GRI.GameName);
}

simulated function Init();
simulated event DrawScoreboard(Canvas C)
{
    UpdateGRI();
    UpdateScoreBoard(C);
}

simulated event DrawGMUserBoard(Canvas C)
{
    UpdateGRI();
}

simulated event DrawMiniMap(Canvas C)
{
    UpdateGRI();
    UpdateScoreBoard(C);
}

function bool UpdateGRI()
{
    // End:0x1e
    if(GRI == none)
    {
        InitGRI();
        // End:0x1e
        if(GRI == none)
        {
            return false;
        }
    }
    SortPRIArray();
    return true;
}

simulated function string FormatTime(int Seconds)
{
    local int Minutes, Hours;
    local string Time;

    // End:0x46
    if(Seconds > 3600)
    {
        Hours = Seconds / 3600;
        Seconds -= Hours * 3600;
        Time = string(Hours) $ ":";
    }
    Minutes = Seconds / 60;
    Seconds -= Minutes * 60;
    // End:0x8d
    if(Minutes >= 10)
    {
        Time = Time $ string(Minutes) $ ":";
    }
    // End:0xab
    else
    {
        Time = Time $ "0" $ string(Minutes) $ ":";
    }
    // End:0xce
    if(Seconds >= 10)
    {
        Time = Time $ string(Seconds);
    }
    // End:0xe7
    else
    {
        Time = Time $ "0" $ string(Seconds);
    }
    return Time;
}

simulated function UpdateScoreBoard(Canvas Canvas);
simulated function bool InOrder(PlayerReplicationInfo P1, PlayerReplicationInfo P2)
{
    // End:0x2e
    if(P1.bOnlySpectator)
    {
        // End:0x29
        if(P2.bOnlySpectator)
        {
            return true;
        }
        // End:0x2b
        else
        {
            return false;
        }
    }
    // End:0x42
    else
    {
        // End:0x42
        if(P2.bOnlySpectator)
        {
            return true;
        }
    }
    // End:0x68
    if(P1.Score < P2.Score)
    {
        return false;
    }
    // End:0x13a
    else
    {
        // End:0x13a
        if(P1.Score == P2.Score)
        {
            // End:0xaf
            if(P1.Kills < P2.Kills)
            {
                return false;
            }
            // End:0x13a
            else
            {
                // End:0x13a
                if(P1.Kills == P2.Kills)
                {
                    // End:0xf6
                    if(P1.Assists < P2.Assists)
                    {
                        return false;
                    }
                    // End:0x13a
                    else
                    {
                        // End:0x13a
                        if(P1.Assists == P2.Assists)
                        {
                            // End:0x13a
                            if(P1.Deaths > P2.Deaths)
                            {
                                return false;
                            }
                        }
                    }
                }
            }
        }
    }
    return true;
}

simulated function SortPRIArray()
{
    local int i, j;
    local PlayerReplicationInfo tmp;

    i = 0;
    J0x07:
    // End:0xee [While If]
    if(i < GRI.PRIArray.Length - 1)
    {
        j = i + 1;
        J0x31:
        // End:0xe4 [While If]
        if(j < GRI.PRIArray.Length)
        {
            // End:0xda
            if(!InOrder(GRI.PRIArray[i], GRI.PRIArray[j]))
            {
                tmp = GRI.PRIArray[i];
                GRI.PRIArray[i] = GRI.PRIArray[j];
                GRI.PRIArray[j] = tmp;
            }
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0x31;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function NextStats();

defaultproperties
{
    HudClass=class'HUD'
}