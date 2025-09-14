class xScoreBoardGameResult_Booty extends xScoreBoard
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var() SpriteWidget SpBG;
var() SpriteWidget SpTeam;
var() SpriteWidget SpWin;
var() SpriteWidget SpSelection;
var() SpriteWidget SpSelectLine;
var() SpriteWidget SpTeamNameEmphasis;
var() SpriteWidget SpControlBG;
var() SpriteWidget SpPlayerNameBG;
var int MAX_TEAM;
var Material BackImage;
var int BackImageWidth;
var int BackImageHeight;
var Material LogoImage;
var float LogoImageX;
var float LogoImageY;
var float LogoImageWidth;
var float LogoImageHeight;
var Material TrophyBGImage;
var float TrophyBGBeginX;
var float TrophyBGBeginY;
var float TrophyBGWidth;
var float TrophyBGHeight;
var SpriteWidget SpBootyGetTextImage;
var float SpBootyGetTextBeginX;
var float SpBootyGetTextBeginY;
var SpriteWidget SpWeaponBGImage;
var SpriteWidget SpWeaponBGTileImage;
var float SpWeaponBGBeginX;
var float SpWeaponBGBeginY;
var float SpWeaponBGWidth;
var float SpWeaponBGHeight;
var SpriteWidget SpNickBGImage;
var float SpNickBGBeginX;
var float SpNickBGBeginY;
var Material BootyWeaponImage;
var Material BootyPartsImage[2];
var float BGBeginX;
var float BGBeginY;
var float BGWidth;
var float BGHeight;
var float ControlBeginX;
var float ControlBeginY;
var float ControlWidth;
var float ControlHeight;
var float TeamBeginX;
var float TeamBeginY;
var float TeamOffsetY;
var float TeamWidth;
var float TeamHeight;
var float TeamNameBeginX;
var float TeamNameBeginY;
var float TeamNameWidth;
var float TeamNameHeight;
var float TeamNameFontSize;
var float TeamWinnerBeginX;
var float TeamWinnerBeginY;
var float TeamWinnerWidth;
var float TeamWinnerHeight;
var float TeamMemberNicknameBeginX;
var float TeamMemberNicknameWidth;
var float TeamMemberClanBeginX;
var float TeamMemberClanWidth;
var float TeamMemberScoreBeginX;
var float TeamMemberScoreWidth;
var float TeamMemberKillBeginX;
var float TeamMemberKillWidth;
var float TeamMemberAssistBeginX;
var float TeamMemberAssistWidth;
var float TeamMemberDeathBeginX;
var float TeamMemberDeathWidth;
var float TeamMemberExpBeginX;
var float TeamMemberExpWidth;
var float TeamMemberPointBeginX;
var float TeamMemberPointWidth;
var float TeamMemberBeginY;
var float TeamMemberHeight;
var float TeamMemberHeightOffset;
var float TeamMemberFontSize;
var float TeamNameEmphasisBeginX;
var float TeamNameEmphasisBeginY;
var float TeamNameEmphasisWidth;
var float TeamNameEmphasisHeight;
var float BootyWeaponBeginX;
var float BootyWeaponBeginY;
var float BootyWeaponWidth;
var float BootyWeaponHeight;
var float BootyGetUserNameBeginX;
var float BootyGetUserNameBeginY;
var float BootyGetUserNameWidth;
var float BootyGetUserNameHeight;
var float BootyItemNameBeginX;
var float BootyItemNameBeginY;
var float BootyDisplayFonsSize;
var localized string strBootyGet;
var int BootyWeaponId;
var int BootyPartsID;
var Color DefaultFontColor;
var float BootyPartsBeginX;
var float BootyPartsBeginY;
var float BootyPartsGapY;

function HudBase GetHudBaseOwner()
{
    return HudBase(HudOwner);
    //return;    
}

