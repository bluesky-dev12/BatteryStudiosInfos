class ScoreBoard extends Info
    notplaceable
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var() GameReplicationInfo GRI;
var() Class<HUD> HudClass;
var bool bDisplayMessages;
var HUD HudOwner;

simulated function PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    InitGRI();
    Init();
    //return;    
}

function Font GetSmallerFontFor(Canvas Canvas, int offset)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x69 [Loop If]
    if(i < (8 - offset))
    {
        // End:0x5F
        if(float(HudClass.default.FontScreenWidthMedium[i]) <= Canvas.ClipX)
        {
            return HudClass.static.LoadFontStatic(i + offset);
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return HudClass.static.LoadFontStatic(8);
    //return;    
}

function bool HaveHalfFont(Canvas Canvas, int offset)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x4F [Loop If]
    if(i < (9 - offset))
    {
        // End:0x45
        if(float(HudClass.default.FontScreenWidthSmall[i]) <= Canvas.ClipX)
        {
            return true;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return false;
    //return;    
}

function Font GetSmallFontFor(int ScreenWidth, int offset)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x5E [Loop If]
    if(i < (8 - offset))
    {
        // End:0x54
        if(HudClass.default.FontScreenWidthSmall[i] <= ScreenWidth)
        {
            return HudClass.static.LoadFontStatic(i + offset);
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return HudClass.static.LoadFontStatic(8);
    //return;    
}

simulated function InitGRI()
{
    GRI = PlayerController(Owner).GameReplicationInfo;
    //return;    
}

simulated function string InitTitle()
{
    return Caps(GRI.GameName);
    //return;    
}

simulated function Init()
{
    //return;    
}

simulated event DrawScoreboard(Canvas C)
{
    UpdateGRI();
    UpdateScoreBoard(C);
    //return;    
}

simulated event DrawGMUserBoard(Canvas C)
{
    UpdateGRI();
    //return;    
}

simulated event DrawMiniMap(Canvas C)
{
    UpdateGRI();
    UpdateScoreBoard(C);
    //return;    
}

function bool UpdateGRI()
{
    // End:0x1E
    if(GRI == none)
    {
        InitGRI();
        // End:0x1E
        if(GRI == none)
        {
            return false;
        }
    }
    SortPRIArray();
    return true;
    //return;    
}

simulated function string FormatTime(int Seconds)
{
    local int Minutes, Hours;
    local string Time;

    // End:0x46
    if(Seconds > 3600)
    {
        Hours = Seconds / 3600;
        Seconds -= (Hours * 3600);
        Time = string(Hours) $ ":";
    }
    Minutes = Seconds / 60;
    Seconds -= (Minutes * 60);
    // End:0x8D
    if(Minutes >= 10)
    {
        Time = (Time $ string(Minutes)) $ ":";        
    }
    else
    {
        Time = ((Time $ "0") $ string(Minutes)) $ ":";
    }
    // End:0xCE
    if(Seconds >= 10)
    {
        Time = Time $ string(Seconds);        
    }
    else
    {
        Time = (Time $ "0") $ string(Seconds);
    }
    return Time;
    //return;    
}

simulated function UpdateScoreBoard(Canvas Canvas)
{
    //return;    
}

simulated function bool InOrder(PlayerReplicationInfo P1, PlayerReplicationInfo P2)
{
    // End:0x2E
    if(P1.bOnlySpectator)
    {
        // End:0x29
        if(P2.bOnlySpectator)
        {
            return true;            
        }
        else
        {
            return false;
        }        
    }
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
    else
    {
        // End:0x13A
        if(P1.Score == P2.Score)
        {
            // End:0xAF
            if(P1.Kills < P2.Kills)
            {
                return false;                
            }
            else
            {
                // End:0x13A
                if(P1.Kills == P2.Kills)
                {
                    // End:0xF6
                    if(P1.Assists < P2.Assists)
                    {
                        return false;                        
                    }
                    else
                    {
                        // End:0x13A
                        if(P1.Assists == P2.Assists)
                        {
                            // End:0x13A
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
    //return;    
}

simulated function SortPRIArray()
{
    local int i, j;
    local PlayerReplicationInfo tmp;

    i = 0;
    J0x07:

    // End:0xEE [Loop If]
    if(i < (GRI.PRIArray.Length - 1))
    {
        j = i + 1;
        J0x31:

        // End:0xE4 [Loop If]
        if(j < GRI.PRIArray.Length)
        {
            // End:0xDA
            if(!InOrder(GRI.PRIArray[i], GRI.PRIArray[j]))
            {
                tmp = GRI.PRIArray[i];
                GRI.PRIArray[i] = GRI.PRIArray[j];
                GRI.PRIArray[j] = tmp;
            }
            j++;
            // [Loop Continue]
            goto J0x31;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function NextStats()
{
    //return;    
}

defaultproperties
{
    HudClass=Class'Engine.HUD'
}