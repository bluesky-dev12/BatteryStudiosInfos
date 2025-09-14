/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\wHudPart_Tutorial2.uc
 * Package Imports:
 *	XInterface
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:124
 *	Functions:26
 *	States:38
 *
 *******************************************************************************/
class wHudPart_Tutorial2 extends wHudPart_Tutorial
    transient;

var localized string lsStartComment;
var localized string lsStartComment2;
var localized string lsQOnFocus;
var localized string lsCOnFocus;
var localized string lsQOnFocusEnd;
var localized string lsCOnFocusEnd;
var localized string lsQMoveControlA;
var localized string lsCMoveControlA;
var localized string lsQMoveControlD;
var localized string lsCMoveControlD;
var localized string lsQMoveControlW;
var localized string lsCMoveControlW;
var localized string lsQMoveControlS;
var localized string lsCMoveControlS;
var localized string lsQMoveControlQ;
var localized string lsCMoveControlQ;
var localized string lsQMoveTrainingField;
var localized string lsCMoveTrainingField;
var localized string lsQMoveComplete;
var localized string lsCNext01;
var localized string lsQMoveWalking;
var localized string lsCMoveWalking;
var localized string lsQMoveWalkingEnd;
var localized string lsCMoveWalkingEnd;
var localized string lsQMoveDucking;
var localized string lsCMoveDucking;
var localized string lsQMoveDuckingEnd;
var localized string lsCMoveDuckingEnd;
var localized string lsQMoveProne;
var localized string lsCMoveProne;
var localized string lsQMoveProneEnd;
var localized string lsCMoveProneEnd;
var localized string lsQMoveJump;
var localized string lsCMoveJump;
var localized string lsQMoveJumpEnd;
var localized string lsCMoveJumpEnd;
var localized string lsQMoveLadder;
var localized string lsCMoveLadder;
var localized string lsQMoveLadderEnd;
var localized string lsCMoveLadderEnd;
var localized string lsQJumpDown;
var localized string lsCJumpDown;
var localized string lsQJumpDownEnd;
var localized string lsCJumpDownEnd;
var localized string lsQRecoveryHealth;
var localized string lsCRecoveryHealth;
var localized string lsQRecoveryHealthEnd;
var localized string lsCRecoveryHealthEnd;
var localized string lsQMoveSprint;
var localized string lsCMoveSprint;
var localized string lsQMoveSprintEnd;
var localized string lsCMoveSprintEnd;
var localized string lsQDoFire;
var localized string lsCDoFire;
var localized string lsQDoFireEnd;
var localized string lsCDoFireEnd;
var localized string lsQDoFireAim;
var localized string lsCDoFireAim;
var localized string lsQDoFireAimEnd;
var localized string lsCDoFireAimEnd;
var localized string lsQDoFireMelee;
var localized string lsCDoFireMelee;
var localized string lsQDoFireMeleeEnd;
var localized string lsCDoFireMeleeEnd;
var localized string lsQMoveTrainingField2;
var localized string lsCMoveTrainingField2;
var localized string lsQPickUpRocketLauncher;
var localized string lsCPickUpRocketLauncher;
var localized string lsQDoFireRocketLauncher;
var localized string lsCDoFireRocketLauncher;
var localized string lsQDoFireRocketLauncherEnd;
var localized string lsCDoFireRocketLauncherEnd;
var localized string lsQMoveTrainingField3;
var localized string lsCMoveTrainingField3;
var localized string lsQDoThrowingWeapon;
var localized string lsCDoThrowingWeapon;
var localized string lsQDoThrowingWeaponEnd;
var localized string lsCDoThrowingWeaponEnd;
var localized string lsQBattleAIBot;
var localized string lsCBattleAIBot;
var localized string lsQBattleAIBotEnd;
var localized string lsCBattleAIBotEnd;
var localized string lsAIBotTime;
var localized string lsAIBotKillCount;
var localized string lsGiftPoint;
var Vector vOldLocation;
var float fMoveLength;
var int iTriggerID;
var bool IsFadeOut;
var bool bDrawBeginTutorial;
var bool bAIBotScore;
var float fAIBotBeginTime;
var float fAIBotEndTime;
var int iTutorialID;
var int iOldTutorialID;
var int iStartTutorialID;
var int aQuestID[17];
var int iCurrentQuestID;
var int iStartQuestID;
var int iGiftItemID;
var bool bDrawItem;
var bool bNoUpdate;
var float fTotalDrawTime;
var float fDrawItemTime;
var float fDrawEffectTime;
var float fDrawEffectTime1;
var float fDrawEffectTime2;
var float fDrawEffectTime3;
var float fFadeOutTime;
var float fBeginDrawItem;
var float fEndOfLife;
var float callLastTime;
var float callAccelStep;
var int iDrawEffectState;
var SpriteWidget WGiftItemPopBG;
var SpriteWidget WGiftItemPopBG2;
var SpriteWidget WGiftItemBG;
var SpriteWidget WGiftItem;
var localized string lsGiftItem;
var string strGiftItemBG;
var string strRes_Icon;
var SpriteWidget WNoticeExitBG;
var localized string lsNoticeExit;
var delegate<OnTutorialResult> __OnTutorialResult__Delegate;

