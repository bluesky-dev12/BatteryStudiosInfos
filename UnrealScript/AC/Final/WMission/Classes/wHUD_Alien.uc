class wHUD_Alien extends wHUD_Mission
    transient
    config(User);

const HUMAN_HUD_TYPE = 0;
const ALIEN_HUD_TYPE = 1;
const MATCH_END_HUD_TYPE = 2;
const MAX_ITEM_SLOT_COUNT = 2;
const MAX_SELECT_ALIEN_RESPAWN_TIME = 10;

enum eAlienMode_Skill_Type
{
    eAlien_Skill_Infected_DEF,      // 0
    eAlien_Skill_Infected_Point     // 1
};

var int iModeItemSlots[2];
var array<byte> AlienObjectTypes;
var byte SelectedAlienObjectType;
var byte byAlienGame_MenuType;
var SpriteWidget WAlienSelectMenuBack;
var SpriteWidget WAlienSelectBut_Cli;
var SpriteWidget WAlienSelectBut_Nor;
var SpriteWidget WHumanMarkDisplay;
var SpriteWidget WAlienMarkDisplay;
var SpriteWidget WAlienModeSkillSlot;
var SpriteWidget WAlienModeSkillType[2];
var SpriteWidget WAlienModeAlienType[3];
var array<Material> matModeItemIcons;
var array<Material> matAlienTypeIcons;
var SpriteWidget WHumanAttackBuffDisplay;
var SpriteWidget WHumanAttackLevelDisplay[10];
var localized string strOriAttackBuffMsg;
var string strAttackBuffMsg;
var SpriteWidget WAlienLevelBackDisplay;
var SpriteWidget WAlienLevelDisplay[5];
var SpriteWidget WAlienEyeBackDisplay;
var string strRoundGoalMsg;
var localized string strHumanGoalMsg;
var localized string strAlienGoalMsg;
var localized string strAlienLevelMsg[3];
var array<wPawn> ShowHeroPawnArrays;
var SpriteWidget WHeroIconDisplays[2];
var localized string strAlienSelect;
var() SpriteWidget WAlienMeleeKill;
var localized string strSecond;
var localized string strAlienSelectKey[3];
var localized string strAlienSelectWaitMesage;
var float fCurAlienRespawnTime;
var bool bSelectAlienType;
var float fSuperHeroEffectFirstRange;
var float fSuperHeroEffectEndRange;
var float fSuperHeroEffectCurValue;
var localized string strHumanHeroName[2];
var byte byHeroDisplayIndex;
//var delegate<DrawDisplayHUD> __DrawDisplayHUD__Delegate;
//var delegate<DrawBackScreen> __DrawBackScreen__Delegate;
//var delegate<DrawDisplaySelectMenu> __DrawDisplaySelectMenu__Delegate;

function PostBeginPlay()
{
    super.PostBeginPlay();
    //return;    
}

simulated function NotifyGRIChanged()
{
    local wGameManager GM;
    local wAlienGameReplicationInfo GRI;

    GRI = wAlienGameReplicationInfo(MSGRI);
    GM = Level.GameMgr;
    GRI.iCurTimeOfAppearence = GM.AlienGameParam.20;
    HudPart_SelQuickSlot.BeginQuickSlotWindow();
    //return;    
}

function Reset()
{
    super(HUD).Reset();
    // End:0x22
    if(HudPart_Minimap != none)
    {
        HudPart_Minimap.CachedSpecialPositions.Length = 0;
    }
    // End:0x3E
    if(HudPart_Bigmap != none)
    {
        HudPart_Bigmap.CachedSpecialPositions.Length = 0;
    }
    // End:0x76
    if(xScoreBoardTeamGame(ScoreBoard).PartMinimap != none)
    {
        xScoreBoardTeamGame(ScoreBoard).PartMinimap.CachedSpecialPositions.Length = 0;
    }
    ShowHeroPawnArrays.Length = 0;
    //return;    
}

function InitHudPart_SelQuickSlot()
{
    HudPart_SelQuickSlot = Spawn(Class'XInterface.wHudPart_SelectQSlot_AlienMode', self);
    HudPart_SelQuickSlot.Initialize(self, Level);
    //return;    
}

simulated function DrawHudPassA(Canvas C)
{
    super.DrawHudPassA(C);
    // End:0x2A
    if(bShowPersonalInfo)
    {
        DrawSpecialPositions(C);
        DrawSuppliesPositions(C);
    }
    //return;    
}

function DrawBackDisplayScreen(Canvas C)
{
    DrawBackScreen(C);
    //return;    
}

function DrawHpStamina(Canvas C, optional bool bShowSpectating)
{
    DrawDisplayHUD(C);
    super(HudCDeathmatch).DrawHpStamina(C, bShowSpectating);
    //return;    
}

function float CalculateHPBar(bool bDamage, bool bRecovery)
{
    local float fResultValue;

    fResultValue = super(HudCDeathmatch).CalculateHPBar(bDamage, bRecovery);
    // End:0x37
    if(bRecovery)
    {
        fResultValue = float(PawnOwner.Health);
    }
    return fResultValue;
    //return;    
}

delegate DrawDisplayHUD(Canvas C)
{
    //return;    
}

delegate DrawBackScreen(Canvas C)
{
    //return;    
}

delegate DrawDisplaySelectMenu(Canvas C)
{
    //return;    
}

