/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\wHudPart_SelectQSlot.uc
 * Package Imports:
 *	XInterface
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:59
 *	Functions:19
 *
 *******************************************************************************/
class wHudPart_SelectQSlot extends wHudPart_DisplayBase
    transient;

var localized string strChangeQS[6];
var localized string strChangeQSInPlayerWalking;
var localized string strCloseQSTime;
var localized string strCloseQSDistance;
var localized string strQSContent[11];
var localized string CapBaseWeaponSet;
var localized string srtQSNothing;
var int QuickSlotWindowShowTime;
var int QuickSlotWindowStartTime;
var localized string strWeaponChange[2];
var localized string strQSButtonZ;
var localized string strToggleQS[2];
var localized string strUsing;
var Color colorLeftTime;
var Color colorQS;
var Color colorQSSelect;
var Color colorQSContent;
var FloatBox fbQSBack;
var FloatBox fbQSButton[5];
var FloatBox fbQSButtonZ;
var FloatBox fbQSButtonOpen;
var FloatBox fbQSContentName[5];
var FloatBox fbQSContent[5];
var FloatBox fbQSBack_Content;
var FloatBox fbQS_Content_Text;
var FloatBox fbQS_Content_Text_Default;
var FloatBox fbQSBack_ItemContent[5];
var FloatBox fbQSBack_ItemImage;
var LevelInfo Level;
var float LevelStartTime;
var bool bStartChangeQS;
var bool bPrevIsStatePlayerWalking;
var bool bCurrentIsStatePlayerWalking;
var bool bPrevIsStateDead;
var bool bCurrentIsStateDead;
var bool bPrevIsStateRoundEnded;
var bool bCurrentIsStateRoundEnded;
var bool bCurrentIsStateSpectate;
var bool bPrevIsStateWaitingForStart;
var bool bCurrentIsStateWaitingForStart;
var bool bTimeLimitOff;
var int PrevSelectedQSlotIndex;
var int ContentOffSetX[6];
var int ContentOffSetY[9];
var string strQS[7];
var int iFontSize0;
var int iFontSize1;
var int iFontSize2;
var int iFontSize3;
var() SpriteWidget HelpKeyButtonQSlot;
var float WidthButtonQSlot;
var bool bUpdate;
var FloatBox fbQSBack_SlotName[4];
var array<sQuickSlot> QuickSlotList;
var bool bLoadDefaultItemResource;
var bool bLoadSlotItemResource;
var Image mDefaultItemImage[4];
var Image mQuickSlotItemImage[20];
var FloatBox fWeaponUV[9];

