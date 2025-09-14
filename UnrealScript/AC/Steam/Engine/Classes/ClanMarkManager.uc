/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\ClanMarkManager.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:9
 *	Functions:10
 *
 *******************************************************************************/
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
        case 0.0:
            // End:0x3f
            if(AccumDelta >= float(7))
            {
                AccumDelta = 0.0;
                Phase = 1.0;
            }
            // End:0xd0
            break;
        // End:0x70
        case 1.0:
            // End:0x6d
            if(AccumDelta >= float(1))
            {
                AccumDelta = 0.0;
                Phase = 2.0;
            }
            // End:0xd0
            break;
        // End:0x9f
        case 2.0:
            // End:0x9c
            if(AccumDelta >= float(3))
            {
                AccumDelta = 0.0;
                Phase = 3.0;
            }
            // End:0xd0
            break;
        // End:0xcd
        case 3.0:
            // End:0xca
            if(AccumDelta >= float(1))
            {
                AccumDelta = 0.0;
                Phase = 0.0;
            }
            // End:0xd0
            break;
        // End:0xffff
        default:
}

function Init(wGameManager gm)
{
    GameMgr = gm;
    ex_clanmark = class'BTCustomDrawHK'.static.MakeImage(32, 32, 28, Material(DynamicLoadObject("Warfare_UI_Clan.Clan_Mark.ex_clanmark", class'Material')));
    ex_clanmark_01 = class'BTCustomDrawHK'.static.MakeImage(32, 32, 28, Material(DynamicLoadObject("Warfare_UI_Clan.Clan_Mark.ex_clanmark_01_GP", class'Material')));
    ex_clanmark_02 = class'BTCustomDrawHK'.static.MakeImage(32, 32, 28, Material(DynamicLoadObject("Warfare_UI_Clan.Clan_Mark.ex_clanmark_02_GP", class'Material')));
}

function bool SetClanState(string ClanName, bool bClanLF)
{
    local int Index;

    // End:0x0e
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
}

