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
        // End:0x2F
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
        // End:0x4B
        case 1001:
            // End:0x51
            break;
        // End:0xFFFF
        default:
            // End:0x51
            break;
            break;
    }
    //return;    
}

function DisplayEvent_ActiveSkill()
{
    StartDrawTime = Level.TimeSeconds;
    QuitDrawTime = (Level.TimeSeconds + fDrawTime) + fFadeOutTime;
    //return;    
}

function UpdateHelpKey_Slot(byte iIndex, bool bEnable)
{
    // End:0x92
    if(int(iIndex) == 5)
    {
        // End:0x81
        if(bEnable == true)
        {
            GUIController(HudOwner.PlayerOwner.Player.GUIController).GetAssignedKeys("SwitchWeapon 5", keys, LocalizedKeys);
            GetKeyTexture(keys[0], HelpKeyButtonSkill[0], WidthSkill[0]);            
        }
        else
        {
            HelpKeyButtonSkill[0].WidgetTexture = none;
        }        
    }
    else
    {
        // End:0x121
        if(int(iIndex) == 6)
        {
            // End:0x113
            if(bEnable == true)
            {
                GUIController(HudOwner.PlayerOwner.Player.GUIController).GetAssignedKeys("SwitchWeapon 6", keys, LocalizedKeys);
                GetKeyTexture(keys[0], HelpKeyButtonSkill[1], WidthSkill[1]);                
            }
            else
            {
                HelpKeyButtonSkill[1].WidgetTexture = none;
            }
        }
    }
    //return;    
}

function UpdateHelpKeyControll()
{
    // End:0x47
    if((HudOwner.PlayerOwner.Player == none) && HudOwner.PlayerOwner.Player.GUIController == none)
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
    //return;    
}

function SendHostPointInGame()
{
    local GUIController GC;
    local wMatchMaker kMM;

    kMM = Level.GetMatchMaker();
    GC = GUIController(HudOwner.PlayerOwner.Player.GUIController);
    // End:0x88
    if((GC != none) && GC.TcpHandler != none)
    {
        GC.TcpHandler.sfReqUpdateMyHostPriorityPoint(kMM.GetHostPoint());
    }
    //return;    
}

function DrawA(Canvas C)
{
    // End:0x42
    if(((HudOwner == none) || HudOwner.PlayerOwner == none) || HudOwner.PlayerOwner.Pawn == none)
    {
        return;
    }
    // End:0x91
    if(((false == bUpdate) && HudOwner.PawnOwner != none) && HudOwner.PawnOwner.Inventory != none)
    {
        UpdateHelpKeyControll();
        bUpdate = true;
    }
    // End:0xB4
    if(Level.TimeSeconds < QuitDrawTime)
    {
        DrawHasSkill(C);
    }
    //return;    
}

function DrawSpectating(Canvas C)
{
    //return;    
}

