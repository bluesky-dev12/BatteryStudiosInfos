/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\wHudPart_DisplayMain.uc
 * Package Imports:
 *	XInterface
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:35
 *	Functions:16
 *
 *******************************************************************************/
class wHudPart_DisplayMain extends wHudPart_DisplayBase
    transient;

var() SpriteWidget HelpKeyButtonBackground;
var() SpriteWidget HelpKeyButtonRun;
var() SpriteWidget HelpKeyButtonWorldMap;
var() SpriteWidget HelpKeyButtonAim;
var() SpriteWidget HelpKeyButtonMiliAttack;
var() SpriteWidget HelpKeyButtonSkill[2];
var() SpriteWidget HelpKeyButtonUAV;
var() SpriteWidget HelpKeyButtonBomb;
var float WidthBomb;
var() SpriteWidget WSkill2[6];
var() SpriteWidget WSkill3[5];
var SpriteWidget HelpKeyButtonBattleHelp;
var SpriteWidget WBattleHelp;
var int HasSkills;
var bool DrawSkills;
var bool CheckDead;
var float CheckDeadTime;
var float StartDrawTime;
var float QuitDrawTime;
var float fFadeOutTime;
var float fDrawTime;
var float RespawnTime;
var int HasSkillNum;
var float WidthSprint;
var float WidthWorldMap;
var float WidthAim;
var float WidthMelee;
var float WidthSkill[3];
var int iCountSlot3;
var int iCountSlot4;
var bool bUpdate;
var localized string lsChattingHelp;
var localized string lsSurvivedString;
var localized string lsTeamAF;
var localized string lsTeamRSA;

function CallEvent(optional bool ItemCheck, optional int iReservation1, optional int iReservation2)
{
    switch(iReservation1)
    {
        // End:0x18
        case 666:
            SendHostPointInGame();
            // End:0x51
            break;
        // End:0x2f
        case 777:
            CheckOwnerSkill();
            DisplayEvent_ActiveSkill();
            // End:0x51
            break;
        // End:0x40
        case 888:
            UpdateHelpKeyControll();
            // End:0x51
            break;
        // End:0x4b
        case 1001:
            // End:0x51
            break;
        // End:0xffff
        default:
            // End:0x51 Break;
            break;
    }
}

function DisplayEvent_ActiveSkill()
{
    StartDrawTime = Level.TimeSeconds;
    QuitDrawTime = Level.TimeSeconds + fDrawTime + fFadeOutTime;
}

function UpdateHelpKey_Slot(byte iIndex, bool bEnable)
{
    // End:0x92
    if(iIndex == 5)
    {
        // End:0x81
        if(bEnable == true)
        {
            GUIController(HudOwner.PlayerOwner.Player.GUIController).GetAssignedKeys("SwitchWeapon 5", keys, LocalizedKeys);
            GetKeyTexture(keys[0], HelpKeyButtonSkill[0], WidthSkill[0]);
        }
        // End:0x8f
        else
        {
            HelpKeyButtonSkill[0].WidgetTexture = none;
        }
    }
    // End:0x121
    else
    {
        // End:0x121
        if(iIndex == 6)
        {
            // End:0x113
            if(bEnable == true)
            {
                GUIController(HudOwner.PlayerOwner.Player.GUIController).GetAssignedKeys("SwitchWeapon 6", keys, LocalizedKeys);
                GetKeyTexture(keys[0], HelpKeyButtonSkill[1], WidthSkill[1]);
            }
            // End:0x121
            else
            {
                HelpKeyButtonSkill[1].WidgetTexture = none;
            }
        }
    }
}

function UpdateHelpKeyControll()
{
    // End:0x47
    if(HudOwner.PlayerOwner.Player == none && HudOwner.PlayerOwner.Player.GUIController == none)
    {
        return;
    }
    GUIController(HudOwner.PlayerOwner.Player.GUIController).GetAssignedKeys("Walking", keys, LocalizedKeys);
    GetKeyTexture(keys[0], HelpKeyButtonRun, WidthSprint, float(default.HelpKeyButtonRun.OffsetX));
    GUIController(HudOwner.PlayerOwner.Player.GUIController).GetAssignedKeys("ShowBigmap", keys, LocalizedKeys);
    GetKeyTexture(keys[0], HelpKeyButtonWorldMap, WidthWorldMap, float(default.HelpKeyButtonWorldMap.OffsetX));
    GUIController(HudOwner.PlayerOwner.Player.GUIController).GetAssignedKeys("AltFire", keys, LocalizedKeys);
    GetKeyTexture(keys[0], HelpKeyButtonAim, WidthAim, float(default.HelpKeyButtonAim.OffsetX));
    GUIController(HudOwner.PlayerOwner.Player.GUIController).GetAssignedKeys("MeleeAttack", keys, LocalizedKeys);
    GetKeyTexture(keys[0], HelpKeyButtonMiliAttack, WidthMelee, float(default.HelpKeyButtonMiliAttack.OffsetX));
}