function DrawBGs(Canvas C)
{
    local float X1, Y1, W, H;

    C.SetPos(0.0000000, 0.0000000);
    C.DrawTile(BackImage, C.ClipX, C.ClipY, 0.0000000, 0.0000000, float(BackImageWidth), float(BackImageHeight));
    X1 = LogoImageX * C.ClipX;
    Y1 = LogoImageY * C.ClipY;
    W = LogoImageWidth * C.ClipX;
    H = LogoImageHeight * C.ClipY;
    C.SetPos(X1, Y1);
    C.DrawTile(LogoImage, W, H, 0.0000000, 0.0000000, 512.0000000, 128.0000000);
    X1 = TrophyBGBeginX * C.ClipX;
    Y1 = TrophyBGBeginY * C.ClipY;
    W = TrophyBGWidth * C.ClipX;
    H = TrophyBGHeight * C.ClipY;
    C.SetPos(X1, Y1);
    C.DrawTile(TrophyBGImage, W, H, 0.0000000, 0.0000000, 256.0000000, 256.0000000);
    X1 = SpBootyGetTextBeginX * C.ClipX;
    Y1 = SpBootyGetTextBeginY * C.ClipY;
    W = (float(SpBootyGetTextImage.TextureCoords.X2 - SpBootyGetTextImage.TextureCoords.X1) / float(1024)) * C.ClipX;
    H = (float(SpBootyGetTextImage.TextureCoords.Y2 - SpBootyGetTextImage.TextureCoords.Y1) / float(768)) * C.ClipY;
    C.SetPos(X1, Y1);
    C.DrawTile(SpBootyGetTextImage.WidgetTexture, W, H, float(SpBootyGetTextImage.TextureCoords.X1), float(SpBootyGetTextImage.TextureCoords.Y1), float(SpBootyGetTextImage.TextureCoords.X2 - SpBootyGetTextImage.TextureCoords.X1), float(SpBootyGetTextImage.TextureCoords.Y2 - SpBootyGetTextImage.TextureCoords.Y1));
    X1 = SpWeaponBGBeginX * C.ClipX;
    Y1 = SpWeaponBGBeginY * C.ClipY;
    W = SpWeaponBGWidth * C.ClipX;
    H = SpWeaponBGHeight * C.ClipY;
    C.SetPos(X1, Y1);
    C.DrawTile(SpWeaponBGTileImage.WidgetTexture, W, H, float(SpWeaponBGTileImage.TextureCoords.X1), float(SpWeaponBGTileImage.TextureCoords.Y1), float(SpWeaponBGTileImage.TextureCoords.X2 - SpWeaponBGTileImage.TextureCoords.X1), float(SpWeaponBGTileImage.TextureCoords.Y2 - SpWeaponBGTileImage.TextureCoords.Y1));
    W = (float(SpWeaponBGImage.TextureCoords.X2 - SpWeaponBGImage.TextureCoords.X1) / float(1024)) * C.ClipX;
    H = (float(SpWeaponBGImage.TextureCoords.Y2 - SpWeaponBGImage.TextureCoords.Y1) / float(768)) * C.ClipY;
    C.SetPos(X1, Y1);
    C.DrawTile(SpWeaponBGImage.WidgetTexture, W, H, float(SpWeaponBGImage.TextureCoords.X1), float(SpWeaponBGImage.TextureCoords.Y1), float(SpWeaponBGImage.TextureCoords.X2 - SpWeaponBGImage.TextureCoords.X1), float(SpWeaponBGImage.TextureCoords.Y2 - SpWeaponBGImage.TextureCoords.Y1));
    X1 = SpNickBGBeginX * C.ClipX;
    Y1 = SpNickBGBeginY * C.ClipY;
    W = (float(SpNickBGImage.TextureCoords.X2 - SpNickBGImage.TextureCoords.X1) / float(1024)) * C.ClipX;
    H = (float(SpNickBGImage.TextureCoords.Y2 - SpNickBGImage.TextureCoords.Y1) / float(768)) * C.ClipY;
    C.SetPos(X1, Y1);
    C.DrawTile(SpNickBGImage.WidgetTexture, W, H, float(SpNickBGImage.TextureCoords.X1), float(SpNickBGImage.TextureCoords.Y1), float(SpNickBGImage.TextureCoords.X2 - SpNickBGImage.TextureCoords.X1), float(SpNickBGImage.TextureCoords.Y2 - SpNickBGImage.TextureCoords.Y1));
    //return;    
}

function DrawBootyInfo(Canvas C)
{
    local wMatchMaker MM;
    local float X1, Y1, X2, Y2, FontSize;

    MM = Level.GetMatchMaker();
    FontSize = BootyDisplayFonsSize * C.ClipY;
    C.DrawColor = DefaultFontColor;
    X1 = C.ClipX * BootyGetUserNameBeginX;
    Y1 = C.ClipY * BootyGetUserNameBeginY;
    X2 = (C.ClipX * BootyGetUserNameWidth) + X1;
    Y2 = (C.ClipY * BootyGetUserNameHeight) + Y1;
    //return;    
}

