class wHudPart_SelectQSlotCN extends wHudPart_SelectQSlot
    transient;

var string strQSItemName[9];

function Initialize(HudBase myOwner, LevelInfo _level)
{
    super(wHudPart_DisplayBase).Initialize(myOwner, _level);
    HudOwner = myOwner;
    PrevSelectedQSlotIndex = HudOwner.PlayerOwner.iSelectedQSlotIndex;
    Level = _level;
    HelpKeyButtonQSlot = HelpKeyButtonAlphaBet[1];
    //return;    
}

function BeginQuickSlotWindow()
{
    HudOwner.PlayerOwner.bCanChangeQS = true;
    LevelStartTime = Level.PlayTimeSeconds;
    //return;    
}

function EndQuickSlotWindow()
{
    // End:0x34
    if(HudOwner.PlayerOwner.bCanChangeQS == true)
    {
        PlayHUDSound(HudOwner.PlayerOwner, 0);
    }
    HudOwner.PlayerOwner.bCanChangeQS = false;
    HudOwner.PlayerOwner.bToggleQuickSlotWindow = false;
    QuickSlotWindowStartTime = 0;
    LevelStartTime = 0.0000000;
    bTimeLimitOff = false;
    HudOwner.PlayerConsole.ViewportOwner.bShowWindowsMouse = false;
    //return;    
}

function ToggleQuickSlotWindow()
{
    // End:0x78
    if(HudOwner.PlayerOwner != none)
    {
        // End:0x78
        if(HudOwner.PlayerOwner.bCanChangeQS)
        {
            HudOwner.PlayerOwner.bToggleQuickSlotWindow = !HudOwner.PlayerOwner.bToggleQuickSlotWindow;
            PlayHUDSound(HudOwner.PlayerOwner, 0);
        }
    }
    //return;    
}

function CallSelectQuickSlot(int iIndex)
{
    // End:0x7C
    if(HudOwner.PlayerOwner != none)
    {
        // End:0x7C
        if(HudOwner.PlayerOwner.bCanChangeQS)
        {
            HudOwner.PlayerOwner.SelectQuickSlot(iIndex);
            HudOwner.PlayerOwner.bToggleQuickSlotWindow = false;
            PlayHUDSound(HudOwner.PlayerOwner, 1);
        }
    }
    //return;    
}

