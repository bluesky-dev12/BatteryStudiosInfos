class ClanMarkManager extends Object;

struct sClanNameAndMark
{
    var string ClanName;
    var int Pattern;
    var int BG;
    var int BL;
    var bool bClanLF;
    var int ClanLevel;
};

var array<ClanNameAndMark> ClanMarkList;
var float Phase;
var float AccumDelta;
var float BlendingFadeIn;
var float BlendingFadeOut;
var wGameManager GameMgr;
var Image ex_clanmark;
var Image ex_clanmark_01;
var Image ex_clanmark_02;

function Tick(float Delta)
{
    AccumDelta += Delta;
    switch(Phase)
    {
        // End:0x42
        case 0.0000000:
            // End:0x3F
            if(AccumDelta >= float(7))
            {
                AccumDelta = 0.0000000;
                Phase = 1.0000000;
            }
            // End:0xD0
            break;
        // End:0x70
        case 1.0000000:
            // End:0x6D
            if(AccumDelta >= float(1))
            {
                AccumDelta = 0.0000000;
                Phase = 2.0000000;
            }
            // End:0xD0
            break;
        // End:0x9F
        case 2.0000000:
            // End:0x9C
            if(AccumDelta >= float(3))
            {
                AccumDelta = 0.0000000;
                Phase = 3.0000000;
            }
            // End:0xD0
            break;
        // End:0xCD
        case 3.0000000:
            // End:0xCA
            if(AccumDelta >= float(1))
            {
                AccumDelta = 0.0000000;
                Phase = 0.0000000;
            }
            // End:0xD0
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function Init(wGameManager gm)
{
    GameMgr = gm;
    ex_clanmark = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeImage(32, 32, 28, Material(DynamicLoadObject("Warfare_UI_Clan.Clan_Mark.ex_clanmark", Class'Engine_Decompressed.Material')));
    ex_clanmark_01 = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeImage(32, 32, 28, Material(DynamicLoadObject("Warfare_UI_Clan.Clan_Mark.ex_clanmark_01_GP", Class'Engine_Decompressed.Material')));
    ex_clanmark_02 = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeImage(32, 32, 28, Material(DynamicLoadObject("Warfare_UI_Clan.Clan_Mark.ex_clanmark_02_GP", Class'Engine_Decompressed.Material')));
    //return;    
}

function bool SetClanState(string ClanName, bool bClanLF)
{
    local int Index;

    // End:0x0E
    if(ClanName == "")
    {
        return false;
    }
    Index = FindClanMark(ClanName);
    // End:0x48
    if(Index >= 0)
    {
        ClanMarkList[Index].bClanLF = bClanLF;
        return true;
    }
    return false;
    //return;    
}

function bool AddClanMark(string ClanName, int Pattern, int BG, int BL, optional bool bSetClanState, optional bool bClanLF)
{
    local int Index;
    local ClanNameAndMark cnam;

    // End:0x0E
    if(ClanName == "")
    {
        return false;
    }
    Index = FindClanMark(ClanName);
    // End:0x202
    if(Index >= 0)
    {
        Log(((((((((((((("[CMM::AddClanMark] Replace ClanName=" $ ClanName) $ ", (") $ string(ClanMarkList[Index].Pattern)) $ ", ") $ string(ClanMarkList[Index].BG)) $ ", ") $ string(ClanMarkList[Index].BL)) $ ")->(") $ string(Pattern)) $ ", ") $ string(BG)) $ ", ") $ string(BL)) $ ")");
        // End:0x112
        if((Pattern != 0) && BG == 0)
        {
            Log("!!! uhauha !!!");
        }
        ClanMarkList[Index].Pattern = Pattern;
        ClanMarkList[Index].BG = BG;
        ClanMarkList[Index].BL = BL;
        ClanMarkList[Index].Pattern_Img = GameMgr.GetClanMark32(Pattern);
        ClanMarkList[Index].BG_Img = GameMgr.GetClanMark32(BG);
        ClanMarkList[Index].BL_Img = GameMgr.GetClanMark32(BL);
        // End:0x200
        if(bSetClanState)
        {
            ClanMarkList[Index].bClanLF = bClanLF;
        }
        return true;
    }
    Index = FindClanMark_ForInsertLocation(ClanName);
    // End:0x3B2
    if(Index >= 0)
    {
        Log(((((((("[CMM::AddClanMark] Add ClanName=" $ ClanName) $ ", (") $ string(Pattern)) $ ", ") $ string(BG)) $ ", ") $ string(BL)) $ ")");
        ClanMarkList.Insert(Index, 1);
        cnam = new Class'Engine_Decompressed.ClanNameAndMark';
        ClanMarkList[Index] = cnam;
        ClanMarkList[Index].ClanName = ClanName;
        ClanMarkList[Index].Pattern = Pattern;
        ClanMarkList[Index].BG = BG;
        ClanMarkList[Index].BL = BL;
        // End:0x335
        if(bSetClanState)
        {
            ClanMarkList[Index].bClanLF = bClanLF;
        }
        ClanMarkList[Index].Pattern_Img = GameMgr.GetClanMark32(Pattern);
        ClanMarkList[Index].BG_Img = GameMgr.GetClanMark32(BG);
        ClanMarkList[Index].BL_Img = GameMgr.GetClanMark32(BL);
        return true;
    }
    return false;
    //return;    
}

function bool SetClanLevel(string ClanName, int ClanLevel)
{
    local int Index;

    // End:0x0E
    if(ClanName == "")
    {
        return false;
    }
    Index = FindClanMark(ClanName);
    // End:0x2C
    if(Index < 0)
    {
        return false;
    }
    // End:0x3E
    if(ClanLevel < 0)
    {
        ClanLevel = 0;
    }
    ClanMarkList[Index].ClanLevel = ClanLevel;
    ClanMarkList[Index].ClanLevel_Img = GameMgr.GetClanLevelImage(ClanLevel);
    return true;
    //return;    
}

function bool RemoveClanMark(string ClanName)
{
    local int i;

    // End:0x0E
    if(ClanName == "")
    {
        return false;
    }
    i = 0;
    J0x15:

    // End:0x5B [Loop If]
    if(i < ClanMarkList.Length)
    {
        // End:0x51
        if(ClanMarkList[i].ClanName == ClanName)
        {
            ClanMarkList.Remove(i, 1);
            return true;
        }
        i++;
        // [Loop Continue]
        goto J0x15;
    }
    return false;
    //return;    
}

function int FindClanMark_ForInsertLocation(string ClanName)
{
    local int i;

    // End:0x12
    if(ClanName == "")
    {
        return -1;
    }
    // End:0x20
    if(ClanMarkList.Length <= 0)
    {
        return 0;
    }
    i = 0;
    J0x27:

    // End:0x65 [Loop If]
    if(i < ClanMarkList.Length)
    {
        // End:0x5B
        if(ClanMarkList[i].ClanName >= ClanName)
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x27;
    }
    return ClanMarkList.Length;
    //return;    
}

function int FindClanMark(string ClanName)
{
    // End:0x12
    if(ClanName == "")
    {
        return -1;
    }
    // End:0x24
    if(ClanMarkList.Length <= 0)
    {
        return -1;
    }
    return FindClanMark_Inner(ClanName, 0, ClanMarkList.Length - 1);
    //return;    
}

function int FindClanMark_Inner(string ClanName, int Left, int Right)
{
    local int Mid;

    // End:0x60
    if((Right - Left) <= 1)
    {
        // End:0x36
        if(ClanName == ClanMarkList[Left].ClanName)
        {
            return Left;
        }
        // End:0x5A
        if(ClanName == ClanMarkList[Right].ClanName)
        {
            return Right;
        }
        return -1;
    }
    Mid = (Right + Left) / 2;
    // End:0x9D
    if(ClanName == ClanMarkList[Mid].ClanName)
    {
        return Mid;        
    }
    else
    {
        // End:0xD4
        if(ClanName < ClanMarkList[Mid].ClanName)
        {
            return FindClanMark_Inner(ClanName, Left, Mid);            
        }
        else
        {
            // End:0x108
            if(ClanName > ClanMarkList[Mid].ClanName)
            {
                return FindClanMark_Inner(ClanName, Mid, Right);
            }
        }
    }
    return -1;
    //return;    
}

function Render(Canvas C, int X1, int Y1, int X2, int Y2, string ClanName)
{
    local int Index;

    Index = FindClanMark(ClanName);
    // End:0x7FD
    if(Index >= 0)
    {
        // End:0x657
        if(ClanMarkList[Index].bClanLF)
        {
            switch(Phase)
            {
                // End:0x1EC
                case 0.0000000:
                    // End:0xD9
                    if(ClanMarkList[Index].Pattern == 0)
                    {
                        Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawImage(C, ex_clanmark, float(X1), float(Y1), float(X2), float(Y2));
                        Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawImage(C, ClanMarkList[Index].ClanLevel_Img, float(X1), float(Y1), float(X2), float(Y2));                        
                    }
                    else
                    {
                        Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawImage(C, ClanMarkList[Index].BL_Img, float(X1), float(Y1), float(X2), float(Y2));
                        Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawImage(C, ClanMarkList[Index].BG_Img, float(X1), float(Y1), float(X2), float(Y2));
                        Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawImage(C, ClanMarkList[Index].Pattern_Img, float(X1), float(Y1), float(X2), float(Y2));
                        Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawImage(C, ClanMarkList[Index].ClanLevel_Img, float(X1), float(Y1), float(X2), float(Y2));
                    }
                    // End:0x654
                    break;
                // End:0x41F
                case 1.0000000:
                    Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawImage_Alpha(C, ex_clanmark_01, float(X1), float(Y1), float(X2), float(Y2), AccumDelta);
                    // End:0x2DC
                    if(ClanMarkList[Index].Pattern == 0)
                    {
                        Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawImage_Alpha(C, ex_clanmark, float(X1), float(Y1), float(X2), float(Y2), 1.0000000 - AccumDelta);
                        Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawImage_Alpha(C, ClanMarkList[Index].ClanLevel_Img, float(X1), float(Y1), float(X2), float(Y2), 1.0000000 - AccumDelta);                        
                    }
                    else
                    {
                        Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawImage_Alpha(C, ClanMarkList[Index].BL_Img, float(X1), float(Y1), float(X2), float(Y2), 1.0000000 - AccumDelta);
                        Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawImage_Alpha(C, ClanMarkList[Index].BG_Img, float(X1), float(Y1), float(X2), float(Y2), 1.0000000 - AccumDelta);
                        Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawImage_Alpha(C, ClanMarkList[Index].Pattern_Img, float(X1), float(Y1), float(X2), float(Y2), 1.0000000 - AccumDelta);
                        Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawImage_Alpha(C, ClanMarkList[Index].ClanLevel_Img, float(X1), float(Y1), float(X2), float(Y2), 1.0000000 - AccumDelta);
                    }
                    // End:0x654
                    break;
                // End:0x45F
                case 2.0000000:
                    Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawImage(C, ex_clanmark_01, float(X1), float(Y1), float(X2), float(Y2));
                    // End:0x654
                    break;
                // End:0x651
                case 3.0000000:
                    // End:0x4FD
                    if(ClanMarkList[Index].Pattern == 0)
                    {
                        Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawImage(C, ex_clanmark, float(X1), float(Y1), float(X2), float(Y2));
                        Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawImage(C, ClanMarkList[Index].ClanLevel_Img, float(X1), float(Y1), float(X2), float(Y2));                        
                    }
                    else
                    {
                        Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawImage(C, ClanMarkList[Index].BL_Img, float(X1), float(Y1), float(X2), float(Y2));
                        Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawImage(C, ClanMarkList[Index].BG_Img, float(X1), float(Y1), float(X2), float(Y2));
                        Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawImage(C, ClanMarkList[Index].Pattern_Img, float(X1), float(Y1), float(X2), float(Y2));
                        Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawImage(C, ClanMarkList[Index].ClanLevel_Img, float(X1), float(Y1), float(X2), float(Y2));
                    }
                    Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawImage_Alpha(C, ex_clanmark_01, float(X1), float(Y1), float(X2), float(Y2), 1.0000000 - AccumDelta);
                    // End:0x654
                    break;
                // End:0xFFFF
                default:
                    break;
            }            
        }
        else
        {
            // End:0x6ED
            if(ClanMarkList[Index].Pattern == 0)
            {
                Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawImage(C, ex_clanmark, float(X1), float(Y1), float(X2), float(Y2));
                Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawImage(C, ClanMarkList[Index].ClanLevel_Img, float(X1), float(Y1), float(X2), float(Y2));                
            }
            else
            {
                Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawImage(C, ClanMarkList[Index].BL_Img, float(X1), float(Y1), float(X2), float(Y2));
                Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawImage(C, ClanMarkList[Index].BG_Img, float(X1), float(Y1), float(X2), float(Y2));
                Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawImage(C, ClanMarkList[Index].Pattern_Img, float(X1), float(Y1), float(X2), float(Y2));
                Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawImage(C, ClanMarkList[Index].ClanLevel_Img, float(X1), float(Y1), float(X2), float(Y2));
            }
        }
    }
    //return;    
}