function DrawHelpKeyControll(Canvas C)
{
    local CalCoordsW calW;

    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    CalculateCoordinateEx(C, HelpKeyButtonSkill[0], 26.0000000, 26.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    // End:0xCC
    if(none != HelpKeyButtonSkill[0].WidgetTexture)
    {
        C.DrawTile(HelpKeyButtonSkill[0].WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    }
    CalculateCoordinateEx(C, HelpKeyButtonSkill[1], 26.0000000, 26.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    // End:0x179
    if(none != HelpKeyButtonSkill[1].WidgetTexture)
    {
        C.DrawTile(HelpKeyButtonSkill[1].WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    }
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    //return;    
}

function DrawHelpKeyControll_Bomb(Canvas C)
{
    local CalCoordsW calW;

    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    CalculateCoordinateEx(C, HelpKeyButtonBomb, WidthBomb, 26.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    // End:0xC6
    if(none != HelpKeyButtonBomb.WidgetTexture)
    {
        C.DrawTile(HelpKeyButtonBomb.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    }
    //return;    
}

function DrawBlinkActiveKey(Canvas C)
{
    local CalCoordsW calW;
    local int i, ActiveSlot;

    // End:0x7A
    if((((2 == HudCDeathmatch(HudOwner).HasSkillC4) || 2 == HudCDeathmatch(HudOwner).HasSkillRPG) || true == HudCDeathmatch(HudOwner).bSkill_ATR) || true == HudCDeathmatch(HudOwner).bSkill_M2B)
    {
        ActiveSlot[0] = 1;        
    }
    else
    {
        // End:0xF3
        if(((1 == int(HudCDeathmatch(HudOwner).PawnOwnerPRI.bySupply_Helipack)) || 1 == int(HudCDeathmatch(HudOwner).PawnOwnerPRI.bySupply_Helipack)) || 1 == int(HudCDeathmatch(HudOwner).PawnOwnerPRI.bySupply_AirStrike))
        {
            ActiveSlot[1] = 1;
        }
    }
    i = 0;
    J0xFA:

    // End:0x215 [Loop If]
    if(i < 2)
    {
        // End:0x11A
        if(1 != ActiveSlot[i])
        {
            // [Explicit Continue]
            goto J0x20B;
        }
        // End:0x136
        if(!HudCDeathmatch(HudOwner).bBlinkState)
        {
            // [Explicit Continue]
            goto J0x20B;
        }
        WKeyButtonBGSmallBlink.OffsetX = HelpKeyButtonSkill[i].OffsetX - 2;
        WKeyButtonBGSmallBlink.OffsetY = HelpKeyButtonSkill[i].OffsetY - 2;
        CalculateCoordinateEx(C, WKeyButtonBGSmallBlink, 30.0000000, 30.0000000, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WKeyButtonBGSmallBlink.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
        J0x20B:

        i++;
        // [Loop Continue]
        goto J0xFA;
    }
    //return;    
}

function CheckOwnerSkill()
{
    local int iTemp, iCount, iNum;
    local Material mat;
    local array<wSkill> arSkills, PlayerSkills;
    local wSkill WTemp;

    Log(string(self) $ "[wHudPart_DisplayMain::CheckOwnerSkill() ]");
    // End:0x68
    if((HudOwner.PlayerOwner == none) || HudOwner.PlayerOwner.SkillBase == none)
    {
        return;
    }
    arSkills = HudOwner.PlayerOwner.SkillBase.Skills;
    iNum = 0;
    iTemp = 0;
    J0x9C:

    // End:0x1B1 [Loop If]
    if(iTemp < arSkills.Length)
    {
        WTemp = arSkills[iTemp];
        switch(WTemp.SkillID)
        {
            // End:0xD8
            case 40005:
                // End:0x185
                break;
            // End:0xE0
            case 40006:
            // End:0xE8
            case 40007:
            // End:0xF0
            case 40008:
            // End:0xF8
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
                iNum++;
                // End:0x185
                break;
            // End:0x16F
            case 40017:
            // End:0x177
            case 40018:
            // End:0x182
            case 40022:
                // End:0x185
                break;
            // End:0xFFFF
            default:
                break;
        }
        HudCDeathmatch(HudOwner).InsertUsingSkillList(WTemp.SkillID);
        iTemp++;
        // [Loop Continue]
        goto J0x9C;
    }
    HasSkillNum = PlayerSkills.Length;
    HasSkills = int(float(PlayerSkills.Length) % float(2));
    iCount = 0;
    iTemp = 0;
    J0x1E1:

    // End:0x37A [Loop If]
    if(iTemp < PlayerSkills.Length)
    {
        switch(PlayerSkills[iTemp].SkillID)
        {
            // End:0x21D
            case 40006:
                mat = Texture'Warfare_UI_Item.SupplySkillicon.icon_skil_life_rep';
                // End:0x328
                break;
            // End:0x233
            case 40007:
                mat = Texture'Warfare_UI_Item.SupplySkillicon.icon_skil_qikwea';
                // End:0x328
                break;
            // End:0x249
            case 40008:
                mat = Texture'Warfare_UI_Item.SupplySkillicon.icon_skil_qikload';
                // End:0x328
                break;
            // End:0x25F
            case 40009:
                mat = Texture'Warfare_UI_Item.SupplySkillicon.icon_skil_qikzoom';
                // End:0x328
                break;
            // End:0x275
            case 40010:
                mat = Texture'Warfare_UI_Item.SupplySkillicon.icon_skil_stagain';
                // End:0x328
                break;
            // End:0x28B
            case 40011:
                mat = Texture'Warfare_UI_Item.SupplySkillicon.icon_skil_sparmaga';
                // End:0x328
                break;
            // End:0x2A1
            case 40013:
                mat = Texture'Warfare_UI_Item.SupplySkillicon.icon_skil_add_expl';
                // End:0x328
                break;
            // End:0x2B7
            case 40014:
                mat = Texture'Warfare_UI_Item.SupplySkillicon.icon_skil_save_pak';
                // End:0x328
                break;
            // End:0x2CD
            case 40015:
                mat = Texture'Warfare_UI_Item.SupplySkillicon.icon_skil_qik_rspn';
                // End:0x328
                break;
            // End:0x2E3
            case 40016:
                mat = Texture'Warfare_UI_Item.SupplySkillicon.icon_skil_qik_expl';
                // End:0x328
                break;
            // End:0x2F9
            case 40019:
                mat = Texture'Warfare_UI_Item.SupplySkillicon.icon_skil_sensor_bomb';
                // End:0x328
                break;
            // End:0x30F
            case 40020:
                mat = Texture'Warfare_UI_Item.SupplySkillicon.icon_skil_add_exp';
                // End:0x328
                break;
            // End:0x325
            case 40021:
                mat = Texture'Warfare_UI_Item.SupplySkillicon.icon_skil_add_life';
                // End:0x328
                break;
            // End:0xFFFF
            default:
                break;
        }
        switch(HasSkills)
        {
            // End:0x34E
            case 1:
                WSkill3[iCount++].WidgetTexture = mat;
                // End:0x370
                break;
            // End:0x36D
            case 0:
                WSkill2[iCount++].WidgetTexture = mat;
                // End:0x370
                break;
            // End:0xFFFF
            default:
                break;
        }
        iTemp++;
        // [Loop Continue]
        goto J0x1E1;
    }
    //return;    
}

function DrawHasSkill(Canvas C)
{
    local float fDeltaTime, iAlpha;

    // End:0x1D
    if(Level.GRI.bStopCountDown)
    {
        return;
    }
    fDeltaTime = Level.TimeSeconds - StartDrawTime;
    // End:0x55
    if(fDeltaTime < fDrawTime)
    {
        iAlpha = 255.0000000;        
    }
    else
    {
        iAlpha = 255.0000000 * (1.0000000 - ((fDeltaTime - fDrawTime) / fFadeOutTime));
    }
    // End:0x96
    if(iAlpha < MinAlpha)
    {
        iAlpha = MinAlpha;
    }
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(iAlpha));
    // End:0xE7
    if(HasSkillNum > 0)
    {
        // End:0xDC
        if(1 == HasSkills)
        {
            DrawHas3Skill(C);            
        }
        else
        {
            DrawHas2Skill(C);
        }
    }
    //return;    
}

function DrawHas3Skill(Canvas C)
{
    local CalCoordsW calW;
    local int i;

    i = 0;
    J0x07:

    // End:0xE8 [Loop If]
    if(i < 5)
    {
        // End:0x25
        if(i >= HasSkillNum)
        {
            // [Explicit Break]
            goto J0xE8;
        }
        // End:0xDE
        if(WSkill3[i].WidgetTexture != none)
        {
            CalculateCoordinateEx(C, WSkill3[i], 64.0000000, 64.0000000, calW);
            C.SetPos(calW.X1, calW.Y1);
            C.DrawTile(WSkill3[i].WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    J0xE8:

    //return;    
}

function DrawHas2Skill(Canvas C)
{
    local CalCoordsW calW;
    local int i;

    i = 0;
    J0x07:

    // End:0xE8 [Loop If]
    if(i < 6)
    {
        // End:0x25
        if(i >= HasSkillNum)
        {
            // [Explicit Break]
            goto J0xE8;
        }
        // End:0xDE
        if(WSkill2[i].WidgetTexture != none)
        {
            CalculateCoordinateEx(C, WSkill2[i], 64.0000000, 64.0000000, calW);
            C.SetPos(calW.X1, calW.Y1);
            C.DrawTile(WSkill2[i].WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    J0xE8:

    //return;    
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
    //return;    
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

    // End:0x175 [Loop If]
    if(lpPRI < Level.GRI.PRIArray.Length)
    {
        currPRI = Level.GRI.PRIArray[lpPRI];
        // End:0x16B
        if(((((((currPRI != none) && currPRI.Team != none) && currPRI.IsConnected) && !currPRI.bAdminSpecator) && !currPRI.bOutOfLives) && !currPRI.bOnlySpectator) && !currPRI.IsDead)
        {
            // End:0x100
            if(currPRI.Team.TeamIndex == 0)
            {
                AFSurvivedUserCount++;
                // [Explicit Continue]
                goto J0x16B;
            }
            // End:0x127
            if(currPRI.Team.TeamIndex == 1)
            {
                RSASurvivedUserCount++;
                // [Explicit Continue]
                goto J0x16B;
            }
            Log("Invalid Survivor(TeamIndex Error!): " $ UC.PlayerReplicationInfo.PlayerName);
            // [Explicit Break]
            goto J0x175;
        }
        J0x16B:

        lpPRI++;
        // [Loop Continue]
        goto J0x07;
    }
    J0x175:

    _reX = (1.0000000 / float(1600)) * C.ClipX;
    _reY = (1.0000000 / float(1200)) * C.ClipY;
    // End:0x581
    if(HudOwner.PlayerOwner.PlayerReplicationInfo.Team.TeamIndex == 0)
    {
        C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
        X1 = HudCDeathmatch(HudOwner).AFStringLeftTopX * _reX;
        Y1 = HudCDeathmatch(HudOwner).AFStringLeftTopY * _reY;
        X2 = HudCDeathmatch(HudOwner).AFStringRightBottomX * _reX;
        Y2 = HudCDeathmatch(HudOwner).AFStringRightBottomY * _reY;
        C.BtrDrawTextJustifiedWithVolumeLine("   " $ lsTeamAF, 0, X1, Y1, X2, Y2, int((float(19) / 1200.0000000) * C.ClipY), color_Shadow);
        X1 = HudCDeathmatch(HudOwner).AFSurvivedUserCountLeftTopX * _reX;
        Y1 = HudCDeathmatch(HudOwner).AFSurvivedUserCountLeftTopY * _reY;
        X2 = HudCDeathmatch(HudOwner).AFSurvivedUserCountRightBottomX * _reX;
        Y2 = HudCDeathmatch(HudOwner).AFSurvivedUserCountRightBottomY * _reY;
        C.BtrDrawTextJustifiedWithVolumeLine((" " $ string(AFSurvivedUserCount)) $ lsSurvivedString, 0, X1, Y1, X2, Y2, int((float(14) / 1200.0000000) * C.ClipY), color_Shadow);
        C.SetDrawColor(127, 127, 127, byte(255));
        X1 = HudCDeathmatch(HudOwner).RSAStringLeftTopX * _reX;
        Y1 = HudCDeathmatch(HudOwner).RSAStringLeftTopY * _reY;
        X2 = HudCDeathmatch(HudOwner).RSAStringRightBottomX * _reX;
        Y2 = HudCDeathmatch(HudOwner).RSAStringRightBottomY * _reY;
        C.BtrDrawTextJustifiedWithVolumeLine("   " $ lsTeamRSA, 0, X1, Y1, X2, Y2, int((float(19) / 1200.0000000) * C.ClipY), color_Shadow);
        X1 = HudCDeathmatch(HudOwner).RSASurvivedUserCountLeftTopX * _reX;
        Y1 = HudCDeathmatch(HudOwner).RSASurvivedUserCountLeftTopY * _reY;
        X2 = HudCDeathmatch(HudOwner).RSASurvivedUserCountRightBottomX * _reX;
        Y2 = HudCDeathmatch(HudOwner).RSASurvivedUserCountRightBottomY * _reY;
        C.BtrDrawTextJustifiedWithVolumeLine((" " $ string(RSASurvivedUserCount)) $ lsSurvivedString, 0, X1, Y1, X2, Y2, int((float(14) / 1200.0000000) * C.ClipY), color_Shadow);        
    }
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
            C.BtrDrawTextJustifiedWithVolumeLine("   " $ lsTeamAF, 0, X1, Y1, X2, Y2, int((float(19) / 1200.0000000) * C.ClipY), color_Shadow);
            X1 = HudCDeathmatch(HudOwner).AFSurvivedUserCountLeftTopX * _reX;
            Y1 = HudCDeathmatch(HudOwner).AFSurvivedUserCountLeftTopY * _reY;
            X2 = HudCDeathmatch(HudOwner).AFSurvivedUserCountRightBottomX * _reX;
            Y2 = HudCDeathmatch(HudOwner).AFSurvivedUserCountRightBottomY * _reY;
            C.BtrDrawTextJustifiedWithVolumeLine((" " $ string(AFSurvivedUserCount)) $ lsSurvivedString, 0, X1, Y1, X2, Y2, int((float(14) / 1200.0000000) * C.ClipY), color_Shadow);
            C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
            X1 = HudCDeathmatch(HudOwner).RSAStringLeftTopX * _reX;
            Y1 = HudCDeathmatch(HudOwner).RSAStringLeftTopY * _reY;
            X2 = HudCDeathmatch(HudOwner).RSAStringRightBottomX * _reX;
            Y2 = HudCDeathmatch(HudOwner).RSAStringRightBottomY * _reY;
            C.BtrDrawTextJustifiedWithVolumeLine("   " $ lsTeamRSA, 0, X1, Y1, X2, Y2, int((float(19) / 1200.0000000) * C.ClipY), color_Shadow);
            X1 = HudCDeathmatch(HudOwner).RSASurvivedUserCountLeftTopX * _reX;
            Y1 = HudCDeathmatch(HudOwner).RSASurvivedUserCountLeftTopY * _reY;
            X2 = HudCDeathmatch(HudOwner).RSASurvivedUserCountRightBottomX * _reX;
            Y2 = HudCDeathmatch(HudOwner).RSASurvivedUserCountRightBottomY * _reY;
            C.BtrDrawTextJustifiedWithVolumeLine((" " $ string(RSASurvivedUserCount)) $ lsSurvivedString, 0, X1, Y1, X2, Y2, int((float(14) / 1200.0000000) * C.ClipY), color_Shadow);
        }
    }
    //return;    
}

defaultproperties
{
    HelpKeyButtonBackground=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.hud_back_4',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=1024,Y2=16),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=1171,ScaleMode=4,Scale=1.0000000,Tints=(R=189,G=0,B=0,A=255),Tints[1]=(R=189,G=0,B=0,A=255))
    HelpKeyButtonSkill[0]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=28,Y2=28),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=282,OffsetY=1123,ScaleMode=4,Scale=1.0000000,Tints=(R=189,G=0,B=0,A=255),Tints[1]=(R=189,G=0,B=0,A=255))
    HelpKeyButtonSkill[1]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=28,Y2=28),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=351,OffsetY=1123,ScaleMode=4,Scale=1.0000000,Tints=(R=189,G=0,B=0,A=255),Tints[1]=(R=189,G=0,B=0,A=255))
    HelpKeyButtonUAV=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=234,Y1=26,X2=260,Y2=52),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=772,OffsetY=1135,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonBomb=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=28,Y2=28),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=1011,OffsetY=1135,ScaleMode=4,Scale=1.0000000,Tints=(R=189,G=0,B=0,A=255),Tints[1]=(R=189,G=0,B=0,A=255))
    WSkill2[0]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=730,OffsetY=1055,ScaleMode=4,Scale=1.0000000,Tints=(R=189,G=0,B=0,A=255),Tints[1]=(R=189,G=0,B=0,A=255))
    WSkill2[1]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=806,OffsetY=1055,ScaleMode=4,Scale=1.0000000,Tints=(R=189,G=0,B=0,A=255),Tints[1]=(R=189,G=0,B=0,A=255))
    WSkill2[2]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=654,OffsetY=1055,ScaleMode=4,Scale=1.0000000,Tints=(R=189,G=0,B=0,A=255),Tints[1]=(R=189,G=0,B=0,A=255))
    WSkill2[3]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=882,OffsetY=1055,ScaleMode=4,Scale=1.0000000,Tints=(R=189,G=0,B=0,A=255),Tints[1]=(R=189,G=0,B=0,A=255))
    WSkill2[4]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=316,OffsetY=1055,ScaleMode=4,Scale=1.0000000,Tints=(R=189,G=0,B=0,A=255),Tints[1]=(R=189,G=0,B=0,A=255))
    WSkill2[5]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=958,OffsetY=1055,ScaleMode=4,Scale=1.0000000,Tints=(R=189,G=0,B=0,A=255),Tints[1]=(R=189,G=0,B=0,A=255))
    WSkill3[0]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=768,OffsetY=1055,ScaleMode=4,Scale=1.0000000,Tints=(R=189,G=0,B=0,A=255),Tints[1]=(R=189,G=0,B=0,A=255))
    WSkill3[1]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=692,OffsetY=1055,ScaleMode=4,Scale=1.0000000,Tints=(R=189,G=0,B=0,A=255),Tints[1]=(R=189,G=0,B=0,A=255))
    WSkill3[2]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=844,OffsetY=1055,ScaleMode=4,Scale=1.0000000,Tints=(R=189,G=0,B=0,A=255),Tints[1]=(R=189,G=0,B=0,A=255))
    WSkill3[3]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=616,OffsetY=1055,ScaleMode=4,Scale=1.0000000,Tints=(R=189,G=0,B=0,A=255),Tints[1]=(R=189,G=0,B=0,A=255))
    WSkill3[4]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=920,OffsetY=1055,ScaleMode=4,Scale=1.0000000,Tints=(R=189,G=0,B=0,A=255),Tints[1]=(R=189,G=0,B=0,A=255))
    HelpKeyButtonBattleHelp=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=156,Y1=52,X2=182,Y2=78),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=568,OffsetY=1135,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    fFadeOutTime=1.5000000
    fDrawTime=5.0000000
    lsChattingHelp="F2 = General, F3 = Team, F4 = Clan, F5 = Whisper"
    lsSurvivedString=" players survived."
    lsTeamAF="AF"
    lsTeamRSA="RSA"
}