function CallEvent(optional bool ItemCheck, optional int iReservation1, optional int iReservation2)
{
    switch(iReservation1)
    {
        // End:0x18
        case 888:
            UpdateHelpKeyControll();
            // End:0x1E
            break;
        // End:0xFFFF
        default:
            // End:0x1E
            break;
            break;
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
    GUIController(HudOwner.PlayerOwner.Player.GUIController).GetAssignedKeys("CallToggleQuickSlot", keys, LocalizedKeys);
    GetKeyTexture(keys[0], HelpKeyButtonQSlot, WidthButtonQSlot);
    //return;    
}

function DrawA(Canvas C)
{
    // End:0x44
    if(Level.GetMatchMaker().BotTutorial || (int(Level.GetMatchMaker().GMLevelFlag) & 3) > 0)
    {
        return;
    }
    DrawSelectQSlot(C);
    //return;    
}

function DrawSelectQSlot(Canvas C)
{
    local float ratioX, ratioY;
    local int LeftTime, respawnLeftTime, startupLeftTime, iCode_Message, iWidthTemp;

    local wMyPlayerStatus MyStatus;
    local FloatBox boxTemp;
    local bool bPlayerWaiting;

    C.Style = 5;
    // End:0x2A
    if(!bUpdate)
    {
        UpdateHelpKeyControll();
        bUpdate = true;
    }
    bCurrentIsStatePlayerWalking = HudOwner.PlayerOwner.IsInState('PlayerWalking');
    bCurrentIsStateWaitingForStart = HudOwner.PlayerOwner.IsInState('WaitingForStart');
    bCurrentIsStateDead = HudOwner.PlayerOwner.IsInState('Dead');
    bCurrentIsStateSpectate = HudOwner.PlayerOwner.IsInState('Spectating');
    bCurrentIsStateRoundEnded = HudOwner.PlayerOwner.IsInState('RoundEnded');
    bPlayerWaiting = HudOwner.PlayerOwner.IsInState('PlayerWaiting');
    // End:0x10F
    if(!HudOwner.PlayerOwner.CheckChangeHostShowQS())
    {
        return;
    }
    bPrevIsStatePlayerWalking = bCurrentIsStatePlayerWalking;
    bPrevIsStateWaitingForStart = bCurrentIsStateWaitingForStart;
    // End:0x164
    if(((bCurrentIsStateRoundEnded == false) && bCurrentIsStateDead == true) && bPrevIsStateDead == false)
    {
        bTimeLimitOff = true;
        bStartChangeQS = false;        
    }
    else
    {
        // End:0x1B0
        if(((bCurrentIsStateRoundEnded == false) && bCurrentIsStateDead == false) && bPrevIsStateDead == true)
        {
            // End:0x1A0
            if(bCurrentIsStateSpectate)
            {
                bTimeLimitOff = true;                
            }
            else
            {
                bTimeLimitOff = false;
            }
            bStartChangeQS = false;
        }
    }
    bPrevIsStateDead = bCurrentIsStateDead;
    // End:0x2B0
    if(PrevSelectedQSlotIndex != HudOwner.PlayerOwner.iSelectedQSlotIndex)
    {
        switch(HudOwner.PlayerOwner.iSelectedQSlotIndex)
        {
            // End:0x212
            case 0:
                iCode_Message = Class'Engine.wMessage_Game_ImpSystem'.default.Code_ChangeQS_1;
                // End:0x276
                break;
            // End:0x22D
            case 1:
                iCode_Message = Class'Engine.wMessage_Game_ImpSystem'.default.Code_ChangeQS_2;
                // End:0x276
                break;
            // End:0x249
            case 2:
                iCode_Message = Class'Engine.wMessage_Game_ImpSystem'.default.Code_ChangeQS_3;
                // End:0x276
                break;
            // End:0x265
            case 3:
                iCode_Message = Class'Engine.wMessage_Game_ImpSystem'.default.Code_ChangeQS_4;
                // End:0x276
                break;
            // End:0xFFFF
            default:
                iCode_Message = -1;
                // End:0x276
                break;
                break;
        }
        // End:0x2A7
        if(-1 != iCode_Message)
        {
            HudOwner.PlayerOwner.ReceiveLocalizedMessage(Class'Engine.wMessage_Game_ImpSystem', iCode_Message);
        }
        // End:0x2B0
        if(bCurrentIsStatePlayerWalking)
        {
        }
    }
    PrevSelectedQSlotIndex = HudOwner.PlayerOwner.iSelectedQSlotIndex;
    // End:0x2F7
    if((bCurrentIsStateRoundEnded == false) && bPrevIsStateRoundEnded == true)
    {
        bTimeLimitOff = false;
        bStartChangeQS = false;
    }
    bPrevIsStateRoundEnded = bCurrentIsStateRoundEnded;
    // End:0x31E
    if(bStartChangeQS == false)
    {
        BeginQuickSlotWindow();
        bStartChangeQS = true;
    }
    // End:0x349
    if(bPlayerWaiting || bCurrentIsStateSpectate)
    {
        LevelStartTime = Level.PlayTimeSeconds;        
    }
    else
    {
        // End:0x358
        if(bCurrentIsStateRoundEnded)
        {
            EndQuickSlotWindow();
        }
    }
    // End:0x37E
    if(HudOwner.PlayerOwner.bCanChangeQS == false)
    {
        EndQuickSlotWindow();
        return;
    }
    CalcQuickSlotTimer(respawnLeftTime, startupLeftTime);
    LeftTime = Max(respawnLeftTime, startupLeftTime);
    // End:0x3C6
    if(HudOwner.PlayerOwner.bToggleQuickSlotWindow)
    {
        DrawQuickSlot(C);
    }
    // End:0x48E
    if((bTimeLimitOff == false) && LeftTime <= 0)
    {
        // End:0x42B
        if((HudOwner.PawnOwner != none) && wPawn(HudOwner.PawnOwner) != none)
        {
            wPawn(HudOwner.PawnOwner).ClientQSlotChangeCheck();
        }
        HudOwner.PlayerOwner.Player.Console.AddMessageItem(HudOwner.PlayerOwner.Player.Console.ConstructMessageItem(strCloseQSTime, 6));
        EndQuickSlotWindow();
        return;
    }
    // End:0x5AA
    if(HudOwner.PlayerOwner.Pawn != none)
    {
        // End:0x5AA
        if(VSize(HudOwner.PlayerOwner.Pawn.Location - HudOwner.PlayerOwner.Pawn.RespawnLocation) > float(1200))
        {
            // End:0x547
            if((HudOwner.PawnOwner != none) && wPawn(HudOwner.PawnOwner) != none)
            {
                wPawn(HudOwner.PawnOwner).ClientQSlotChangeCheck();
            }
            HudOwner.PlayerOwner.Player.Console.AddMessageItem(HudOwner.PlayerOwner.Player.Console.ConstructMessageItem(strCloseQSDistance, 6));
            EndQuickSlotWindow();
            return;
        }
    }
    MyStatus = Level.CharMgr.MyPlayer;
    ratioX = C.ClipX / float(1024);
    ratioY = C.ClipY / float(768);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    // End:0x6B8
    if(HudOwner.PlayerOwner.bToggleQuickSlotWindow)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImageScaleWithClipArea(C, Class'XInterface_Decompressed.BTHUDResourcePoolHK'.default.newButt_n, fbQSButtonOpen.X1 * ratioX, fbQSButtonOpen.Y1 * ratioY, fbQSButtonOpen.X2 * ratioX, fbQSButtonOpen.Y2 * ratioY, 0.0000000, 49.0000000, 339.0000000, 98.0000000);        
    }
    else
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImageScaleWithClipArea(C, Class'XInterface_Decompressed.BTHUDResourcePoolHK'.default.newButt_n, fbQSButtonOpen.X1 * ratioX, fbQSButtonOpen.Y1 * ratioY, fbQSButtonOpen.X2 * ratioX, fbQSButtonOpen.Y2 * ratioY, 0.0000000, 0.0000000, 339.0000000, 49.0000000);
    }
    Class'Engine.BTCustomDrawHK'.static.DrawImageScaleWithClipArea(C, Class'XInterface_Decompressed.BTHUDResourcePoolHK'.default.Key_Bg, 391.0000000 * ratioX, (fbQSButtonOpen.Y1 + float(6)) * ratioY, 412.0000000 * ratioX, (fbQSButtonOpen.Y2 - float(6)) * ratioY, 0.0000000, 0.0000000, 32.0000000, 32.0000000);
    boxTemp.X1 = float(HelpKeyButtonQSlot.TextureCoords.X1);
    boxTemp.Y1 = float(HelpKeyButtonQSlot.TextureCoords.Y1);
    boxTemp.X2 = float(HelpKeyButtonQSlot.TextureCoords.X2);
    boxTemp.Y2 = float(HelpKeyButtonQSlot.TextureCoords.Y2);
    // End:0x83A
    if(WidthButtonQSlot == float(52))
    {
        iWidthTemp = 426;        
    }
    else
    {
        iWidthTemp = 410;
    }
    Class'Engine.BTCustomDrawHK'.static.DrawImageScaleWithClipArea(C, Class'XInterface_Decompressed.BTHUDResourcePoolHK'.default.butt_Keyboard, 393.0000000 * ratioX, (fbQSButtonOpen.Y1 + float(8)) * ratioY, float(iWidthTemp) * ratioX, (fbQSButtonOpen.Y2 - float(8)) * ratioY, boxTemp.X1, boxTemp.Y1, boxTemp.X2, boxTemp.Y2);
    C.DrawColor = C.MakeColor(byte(255), 153, 0, byte(255));
    // End:0x994
    if(HudOwner.PlayerOwner.bToggleQuickSlotWindow)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawString(C, strToggleQS[0], 4, 12.0000000, fbQSButtonOpen.X1 * ratioX, fbQSButtonOpen.Y1 * ratioY, fbQSButtonOpen.X2 * ratioX, fbQSButtonOpen.Y2 * ratioY, Class'XInterface_Decompressed.BTHUDColorPoolHK'.static.DefaultShadow());        
    }
    else
    {
        Class'Engine.BTCustomDrawHK'.static.DrawString(C, strToggleQS[1], 4, 12.0000000, fbQSButtonOpen.X1 * ratioX, fbQSButtonOpen.Y1 * ratioY, fbQSButtonOpen.X2 * ratioX, fbQSButtonOpen.Y2 * ratioY, Class'XInterface_Decompressed.BTHUDColorPoolHK'.static.DefaultShadow());
    }
    // End:0xAAF
    if((bTimeLimitOff == false) && (bPlayerWaiting == false) || bCurrentIsStateSpectate == false)
    {
        C.DrawColor = colorLeftTime;
        Class'Engine.BTCustomDrawHK'.static.DrawString(C, string(LeftTime) $ strWeaponChange[1], 4, 11.0000000, 384.0000000 * ratioX, 588.0000000 * ratioY, 640.0000000 * ratioX, 618.0000000 * ratioY, Class'XInterface_Decompressed.BTHUDColorPoolHK'.static.DefaultShadow());
    }
    //return;    
}

