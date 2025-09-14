/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\wHudPart_SelectQSlotCN.uc
 * Package Imports:
 *	XInterface
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:18
 *
 *******************************************************************************/
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
}

function BeginQuickSlotWindow()
{
    HudOwner.PlayerOwner.bCanChangeQS = true;
    HudOwner.PlayerOwner.bToggleQuickSlotWindow = false;
    LevelStartTime = Level.PlayTimeSeconds;
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
    LevelStartTime = 0.0;
    bTimeLimitOff = false;
    HudOwner.PlayerConsole.ViewportOwner.bShowWindowsMouse = false;
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
}

function CallSelectQuickSlot(int iIndex)
{
    // End:0x7c
    if(HudOwner.PlayerOwner != none)
    {
        // End:0x7c
        if(HudOwner.PlayerOwner.bCanChangeQS)
        {
            HudOwner.PlayerOwner.SelectQuickSlot(iIndex);
            HudOwner.PlayerOwner.bToggleQuickSlotWindow = false;
            PlayHUDSound(HudOwner.PlayerOwner, 1);
        }
    }
}

function CallEvent(optional bool ItemCheck, optional int iReservation1, optional int iReservation2)
{
    switch(iReservation1)
    {
        // End:0x18
        case 888:
            UpdateHelpKeyControll();
            // End:0x1e
            break;
        // End:0xffff
        default:
            // End:0x1e Break;
            break;
    }
}

function UpdateHelpKeyControll()
{
    // End:0x47
    if(HudOwner.PlayerOwner.Player == none && HudOwner.PlayerOwner.Player.GUIController == none)
    {
        return;
    }
    GUIController(HudOwner.PlayerOwner.Player.GUIController).GetAssignedKeys("CallToggleQuickSlot", keys, LocalizedKeys);
    GetKeyTexture(keys[0], HelpKeyButtonQSlot, WidthButtonQSlot);
}