function SendHostPointInGame()
{
    local GUIController GC;
    local wMatchMaker kMM;

    kMM = Level.GetMatchMaker();
    GC = GUIController(HudOwner.PlayerOwner.Player.GUIController);
    // End:0x88
    if(GC != none && GC.TcpHandler != none)
    {
        GC.TcpHandler.sfReqUpdateMyHostPriorityPoint(kMM.GetHostPoint());
    }
}

function DrawA(Canvas C)
{
    // End:0x42
    if(HudOwner == none || HudOwner.PlayerOwner == none || HudOwner.PlayerOwner.Pawn == none)
    {
        return;
    }
    // End:0x91
    if(false == bUpdate && HudOwner.PawnOwner != none && HudOwner.PawnOwner.Inventory != none)
    {
        UpdateHelpKeyControll();
        bUpdate = true;
    }
    // End:0xb4
    if(Level.TimeSeconds < QuitDrawTime)
    {
        DrawHasSkill(C);
    }
}

function DrawSpectating(Canvas C);
function DrawHelpKeyControll(Canvas C)
{
    local CalCoordsW calW;

    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    CalculateCoordinateEx(C, HelpKeyButtonSkill[0], 26.0, 26.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    // End:0xcc
    if(none != HelpKeyButtonSkill[0].WidgetTexture)
    {
        C.DrawTile(HelpKeyButtonSkill[0].WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    }
    CalculateCoordinateEx(C, HelpKeyButtonSkill[1], 26.0, 26.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    // End:0x179
    if(none != HelpKeyButtonSkill[1].WidgetTexture)
    {
        C.DrawTile(HelpKeyButtonSkill[1].WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    }
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
}

function DrawHelpKeyControll_Bomb(Canvas C)
{
    local CalCoordsW calW;

    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    CalculateCoordinateEx(C, HelpKeyButtonBomb, WidthBomb, 26.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    // End:0xc6
    if(none != HelpKeyButtonBomb.WidgetTexture)
    {
        C.DrawTile(HelpKeyButtonBomb.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    }
}

function DrawBlinkActiveKey(Canvas C)
{
    local CalCoordsW calW;
    local int i, ActiveSlot;

    // End:0x7a
    if(2 == HudCDeathmatch(HudOwner).HasSkillC4 || 2 == HudCDeathmatch(HudOwner).HasSkillRPG || true == HudCDeathmatch(HudOwner).bSkill_ATR || true == HudCDeathmatch(HudOwner).bSkill_M2B)
    {
        ActiveSlot[0] = 1;
    }
    // End:0xf3
    else
    {
        // End:0xf3
        if(1 == HudCDeathmatch(HudOwner).PawnOwnerPRI.bySupply_Helipack || 1 == HudCDeathmatch(HudOwner).PawnOwnerPRI.bySupply_Helipack || 1 == HudCDeathmatch(HudOwner).PawnOwnerPRI.bySupply_AirStrike)
        {
            ActiveSlot[1] = 1;
        }
    }
    i = 0;
    J0xfa:
    // End:0x215 [While If]
    if(i < 2)
    {
        // End:0x11a
        if(1 != ActiveSlot[i])
        {
        }
        // End:0x20b
        else
        {
            // End:0x136
            if(!HudCDeathmatch(HudOwner).bBlinkState)
            {
            }
            // End:0x20b
            else
            {
                WKeyButtonBGSmallBlink.OffsetX = HelpKeyButtonSkill[i].OffsetX - 2;
                WKeyButtonBGSmallBlink.OffsetY = HelpKeyButtonSkill[i].OffsetY - 2;
                CalculateCoordinateEx(C, WKeyButtonBGSmallBlink, 30.0, 30.0, calW);
                C.SetPos(calW.X1, calW.Y1);
                C.DrawTile(WKeyButtonBGSmallBlink.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xfa;
    }
}

function CheckOwnerSkill()
{
    local int iTemp, iCount, iNum;
    local Material mat;
    local array<wSkill> arSkills, PlayerSkills;
    local wSkill WTemp;

    Log(string(self) $ "[wHudPart_DisplayMain::CheckOwnerSkill() ]");
    // End:0x68
    if(HudOwner.PlayerOwner == none || HudOwner.PlayerOwner.SkillBase == none)
    {
        return;
    }
    arSkills = HudOwner.PlayerOwner.SkillBase.Skills;
    iNum = 0;
    iTemp = 0;
    J0x9c:
    // End:0x1b1 [While If]
    if(iTemp < arSkills.Length)
    {
        WTemp = arSkills[iTemp];
        switch(WTemp.SkillID)
        {
            // End:0xd8
            case 40005:
                // End:0x185
                break;
            // End:0xe0
            case 40006:
            // End:0xe8
            case 40007:
            // End:0xf0
            case 40008:
            // End:0xf8
            case 40009:
            // End:0x100
            case 40010:
            // End:0x108
            case 40011:
            // End:0x110
            case 40013:
            // End:0x118
            case 40014:
            // End:0x120
            case 40015:
            // End:0x128
            case 40016:
            // End:0x130
            case 40019:
            // End:0x138
            case 40020:
            // End:0x167
            case 40021:
                PlayerSkills.Insert(iNum, 1);
                PlayerSkills[iNum] = WTemp;
                ++ iNum;
                // End:0x185
                break;
            // End:0x16f
            case 40017:
            // End:0x177
            case 40018:
            // End:0x182
            case 40022:
                // End:0x185
                break;
            // End:0xffff
            default:
                HudCDeathmatch(HudOwner).InsertUsingSkillList(WTemp.SkillID);
                ++ iTemp;
                // This is an implied JumpToken; Continue!
                goto J0x9c;
            }
            HasSkillNum = PlayerSkills.Length;
            HasSkills = int(float(PlayerSkills.Length) % float(2));
            iCount = 0;
            iTemp = 0;
            J0x1e1:
            // End:0x37a [While If]
            if(iTemp < PlayerSkills.Length)
            {
                switch(PlayerSkills[iTemp].SkillID)
                {
                    // End:0x21d
                    case 40006:
                        mat = texture'icon_skil_life_rep';
                        // End:0x328
                        break;
                    // End:0x233
                    case 40007:
                        mat = texture'icon_skil_qikwea';
                        // End:0x328
                        break;
                    // End:0x249
                    case 40008:
                        mat = texture'icon_skil_qikload';
                        // End:0x328
                        break;
                    // End:0x25f
                    case 40009:
                        mat = texture'icon_skil_qikzoom';
                        // End:0x328
                        break;
                    // End:0x275
                    case 40010:
                        mat = texture'icon_skil_stagain';
                        // End:0x328
                        break;
                    // End:0x28b
                    case 40011:
                        mat = texture'icon_skil_sparmaga';
                        // End:0x328
                        break;
                    // End:0x2a1
                    case 40013:
                        mat = texture'icon_skil_add_expl';
                        // End:0x328
                        break;
                    // End:0x2b7
                    case 40014:
                        mat = texture'icon_skil_save_pak';
                        // End:0x328
                        break;
                    // End:0x2cd
                    case 40015:
                        mat = texture'icon_skil_qik_rspn';
                        // End:0x328
                        break;
                    // End:0x2e3
                    case 40016:
                        mat = texture'icon_skil_qik_expl';
                        // End:0x328
                        break;
                    // End:0x2f9
                    case 40019:
                        mat = texture'icon_skil_sensor_bomb';
                        // End:0x328
                        break;
                    // End:0x30f
                    case 40020:
                        mat = texture'icon_skil_add_exp';
                        // End:0x328
                        break;
                    // End:0x325
                    case 40021:
                        mat = texture'icon_skil_add_life';
                        // End:0x328
                        break;
                    // End:0xffff
                    default:
                        switch(HasSkills)
                        {
                            // End:0x34e
                            case 1:
                                WSkill3[++ iCount].WidgetTexture = mat;
                                // End:0x370
                                break;
                            // End:0x36d
                            case 0:
                                WSkill2[++ iCount].WidgetTexture = mat;
                                // End:0x370
                                break;
                            // End:0xffff
                            default:
                                ++ iTemp;
                                // This is an implied JumpToken; Continue!
                                goto J0x1e1;
                            }
}

function DrawHasSkill(Canvas C)
{
    local float fDeltaTime, iAlpha;

    // End:0x1d
    if(Level.GRI.bStopCountDown)
    {
        return;
    }
    fDeltaTime = Level.TimeSeconds - StartDrawTime;
    // End:0x55
    if(fDeltaTime < fDrawTime)
    {
        iAlpha = 255.0;
    }
    // End:0x7c
    else
    {
        iAlpha = 255.0 * 1.0 - fDeltaTime - fDrawTime / fFadeOutTime;
    }
    // End:0x96
    if(iAlpha < MinAlpha)
    {
        iAlpha = MinAlpha;
    }
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(iAlpha));
    // End:0xe7
    if(HasSkillNum > 0)
    {
        // End:0xdc
        if(1 == HasSkills)
        {
            DrawHas3Skill(C);
        }
        // End:0xe7
        else
        {
            DrawHas2Skill(C);
        }
    }
}

function DrawHas3Skill(Canvas C)
{
    local CalCoordsW calW;
    local int i;

    i = 0;
    J0x07:
    // End:0xe8 [While If]
    if(i < 5)
    {
        // End:0x25
        if(i >= HasSkillNum)
        {
        }
        // End:0xe8
        else
        {
            // End:0xde
            if(WSkill3[i].WidgetTexture != none)
            {
                CalculateCoordinateEx(C, WSkill3[i], 64.0, 64.0, calW);
                C.SetPos(calW.X1, calW.Y1);
                C.DrawTile(WSkill3[i].WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x07;
        }
    }
}

function DrawHas2Skill(Canvas C)
{
    local CalCoordsW calW;
    local int i;

    i = 0;
    J0x07:
    // End:0xe8 [While If]
    if(i < 6)
    {
        // End:0x25
        if(i >= HasSkillNum)
        {
        }
        // End:0xe8
        else
        {
            // End:0xde
            if(WSkill2[i].WidgetTexture != none)
            {
                CalculateCoordinateEx(C, WSkill2[i], 64.0, 64.0, calW);
                C.SetPos(calW.X1, calW.Y1);
                C.DrawTile(WSkill2[i].WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x07;
        }
    }
}

function DrawTextChattingHelp(Canvas C)
{
    local int X1, X2, Y1, Y2;

    X1 = int(float(88) * _reX);
    Y1 = int(float(1065) * _reY);
    X2 = int(float(508) * _reX);
    Y2 = int(float(1097) * _reY);
    C.SetDrawColor(159, 241, 78, byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine(lsChattingHelp, 0, float(X1), float(Y1), float(X2), float(Y2), int(float(15) * _reY), color_Shadow);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
}

function DrawSurvivedUsers(Canvas C)
{
    local Controller UC;
    local float X1, X2, Y1, Y2;
    local int lpPRI;
    local PlayerReplicationInfo currPRI;
    local int AFSurvivedUserCount, RSASurvivedUserCount;

    lpPRI = 0;
    J0x07:
    // End:0x175 [While If]
    if(lpPRI < Level.GRI.PRIArray.Length)
    {
        currPRI = Level.GRI.PRIArray[lpPRI];
        // End:0x16b
        if(currPRI != none && currPRI.Team != none && currPRI.IsConnected && !currPRI.bAdminSpecator && !currPRI.bOutOfLives && !currPRI.bOnlySpectator && !currPRI.IsDead)
        {
            // End:0x100
            if(currPRI.Team.TeamIndex == 0)
            {
                ++ AFSurvivedUserCount;
            }
            // End:0x16b
            else
            {
                // End:0x127
                if(currPRI.Team.TeamIndex == 1)
                {
                    ++ RSASurvivedUserCount;
                }
                // End:0x16b
                else
                {
                    Log("Invalid Survivor(TeamIndex Error!): " $ UC.PlayerReplicationInfo.PlayerName);
                    // This is an implied JumpToken;
                    goto J0x175;
                }
            }
        }
        ++ lpPRI;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    J0x175:
    _reX = 1.0 / float(1600) * C.ClipX;
    _reY = 1.0 / float(1200) * C.ClipY;
    // End:0x581
    if(HudOwner.PlayerOwner.PlayerReplicationInfo.Team.TeamIndex == 0)
    {
        C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
        X1 = HudCDeathmatch(HudOwner).AFStringLeftTopX * _reX;
        Y1 = HudCDeathmatch(HudOwner).AFStringLeftTopY * _reY;
        X2 = HudCDeathmatch(HudOwner).AFStringRightBottomX * _reX;
        Y2 = HudCDeathmatch(HudOwner).AFStringRightBottomY * _reY;
        C.BtrDrawTextJustifiedWithVolumeLine("   " $ lsTeamAF, 0, X1, Y1, X2, Y2, int(float(19) / 1200.0 * C.ClipY), color_Shadow);
        X1 = HudCDeathmatch(HudOwner).AFSurvivedUserCountLeftTopX * _reX;
        Y1 = HudCDeathmatch(HudOwner).AFSurvivedUserCountLeftTopY * _reY;
        X2 = HudCDeathmatch(HudOwner).AFSurvivedUserCountRightBottomX * _reX;
        Y2 = HudCDeathmatch(HudOwner).AFSurvivedUserCountRightBottomY * _reY;
        C.BtrDrawTextJustifiedWithVolumeLine(" " $ string(AFSurvivedUserCount) $ lsSurvivedString, 0, X1, Y1, X2, Y2, int(float(14) / 1200.0 * C.ClipY), color_Shadow);
        C.SetDrawColor(127, 127, 127, byte(255));
        X1 = HudCDeathmatch(HudOwner).RSAStringLeftTopX * _reX;
        Y1 = HudCDeathmatch(HudOwner).RSAStringLeftTopY * _reY;
        X2 = HudCDeathmatch(HudOwner).RSAStringRightBottomX * _reX;
        Y2 = HudCDeathmatch(HudOwner).RSAStringRightBottomY * _reY;
        C.BtrDrawTextJustifiedWithVolumeLine("   " $ lsTeamRSA, 0, X1, Y1, X2, Y2, int(float(19) / 1200.0 * C.ClipY), color_Shadow);
        X1 = HudCDeathmatch(HudOwner).RSASurvivedUserCountLeftTopX * _reX;
        Y1 = HudCDeathmatch(HudOwner).RSASurvivedUserCountLeftTopY * _reY;
        X2 = HudCDeathmatch(HudOwner).RSASurvivedUserCountRightBottomX * _reX;
        Y2 = HudCDeathmatch(HudOwner).RSASurvivedUserCountRightBottomY * _reY;
        C.BtrDrawTextJustifiedWithVolumeLine(" " $ string(RSASurvivedUserCount) $ lsSurvivedString, 0, X1, Y1, X2, Y2, int(float(14) / 1200.0 * C.ClipY), color_Shadow);
    }
    // End:0x942
    else
    {
        // End:0x942
        if(HudOwner.PlayerOwner.PlayerReplicationInfo.Team.TeamIndex == 1)
        {
            C.SetDrawColor(127, 127, 127, byte(255));
            X1 = HudCDeathmatch(HudOwner).AFStringLeftTopX * _reX;
            Y1 = HudCDeathmatch(HudOwner).AFStringLeftTopY * _reY;
            X2 = HudCDeathmatch(HudOwner).AFStringRightBottomX * _reX;
            Y2 = HudCDeathmatch(HudOwner).AFStringRightBottomY * _reY;
            C.BtrDrawTextJustifiedWithVolumeLine("   " $ lsTeamAF, 0, X1, Y1, X2, Y2, int(float(19) / 1200.0 * C.ClipY), color_Shadow);
            X1 = HudCDeathmatch(HudOwner).AFSurvivedUserCountLeftTopX * _reX;
            Y1 = HudCDeathmatch(HudOwner).AFSurvivedUserCountLeftTopY * _reY;
            X2 = HudCDeathmatch(HudOwner).AFSurvivedUserCountRightBottomX * _reX;
            Y2 = HudCDeathmatch(HudOwner).AFSurvivedUserCountRightBottomY * _reY;
            C.BtrDrawTextJustifiedWithVolumeLine(" " $ string(AFSurvivedUserCount) $ lsSurvivedString, 0, X1, Y1, X2, Y2, int(float(14) / 1200.0 * C.ClipY), color_Shadow);
            C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
            X1 = HudCDeathmatch(HudOwner).RSAStringLeftTopX * _reX;
            Y1 = HudCDeathmatch(HudOwner).RSAStringLeftTopY * _reY;
            X2 = HudCDeathmatch(HudOwner).RSAStringRightBottomX * _reX;
            Y2 = HudCDeathmatch(HudOwner).RSAStringRightBottomY * _reY;
            C.BtrDrawTextJustifiedWithVolumeLine("   " $ lsTeamRSA, 0, X1, Y1, X2, Y2, int(float(19) / 1200.0 * C.ClipY), color_Shadow);
            X1 = HudCDeathmatch(HudOwner).RSASurvivedUserCountLeftTopX * _reX;
            Y1 = HudCDeathmatch(HudOwner).RSASurvivedUserCountLeftTopY * _reY;
            X2 = HudCDeathmatch(HudOwner).RSASurvivedUserCountRightBottomX * _reX;
            Y2 = HudCDeathmatch(HudOwner).RSASurvivedUserCountRightBottomY * _reY;
            C.BtrDrawTextJustifiedWithVolumeLine(" " $ string(RSASurvivedUserCount) $ lsSurvivedString, 0, X1, Y1, X2, Y2, int(float(14) / 1200.0 * C.ClipY), color_Shadow);
        }
    }
}

defaultproperties
{
    HelpKeyButtonBackground=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.hud_back_4',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=1024,Y2=16),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=1171,ScaleMode=4,Scale=1.0,Tints=(R=189,G=0,B=0,A=255),Tints[1]=(R=189,G=0,B=0,A=255))
    HelpKeyButtonSkill[0]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=28,Y2=28),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=282,OffsetY=1123,ScaleMode=4,Scale=1.0,Tints=(R=189,G=0,B=0,A=255),Tints[1]=(R=189,G=0,B=0,A=255))
    HelpKeyButtonSkill[1]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=28,Y2=28),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=351,OffsetY=1123,ScaleMode=4,Scale=1.0,Tints=(R=189,G=0,B=0,A=255),Tints[1]=(R=189,G=0,B=0,A=255))
    HelpKeyButtonUAV=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=234,Y1=26,X2=260,Y2=52),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=772,OffsetY=1135,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonBomb=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=28,Y2=28),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=1011,OffsetY=1135,ScaleMode=4,Scale=1.0,Tints=(R=189,G=0,B=0,A=255),Tints[1]=(R=189,G=0,B=0,A=255))
    WSkill2[0]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=730,OffsetY=1055,ScaleMode=4,Scale=1.0,Tints=(R=189,G=0,B=0,A=255),Tints[1]=(R=189,G=0,B=0,A=255))
    WSkill2[1]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=806,OffsetY=1055,ScaleMode=4,Scale=1.0,Tints=(R=189,G=0,B=0,A=255),Tints[1]=(R=189,G=0,B=0,A=255))
    WSkill2[2]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=654,OffsetY=1055,ScaleMode=4,Scale=1.0,Tints=(R=189,G=0,B=0,A=255),Tints[1]=(R=189,G=0,B=0,A=255))
    WSkill2[3]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=882,OffsetY=1055,ScaleMode=4,Scale=1.0,Tints=(R=189,G=0,B=0,A=255),Tints[1]=(R=189,G=0,B=0,A=255))
    WSkill2[4]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=316,OffsetY=1055,ScaleMode=4,Scale=1.0,Tints=(R=189,G=0,B=0,A=255),Tints[1]=(R=189,G=0,B=0,A=255))
    WSkill2[5]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=958,OffsetY=1055,ScaleMode=4,Scale=1.0,Tints=(R=189,G=0,B=0,A=255),Tints[1]=(R=189,G=0,B=0,A=255))
    WSkill3[0]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=768,OffsetY=1055,ScaleMode=4,Scale=1.0,Tints=(R=189,G=0,B=0,A=255),Tints[1]=(R=189,G=0,B=0,A=255))
    WSkill3[1]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=692,OffsetY=1055,ScaleMode=4,Scale=1.0,Tints=(R=189,G=0,B=0,A=255),Tints[1]=(R=189,G=0,B=0,A=255))
    WSkill3[2]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=844,OffsetY=1055,ScaleMode=4,Scale=1.0,Tints=(R=189,G=0,B=0,A=255),Tints[1]=(R=189,G=0,B=0,A=255))
    WSkill3[3]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=616,OffsetY=1055,ScaleMode=4,Scale=1.0,Tints=(R=189,G=0,B=0,A=255),Tints[1]=(R=189,G=0,B=0,A=255))
    WSkill3[4]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=920,OffsetY=1055,ScaleMode=4,Scale=1.0,Tints=(R=189,G=0,B=0,A=255),Tints[1]=(R=189,G=0,B=0,A=255))
    HelpKeyButtonBattleHelp=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=156,Y1=52,X2=182,Y2=78),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=568,OffsetY=1135,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    fFadeOutTime=1.50
    fDrawTime=5.0
    lsChattingHelp="F2 = General, F3 = Team, F4 = Clan, F5 = Whisper"
    lsSurvivedString=" players remaining."
    lsTeamAF="AF"
    lsTeamRSA="RSA"
}