function DrawQuickSlot(Canvas C)
{
    local int i, j, iPosX, iPosY;
    local float ratioX, ratioY;
    local bool bHasItem;

    ratioX = C.ClipX / float(1600);
    ratioY = C.ClipY / float(1200);
    iPosX = 264;
    iPosY = 479;
    C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'XInterface_Decompressed.BTHUDResourcePoolHK'.default.Slot_Bg, 0.1650000 * C.ClipX, 0.3991600 * C.ClipY, 0.2681250 * C.ClipX, 0.7616600 * C.ClipY);
    DrawQuickSlotContent_Description(C, iPosX, iPosY);
    C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
    i = 0;
    J0x13E:

    // End:0x380 [Loop If]
    if(i < 4)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'XInterface_Decompressed.BTHUDResourcePoolHK'.default.Slot_Bg, (434.0000000 + float(i * 227)) * ratioX, 416.0000000 * ratioY, (656.0000000 + float(i * 227)) * ratioX, 923.0000000 * ratioY);
        j = 0;
        J0x1BD:

        // End:0x376 [Loop If]
        if(j < 9)
        {
            // End:0x29E
            if(j < 5)
            {
                Class'Engine.BTCustomDrawHK'.static.DrawImageScaleWithClipArea(C, Class'XInterface_Decompressed.BTHUDResourcePoolHK'.default.MainWeapon_Bg, (440.0000000 + float(i * 227)) * ratioX, (489.0000000 + float(j * 42)) * ratioY, (650.0000000 + float(i * 227)) * ratioX, (531.0000000 + float(j * 42)) * ratioY, fWeaponUV[j].X1, fWeaponUV[j].Y1, fWeaponUV[j].X2, fWeaponUV[j].Y2);
                // [Explicit Continue]
                goto J0x36C;
            }
            Class'Engine.BTCustomDrawHK'.static.DrawImageScaleWithClipArea(C, Class'XInterface_Decompressed.BTHUDResourcePoolHK'.default.MainWeapon_Bg, (440.0000000 + float(i * 227)) * ratioX, (727.0000000 + float((j - 5) * 42)) * ratioY, (650.0000000 + float(i * 227)) * ratioX, (769.0000000 + float((j - 5) * 42)) * ratioY, fWeaponUV[j].X1, fWeaponUV[j].Y1, fWeaponUV[j].X2, fWeaponUV[j].Y2);
            J0x36C:

            j++;
            // [Loop Continue]
            goto J0x1BD;
        }
        i++;
        // [Loop Continue]
        goto J0x13E;
    }
    C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
    DrawSellectBar(C, iPosX, iPosY);
    i = 0;
    J0x3CA:

    // End:0x4D0 [Loop If]
    if(i < 4)
    {
        QuickSlotContent_SetString(C, int(float(iPosX) + fbQSContent[i].X1), int(float(iPosY) + fbQSContent[i].Y1), i, false);
        j = 0;
        J0x424:

        // End:0x457 [Loop If]
        if(j < 9)
        {
            // End:0x44D
            if(strQSItemName[j] != srtQSNothing)
            {
                bHasItem = true;
            }
            j++;
            // [Loop Continue]
            goto J0x424;
        }
        DrawQuickSlotName(C, int(fbQSContentName[i].X1), int(fbQSContentName[i].Y1), i, false, bHasItem);
        DrawQuickSlotContent_List(C, int(fbQSContent[i].X1), int(fbQSContent[i].Y1), i);
        i++;
        // [Loop Continue]
        goto J0x3CA;
    }
    bLoadSlotItemResource = true;
    //return;    
}

