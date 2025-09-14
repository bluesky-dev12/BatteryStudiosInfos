class BTROClanMarkHK extends RenderObject;

var bool bClanMarkSize128;
var int clanmarkid[3];
var int ClanLevel;
var Image Background;
var Image ClanMark[3];
var Image ClanLevel_Img;

function Init()
{
    //return;    
}

function SetData(wGameManager GameMgr, int ClanPattern, int ClanBG, int ClanBL, optional bool bSize128, optional int ClanLevel)
{
    bClanMarkSize128 = bSize128;
    clanmarkid[0] = ClanPattern;
    clanmarkid[1] = ClanBG;
    clanmarkid[2] = ClanBL;
    // End:0x96
    if(bSize128)
    {
        ClanMark[0] = GameMgr.GetClanMark128(ClanPattern);
        ClanMark[1] = GameMgr.GetClanMark128(ClanBG);
        ClanMark[2] = GameMgr.GetClanMark128(ClanBL);        
    }
    else
    {
        ClanMark[0] = GameMgr.GetClanMark32(ClanPattern);
        ClanMark[1] = GameMgr.GetClanMark32(ClanBG);
        ClanMark[2] = GameMgr.GetClanMark32(ClanBL);
    }
    self.ClanLevel = ClanLevel;
    ClanLevel_Img = Class'Engine.BTCustomDrawHK'.static.MakeImage(16, 16, 0, GameMgr.ClanLevelTextures[ClanLevel]);
    //return;    
}

function Update(optional Canvas C, optional float Delta)
{
    //return;    
}

function bool Render(Canvas C, optional float Delta)
{
    local bool bExistClanMark;

    // End:0x0E
    if(bVisible == false)
    {
        return true;
    }
    // End:0x5F
    if(Background.Image != none)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Background, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
    }
    // End:0xBE
    if(ClanMark[2].Image != none)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, ClanMark[2], AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
        bExistClanMark = true;
    }
    // End:0x11B
    if(ClanMark[1].Image != none)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, ClanMark[1], AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
        bExistClanMark = true;
    }
    // End:0x178
    if(ClanMark[0].Image != none)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, ClanMark[0], AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
        bExistClanMark = true;
    }
    // End:0x1CE
    if(bExistClanMark == false)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ex_clanmark, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
    }
    // End:0x21F
    if(ClanLevel_Img.Image != none)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, ClanLevel_Img, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
    }
    return true;
    //return;    
}
