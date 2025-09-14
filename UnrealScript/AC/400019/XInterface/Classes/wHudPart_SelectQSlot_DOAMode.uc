class wHudPart_SelectQSlot_DOAMode extends wHudPart_SelectQSlotCN
    transient;

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
    // End:0x187
    if(((bCurrentIsStateRoundEnded == false) && bCurrentIsStateDead == true) && bPrevIsStateDead == false)
    {
        bTimeLimitOff = true;
        bStartChangeQS = false;
        HudOwner.PlayerOwner.PlayerReplicationInfo.bPickupWeaponDOA = false;        
    }
    else
    {
        // End:0x1F6
        if(((bCurrentIsStateRoundEnded == false) && bCurrentIsStateDead == false) && bPrevIsStateDead == true)
        {
            // End:0x1E6
            if(bCurrentIsStateSpectate)
            {
                bTimeLimitOff = true;
                HudOwner.PlayerOwner.PlayerReplicationInfo.bPickupWeaponDOA = false;                
            }
            else
            {
                bTimeLimitOff = false;
            }
            bStartChangeQS = false;
        }
    }
    bPrevIsStateDead = bCurrentIsStateDead;
    // End:0x2F6
    if(PrevSelectedQSlotIndex != HudOwner.PlayerOwner.iSelectedQSlotIndex)
    {
        switch(HudOwner.PlayerOwner.iSelectedQSlotIndex)
        {
            // End:0x258
            case 0:
                iCode_Message = Class'Engine.wMessage_Game_ImpSystem'.default.Code_ChangeQS_1;
                // End:0x2BC
                break;
            // End:0x273
            case 1:
                iCode_Message = Class'Engine.wMessage_Game_ImpSystem'.default.Code_ChangeQS_2;
                // End:0x2BC
                break;
            // End:0x28F
            case 2:
                iCode_Message = Class'Engine.wMessage_Game_ImpSystem'.default.Code_ChangeQS_3;
                // End:0x2BC
                break;
            // End:0x2AB
            case 3:
                iCode_Message = Class'Engine.wMessage_Game_ImpSystem'.default.Code_ChangeQS_4;
                // End:0x2BC
                break;
            // End:0xFFFF
            default:
                iCode_Message = -1;
                // End:0x2BC
                break;
                break;
        }
        // End:0x2ED
        if(-1 != iCode_Message)
        {
            HudOwner.PlayerOwner.ReceiveLocalizedMessage(Class'Engine.wMessage_Game_ImpSystem', iCode_Message);
        }
        // End:0x2F6
        if(bCurrentIsStatePlayerWalking)
        {
        }
    }
    PrevSelectedQSlotIndex = HudOwner.PlayerOwner.iSelectedQSlotIndex;
    // End:0x360
    if((bCurrentIsStateRoundEnded == false) && bPrevIsStateRoundEnded == true)
    {
        bTimeLimitOff = false;
        bStartChangeQS = false;
        HudOwner.PlayerOwner.PlayerReplicationInfo.bPickupWeaponDOA = false;
    }
    bPrevIsStateRoundEnded = bCurrentIsStateRoundEnded;
    // End:0x387
    if(bStartChangeQS == false)
    {
        BeginQuickSlotWindow();
        bStartChangeQS = true;
    }
    // End:0x3B2
    if(bPlayerWaiting || bCurrentIsStateSpectate)
    {
        LevelStartTime = Level.PlayTimeSeconds;        
    }
    else
    {
        // End:0x3E7
        if(bCurrentIsStateRoundEnded || HudOwner.PlayerOwner.PlayerReplicationInfo.bPickupWeaponDOA)
        {
            EndQuickSlotWindow();
        }
    }
    // End:0x40D
    if(HudOwner.PlayerOwner.bCanChangeQS == false)
    {
        EndQuickSlotWindow();
        return;
    }
    CalcQuickSlotTimer(respawnLeftTime, startupLeftTime);
    LeftTime = Max(respawnLeftTime, startupLeftTime);
    // End:0x455
    if(HudOwner.PlayerOwner.bToggleQuickSlotWindow)
    {
        DrawQuickSlot(C);
    }
    // End:0x51D
    if((bTimeLimitOff == false) && LeftTime <= 0)
    {
        // End:0x4BA
        if((HudOwner.PawnOwner != none) && wPawn(HudOwner.PawnOwner) != none)
        {
            wPawn(HudOwner.PawnOwner).ClientQSlotChangeCheck();
        }
        HudOwner.PlayerOwner.Player.Console.AddMessageItem(HudOwner.PlayerOwner.Player.Console.ConstructMessageItem(strCloseQSTime, 6));
        EndQuickSlotWindow();
        return;
    }
    // End:0x639
    if(HudOwner.PlayerOwner.Pawn != none)
    {
        // End:0x639
        if(VSize(HudOwner.PlayerOwner.Pawn.Location - HudOwner.PlayerOwner.Pawn.RespawnLocation) > float(1200))
        {
            // End:0x5D6
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
    // End:0x747
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
    // End:0x8C9
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
    // End:0xA23
    if(HudOwner.PlayerOwner.bToggleQuickSlotWindow)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawString(C, strToggleQS[0], 4, 12.0000000, fbQSButtonOpen.X1 * ratioX, fbQSButtonOpen.Y1 * ratioY, fbQSButtonOpen.X2 * ratioX, fbQSButtonOpen.Y2 * ratioY, Class'XInterface_Decompressed.BTHUDColorPoolHK'.static.DefaultShadow());        
    }
    else
    {
        Class'Engine.BTCustomDrawHK'.static.DrawString(C, strToggleQS[1], 4, 12.0000000, fbQSButtonOpen.X1 * ratioX, fbQSButtonOpen.Y1 * ratioY, fbQSButtonOpen.X2 * ratioX, fbQSButtonOpen.Y2 * ratioY, Class'XInterface_Decompressed.BTHUDColorPoolHK'.static.DefaultShadow());
    }
    // End:0xB3E
    if((bTimeLimitOff == false) && (bPlayerWaiting == false) || bCurrentIsStateSpectate == false)
    {
        C.DrawColor = colorLeftTime;
        Class'Engine.BTCustomDrawHK'.static.DrawString(C, string(LeftTime) $ strWeaponChange[1], 4, 11.0000000, 384.0000000 * ratioX, 588.0000000 * ratioY, 640.0000000 * ratioX, 618.0000000 * ratioY, Class'XInterface_Decompressed.BTHUDColorPoolHK'.static.DefaultShadow());
    }
    //return;    
}