function DrawA(Canvas C)
{
    // End:0x44
    if(Level.GetMatchMaker().BotTutorial || Level.GetMatchMaker().GMLevelFlag & 3 > 0)
    {
        return;
    }
    DrawSelectQSlot(C);
}

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
    // End:0x164
    if(bCurrentIsStateRoundEnded == false && bCurrentIsStateDead == true && bPrevIsStateDead == false)
    {
        bTimeLimitOff = true;
        bStartChangeQS = false;
    }
    // End:0x1b0
    else
    {
        // End:0x1b0
        if(bCurrentIsStateRoundEnded == false && bCurrentIsStateDead == false && bPrevIsStateDead == true)
        {
            // End:0x1a0
            if(bCurrentIsStateSpectate)
            {
                bTimeLimitOff = true;
            }
            // End:0x1a8
            else
            {
                bTimeLimitOff = false;
            }
            bStartChangeQS = false;
        }
    }
    bPrevIsStateDead = bCurrentIsStateDead;
    // End:0x2b0
    if(PrevSelectedQSlotIndex != HudOwner.PlayerOwner.iSelectedQSlotIndex)
    {
        switch(HudOwner.PlayerOwner.iSelectedQSlotIndex)
        {
            // End:0x212
            case 0:
                iCode_Message = class'wMessage_Game_ImpSystem'.default.Code_ChangeQS_1;
                // End:0x276
                break;
            // End:0x22d
            case 1:
                iCode_Message = class'wMessage_Game_ImpSystem'.default.Code_ChangeQS_2;
                // End:0x276
                break;
            // End:0x249
            case 2:
                iCode_Message = class'wMessage_Game_ImpSystem'.default.Code_ChangeQS_3;
                // End:0x276
                break;
            // End:0x265
            case 3:
                iCode_Message = class'wMessage_Game_ImpSystem'.default.Code_ChangeQS_4;
                // End:0x276
                break;
            // End:0xffff
            default:
                iCode_Message = -1;
                // End:0x276 Break;
                break;
        }
        // End:0x2a7
        if(-1 != iCode_Message)
        {
            HudOwner.PlayerOwner.ReceiveLocalizedMessage(class'wMessage_Game_ImpSystem', iCode_Message);
        }
        // End:0x2b0
        if(bCurrentIsStatePlayerWalking)
        {
        }
    }
    PrevSelectedQSlotIndex = HudOwner.PlayerOwner.iSelectedQSlotIndex;
    // End:0x2f7
    if(bCurrentIsStateRoundEnded == false && bPrevIsStateRoundEnded == true)
    {
        bTimeLimitOff = false;
        bStartChangeQS = false;
    }
    bPrevIsStateRoundEnded = bCurrentIsStateRoundEnded;
    // End:0x31e
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
    // End:0x358
    else
    {
        // End:0x358
        if(bCurrentIsStateRoundEnded)
        {
            EndQuickSlotWindow();
        }
    }
    // End:0x37e
    if(HudOwner.PlayerOwner.bCanChangeQS == false)
    {
        EndQuickSlotWindow();
        return;
    }
    CalcQuickSlotTimer(respawnLeftTime, startupLeftTime);
    LeftTime = Max(respawnLeftTime, startupLeftTime);
    // End:0x3c6
    if(HudOwner.PlayerOwner.bToggleQuickSlotWindow)
    {
        DrawQuickSlot(C);
    }
    // End:0x48e
    if(bTimeLimitOff == false && LeftTime <= 0)
    {
        // End:0x42b
        if(HudOwner.PawnOwner != none && wPawn(HudOwner.PawnOwner) != none)
        {
            wPawn(HudOwner.PawnOwner).ClientQSlotChangeCheck();
        }
        HudOwner.PlayerOwner.Player.Console.AddMessageItem(HudOwner.PlayerOwner.Player.Console.ConstructMessageItem(strCloseQSTime, 6));
        EndQuickSlotWindow();
        return;
    }
    // End:0x5aa
    if(HudOwner.PlayerOwner.Pawn != none)
    {
        // End:0x5aa
        if(VSize(HudOwner.PlayerOwner.Pawn.Location - HudOwner.PlayerOwner.Pawn.RespawnLocation) > float(1200))
        {
            // End:0x547
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
    // End:0x6b8
    if(HudOwner.PlayerOwner.bToggleQuickSlotWindow)
    {
        class'BTCustomDrawHK'.static.DrawImageScaleWithClipArea(C, class'BTHUDResourcePoolHK'.default.newButt_n, fbQSButtonOpen.X1 * ratioX, fbQSButtonOpen.Y1 * ratioY, fbQSButtonOpen.X2 * ratioX, fbQSButtonOpen.Y2 * ratioY, 0.0, 49.0, 339.0, 98.0);
    }
    // End:0x732
    else
    {
        class'BTCustomDrawHK'.static.DrawImageScaleWithClipArea(C, class'BTHUDResourcePoolHK'.default.newButt_n, fbQSButtonOpen.X1 * ratioX, fbQSButtonOpen.Y1 * ratioY, fbQSButtonOpen.X2 * ratioX, fbQSButtonOpen.Y2 * ratioY, 0.0, 0.0, 339.0, 49.0);
    }
    class'BTCustomDrawHK'.static.DrawImageScaleWithClipArea(C, class'BTHUDResourcePoolHK'.default.Key_Bg, 391.0 * ratioX, fbQSButtonOpen.Y1 + float(6) * ratioY, 412.0 * ratioX, fbQSButtonOpen.Y2 - float(6) * ratioY, 0.0, 0.0, 32.0, 32.0);
    boxTemp.X1 = float(HelpKeyButtonQSlot.TextureCoords.X1);
    boxTemp.Y1 = float(HelpKeyButtonQSlot.TextureCoords.Y1);
    boxTemp.X2 = float(HelpKeyButtonQSlot.TextureCoords.X2);
    boxTemp.Y2 = float(HelpKeyButtonQSlot.TextureCoords.Y2);
    // End:0x83a
    if(WidthButtonQSlot == float(52))
    {
        iWidthTemp = 426;
    }
    // End:0x845
    else
    {
        iWidthTemp = 410;
    }
    class'BTCustomDrawHK'.static.DrawImageScaleWithClipArea(C, class'BTHUDResourcePoolHK'.default.butt_Keyboard, 393.0 * ratioX, fbQSButtonOpen.Y1 + float(8) * ratioY, float(iWidthTemp) * ratioX, fbQSButtonOpen.Y2 - float(8) * ratioY, boxTemp.X1, boxTemp.Y1, boxTemp.X2, boxTemp.Y2);
    C.DrawColor = C.MakeColor(byte(255), 153, 0, byte(255));
    // End:0x994
    if(HudOwner.PlayerOwner.bToggleQuickSlotWindow)
    {
        class'BTCustomDrawHK'.static.DrawString(C, strToggleQS[0], 4, 12.0, fbQSButtonOpen.X1 * ratioX, fbQSButtonOpen.Y1 * ratioY, fbQSButtonOpen.X2 * ratioX, fbQSButtonOpen.Y2 * ratioY, class'BTHUDColorPoolHK'.static.DefaultShadow());
    }
    // End:0xa09
    else
    {
        class'BTCustomDrawHK'.static.DrawString(C, strToggleQS[1], 4, 12.0, fbQSButtonOpen.X1 * ratioX, fbQSButtonOpen.Y1 * ratioY, fbQSButtonOpen.X2 * ratioX, fbQSButtonOpen.Y2 * ratioY, class'BTHUDColorPoolHK'.static.DefaultShadow());
    }
    // End:0xaaf
    if(bTimeLimitOff == false && bPlayerWaiting == false || bCurrentIsStateSpectate == false)
    {
        C.DrawColor = colorLeftTime;
        class'BTCustomDrawHK'.static.DrawString(C, string(LeftTime) $ strWeaponChange[1], 4, 11.0, 384.0 * ratioX, 588.0 * ratioY, 640.0 * ratioX, 618.0 * ratioY, class'BTHUDColorPoolHK'.static.DefaultShadow());
    }
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
    class'BTCustomDrawHK'.static.DrawImage(C, class'BTHUDResourcePoolHK'.default.Slot_Bg, 0.1650 * C.ClipX, 0.399160 * C.ClipY, 0.2681250 * C.ClipX, 0.761660 * C.ClipY);
    DrawQuickSlotContent_Description(C, iPosX, iPosY);
    C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
    i = 0;
    J0x13e:
    // End:0x380 [While If]
    if(i < 4)
    {
        class'BTCustomDrawHK'.static.DrawImage(C, class'BTHUDResourcePoolHK'.default.Slot_Bg, 434.0 + float(i * 227) * ratioX, 416.0 * ratioY, 656.0 + float(i * 227) * ratioX, 923.0 * ratioY);
        j = 0;
        J0x1bd:
        // End:0x376 [While If]
        if(j < 9)
        {
            // End:0x29e
            if(j < 5)
            {
                class'BTCustomDrawHK'.static.DrawImageScaleWithClipArea(C, class'BTHUDResourcePoolHK'.default.MainWeapon_Bg, 440.0 + float(i * 227) * ratioX, 489.0 + float(j * 42) * ratioY, 650.0 + float(i * 227) * ratioX, 531.0 + float(j * 42) * ratioY, fWeaponUV[j].X1, fWeaponUV[j].Y1, fWeaponUV[j].X2, fWeaponUV[j].Y2);
            }
            // End:0x36c
            else
            {
                class'BTCustomDrawHK'.static.DrawImageScaleWithClipArea(C, class'BTHUDResourcePoolHK'.default.MainWeapon_Bg, 440.0 + float(i * 227) * ratioX, 727.0 + float(j - 5 * 42) * ratioY, 650.0 + float(i * 227) * ratioX, 769.0 + float(j - 5 * 42) * ratioY, fWeaponUV[j].X1, fWeaponUV[j].Y1, fWeaponUV[j].X2, fWeaponUV[j].Y2);
            }
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0x1bd;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x13e;
    }
    DrawQuickSlotName(C, int(fbQSContentName[0].X1), int(fbQSContentName[0].Y1), 0, false, true);
    DrawQuickSlotContent_DefaultWeapon(C, iPosX, iPosY);
    C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
    DrawSellectBar(C, iPosX, iPosY);
    i = 0;
    J0x409:
    // End:0x518 [While If]
    if(i < 3)
    {
        QuickSlotContent_SetString(C, int(float(iPosX) + fbQSContent[i].X1), int(float(iPosY) + fbQSContent[i].Y1), i, false);
        j = 0;
        J0x463:
        // End:0x496 [While If]
        if(j < 9)
        {
            // End:0x48c
            if(strQSItemName[j] != srtQSNothing)
            {
                bHasItem = true;
            }
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0x463;
        }
        DrawQuickSlotName(C, int(fbQSContentName[i + 1].X1), int(fbQSContentName[i + 1].Y1), i + 1, false, bHasItem);
        DrawQuickSlotContent_List(C, int(fbQSContent[i].X1), int(fbQSContent[i].Y1), i);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x409;
    }
    bLoadSlotItemResource = true;
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
    // End:0x2e2
    if(bDefaultWeapon)
    {
        // End:0x172
        if(HudOwner.PlayerOwner.iSelectedQSlotIndex > 0)
        {
            class'BTCustomDrawHK'.static.DrawImageScaleWithClipArea(C, class'BTHUDResourcePoolHK'.default.Weapon_Type_n, float(iPosX) * ratioX, float(iPosY) * ratioY, 214.0 + float(iPosX) * ratioX, 49.0 + float(iPosY) * ratioY, fbQSBack_SlotName[3].X1, fbQSBack_SlotName[3].Y1, fbQSBack_SlotName[3].X2, fbQSBack_SlotName[3].Y2);
            C.DrawColor = C.MakeColor(163, 163, 163, byte(255));
        }
        // End:0x238
        else
        {
            class'BTCustomDrawHK'.static.DrawImageScaleWithClipArea(C, class'BTHUDResourcePoolHK'.default.Weapon_Type_n, float(iPosX) * ratioX, float(iPosY) * ratioY, 214.0 + float(iPosX) * ratioX, 49.0 + float(iPosY) * ratioY, fbQSBack_SlotName[1].X1, fbQSBack_SlotName[1].Y1, fbQSBack_SlotName[1].X2, fbQSBack_SlotName[1].Y2);
            C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
        }
        OffsetX = 59;
        OffsetY = 4;
        class'BTCustomDrawHK'.static.DrawString(C, CapBaseWeaponSet, 5, float(iFontSize2), float(iPosX + OffsetX) * ratioX, float(iPosY + OffsetY) * ratioY, 238.0 + float(iPosX) + float(OffsetX) * ratioX, 32.0 + float(iPosY) + float(OffsetY) * ratioY, class'BTHUDColorPoolHK'.static.DefaultShadow());
    }
    // End:0x52f
    else
    {
        // End:0x3cc
        if(HudOwner.PlayerOwner.iSelectedQSlotIndex == iSlot)
        {
            class'BTCustomDrawHK'.static.DrawImageScaleWithClipArea(C, class'BTHUDResourcePoolHK'.default.Weapon_Type_n, float(iPosX) * ratioX, float(iPosY) * ratioY, 214.0 + float(iPosX) * ratioX, 49.0 + float(iPosY) * ratioY, fbQSBack_SlotName[1].X1, fbQSBack_SlotName[1].Y1, fbQSBack_SlotName[1].X2, fbQSBack_SlotName[1].Y2);
            C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
        }
        // End:0x48c
        else
        {
            class'BTCustomDrawHK'.static.DrawImageScaleWithClipArea(C, class'BTHUDResourcePoolHK'.default.Weapon_Type_n, float(iPosX) * ratioX, float(iPosY) * ratioY, 214.0 + float(iPosX) * ratioX, 49.0 + float(iPosY) * ratioY, fbQSBack_SlotName[0].X1, fbQSBack_SlotName[0].Y1, fbQSBack_SlotName[0].X2, fbQSBack_SlotName[0].Y2);
            C.DrawColor = C.MakeColor(163, 163, 163, byte(255));
        }
        OffsetX = 59;
        OffsetY = 4;
        class'BTCustomDrawHK'.static.DrawString(C, MyStatus.QuickSlotList[iSlot].strName, 5, float(iFontSize2), float(iPosX + 38) * ratioX, float(iPosY + 15) * ratioY, 202.0 + float(iPosX) * ratioX, 32.0 + float(iPosY) * ratioY, class'BTHUDColorPoolHK'.static.DefaultShadow());
    }
    // End:0x569
    if(bHasItem)
    {
        C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
    }
    // End:0x591
    else
    {
        C.DrawColor = C.MakeColor(127, 127, 127, byte(255));
    }
    OffsetX = 14 + 7;
    OffsetY = 5;
    OffsetX = 14 + 9;
    OffsetY = 7;
    // End:0x5db
    if(!bDefaultWeapon)
    {
        TempWidget = HelpKeyButtonNumber[1 + iSlot];
    }
    // End:0x5e9
    else
    {
        TempWidget = HelpKeyButtonAlphaBet[16];
    }
    boxTemp.X1 = float(TempWidget.TextureCoords.X1);
    boxTemp.Y1 = float(TempWidget.TextureCoords.Y1);
    boxTemp.X2 = float(TempWidget.TextureCoords.X2);
    boxTemp.Y2 = float(TempWidget.TextureCoords.Y2);
    class'BTCustomDrawHK'.static.DrawImageScaleWithClipArea(C, class'BTHUDResourcePoolHK'.default.butt_Keyboard, float(iPosX + 10) * ratioX, float(iPosY + 12) * ratioY, 26.0 + float(iPosX) + float(10) * ratioX, 26.0 + float(iPosY) + float(12) * ratioY, boxTemp.X1, boxTemp.Y1, boxTemp.X2, boxTemp.Y2);
}

function DrawSellectBar(Canvas C, int iPosX, int iPosY, optional bool bDefaultWeapon)
{
    local int iSlot;
    local float ratioX, ratioY, fAddTemp;

    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    ratioX = C.ClipX / float(1600);
    ratioY = C.ClipY / float(1200);
    iSlot = HudOwner.PlayerOwner.PlayerReplicationInfo.nQuickSlotIdx;
    fAddTemp = 0.0;
    class'BTCustomDrawHK'.static.DrawImage(C, class'BTHUDResourcePoolHK'.default.Weapon_Sel_Line, float(iPosX + 170) + float(iSlot * 227) * ratioX, float(iPosY - 63) * ratioY, float(iPosX + 392) + float(iSlot * 227) * ratioX, float(iPosY + 444) * ratioY);
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
    // End:0x161 [While If]
    if(i < 9)
    {
        OffsetY = ContentOffSetY[i];
        X1 = float(iPosX + 13) * _reX;
        X2 = float(iPosX + 162) * _reX;
        Y1 = float(OffsetY) * _reY;
        Y2 = float(OffsetY + 18) * _reY;
        strTemp = GetEllipsString(C, strQSContent[1 + i], X2 - X1, float(iFontSize));
        C.BtrDrawTextJustifiedWithVolumeLine(strTemp, 1, X1, Y1, X2, Y2, iFontSize, color_Shadow);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x78;
    }
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
    J0x9d:
    // End:0x255 [While If]
    if(i < 4)
    {
        iItemID = -1;
        // End:0x129
        if(kMM != none && HudOwner.PlayerOwner != none && HudOwner.PlayerOwner.PlayerReplicationInfo != none)
        {
            kUser = kMM.GetUserInfoByUserName(HudOwner.PlayerOwner.PlayerReplicationInfo.PlayerName);
        }
        // End:0x1b7
        if(kUser != none)
        {
            j = 0;
            J0x13b:
            // End:0x1b7 [While If]
            if(j < MyStatus.SkillList.Length)
            {
                iItemID = -1;
                // End:0x1ad
                if(iSkillSlot == MyStatus.SkillList[j].bySlotPosition)
                {
                    iItemID = MyStatus.SkillList[j].iSkillID;
                    ++ iSkillSlot;
                }
                // End:0x1b7
                else
                {
                    ++ j;
                    // This is an implied JumpToken; Continue!
                    goto J0x13b;
                }
            }
        }
        cItemParam = Level.GameMgr.GetItemParam(iItemID);
        // End:0x236
        if(0 < iItemID && cItemParam != none)
        {
            iLocation = InStr(cItemParam.strDisplayName, "]");
            strQSItemName[5 + i] = Mid(cItemParam.strDisplayName, iLocation + 1);
        }
        // End:0x24b
        else
        {
            strQSItemName[5 + i] = srtQSNothing;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x9d;
    }
    i = 0;
    J0x25c:
    // End:0x3b5 [While If]
    if(i < 5)
    {
        OffsetX = ContentOffSetX[i];
        OffsetY = 0;
        C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
        TextBox = fbQS_Content_Text_Default;
        iFontSize = 13.0 * _reY;
        X1 = float(iPosX + 179) * _reX;
        X2 = float(iPosX + 383) * _reX;
        Y1 = float(iPosY + 22) + float(44 * i) * _reY;
        Y2 = float(iPosY + 42) + float(44 * i) * _reY;
        strTemp = GetEllipsString(C, strQSItemName[i], X2 - X1, iFontSize);
        C.BtrDrawTextJustifiedWithVolumeLine(strTemp, 1, X1, Y1, X2, Y2, int(iFontSize), color_Shadow);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x25c;
    }
    i = 0;
    J0x3bc:
    // End:0x525 [While If]
    if(i < 4)
    {
        OffsetX = ContentOffSetX[i];
        OffsetY = 0;
        C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
        TextBox = fbQS_Content_Text_Default;
        iFontSize = 13.0 * _reY;
        X1 = float(iPosX + 179) * _reX;
        X2 = float(iPosX + 383) * _reX;
        Y1 = float(iPosY + 22) + float(44 * i) + float(235) * _reY;
        Y2 = float(iPosY + 42) + float(44 * i) + float(235) * _reY;
        strTemp = GetEllipsString(C, strQSItemName[i + 5], X2 - X1, iFontSize);
        C.BtrDrawTextJustifiedWithVolumeLine(strTemp, 1, X1, Y1, X2, Y2, int(iFontSize), color_Shadow);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x3bc;
    }
    bLoadDefaultItemResource = true;
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
    J0x4c:
    // End:0x181 [While If]
    if(i < 5)
    {
        C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
        TextBox = fbQS_Content_Text_Default;
        iFontSize = int(float(13) * _reY);
        X1 = float(iPosX) * _reX;
        X2 = float(iPosX + 204) * _reX;
        Y1 = float(iPosY + i * 44) * _reY;
        Y2 = float(iPosY + 20) + float(i * 44) * _reY;
        strTemp = GetEllipsString(C, strQSItemName[i], X2 - X1, float(iFontSize));
        C.BtrDrawTextJustifiedWithVolumeLine(strTemp, 1, X1, Y1, X2, Y2, iFontSize, color_Shadow);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x4c;
    }
    i = 0;
    J0x188:
    // End:0x2cb [While If]
    if(i < 4)
    {
        C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
        TextBox = fbQS_Content_Text_Default;
        iFontSize = int(float(13) * _reY);
        X1 = float(iPosX) * _reX;
        X2 = float(iPosX + 204) * _reX;
        Y1 = float(iPosY + i * 44 + 238) * _reY;
        Y2 = float(iPosY + 20) + float(i * 44) + float(238) * _reY;
        strTemp = GetEllipsString(C, strQSItemName[i + 5], X2 - X1, float(iFontSize));
        C.BtrDrawTextJustifiedWithVolumeLine(strTemp, 1, X1, Y1, X2, Y2, iFontSize, color_Shadow);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x188;
    }
    return bHasItem;
}

function QuickSlotContent_SetString(Canvas C, int iPosX, int iPosY, int iSlot, optional bool bDefaultWeapon)
{
    local int i, j, iItemID, iLocation, iSkillSlot;

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
    // End:0x38c [While If]
    if(i < 5)
    {
        iItemID = -1;
        // End:0x122
        if(bDefaultWeapon)
        {
            // End:0xe8
            if(i != 2)
            {
                // End:0xcb
                if(i > 2)
                {
                    iItemID = MyStatus.FindItemIDBySlotPos(i - 1);
                }
                // End:0xe5
                else
                {
                    iItemID = MyStatus.FindItemIDBySlotPos(i);
                }
            }
            // End:0x11f
            else
            {
                cItemParam = Level.GameMgr.GetItemParam(9001);
                iItemID = cItemParam.iItemID;
            }
        }
        // End:0x1c4
        else
        {
            // End:0x18d
            if(i != 2)
            {
                // End:0x165
                if(i > 2)
                {
                    iItemID = MyStatus.QuickSlotList[iSlot].iItemID[i - 1];
                }
                // End:0x18a
                else
                {
                    iItemID = MyStatus.QuickSlotList[iSlot].iItemID[i];
                }
            }
            // End:0x1c4
            else
            {
                cItemParam = Level.GameMgr.GetItemParam(9001);
                iItemID = cItemParam.iItemID;
            }
        }
        cItemParam = Level.GameMgr.GetItemParam(iItemID);
        // End:0x33c
        if(kMM.eWeaponLimit != kMM.0)
        {
            // End:0x270
            if(kMM.eWeaponLimit == kMM.4)
            {
                // End:0x26d
                if(0 == i)
                {
                    cItemParam = Level.GameMgr.GetItemParam(5012);
                    iItemID = cItemParam.iItemID;
                }
            }
            // End:0x33c
            else
            {
                // End:0x2d8
                if(kMM.eWeaponLimit == kMM.1)
                {
                    // End:0x2d5
                    if(2 == i)
                    {
                        cItemParam = Level.GameMgr.GetItemParam(9001);
                        iItemID = cItemParam.iItemID;
                    }
                }
                // End:0x33c
                else
                {
                    // End:0x33c
                    if(kMM.eWeaponLimit == kMM.10)
                    {
                        // End:0x33c
                        if(0 == i)
                        {
                            cItemParam = Level.GameMgr.GetItemParam(5016);
                            iItemID = cItemParam.iItemID;
                        }
                    }
                }
            }
        }
        // End:0x371
        if(0 < iItemID && cItemParam != none)
        {
            strQSItemName[i] = cItemParam.strDisplayName;
        }
        // End:0x382
        else
        {
            strQSItemName[i] = srtQSNothing;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x73;
    }
    i = 0;
    J0x393:
    // End:0x577 [While If]
    if(i < 4)
    {
        iItemID = -1;
        // End:0x3dd
        if(!bDefaultWeapon)
        {
            iItemID = MyStatus.QuickSlotList[iSlot].iSkillID[i];
        }
        // End:0x4d9
        else
        {
            // End:0x452
            if(kMM != none && HudOwner.PlayerOwner != none && HudOwner.PlayerOwner.PlayerReplicationInfo != none)
            {
                kUser = kMM.GetUserInfoByUserName(HudOwner.PlayerOwner.PlayerReplicationInfo.PlayerName);
            }
            // End:0x4d9
            if(kUser != none)
            {
                j = 0;
                J0x464:
                // End:0x4d9 [While If]
                if(j < MyStatus.SkillList.Length)
                {
                    iItemID = -1;
                    // End:0x4cf
                    if(iSkillSlot == MyStatus.SkillList[j].bySlotPosition)
                    {
                        iItemID = MyStatus.SkillList[j].iSkillID;
                    }
                    // End:0x4d9
                    else
                    {
                        ++ j;
                        // This is an implied JumpToken; Continue!
                        goto J0x464;
                    }
                }
            }
        }
        cItemParam = Level.GameMgr.GetItemParam(iItemID);
        // End:0x558
        if(0 < iItemID && cItemParam != none)
        {
            iLocation = InStr(cItemParam.strDisplayName, "]");
            strQSItemName[5 + i] = Mid(cItemParam.strDisplayName, iLocation + 1);
        }
        // End:0x56d
        else
        {
            strQSItemName[5 + i] = srtQSNothing;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x393;
    }
    // End:0x5d0
    if(kMM.eWeaponLimit == kMM.1)
    {
        i = 0;
        J0x5a0:
        // End:0x5d0 [While If]
        if(i < 5)
        {
            // End:0x5c6
            if(i != 2)
            {
                strQSItemName[i] = "";
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x5a0;
        }
    }
}

function Image GetItemImage(Canvas C, int iItemID)
{
    local string szIcon;
    local wWeaponManager wMani;
    local class<wWeaponRes_Base> wRes;
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
    // End:0x1a3
    if(17 == WBP.eType)
    {
        szIcon = wRes.default.szIcon_HUD;
        BTImage.X = 0.0;
        BTImage.Y = 0.0;
        BTImage.width = 256.0;
        BTImage.Height = 64.0;
    }
    BTImage.Image = Material(DynamicLoadObject(szIcon, class'Material'));
    HudOwner.clog("name=" $ WBP.strName $ "x=" $ string(BTImage.X) $ " y=" $ string(BTImage.Y));
    return BTImage;
}

function DrawItemImage(Canvas C);

defaultproperties
{
    fbQSContentName[0]=(X1=438.0,Y1=420.0,X2=0.0,Y2=0.0)
    fbQSContentName[1]=(X1=665.0,Y1=420.0,X2=0.0,Y2=0.0)
    fbQSContentName[2]=(X1=892.0,Y1=420.0,X2=0.0,Y2=0.0)
    fbQSContentName[3]=(X1=1119.0,Y1=420.0,X2=0.0,Y2=0.0)
    fbQSContentName[4]=(X1=0.0,Y1=420.0,X2=0.0,Y2=0.0)
    fbQSContent[0]=(X1=670.0,Y1=501.0,X2=874.0,Y2=521.0)
    fbQSContent[1]=(X1=897.0,Y1=501.0,X2=1101.0,Y2=521.0)
    fbQSContent[2]=(X1=1124.0,Y1=501.0,X2=1328.0,Y2=521.0)
    ContentOffSetY[0]=503
    ContentOffSetY[1]=547
    ContentOffSetY[2]=591
    ContentOffSetY[3]=635
    ContentOffSetY[4]=679
    ContentOffSetY[5]=739
    ContentOffSetY[6]=783
    ContentOffSetY[7]=827
    ContentOffSetY[8]=871
    fbQSBack_SlotName[0]=(X1=0.0,Y1=0.0,X2=214.0,Y2=49.0)
    fbQSBack_SlotName[1]=(X1=0.0,Y1=49.0,X2=214.0,Y2=98.0)
    fWeaponUV[0]=(X1=0.0,Y1=0.0,X2=210.0,Y2=42.0)
    fWeaponUV[1]=(X1=0.0,Y1=42.0,X2=210.0,Y2=84.0)
    fWeaponUV[2]=(X1=0.0,Y1=84.0,X2=210.0,Y2=126.0)
    fWeaponUV[3]=(X1=0.0,Y1=126.0,X2=210.0,Y2=168.0)
    fWeaponUV[4]=(X1=0.0,Y1=126.0,X2=210.0,Y2=168.0)
    fWeaponUV[5]=(X1=0.0,Y1=168.0,X2=210.0,Y2=210.0)
    fWeaponUV[6]=(X1=0.0,Y1=210.0,X2=210.0,Y2=252.0)
    fWeaponUV[7]=(X1=0.0,Y1=210.0,X2=210.0,Y2=252.0)
    fWeaponUV[8]=(X1=0.0,Y1=210.0,X2=210.0,Y2=252.0)
}