function DrawQuickSlotName(Canvas C, int iPosX, int iPosY, int iSlot, optional bool bDefaultWeapon, optional bool bHasItem)
{
    local int OffsetX, OffsetY;
    local float ratioX, ratioY;
    local FloatBox boxTemp;
    local wMyPlayerStatus MyStatus;
    local SpriteWidget TempWidget;

    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    ratioX = C.ClipX / float(1600);
    ratioY = C.ClipY / float(1200);
    MyStatus = Level.CharMgr.MyPlayer;
    OffsetX = 14;
    OffsetY = 0;
    // End:0x16F
    if(HudOwner.PlayerOwner.iSelectedQSlotIndex == iSlot)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImageScaleWithClipArea(C, Class'XInterface_Decompressed.BTHUDResourcePoolHK'.default.Weapon_Type_n, float(iPosX) * ratioX, float(iPosY) * ratioY, (214.0000000 + float(iPosX)) * ratioX, (49.0000000 + float(iPosY)) * ratioY, fbQSBack_SlotName[1].X1, fbQSBack_SlotName[1].Y1, fbQSBack_SlotName[1].X2, fbQSBack_SlotName[1].Y2);
        C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));        
    }
    else
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImageScaleWithClipArea(C, Class'XInterface_Decompressed.BTHUDResourcePoolHK'.default.Weapon_Type_n, float(iPosX) * ratioX, float(iPosY) * ratioY, (214.0000000 + float(iPosX)) * ratioX, (49.0000000 + float(iPosY)) * ratioY, fbQSBack_SlotName[0].X1, fbQSBack_SlotName[0].Y1, fbQSBack_SlotName[0].X2, fbQSBack_SlotName[0].Y2);
        C.DrawColor = C.MakeColor(163, 163, 163, byte(255));
    }
    OffsetX = 59;
    OffsetY = 4;
    Class'Engine.BTCustomDrawHK'.static.DrawString(C, MyStatus.QuickSlotList[iSlot].strName, 5, float(iFontSize2), float(iPosX + 38) * ratioX, float(iPosY + 15) * ratioY, (202.0000000 + float(iPosX)) * ratioX, (32.0000000 + float(iPosY)) * ratioY, Class'XInterface_Decompressed.BTHUDColorPoolHK'.static.DefaultShadow());
    // End:0x30C
    if(bHasItem)
    {
        C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));        
    }
    else
    {
        C.DrawColor = C.MakeColor(127, 127, 127, byte(255));
    }
    OffsetX = 14 + 7;
    OffsetY = 5;
    OffsetX = 14 + 9;
    OffsetY = 7;
    // End:0x37E
    if(!bDefaultWeapon)
    {
        TempWidget = HelpKeyButtonNumber[1 + iSlot];        
    }
    else
    {
        TempWidget = HelpKeyButtonAlphaBet[16];
    }
    boxTemp.X1 = float(TempWidget.TextureCoords.X1);
    boxTemp.Y1 = float(TempWidget.TextureCoords.Y1);
    boxTemp.X2 = float(TempWidget.TextureCoords.X2);
    boxTemp.Y2 = float(TempWidget.TextureCoords.Y2);
    Class'Engine.BTCustomDrawHK'.static.DrawImageScaleWithClipArea(C, Class'XInterface_Decompressed.BTHUDResourcePoolHK'.default.butt_Keyboard, float(iPosX + 10) * ratioX, float(iPosY + 12) * ratioY, ((26.0000000 + float(iPosX)) + float(10)) * ratioX, ((26.0000000 + float(iPosY)) + float(12)) * ratioY, boxTemp.X1, boxTemp.Y1, boxTemp.X2, boxTemp.Y2);
    //return;    
}

