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
        // End:0xD7
        if((1 == int(HudCDeathmatch(HudOwner).PawnOwnerPRI.abySupplyItemFlag[int(2)])) || 1 == int(HudCDeathmatch(HudOwner).PawnOwnerPRI.abySupplyItemFlag[int(3)]))
        {
            ActiveSlot[1] = 1;
        }
    }
    i = 0;
    J0xDE:

    // End:0x1F9 [Loop If]
    if(i < 2)
    {
        // End:0xFE
        if(1 != ActiveSlot[i])
        {
            // [Explicit Continue]
            goto J0x1EF;
        }
        // End:0x11A
        if(!HudCDeathmatch(HudOwner).bBlinkState)
        {
            // [Explicit Continue]
            goto J0x1EF;
        }
        WKeyButtonBGSmallBlink.OffsetX = HelpKeyButtonSkill[i].OffsetX - 2;
        WKeyButtonBGSmallBlink.OffsetY = HelpKeyButtonSkill[i].OffsetY - 2;
        CalculateCoordinateEx(C, WKeyButtonBGSmallBlink, 30.0000000, 30.0000000, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WKeyButtonBGSmallBlink.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
        J0x1EF:

        i++;
        // [Loop Continue]
        goto J0xDE;
    }
    //return;    
}

function CheckOwnerSkill()
{
    local int iTemp, iCount, iNum;
    local Material mat;
    local array<Material> arMaterial;
    local array<wSkill> arSkills;
    local wSkill WTemp;
    local wItemResourceParam itemResourceParam;

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

    // End:0x20C [Loop If]
    if(iTemp < arSkills.Length)
    {
        WTemp = arSkills[iTemp];
        // End:0xD4
        if(!WTemp.bUpdateProcess)
        {
            // [Explicit Continue]
            goto J0x202;
        }
        mat = none;
        // End:0x11E
        if(WTemp.AttachWeaponID != 0)
        {
            itemResourceParam = Level.GameMgr.GetItemResourceParam(WTemp.AttachWeaponID);            
        }
        else
        {
            itemResourceParam = Level.GameMgr.GetItemResourceParam(WTemp.SkillID);
        }
        // End:0x179
        if(itemResourceParam != none)
        {
            mat = Material(DynamicLoadObject(itemResourceParam.Resource_UI_HUDEnable_File, Class'Engine.Material'));
        }
        // End:0x1C0
        if(mat != none)
        {
            // End:0x1AE
            if(WTemp.bActiveSkill)
            {
                arMaterial.Insert(0, 1);
                arMaterial[0] = mat;                
            }
            else
            {
                arMaterial[arMaterial.Length] = mat;
            }
        }
        // End:0x202
        if(WTemp.bActiveSkill)
        {
            HudCDeathmatch(HudOwner).InsertUsingSkillList(WTemp.SkillID, WTemp.AttachWeaponID);
        }
        J0x202:

        iTemp++;
        // [Loop Continue]
        goto J0x9C;
    }
    HasSkillNum = arMaterial.Length;
    HasSkills = int(float(arMaterial.Length) % float(2));
    iCount = 0;
    iTemp = 0;
    J0x23C:

    // End:0x2AA [Loop If]
    if(iTemp < arMaterial.Length)
    {
        switch(HasSkills)
        {
            // End:0x278
            case 1:
                WSkill3[iCount++].WidgetTexture = arMaterial[iTemp];
                // End:0x2A0
                break;
            // End:0x29D
            case 0:
                WSkill2[iCount++].WidgetTexture = arMaterial[iTemp];
                // End:0x2A0
                break;
            // End:0xFFFF
            default:
                break;
        }
        iTemp++;
        // [Loop Continue]
        goto J0x23C;
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
    local int i, skillDrawCount;

    i = (5 - HasSkillNum) / 2;
    J0x13:

    // End:0xFB [Loop If]
    if(i < 5)
    {
        // End:0x31
        if(skillDrawCount >= HasSkillNum)
        {
            // [Explicit Break]
            goto J0xFB;
        }
        // End:0xEA
        if(WSkill3[skillDrawCount].WidgetTexture != none)
        {
            CalculateCoordinateEx(C, WSkill3[i], 64.0000000, 64.0000000, calW);
            C.SetPos(calW.X1, calW.Y1);
            C.DrawTile(WSkill3[skillDrawCount].WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
        }
        ++skillDrawCount;
        i++;
        // [Loop Continue]
        goto J0x13;
    }
    J0xFB:

    //return;    
}

function DrawHas2Skill(Canvas C)
{
    local CalCoordsW calW;
    local int i, skillDrawCount;

    i = (6 - HasSkillNum) / 2;
    J0x13:

    // End:0xFB [Loop If]
    if(i < 6)
    {
        // End:0x31
        if(skillDrawCount >= HasSkillNum)
        {
            // [Explicit Break]
            goto J0xFB;
        }
        // End:0xEA
        if(WSkill2[skillDrawCount].WidgetTexture != none)
        {
            CalculateCoordinateEx(C, WSkill2[i], 64.0000000, 64.0000000, calW);
            C.SetPos(calW.X1, calW.Y1);
            C.DrawTile(WSkill2[skillDrawCount].WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
        }
        ++skillDrawCount;
        i++;
        // [Loop Continue]
        goto J0x13;
    }
    J0xFB:

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

    // End:0x1A5 [Loop If]
    if(lpPRI < Level.GRI.PRIArray.Length)
    {
        currPRI = Level.GRI.PRIArray[lpPRI];
        // End:0x19B
        if(((((((currPRI != none) && currPRI.Team != none) && currPRI.IsConnected) && !currPRI.bAdminSpecator) && !currPRI.bOutOfLives) && !currPRI.bOnlySpectator) && !currPRI.IsDead)
        {
            // End:0xF1
            if(200 == currPRI.NPCID)
            {
                // [Explicit Continue]
                goto J0x19B;
            }
            // End:0x109
            if(201 == currPRI.NPCID)
            {
                // [Explicit Continue]
                goto J0x19B;
            }
            // End:0x130
            if(currPRI.Team.TeamIndex == 0)
            {
                AFSurvivedUserCount++;
                // [Explicit Continue]
                goto J0x19B;
            }
            // End:0x157
            if(currPRI.Team.TeamIndex == 1)
            {
                RSASurvivedUserCount++;
                // [Explicit Continue]
                goto J0x19B;
            }
            Log("Invalid Survivor(TeamIndex Error!): " $ UC.PlayerReplicationInfo.PlayerName);
            // [Explicit Break]
            goto J0x1A5;
        }
        J0x19B:

        lpPRI++;
        // [Loop Continue]
        goto J0x07;
    }
    J0x1A5:

    _reX = (1.0000000 / float(1600)) * C.ClipX;
    _reY = (1.0000000 / float(1200)) * C.ClipY;
    // End:0x5B1
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
        // End:0x972
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
    WSkill2[0]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=578,OffsetY=1055,ScaleMode=4,Scale=1.0000000,Tints=(R=189,G=0,B=0,A=255),Tints[1]=(R=189,G=0,B=0,A=255))
    WSkill2[1]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=654,OffsetY=1055,ScaleMode=4,Scale=1.0000000,Tints=(R=189,G=0,B=0,A=255),Tints[1]=(R=189,G=0,B=0,A=255))
    WSkill2[2]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=730,OffsetY=1055,ScaleMode=4,Scale=1.0000000,Tints=(R=189,G=0,B=0,A=255),Tints[1]=(R=189,G=0,B=0,A=255))
    WSkill2[3]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=806,OffsetY=1055,ScaleMode=4,Scale=1.0000000,Tints=(R=189,G=0,B=0,A=255),Tints[1]=(R=189,G=0,B=0,A=255))
    WSkill2[4]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=882,OffsetY=1055,ScaleMode=4,Scale=1.0000000,Tints=(R=189,G=0,B=0,A=255),Tints[1]=(R=189,G=0,B=0,A=255))
    WSkill2[5]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=958,OffsetY=1055,ScaleMode=4,Scale=1.0000000,Tints=(R=189,G=0,B=0,A=255),Tints[1]=(R=189,G=0,B=0,A=255))
    WSkill3[0]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=616,OffsetY=1055,ScaleMode=4,Scale=1.0000000,Tints=(R=189,G=0,B=0,A=255),Tints[1]=(R=189,G=0,B=0,A=255))
    WSkill3[1]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=692,OffsetY=1055,ScaleMode=4,Scale=1.0000000,Tints=(R=189,G=0,B=0,A=255),Tints[1]=(R=189,G=0,B=0,A=255))
    WSkill3[2]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=768,OffsetY=1055,ScaleMode=4,Scale=1.0000000,Tints=(R=189,G=0,B=0,A=255),Tints[1]=(R=189,G=0,B=0,A=255))
    WSkill3[3]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=844,OffsetY=1055,ScaleMode=4,Scale=1.0000000,Tints=(R=189,G=0,B=0,A=255),Tints[1]=(R=189,G=0,B=0,A=255))
    WSkill3[4]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=920,OffsetY=1055,ScaleMode=4,Scale=1.0000000,Tints=(R=189,G=0,B=0,A=255),Tints[1]=(R=189,G=0,B=0,A=255))
    HelpKeyButtonBattleHelp=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=156,Y1=52,X2=182,Y2=78),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=568,OffsetY=1135,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    fFadeOutTime=1.5000000
    fDrawTime=5.0000000
    lsChattingHelp="F2 = General, F3 = Team, F4 = Clan, F5 = Whisper"
    lsSurvivedString=" players remaining."
    lsTeamAF="AF"
    lsTeamRSA="RSA"
}