function DrawTeamMember(Canvas C)
{
    local int lpTeam, lpPRI, Count;
    local float X1, Y1, X2, Y2, FontSize;

    local PlayerReplicationInfo currPRI;
    local wMatchMaker MM;

    MM = Level.GetMatchMaker();
    FontSize = TeamMemberFontSize * C.ClipY;
    lpTeam = 0;
    J0x37:

    // End:0x568 [Loop If]
    if(lpTeam < MAX_TEAM)
    {
        Count = 0;
        lpPRI = 0;
        J0x54:

        // End:0x55E [Loop If]
        if(lpPRI < MM.ResultInfos.Length)
        {
            // End:0x554
            if(MM.ResultInfos[lpPRI].Team == lpTeam)
            {
                Y1 = ((TeamMemberBeginY + (float(lpTeam) * TeamOffsetY)) + (float(Count) * TeamMemberHeightOffset)) * C.ClipY;
                Y2 = Y1 + (TeamMemberHeight * C.ClipY);
                // End:0x195
                if(currPRI == HudOwner.PlayerOwner.PlayerReplicationInfo)
                {
                    X1 = TeamBeginX * C.ClipX;
                    X2 = X1 + (TeamWidth * C.ClipX);
                    C.SetPos(X1, Y1);
                    C.DrawTilePartialStretched(SpSelectLine.WidgetTexture, X2 - X1, Y2 - Y1);
                }
                X1 = TeamMemberNicknameBeginX * C.ClipX;
                X2 = X1 + (TeamMemberNicknameWidth * C.ClipX);
                C.DrawColor = DefaultFontColor;
                C.BtrDrawTextJustified(MM.ResultInfos[lpPRI].Nick, 0, X1, Y1, X2, Y2, int(FontSize));
                X1 = TeamMemberScoreBeginX * C.ClipX;
                X2 = X1 + (TeamMemberScoreWidth * C.ClipX);
                C.BtrDrawTextJustified(string(MM.ResultInfos[lpPRI].Score), 1, X1, Y1, X2, Y2, int(FontSize));
                X1 = TeamMemberKillBeginX * C.ClipX;
                X2 = X1 + (TeamMemberKillWidth * C.ClipX);
                C.BtrDrawTextJustified(string(MM.ResultInfos[lpPRI].Kill), 1, X1, Y1, X2, Y2, int(FontSize));
                X1 = TeamMemberAssistBeginX * C.ClipX;
                X2 = X1 + (TeamMemberAssistWidth * C.ClipX);
                C.BtrDrawTextJustified(string(MM.ResultInfos[lpPRI].Assist), 1, X1, Y1, X2, Y2, int(FontSize));
                X1 = TeamMemberDeathBeginX * C.ClipX;
                X2 = X1 + (TeamMemberDeathWidth * C.ClipX);
                C.BtrDrawTextJustified(string(MM.ResultInfos[lpPRI].Death), 1, X1, Y1, X2, Y2, int(FontSize));
                X1 = TeamMemberExpBeginX * C.ClipX;
                X2 = X1 + (TeamMemberExpWidth * C.ClipX);
                C.BtrDrawTextJustified("+" $ string(MM.ResultInfos[lpPRI].Exp), 1, X1, Y1, X2, Y2, int(FontSize));
                X1 = TeamMemberPointBeginX * C.ClipX;
                X2 = X1 + (TeamMemberPointWidth * C.ClipX);
                C.BtrDrawTextJustified("+" $ string(MM.ResultInfos[lpPRI].Point), 1, X1, Y1, X2, Y2, int(FontSize));
                Count++;
            }
            lpPRI++;
            // [Loop Continue]
            goto J0x54;
        }
        lpTeam++;
        // [Loop Continue]
        goto J0x37;
    }
    //return;    
}

simulated event DrawScoreboard(Canvas C)
{
    super(ScoreBoard).DrawScoreboard(C);
    C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
    DrawBGs(C);
    DrawBootyInfo(C);
    //return;    
}