function DrawSellectBar(Canvas C, int iPosX, int iPosY, optional bool bDefaultWeapon)
{
    local int iSlot;
    local float ratioX, ratioY, fAddTemp;

    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    ratioX = C.ClipX / float(1600);
    ratioY = C.ClipY / float(1200);
    iSlot = HudOwner.PlayerOwner.PlayerReplicationInfo.nQuickSlotIdx;
    fAddTemp = 0.0000000;
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'XInterface_Decompressed.BTHUDResourcePoolHK'.default.Weapon_Sel_Line, (float(iPosX + 170) + float(iSlot * 227)) * ratioX, float(iPosY - 63) * ratioY, (float(iPosX + 392) + float(iSlot * 227)) * ratioX, float(iPosY + 444) * ratioY);
    //return;    
}

function DrawQuickSlotContent_Description(Canvas C, int iPosX, int iPosY)
{
    local int i, iFontSize, OffsetX, OffsetY;
    local float ratioX, ratioY, X1, X2, Y1, Y2;

    local string strTemp;

    ratioX = C.ClipX / float(1600);
    ratioY = C.ClipY / float(1200);
    C.DrawColor = colorQSContent;
    OffsetX = 13;
    OffsetY = 4;
    iFontSize = int(float(14) * _reY);
    i = 0;
    J0x78:

    // End:0x161 [Loop If]
    if(i < 9)
    {
        OffsetY = ContentOffSetY[i];
        X1 = float(iPosX + 13) * _reX;
        X2 = float(iPosX + 162) * _reX;
        Y1 = float(OffsetY) * _reY;
        Y2 = float(OffsetY + 18) * _reY;
        strTemp = GetEllipsString(C, strQSContent[1 + i], X2 - X1, float(iFontSize));
        C.BtrDrawTextJustifiedWithVolumeLine(strTemp, 1, X1, Y1, X2, Y2, iFontSize, color_Shadow);
        i++;
        // [Loop Continue]
        goto J0x78;
    }
    //return;    
}