function OnQuest();
delegate OnTutorialResult(int iTutorialID, int iCurrent, optional bool bCompleted);
function TutorialEvent(coerce string S, optional name Type, optional name reserv)
{
    // End:0x4e
    if(IsInState('Q02_MoveControllA') || IsInState('Q02_MoveControllD') || IsInState('Q02_MoveControllW') || IsInState('Q02_MoveControllS') || IsInState('Q09_RecoveryHealthEnd') || IsInState('Q17_BattleAIBot'))
    {
        return;
    }
    switch(Type)
    {
        // End:0x5d
        case 'TutorialEventBegin':
        // End:0x7b
        case 'TutorialEventEnd':
            OnNextQuest();
            iTriggerID = int(S);
            // End:0x7e
            break;
        // End:0xffff
        default:
            switch(S)
            {
                // End:0xc7
                case string('OnNextQuest'):
                    OnNextQuest();
                    Log(string(self) $ "/ OnNextQuest() TutorialID : " $ string(iTutorialID));
                    // End:0x10c
                    break;
                // End:0x109
                case string('OnQuest'):
                    OnQuest();
                    Log(string(self) $ "/ OnQuest()     TutorialID : " $ string(iTutorialID));
                    // End:0x10c
                    break;
                // End:0xffff
                default:
}

function Mover DisableTriggerEvent(name EventName, Actor Other, Pawn EventInstigator)
{
    local Mover A;

    // End:0x11
    if(EventName == 'None')
    {
        return none;
    }
    // End:0x50
    foreach DynamicActors(class'Mover', A, EventName)
    {
        A.DisableTrigger();
        Log(string(self) $ " DisableTrigger()");                
    }
    return A;
}

function Mover EnableTriggerEvent(name EventName, Actor Other, Pawn EventInstigator)
{
    local Mover A;

    // End:0x11
    if(EventName == 'None')
    {
        return none;
    }
    // End:0x4f
    foreach DynamicActors(class'Mover', A, EventName)
    {
        A.EnableTrigger();
        Log(string(self) $ " EnableTrigger()");                
    }
    return A;
}

function Initialize(HudBase myOwner, LevelInfo Level)
{
    super.Initialize(myOwner, Level);
}

function ResetProgress()
{
    iGoal = 0;
    iCurrent = 0;
    iProgress = 0;
}

function OnBeginTutorial()
{
    fBeginMessageTime = Level.TimeSeconds;
    bDrawMessage = false;
    bDrawMessage_QuestComplete = false;
    bDrawBeginTutorial = true;
    fMessageDrawTime = 5.0;
    SQuest = lsStartComment;
    sComment = lsStartComment2;
}

function BeginDrawItem()
{
    // End:0x0d
    if(iTutorialID < 1)
    {
        return;
    }
    bNoUpdate = iStartTutorialID > iTutorialID;
    // End:0xcc
    if(iOldTutorialID != iTutorialID && !bNoUpdate)
    {
        iCurrentQuestID = aQuestID[iTutorialID - 1];
        Level.GetMatchMaker().UpdateTutorial(iCurrentQuestID, 1);
        fBeginDrawItem = Level.TimeSeconds;
        fEndOfLife = Level.TimeSeconds + fDrawEffectTime1 + fDrawEffectTime2 + fDrawEffectTime3 + fDrawItemTime + fFadeOutTime;
        bDrawItem = true;
        iDrawEffectState = 1;
    }
    // End:0xd4
    else
    {
        bDrawItem = false;
    }
    iOldTutorialID = iTutorialID;
}

function CheckStartTutorial()
{
    local int i;

    iStartQuestID = Level.GetMatchMaker().GetNextQuestID();
    // End:0xa0
    if(iStartQuestID > 0)
    {
        i = 0;
        J0x31:
        // End:0x98 [While If]
        if(i < 17)
        {
            // End:0x76
            if(aQuestID[i] == iStartQuestID)
            {
                iStartTutorialID = i + 1;
                OnTutorialResult(i + 1, 0);
            }
            // End:0x98
            else
            {
                OnTutorialResult(i + 1, iCurrent, true);
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x31;
            }
        }
        bNoUpdate = true;
    }
}

function GotoTutorial(int iQuestID)
{
    switch(iQuestID)
    {
        // End:0x19
        case 9001:
            GotoState('OnTarget');
            // End:0x13c
            break;
        // End:0x2b
        case 9002:
            GotoState('MoveControllA');
            // End:0x13c
            break;
        // End:0x3d
        case 9003:
            GotoState('MoveWalking');
            // End:0x13c
            break;
        // End:0x4f
        case 9004:
            GotoState('MoveDucking');
            // End:0x13c
            break;
        // End:0x61
        case 9005:
            GotoState('MoveProne');
            // End:0x13c
            break;
        // End:0x73
        case 9006:
            GotoState('MoveJump');
            // End:0x13c
            break;
        // End:0x85
        case 9007:
            GotoState('MoveLadder');
            // End:0x13c
            break;
        // End:0x97
        case 9008:
            GotoState('MoveJumpDown');
            // End:0x13c
            break;
        // End:0xa9
        case 9009:
            GotoState('RecoveryHealth');
            // End:0x13c
            break;
        // End:0xbb
        case 9010:
            GotoState('MoveSprint');
            // End:0x13c
            break;
        // End:0xcd
        case 9011:
            GotoState('DoFire');
            // End:0x13c
            break;
        // End:0xdf
        case 9012:
            GotoState('DoFireAim');
            // End:0x13c
            break;
        // End:0xf1
        case 9013:
            GotoState('DoFireMelee');
            // End:0x13c
            break;
        // End:0x103
        case 9014:
            GotoState('PickupRocketLauncher');
            // End:0x13c
            break;
        // End:0x115
        case 9015:
            GotoState('DoFireRocketLauncher');
            // End:0x13c
            break;
        // End:0x127
        case 9016:
            GotoState('DoThrowingWeapon');
            // End:0x13c
            break;
        // End:0x139
        case 9017:
            GotoState('BattleAIBot');
            // End:0x13c
            break;
        // End:0xffff
        default:
}

function EnableShootTarget(name eventTag)
{
    local ShootTarget A;

    // End:0x26
    foreach DynamicActors(class'ShootTarget', A, eventTag)
    {
        A.Enable('Trigger');                
    }
}

function Movelength(Vector vLocation)
{
    fMoveLength += VSize(vLocation - vOldLocation);
    // End:0x2a
    if(fMoveLength > 300.0)
    {
        OnNextQuest();
    }
}

function CallEvent(optional bool ItemCheck, optional int iReservation1, optional int iReservation2)
{
    super.CallEvent(ItemCheck, iReservation1, iReservation2);
}

event Trigger(Actor Other, Pawn EventInstigator);
function DrawHudPassA(Canvas C)
{
    // End:0x14
    if(bDrawMessage)
    {
        DrawQuest(C);
    }
    // End:0x28
    if(bDrawMessage_QuestComplete)
    {
        DrawQuestComplete(C);
    }
    // End:0x3c
    if(bDrawBeginTutorial)
    {
        DrawBeginTutorial(C);
    }
    DrawNoticeExit(C);
    // End:0x5b
    if(bAIBotScore)
    {
        DrawBattleAIBot(C);
    }
    // End:0x6f
    if(bDrawItem)
    {
        DrawGiftItemT(C);
    }
}

function DrawSpectatingHud(Canvas C)
{
    // End:0x14
    if(bDrawMessage)
    {
        DrawQuest(C);
    }
    // End:0x28
    if(bDrawMessage_QuestComplete)
    {
        DrawQuestComplete(C);
    }
    DrawNoticeExit(C);
}

function DrawGiftItem(Canvas C)
{
    local CalCoordsW calW;
    local Material mat;
    local float fDeltaTime, fDeltaTime2, _PosX, _PosY, fScale, fAddRatio;

    local bool bGiftIsPoint;
    local string sItemDisplayName, sRes_Icon;
    local float fPassingTime, fStartValue, fCurrentValue, fDestValue, fDeltaValue, fFadeValue;

    local wQuestParam qParam;
    local wItemResourceParam cItemResParam;
    local wItemBaseParam cItemParam;

    fDeltaTime = Level.TimeSeconds - fBeginDrawItem;
    fTotalDrawTime = fDrawItemTime + fFadeOutTime;
    fDrawEffectTime = 0.50;
    // End:0x5c
    if(fDeltaTime >= fTotalDrawTime)
    {
        bDrawItem = false;
        callAccelStep = 0.0;
        return;
    }
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    qParam = Level.GameMgr.GetQuestInfo(iCurrentQuestID);
    // End:0x175
    if(qParam != none)
    {
        // End:0xd7
        if(qParam.RewardItemID[0] <= 0 && qParam.RewardPoint <= 0)
        {
            return;
        }
        // End:0x10b
        if(qParam.RewardItemID[0] <= 0 && qParam.RewardPoint > 0)
        {
            bGiftIsPoint = true;
        }
        // End:0x172
        if(!bGiftIsPoint)
        {
            cItemParam = Level.GameMgr.GetItemParam(qParam.RewardItemID[0]);
            cItemResParam = Level.GameMgr.GetItemResourceParam(qParam.RewardItemID[0]);
        }
    }
    // End:0x177
    else
    {
        return;
    }
    fScale = 1.60;
    fDeltaTime = fDrawItemTime + fBeginDrawItem - Level.TimeSeconds;
    fDeltaTime = FClamp(fDeltaTime, 0.0, fDrawItemTime);
    fDeltaTime2 = callLastTime - fDeltaTime;
    // End:0x203
    if(fDeltaTime2 > 0.010)
    {
        callLastTime = fDeltaTime;
        callAccelStep += 0.20 * class'wMessage_Score'.default.ScaleStepMultiplier;
    }
    fStartValue = 1200.0;
    fDestValue = 866.0;
    fDeltaValue = 334.0;
    fPassingTime = fDrawItemTime - fDeltaTime;
    fCurrentValue = fDestValue + fDeltaValue * 1.0 - FClamp(fPassingTime / fDrawEffectTime, 0.0, 1.0);
    fCurrentValue = fCurrentValue + callAccelStep;
    fCurrentValue = FClamp(fCurrentValue, fDestValue, fStartValue);
    // End:0x342
    if(1 == iDrawEffectState)
    {
        // End:0x2ca
        if(fCurrentValue >= fDestValue)
        {
            callLastTime = 0.0;
            callAccelStep = 0.0;
            iDrawEffectState = 2;
        }
        fAddRatio = 1.0 - FClamp(fPassingTime / fDrawEffectTime, 0.0, 1.0);
        // End:0x327
        if(fAddRatio > float(0))
        {
            C.DrawColor.A = byte(float(100) * 1.0 - fAddRatio);
        }
        // End:0x33f
        else
        {
            C.DrawColor.A = byte(255);
        }
    }
    // End:0x3c7
    else
    {
        // End:0x3c7
        if(2 == iDrawEffectState)
        {
            fFadeValue = fDrawItemTime + fBeginDrawItem - Level.TimeSeconds;
            fFadeValue = fFadeValue / fTotalDrawTime - fFadeOutTime;
            C.DrawColor.A = byte(float(C.DrawColor.A) * FClamp(fFadeValue, 0.0, 1.0));
        }
    }
    _PosY = fCurrentValue;
    WGiftItemPopBG.OffsetX = int(float(800) - float(318 / 2) * fScale);
    WGiftItemPopBG.OffsetY = int(_PosY);
    CalculateCoordinateEx(C, WGiftItemPopBG, 318.0 * fScale, 144.0 * fScale, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WGiftItemPopBG.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    WGiftItemPopBG2.OffsetX = int(float(800) - float(318 / 2) * fScale);
    WGiftItemPopBG2.OffsetY = int(_PosY);
    CalculateCoordinateEx(C, WGiftItemPopBG2, 318.0 * fScale, 33.0 * fScale, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WGiftItemPopBG2.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    C.BtrDrawTextJustifiedWithVolumeLine(lsGiftItem, 1, 0.0, _PosY + float(7) * fScale * _reY, 1600.0 * _reX, _PosY + float(27) * fScale * _reY, int(float(14) * _reY * fScale), color_Shadow);
    _PosY = _PosY + float(44) * fScale;
    WGiftItemBG.WidgetTexture = Material(DynamicLoadObject("Warfare_GP_UI_UI.list_item_store_n", class'Material'));
    WGiftItemBG.OffsetX = int(float(800) - float(156 / 2) * fScale);
    WGiftItemBG.OffsetY = int(_PosY);
    CalculateCoordinateEx(C, WGiftItemBG, 156.0 * fScale, 85.0 * fScale, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WGiftItemBG.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    // End:0x754
    if(cItemParam != none)
    {
        sItemDisplayName = cItemParam.strDisplayName;
    }
    // End:0x786
    if(bGiftIsPoint)
    {
        sItemDisplayName = lsGiftPoint $ "( " $ string(qParam.RewardPoint) $ " )";
    }
    _PosY = float(WGiftItemBG.OffsetY);
    C.BtrDrawTextJustifiedWithVolumeLine(sItemDisplayName, 1, 0.0, _PosY + float(6) * fScale * _reY, 1600.0 * _reX, _PosY + float(21) * fScale * _reY, int(float(10) * _reY * fScale), color_Shadow);
    // End:0x82c
    if(cItemResParam != none)
    {
        sRes_Icon = cItemResParam.strRes_Icon;
    }
    // End:0x869
    else
    {
        // End:0x869
        if(bGiftIsPoint)
        {
            sRes_Icon = "Warfare_UI_Item.ShopIcon.Item_Item_FT_pt_bns";
        }
    }
    // End:0x944
    if(Len(sRes_Icon) > 0)
    {
        _PosX = float(WGiftItemBG.OffsetX) + float(2) * fScale;
        _PosY = float(WGiftItemBG.OffsetY) + float(25) * fScale;
        C.SetPos(_PosX * _reX, _PosY * _reY);
        mat = Material(DynamicLoadObject(sRes_Icon, class'Material'));
        C.DrawTile(mat, 152.0 * _reX * fScale, 50.0 * _reY * fScale, 0.0, 0.0, 152.0, 50.0);
    }
}

function DrawGiftItemT(Canvas C)
{
    local CalCoordsW calW;
    local Material mat;
    local float fDeltaTime, fDeltaTime2, _PosX, _PosY, fScale, fAddRatio;

    local bool bGiftIsPoint;
    local string sItemDisplayName, sRes_Icon;
    local float fPassingTime, fStartValue, fCurrentValue, fDestValue, fFinalValue, fFadeValue;

    local wQuestParam qParam;
    local wItemResourceParam cItemResParam;
    local wItemBaseParam cItemParam;

    // End:0x2d
    if(Level.TimeSeconds > fEndOfLife)
    {
        bDrawItem = false;
        callAccelStep = 0.0;
        return;
    }
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    qParam = Level.GameMgr.GetQuestInfo(iCurrentQuestID);
    // End:0x146
    if(qParam != none)
    {
        // End:0xa8
        if(qParam.RewardItemID[0] <= 0 && qParam.RewardPoint <= 0)
        {
            return;
        }
        // End:0xdc
        if(qParam.RewardItemID[0] <= 0 && qParam.RewardPoint > 0)
        {
            bGiftIsPoint = true;
        }
        // End:0x143
        if(!bGiftIsPoint)
        {
            cItemParam = Level.GameMgr.GetItemParam(qParam.RewardItemID[0]);
            cItemResParam = Level.GameMgr.GetItemResourceParam(qParam.RewardItemID[0]);
        }
    }
    // End:0x148
    else
    {
        return;
    }
    fTotalDrawTime = fDrawEffectTime1 + fDrawEffectTime2 + fDrawEffectTime3 + fDrawItemTime + fFadeOutTime;
    fDeltaTime = fEndOfLife - Level.TimeSeconds;
    fDeltaTime = FClamp(fDeltaTime, 0.0, fTotalDrawTime);
    fDeltaTime2 = callLastTime - fDeltaTime;
    // End:0x1e9
    if(fDeltaTime2 > 0.010)
    {
        callLastTime = fDeltaTime;
        callAccelStep += 0.10 * class'wMessage_Score'.default.ScaleStepMultiplier;
    }
    fFinalValue = 1.60;
    fAddRatio = 0.0;
    fPassingTime = fTotalDrawTime - fDeltaTime;
    // End:0x31b
    if(1 == iDrawEffectState)
    {
        fStartValue = 5.0;
        fDestValue = 1.40;
        fCurrentValue = fStartValue * 1.0 - FClamp(fPassingTime / fDrawEffectTime1, 0.0, 1.0);
        fCurrentValue = fCurrentValue - callAccelStep;
        fCurrentValue = FClamp(fCurrentValue, fDestValue, fStartValue);
        C.DrawColor.A = byte(float(100) * 1.0 - fCurrentValue / fStartValue);
        // End:0x2e3
        if(fCurrentValue <= fDestValue)
        {
            fCurrentValue = fDestValue;
            callAccelStep = 0.0;
            iDrawEffectState = 2;
        }
        fAddRatio = fCurrentValue - fDestValue / fStartValue - fDestValue + fFinalValue - fDestValue / fFinalValue;
    }
    // End:0x5db
    else
    {
        // End:0x416
        if(2 == iDrawEffectState)
        {
            fStartValue = 1.40;
            fDestValue = 1.80;
            fCurrentValue = fStartValue * 1.0 + FClamp(fPassingTime / fDrawEffectTime1 + fDrawEffectTime2, 0.0, 1.0);
            fCurrentValue = fCurrentValue + callAccelStep;
            fCurrentValue = FClamp(fCurrentValue, fStartValue, fDestValue);
            C.DrawColor.A = byte(255);
            // End:0x3de
            if(fCurrentValue >= fDestValue)
            {
                fCurrentValue = fDestValue;
                callAccelStep = 0.0;
                iDrawEffectState = 3;
            }
            fAddRatio = fCurrentValue - fDestValue / fStartValue - fDestValue + fFinalValue - fDestValue / fFinalValue;
        }
        // End:0x5db
        else
        {
            // End:0x543
            if(3 == iDrawEffectState)
            {
                fStartValue = 1.80;
                fDestValue = 1.60;
                fCurrentValue = fStartValue * 1.0 - FClamp(fPassingTime / fDrawEffectTime1 + fDrawEffectTime2 + fDrawEffectTime3, 0.0, 1.0);
                fCurrentValue = fCurrentValue - callAccelStep;
                fCurrentValue = FClamp(fCurrentValue, fDestValue, fStartValue);
                C.DrawColor.A = byte(255);
                // End:0x4d8
                if(fCurrentValue <= fDestValue)
                {
                    fCurrentValue = fDestValue;
                    callAccelStep = 0.0;
                }
                fAddRatio = fCurrentValue - fDestValue / fStartValue - fDestValue + fFinalValue - fDestValue / fFinalValue;
                // End:0x540
                if(fPassingTime > fDrawEffectTime1 + fDrawEffectTime2 + fDrawEffectTime3 + fDrawItemTime - fFadeOutTime)
                {
                    iDrawEffectState = 4;
                }
            }
            // End:0x5db
            else
            {
                // End:0x5db
                if(4 == iDrawEffectState)
                {
                    fCurrentValue = fFinalValue;
                    fDestValue = fFinalValue;
                    fFadeValue = fEndOfLife - Level.TimeSeconds;
                    fFadeValue = fFadeValue / fFadeOutTime;
                    C.DrawColor.A = byte(float(C.DrawColor.A) * FClamp(fFadeValue, 0.0, 1.0));
                    fAddRatio = 0.0;
                }
            }
        }
    }
    _PosY = 866.0 - float(72) * fAddRatio;
    fScale = fCurrentValue;
    WGiftItemPopBG.OffsetX = int(float(800) - float(318) * 0.50 * fScale);
    WGiftItemPopBG.OffsetY = int(_PosY);
    CalculateCoordinateEx(C, WGiftItemPopBG, 318.0 * fScale, 144.0 * fScale, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WGiftItemPopBG.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    WGiftItemPopBG2.OffsetX = int(float(800) - float(318) * 0.50 * fScale);
    WGiftItemPopBG2.OffsetY = int(_PosY);
    CalculateCoordinateEx(C, WGiftItemPopBG2, 318.0 * fScale, 33.0 * fScale, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WGiftItemPopBG2.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    C.BtrDrawTextJustifiedWithVolumeLine(lsGiftItem, 1, 0.0, _PosY + float(7) * fScale * _reY, 1600.0 * _reX, _PosY + float(27) * fScale * _reY, int(float(14) * _reY * fScale), color_Shadow);
    _PosY = _PosY + float(44) * fScale;
    WGiftItemBG.WidgetTexture = Material(DynamicLoadObject(strGiftItemBG, class'Material'));
    WGiftItemBG.OffsetX = int(float(800) - float(156) * 0.50 * fScale);
    WGiftItemBG.OffsetY = int(_PosY);
    CalculateCoordinateEx(C, WGiftItemBG, 156.0 * fScale, 85.0 * fScale, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WGiftItemBG.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    // End:0x96a
    if(cItemParam != none)
    {
        sItemDisplayName = cItemParam.strDisplayName;
    }
    // End:0x99c
    if(bGiftIsPoint)
    {
        sItemDisplayName = lsGiftPoint $ "( " $ string(qParam.RewardPoint) $ " )";
    }
    _PosY = float(WGiftItemBG.OffsetY);
    C.BtrDrawTextJustifiedWithVolumeLine(sItemDisplayName, 1, 0.0, _PosY + float(6) * fScale * _reY, 1600.0 * _reX, _PosY + float(21) * fScale * _reY, int(float(10) * _reY * fScale), color_Shadow);
    // End:0xa42
    if(cItemResParam != none)
    {
        sRes_Icon = cItemResParam.strRes_Icon;
    }
    // End:0xa7f
    else
    {
        // End:0xa7f
        if(bGiftIsPoint)
        {
            sRes_Icon = "Warfare_UI_Item.ShopIcon.Item_Item_FT_pt_bns";
        }
    }
    // End:0xb5a
    if(Len(sRes_Icon) > 0)
    {
        _PosX = float(WGiftItemBG.OffsetX) + float(2) * fScale;
        _PosY = float(WGiftItemBG.OffsetY) + float(25) * fScale;
        C.SetPos(_PosX * _reX, _PosY * _reY);
        mat = Material(DynamicLoadObject(sRes_Icon, class'Material'));
        C.DrawTile(mat, 152.0 * _reX * fScale, 50.0 * _reY * fScale, 0.0, 0.0, 152.0, 50.0);
    }
}

function float GetValueScaleDown(float fStartScale, float fDestScale, float fDrawTime)
{
    local float rValue;

    return rValue;
}

function float GetValueScaleUp(float fStartScale, float fDestScale, float fDrawTime)
{
    local float rValue;

    return rValue;
}

function DrawBattleAIBot(Canvas C)
{
    local CalCoordsW calW;
    local float fDrawTime;

    WQuestBG1.OffsetX = 1176;
    WQuestBG1.OffsetY = 400;
    CalculateCoordinateEx(C, WQuestBG1, 424.0, 64.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WQuestBG1.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    // End:0xe4
    if(iCurrent < iGoal)
    {
        fDrawTime = Level.TimeSeconds - fAIBotBeginTime;
    }
    // End:0xf6
    else
    {
        fDrawTime = fAIBotEndTime - fAIBotBeginTime;
    }
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine(lsAIBotTime $ ": " $ string(fDrawTime), 1, 1254.0 * _reX, float(WQuestBG1.OffsetY + 6) * _reY, 1.0, float(WQuestBG1.OffsetY + 6 + 25) * _reY, int(float(14) * _reY), color_Shadow);
    C.BtrDrawTextJustifiedWithVolumeLine(lsAIBotKillCount $ ": " $ string(iCurrent) $ "/" $ string(iGoal), 1, 1254.0 * _reX, float(WQuestBG1.OffsetY + 6 + 25 + 4) * _reY, 1.0, float(WQuestBG1.OffsetY + 6 + 25 + 4 + 25) * _reY, int(float(14) * _reY), color_Shadow);
}

function DrawNoticeExit(Canvas C)
{
    local CalCoordsW calW;

    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    CalculateCoordinateEx(C, WNoticeExitBG, 424.0, 31.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WNoticeExitBG.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    C.BtrDrawTextJustifiedWithVolumeLine(lsNoticeExit, 1, 1254.0 * _reX, 10.0 * _reY, 1.0, 29.0 * _reY, int(float(14) * _reY), color_Shadow);
}

function DrawQuest(Canvas C)
{
    local CalCoordsW calW;
    local int fY1, fY2;
    local float _iPosX, _iPosY;
    local string sProgress;

    // End:0x2d
    if(Len(SQuest) <= 0 && Len(sComment) <= 0 && Len(sComment2) <= 0)
    {
        return;
    }
    _iPosX = 346.0;
    _iPosY = 161.0;
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    WQuestBG1.OffsetX = 1600 / 2 - 1200 / 2;
    WQuestBG1.OffsetY = int(_iPosY);
    CalculateCoordinateEx(C, WQuestBG1, 1200.0, 119.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WQuestBG1.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    // End:0x35d
    if(bDrawKey)
    {
        CalculateCoordinateEx(C, WQuestBGKey, 558.0, 67.0, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WQuestBGKey.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
        // End:0x271
        if(WQuestKey.WidgetTexture != none)
        {
            CalculateCoordinateEx(C, WQuestKey, fKeyWidth, fKeyHight, calW);
            C.SetPos(calW.X1, calW.Y1);
            C.DrawTile(WQuestKey.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
        }
        // End:0x35d
        if(HudCDeathmatch(HudOwner).bBlinkState)
        {
            WKeyButtonBGBlink.OffsetX = WQuestKey.OffsetX - 2;
            WKeyButtonBGBlink.OffsetY = WQuestKey.OffsetY - 2;
            CalculateCoordinateEx(C, WKeyButtonBGBlink, fKeyWidth + float(4), fKeyHight + float(4), calW);
            C.SetPos(calW.X1, calW.Y1);
            C.DrawTile(WKeyButtonBGBlink.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
        }
    }
    // End:0x393
    if(Len(sComment2) > 0)
    {
        fY1 = int(float(182) * _reY);
        fY2 = int(float(217) * _reY);
    }
    // End:0x3b9
    else
    {
        fY1 = int(float(191) * _reY);
        fY2 = int(float(226) * _reY);
    }
    // End:0x3e7
    if(bDrawProgress)
    {
        sProgress = "(" $ string(iCurrent) $ "/" $ string(iGoal) $ ")";
    }
    C.SetDrawColor(byte(255), 209, 0, byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine(SQuest $ sProgress, 1, 0.0, float(fY1), 1600.0 * _reX, float(fY2), int(float(27) * _reY), color_Shadow);
    // End:0x486
    if(Len(sComment2) > 0)
    {
        fY1 = int(float(221) * _reY);
        fY2 = int(float(242) * _reY);
    }
    // End:0x4ac
    else
    {
        fY1 = int(float(232) * _reY);
        fY2 = int(float(253) * _reY);
    }
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine(sComment, 1, 0.0, float(fY1), 1600.0 * _reX, float(fY2), int(float(16) * _reY), color_Shadow);
    fY1 = int(float(243) * _reY);
    fY2 = int(float(264) * _reY);
    // End:0x58f
    if(Len(sComment2) > 0)
    {
        C.BtrDrawTextJustifiedWithVolumeLine(sComment2, 1, 0.0, float(fY1), 1600.0 * _reX, float(fY2), int(float(16) * _reY), color_Shadow);
    }
}

function DrawQuestComplete(Canvas C)
{
    local CalCoordsW calW;
    local int fY1, fY2;
    local float _iPosX, _iPosY, fDeltaTime;

    fDeltaTime = Level.TimeSeconds - fBeginMessageTime;
    // End:0x39
    if(fDeltaTime >= fMessageDrawTime + fFadeOutTime)
    {
        OnNextQuest();
        return;
    }
    // End:0x57
    if(Len(SQuest) <= 0 && Len(sComment) <= 0)
    {
        return;
    }
    _iPosX = 346.0;
    _iPosY = 161.0;
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    WQuestBG1.OffsetX = 1600 / 2 - 1200 / 2;
    WQuestBG1.OffsetY = int(_iPosY);
    CalculateCoordinateEx(C, WQuestBG1, 1200.0, 119.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WQuestBG1.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    fY1 = int(float(191) * _reY);
    fY2 = int(float(226) * _reY);
    C.SetDrawColor(byte(255), 209, 0, byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine(SQuest, 1, 0.0, float(fY1), 1600.0 * _reX, float(fY2), int(float(27) * _reY), color_Shadow);
    fY1 = int(float(232) * _reY);
    fY2 = int(float(253) * _reY);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine(sComment, 1, 0.0, float(fY1), 1600.0 * _reX, float(fY2), int(float(16) * _reY), color_Shadow);
}

function DrawBeginTutorial(Canvas C)
{
    local CalCoordsW calW;
    local int fY1, fY2;
    local float _iPosX, _iPosY, fDeltaTime;

    fDeltaTime = Level.TimeSeconds - fBeginMessageTime;
    // End:0x41
    if(fDeltaTime >= fMessageDrawTime + fFadeOutTime)
    {
        OnNextQuest();
        bDrawBeginTutorial = false;
        return;
    }
    _iPosX = 346.0;
    _iPosY = 161.0;
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    WQuestBG1.OffsetX = 1600 / 2 - 1200 / 2;
    WQuestBG1.OffsetY = int(_iPosY);
    CalculateCoordinateEx(C, WQuestBG1, 1200.0, 119.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WQuestBG1.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    fY1 = int(float(197) * _reY);
    fY2 = int(float(219) * _reY);
    C.BtrDrawTextJustifiedWithVolumeLine(SQuest, 1, 0.0, float(fY1), 1600.0 * _reX, float(fY2), int(float(17) * _reY), color_Shadow);
    fY1 = int(float(224) * _reY);
    fY2 = int(float(246) * _reY);
    C.BtrDrawTextJustifiedWithVolumeLine(sComment, 1, 0.0, float(fY1), 1600.0 * _reX, float(fY2), int(float(17) * _reY), color_Shadow);
}

auto state initial
{
    function BeginState()
    {
        // End:0x23
        if(Level.GetMatchMaker().BotTutorial)
        {
            GotoState('StartTutorial2');
        }
    }

    function EndState();

}

state QuestBase
{
    function BeginState()
    {
        ResetProgress();
        fKeyHight = 52.0;
        fKeyWidth = 52.0;
        bDrawKey = false;
        bDrawBGKey = false;
        bDrawProgress = false;
        IsFadeOut = false;
        WQuestKey.OffsetX = 774;
        WQuestKey.OffsetY = 294;
    }

    function Timer();
    function EndState()
    {
        ResetProgress();
    }

}

state StartTutorial2 extends QuestBase
{
    function BeginState()
    {
        local ShootTarget A;

        super.BeginState();
        OnBeginTutorial();
        DisableTriggerEvent('DoorMover', none, HudOwner.PawnOwner);
        DisableTriggerEvent('DoorMover2', none, HudOwner.PawnOwner);
        DisableTriggerEvent('DoorMover3', none, HudOwner.PawnOwner);
        DisableTriggerEvent('DoorMover4', none, HudOwner.PawnOwner);
        DisableTriggerEvent('DoorMover_Roket', none, HudOwner.PawnOwner);
        DisableTriggerEvent('ShootTarget', none, HudOwner.PawnOwner);
        // End:0xc9
        foreach DynamicActors(class'ShootTarget', A)
        {
            A.Disable('Trigger');                        
        }
        Level.GetLocalPlayerController().bGodMode = true;
    }

    function OnNextQuest()
    {
        GotoState('Q01_OnTarget');
        fMessageDrawTime = default.fMessageDrawTime;
        CheckStartTutorial();
    }

}

state Q01_OnTarget extends QuestBase
{
    function BeginState()
    {
        super.BeginState();
        iGoal = 4;
        SQuest = lsQOnFocus;
        sComment = lsCOnFocus;
        lsQComplete = lsQOnFocusEnd;
        lsNext = lsCOnFocusEnd;
        OnBeginMessage();
        iTutorialID = 1;
        OnTutorialResult(iTutorialID, iCurrent);
        bDrawProgress = true;
        TriggerEvent('LineOfSightTrigger', self, HudOwner.PawnOwner);
        TriggerEvent('MaterialSwitch1_D', self, HudOwner.PawnOwner);
        EnableShootTarget('ShootTarget4');
        CheckStartTutorial();
    }

    function OnQuest()
    {
        // End:0x13
        if(float(iProgress) >= 100.0)
        {
            return;
        }
        ++ iCurrent;
        iProgress = int(float(iCurrent / iGoal) * 100.0);
        switch(iCurrent)
        {
            // End:0x77
            case 1:
                EnableShootTarget('ShootTarget3');
                TriggerEvent('MaterialSwitch1_D', none, none);
                TriggerEvent('MaterialSwitch1_C', self, HudOwner.PawnOwner);
                // End:0x110
                break;
            // End:0xb1
            case 2:
                EnableShootTarget('ShootTarget2');
                TriggerEvent('MaterialSwitch1_C', none, none);
                TriggerEvent('MaterialSwitch1_B', self, HudOwner.PawnOwner);
                // End:0x110
                break;
            // End:0xeb
            case 3:
                EnableShootTarget('ShootTarget1');
                TriggerEvent('MaterialSwitch1_B', none, none);
                TriggerEvent('MaterialSwitch1_A', self, HudOwner.PawnOwner);
                // End:0x110
                break;
            // End:0x10d
            case 4:
                TriggerEvent('LineOfSightTrigger', none, none);
                TriggerEvent('MaterialSwitch1_A', none, none);
                // End:0x110
                break;
            // End:0xffff
            default:
                OnTutorialResult(iTutorialID, iCurrent);
                OnNextQuest();
    }

    function OnNextQuest()
    {
        // End:0x13
        if(iProgress >= 100)
        {
            GotoState('Q01_OnTargetEnd');
        }
    }

}

state Q01_OnTargetEnd extends QuestBase
{
    function BeginState()
    {
        super.BeginState();
        OnBeginMessage();
        OnCompleteQuest();
        BeginDrawItem();
        SQuest = lsQOnFocusEnd;
        sComment = lsCOnFocusEnd;
    }

    function OnNextQuest()
    {
        GotoState('Q02_MoveControllA');
    }

}

state Q02_MoveControllA extends QuestBase
{
    function BeginState()
    {
        super.BeginState();
        OnBeginMessage();
        SQuest = lsQMoveControlA;
        sComment = lsCMoveControlA;
        bDrawKey = true;
        GetKeyTexture("A", WQuestKey);
        vOldLocation = HudOwner.PawnOwner.Location;
        fMoveLength = 0.0;
        SetTimer(0.10, true);
        iTutorialID = 2;
        OnTutorialResult(iTutorialID, iCurrent);
    }

    function EndState()
    {
        iOldTutorialID = 2;
        super.EndState();
    }

    function Timer()
    {
        local Rotator LookDir;
        local Vector currentVelocity, X, Y, Z;
        local float Left;

        // End:0xce
        if(VSize(HudOwner.PawnOwner.Velocity) > float(0))
        {
            LookDir = HudOwner.PawnOwner.Rotation;
            GetAxes(LookDir, X, Y, Z);
            currentVelocity = Normal(HudOwner.PawnOwner.Velocity);
            Left = Y Dot currentVelocity;
            // End:0xb1
            if(Left < -0.10)
            {
                Movelength(HudOwner.PawnOwner.Location);
            }
            vOldLocation = HudOwner.PawnOwner.Location;
        }
    }

    function OnNextQuest()
    {
        GotoState('Q02_MoveControllD');
    }

}

state Q02_MoveControllD extends QuestBase
{
    function BeginState()
    {
        super.BeginState();
        OnBeginMessage();
        SQuest = lsQMoveControlD;
        sComment = lsCMoveControlD;
        bDrawKey = true;
        GetKeyTexture("D", WQuestKey);
        vOldLocation = HudOwner.PawnOwner.Location;
        fMoveLength = 0.0;
        SetTimer(0.10, true);
    }

    function Timer()
    {
        local Rotator LookDir;
        local Vector currentVelocity, X, Y, Z;
        local float Right;

        // End:0xce
        if(VSize(HudOwner.PawnOwner.Velocity) > float(0))
        {
            LookDir = HudOwner.PawnOwner.Rotation;
            GetAxes(LookDir, X, Y, Z);
            currentVelocity = Normal(HudOwner.PawnOwner.Velocity);
            Right = Y Dot currentVelocity;
            // End:0xb1
            if(Right > 0.10)
            {
                Movelength(HudOwner.PawnOwner.Location);
            }
            vOldLocation = HudOwner.PawnOwner.Location;
        }
    }

    function OnNextQuest()
    {
        GotoState('Q02_MoveControllS');
    }

}

state Q02_MoveControllS extends QuestBase
{
    function BeginState()
    {
        super.BeginState();
        OnBeginMessage();
        SQuest = lsQMoveControlS;
        sComment = lsCMoveControlS;
        bDrawKey = true;
        GetKeyTexture("S", WQuestKey);
        vOldLocation = HudOwner.PawnOwner.Location;
        fMoveLength = 0.0;
        SetTimer(0.10, true);
    }

    function Timer()
    {
        local Rotator LookDir;
        local Vector currentVelocity, X, Y, Z;
        local float back;

        // End:0xce
        if(VSize(HudOwner.PawnOwner.Velocity) > float(0))
        {
            LookDir = HudOwner.PawnOwner.Rotation;
            GetAxes(LookDir, X, Y, Z);
            currentVelocity = Normal(HudOwner.PawnOwner.Velocity);
            back = X Dot currentVelocity;
            // End:0xb1
            if(back < -0.10)
            {
                Movelength(HudOwner.PawnOwner.Location);
            }
            vOldLocation = HudOwner.PawnOwner.Location;
        }
    }

    function OnNextQuest()
    {
        GotoState('Q02_MoveControllW');
    }

}

state Q02_MoveControllW extends QuestBase
{
    function BeginState()
    {
        super.BeginState();
        OnBeginMessage();
        SQuest = lsQMoveControlW;
        sComment = lsCMoveControlW;
        lsQComplete = lsQMoveComplete;
        lsNext = lsCNext01;
        bDrawKey = true;
        GetKeyTexture("W", WQuestKey);
        iOldTutorialID = 1;
        iTutorialID = 2;
        vOldLocation = HudOwner.PawnOwner.Location;
        fMoveLength = 0.0;
        SetTimer(0.10, true);
    }

    function Timer()
    {
        local Rotator LookDir;
        local Vector currentVelocity, X, Y, Z;
        local float Forward;

        // End:0xfc
        if(VSize(HudOwner.PawnOwner.Velocity) > float(0))
        {
            LookDir = HudOwner.PawnOwner.Rotation;
            GetAxes(LookDir, X, Y, Z);
            currentVelocity = Normal(HudOwner.PawnOwner.Velocity);
            Forward = X Dot currentVelocity;
            // End:0xdf
            if(Forward > 0.10)
            {
                fMoveLength += VSize(HudOwner.PawnOwner.Location - vOldLocation);
                // End:0xdf
                if(fMoveLength > 300.0)
                {
                    SetTimer(0.0, false);
                    OnCompleteQuest();
                    BeginDrawItem();
                }
            }
            vOldLocation = HudOwner.PawnOwner.Location;
        }
    }

    function OnNextQuest()
    {
        GotoState('MoveTrainingField');
        EnableTriggerEvent('DoorMover', none, HudOwner.PawnOwner);
        TriggerEvent('DoorMover', none, HudOwner.PawnOwner);
        OnTutorialResult(iTutorialID, iCurrent, true);
        BeginDrawItem();
    }

}

state MoveTrainingField extends QuestBase
{
    function BeginState()
    {
        super.BeginState();
        OnBeginMessage();
        SQuest = lsQMoveTrainingField;
        sComment = lsCMoveTrainingField;
        bDrawKey = true;
        GetKeyTexture("Tab", WQuestKey);
        fKeyWidth = 82.0;
        WQuestKey.OffsetX = int(float(1600 / 2) - fKeyWidth / float(2));
    }

    function OnNextQuest()
    {
        GotoState('Q03_MoveWalking');
    }

}

state Q03_MoveWalking extends QuestBase
{
    function BeginState()
    {
        super.BeginState();
        OnBeginMessage();
        SQuest = lsQMoveWalking;
        sComment = lsCMoveWalking;
        iTutorialID = 3;
        OnTutorialResult(iTutorialID, iCurrent);
    }

    function OnNextQuest()
    {
        GotoState('Q03_MoveWalkingEnd');
        OnTutorialResult(iTutorialID, iCurrent, true);
        PlaySoundQuest();
        BeginDrawItem();
    }

}

state Q03_MoveWalkingEnd extends QuestBase
{
    function BeginState()
    {
        super.BeginState();
        OnBeginMessage();
        SQuest = lsQMoveWalkingEnd;
        sComment = lsCMoveWalkingEnd;
    }

    function OnNextQuest()
    {
        GotoState('Q04_MoveDucking');
    }

}

state Q04_MoveDucking extends QuestBase
{
    function BeginState()
    {
        super.BeginState();
        OnBeginMessage();
        SQuest = lsQMoveDucking;
        sComment = lsCMoveDucking;
        bDrawKey = true;
        GetKeyTexture("Ctrl", WQuestKey);
        fKeyWidth = 82.0;
        WQuestKey.OffsetX = int(float(1600 / 2) - fKeyWidth / float(2));
        iTutorialID = 4;
        OnTutorialResult(iTutorialID, iCurrent);
    }

    function OnNextQuest()
    {
        GotoState('Q04_MoveDuckingEnd');
        OnTutorialResult(iTutorialID, iCurrent, true);
        BeginDrawItem();
        PlaySoundQuest();
    }

}

state Q04_MoveDuckingEnd extends QuestBase
{
    function BeginState()
    {
        super.BeginState();
        OnBeginMessage();
        SQuest = lsQMoveDuckingEnd;
        sComment = "";
    }

    function OnNextQuest()
    {
        GotoState('Q05_MoveProne');
    }

}

state Q05_MoveProne extends QuestBase
{
    function BeginState()
    {
        super.BeginState();
        OnBeginMessage();
        SQuest = lsQMoveProne;
        sComment = lsCMoveProne;
        bDrawKey = true;
        GetKeyTexture("C", WQuestKey);
        WQuestKey.OffsetX = int(float(1600 / 2) - fKeyWidth / float(2));
        iTutorialID = 5;
        OnTutorialResult(iTutorialID, iCurrent);
    }

    function OnNextQuest()
    {
        OnTutorialResult(iTutorialID, iCurrent, true);
        GotoState('Q05_MoveProneEnd');
        BeginDrawItem();
        PlaySoundQuest();
    }

}

state Q05_MoveProneEnd extends QuestBase
{
    function BeginState()
    {
        super.BeginState();
        OnBeginMessage();
        SQuest = lsQMoveProneEnd;
        sComment = lsCMoveProneEnd;
        bDrawKey = true;
        GetKeyTexture("Space", WQuestKey);
        fKeyWidth = 82.0;
        WQuestKey.OffsetX = int(float(1600 / 2) - fKeyWidth / float(2));
    }

    function OnNextQuest()
    {
        GotoState('Q06_MoveJump');
    }

}

state Q06_MoveJump extends QuestBase
{
    function BeginState()
    {
        super.BeginState();
        OnBeginMessage();
        SQuest = lsQMoveJump;
        sComment = lsCMoveJump;
        bDrawKey = true;
        GetKeyTexture("Space", WQuestKey);
        fKeyWidth = 82.0;
        WQuestKey.OffsetX = int(float(1600 / 2) - fKeyWidth / float(2));
        iTutorialID = 6;
        OnTutorialResult(iTutorialID, iCurrent);
    }

    function OnNextQuest()
    {
        OnTutorialResult(iTutorialID, iCurrent, true);
        GotoState('Q06_MoveJumpEnd');
        BeginDrawItem();
        PlaySoundQuest();
    }

}

state Q06_MoveJumpEnd extends QuestBase
{
    function BeginState()
    {
        super.BeginState();
        OnBeginMessage();
        SQuest = lsQMoveJumpEnd;
        sComment = lsCMoveJumpEnd;
    }

    function OnNextQuest()
    {
        GotoState('Q07_MoveLadder');
    }

}

state Q07_MoveLadder extends QuestBase
{
    function BeginState()
    {
        super.BeginState();
        OnBeginMessage();
        SQuest = lsQMoveLadder;
        sComment = lsCMoveLadder;
        iTutorialID = 7;
        OnTutorialResult(iTutorialID, iCurrent);
    }

    function OnNextQuest()
    {
        OnTutorialResult(iTutorialID, iCurrent, true);
        GotoState('Q07_MoveLadderEnd');
        BeginDrawItem();
        PlaySoundQuest();
    }

}

state Q07_MoveLadderEnd extends QuestBase
{
    function BeginState()
    {
        super.BeginState();
        OnBeginMessage();
        SQuest = lsQMoveLadderEnd;
        sComment = lsCMoveLadderEnd;
    }

    function OnNextQuest()
    {
        GotoState('Q08_JumpDown');
        Level.GetLocalPlayerController().bGodMode = false;
    }

}

state Q08_JumpDown extends QuestBase
{
    function BeginState()
    {
        super.BeginState();
        OnBeginMessage();
        SQuest = lsQJumpDown;
        sComment = lsCJumpDown;
        iTutorialID = 8;
    }

    function OnNextQuest()
    {
        GotoState('Q08_JumpDownEnd');
    }

}

state Q08_JumpDownEnd extends QuestBase
{
    function BeginState()
    {
        super.BeginState();
        OnBeginMessage();
        SQuest = lsQJumpDownEnd;
        sComment = lsCJumpDownEnd;
    }

    function OnNextQuest()
    {
        GotoState('Q09_RecoveryHealth');
    }

}

state Q09_RecoveryHealth extends QuestBase
{
    function BeginState()
    {
        super.BeginState();
        OnBeginMessage();
        SQuest = lsQRecoveryHealth;
        sComment = lsCRecoveryHealth;
        iTutorialID = 9;
        OnTutorialResult(iTutorialID, iCurrent);
        Level.GetLocalPlayerController().bGodMode = true;
    }

    function OnPickUpHealthPack()
    {
        OnTutorialResult(iTutorialID, iCurrent, true);
        GotoState('Q09_RecoveryHealthEnd');
        BeginDrawItem();
        PlaySoundQuest();
    }

    function OnNextQuest();

}

state Q09_RecoveryHealthEnd extends QuestBase
{
    function BeginState()
    {
        super.BeginState();
        OnBeginMessage();
        lsQComplete = lsQRecoveryHealthEnd;
        lsNext = lsCRecoveryHealthEnd;
        OnCompleteQuest();
    }

    function OnNextQuest()
    {
        GotoState('Q10_MoveSprint');
    }

}

state Q10_MoveSprint extends QuestBase
{
    function BeginState()
    {
        super.BeginState();
        OnBeginMessage();
        SQuest = lsQMoveSprint;
        sComment = lsCMoveSprint;
        bDrawProgress = true;
        bDrawKey = true;
        GetKeyTexture("Shift", WQuestKey);
        fKeyWidth = 82.0;
        WQuestKey.OffsetX = int(float(1600 / 2) - fKeyWidth / float(2));
        iGoal = 3;
        iTutorialID = 10;
        OnTutorialResult(iTutorialID, iCurrent);
    }

    function OnRunSprint(int iSec)
    {
        // End:0x11
        if(iCurrent >= iGoal)
        {
            return;
        }
        iCurrent += iSec;
        // End:0x37
        if(iCurrent > iGoal)
        {
            iCurrent = iGoal;
        }
        // End:0x4c
        if(iCurrent >= iGoal)
        {
            OnNextQuest();
        }
    }

    function OnNextQuest()
    {
        OnTutorialResult(iTutorialID, iCurrent, true);
        GotoState('Q10_MoveSprintEnd');
        BeginDrawItem();
        PlaySoundQuest();
    }

}

state Q10_MoveSprintEnd extends QuestBase
{
    function BeginState()
    {
        super.BeginState();
        SQuest = lsQMoveSprintEnd;
        sComment = lsCMoveSprintEnd;
        EnableTriggerEvent('DoorMover2', none, HudOwner.PawnOwner);
        TriggerEvent('DoorMover2', none, HudOwner.PawnOwner);
    }

    function OnNextQuest()
    {
        GotoState('Q11_DoFire');
    }

}

state Q11_DoFire extends QuestBase
{
    function BeginState()
    {
        super.BeginState();
        SQuest = lsQDoFire;
        sComment = lsCDoFire;
        lsQComplete = lsQDoFireEnd;
        lsNext = lsCDoFireEnd;
        iGoal = 5;
        iTutorialID = 11;
        bDrawProgress = true;
        OnTutorialResult(iTutorialID, iCurrent);
        OnBeginMessage();
        bDrawKey = true;
        WQuestKey = WQuestKeyLeftMouse;
        fKeyHight = 64.0;
        fKeyWidth = 64.0;
        WQuestKey.OffsetX = int(float(1600 / 2) - fKeyWidth / float(2));
    }

    function OnQuest()
    {
        // End:0x11
        if(iCurrent >= iGoal)
        {
            return;
        }
        iCurrent += 1;
        OnTutorialResult(iTutorialID, iCurrent, iCurrent >= iGoal);
        // End:0x92
        if(iCurrent >= iGoal)
        {
            OnCompleteQuest();
            GetKeyTexture("R", WQuestKey);
            fKeyWidth = 52.0;
            WQuestKey.OffsetX = int(float(1600 / 2) - fKeyWidth / float(2));
            BeginDrawItem();
        }
    }

    function OnNextQuest()
    {
        GotoState('Q12_DoFireAim');
    }

}

state Q12_DoFireAim extends QuestBase
{
    function BeginState()
    {
        super.BeginState();
        SQuest = lsQDoFireAim;
        sComment = lsCDoFireAim;
        lsQComplete = lsQDoFireAimEnd;
        lsNext = lsCDoFireAimEnd;
        iGoal = 10;
        iTutorialID = 12;
        bDrawProgress = true;
        OnBeginMessage();
        OnTutorialResult(iTutorialID, iCurrent);
        TriggerEvent('AimMover', none, HudOwner.PawnOwner);
        bDrawKey = true;
        WQuestKey = WQuestKeyRightMouse;
        fKeyHight = 64.0;
        fKeyWidth = 64.0;
        WQuestKey.OffsetX = int(float(1600 / 2) - fKeyWidth / float(2));
        SetTimer(0.50, true);
    }

    function OnQuest()
    {
        // End:0x11
        if(iCurrent >= iGoal)
        {
            return;
        }
        iCurrent += 1;
        OnTutorialResult(iTutorialID, iCurrent, iCurrent >= iGoal);
        // End:0x54
        if(iCurrent >= iGoal)
        {
            OnCompleteQuest();
            BeginDrawItem();
        }
    }

    function OnNextQuest()
    {
        SetTimer(0.0, false);
        EnableTriggerEvent('DoorMover3', none, HudOwner.PawnOwner);
        TriggerEvent('DoorMover3', none, HudOwner.PawnOwner);
        GotoState('MoveTrainingField2');
    }

    function Timer()
    {
        // End:0x39
        if(!wGun(HudOwner.PawnOwner.Weapon).IsAiming())
        {
            WQuestKey = WQuestKeyRightMouse;
        }
        // End:0x44
        else
        {
            WQuestKey = WQuestKeyLeftMouse;
        }
    }

}

state MoveTrainingField2 extends QuestBase
{
    function BeginState()
    {
        super.BeginState();
        SQuest = lsQMoveTrainingField2;
        sComment = lsCMoveTrainingField2;
        OnBeginMessage();
    }

    function OnNextQuest()
    {
        GotoState('Q13_DoFireMelee');
    }

}

state Q13_DoFireMelee extends QuestBase
{
    function BeginState()
    {
        super.BeginState();
        SQuest = lsQDoFireMelee;
        sComment = lsCDoFireMelee;
        bDrawProgress = true;
        bDrawKey = true;
        GetKeyTexture("E", WQuestKey);
        WQuestKey.OffsetX = int(float(1600 / 2) - fKeyWidth / float(2));
        iGoal = 2;
        iTutorialID = 13;
        OnTutorialResult(iTutorialID, iCurrent);
    }

    function OnQuest()
    {
        // End:0x11
        if(iCurrent >= iGoal)
        {
            return;
        }
        iCurrent += 1;
        OnTutorialResult(iTutorialID, iCurrent, iCurrent >= iGoal);
        // End:0x5b
        if(iCurrent >= iGoal)
        {
            GotoState('Q13_DoFireMeleeEnd');
            BeginDrawItem();
            PlaySoundQuest();
        }
    }

}

state Q13_DoFireMeleeEnd extends QuestBase
{
    function BeginState()
    {
        super.BeginState();
        SQuest = lsQDoFireMeleeEnd;
        sComment = lsCDoFireMeleeEnd;
        OnBeginMessage();
    }

    function OnNextQuest()
    {
        GotoState('Q14_PickupRocketLauncher');
    }

}

state Q14_PickupRocketLauncher extends QuestBase
{
    function BeginState()
    {
        super.BeginState();
        SQuest = lsQPickUpRocketLauncher;
        sComment = lsCPickUpRocketLauncher;
        bDrawKey = true;
        GetKeyTexture("F", WQuestKey);
        WQuestKey.OffsetX = int(float(1600 / 2) - fKeyWidth / float(2));
        OnBeginMessage();
        Level.GetLocalPlayerController().bGodMode = true;
        iTutorialID = 14;
    }

    function OnQuest()
    {
        GotoState('Q15_DoFireRocketLauncher');
    }

    function OnNextQuest();

}

state Q15_DoFireRocketLauncher extends QuestBase
{
    function BeginState()
    {
        super.BeginState();
        SQuest = lsQDoFireRocketLauncher;
        sComment = lsCDoFireRocketLauncher;
        bDrawKey = true;
        WQuestKey = WQuestKeyLeftMouse;
        fKeyWidth = 64.0;
        WQuestKey.OffsetX = int(float(1600 / 2) - fKeyWidth / float(2));
        OnBeginMessage();
        iTutorialID = 15;
        OnTutorialResult(iTutorialID, iCurrent);
    }

    function OnQuest()
    {
        OnTutorialResult(iTutorialID, iCurrent, true);
        BeginDrawItem();
        PlaySoundQuest();
        TriggerEvent('MaterialSwitch10', none, none);
        GotoState('Q15_DoFireRocketLauncherEnd');
    }

}

state Q15_DoFireRocketLauncherEnd extends QuestBase
{
    function BeginState()
    {
        super.BeginState();
        SQuest = lsQDoFireRocketLauncherEnd;
        sComment = lsCDoFireRocketLauncherEnd;
        OnBeginMessage();
        EnableTriggerEvent('DoorMover_Roket', none, HudOwner.PawnOwner);
        TriggerEvent('DoorMover_Roket', none, HudOwner.PawnOwner);
    }

    function OnNextQuest()
    {
        GotoState('Q16_DoThrowingWeapon');
    }

}

state Q16_DoThrowingWeapon extends QuestBase
{
    function BeginState()
    {
        super.BeginState();
        SQuest = lsQDoThrowingWeapon;
        sComment = lsCDoThrowingWeapon;
        lsQComplete = lsQDoThrowingWeaponEnd;
        lsNext = lsQDoThrowingWeaponEnd;
        iGoal = 1;
        iTutorialID = 16;
        bDrawKey = true;
        GetKeyTexture("4", WQuestKey);
        WQuestKey.OffsetX = int(float(1600 / 2) - fKeyWidth / float(2));
        OnTutorialResult(iTutorialID, iCurrent);
        OnBeginMessage();
        wPawn(Level.GetLocalPlayerController().Pawn).AddDefaultInventory();
        Level.GetLocalPlayerController().Pawn.SetInfiniteAmmoTutorial(false, 999);
    }

    function OnQuest()
    {
        // End:0x11
        if(iCurrent >= iGoal)
        {
            return;
        }
        iCurrent += 1;
        OnTutorialResult(iTutorialID, iCurrent, iCurrent >= iGoal);
        OnNextQuest();
    }

    function OnNextQuest()
    {
        // End:0x2f
        if(iCurrent >= iGoal)
        {
            TriggerEvent('MaterialSwitch3', none, none);
            BeginDrawItem();
            PlaySoundQuest();
            GotoState('MoveTrainingField3');
        }
    }

}

state MoveTrainingField3 extends QuestBase
{
    function BeginState()
    {
        super.BeginState();
        SQuest = lsQDoThrowingWeaponEnd;
        sComment = lsCDoThrowingWeaponEnd;
        OnBeginMessage();
        EnableTriggerEvent('DoorMover4', none, HudOwner.PawnOwner);
        TriggerEvent('DoorMover4', none, HudOwner.PawnOwner);
    }

    function OnNextQuest()
    {
        GotoState('Q17_BattleAIBot');
    }

}

state Q17_BattleAIBot extends QuestBase
{
    function BeginState()
    {
        super.BeginState();
        OnBeginMessage();
        SQuest = lsQBattleAIBot;
        sComment = lsCBattleAIBot;
        lsQComplete = lsQBattleAIBotEnd;
        lsNext = lsCBattleAIBotEnd;
        bDrawProgress = true;
        iGoal = 20;
        iTutorialID = 17;
        OnTutorialResult(iTutorialID, iCurrent);
        Level.GetLocalPlayerController().bGodMode = true;
        DeathMatch(Level.Game).AddwAIBot("3", "1", "WGame.wAIBot", "1");
        fAIBotBeginTime = Level.TimeSeconds;
        bAIBotScore = !Level.GetIsServiceBuild();
        Level.GetLocalPlayerController().Pawn.SetInfiniteAmmoTutorial(false, 2);
    }

    function OnQuest();
    function OnKill3Enemy()
    {
        // End:0x11
        if(iCurrent >= iGoal)
        {
            return;
        }
        ++ iCurrent;
        OnTutorialResult(iTutorialID, iCurrent, iCurrent >= iGoal);
        // End:0x95
        if(iCurrent >= iGoal)
        {
            OnBeginMessage();
            OnCompleteQuest();
            BeginDrawItem();
            fMessageDrawTime = 6.0;
            fAIBotEndTime = Level.TimeSeconds;
            DeathMatch(Level.Game).Killaibots();
        }
    }

    function OnNextQuest()
    {
        bAIBotScore = false;
        GotoState('QuitTutorial2');
    }

}

state QuitTutorial2 extends QuestBase
{
    function BeginState()
    {
        super.BeginState();
        OnEndMessage();
    }

    function OnEndMessage()
    {
        bDrawMessage = false;
        bDrawMessage_QuestComplete = false;
        // End:0x3c
        if(HudOwner.PlayerOwner != none)
        {
            HudOwner.PlayerOwner.ScriptResetInput();
        }
        Level.GetLocalPlayerController().bGodMode = false;
        Level.GetMatchMaker().bCompletedBotTutorial = true;
        HudOwner.PlayerOwner.ConsoleCommand("ShowTutorialEndWindow");
    }

}

defaultproperties
{
    lsStartComment="You will receive basic combat training."
    lsStartComment2="Carefully read and follow the instructions to finish basic training."
    lsQOnFocus="Identify all 4 targets using the mouse."
    lsCOnFocus="Look around by moving the mouse."
    lsQOnFocusEnd="Identification complete."
    lsQMoveControlA="Move left."
    lsCMoveControlA="Press [A]."
    lsQMoveControlD="Move right."
    lsCMoveControlD="Press [D]."
    lsQMoveControlW="Move forwards."
    lsCMoveControlW="Press [W]."
    lsQMoveControlS="Move backwards."
    lsCMoveControlS="Press [S]."
    lsQMoveControlQ="Basic movement controls complete."
    lsCMoveControlQ="Follow the arrows to the training field."
    lsQMoveTrainingField="Follow the arrows to the training field."
    lsCMoveTrainingField="Open the map by holding the [Tab] key."
    lsQMoveComplete="Basic movement controls complete."
    lsQMoveWalking="Navigate through the obstacles."
    lsCMoveWalking="Use the keyboard and mouse together to move freely."
    lsQMoveWalkingEnd="Navigate through the obstacles."
    lsQMoveDucking="Navigate under obstacles by crouching."
    lsCMoveDucking="Hold [Ctrl] to crouch."
    lsQMoveDuckingEnd="Moving while crouching complete."
    lsQMoveProne="Crawl underneath the razor wire."
    lsCMoveProne="Press [C] to lay prone."
    lsQMoveProneEnd="Crawling complete."
    lsCMoveProneEnd="Press [Space Bar] to stand up."
    lsQMoveJump="Jump over the obstacles."
    lsCMoveJump="Press [Space Bar] to jump."
    lsQMoveJumpEnd="Jumping over obstacle complete."
    lsQMoveLadder="Climb the ladder."
    lsCMoveLadder="To climb a ladder, face and look up the ladder, and move forward (push W)."
    lsQMoveLadderEnd="Climbing ladders complete."
    lsCMoveLadderEnd="Jump down."
    lsQJumpDown="Ladder training complete."
    lsCJumpDown="Jump down."
    lsQJumpDownEnd="Falling complete."
    lsCJumpDownEnd="Heal yourself by picking up a health pack."
    lsQRecoveryHealth="Heal yourself by picking up a health pack."
    lsCRecoveryHealth="Falling causes damage. Use a a health pack to recover."
    lsQRecoveryHealthEnd="Recovering complete."
    lsQMoveSprint="Sprint for 3 seconds."
    lsCMoveSprint="Sprint by pressing [Shift] while moving."
    lsQMoveSprintEnd="Sprinting complete."
    lsCMoveSprintEnd="Follow the arrows to the training field."
    lsQDoFire="Shoot 5 targets with normal fire."
    lsCDoFire="Fire normally with left-click."
    lsQDoFireEnd="Normal firing complete."
    lsCDoFireEnd="Press [R] to reload."
    lsQDoFireAim="Shoot 10 targets with aimed shots."
    lsCDoFireAim="Firing while aiming increases your accuracy."
    lsQDoFireAimEnd="Aiming training complete."
    lsCDoFireAimEnd="Follow the arrows to the ballistics range."
    lsQDoFireMelee="Destroy two targets with melee attacks."
    lsCDoFireMelee="Press [E] when next to your target."
    lsQDoFireMeleeEnd="Melee attacks complete."
    lsCDoFireMeleeEnd="Follow the arrows to the training field."
    lsQMoveTrainingField2="Follow the arrows to the training field."
    lsCMoveTrainingField2="Follow the arrows to the rocket launcher range."
    lsQPickUpRocketLauncher="Pick up the AT-4."
    lsCPickUpRocketLauncher="Approach the AT-4 and press [F]."
    lsQDoFireRocketLauncher="Shoot the target with the AT-4."
    lsCDoFireRocketLauncher="The explosion caused by rockets can also damage you. Use caution when firing at nearby targets."
    lsQDoFireRocketLauncherEnd="Rocket launcher training complete."
    lsCDoFireRocketLauncherEnd="Follow the arrows to the ballistics range."
    lsQMoveTrainingField3="Follow the arrows to the training field."
    lsCMoveTrainingField3="Follow the arrows to the ballistics range."
    lsQDoThrowingWeapon="Throw a grenade into the building."
    lsCDoThrowingWeapon="Press [4] to switch to grenades."
    lsQDoThrowingWeaponEnd="Ballistics training complete."
    lsCDoThrowingWeaponEnd="Follow the arrows to the live-fire range."
    lsQBattleAIBot="Live-fire training"
    lsCBattleAIBot="Train your firing skills by shooting bots."
    lsQBattleAIBotEnd="Live-fire training complete."
    lsCBattleAIBotEnd="You can repeat basic training at any time."
    lsAIBotTime="Elapsed Time"
    lsAIBotKillCount="Enemy Kills"
    lsGiftPoint="Points"
    aQuestID[0]=9001
    aQuestID[1]=9002
    aQuestID[2]=9003
    aQuestID[3]=9004
    aQuestID[4]=9005
    aQuestID[5]=9006
    aQuestID[6]=9007
    aQuestID[7]=9008
    aQuestID[8]=9009
    aQuestID[9]=9010
    aQuestID[10]=9011
    aQuestID[11]=9012
    aQuestID[12]=9013
    aQuestID[13]=9014
    aQuestID[14]=9015
    aQuestID[15]=9016
    aQuestID[16]=9017
    fDrawItemTime=2.0
    fDrawEffectTime1=0.40
    fDrawEffectTime2=0.20
    fDrawEffectTime3=0.10
    fFadeOutTime=0.50
    WGiftItemPopBG=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_back_3',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=1024,Y2=4),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=739,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WGiftItemPopBG2=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_back_3',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=1024,Y2=4),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=746,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WGiftItemBG=(WidgetTexture=Texture'Warfare_GP_UI_UI.Store.list_item_store_n',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=156,Y2=85),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=783,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    lsGiftItem="Item Acquired"
    strGiftItemBG="Warfare_GP_UI_UI.list_item_store_n"
    strRes_Icon="Warfare_GP_UI_Item.ShopIcon.Item_Item_FT_pt_bns"
    WNoticeExitBG=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_tutorial_ESCbg',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=424,Y2=31),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=1176,OffsetY=4,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    lsNoticeExit="Press ESC to leave the tutorial."
    fMessageDrawTime=1.50
    WQuestBG1=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_tutorial_quest_bg1',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=908,Y2=119),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=346,OffsetY=161,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WQuestBGKey=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_tutorial_quest_bg2',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=558,Y2=67),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=521,OffsetY=287,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WQuestKeyMouse=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_keyboard_2',RenderStyle=5,TextureCoords=(X1=439,Y1=160,X2=503,Y2=224),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=768,OffsetY=289,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WQuestKeyLeftMouse=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_keyboard_2',RenderStyle=5,TextureCoords=(X1=312,Y1=160,X2=376,Y2=224),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=768,OffsetY=289,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WQuestKeyRightMouse=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_keyboard_2',RenderStyle=5,TextureCoords=(X1=376,Y1=160,X2=440,Y2=224),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=768,OffsetY=289,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
}