defaultproperties
{
    SpBG=(WidgetTexture=Texture'Warfare_UI.HUD_Result.result_1',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=823,Y2=696),TextureScale=0.6500000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    SpTeam=(WidgetTexture=Texture'Warfare_UI.HUD_Result.result_2',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=803,Y2=276),TextureScale=0.6500000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    SpWin=(WidgetTexture=Texture'Warfare_UI.HUD_Result.result_win',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=230,Y2=113),TextureScale=0.6500000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    SpSelectLine=(WidgetTexture=Texture'Warfare_UI.HUD_Scoreboard.select_line',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=31,Y2=31),TextureScale=0.6500000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=192),Tints[1]=(R=255,G=255,B=255,A=192))
    SpTeamNameEmphasis=(WidgetTexture=Texture'Warfare_UI.HUD_Scoreboard.sc_bo_oran',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=179,Y2=27),TextureScale=0.6363000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    SpControlBG=(WidgetTexture=Texture'Warfare_UI.HUD_Result.result_3',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=1023,Y2=63),TextureScale=0.6363000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    SpPlayerNameBG=(WidgetTexture=Texture'Warfare_UI.HUD_Result.result_3_1',RenderStyle=5,TextureCoords=(X1=1,Y1=1,X2=228,Y2=27),TextureScale=0.6363000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    MAX_TEAM=2
    BackImage=Texture'Warfare_UI.Common_1.back_g'
    BackImageWidth=1024
    BackImageHeight=768
    LogoImage=Texture'Warfare_UI.Common.title_image'
    LogoImageX=0.0400000
    LogoImageY=0.0030000
    LogoImageWidth=0.2500000
    LogoImageHeight=0.0820000
    TrophyBGImage=Texture'Warfare_UI.HUD_Trophy.hud_etc_trophy_pic'
    TrophyBGBeginX=0.3860000
    TrophyBGBeginY=0.2760000
    TrophyBGWidth=0.2500000
    TrophyBGHeight=0.3330000
    SpBootyGetTextImage=(WidgetTexture=Texture'Warfare_UI.HUD_Trophy.hud_etc_trophy_typo',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=128,Y2=32),TextureScale=0.6363000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    SpBootyGetTextBeginX=0.4440000
    SpBootyGetTextBeginY=0.3830000
    SpWeaponBGImage=(WidgetTexture=Texture'Warfare_UI.Common_1.sto_item_w',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=256,Y2=128),TextureScale=0.6363000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    SpWeaponBGTileImage=(WidgetTexture=Texture'Warfare_UI.Common_1.sto_item_w_bg',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=8,Y2=8),TextureScale=0.6363000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    SpWeaponBGBeginX=0.3960000
    SpWeaponBGBeginY=0.4570000
    SpWeaponBGWidth=0.2080000
    SpWeaponBGHeight=0.0950000
    SpNickBGImage=(WidgetTexture=Texture'Warfare_UI.HUD_Trophy.hud_etc_trophy_typo_ba',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=256,Y2=64),TextureScale=0.6363000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    SpNickBGBeginX=0.3960000
    SpNickBGBeginY=0.5600000
    BGBeginX=0.0986328
    BGBeginY=0.0299479
    BGWidth=0.8154297
    BGHeight=0.7434896
    ControlBeginY=0.9023438
    ControlWidth=1.0000000
    ControlHeight=0.0833333
    TeamBeginX=0.1113281
    TeamBeginY=0.0455729
    TeamOffsetY=0.3671875
    TeamWidth=0.7812500
    TeamHeight=0.3541667
    TeamNameBeginX=0.1171875
    TeamNameBeginY=0.0533854
    TeamNameWidth=0.1279297
    TeamNameHeight=0.0221354
    TeamNameFontSize=0.0182300
    TeamWinnerBeginX=0.3876953
    TeamWinnerBeginY=0.1718750
    TeamWinnerWidth=0.2275391
    TeamWinnerHeight=0.1484375
    TeamMemberNicknameBeginX=0.1855469
    TeamMemberNicknameWidth=0.1201172
    TeamMemberClanBeginX=0.3378906
    TeamMemberClanWidth=0.0947266
    TeamMemberScoreBeginX=0.4384766
    TeamMemberScoreWidth=0.0400391
    TeamMemberKillBeginX=0.4843750
    TeamMemberKillWidth=0.0253906
    TeamMemberAssistBeginX=0.5156250
    TeamMemberAssistWidth=0.0419922
    TeamMemberDeathBeginX=0.5644531
    TeamMemberDeathWidth=0.0400391
    TeamMemberExpBeginX=0.6093750
    TeamMemberExpWidth=0.0859375
    TeamMemberPointBeginX=0.7001953
    TeamMemberPointWidth=0.0859375
    TeamMemberBeginY=0.1263021
    TeamMemberHeight=0.0286458
    TeamMemberHeightOffset=0.0338542
    TeamMemberFontSize=0.0130300
    TeamNameEmphasisBeginX=0.1123047
    TeamNameEmphasisBeginY=0.0494792
    TeamNameEmphasisWidth=0.1552734
    TeamNameEmphasisHeight=0.0312500
    BootyWeaponBeginX=0.3750000
    BootyWeaponBeginY=0.4630000
    BootyWeaponWidth=0.2500000
    BootyWeaponHeight=0.0830000
    BootyGetUserNameBeginX=0.3960000
    BootyGetUserNameBeginY=0.5600000
    BootyGetUserNameWidth=0.2080000
    BootyGetUserNameHeight=0.0370000
    BootyItemNameBeginX=0.4010000
    BootyItemNameBeginY=0.4700000
    BootyDisplayFonsSize=0.0130300
    strBootyGet="??? ???? ????"
    BootyWeaponId=-1
    DefaultFontColor=(R=255,G=255,B=255,A=255)
    BootyPartsBeginX=0.5546875
    BootyPartsBeginY=0.4609375
    BootyPartsGapY=0.0351562
}