function DrawQuickSlotContent_DefaultWeapon(Canvas C, int iPosX, int iPosY)
{
    local int i, j, iSkillSlot, iItemID, iLocation, OffsetX,
	    OffsetY;

    local float ratioX, ratioY, iFontSize, X1, X2, Y1,
	    Y2;

    local FloatBox TextBox;
    local string strTemp;
    local wMatchMaker kMM;
    local wMatchUserInfo kUser;
    local wMyPlayerStatus MyStatus;
    local wItemBaseParam cItemParam;

    iSkillSlot = 14;
    ratioX = C.ClipX / float(1600);
    ratioY = C.ClipY / float(1200);
    MyStatus = Level.CharMgr.MyPlayer;
    kMM = Level.GetMatchMaker();
    QuickSlotContent_SetString(C, iPosX, iPosY, -1, true);
    OffsetY = 0;
    i = 0;
    J0x9D:

    // End:0x277 [Loop If]
    if(i < 4)
    {
        iItemID = -1;
        // End:0x129
        if(((kMM != none) && HudOwner.PlayerOwner != none) && HudOwner.PlayerOwner.PlayerReplicationInfo != none)
        {
            kUser = kMM.GetUserInfoByUserName(HudOwner.PlayerOwner.PlayerReplicationInfo.PlayerName);
        }
        // End:0x202
        if(kUser != none)
        {
            j = 0;
            J0x13B:

            // End:0x202 [Loop If]
            if(j < MyStatus.SkillList.Length)
            {
                iItemID = -1;
                // End:0x1F8
                if(iSkillSlot == int(MyStatus.SkillList[j].bySlotPosition))
                {
                    iItemID = MyStatus.SkillList[j].iSkillID;
                    cItemParam = Level.GameMgr.GetItemParam(iItemID);
                    // End:0x1F5
                    if(cItemParam != none)
                    {
                        // End:0x1F5
                        if(int(cItemParam.byModeItem) != 0)
                        {
                            iItemID = -1;
                            // [Explicit Continue]
                            goto J0x1F8;
                        }
                    }
                    // [Explicit Break]
                    goto J0x202;
                }
                J0x1F8:

                j++;
                // [Loop Continue]
                goto J0x13B;
            }
        }
        J0x202:

        // End:0x251
        if(0 < iItemID)
        {
            iLocation = InStr(cItemParam.strDisplayName, "]");
            strQSItemName[5 + i] = Mid(cItemParam.strDisplayName, iLocation + 1);            
        }
        else
        {
            strQSItemName[5 + i] = srtQSNothing;
        }
        iSkillSlot++;
        i++;
        // [Loop Continue]
        goto J0x9D;
    }
    i = 0;
    J0x27E:

    // End:0x3D7 [Loop If]
    if(i < 5)
    {
        OffsetX = ContentOffSetX[i];
        OffsetY = 0;
        C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
        TextBox = fbQS_Content_Text_Default;
        iFontSize = 13.0000000 * _reY;
        X1 = float(iPosX + 179) * _reX;
        X2 = float(iPosX + 383) * _reX;
        Y1 = (float(iPosY + 22) + float(44 * i)) * _reY;
        Y2 = (float(iPosY + 42) + float(44 * i)) * _reY;
        strTemp = GetEllipsString(C, strQSItemName[i], X2 - X1, iFontSize);
        C.BtrDrawTextJustifiedWithVolumeLine(strTemp, 1, X1, Y1, X2, Y2, int(iFontSize), color_Shadow);
        i++;
        // [Loop Continue]
        goto J0x27E;
    }
    i = 0;
    J0x3DE:

    // End:0x547 [Loop If]
    if(i < 4)
    {
        OffsetX = ContentOffSetX[i];
        OffsetY = 0;
        C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
        TextBox = fbQS_Content_Text_Default;
        iFontSize = 13.0000000 * _reY;
        X1 = float(iPosX + 179) * _reX;
        X2 = float(iPosX + 383) * _reX;
        Y1 = ((float(iPosY + 22) + float(44 * i)) + float(235)) * _reY;
        Y2 = ((float(iPosY + 42) + float(44 * i)) + float(235)) * _reY;
        strTemp = GetEllipsString(C, strQSItemName[i + 5], X2 - X1, iFontSize);
        C.BtrDrawTextJustifiedWithVolumeLine(strTemp, 1, X1, Y1, X2, Y2, int(iFontSize), color_Shadow);
        i++;
        // [Loop Continue]
        goto J0x3DE;
    }
    bLoadDefaultItemResource = true;
    //return;    
}

function bool DrawQuickSlotContent_List(Canvas C, int iPosX, int iPosY, int iSlot)
{
    local int i, iFontSize;
    local float ratioX, ratioY, X1, X2, Y1, Y2;

    local bool bHasItem;
    local FloatBox TextBox;
    local string strTemp;

    ratioX = C.ClipX / float(1600);
    ratioY = C.ClipY / float(1200);
    iFontSize = iFontSize1;
    i = 0;
    J0x4C:

    // End:0x181 [Loop If]
    if(i < 5)
    {
        C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
        TextBox = fbQS_Content_Text_Default;
        iFontSize = int(float(13) * _reY);
        X1 = float(iPosX) * _reX;
        X2 = float(iPosX + 204) * _reX;
        Y1 = float(iPosY + (i * 44)) * _reY;
        Y2 = (float(iPosY + 20) + float(i * 44)) * _reY;
        strTemp = GetEllipsString(C, strQSItemName[i], X2 - X1, float(iFontSize));
        C.BtrDrawTextJustifiedWithVolumeLine(strTemp, 1, X1, Y1, X2, Y2, iFontSize, color_Shadow);
        i++;
        // [Loop Continue]
        goto J0x4C;
    }
    i = 0;
    J0x188:

    // End:0x2CB [Loop If]
    if(i < 4)
    {
        C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
        TextBox = fbQS_Content_Text_Default;
        iFontSize = int(float(13) * _reY);
        X1 = float(iPosX) * _reX;
        X2 = float(iPosX + 204) * _reX;
        Y1 = float((iPosY + (i * 44)) + 238) * _reY;
        Y2 = ((float(iPosY + 20) + float(i * 44)) + float(238)) * _reY;
        strTemp = GetEllipsString(C, strQSItemName[i + 5], X2 - X1, float(iFontSize));
        C.BtrDrawTextJustifiedWithVolumeLine(strTemp, 1, X1, Y1, X2, Y2, iFontSize, color_Shadow);
        i++;
        // [Loop Continue]
        goto J0x188;
    }
    return bHasItem;
    //return;    
}