function DrawHumanDisplyHud(Canvas C)
{
    local CalCoordsW calW;
    local wAlienController ac;
    local wAlienGameReplicationInfo GRI;
    local byte lp1;

    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    CalculateCoordinateEx(C, WHumanMarkDisplay, 177.0000000, 135.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WHumanMarkDisplay.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    CalculateCoordinateEx(C, WHumanAttackBuffDisplay, 972.0000000, 77.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WHumanAttackBuffDisplay.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    ac = wAlienController(PawnOwner.Controller);
    GRI = wAlienGameReplicationInfo(ac.GameReplicationInfo);
    lp1 = 0;
    J0x187:

    // End:0x254 [Loop If]
    if(int(lp1) < int(GRI.CurAlienAttackBuffLevel))
    {
        CalculateCoordinateEx(C, WHumanAttackLevelDisplay[int(lp1)], 51.0000000, 38.0000000, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WHumanAttackLevelDisplay[int(lp1)].WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
        ++lp1;
        // [Loop Continue]
        goto J0x187;
    }
    // End:0x310
    if(int(GRI.CurAlienAttackBuffLevel) > 0)
    {
        strAttackBuffMsg = strOriAttackBuffMsg;
        ReplaceText(strAttackBuffMsg, "%0", string(GRI.CurAlienAttackBuffLevel));
        C.BtrDrawTextJustifiedWithVolumeLine(strAttackBuffMsg, 1, 521.0000000 * _reX, 1176.0000000 * _reY, 1144.0000000 * _reX, 1193.0000000 * _reY, int((float(13) / 1200.0000000) * C.ClipY), C.MakeColorNoEmpty(0, 0, 0, 0), 1, 1);
    }
    DrawAlienModeSkillSlot(C);
    //return;    
}

function DrawNametagsScript(Canvas C, bool bSpectateMode, optional bool drawAlways)
{
    ShowHeroPawnArrays.Length = 0;
    super(HudBase).DrawNametagsScript(C, bSpectateMode, drawAlways);
    //return;    
}

function UpdateNameTagInfo(Canvas C, wPawn curPawn, Vector camLoc, Rotator camRot)
{
    local wAlienPlayerReplicationInfo PRI;

    super(HudBase).UpdateNameTagInfo(C, curPawn, camLoc, camRot);
    PRI = wAlienPlayerReplicationInfo(curPawn.PlayerReplicationInfo);
    // End:0xA4
    if(Class'Engine.wGameManager'.static.IsHeroType(PRI.eObjType))
    {
        // End:0xA4
        if(PawnOwner.PlayerReplicationInfo.PlayerID != PRI.PlayerID)
        {
            // End:0xA4
            if(curPawn.NametagVisInFront == false)
            {
                ShowHeroPawnArrays[ShowHeroPawnArrays.Length] = curPawn;
            }
        }
    }
    //return;    
}

function DrawSpecialModeIcon(Canvas C, wPawn curPawn)
{
    local wAlienPlayerReplicationInfo PRI;

    PRI = wAlienPlayerReplicationInfo(curPawn.PlayerReplicationInfo);
    // End:0x143
    if(Class'Engine.wGameManager'.static.IsHeroType(PRI.eObjType))
    {
        WHeroIconDisplays[PlayerOwner.PlayerReplicationInfo.Team.TeamIndex].PosX = curPawn.NametagScreenPos.X / C.ClipX;
        WHeroIconDisplays[PlayerOwner.PlayerReplicationInfo.Team.TeamIndex].PosY = (curPawn.NametagScreenPos.Y - float(7)) / C.ClipY;
        DrawSpriteWidget(C, WHeroIconDisplays[PlayerOwner.PlayerReplicationInfo.Team.TeamIndex]);
        DrawCustomNameTag(C, curPawn.NametagScreenPos, curPawn, strHumanHeroName[int(byHeroDisplayIndex)], 0.0000000, -45.0000000);
    }
    //return;    
}

function DrawAlienDisplyHud(Canvas C)
{
    local CalCoordsW calW;
    local wAlienController ac;
    local byte lp1;
    local wAlienPlayerReplicationInfo PRI;

    ac = wAlienController(PawnOwner.Controller);
    PRI = wAlienPlayerReplicationInfo(PawnOwner.PlayerReplicationInfo);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    DrawDisplaySelectMenu(C);
    CalculateCoordinateEx(C, WAlienMarkDisplay, 177.0000000, 135.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WAlienMarkDisplay.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    CalculateCoordinateEx(C, WAlienLevelBackDisplay, 972.0000000, 121.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WAlienLevelBackDisplay.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    lp1 = 0;
    J0x196:

    // End:0x264 [Loop If]
    if(int(lp1) < int(ac.GetInfectionLevel()))
    {
        CalculateCoordinateEx(C, WAlienLevelDisplay[int(lp1)], 88.0000000, 75.0000000, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WAlienLevelDisplay[int(lp1)].WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
        ++lp1;
        // [Loop Continue]
        goto J0x196;
    }
    // End:0x305
    if(Class'Engine.wGameManager'.static.IsAlienType(PRI.eObjType))
    {
        C.BtrDrawTextJustifiedWithVolumeLine(strAlienLevelMsg[0], 1, 521.0000000 * _reX, 1176.0000000 * _reY, 1144.0000000 * _reX, 1193.0000000 * _reY, int((float(13) / 1200.0000000) * C.ClipY), C.MakeColorNoEmpty(0, 0, 0, 0), 1, 1);        
    }
    else
    {
        // End:0x3A6
        if(Class'Engine.wGameManager'.static.IsAlienHostType(PRI.eObjType))
        {
            C.BtrDrawTextJustifiedWithVolumeLine(strAlienLevelMsg[1], 1, 521.0000000 * _reX, 1176.0000000 * _reY, 1144.0000000 * _reX, 1193.0000000 * _reY, int((float(13) / 1200.0000000) * C.ClipY), C.MakeColorNoEmpty(0, 0, 0, 0), 1, 1);            
        }
        else
        {
            // End:0x445
            if(Class'Engine.wGameManager'.static.IsAlienMasterType(PRI.eObjType))
            {
                C.BtrDrawTextJustifiedWithVolumeLine(strAlienLevelMsg[2], 1, 521.0000000 * _reX, 1176.0000000 * _reY, 1144.0000000 * _reX, 1193.0000000 * _reY, int((float(13) / 1200.0000000) * C.ClipY), C.MakeColorNoEmpty(0, 0, 0, 0), 1, 1);
            }
        }
    }
    DrawAlienModeSkillSlot(C);
    DrawAlienCoolTimeSkillSlot(C);
    //return;    
}

function DrawHumanDisplayBackScreen(Canvas C)
{
    //return;    
}

function DrawAlienDisplayBackScreen(Canvas C)
{
    local CalCoordsW calW;

    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    CalculateCoordinateEx(C, WAlienEyeBackDisplay, 1600.0000000, 1200.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WAlienEyeBackDisplay.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    //return;    
}

function EnableWeaponSlot5Hud(int nWeaponID)
{
    local wWeaponBaseParams WeaponBaseParam;

    super(HudCDeathmatch).EnableWeaponSlot5Hud(nWeaponID);
    WeaponBaseParam = Level.WeaponMgr.GetBaseParam(nWeaponID);
    // End:0x70
    if(WeaponBaseParam == none)
    {
        Log("[wHud_Alien::EnableWeaponSlot5Hud] ID : " $ string(nWeaponID));
        return;
    }
    switch(WeaponBaseParam.eType)
    {
        // End:0x9D
        case 14:
            SkillSlot5.WidgetTexture = matSkillSupplyItem[int(3)];
            // End:0xF7
            break;
        // End:0xBA
        case 15:
            SkillSlot5.WidgetTexture = matSkillSupplyItem[int(2)];
            // End:0xF7
            break;
        // End:0xD7
        case 16:
            SkillSlot5.WidgetTexture = matSkillSupplyItem[int(1)];
            // End:0xF7
            break;
        // End:0xF4
        case 19:
            SkillSlot5.WidgetTexture = matSkillSupplyItem[int(4)];
            // End:0xF7
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function bool IsPickupWeapon()
{
    local wAlienPlayerReplicationInfo PRI;

    PRI = wAlienPlayerReplicationInfo(PawnOwner.PlayerReplicationInfo);
    // End:0x46
    if(super(HudCDeathmatch).IsPickupWeapon() && Class'Engine.wGameManager'.static.IsHumanType(PRI.eObjType))
    {
        return true;
    }
    return false;
    //return;    
}

function DrawHudPassA_Score(Canvas C)
{
    HudPart_DisplayEvent.DrawAlienModeScore(C);
    C.DrawColor = C.MakeColor(byte(255), 198, 0, byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine(strRoundGoalMsg, 1, 682.0000000 * _reX, 79.0000000 * _reY, 918.0000000 * _reX, 96.0000000 * _reY, int((float(13) / 1200.0000000) * C.ClipY), C.MakeColorNoEmpty(0, 0, 0, 0), 1, 1);
    //return;    
}

simulated function DrawSpectatingHud(Canvas C)
{
    local bool renderAssaultHudLayer;

    super(HudCTeamDeathMatch).DrawSpectatingHud(C);
    renderAssaultHudLayer = true;
    // End:0x237
    if(MSGRI != none)
    {
        // End:0x237
        if(Level.GetMatchMaker().InGameOver == 0)
        {
            // End:0x1FD
            if((int(MSGRI.RoundState) == int(1)) || int(MSGRI.RoundState) == int(3))
            {
                // End:0xA2
                if((Level.TimeSeconds - LastSpectatingTime) > float(2))
                {
                    BeginSpectatingTime = Level.TimeSeconds;
                }
                LastSpectatingTime = Level.TimeSeconds;
                // End:0x19C
                if(int(MSGRI.RoundState) == int(1))
                {
                    // End:0x199
                    if(bDrawRoundResult)
                    {
                        // End:0x167
                        if((Level.TimeSeconds - BeginSpectatingTime) <= float(3))
                        {
                            // End:0x141
                            if(Class'Engine.wGameManager'.static.IsAlienTeamType(wAlienPlayerReplicationInfo(MSPRI).eObjType))
                            {
                                HudPart_DisplayEvent.DrawRoundResult(C, MSGRI.ScoringTeam, 1);                                
                            }
                            else
                            {
                                HudPart_DisplayEvent.DrawRoundResult(C, MSGRI.ScoringTeam, 0);
                            }                            
                        }
                        else
                        {
                            // End:0x199
                            if((Level.TimeSeconds - BeginSpectatingTime) <= float(8))
                            {
                                ScoreBoard.DrawScoreboard(C);
                            }
                        }
                    }                    
                }
                else
                {
                    // End:0x1FD
                    if(int(MSGRI.RoundState) == int(3))
                    {
                        HudPart_DisplayEvent.DrawResultScore_AlienMdoe(C, MSGRI.Teams[0].Score < MSGRI.Teams[1].Score);
                    }
                }
            }
            renderAssaultHudLayer = !(int(MSGRI.RoundState) == int(3)) || int(MSGRI.RoundState) == int(1);
        }
    }
    UpdateTeamHud();
    // End:0x251
    if(renderAssaultHudLayer)
    {
        DrawAssaultHUDLayer(C);
    }
    //return;    
}

simulated function DrawResultScore(Canvas C)
{
    //return;    
}

simulated function DrawObjectives(Canvas C)
{
    local int lp1;

    super.DrawObjectives(C);
    lp1 = 0;
    J0x12:

    // End:0x7F [Loop If]
    if(lp1 < ShowHeroPawnArrays.Length)
    {
        DrawCustomObjectSprite(C, ShowHeroPawnArrays[lp1], WHeroIconDisplays[PlayerOwner.PlayerReplicationInfo.Team.TeamIndex], strHumanHeroName[int(byHeroDisplayIndex)], 0.0000000, -35.0000000);
        ++lp1;
        // [Loop Continue]
        goto J0x12;
    }
    //return;    
}

function DrawDisplaySelectAlienMenu(Canvas C)
{
    local int lp1;
    local CalCoordsW calW;
    local string strBuffer;

    CalculateCoordinateEx(C, WAlienSelectMenuBack, 580.0000000, 117.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WAlienSelectMenuBack.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    lp1 = 0;
    J0x9E:

    // End:0x395 [Loop If]
    if(lp1 < 3)
    {
        // End:0x17D
        if(int(SelectedAlienObjectType) == lp1)
        {
            WAlienSelectBut_Cli.OffsetX = (172 * lp1) + 4;
            WAlienSelectBut_Cli.OffsetY = 725;
            CalculateCoordinateEx(C, WAlienSelectBut_Cli, 169.0000000, 86.0000000, calW);
            C.SetPos(calW.X1, calW.Y1);
            C.DrawTile(WAlienSelectBut_Cli.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);            
        }
        else
        {
            WAlienSelectBut_Nor.OffsetX = (172 * lp1) + 4;
            WAlienSelectBut_Nor.OffsetY = 725;
            CalculateCoordinateEx(C, WAlienSelectBut_Nor, 169.0000000, 86.0000000, calW);
            C.SetPos(calW.X1, calW.Y1);
            C.DrawTile(WAlienSelectBut_Nor.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
        }
        // End:0x38B
        if(WAlienModeAlienType[lp1].WidgetTexture != none)
        {
            CalculateCoordinateEx(C, WAlienModeAlienType[lp1], 169.0000000, 86.0000000, calW);
            C.SetPos(calW.X1, calW.Y1);
            C.DrawTile(WAlienModeAlienType[lp1].WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
            C.BtrDrawTextJustifiedWithVolumeLine(strAlienSelectKey[lp1], 0, (4.0000000 + float(172 * lp1)) * _reX, 725.0000000 * _reY, (175.0000000 + float(172 * lp1)) * _reX, 745.0000000 * _reY, int(0.0108333 * C.ClipY), C.MakeColorNoEmpty(0, 0, 0, 0), 1, 1);
        }
        ++lp1;
        // [Loop Continue]
        goto J0x9E;
    }
    C.BtrDrawTextJustifiedWithVolumeLine(strAlienSelect, 0, 12.0000000 * _reX, 705.0000000 * _reY, 100.0000000 * _reX, 722.0000000 * _reY, int(0.0108333 * C.ClipY), C.MakeColorNoEmpty(0, 0, 0, 0), 1, 1);
    // End:0x42F
    if(fCurAlienRespawnTime >= float(10))
    {
        __DrawDisplaySelectMenu__Delegate = None;
        bSelectAlienType = false;        
    }
    else
    {
        strBuffer = string(int(Ceil(float(10) - fCurAlienRespawnTime))) $ strAlienSelectWaitMesage;
        C.BtrDrawTextJustifiedWithVolumeLine(strBuffer, 0, 300.0000000 * _reX, 705.0000000 * _reY, 548.0000000 * _reX, 722.0000000 * _reY, int(0.0108333 * C.ClipY), C.MakeColorNoEmpty(0, 0, 0, 0), 1, 1);
    }
    //return;    
}

function DrawAlienModeSkillSlot(Canvas C)
{
    local int lp1;
    local CalCoordsW calW;

    lp1 = 0;
    J0x07:

    // End:0x182 [Loop If]
    if(lp1 < 2)
    {
        WAlienModeSkillSlot.OffsetX = 1529;
        WAlienModeSkillSlot.OffsetY = 434 + (72 * lp1);
        CalculateCoordinateEx(C, WAlienModeSkillSlot, 71.0000000, 71.0000000, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WAlienModeSkillSlot.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
        CalculateCoordinateEx(C, WAlienModeSkillType[lp1], 64.0000000, 64.0000000, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WAlienModeSkillType[lp1].WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
        ++lp1;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function DrawAlienCoolTimeSkillSlot(Canvas C)
{
    local int lp1, iCurTime;
    local wAlienController ac;
    local string strBuffer;

    ac = wAlienController(PlayerOwner);
    lp1 = 0;
    J0x17:

    // End:0x2FB [Loop If]
    if(lp1 < ac.CoolTimeSkills.Length)
    {
        // End:0x7D
        if((ac.CoolTimeSkills[lp1].SkillObject != none) && ac.CoolTimeSkills[lp1].SkillObject.IsEnable == false)
        {
            // [Explicit Continue]
            goto J0x2F1;
        }
        // End:0x1BF
        if(ac.CoolTimeSkills[lp1].bIsActive == true)
        {
            iCurTime = int(Round(ac.CoolTimeSkills[lp1].SkillObject.GetMaxActiveTime() - ac.CoolTimeSkills[lp1].fCurActiveTime));
            C.SetDrawColor(byte(255), 0, 0, byte(255));
            strBuffer = string(iCurTime) $ strSecond;
            C.BtrDrawTextJustifiedWithVolumeLine(strBuffer, 1, (279.0000000 + float(70 * lp1)) * _reX, 1123.0000000 * _reY, (347.0000000 + float(70 * lp1)) * _reX, 1195.0000000 * _reY, int(float(20) * _reY), C.MakeColorNoEmpty(byte(255), 0, 0, 0), 1, 1);
            C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
            // [Explicit Continue]
            goto J0x2F1;
        }
        iCurTime = int(Round(ac.CoolTimeSkills[lp1].SkillObject.GetMaxCoolTime() - ac.CoolTimeSkills[lp1].fCurCoolTime));
        // End:0x2F1
        if(float(iCurTime) > 0.1000000)
        {
            C.SetDrawColor(byte(255), byte(255), 0, byte(255));
            strBuffer = string(iCurTime) $ strSecond;
            C.BtrDrawTextJustifiedWithVolumeLine(strBuffer, 1, (279.0000000 + float(70 * lp1)) * _reX, 1123.0000000 * _reY, (347.0000000 + float(70 * lp1)) * _reX, 1195.0000000 * _reY, int(float(20) * _reY), C.MakeColorNoEmpty(byte(255), 0, 0, 0), 1, 1);
            C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
        }
        J0x2F1:

        ++lp1;
        // [Loop Continue]
        goto J0x17;
    }
    //return;    
}

function DrawSuperAlienDisplayBackScreen(Canvas C)
{
    DrawAlienDisplayBackScreen(C);
    C.SetPos(0.0000000, 0.0000000);
    C.DrawColor.A = byte(fSuperHeroEffectFirstRange + (fSuperHeroEffectCurValue * (fSuperHeroEffectEndRange - fSuperHeroEffectFirstRange)));
    C.DrawTile(ShowHealthInDanager_Material, C.ClipX, C.ClipY, 0.0000000, 0.0000000, 512.0000000, 512.0000000);
    fSuperHeroEffectCurValue += Level.AppDeltaTime;
    // End:0xCD
    if(fSuperHeroEffectCurValue > 1.0000000)
    {
        fSuperHeroEffectCurValue = 0.0000000;
        SwapSuperHeroEffectValue();
    }
    C.DrawColor.A = byte(255);
    //return;    
}

function SwapSuperHeroEffectValue()
{
    local float fTempValue;

    fTempValue = fSuperHeroEffectFirstRange;
    fSuperHeroEffectFirstRange = fSuperHeroEffectEndRange;
    fSuperHeroEffectEndRange = fTempValue;
    //return;    
}

function ChangeSuperAlienBackScreen()
{
    fSuperHeroEffectCurValue = 0.0000000;
    __DrawBackScreen__Delegate = DrawSuperAlienDisplayBackScreen;
    //return;    
}

function ChangeHudType(byte Type)
{
    switch(Type)
    {
        // End:0xEB
        case 1:
            UpdateSelectAlienMenu();
            strRoundGoalMsg = strAlienGoalMsg;
            __DrawDisplayHUD__Delegate = DrawAlienDisplyHud;
            __DrawBackScreen__Delegate = DrawAlienDisplayBackScreen;
            ShowFallDamage_Duration = 1.0000000;
            SndHeartBeatDanagerSound = Class'WGame.wAlienMaleSoundGroup'.default.SndAlienHeartBeatDanagerSound[int(wAlienPlayerReplicationInfo(PawnOwner.PlayerReplicationInfo).eSkinType)];
            SndFallDanagerSound = Class'WGame.wAlienMaleSoundGroup'.default.SndFallDanagerSound[int(wAlienPlayerReplicationInfo(PawnOwner.PlayerReplicationInfo).eSkinType)];
            SndHeartBeatEmergencySound = Class'WGame.wAlienMaleSoundGroup'.default.SndHeartBeatEmergencySound[int(wAlienPlayerReplicationInfo(PawnOwner.PlayerReplicationInfo).eSkinType)];
            PlayerOwner.bToggleRadioMessage = false;
            // End:0x1C1
            break;
        // End:0x16E
        case 0:
            __DrawDisplaySelectMenu__Delegate = None;
            strRoundGoalMsg = strHumanGoalMsg;
            __DrawDisplayHUD__Delegate = DrawHumanDisplyHud;
            __DrawBackScreen__Delegate = DrawHumanDisplayBackScreen;
            ShowFallDamage_Duration = default.ShowFallDamage_Duration;
            SndHeartBeatDanagerSound = Class'XInterface.HudCDeathmatch'.default.SndHeartBeatDanagerSound;
            SndFallDanagerSound = Class'XInterface.HudCDeathmatch'.default.SndFallDanagerSound;
            SndHeartBeatEmergencySound = Class'XInterface.HudCDeathmatch'.default.SndHeartBeatEmergencySound;
            byHeroDisplayIndex = 0;
            // End:0x1C1
            break;
        // End:0x1BE
        case 2:
            __DrawDisplaySelectMenu__Delegate = None;
            strRoundGoalMsg = "";
            __DrawDisplayHUD__Delegate = None;
            __DrawBackScreen__Delegate = None;
            fCurAlienRespawnTime = 0.0000000;
            bSelectAlienType = false;
            DisalbeWeaponSlot5Hud();
            DisalbeWeaponSlot6Hud();
            // End:0x1C1
            break;
        // End:0xFFFF
        default:
            break;
    }
    byAlienGame_MenuType = Type;
    //return;    
}

simulated function InsertUsingSkillList(int SkillID, int weaponID, optional int SubSkillID)
{
    super(HudCDeathmatch).InsertUsingSkillList(SkillID, weaponID, SubSkillID);
    ActiveUsingSkill.iState = 1;
    bEnableSlot5 = false;
    ChangeWeaponSlot5Hud(none);
    //return;    
}

simulated function UpdateSelectAlienMenu()
{
    // End:0x2D
    if(AlienObjectTypes.Length > 1)
    {
        fCurAlienRespawnTime = 0.0000000;
        bSelectAlienType = true;
        __DrawDisplaySelectMenu__Delegate = DrawDisplaySelectAlienMenu;        
    }
    else
    {
        __DrawDisplaySelectMenu__Delegate = None;
    }
    //return;    
}

simulated function CacheSuppliesPositions(Actor act)
{
    super(HudCDeathmatch).CacheSuppliesPositions(act);
    // End:0x25
    if(HudPart_Minimap != none)
    {
        HudPart_Minimap.CacheSpecialPositions();
    }
    // End:0x3F
    if(HudPart_Bigmap != none)
    {
        HudPart_Bigmap.CacheSpecialPositions();
    }
    // End:0x75
    if(xScoreBoardTeamGame(ScoreBoard).PartMinimap != none)
    {
        xScoreBoardTeamGame(ScoreBoard).PartMinimap.CacheSpecialPositions();
    }
    //return;    
}

simulated function DeleteSuppliesPositions(Actor act)
{
    super(HudCDeathmatch).DeleteSuppliesPositions(act);
    // End:0x2A
    if(HudPart_Minimap != none)
    {
        HudPart_Minimap.RemoveSpecialPositions(act);
    }
    // End:0x49
    if(HudPart_Bigmap != none)
    {
        HudPart_Bigmap.RemoveSpecialPositions(act);
    }
    // End:0x84
    if(xScoreBoardTeamGame(ScoreBoard).PartMinimap != none)
    {
        xScoreBoardTeamGame(ScoreBoard).PartMinimap.RemoveSpecialPositions(act);
    }
    //return;    
}

function bool DrawSpecialSkillMedal(Canvas C, int Index, int width, int Height, CalCoordsW calW, int PosX, int PosY, float curScale)
{
    local wAlienPlayerReplicationInfo PRI;

    PRI = wAlienPlayerReplicationInfo(PawnOwner.PlayerReplicationInfo);
    switch(LocalMessages[Index].StringMessage)
    {
        // End:0xD5
        case "MeleeKill":
            // End:0x92
            if(Class'Engine.wGameManager'.static.IsAlienTeamType(PRI.eObjType))
            {
                DrawKillMarkEffect(C, WAlienMeleeKill, float(width), float(Height), calW, float(PosX), float(PosY), curScale);                
            }
            else
            {
                DrawKillMarkEffect(C, WMeleeKill, float(width), float(Height), calW, float(PosX), float(PosY), curScale);
            }
            CallSpecialSkillMedelSound(Index);
            return true;
        // End:0x17E
        case "headshot":
            // End:0x13B
            if(Class'Engine.wGameManager'.static.IsAlienTeamType(PRI.eObjType))
            {
                DrawKillMarkEffect(C, WAlienMeleeKill, float(width), float(Height), calW, float(PosX), float(PosY), curScale);                
            }
            else
            {
                DrawKillMarkEffect(C, WHeadshot, float(width), float(Height), calW, float(PosX), float(PosY), curScale);
            }
            CallSpecialSkillMedelSound(Index);
            return true;
        // End:0xFFFF
        default:
            return super(HudCDeathmatch).DrawSpecialSkillMedal(C, Index, width, Height, calW, PosX, PosY, curScale);
            break;
    }
    return false;
    //return;    
}

function OnClientReceiveDeathMessage(PlayerController P, int Switch, PlayerReplicationInfo attackerPRI, PlayerReplicationInfo victimPRI, optional Object OptionalObject)
{
    local wAlienPlayerReplicationInfo PRI;
    local Class<DamageType> DamageType;

    PRI = wAlienPlayerReplicationInfo(attackerPRI);
    DamageType = Class<DamageType>(OptionalObject);
    // End:0x31
    if(DamageType == Class'Engine.Suicided')
    {
        return;
    }
    // End:0xA2
    if(Class'Engine.wGameManager'.static.IsAlienTeamType(PRI.eObjType))
    {
        // End:0xA2
        if(DamageType != Class'Engine.wDamageStepOn')
        {
            DamageType = Class<DamageType>(DynamicLoadObject("WWeapons_Res.wWeaponRes_Special_AlienMelee", Class'Core.Class'));
        }
    }
    // End:0x1A6
    if(((P != none) && victimPRI != none) && DamageType != none)
    {
        // End:0x183
        if(attackerPRI != none)
        {
            HudPart_KillMessage.AddKillMessage(attackerPRI, victimPRI, DamageType, Switch);
            // End:0x180
            if((attackerPRI == PlayerOwner.PlayerReplicationInfo) || victimPRI == PlayerOwner.PlayerReplicationInfo)
            {
                LastSelfKillMessage = MakeSelfKillMessage(attackerPRI.PlayerName, victimPRI.PlayerName, DamageType);
                // End:0x180
                if(victimPRI == PlayerOwner.PlayerReplicationInfo)
                {
                    RefreshKillerMark(attackerPRI.PlayerName);
                }
            }            
        }
        else
        {
            HudPart_KillMessage.AddKillMessage(attackerPRI, victimPRI, DamageType, Switch);
        }
    }
    //return;    
}

function NotifyHealthInDanger()
{
    // End:0x75
    if(Class'Engine.wGameManager'.static.IsAlienTeamType(wAlienPlayerReplicationInfo(MSPRI).eObjType))
    {
        // End:0x72
        if((PlayerOwner != none) && (PlayerOwner.fSprintTime / PawnOwner.wMyParam.Stm_MaxTime) < PawnOwner.fMinStaminaRatio)
        {
            super(HudCDeathmatch).NotifyHealthInDanger();
        }        
    }
    else
    {
        super(HudCDeathmatch).NotifyHealthInDanger();
    }
    //return;    
}

function ChangeSuperHeroMark()
{
    byHeroDisplayIndex = 1;
    //return;    
}

function AddTeamDeathInfo(Pawn P, PlayerReplicationInfo PRI, float FadeTime, float Duration)
{
    // End:0x3F
    if(Class'Engine.wGameManager'.static.IsAlienTeamType(wAlienPlayerReplicationInfo(PRI).eObjType))
    {
        super(HudCDeathmatch).AddTeamDeathInfo(P, PRI, FadeTime, Duration);
    }
    //return;    
}

function UpdateModeItemSlot_Alien()
{
    local wSkill SkillObject;
    local int lp1, lp2;

    lp2 = 0;
    // End:0xDE
    if(PlayerOwner != none)
    {
        lp1 = 0;
        J0x19:

        // End:0x45 [Loop If]
        if(lp1 < 2)
        {
            WAlienModeSkillType[lp1].WidgetTexture = matEmptySkillSlot;
            ++lp1;
            // [Loop Continue]
            goto J0x19;
        }
        lp1 = 0;
        J0x4C:

        // End:0xDE [Loop If]
        if(lp1 < PlayerOwner.SkillBase.Skills.Length)
        {
            SkillObject = PlayerOwner.SkillBase.Skills[lp1];
            // End:0xC2
            if(SkillObject.IsA('wSkill_AddInfectionPoint'))
            {
                WAlienModeSkillType[lp2++].WidgetTexture = matModeItemIcons[int(1)];
            }
            // End:0xD4
            if((lp2 + 1) > 2)
            {
                // [Explicit Break]
                goto J0xDE;
            }
            ++lp1;
            // [Loop Continue]
            goto J0x4C;
        }
    }
    J0xDE:

    //return;    
}

function UpdateModeItemSlot_Human()
{
    local wSkill SkillObject;
    local int lp1, lp2;

    lp2 = 0;
    // End:0xF3
    if(PlayerOwner != none)
    {
        lp1 = 0;
        J0x19:

        // End:0x45 [Loop If]
        if(lp1 < 2)
        {
            WAlienModeSkillType[lp1].WidgetTexture = matEmptySkillSlot;
            ++lp1;
            // [Loop Continue]
            goto J0x19;
        }
        lp1 = 0;
        J0x4C:

        // End:0xF3 [Loop If]
        if(lp1 < PlayerOwner.SkillBase.Skills.Length)
        {
            SkillObject = PlayerOwner.SkillBase.Skills[lp1];
            // End:0xD7
            if(SkillObject.IsA('wSkill_NoTransferAlien'))
            {
                // End:0xD7
                if(SkillObject.bUpdateProcess == true)
                {
                    WAlienModeSkillType[lp2++].WidgetTexture = matModeItemIcons[int(0)];
                }
            }
            // End:0xE9
            if((lp2 + 1) > 2)
            {
                // [Explicit Break]
                goto J0xF3;
            }
            ++lp1;
            // [Loop Continue]
            goto J0x4C;
        }
    }
    J0xF3:

    //return;    
}

function UpdateModeEquippedItem()
{
    local wGameManager GameMgr;
    local int lp1;
    local wItemBoxInstanceHK instanceInfo;
    local wMatchMaker MM;
    local wItemBoxHK ItemInfo;
    local wAlienCharParam CharParam;

    GameMgr = Level.GameMgr;
    MM = Level.GetMatchMaker();
    AlienObjectTypes.Length = 0;
    // End:0x3E
    if(PlayerOwner == none)
    {
        return;
    }
    AlienObjectTypes[0] = byte(int(GameMgr.0));
    lp1 = 0;
    J0x5C:

    // End:0x159 [Loop If]
    if(lp1 < GameMgr.InstanceItemLists.Length)
    {
        instanceInfo = GameMgr.InstanceItemLists[lp1];
        // End:0x14F
        if((instanceInfo != none) && instanceInfo.SlotPosition == int(32))
        {
            ItemInfo = GameMgr.FindUIItem(instanceInfo.ItemID);
            // End:0x14F
            if((ItemInfo != none) && int(ItemInfo.byModeItem) == MM.kGame_GameMode)
            {
                CharParam = GameMgr.GetAlienCharParamByShopId(ItemInfo.ItemID);
                // End:0x14F
                if(CharParam != none)
                {
                    AlienObjectTypes[AlienObjectTypes.Length] = CharParam.SkinID;
                }
            }
        }
        ++lp1;
        // [Loop Continue]
        goto J0x5C;
    }
    // End:0x1E8
    if(AlienObjectTypes.Length > 1)
    {
        lp1 = 0;
        J0x16C:

        // End:0x1E8 [Loop If]
        if(lp1 < AlienObjectTypes.Length)
        {
            switch(AlienObjectTypes[lp1])
            {
                // End:0x1B2
                case GameMgr.0:
                    WAlienModeAlienType[lp1].WidgetTexture = matAlienTypeIcons[0];
                    // End:0x1DE
                    break;
                // End:0x1DB
                case GameMgr.1:
                    WAlienModeAlienType[lp1].WidgetTexture = matAlienTypeIcons[1];
                    // End:0x1DE
                    break;
                // End:0xFFFF
                default:
                    break;
            }
            ++lp1;
            // [Loop Continue]
            goto J0x16C;
        }
    }
    //return;    
}

function CallEvent(optional bool InvenCheck, optional int iReservation1, optional int iReservation2)
{
    local wAlienPlayerReplicationInfo PRI;

    PRI = wAlienPlayerReplicationInfo(MSPRI);
    // End:0x131
    if(iReservation1 == 14001)
    {
        // End:0x12E
        if(iReservation2 <= (AlienObjectTypes.Length - 1))
        {
            SelectedAlienObjectType = byte(iReservation2);
            // End:0x12E
            if(PRI != none)
            {
                // End:0x11B
                if(int(PRI.eSkinType) != int(AlienObjectTypes[int(SelectedAlienObjectType)]))
                {
                    PRI.eSkinType = AlienObjectTypes[int(SelectedAlienObjectType)];
                    wAlienController(PlayerOwner).ServerChangePawn(PRI.eSkinType);
                    SndHeartBeatDanagerSound = Class'WGame.wAlienMaleSoundGroup'.default.SndAlienHeartBeatDanagerSound[int(PRI.eSkinType)];
                    SndFallDanagerSound = Class'WGame.wAlienMaleSoundGroup'.default.SndFallDanagerSound[int(PRI.eSkinType)];
                    SndHeartBeatEmergencySound = Class'WGame.wAlienMaleSoundGroup'.default.SndHeartBeatEmergencySound[int(PRI.eSkinType)];
                }
                bSelectAlienType = false;
                __DrawDisplaySelectMenu__Delegate = None;
            }
        }        
    }
    else
    {
        super.CallEvent(InvenCheck, iReservation1, iReservation2);
    }
    //return;    
}

function CheckPawnOwnerSkill(out int skillC4, out int skillAirStirke, out int skillRPG)
{
    // End:0x22
    if(int(byAlienGame_MenuType) == 0)
    {
        super(HudCDeathmatch).CheckPawnOwnerSkill(skillC4, skillAirStirke, skillRPG);
    }
    //return;    
}

simulated function Tick(float DeltaTime)
{
    super.Tick(DeltaTime);
    fCurAlienRespawnTime += DeltaTime;
    //return;    
}

function ChangeWeaponSlot5Hud(wWeapon newWeapon, optional bool bAddSkill)
{
    // End:0x21
    if(int(byAlienGame_MenuType) == 0)
    {
        super(HudCDeathmatch).ChangeWeaponSlot5Hud(newWeapon, bAddSkill);        
    }
    else
    {
        // End:0x6F
        if(int(byAlienGame_MenuType) == 1)
        {
            // End:0x58
            if(ActiveUsingSkill.iState == 1)
            {
                SkillSlot5.WidgetTexture = ActiveUsingSkill.matIcon[1];                
            }
            else
            {
                SkillSlot5.WidgetTexture = ActiveUsingSkill.matIcon[0];
            }
        }
    }
    //return;    
}

simulated function LocalizedMessage2(Class<LocalMessage> Message, optional int Switch, optional bool bOption_Push, optional string CriticalString)
{
    local wSkill SkillObject;

    super(HudBase).LocalizedMessage2(Message, Switch, bOption_Push, CriticalString);
    // End:0xD6
    if(Message == Class'Engine.wMessage_Game_Alien')
    {
        switch(Switch)
        {
            // End:0x42
            case Class'Engine.wMessage_Game_Alien'.default.Code_AMDefenceToAlien:
            // End:0xD3
            case Class'Engine.wMessage_Game_Alien'.default.Code_AMYouwereSuperHero:
                SkillObject = PlayerOwner.SkillBase.FindSkillByClassName('wSkill_NoTransferAlien');
                // End:0xCA
                if(SkillObject != none)
                {
                    // End:0xB9
                    if(int(wAlienPlayerReplicationInfo(PlayerOwner.PlayerReplicationInfo).NoTransferAlienPoint) >= 1)
                    {
                        SkillObject.bUpdateProcess = true;                        
                    }
                    else
                    {
                        SkillObject.bUpdateProcess = false;
                    }
                }
                UpdateModeItemSlot_Human();
                // End:0xD6
                break;
            // End:0xFFFF
            default:
                break;
        }
    }
    else
    {
        //return;        
    }
}

function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
    // End:0x2F
    if(false == wAlienController(PlayerOwner).bShowDebug_AlienPlayerInfo)
    {
        super(HudCDeathmatch).DisplayDebug(Canvas, YL, YPos);
    }
    //return;    
}

exec function ShowRadioMessage()
{
    local wAlienPlayerReplicationInfo PRI;

    PRI = wAlienPlayerReplicationInfo(PawnOwner.PlayerReplicationInfo);
    // End:0x3E
    if(Class'Engine.wGameManager'.static.IsAlienTeamType(PRI.eObjType))
    {
        return;        
    }
    else
    {
        super(HudCDeathmatch).ShowRadioMessage();
    }
    //return;    
}

exec function ShowRadioMessage_Alarm()
{
    local wAlienPlayerReplicationInfo PRI;

    PRI = wAlienPlayerReplicationInfo(PawnOwner.PlayerReplicationInfo);
    // End:0x3E
    if(Class'Engine.wGameManager'.static.IsAlienTeamType(PRI.eObjType))
    {
        return;        
    }
    else
    {
        super(HudCDeathmatch).ShowRadioMessage_Alarm();
    }
    //return;    
}

exec function ShowRadioMessage_Notify()
{
    local wAlienPlayerReplicationInfo PRI;

    PRI = wAlienPlayerReplicationInfo(PawnOwner.PlayerReplicationInfo);
    // End:0x3E
    if(Class'Engine.wGameManager'.static.IsAlienTeamType(PRI.eObjType))
    {
        return;        
    }
    else
    {
        super(HudCDeathmatch).ShowRadioMessage_Notify();
    }
    //return;    
}

function DrawAddScore(Canvas C, int i, float ScorePosX, float ScorePosY, optional int MessageScoreEffect, optional float CurrentScale)
{
    //return;    
}

defaultproperties
{
    WAlienSelectMenuBack=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_ailanmode_ailanarea_cashpopup_back',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=580,Y2=117),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=699,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WAlienSelectBut_Cli=(WidgetTexture=Texture'Warfare_GP_UI_UI.Store.list_remodeling_remodelingitem',RenderStyle=5,TextureCoords=(X1=169,Y1=0,X2=338,Y2=86),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WAlienSelectBut_Nor=(WidgetTexture=Texture'Warfare_GP_UI_UI.Store.list_remodeling_remodelingitem',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=169,Y2=86),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WHumanMarkDisplay=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_ailanmode_humanarea_mark',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=177,Y2=135),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=1006,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WAlienMarkDisplay=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_ailanmode_ailanarea_mark',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=177,Y2=135),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=1006,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WAlienModeSkillSlot=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_alianmode_item_bg',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=71,Y2=71),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WAlienModeSkillType[0]=(WidgetTexture=Texture'Warfare_UI_Item.SupplySkillicon.icon_skil_empty',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=1531,OffsetY=436,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WAlienModeSkillType[1]=(WidgetTexture=Texture'Warfare_UI_Item.SupplySkillicon.icon_skil_empty',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=1531,OffsetY=508,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WAlienModeAlienType[0]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=128,Y2=64),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=4,OffsetY=725,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WAlienModeAlienType[1]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=128,Y2=64),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=176,OffsetY=725,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WAlienModeAlienType[2]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=128,Y2=64),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=348,OffsetY=725,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    matModeItemIcons[0]=Texture'Warfare_UI_Item.SupplySkillicon.Icon_HUDitem_Alien_defense'
    matModeItemIcons[1]=Texture'Warfare_UI_Item.SupplySkillicon.Icon_HUDitem_Alien_point'
    matAlienTypeIcons[0]=Texture'Warfare_UI_Item.ShopIcon.Item_Item_SC_Alien_master'
    matAlienTypeIcons[1]=Texture'Warfare_UI_Item.ShopIcon.Item_Item_SC_Alien_tanker'
    WHumanAttackBuffDisplay=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_ailanmode_humanarea_strikepower_back',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=972,Y2=77),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=270,OffsetY=1123,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WHumanAttackLevelDisplay[0]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_ailanmode_humanarea_strikepower_step',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=51,Y2=38),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=558,OffsetY=1129,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WHumanAttackLevelDisplay[1]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_ailanmode_humanarea_strikepower_step',RenderStyle=5,TextureCoords=(X1=51,Y1=0,X2=102,Y2=38),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=614,OffsetY=1129,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WHumanAttackLevelDisplay[2]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_ailanmode_humanarea_strikepower_step',RenderStyle=5,TextureCoords=(X1=102,Y1=0,X2=153,Y2=38),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=670,OffsetY=1129,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WHumanAttackLevelDisplay[3]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_ailanmode_humanarea_strikepower_step',RenderStyle=5,TextureCoords=(X1=153,Y1=0,X2=204,Y2=38),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=726,OffsetY=1129,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WHumanAttackLevelDisplay[4]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_ailanmode_humanarea_strikepower_step',RenderStyle=5,TextureCoords=(X1=204,Y1=0,X2=255,Y2=38),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=782,OffsetY=1129,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WHumanAttackLevelDisplay[5]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_ailanmode_humanarea_strikepower_step',RenderStyle=5,TextureCoords=(X1=255,Y1=0,X2=306,Y2=38),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=838,OffsetY=1129,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WHumanAttackLevelDisplay[6]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_ailanmode_humanarea_strikepower_step',RenderStyle=5,TextureCoords=(X1=306,Y1=0,X2=357,Y2=38),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=894,OffsetY=1129,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WHumanAttackLevelDisplay[7]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_ailanmode_humanarea_strikepower_step',RenderStyle=5,TextureCoords=(X1=357,Y1=0,X2=408,Y2=38),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=950,OffsetY=1129,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WHumanAttackLevelDisplay[8]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_ailanmode_humanarea_strikepower_step',RenderStyle=5,TextureCoords=(X1=408,Y1=0,X2=459,Y2=38),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=1006,OffsetY=1129,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WHumanAttackLevelDisplay[9]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_ailanmode_humanarea_strikepower_step',RenderStyle=5,TextureCoords=(X1=459,Y1=0,X2=510,Y2=38),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=1062,OffsetY=1129,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    strOriAttackBuffMsg="Attack power increased %0 levels"
    WAlienLevelBackDisplay=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_ailanmode_ailanarea_infect_back',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=972,Y2=121),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=270,OffsetY=1079,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WAlienLevelDisplay[0]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_ailanmode_ailanarea_infect_step',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=88,Y2=75),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=576,OffsetY=1086,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WAlienLevelDisplay[1]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_ailanmode_ailanarea_infect_step',RenderStyle=5,TextureCoords=(X1=88,Y1=0,X2=176,Y2=75),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=666,OffsetY=1086,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WAlienLevelDisplay[2]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_ailanmode_ailanarea_infect_step',RenderStyle=5,TextureCoords=(X1=176,Y1=0,X2=264,Y2=75),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=755,OffsetY=1086,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WAlienLevelDisplay[3]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_ailanmode_ailanarea_infect_step',RenderStyle=5,TextureCoords=(X1=264,Y1=0,X2=352,Y2=75),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=845,OffsetY=1086,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WAlienLevelDisplay[4]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_ailanmode_ailanarea_infect_step',RenderStyle=5,TextureCoords=(X1=352,Y1=0,X2=440,Y2=75),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=934,OffsetY=1086,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WAlienEyeBackDisplay=(WidgetTexture=Texture'FX_TEX.Alien_FX.img_HUD_alianmode_alian_eye',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=1024,Y2=768),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    strHumanGoalMsg="Survive the Alien attack!"
    strAlienGoalMsg="Infect the humans!"
    strAlienLevelMsg[0]="Alien Underling"
    strAlienLevelMsg[1]="Alien Host"
    strAlienLevelMsg[2]="Alien Mater"
    WHeroIconDisplays[0]=(WidgetTexture=Texture'Warfare_GP_UI_HUD_ETC.DisplayIcon.atomicHP_defense',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=128,Y2=128),TextureScale=0.3700000,DrawPivot=5,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WHeroIconDisplays[1]=(WidgetTexture=Texture'Warfare_GP_UI_HUD_ETC.DisplayIcon.hurdleHP_defense',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=128,Y2=128),TextureScale=0.3700000,DrawPivot=5,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    strAlienSelect="Select Alien"
    WAlienMeleeKill=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_kill_markmedal',RenderStyle=5,TextureCoords=(X1=200,Y1=316,X2=400,Y2=474),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=700,OffsetY=103,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    strSecond=" s"
    strAlienSelectKey[0]="F1"
    strAlienSelectKey[1]="F2"
    strAlienSelectKey[2]="F3"
    strAlienSelectWaitMesage="seconds until window automatically disappears."
    fSuperHeroEffectFirstRange=20.0000000
    fSuperHeroEffectEndRange=70.0000000
    strHumanHeroName[0]="Hero"
    strHumanHeroName[1]="MVP"
    TeamDeathSprite=(WidgetTexture=Texture'Warfare_GP_UI_HUD_ETC.DisplayIcon.our_sol_death_alien',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=63,Y2=63),TextureScale=0.6500000,DrawPivot=5,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    MinimapClass=Class'WMission_Decompressed.wHudPart_MinimapAlienGame'
}