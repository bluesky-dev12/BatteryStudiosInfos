/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\wHudPart_SelectQSlot_DOAMode.uc
 * Package Imports:
 *	XInterface
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
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
    // End:0x2a
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
    // End:0x10f
    if(!HudOwner.PlayerOwner.CheckChangeHostShowQS())
    {
        return;
    }
    bPrevIsStatePlayerWalking = bCurrentIsStatePlayerWalking;
    bPrevIsStateWaitingForStart = bCurrentIsStateWaitingForStart;
    // End:0x187
    if(bCurrentIsStateRoundEnded == false && bCurrentIsStateDead == true && bPrevIsStateDead == false)
    {
        bTimeLimitOff = true;
        bStartChangeQS = false;
        HudOwner.PlayerOwner.PlayerReplicationInfo.bPickupWeaponDOA = false;
    }
    // End:0x1f6
    else
    {
        // End:0x1f6
        if(bCurrentIsStateRoundEnded == false && bCurrentIsStateDead == false && bPrevIsStateDead == true)
        {
            // End:0x1e6
            if(bCurrentIsStateSpectate)
            {
                bTimeLimitOff = true;
                HudOwner.PlayerOwner.PlayerReplicationInfo.bPickupWeaponDOA = false;
            }
            // End:0x1ee
            else
            {
                bTimeLimitOff = false;
            }
            bStartChangeQS = false;
        }
    }
    bPrevIsStateDead = bCurrentIsStateDead;
    // End:0x2f6
    if(PrevSelectedQSlotIndex != HudOwner.PlayerOwner.iSelectedQSlotIndex)
    {
        switch(HudOwner.PlayerOwner.iSelectedQSlotIndex)
        {
            // End:0x258
            case 0:
                iCode_Message = class'wMessage_Game_ImpSystem'.default.Code_ChangeQS_1;
                // End:0x2bc
                break;
            // End:0x273
            case 1:
                iCode_Message = class'wMessage_Game_ImpSystem'.default.Code_ChangeQS_2;
                // End:0x2bc
                break;
            // End:0x28f
            case 2:
                iCode_Message = class'wMessage_Game_ImpSystem'.default.Code_ChangeQS_3;
                // End:0x2bc
                break;
            // End:0x2ab
            case 3:
                iCode_Message = class'wMessage_Game_ImpSystem'.default.Code_ChangeQS_4;
                // End:0x2bc
                break;
            // End:0xffff
            default:
                iCode_Message = -1;
                // End:0x2bc Break;
                break;
        }
        // End:0x2ed
        if(-1 != iCode_Message)
        {
            HudOwner.PlayerOwner.ReceiveLocalizedMessage(class'wMessage_Game_ImpSystem', iCode_Message);
        }
        // End:0x2f6
        if(bCurrentIsStatePlayerWalking)
        {
        }
    }
    PrevSelectedQSlotIndex = HudOwner.PlayerOwner.iSelectedQSlotIndex;
    // End:0x360
    if(bCurrentIsStateRoundEnded == false && bPrevIsStateRoundEnded == true)
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
    // End:0x3b2
    if(bPlayerWaiting || bCurrentIsStateSpectate)
    {
        LevelStartTime = Level.PlayTimeSeconds;
    }
    // End:0x3e7
    else
    {
        // End:0x3e7
        if(bCurrentIsStateRoundEnded || HudOwner.PlayerOwner.PlayerReplicationInfo.bPickupWeaponDOA)
        {
            EndQuickSlotWindow();
        }
    }
    // End:0x40d
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
    // End:0x51d
    if(bTimeLimitOff == false && LeftTime <= 0)
    {
        // End:0x4ba
        if(HudOwner.PawnOwner != none && wPawn(HudOwner.PawnOwner) != none)
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
            // End:0x5d6
            if(HudOwner.PawnOwner != none && wPawn(HudOwner.PawnOwner) != none)
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
        class'BTCustomDrawHK'.static.DrawImageScaleWithClipArea(C, class'BTHUDResourcePoolHK'.default.newButt_n, fbQSButtonOpen.X1 * ratioX, fbQSButtonOpen.Y1 * ratioY, fbQSButtonOpen.X2 * ratioX, fbQSButtonOpen.Y2 * ratioY, 0.0, 49.0, 339.0, 98.0);
    }
    // End:0x7c1
    else
    {
        class'BTCustomDrawHK'.static.DrawImageScaleWithClipArea(C, class'BTHUDResourcePoolHK'.default.newButt_n, fbQSButtonOpen.X1 * ratioX, fbQSButtonOpen.Y1 * ratioY, fbQSButtonOpen.X2 * ratioX, fbQSButtonOpen.Y2 * ratioY, 0.0, 0.0, 339.0, 49.0);
    }
    class'BTCustomDrawHK'.static.DrawImageScaleWithClipArea(C, class'BTHUDResourcePoolHK'.default.Key_Bg, 391.0 * ratioX, fbQSButtonOpen.Y1 + float(6) * ratioY, 412.0 * ratioX, fbQSButtonOpen.Y2 - float(6) * ratioY, 0.0, 0.0, 32.0, 32.0);
    boxTemp.X1 = float(HelpKeyButtonQSlot.TextureCoords.X1);
    boxTemp.Y1 = float(HelpKeyButtonQSlot.TextureCoords.Y1);
    boxTemp.X2 = float(HelpKeyButtonQSlot.TextureCoords.X2);
    boxTemp.Y2 = float(HelpKeyButtonQSlot.TextureCoords.Y2);
    // End:0x8c9
    if(WidthButtonQSlot == float(52))
    {
        iWidthTemp = 426;
    }
    // End:0x8d4
    else
    {
        iWidthTemp = 410;
    }
    class'BTCustomDrawHK'.static.DrawImageScaleWithClipArea(C, class'BTHUDResourcePoolHK'.default.butt_Keyboard, 393.0 * ratioX, fbQSButtonOpen.Y1 + float(8) * ratioY, float(iWidthTemp) * ratioX, fbQSButtonOpen.Y2 - float(8) * ratioY, boxTemp.X1, boxTemp.Y1, boxTemp.X2, boxTemp.Y2);
    C.DrawColor = C.MakeColor(byte(255), 153, 0, byte(255));
    // End:0xa23
    if(HudOwner.PlayerOwner.bToggleQuickSlotWindow)
    {
        class'BTCustomDrawHK'.static.DrawString(C, strToggleQS[0], 4, 12.0, fbQSButtonOpen.X1 * ratioX, fbQSButtonOpen.Y1 * ratioY, fbQSButtonOpen.X2 * ratioX, fbQSButtonOpen.Y2 * ratioY, class'BTHUDColorPoolHK'.static.DefaultShadow());
    }
    // End:0xa98
    else
    {
        class'BTCustomDrawHK'.static.DrawString(C, strToggleQS[1], 4, 12.0, fbQSButtonOpen.X1 * ratioX, fbQSButtonOpen.Y1 * ratioY, fbQSButtonOpen.X2 * ratioX, fbQSButtonOpen.Y2 * ratioY, class'BTHUDColorPoolHK'.static.DefaultShadow());
    }
    // End:0xb3e
    if(bTimeLimitOff == false && bPlayerWaiting == false || bCurrentIsStateSpectate == false)
    {
        C.DrawColor = colorLeftTime;
        class'BTCustomDrawHK'.static.DrawString(C, string(LeftTime) $ strWeaponChange[1], 4, 11.0, 384.0 * ratioX, 588.0 * ratioY, 640.0 * ratioX, 618.0 * ratioY, class'BTHUDColorPoolHK'.static.DefaultShadow());
    }
}