function QuickSlotContent_SetString(Canvas C, int iPosX, int iPosY, int iSlot, optional bool bDefaultWeapon)
{
    local int i, j, iItemID, iLocation;
    local float ratioX, ratioY;
    local wMyPlayerStatus MyStatus;
    local wItemBaseParam cItemParam;
    local wMatchMaker kMM;
    local wMatchUserInfo kUser;

    ratioX = C.ClipX / float(1600);
    ratioY = C.ClipY / float(1200);
    MyStatus = Level.CharMgr.MyPlayer;
    kMM = Level.GetMatchMaker();
    i = 0;
    J0x73:

    // End:0x365 [Loop If]
    if(i < 5)
    {
        iItemID = -1;
        // End:0x102
        if(bDefaultWeapon)
        {
            // End:0xE8
            if(i != 2)
            {
                // End:0xCB
                if(i > 2)
                {
                    iItemID = MyStatus.FindItemIDBySlotPos(i - 1);                    
                }
                else
                {
                    iItemID = MyStatus.FindItemIDBySlotPos(i);
                }                
            }
            else
            {
                iItemID = MyStatus.FindItemIDBySlotPos(8);
            }            
        }
        else
        {
            // End:0x16D
            if(i != 2)
            {
                // End:0x145
                if(i > 2)
                {
                    iItemID = MyStatus.QuickSlotList[iSlot].iItemID[i - 1];                    
                }
                else
                {
                    iItemID = MyStatus.QuickSlotList[iSlot].iItemID[i];
                }                
            }
            else
            {
                iItemID = MyStatus.QuickSlotList[iSlot].iItemID[4];
            }
        }
        // End:0x2F2
        if(int(kMM.eWeaponLimit) != int(kMM.0))
        {
            // End:0x218
            if(int(kMM.eWeaponLimit) == int(kMM.4))
            {
                // End:0x215
                if(0 == i)
                {
                    cItemParam = Level.GameMgr.GetItemParam(5012);
                    iItemID = cItemParam.iItemID;
                }                
            }
            else
            {
                // End:0x28E
                if(int(kMM.eWeaponLimit) == int(kMM.1))
                {
                    // End:0x28B
                    if(2 == i)
                    {
                        // End:0x269
                        if(bDefaultWeapon)
                        {
                            iItemID = MyStatus.FindItemIDBySlotPos(8);                            
                        }
                        else
                        {
                            iItemID = MyStatus.QuickSlotList[iSlot].iItemID[4];
                        }
                    }                    
                }
                else
                {
                    // End:0x2F2
                    if(int(kMM.eWeaponLimit) == int(kMM.10))
                    {
                        // End:0x2F2
                        if(0 == i)
                        {
                            cItemParam = Level.GameMgr.GetItemParam(5016);
                            iItemID = cItemParam.iItemID;
                        }
                    }
                }
            }
        }
        cItemParam = Level.GameMgr.GetItemParam(iItemID);
        // End:0x34A
        if((0 < iItemID) && cItemParam != none)
        {
            strQSItemName[i] = cItemParam.strDisplayName;
            // [Explicit Continue]
            goto J0x35B;
        }
        strQSItemName[i] = srtQSNothing;
        J0x35B:

        i++;
        // [Loop Continue]
        goto J0x73;
    }
    i = 0;
    J0x36C:

    // End:0x44F [Loop If]
    if(i < 4)
    {
        iItemID = -1;
        // End:0x3B3
        if(!bDefaultWeapon)
        {
            iItemID = MyStatus.QuickSlotList[iSlot].iSkillID[i];
        }
        // End:0x430
        if(0 < iItemID)
        {
            cItemParam = Level.GameMgr.GetItemParam(iItemID);
            // End:0x430
            if(cItemParam != none)
            {
                iLocation = InStr(cItemParam.strDisplayName, "]");
                strQSItemName[5 + i] = Mid(cItemParam.strDisplayName, iLocation + 1);
                // [Explicit Continue]
                goto J0x445;
            }
        }
        strQSItemName[5 + i] = srtQSNothing;
        J0x445:

        i++;
        // [Loop Continue]
        goto J0x36C;
    }
    // End:0x4A8
    if(int(kMM.eWeaponLimit) == int(kMM.1))
    {
        i = 0;
        J0x478:

        // End:0x4A8 [Loop If]
        if(i < 5)
        {
            // End:0x49E
            if(i != 2)
            {
                strQSItemName[i] = "";
            }
            i++;
            // [Loop Continue]
            goto J0x478;
        }
    }
    //return;    
}