function Initialize(HudBase myOwner, LevelInfo _level)
{
    super.Initialize(myOwner, _level);
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
    // End:0x2e8
    if(PrevSelectedQSlotIndex != HudOwner.PlayerOwner.iSelectedQSlotIndex)
    {
        switch(HudOwner.PlayerOwner.iSelectedQSlotIndex)
        {
            // End:0x212
            case 0:
                iCode_Message = class'wMessage_Game_ImpSystem'.default.Code_ChangeQS_0;
                // End:0x2ae
                break;
            // End:0x22d
            case 1:
                iCode_Message = class'wMessage_Game_ImpSystem'.default.Code_ChangeQS_1;
                // End:0x2ae
                break;
            // End:0x249
            case 2:
                iCode_Message = class'wMessage_Game_ImpSystem'.default.Code_ChangeQS_2;
                // End:0x2ae
                break;
            // End:0x265
            case 3:
                iCode_Message = class'wMessage_Game_ImpSystem'.default.Code_ChangeQS_3;
                // End:0x2ae
                break;
            // End:0x281
            case 4:
                iCode_Message = class'wMessage_Game_ImpSystem'.default.Code_ChangeQS_4;
                // End:0x2ae
                break;
            // End:0x29d
            case 5:
                iCode_Message = class'wMessage_Game_ImpSystem'.default.Code_ChangeQS_5;
                // End:0x2ae
                break;
            // End:0xffff
            default:
                iCode_Message = -1;
                // End:0x2ae Break;
                break;
        }
        // End:0x2df
        if(-1 != iCode_Message)
        {
            HudOwner.PlayerOwner.ReceiveLocalizedMessage(class'wMessage_Game_ImpSystem', iCode_Message);
        }
        // End:0x2e8
        if(bCurrentIsStatePlayerWalking)
        {
        }
    }
    PrevSelectedQSlotIndex = HudOwner.PlayerOwner.iSelectedQSlotIndex;
    // End:0x32f
    if(bCurrentIsStateRoundEnded == false && bPrevIsStateRoundEnded == true)
    {
        bTimeLimitOff = false;
        bStartChangeQS = false;
    }
    bPrevIsStateRoundEnded = bCurrentIsStateRoundEnded;
    // End:0x356
    if(bStartChangeQS == false)
    {
        BeginQuickSlotWindow();
        bStartChangeQS = true;
    }
    // End:0x381
    if(bPlayerWaiting || bCurrentIsStateSpectate)
    {
        LevelStartTime = Level.PlayTimeSeconds;
    }
    // End:0x390
    else
    {
        // End:0x390
        if(bCurrentIsStateRoundEnded)
        {
            EndQuickSlotWindow();
        }
    }
    // End:0x3b6
    if(HudOwner.PlayerOwner.bCanChangeQS == false)
    {
        EndQuickSlotWindow();
        return;
    }
    respawnLeftTime = int(float(QuickSlotWindowShowTime) - Level.PlayTimeSeconds - float(QuickSlotWindowStartTime));
    startupLeftTime = int(float(QuickSlotWindowShowTime) - Level.PlayTimeSeconds - LevelStartTime);
    LeftTime = Max(respawnLeftTime, startupLeftTime);
    // End:0x43c
    if(HudOwner.PlayerOwner.bToggleQuickSlotWindow)
    {
        DrawQuickSlot(C);
    }
    // End:0x504
    if(bTimeLimitOff == false && LeftTime <= 0)
    {
        // End:0x4a1
        if(HudOwner.PawnOwner != none && wPawn(HudOwner.PawnOwner) != none)
        {
            wPawn(HudOwner.PawnOwner).ClientQSlotChangeCheck();
        }
        HudOwner.PlayerOwner.Player.Console.AddMessageItem(HudOwner.PlayerOwner.Player.Console.ConstructMessageItem(strCloseQSTime, 6));
        EndQuickSlotWindow();
        return;
    }
    // End:0x620
    if(HudOwner.PlayerOwner.Pawn != none)
    {
        // End:0x620
        if(VSize(HudOwner.PlayerOwner.Pawn.Location - HudOwner.PlayerOwner.Pawn.RespawnLocation) > float(1200))
        {
            // End:0x5bd
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
    class'BTCustomDrawHK'.static.DrawImageScaleWithClipArea(C, class'BTHUDResourcePoolHK'.default.butt_n, fbQSButtonOpen.X1 * ratioX, fbQSButtonOpen.Y1 * ratioY, fbQSButtonOpen.X2 * ratioX, fbQSButtonOpen.Y2 * ratioY, 0.0, 0.0, 336.0, 40.0);
    class'BTCustomDrawHK'.static.DrawImageScaleWithClipArea(C, class'BTHUDResourcePoolHK'.default.Key_Bg, 391.0 * ratioX, fbQSButtonOpen.Y1 + float(6) * ratioY, 412.0 * ratioX, fbQSButtonOpen.Y2 - float(6) * ratioY, 0.0, 0.0, 32.0, 32.0);
    boxTemp.X1 = float(HelpKeyButtonQSlot.TextureCoords.X1);
    boxTemp.Y1 = float(HelpKeyButtonQSlot.TextureCoords.Y1);
    boxTemp.X2 = float(HelpKeyButtonQSlot.TextureCoords.X2);
    boxTemp.Y2 = float(HelpKeyButtonQSlot.TextureCoords.Y2);
    // End:0x818
    if(WidthButtonQSlot == float(52))
    {
        iWidthTemp = 426;
    }
    // End:0x823
    else
    {
        iWidthTemp = 410;
    }
    class'BTCustomDrawHK'.static.DrawImageScaleWithClipArea(C, class'BTHUDResourcePoolHK'.default.butt_Keyboard, 393.0 * ratioX, fbQSButtonOpen.Y1 + float(8) * ratioY, float(iWidthTemp) * ratioX, fbQSButtonOpen.Y2 - float(8) * ratioY, boxTemp.X1, boxTemp.Y1, boxTemp.X2, boxTemp.Y2);
    C.DrawColor = C.MakeColor(byte(255), 153, 0, byte(255));
    // End:0x972
    if(HudOwner.PlayerOwner.bToggleQuickSlotWindow)
    {
        class'BTCustomDrawHK'.static.DrawString(C, strToggleQS[0], 4, 12.0, fbQSButtonOpen.X1 * ratioX, fbQSButtonOpen.Y1 * ratioY, fbQSButtonOpen.X2 * ratioX, fbQSButtonOpen.Y2 * ratioY, class'BTHUDColorPoolHK'.static.DefaultShadow());
    }
    // End:0x9e7
    else
    {
        class'BTCustomDrawHK'.static.DrawString(C, strToggleQS[1], 4, 12.0, fbQSButtonOpen.X1 * ratioX, fbQSButtonOpen.Y1 * ratioY, fbQSButtonOpen.X2 * ratioX, fbQSButtonOpen.Y2 * ratioY, class'BTHUDColorPoolHK'.static.DefaultShadow());
    }
    // End:0xa8d
    if(bTimeLimitOff == false && bPlayerWaiting == false || bCurrentIsStateSpectate == false)
    {
        C.DrawColor = colorLeftTime;
        class'BTCustomDrawHK'.static.DrawString(C, string(LeftTime) $ strWeaponChange[1], 4, 11.0, 560.0 * ratioX, 622.0 * ratioY, 618.0 * ratioX, 652.0 * ratioY, class'BTHUDColorPoolHK'.static.DefaultShadow());
    }
}

function DrawQuickSlot(Canvas C)
{
    local int i, j, iPosX, iPosY, OffsetX, OffsetY;

    local float ratioX, ratioY;
    local bool bHasItem;

    ratioX = C.ClipX / float(1600);
    ratioY = C.ClipY / float(1200);
    iPosX = 218;
    iPosY = 515;
    C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
    class'BTCustomDrawHK'.static.DrawImage(C, class'BTHUDResourcePoolHK'.default.hud_back_1, fbQSBack_Content.X1 + float(iPosX) + float(OffsetX) * ratioX, fbQSBack_Content.Y1 + float(iPosY) + float(OffsetY) * ratioY, fbQSBack_Content.X2 + float(iPosX) + float(OffsetX) * ratioX, fbQSBack_Content.Y2 + float(iPosY) + float(OffsetY) * ratioY);
    DrawQuickSlotContent_Description(C, iPosX, iPosY);
    C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
    class'BTCustomDrawHK'.static.DrawImage(C, class'BTHUDResourcePoolHK'.default.hud_back_2, 0.0 + float(iPosX) + float(OffsetX) * ratioX, 45.0 + float(iPosY) + float(OffsetY) * ratioY, 887.0 + float(iPosX) + float(OffsetX) * ratioX, 113.0 + float(iPosY) + float(OffsetY) * ratioY);
    class'BTCustomDrawHK'.static.DrawImage(C, class'BTHUDResourcePoolHK'.default.hud_back_2, 892.0 + float(iPosX) + float(OffsetX) * ratioX, 45.0 + float(iPosY) + float(OffsetY) * ratioY, 1164.0 + float(iPosX) + float(OffsetX) * ratioX, 113.0 + float(iPosY) + float(OffsetY) * ratioY);
    DrawQuickSlotName(C, iPosX, iPosY + 59, -1, true, true);
    DrawQuickSlotContent_DefaultWeapon(C, iPosX, iPosY + 52);
    C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
    class'BTCustomDrawHK'.static.DrawImage(C, class'BTHUDResourcePoolHK'.default.hud_back_2, 0.0 + float(iPosX) + float(OffsetX) * ratioX, 118.0 + float(iPosY) + float(OffsetY) * ratioY, 887.0 + float(iPosX) + float(OffsetX) * ratioX, 450.0 + float(iPosY) + float(OffsetY) * ratioY);
    class'BTCustomDrawHK'.static.DrawImage(C, class'BTHUDResourcePoolHK'.default.hud_back_2, 892.0 + float(iPosX) + float(OffsetX) * ratioX, 118.0 + float(iPosY) + float(OffsetY) * ratioY, 1164.0 + float(iPosX) + float(OffsetX) * ratioX, 450.0 + float(iPosY) + float(OffsetY) * ratioY);
    DrawSellectBar(C, iPosX, iPosY);
    i = 0;
    J0x457:
    // End:0x56e [While If]
    if(i < 5)
    {
        QuickSlotContent_SetString(C, int(float(iPosX) + fbQSContent[i].X1), int(float(iPosY) + fbQSContent[i].Y1), i, false);
        j = 0;
        J0x4b1:
        // End:0x4e7 [While If]
        if(j < 6)
        {
            // End:0x4dd
            if(strQS[1 + j] != srtQSNothing)
            {
                bHasItem = true;
            }
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0x4b1;
        }
        DrawQuickSlotName(C, iPosX, int(float(iPosY) + fbQSContentName[i].Y1), i, false, bHasItem);
        DrawQuickSlotContent_List(C, int(float(iPosX) + fbQSContent[i].X1), int(float(iPosY) + fbQSContent[i].Y1), i);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x457;
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
    // End:0x322
    if(bDefaultWeapon)
    {
        // End:0x192
        if(HudOwner.PlayerOwner.iSelectedQSlotIndex > 0)
        {
            class'BTCustomDrawHK'.static.DrawImageScaleWithClipArea(C, class'BTHUDResourcePoolHK'.default.butt_n, float(iPosX + OffsetX) * ratioX, float(iPosY + OffsetY) * ratioY, 336.0 + float(iPosX) + float(OffsetX) * ratioX, 40.0 + float(iPosY) + float(OffsetY) * ratioY, fbQSBack_SlotName[3].X1, fbQSBack_SlotName[3].Y1, fbQSBack_SlotName[3].X2, fbQSBack_SlotName[3].Y2);
            C.DrawColor = C.MakeColor(163, 163, 163, byte(255));
        }
        // End:0x278
        else
        {
            class'BTCustomDrawHK'.static.DrawImageScaleWithClipArea(C, class'BTHUDResourcePoolHK'.default.butt_n, float(iPosX + OffsetX) * ratioX, float(iPosY + OffsetY) * ratioY, 336.0 + float(iPosX) + float(OffsetX) * ratioX, 40.0 + float(iPosY) + float(OffsetY) * ratioY, fbQSBack_SlotName[1].X1, fbQSBack_SlotName[1].Y1, fbQSBack_SlotName[1].X2, fbQSBack_SlotName[1].Y2);
            C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
        }
        OffsetX = 59;
        OffsetY = 4;
        class'BTCustomDrawHK'.static.DrawString(C, CapBaseWeaponSet, 5, float(iFontSize2), float(iPosX + OffsetX) * ratioX, float(iPosY + OffsetY) * ratioY, 238.0 + float(iPosX) + float(OffsetX) * ratioX, 32.0 + float(iPosY) + float(OffsetY) * ratioY, class'BTHUDColorPoolHK'.static.DefaultShadow());
    }
    // End:0x5ca
    else
    {
        // End:0x42f
        if(HudOwner.PlayerOwner.iSelectedQSlotIndex == iSlot + 1)
        {
            class'BTCustomDrawHK'.static.DrawImageScaleWithClipArea(C, class'BTHUDResourcePoolHK'.default.butt_n, float(iPosX + OffsetX) * ratioX, float(iPosY + OffsetY) * ratioY, 336.0 + float(iPosX) + float(OffsetX) * ratioX, 40.0 + float(iPosY) + float(OffsetY) * ratioY, fbQSBack_SlotName[1].X1, fbQSBack_SlotName[1].Y1, fbQSBack_SlotName[1].X2, fbQSBack_SlotName[1].Y2);
            C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
        }
        // End:0x50f
        else
        {
            class'BTCustomDrawHK'.static.DrawImageScaleWithClipArea(C, class'BTHUDResourcePoolHK'.default.butt_n, float(iPosX + OffsetX) * ratioX, float(iPosY + OffsetY) * ratioY, 336.0 + float(iPosX) + float(OffsetX) * ratioX, 40.0 + float(iPosY) + float(OffsetY) * ratioY, fbQSBack_SlotName[0].X1, fbQSBack_SlotName[0].Y1, fbQSBack_SlotName[0].X2, fbQSBack_SlotName[0].Y2);
            C.DrawColor = C.MakeColor(163, 163, 163, byte(255));
        }
        OffsetX = 59;
        OffsetY = 4;
        class'BTCustomDrawHK'.static.DrawString(C, MyStatus.QuickSlotList[iSlot].strName, 5, float(iFontSize2), float(iPosX + OffsetX) * ratioX, float(iPosY + OffsetY) * ratioY, 238.0 + float(iPosX) + float(OffsetX) * ratioX, 32.0 + float(iPosY) + float(OffsetY) * ratioY, class'BTHUDColorPoolHK'.static.DefaultShadow());
    }
    // End:0x604
    if(bHasItem)
    {
        C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
    }
    // End:0x62c
    else
    {
        C.DrawColor = C.MakeColor(127, 127, 127, byte(255));
    }
    OffsetX = 14 + 7;
    OffsetY = 5;
    class'BTCustomDrawHK'.static.DrawImageScaleWithClipArea(C, class'BTHUDResourcePoolHK'.default.Key_Bg, float(iPosX + OffsetX) * ratioX, float(iPosY + OffsetY) * ratioY, 32.0 + float(iPosX) + float(OffsetX) * ratioX, 32.0 + float(iPosY) + float(OffsetY) * ratioY, 0.0, 0.0, 32.0, 32.0);
    OffsetX = 14 + 9;
    OffsetY = 7;
    // End:0x712
    if(!bDefaultWeapon)
    {
        TempWidget = HelpKeyButtonNumber[1 + iSlot];
    }
    // End:0x720
    else
    {
        TempWidget = HelpKeyButtonAlphaBet[16];
    }
    boxTemp.X1 = float(TempWidget.TextureCoords.X1);
    boxTemp.Y1 = float(TempWidget.TextureCoords.Y1);
    boxTemp.X2 = float(TempWidget.TextureCoords.X2);
    boxTemp.Y2 = float(TempWidget.TextureCoords.Y2);
    class'BTCustomDrawHK'.static.DrawImageScaleWithClipArea(C, class'BTHUDResourcePoolHK'.default.butt_Keyboard, float(iPosX + OffsetX) * ratioX, float(iPosY + OffsetY) * ratioY, 26.0 + float(iPosX) + float(OffsetX) * ratioX, 26.0 + float(iPosY) + float(OffsetY) * ratioY, boxTemp.X1, boxTemp.Y1, boxTemp.X2, boxTemp.Y2);
}

function DrawSellectBar(Canvas C, int iPosX, int iPosY, optional bool bDefaultWeapon)
{
    local int OffsetY, iSlot;
    local float ratioX, ratioY, fAddTemp;

    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    ratioX = C.ClipX / float(1600);
    ratioY = C.ClipY / float(1200);
    iSlot = HudOwner.PlayerOwner.iSelectedQSlotIndex;
    fAddTemp = 0.0;
    // End:0x1a3
    if(iSlot == 0)
    {
        OffsetY = 52;
        class'BTCustomDrawHK'.static.DrawImage(C, class'BTHUDResourcePoolHK'.default.hud_back_5, float(iPosX + 357) * ratioX, float(iPosY + OffsetY) * ratioY, float(iPosX + 885) * ratioX, 54.0 + float(iPosY) + float(OffsetY) + fAddTemp * ratioY);
        class'BTCustomDrawHK'.static.DrawImage(C, class'BTHUDResourcePoolHK'.default.hud_back_5, float(iPosX + 894) * ratioX, float(iPosY + OffsetY) * ratioY, float(iPosX + 1162) * ratioX, 54.0 + float(iPosY) + float(OffsetY) + fAddTemp * ratioY);
    }
    // End:0x300
    else
    {
        OffsetY = 0;
        class'BTCustomDrawHK'.static.DrawImage(C, class'BTHUDResourcePoolHK'.default.hud_back_5, float(iPosX + 357) * ratioX, float(iPosY) + fbQSContent[iSlot - 1].Y1 + float(OffsetY) * ratioY, float(iPosX + 885) * ratioX, fbQSContent[iSlot - 1].Y2 + float(iPosY) + float(OffsetY) + fAddTemp * ratioY);
        class'BTCustomDrawHK'.static.DrawImage(C, class'BTHUDResourcePoolHK'.default.hud_back_5, float(iPosX + 894) * ratioX, float(iPosY) + fbQSContent[iSlot - 1].Y1 + float(OffsetY) * ratioY, float(iPosX + 1162) * ratioX, fbQSContent[iSlot - 1].Y2 + float(iPosY) + float(OffsetY) + fAddTemp * ratioY);
    }
}

function DrawQuickSlotContent_Description(Canvas C, int iPosX, int iPosY)
{
    local int i, iFontSize, OffsetX, OffsetY;
    local float ratioX, ratioY, X1, X2, Y1, Y2;

    local string strTemp;

    ratioX = C.ClipX / float(1600);
    ratioY = C.ClipY / float(1200);
    C.DrawColor = colorQSContent;
    OffsetX = 14;
    OffsetY = 4;
    class'BTCustomDrawHK'.static.DrawString(C, strQSContent[0], 4, float(iFontSize1), float(iPosX + OffsetX) * ratioX, float(iPosY + OffsetY) * ratioY, 350.0 + float(iPosX) * ratioX, 36.0 + float(iPosY) * ratioY, class'BTHUDColorPoolHK'.static.DefaultShadow());
    iFontSize = int(float(14) * _reY);
    i = 0;
    J0xff:
    // End:0x200 [While If]
    if(i < 6)
    {
        OffsetX = ContentOffSetX[i];
        X1 = float(iPosX + OffsetX) * _reX;
        X2 = float(iPosX + OffsetX + 101) * _reX;
        Y1 = float(iPosY + OffsetY) * _reY;
        Y2 = float(iPosY + OffsetY + 32) * _reY;
        strTemp = GetEllipsString(C, strQSContent[1 + i], X2 - X1, float(iFontSize));
        C.BtrDrawTextJustifiedWithVolumeLine(strTemp, 1, X1, Y1, X2, Y2, iFontSize, color_Shadow);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xff;
    }
}

function DrawQuickSlotContent_DefaultWeapon(Canvas C, int iPosX, int iPosY)
{
    local int i, OffsetX, OffsetY;
    local float ratioX, ratioY, iFontSize, X1, X2, Y1,
	    Y2;

    local FloatBox TextBox;
    local string strTemp;

    ratioX = C.ClipX / float(1600);
    ratioY = C.ClipY / float(1200);
    QuickSlotContent_SetString(C, iPosX, iPosY, -1, true);
    OffsetY = 0;
    i = 0;
    J0x63:
    // End:0x3e1 [While If]
    if(i < 6)
    {
        OffsetX = ContentOffSetX[i];
        OffsetY = 0;
        C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
        class'BTCustomDrawHK'.static.DrawImage(C, class'BTHUDResourcePoolHK'.default.hud_back_4_1, float(iPosX + OffsetX) * ratioX, float(iPosY + OffsetY) * ratioY, 109.0 + float(iPosX) + float(OffsetX) * ratioX, 54.0 + float(iPosY) + float(OffsetY) * ratioY);
        C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(float(255) * 0.40));
        // End:0x282
        if(i < 4 && mDefaultItemImage[i].Image != none)
        {
            C.SetPos(float(iPosX + OffsetX) + fbQSBack_ItemImage.X1 * ratioX, float(iPosY + OffsetY) + fbQSBack_ItemImage.Y1 * ratioY);
            C.DrawTile(mDefaultItemImage[i].Image, fbQSBack_ItemImage.X2 - fbQSBack_ItemImage.X1 * ratioX, fbQSBack_ItemImage.Y2 - fbQSBack_ItemImage.Y1 * ratioY, mDefaultItemImage[i].X, mDefaultItemImage[i].Y, mDefaultItemImage[i].width, mDefaultItemImage[i].Height);
        }
        C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
        TextBox = fbQS_Content_Text_Default;
        iFontSize = 13.0 * _reY;
        X1 = TextBox.X1 + float(iPosX) + float(OffsetX) * _reX;
        X2 = TextBox.X2 + float(iPosX) + float(OffsetX) * _reX;
        Y1 = TextBox.Y1 + float(iPosY) + float(OffsetY) * _reY;
        Y2 = TextBox.Y2 + float(iPosY) + float(OffsetY) * _reY;
        strTemp = GetEllipsString(C, strQS[1 + i], X2 - X1, iFontSize);
        C.BtrDrawTextJustifiedWithVolumeLine(strTemp, 1, X1, Y1, X2, Y2, int(iFontSize), color_Shadow);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x63;
    }
    bLoadDefaultItemResource = true;
}

function bool DrawQuickSlotContent_List(Canvas C, int iPosX, int iPosY, int iSlot)
{
    local int i, iFontSize, OffsetX, OffsetY;
    local float ratioX, ratioY, X1, X2, Y1, Y2;

    local bool bHasItem;
    local FloatBox TextBox;
    local string strTemp;

    ratioX = C.ClipX / float(1600);
    ratioY = C.ClipY / float(1200);
    iFontSize = iFontSize1;
    i = 0;
    J0x4c:
    // End:0x43e [While If]
    if(i < 6)
    {
        OffsetX = ContentOffSetX[i];
        OffsetY = 0;
        C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
        class'BTCustomDrawHK'.static.DrawImage(C, class'BTHUDResourcePoolHK'.default.hud_back_4_1, float(iPosX + OffsetX) * ratioX, float(iPosY + OffsetY) * ratioY, 109.0 + float(iPosX) + float(OffsetX) * ratioX, 54.0 + float(iPosY) + float(OffsetY) * ratioY);
        C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(float(255) * 0.40));
        OffsetY = 0;
        // End:0x2de
        if(i < 4 && mQuickSlotItemImage[i + 4 * iSlot].Image != none)
        {
            mQuickSlotItemImage[i + 4 * iSlot].DrawColor = C.DrawColor;
            C.SetPos(float(iPosX + OffsetX) + fbQSBack_ItemImage.X1 * ratioX, float(iPosY + OffsetY) + fbQSBack_ItemImage.Y1 * ratioY);
            C.DrawTile(mQuickSlotItemImage[i + 4 * iSlot].Image, fbQSBack_ItemImage.X2 - fbQSBack_ItemImage.X1 * ratioX, fbQSBack_ItemImage.Y2 - fbQSBack_ItemImage.Y1 * ratioY, mQuickSlotItemImage[i + 4 * iSlot].X, mQuickSlotItemImage[i + 4 * iSlot].Y, mQuickSlotItemImage[i + 4 * iSlot].width, mQuickSlotItemImage[i + 4 * iSlot].Height);
        }
        C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
        TextBox = fbQS_Content_Text_Default;
        iFontSize = int(float(13) * _reY);
        X1 = TextBox.X1 + float(iPosX) + float(OffsetX) * _reX;
        X2 = TextBox.X2 + float(iPosX) + float(OffsetX) * _reX;
        Y1 = TextBox.Y1 + float(iPosY) + float(OffsetY) * _reY;
        Y2 = TextBox.Y2 + float(iPosY) + float(OffsetY) * _reY;
        strTemp = GetEllipsString(C, strQS[1 + i], X2 - X1, float(iFontSize));
        C.BtrDrawTextJustifiedWithVolumeLine(strTemp, 1, X1, Y1, X2, Y2, iFontSize, color_Shadow);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x4c;
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
    local wWeaponBaseParams WBP;

    ratioX = C.ClipX / float(1600);
    ratioY = C.ClipY / float(1200);
    MyStatus = Level.CharMgr.MyPlayer;
    kMM = Level.GetMatchMaker();
    i = 0;
    J0x73:
    // End:0x5d1 [While If]
    if(i < 4)
    {
        iItemID = -1;
        // End:0xba
        if(kMM.eWeaponLimit == kMM.1)
        {
            // End:0xba
            if(0 != i)
            {
            }
            // End:0x5c7
            else
            {
            }
            // End:0xed
            if(!bDefaultWeapon)
            {
                iItemID = MyStatus.QuickSlotList[iSlot].iItemID[i];
            }
            // End:0x107
            else
            {
                iItemID = MyStatus.FindItemIDBySlotPos(i);
            }
            cItemParam = Level.GameMgr.GetItemParam(iItemID);
            // End:0x15a
            if(!bLoadDefaultItemResource)
            {
                // End:0x15a
                if(bDefaultWeapon)
                {
                    mDefaultItemImage[i] = GetItemImage(C, iItemID);
                }
            }
            // End:0x197
            if(!bLoadSlotItemResource)
            {
                // End:0x197
                if(!bDefaultWeapon)
                {
                    mQuickSlotItemImage[i + 4 * iSlot] = GetItemImage(C, iItemID);
                }
            }
            // End:0x57b
            if(kMM.eWeaponLimit != kMM.0)
            {
                // End:0x256
                if(kMM.eWeaponLimit == kMM.4)
                {
                    // End:0x253
                    if(0 == i)
                    {
                        cItemParam = Level.GameMgr.GetItemParam(5012);
                        iItemID = cItemParam.iItemID;
                        mDefaultItemImage[0] = GetItemImage(C, iItemID);
                        mQuickSlotItemImage[i + 4 * iSlot] = mDefaultItemImage[0];
                    }
                }
                // End:0x57b
                else
                {
                    // End:0x3ac
                    if(kMM.eWeaponLimit == kMM.5)
                    {
                        // End:0x347
                        if(0 < iItemID && cItemParam != none)
                        {
                            WBP = Level.WeaponMgr.GetBaseParam(iItemID);
                            // End:0x344
                            if(1 == WBP.iInventoryGroup)
                            {
                                // End:0x344
                                if(WBP.eType != 2)
                                {
                                    iItemID = MyStatus.FindItemIDBySlotPos(i);
                                    cItemParam = Level.GameMgr.GetItemParam(iItemID);
                                    mQuickSlotItemImage[i + 4 * iSlot] = GetItemImage(C, iItemID);
                                }
                            }
                        }
                        // End:0x3a9
                        else
                        {
                            // End:0x3a9
                            if(0 == i)
                            {
                                iItemID = MyStatus.FindItemIDBySlotPos(0);
                                cItemParam = Level.GameMgr.GetItemParam(iItemID);
                                mQuickSlotItemImage[i + 4 * iSlot] = mDefaultItemImage[0];
                            }
                        }
                    }
                    // End:0x57b
                    else
                    {
                        // End:0x4e1
                        if(kMM.eWeaponLimit == kMM.6)
                        {
                            // End:0x47c
                            if(0 < iItemID && cItemParam != none)
                            {
                                WBP = Level.WeaponMgr.GetBaseParam(iItemID);
                                // End:0x479
                                if(WBP.eType == 2)
                                {
                                    iItemID = MyStatus.FindItemIDBySlotPos(0);
                                    cItemParam = Level.GameMgr.GetItemParam(iItemID);
                                    mQuickSlotItemImage[i + 4 * iSlot] = mDefaultItemImage[0];
                                }
                            }
                            // End:0x4de
                            else
                            {
                                // End:0x4de
                                if(0 == i)
                                {
                                    iItemID = MyStatus.FindItemIDBySlotPos(0);
                                    cItemParam = Level.GameMgr.GetItemParam(iItemID);
                                    mQuickSlotItemImage[i + 4 * iSlot] = mDefaultItemImage[0];
                                }
                            }
                        }
                        // End:0x57b
                        else
                        {
                            // End:0x57b
                            if(kMM.eWeaponLimit == kMM.1)
                            {
                                // End:0x57b
                                if(0 == i)
                                {
                                    cItemParam = Level.GameMgr.GetItemParam(9001);
                                    iItemID = cItemParam.iItemID;
                                    mDefaultItemImage[0] = GetItemImage(C, iItemID);
                                    mQuickSlotItemImage[i + 4 * iSlot] = mDefaultItemImage[0];
                                }
                            }
                        }
                    }
                }
            }
            // End:0x5b3
            if(0 < iItemID && cItemParam != none)
            {
                strQS[1 + i] = cItemParam.strDisplayName;
            }
            // End:0x5c7
            else
            {
                strQS[1 + i] = srtQSNothing;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x73;
    }
    i = 0;
    J0x5d8:
    // End:0x7bc [While If]
    if(i < 2)
    {
        iItemID = -1;
        // End:0x622
        if(!bDefaultWeapon)
        {
            iItemID = MyStatus.QuickSlotList[iSlot].iSkillID[i];
        }
        // End:0x71e
        else
        {
            // End:0x697
            if(kMM != none && HudOwner.PlayerOwner != none && HudOwner.PlayerOwner.PlayerReplicationInfo != none)
            {
                kUser = kMM.GetUserInfoByUserName(HudOwner.PlayerOwner.PlayerReplicationInfo.PlayerName);
            }
            // End:0x71e
            if(kUser != none)
            {
                j = 0;
                J0x6a9:
                // End:0x71e [While If]
                if(j < MyStatus.SkillList.Length)
                {
                    iItemID = -1;
                    // End:0x714
                    if(iSkillSlot == MyStatus.SkillList[j].bySlotPosition)
                    {
                        iItemID = MyStatus.SkillList[j].iSkillID;
                    }
                    // End:0x71e
                    else
                    {
                        ++ j;
                        // This is an implied JumpToken; Continue!
                        goto J0x6a9;
                    }
                }
            }
        }
        cItemParam = Level.GameMgr.GetItemParam(iItemID);
        // End:0x79d
        if(0 < iItemID && cItemParam != none)
        {
            iLocation = InStr(cItemParam.strDisplayName, "]");
            strQS[5 + i] = Mid(cItemParam.strDisplayName, iLocation + 1);
        }
        // End:0x7b2
        else
        {
            strQS[5 + i] = srtQSNothing;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x5d8;
    }
    // End:0x815
    if(kMM.eWeaponLimit == kMM.1)
    {
        i = 0;
        J0x7e5:
        // End:0x815 [While If]
        if(i < 7)
        {
            // End:0x80b
            if(i != 6)
            {
                strQS[i] = "";
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x7e5;
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

function CalcQuickSlotTimer(out int respawnLeftTime, out int startupLeftTime)
{
    respawnLeftTime = int(float(QuickSlotWindowShowTime) - Level.PlayTimeSeconds - float(QuickSlotWindowStartTime));
    startupLeftTime = int(float(QuickSlotWindowShowTime) - Level.PlayTimeSeconds - LevelStartTime);
}

function DrawItemImage(Canvas C);

defaultproperties
{
    strChangeQS[0]="Changed to the weapon in the default slot."
    strChangeQS[1]="Changed to the weapon in quick slot 1."
    strChangeQS[2]="Changed to the weapon in quick slot 2."
    strChangeQS[3]="Changed to the weapon in quick slot 3."
    strChangeQS[4]="Changed to the weapon in quick slot 4."
    strChangeQS[5]="Changed to the weapon in quick slot 5."
    strChangeQSInPlayerWalking="Your weapons will change on next respawn."
    strCloseQSTime="The quick slot window closed because time expired."
    strCloseQSDistance="The quick slot window closed because you left the respawn area."
    strQSContent[0]="Weapon Change Window"
    strQSContent[1]="Primary"
    strQSContent[2]="Pistol"
    strQSContent[3]="Thrown 1"
    strQSContent[4]="Thrown 2"
    strQSContent[5]="Attack Skill"
    strQSContent[6]="Passive Skill"
    CapBaseWeaponSet="Default Weapon Set"
    srtQSNothing="Unregistered"
    QuickSlotWindowShowTime=10
    strWeaponChange[0]="Weapon change in "
    strWeaponChange[1]=" seconds."
    strQSButtonZ="Default Weapon Set"
    strToggleQS[0]="Close Quick Slot"
    strToggleQS[1]="Open Quick Slot"
    strUsing="(In Use)"
    colorLeftTime=(R=255,G=49,B=52,A=255)
    colorQS=(R=225,G=225,B=164,A=255)
    colorQSSelect=(R=240,G=180,B=60,A=255)
    colorQSContent=(R=176,G=207,B=159,A=255)
    fbQSBack=(X1=0.0,Y1=333.0,X2=1024.0,Y2=578.0)
    fbQSButton[0]=(X1=384.0,Y1=346.0,X2=640.0,Y2=379.0)
    fbQSButton[1]=(X1=384.0,Y1=381.0,X2=640.0,Y2=414.0)
    fbQSButton[2]=(X1=384.0,Y1=416.0,X2=640.0,Y2=449.0)
    fbQSButton[3]=(X1=384.0,Y1=451.0,X2=640.0,Y2=484.0)
    fbQSButton[4]=(X1=384.0,Y1=486.0,X2=640.0,Y2=519.0)
    fbQSButtonZ=(X1=384.0,Y1=534.0,X2=640.0,Y2=567.0)
    fbQSButtonOpen=(X1=384.0,Y1=618.0,X2=640.0,Y2=653.0)
    fbQSContentName[0]=(X1=0.0,Y1=133.0,X2=0.0,Y2=0.0)
    fbQSContentName[1]=(X1=0.0,Y1=198.0,X2=0.0,Y2=0.0)
    fbQSContentName[2]=(X1=0.0,Y1=264.0,X2=0.0,Y2=0.0)
    fbQSContentName[3]=(X1=0.0,Y1=330.0,X2=0.0,Y2=0.0)
    fbQSContentName[4]=(X1=0.0,Y1=396.0,X2=0.0,Y2=0.0)
    fbQSContent[0]=(X1=0.0,Y1=126.0,X2=0.0,Y2=180.0)
    fbQSContent[1]=(X1=0.0,Y1=191.0,X2=0.0,Y2=245.0)
    fbQSContent[2]=(X1=0.0,Y1=257.0,X2=0.0,Y2=311.0)
    fbQSContent[3]=(X1=0.0,Y1=323.0,X2=0.0,Y2=377.0)
    fbQSContent[4]=(X1=0.0,Y1=389.0,X2=0.0,Y2=450.0)
    fbQSBack_Content=(X1=0.0,Y1=0.0,X2=1164.0,Y2=40.0)
    fbQS_Content_Text=(X1=0.0,Y1=17.0,X2=109.0,Y2=37.0)
    fbQS_Content_Text_Default=(X1=0.0,Y1=0.0,X2=109.0,Y2=54.0)
    fbQSBack_ItemImage=(X1=-20.0,Y1=7.0,X2=130.0,Y2=49.0)
    ContentOffSetX[0]=371
    ContentOffSetX[1]=501
    ContentOffSetX[2]=631
    ContentOffSetX[3]=761
    ContentOffSetX[4]=909
    ContentOffSetX[5]=1039
    iFontSize0=6
    iFontSize1=9
    iFontSize2=11
    iFontSize3=13
    fbQSBack_SlotName[0]=(X1=0.0,Y1=0.0,X2=336.0,Y2=40.0)
    fbQSBack_SlotName[1]=(X1=0.0,Y1=41.0,X2=336.0,Y2=81.0)
    fbQSBack_SlotName[2]=(X1=0.0,Y1=82.0,X2=336.0,Y2=122.0)
    fbQSBack_SlotName[3]=(X1=0.0,Y1=123.0,X2=336.0,Y2=163.0)
}