function bool AddClanMark(string ClanName, int Pattern, int BG, int BL, optional bool bSetClanState, optional bool bClanLF)
{
    local int Index;
    local ClanNameAndMark cnam;

    // End:0x0e
    if(ClanName == "")
    {
        return false;
    }
    Index = FindClanMark(ClanName);
    // End:0x202
    if(Index >= 0)
    {
        Log("[CMM::AddClanMark] Replace ClanName=" $ ClanName $ ", (" $ string(ClanMarkList[Index].Pattern) $ ", " $ string(ClanMarkList[Index].BG) $ ", " $ string(ClanMarkList[Index].BL) $ ")->(" $ string(Pattern) $ ", " $ string(BG) $ ", " $ string(BL) $ ")");
        // End:0x112
        if(Pattern != 0 && BG == 0)
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
    // End:0x3b2
    if(Index >= 0)
    {
        Log("[CMM::AddClanMark] Add ClanName=" $ ClanName $ ", (" $ string(Pattern) $ ", " $ string(BG) $ ", " $ string(BL) $ ")");
        ClanMarkList.Insert(Index, 1);
        cnam = new class'ClanNameAndMark';
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
}

function bool SetClanLevel(string ClanName, int ClanLevel)
{
    local int Index;

    // End:0x0e
    if(ClanName == "")
    {
        return false;
    }
    Index = FindClanMark(ClanName);
    // End:0x2c
    if(Index < 0)
    {
        return false;
    }
    // End:0x3e
    if(ClanLevel < 0)
    {
        ClanLevel = 0;
    }
    ClanMarkList[Index].ClanLevel = ClanLevel;
    ClanMarkList[Index].ClanLevel_Img = GameMgr.GetClanLevelImage(ClanLevel);
    return true;
}

function bool RemoveClanMark(string ClanName)
{
    local int i;

    // End:0x0e
    if(ClanName == "")
    {
        return false;
    }
    i = 0;
    J0x15:
    // End:0x5b [While If]
    if(i < ClanMarkList.Length)
    {
        // End:0x51
        if(ClanMarkList[i].ClanName == ClanName)
        {
            ClanMarkList.Remove(i, 1);
            return true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x15;
    }
    return false;
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
    // End:0x65 [While If]
    if(i < ClanMarkList.Length)
    {
        // End:0x5b
        if(ClanMarkList[i].ClanName >= ClanName)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x27;
    }
    return ClanMarkList.Length;
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
}

function int FindClanMark_Inner(string ClanName, int Left, int Right)
{
    local int Mid;

    // End:0x60
    if(Right - Left <= 1)
    {
        // End:0x36
        if(ClanName == ClanMarkList[Left].ClanName)
        {
            return Left;
        }
        // End:0x5a
        if(ClanName == ClanMarkList[Right].ClanName)
        {
            return Right;
        }
        return -1;
    }
    Mid = Right + Left / 2;
    // End:0x9d
    if(ClanName == ClanMarkList[Mid].ClanName)
    {
        return Mid;
    }
    // End:0x108
    else
    {
        // End:0xd4
        if(ClanName < ClanMarkList[Mid].ClanName)
        {
            return FindClanMark_Inner(ClanName, Left, Mid);
        }
        // End:0x108
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
}

function Render(Canvas C, int X1, int Y1, int X2, int Y2, string ClanName)
{
    local int Index;

    Index = FindClanMark(ClanName);
    // End:0x7fd
    if(Index >= 0)
    {
        // End:0x657
        if(ClanMarkList[Index].bClanLF)
        {
            switch(Phase)
            {
                // End:0x1ec
                case 0.0:
                    // End:0xd9
                    if(ClanMarkList[Index].Pattern == 0)
                    {
                        class'BTCustomDrawHK'.static.DrawImage(C, ex_clanmark, float(X1), float(Y1), float(X2), float(Y2));
                        class'BTCustomDrawHK'.static.DrawImage(C, ClanMarkList[Index].ClanLevel_Img, float(X1), float(Y1), float(X2), float(Y2));
                    }
                    // End:0x1e9
                    else
                    {
                        class'BTCustomDrawHK'.static.DrawImage(C, ClanMarkList[Index].BL_Img, float(X1), float(Y1), float(X2), float(Y2));
                        class'BTCustomDrawHK'.static.DrawImage(C, ClanMarkList[Index].BG_Img, float(X1), float(Y1), float(X2), float(Y2));
                        class'BTCustomDrawHK'.static.DrawImage(C, ClanMarkList[Index].Pattern_Img, float(X1), float(Y1), float(X2), float(Y2));
                        class'BTCustomDrawHK'.static.DrawImage(C, ClanMarkList[Index].ClanLevel_Img, float(X1), float(Y1), float(X2), float(Y2));
                    }
                    // End:0x654
                    break;
                // End:0x41f
                case 1.0:
                    class'BTCustomDrawHK'.static.DrawImage_Alpha(C, ex_clanmark_01, float(X1), float(Y1), float(X2), float(Y2), AccumDelta);
                    // End:0x2dc
                    if(ClanMarkList[Index].Pattern == 0)
                    {
                        class'BTCustomDrawHK'.static.DrawImage_Alpha(C, ex_clanmark, float(X1), float(Y1), float(X2), float(Y2), 1.0 - AccumDelta);
                        class'BTCustomDrawHK'.static.DrawImage_Alpha(C, ClanMarkList[Index].ClanLevel_Img, float(X1), float(Y1), float(X2), float(Y2), 1.0 - AccumDelta);
                    }
                    // End:0x41c
                    else
                    {
                        class'BTCustomDrawHK'.static.DrawImage_Alpha(C, ClanMarkList[Index].BL_Img, float(X1), float(Y1), float(X2), float(Y2), 1.0 - AccumDelta);
                        class'BTCustomDrawHK'.static.DrawImage_Alpha(C, ClanMarkList[Index].BG_Img, float(X1), float(Y1), float(X2), float(Y2), 1.0 - AccumDelta);
                        class'BTCustomDrawHK'.static.DrawImage_Alpha(C, ClanMarkList[Index].Pattern_Img, float(X1), float(Y1), float(X2), float(Y2), 1.0 - AccumDelta);
                        class'BTCustomDrawHK'.static.DrawImage_Alpha(C, ClanMarkList[Index].ClanLevel_Img, float(X1), float(Y1), float(X2), float(Y2), 1.0 - AccumDelta);
                    }
                    // End:0x654
                    break;
                // End:0x45f
                case 2.0:
                    class'BTCustomDrawHK'.static.DrawImage(C, ex_clanmark_01, float(X1), float(Y1), float(X2), float(Y2));
                    // End:0x654
                    break;
                // End:0x651
                case 3.0:
                    // End:0x4fd
                    if(ClanMarkList[Index].Pattern == 0)
                    {
                        class'BTCustomDrawHK'.static.DrawImage(C, ex_clanmark, float(X1), float(Y1), float(X2), float(Y2));
                        class'BTCustomDrawHK'.static.DrawImage(C, ClanMarkList[Index].ClanLevel_Img, float(X1), float(Y1), float(X2), float(Y2));
                    }
                    // End:0x60d
                    else
                    {
                        class'BTCustomDrawHK'.static.DrawImage(C, ClanMarkList[Index].BL_Img, float(X1), float(Y1), float(X2), float(Y2));
                        class'BTCustomDrawHK'.static.DrawImage(C, ClanMarkList[Index].BG_Img, float(X1), float(Y1), float(X2), float(Y2));
                        class'BTCustomDrawHK'.static.DrawImage(C, ClanMarkList[Index].Pattern_Img, float(X1), float(Y1), float(X2), float(Y2));
                        class'BTCustomDrawHK'.static.DrawImage(C, ClanMarkList[Index].ClanLevel_Img, float(X1), float(Y1), float(X2), float(Y2));
                    }
                    class'BTCustomDrawHK'.static.DrawImage_Alpha(C, ex_clanmark_01, float(X1), float(Y1), float(X2), float(Y2), 1.0 - AccumDelta);
                    // End:0x654
                    break;
                // End:0xffff
                default:
                    // End:0x7fd Break;
                    break;
                }
        }
        // End:0x6ed
        if(ClanMarkList[Index].Pattern == 0)
        {
            class'BTCustomDrawHK'.static.DrawImage(C, ex_clanmark, float(X1), float(Y1), float(X2), float(Y2));
            class'BTCustomDrawHK'.static.DrawImage(C, ClanMarkList[Index].ClanLevel_Img, float(X1), float(Y1), float(X2), float(Y2));
        }
        // End:0x7fd
        else
        {
            class'BTCustomDrawHK'.static.DrawImage(C, ClanMarkList[Index].BL_Img, float(X1), float(Y1), float(X2), float(Y2));
            class'BTCustomDrawHK'.static.DrawImage(C, ClanMarkList[Index].BG_Img, float(X1), float(Y1), float(X2), float(Y2));
            class'BTCustomDrawHK'.static.DrawImage(C, ClanMarkList[Index].Pattern_Img, float(X1), float(Y1), float(X2), float(Y2));
            class'BTCustomDrawHK'.static.DrawImage(C, ClanMarkList[Index].ClanLevel_Img, float(X1), float(Y1), float(X2), float(Y2));
        }
    }
}