function Image GetItemImage(Canvas C, int iItemID)
{
    local string szIcon;
    local wWeaponManager wMani;
    local Class<wWeaponRes_Base> wRes;
    local Image BTImage;
    local wWeaponBaseParams WBP;

    // End:0x11
    if(iItemID <= 0)
    {
        return BTImage;
    }
    wMani = Level.WeaponMgr;
    WBP = Level.WeaponMgr.GetBaseParam(iItemID);
    wRes = wMani.GetRes(WBP.szClass_Resource);
    szIcon = wRes.default.szIcon_Kill;
    BTImage.X = float(wRes.default.ibIcon_Kill.X);
    BTImage.Y = float(wRes.default.ibIcon_Kill.Y);
    BTImage.width = float(wRes.default.ibIcon_Kill.W);
    BTImage.Height = float(wRes.default.ibIcon_Kill.H);
    BTImage.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
    BTImage.DrawType = 28;
    // End:0x1A3
    if(int(17) == int(WBP.eType))
    {
        szIcon = wRes.default.szIcon_HUD;
        BTImage.X = 0.0000000;
        BTImage.Y = 0.0000000;
        BTImage.width = 256.0000000;
        BTImage.Height = 64.0000000;
    }
    BTImage.Image = Material(DynamicLoadObject(szIcon, Class'Engine.Material'));
    HudOwner.clog((((("name=" $ WBP.strName) $ "x=") $ string(BTImage.X)) $ " y=") $ string(BTImage.Y));
    return BTImage;
    //return;    
}

function DrawItemImage(Canvas C)
{
    //return;    
}

defaultproperties
{
    fbQSContentName[0]=(X1=438.0000000,Y1=420.0000000,X2=0.0000000,Y2=0.0000000)
    fbQSContentName[1]=(X1=665.0000000,Y1=420.0000000,X2=0.0000000,Y2=0.0000000)
    fbQSContentName[2]=(X1=892.0000000,Y1=420.0000000,X2=0.0000000,Y2=0.0000000)
    fbQSContentName[3]=(X1=1119.0000000,Y1=420.0000000,X2=0.0000000,Y2=0.0000000)
    fbQSContent[0]=(X1=443.0000000,Y1=501.0000000,X2=647.0000000,Y2=521.0000000)
    fbQSContent[1]=(X1=670.0000000,Y1=501.0000000,X2=874.0000000,Y2=521.0000000)
    fbQSContent[2]=(X1=897.0000000,Y1=501.0000000,X2=1101.0000000,Y2=521.0000000)
    fbQSContent[3]=(X1=1124.0000000,Y1=501.0000000,X2=1328.0000000,Y2=521.0000000)
    ContentOffSetY[0]=503
    ContentOffSetY[1]=547
    ContentOffSetY[2]=591
    ContentOffSetY[3]=635
    ContentOffSetY[4]=679
    ContentOffSetY[5]=739
    ContentOffSetY[6]=783
    ContentOffSetY[7]=827
    ContentOffSetY[8]=871
    fbQSBack_SlotName[0]=(X1=0.0000000,Y1=0.0000000,X2=214.0000000,Y2=49.0000000)
    fbQSBack_SlotName[1]=(X1=0.0000000,Y1=49.0000000,X2=214.0000000,Y2=98.0000000)
    fWeaponUV[0]=(X1=0.0000000,Y1=0.0000000,X2=210.0000000,Y2=42.0000000)
    fWeaponUV[1]=(X1=0.0000000,Y1=42.0000000,X2=210.0000000,Y2=84.0000000)
    fWeaponUV[2]=(X1=0.0000000,Y1=84.0000000,X2=210.0000000,Y2=126.0000000)
    fWeaponUV[3]=(X1=0.0000000,Y1=126.0000000,X2=210.0000000,Y2=168.0000000)
    fWeaponUV[4]=(X1=0.0000000,Y1=126.0000000,X2=210.0000000,Y2=168.0000000)
    fWeaponUV[5]=(X1=0.0000000,Y1=168.0000000,X2=210.0000000,Y2=210.0000000)
    fWeaponUV[6]=(X1=0.0000000,Y1=210.0000000,X2=210.0000000,Y2=252.0000000)
    fWeaponUV[7]=(X1=0.0000000,Y1=210.0000000,X2=210.0000000,Y2=252.0000000)
    fWeaponUV[8]=(X1=0.0000000,Y1=210.0000000,X2=210.0000000,Y2=252.0000000)
}