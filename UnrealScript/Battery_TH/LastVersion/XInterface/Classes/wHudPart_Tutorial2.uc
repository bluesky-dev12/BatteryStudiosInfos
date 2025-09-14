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
var byte Grade_BasicMovement;
var byte Grade_AdvancedMovement;
var byte Grade_Shooting;
var byte Grade_Grenade;
var byte Grade_Battle;
var float ResultGrade;
var float fElapsedTime_BasicMovement;
var float fElapsedTime_AdvancedMovement;
var float fElapsedTime_Shooting;
var float fElapsedTime_Grenade;
var float fElapsedTime_Battle;
var float fCheckStartTime_Basic;
var float fCheckStartTime_Advanced;
var float fCheckStartTime_Shooting;
var float fCheckStartTime_Grenade;
var float fCheckStartTime_Battle;
//var delegate<OnTutorialResult> __OnTutorialResult__Delegate;

function OnQuest()
{
    //return;    
}

delegate OnTutorialResult(int iTutorialID, int iCurrent, optional bool bCompleted)
{
    //return;    
}

function TutorialEvent(coerce string S, optional name Type, optional name reserv)
{
    // End:0x4E
    if(((((IsInState('Q02_MoveControllA') || IsInState('Q02_MoveControllD')) || IsInState('Q02_MoveControllW')) || IsInState('Q02_MoveControllS')) || IsInState('Q09_RecoveryHealthEnd')) || IsInState('Q17_BattleAIBot'))
    {
        return;
    }
    switch(Type)
    {
        // End:0x5D
        case 'TutorialEventBegin':
        // End:0x7B
        case 'TutorialEventEnd':
            OnNextQuest();
            iTriggerID = int(S);
            // End:0x7E
            break;
        // End:0xFFFF
        default:
            break;
    }
    switch(S)
    {
        // End:0xC7
        case string('OnNextQuest'):
            OnNextQuest();
            Log((string(self) $ "/ OnNextQuest() TutorialID : ") $ string(iTutorialID));
            // End:0x10C
            break;
        // End:0x109
        case string('OnQuest'):
            OnQuest();
            Log((string(self) $ "/ OnQuest()     TutorialID : ") $ string(iTutorialID));
            // End:0x10C
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
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
    foreach DynamicActors(Class'Engine.Mover', A, EventName)
    {
        A.DisableTrigger();
        Log(string(self) $ " DisableTrigger()");        
    }    
    return A;
    //return;    
}

function Mover EnableTriggerEvent(name EventName, Actor Other, Pawn EventInstigator)
{
    local Mover A;

    // End:0x11
    if(EventName == 'None')
    {
        return none;
    }
    // End:0x4F
    foreach DynamicActors(Class'Engine.Mover', A, EventName)
    {
        A.EnableTrigger();
        Log(string(self) $ " EnableTrigger()");        
    }    
    return A;
    //return;    
}

function Initialize(HudBase myOwner, LevelInfo Level)
{
    super.Initialize(myOwner, Level);
    //return;    
}

function ResetProgress()
{
    iGoal = 0;
    iCurrent = 0;
    iProgress = 0;
    //return;    
}

function OnBeginTutorial()
{
    fBeginMessageTime = Level.TimeSeconds;
    bDrawMessage = false;
    bDrawMessage_QuestComplete = false;
    bDrawBeginTutorial = true;
    fMessageDrawTime = 5.0000000;
    SQuest = lsStartComment;
    sComment = lsStartComment2;
    //return;    
}

function BeginDrawItem()
{
    // End:0x0D
    if(iTutorialID < 1)
    {
        return;
    }
    bNoUpdate = iStartTutorialID > iTutorialID;
    // End:0xCC
    if((iOldTutorialID != iTutorialID) && !bNoUpdate)
    {
        iCurrentQuestID = aQuestID[iTutorialID - 1];
        Level.GetMatchMaker().UpdateTutorial(iCurrentQuestID, 1);
        fBeginDrawItem = Level.TimeSeconds;
        fEndOfLife = ((((Level.TimeSeconds + fDrawEffectTime1) + fDrawEffectTime2) + fDrawEffectTime3) + fDrawItemTime) + fFadeOutTime;
        bDrawItem = true;
        iDrawEffectState = 1;        
    }
    else
    {
        bDrawItem = false;
    }
    iOldTutorialID = iTutorialID;
    //return;    
}

function CheckStartTutorial()
{
    local int i;

    iStartQuestID = Level.GetMatchMaker().GetNextQuestID();
    // End:0xA0
    if(iStartQuestID > 0)
    {
        i = 0;
        J0x31:

        // End:0x98 [Loop If]
        if(i < 17)
        {
            // End:0x76
            if(aQuestID[i] == iStartQuestID)
            {
                iStartTutorialID = i + 1;
                OnTutorialResult(i + 1, 0);
                // [Explicit Break]
                goto J0x98;
            }
            OnTutorialResult(i + 1, iCurrent, true);
            i++;
            // [Loop Continue]
            goto J0x31;
        }
        J0x98:

        bNoUpdate = true;
    }
    //return;    
}

function GotoTutorial(int iQuestID)
{
    switch(iQuestID)
    {
        // End:0x19
        case 9001:
            GotoState('OnTarget');
            // End:0x13C
            break;
        // End:0x2B
        case 9002:
            GotoState('MoveControllA');
            // End:0x13C
            break;
        // End:0x3D
        case 9003:
            GotoState('MoveWalking');
            // End:0x13C
            break;
        // End:0x4F
        case 9004:
            GotoState('MoveDucking');
            // End:0x13C
            break;
        // End:0x61
        case 9005:
            GotoState('MoveProne');
            // End:0x13C
            break;
        // End:0x73
        case 9006:
            GotoState('MoveJump');
            // End:0x13C
            break;
        // End:0x85
        case 9007:
            GotoState('MoveLadder');
            // End:0x13C
            break;
        // End:0x97
        case 9008:
            GotoState('MoveJumpDown');
            // End:0x13C
            break;
        // End:0xA9
        case 9009:
            GotoState('RecoveryHealth');
            // End:0x13C
            break;
        // End:0xBB
        case 9010:
            GotoState('MoveSprint');
            // End:0x13C
            break;
        // End:0xCD
        case 9011:
            GotoState('DoFire');
            // End:0x13C
            break;
        // End:0xDF
        case 9012:
            GotoState('DoFireAim');
            // End:0x13C
            break;
        // End:0xF1
        case 9013:
            GotoState('DoFireMelee');
            // End:0x13C
            break;
        // End:0x103
        case 9014:
            GotoState('PickupRocketLauncher');
            // End:0x13C
            break;
        // End:0x115
        case 9015:
            GotoState('DoFireRocketLauncher');
            // End:0x13C
            break;
        // End:0x127
        case 9016:
            GotoState('DoThrowingWeapon');
            // End:0x13C
            break;
        // End:0x139
        case 9017:
            GotoState('BattleAIBot');
            // End:0x13C
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function EnableShootTarget(name eventTag)
{
    local ShootTarget A;

    // End:0x26
    foreach DynamicActors(Class'UnrealGame.ShootTarget', A, eventTag)
    {
        A.Enable('Trigger');        
    }    
    //return;    
}

function Movelength(Vector vLocation)
{
    fMoveLength += VSize(vLocation - vOldLocation);
    // End:0x2A
    if(fMoveLength > 300.0000000)
    {
        OnNextQuest();
    }
    //return;    
}

function CallEvent(optional bool ItemCheck, optional int iReservation1, optional int iReservation2)
{
    super.CallEvent(ItemCheck, iReservation1, iReservation2);
    //return;    
}

event Trigger(Actor Other, Pawn EventInstigator)
{
    //return;    
}

function CalcBasicMovementGrade()
{
    fElapsedTime_BasicMovement = Level.TimeSeconds - fCheckStartTime_Basic;
    // End:0x35
    if(fElapsedTime_BasicMovement > 30.0000000)
    {
        Grade_BasicMovement = 1;        
    }
    else
    {
        // End:0x4F
        if(fElapsedTime_BasicMovement > 19.0000000)
        {
            Grade_BasicMovement = 2;            
        }
        else
        {
            Grade_BasicMovement = 3;
        }
    }
    //return;    
}

function CalcAdvancedMovementGrade()
{
    fElapsedTime_AdvancedMovement = Level.TimeSeconds - fCheckStartTime_Advanced;
    // End:0x35
    if(fElapsedTime_AdvancedMovement > 55.0000000)
    {
        Grade_AdvancedMovement = 1;        
    }
    else
    {
        // End:0x4F
        if(fElapsedTime_AdvancedMovement > 41.0000000)
        {
            Grade_AdvancedMovement = 2;            
        }
        else
        {
            Grade_AdvancedMovement = 3;
        }
    }
    //return;    
}

function CalcShootingGrade()
{
    self.fElapsedTime_Shooting = Level.TimeSeconds - fCheckStartTime_Shooting;
    // End:0x3A
    if(fElapsedTime_Shooting > 35.0000000)
    {
        Grade_Shooting = 1;        
    }
    else
    {
        // End:0x54
        if(fElapsedTime_Shooting > 21.0000000)
        {
            Grade_Shooting = 2;            
        }
        else
        {
            Grade_Shooting = 3;
        }
    }
    //return;    
}

function int CalcGrenadeGrade()
{
    fElapsedTime_Grenade = Level.TimeSeconds - fCheckStartTime_Grenade;
    // End:0x35
    if(fElapsedTime_Grenade > 30.0000000)
    {
        Grade_Grenade = 1;        
    }
    else
    {
        // End:0x4F
        if(fElapsedTime_Grenade > 11.0000000)
        {
            Grade_Grenade = 2;            
        }
        else
        {
            Grade_Grenade = 3;
        }
    }
    //return;    
}

function CalcBotBattleGrade()
{
    local float fElapsedTime_BotBattle;

    fElapsedTime_BotBattle = fAIBotEndTime - fAIBotBeginTime;
    // End:0x2C
    if(fElapsedTime_BotBattle > 95.0000000)
    {
        Grade_Battle = 1;        
    }
    else
    {
        // End:0x46
        if(fElapsedTime_BotBattle > 78.0000000)
        {
            Grade_Battle = 2;            
        }
        else
        {
            Grade_Battle = 3;
        }
    }
    //return;    
}

function DrawTestGrade(Canvas C)
{
    local CalCoordsW calW;
    local float fDrawTime;
    local int iY, iHeight, iSpacing;
    local string strGrade;

    WQuestBG1.OffsetX = 1176;
    WQuestBG1.OffsetY = 400;
    iSpacing = 6;
    iHeight = 25;
    iY = WQuestBG1.OffsetY + iSpacing;
    strGrade = "";
    // End:0x276
    if(fCheckStartTime_Basic > float(0))
    {
        CalculateCoordinateEx(C, WQuestBG1, 424.0000000, 64.0000000, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WQuestBG1.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
        // End:0x11E
        if(fElapsedTime_BasicMovement == float(0))
        {
            fDrawTime = Level.TimeSeconds - fCheckStartTime_Basic;            
        }
        else
        {
            fDrawTime = fElapsedTime_BasicMovement;
            switch(Grade_BasicMovement)
            {
                // End:0x141
                case 1:
                    strGrade = "C";
                    // End:0x166
                    break;
                // End:0x152
                case 2:
                    strGrade = "B";
                    // End:0x166
                    break;
                // End:0x163
                case 3:
                    strGrade = "A";
                    // End:0x166
                    break;
                // End:0xFFFF
                default:
                    break;
            }
        }
        C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
        C.BtrDrawTextJustifiedWithVolumeLine("BasicMovement: " $ string(fDrawTime), 1, 1254.0000000 * _reX, float(iY) * _reY, 1.0000000, float(iY + iHeight) * _reY, int(float(14) * _reY), color_Shadow);
        iY = (iY + iHeight) + iSpacing;
        C.BtrDrawTextJustifiedWithVolumeLine("Grade: " $ strGrade, 1, 1254.0000000 * _reX, float(iY) * _reY, 1.0000000, float(iY + iHeight) * _reY, int(float(14) * _reY), color_Shadow);
    }
    strGrade = "";
    // End:0x4E1
    if(fCheckStartTime_Advanced > float(0))
    {
        iY = (iY + iHeight) + iSpacing;
        WQuestBG1.OffsetX = 1176;
        WQuestBG1.OffsetY = iY;
        CalculateCoordinateEx(C, WQuestBG1, 424.0000000, 64.0000000, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WQuestBG1.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
        // End:0x386
        if(fElapsedTime_AdvancedMovement == float(0))
        {
            fDrawTime = Level.TimeSeconds - fCheckStartTime_Advanced;            
        }
        else
        {
            fDrawTime = fElapsedTime_AdvancedMovement;
            switch(Grade_AdvancedMovement)
            {
                // End:0x3A9
                case 1:
                    strGrade = "C";
                    // End:0x3CE
                    break;
                // End:0x3BA
                case 2:
                    strGrade = "B";
                    // End:0x3CE
                    break;
                // End:0x3CB
                case 3:
                    strGrade = "A";
                    // End:0x3CE
                    break;
                // End:0xFFFF
                default:
                    break;
            }
        }
        C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
        C.BtrDrawTextJustifiedWithVolumeLine("AdvancedMovement: " $ string(fDrawTime), 1, 1254.0000000 * _reX, float(iY) * _reY, 1.0000000, float(iY + iHeight) * _reY, int(float(14) * _reY), color_Shadow);
        iY = (iY + iHeight) + iSpacing;
        C.BtrDrawTextJustifiedWithVolumeLine("Grade: " $ strGrade, 1, 1254.0000000 * _reX, float(iY) * _reY, 1.0000000, float(iY + iHeight) * _reY, int(float(14) * _reY), color_Shadow);
    }
    strGrade = "";
    // End:0x744
    if(fCheckStartTime_Shooting > float(0))
    {
        iY = (iY + iHeight) + iSpacing;
        WQuestBG1.OffsetX = 1176;
        WQuestBG1.OffsetY = iY;
        CalculateCoordinateEx(C, WQuestBG1, 424.0000000, 64.0000000, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WQuestBG1.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
        // End:0x5F1
        if(fElapsedTime_Shooting == float(0))
        {
            fDrawTime = Level.TimeSeconds - fCheckStartTime_Shooting;            
        }
        else
        {
            fDrawTime = fElapsedTime_Shooting;
            switch(Grade_Shooting)
            {
                // End:0x614
                case 1:
                    strGrade = "C";
                    // End:0x639
                    break;
                // End:0x625
                case 2:
                    strGrade = "B";
                    // End:0x639
                    break;
                // End:0x636
                case 3:
                    strGrade = "A";
                    // End:0x639
                    break;
                // End:0xFFFF
                default:
                    break;
            }
        }
        C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
        C.BtrDrawTextJustifiedWithVolumeLine("Shooting: " $ string(fDrawTime), 1, 1254.0000000 * _reX, float(iY) * _reY, 1.0000000, float(iY + iHeight) * _reY, int(float(14) * _reY), color_Shadow);
        iY = (iY + iHeight) + iSpacing;
        C.BtrDrawTextJustifiedWithVolumeLine("Grade: " $ strGrade, 1, 1254.0000000 * _reX, float(iY) * _reY, 1.0000000, float(iY + iHeight) * _reY, int(float(14) * _reY), color_Shadow);
    }
    strGrade = "";
    // End:0x9A6
    if(fCheckStartTime_Grenade > float(0))
    {
        iY = (iY + iHeight) + iSpacing;
        WQuestBG1.OffsetX = 1176;
        WQuestBG1.OffsetY = iY;
        CalculateCoordinateEx(C, WQuestBG1, 424.0000000, 64.0000000, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WQuestBG1.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
        // End:0x854
        if(fElapsedTime_Grenade == float(0))
        {
            fDrawTime = Level.TimeSeconds - fCheckStartTime_Grenade;            
        }
        else
        {
            fDrawTime = fElapsedTime_Grenade;
            switch(Grade_Grenade)
            {
                // End:0x877
                case 1:
                    strGrade = "C";
                    // End:0x89C
                    break;
                // End:0x888
                case 2:
                    strGrade = "B";
                    // End:0x89C
                    break;
                // End:0x899
                case 3:
                    strGrade = "A";
                    // End:0x89C
                    break;
                // End:0xFFFF
                default:
                    break;
            }
        }
        C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
        C.BtrDrawTextJustifiedWithVolumeLine("Grenade: " $ string(fDrawTime), 1, 1254.0000000 * _reX, float(iY) * _reY, 1.0000000, float(iY + iHeight) * _reY, int(float(14) * _reY), color_Shadow);
        iY = (iY + iHeight) + iSpacing;
        C.BtrDrawTextJustifiedWithVolumeLine("Grade: " $ strGrade, 1, 1254.0000000 * _reX, float(iY) * _reY, 1.0000000, float(iY + iHeight) * _reY, int(float(14) * _reY), color_Shadow);
    }
    strGrade = "";
    // End:0xC9D
    if(fAIBotBeginTime > float(0))
    {
        iY = (iY + iHeight) + iSpacing;
        WQuestBG1.OffsetX = 1176;
        WQuestBG1.OffsetY = iY;
        CalculateCoordinateEx(C, WQuestBG1, 424.0000000, 64.0000000, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WQuestBG1.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
        // End:0xAB6
        if(fAIBotEndTime == float(0))
        {
            fDrawTime = Level.TimeSeconds - fAIBotBeginTime;            
        }
        else
        {
            fDrawTime = fAIBotEndTime - fAIBotBeginTime;
            switch(Grade_Battle)
            {
                // End:0xAE0
                case 1:
                    strGrade = "C";
                    // End:0xB05
                    break;
                // End:0xAF1
                case 2:
                    strGrade = "B";
                    // End:0xB05
                    break;
                // End:0xB02
                case 3:
                    strGrade = "A";
                    // End:0xB05
                    break;
                // End:0xFFFF
                default:
                    break;
            }
        }
        C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
        C.BtrDrawTextJustifiedWithVolumeLine("Battle: " $ string(fDrawTime), 1, 1254.0000000 * _reX, float(iY) * _reY, 1.0000000, float(iY + iHeight) * _reY, int(float(14) * _reY), color_Shadow);
        iY = (iY + iHeight) + iSpacing;
        C.BtrDrawTextJustifiedWithVolumeLine("Grade: " $ strGrade, 1, 1254.0000000 * _reX, float(iY) * _reY, 1.0000000, float(iY + iHeight) * _reY, int(float(14) * _reY), color_Shadow);
        // End:0xC9D
        if(ResultGrade > float(0))
        {
            iY = (iY + iHeight) + iSpacing;
            C.BtrDrawTextJustifiedWithVolumeLine("Total: " $ string(ResultGrade), 1, 1254.0000000 * _reX, float(iY) * _reY, 1.0000000, float(iY + iHeight) * _reY, int(float(14) * _reY), color_Shadow);
        }
    }
    //return;    
}

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
    // End:0x3C
    if(bDrawBeginTutorial)
    {
        DrawBeginTutorial(C);
    }
    DrawNoticeExit(C);
    // End:0x5B
    if(bDrawItem)
    {
        DrawGiftItem(C);
    }
    //return;    
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
    //return;    
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
    fDrawEffectTime = 0.5000000;
    // End:0x5C
    if(fDeltaTime >= fTotalDrawTime)
    {
        bDrawItem = false;
        callAccelStep = 0.0000000;
        return;
    }
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    qParam = Level.GameMgr.GetQuestInfo(iCurrentQuestID);
    // End:0x175
    if(qParam != none)
    {
        // End:0xD7
        if((qParam.RewardItemID[0] <= 0) && qParam.RewardPoint <= 0)
        {
            return;
        }
        // End:0x10B
        if((qParam.RewardItemID[0] <= 0) && qParam.RewardPoint > 0)
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
    else
    {
        return;
    }
    fScale = 1.6000000;
    fDeltaTime = (fDrawItemTime + fBeginDrawItem) - Level.TimeSeconds;
    fDeltaTime = FClamp(fDeltaTime, 0.0000000, fDrawItemTime);
    fDeltaTime2 = callLastTime - fDeltaTime;
    // End:0x203
    if(fDeltaTime2 > 0.0100000)
    {
        callLastTime = fDeltaTime;
        callAccelStep += (0.2000000 * Class'Engine.wMessage_Score'.default.ScaleStepMultiplier);
    }
    fStartValue = 1200.0000000;
    fDestValue = 866.0000000;
    fDeltaValue = 334.0000000;
    fPassingTime = fDrawItemTime - fDeltaTime;
    fCurrentValue = fDestValue + (fDeltaValue * (1.0000000 - FClamp(fPassingTime / fDrawEffectTime, 0.0000000, 1.0000000)));
    fCurrentValue = fCurrentValue + callAccelStep;
    fCurrentValue = FClamp(fCurrentValue, fDestValue, fStartValue);
    // End:0x342
    if(1 == iDrawEffectState)
    {
        // End:0x2CA
        if(fCurrentValue >= fDestValue)
        {
            callLastTime = 0.0000000;
            callAccelStep = 0.0000000;
            iDrawEffectState = 2;
        }
        fAddRatio = 1.0000000 - FClamp(fPassingTime / fDrawEffectTime, 0.0000000, 1.0000000);
        // End:0x327
        if(fAddRatio > float(0))
        {
            C.DrawColor.A = byte(float(100) * (1.0000000 - fAddRatio));            
        }
        else
        {
            C.DrawColor.A = byte(255);
        }        
    }
    else
    {
        // End:0x3C7
        if(2 == iDrawEffectState)
        {
            fFadeValue = (fDrawItemTime + fBeginDrawItem) - Level.TimeSeconds;
            fFadeValue = fFadeValue / (fTotalDrawTime - fFadeOutTime);
            C.DrawColor.A = byte(float(C.DrawColor.A) * FClamp(fFadeValue, 0.0000000, 1.0000000));
        }
    }
    _PosY = fCurrentValue;
    WGiftItemPopBG.OffsetX = int(float(800) - (float(318 / 2) * fScale));
    WGiftItemPopBG.OffsetY = int(_PosY);
    CalculateCoordinateEx(C, WGiftItemPopBG, 318.0000000 * fScale, 144.0000000 * fScale, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WGiftItemPopBG.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    WGiftItemPopBG2.OffsetX = int(float(800) - (float(318 / 2) * fScale));
    WGiftItemPopBG2.OffsetY = int(_PosY);
    CalculateCoordinateEx(C, WGiftItemPopBG2, 318.0000000 * fScale, 33.0000000 * fScale, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WGiftItemPopBG2.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    C.BtrDrawTextJustifiedWithVolumeLine(lsGiftItem, 1, 0.0000000, (_PosY + (float(7) * fScale)) * _reY, 1600.0000000 * _reX, (_PosY + (float(27) * fScale)) * _reY, int((float(14) * _reY) * fScale), color_Shadow);
    _PosY = _PosY + (float(44) * fScale);
    WGiftItemBG.WidgetTexture = Material(DynamicLoadObject("Warfare_TH_UI_UI.list_item_store_n", Class'Engine.Material'));
    WGiftItemBG.OffsetX = int(float(800) - (float(156 / 2) * fScale));
    WGiftItemBG.OffsetY = int(_PosY);
    CalculateCoordinateEx(C, WGiftItemBG, 156.0000000 * fScale, 85.0000000 * fScale, calW);
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
        sItemDisplayName = ((lsGiftPoint $ "( ") $ string(qParam.RewardPoint)) $ " )";
    }
    _PosY = float(WGiftItemBG.OffsetY);
    C.BtrDrawTextJustifiedWithVolumeLine(sItemDisplayName, 1, 0.0000000, (_PosY + (float(6) * fScale)) * _reY, 1600.0000000 * _reX, (_PosY + (float(21) * fScale)) * _reY, int((float(10) * _reY) * fScale), color_Shadow);
    // End:0x82C
    if(cItemResParam != none)
    {
        sRes_Icon = cItemResParam.strRes_Icon;        
    }
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
        _PosX = float(WGiftItemBG.OffsetX) + (float(2) * fScale);
        _PosY = float(WGiftItemBG.OffsetY) + (float(25) * fScale);
        C.SetPos(_PosX * _reX, _PosY * _reY);
        mat = Material(DynamicLoadObject(sRes_Icon, Class'Engine.Material'));
        C.DrawTile(mat, (152.0000000 * _reX) * fScale, (50.0000000 * _reY) * fScale, 0.0000000, 0.0000000, 152.0000000, 50.0000000);
    }
    //return;    
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

    // End:0x2D
    if(Level.TimeSeconds > fEndOfLife)
    {
        bDrawItem = false;
        callAccelStep = 0.0000000;
        return;
    }
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    qParam = Level.GameMgr.GetQuestInfo(iCurrentQuestID);
    // End:0x146
    if(qParam != none)
    {
        // End:0xA8
        if((qParam.RewardItemID[0] <= 0) && qParam.RewardPoint <= 0)
        {
            return;
        }
        // End:0xDC
        if((qParam.RewardItemID[0] <= 0) && qParam.RewardPoint > 0)
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
    else
    {
        return;
    }
    fTotalDrawTime = (((fDrawEffectTime1 + fDrawEffectTime2) + fDrawEffectTime3) + fDrawItemTime) + fFadeOutTime;
    fDeltaTime = fEndOfLife - Level.TimeSeconds;
    fDeltaTime = FClamp(fDeltaTime, 0.0000000, fTotalDrawTime);
    fDeltaTime2 = callLastTime - fDeltaTime;
    // End:0x1E9
    if(fDeltaTime2 > 0.0100000)
    {
        callLastTime = fDeltaTime;
        callAccelStep += (0.1000000 * Class'Engine.wMessage_Score'.default.ScaleStepMultiplier);
    }
    fFinalValue = 1.6000000;
    fAddRatio = 0.0000000;
    fPassingTime = fTotalDrawTime - fDeltaTime;
    // End:0x31B
    if(1 == iDrawEffectState)
    {
        fStartValue = 5.0000000;
        fDestValue = 1.4000000;
        fCurrentValue = fStartValue * (1.0000000 - FClamp(fPassingTime / fDrawEffectTime1, 0.0000000, 1.0000000));
        fCurrentValue = fCurrentValue - callAccelStep;
        fCurrentValue = FClamp(fCurrentValue, fDestValue, fStartValue);
        C.DrawColor.A = byte(float(100) * (1.0000000 - (fCurrentValue / fStartValue)));
        // End:0x2E3
        if(fCurrentValue <= fDestValue)
        {
            fCurrentValue = fDestValue;
            callAccelStep = 0.0000000;
            iDrawEffectState = 2;
        }
        fAddRatio = ((fCurrentValue - fDestValue) / (fStartValue - fDestValue)) + ((fFinalValue - fDestValue) / fFinalValue);        
    }
    else
    {
        // End:0x416
        if(2 == iDrawEffectState)
        {
            fStartValue = 1.4000000;
            fDestValue = 1.8000000;
            fCurrentValue = fStartValue * (1.0000000 + FClamp(fPassingTime / (fDrawEffectTime1 + fDrawEffectTime2), 0.0000000, 1.0000000));
            fCurrentValue = fCurrentValue + callAccelStep;
            fCurrentValue = FClamp(fCurrentValue, fStartValue, fDestValue);
            C.DrawColor.A = byte(255);
            // End:0x3DE
            if(fCurrentValue >= fDestValue)
            {
                fCurrentValue = fDestValue;
                callAccelStep = 0.0000000;
                iDrawEffectState = 3;
            }
            fAddRatio = ((fCurrentValue - fDestValue) / (fStartValue - fDestValue)) + ((fFinalValue - fDestValue) / fFinalValue);            
        }
        else
        {
            // End:0x543
            if(3 == iDrawEffectState)
            {
                fStartValue = 1.8000000;
                fDestValue = 1.6000000;
                fCurrentValue = fStartValue * (1.0000000 - FClamp(fPassingTime / ((fDrawEffectTime1 + fDrawEffectTime2) + fDrawEffectTime3), 0.0000000, 1.0000000));
                fCurrentValue = fCurrentValue - callAccelStep;
                fCurrentValue = FClamp(fCurrentValue, fDestValue, fStartValue);
                C.DrawColor.A = byte(255);
                // End:0x4D8
                if(fCurrentValue <= fDestValue)
                {
                    fCurrentValue = fDestValue;
                    callAccelStep = 0.0000000;
                }
                fAddRatio = ((fCurrentValue - fDestValue) / (fStartValue - fDestValue)) + ((fFinalValue - fDestValue) / fFinalValue);
                // End:0x540
                if(fPassingTime > ((((fDrawEffectTime1 + fDrawEffectTime2) + fDrawEffectTime3) + fDrawItemTime) - fFadeOutTime))
                {
                    iDrawEffectState = 4;
                }                
            }
            else
            {
                // End:0x5DB
                if(4 == iDrawEffectState)
                {
                    fCurrentValue = fFinalValue;
                    fDestValue = fFinalValue;
                    fFadeValue = fEndOfLife - Level.TimeSeconds;
                    fFadeValue = fFadeValue / fFadeOutTime;
                    C.DrawColor.A = byte(float(C.DrawColor.A) * FClamp(fFadeValue, 0.0000000, 1.0000000));
                    fAddRatio = 0.0000000;
                }
            }
        }
    }
    _PosY = 866.0000000 - (float(72) * fAddRatio);
    fScale = fCurrentValue;
    WGiftItemPopBG.OffsetX = int(float(800) - ((float(318) * 0.5000000) * fScale));
    WGiftItemPopBG.OffsetY = int(_PosY);
    CalculateCoordinateEx(C, WGiftItemPopBG, 318.0000000 * fScale, 144.0000000 * fScale, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WGiftItemPopBG.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    WGiftItemPopBG2.OffsetX = int(float(800) - ((float(318) * 0.5000000) * fScale));
    WGiftItemPopBG2.OffsetY = int(_PosY);
    CalculateCoordinateEx(C, WGiftItemPopBG2, 318.0000000 * fScale, 33.0000000 * fScale, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WGiftItemPopBG2.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    C.BtrDrawTextJustifiedWithVolumeLine(lsGiftItem, 1, 0.0000000, (_PosY + (float(7) * fScale)) * _reY, 1600.0000000 * _reX, (_PosY + (float(27) * fScale)) * _reY, int((float(14) * _reY) * fScale), color_Shadow);
    _PosY = _PosY + (float(44) * fScale);
    WGiftItemBG.WidgetTexture = Material(DynamicLoadObject(strGiftItemBG, Class'Engine.Material'));
    WGiftItemBG.OffsetX = int(float(800) - ((float(156) * 0.5000000) * fScale));
    WGiftItemBG.OffsetY = int(_PosY);
    CalculateCoordinateEx(C, WGiftItemBG, 156.0000000 * fScale, 85.0000000 * fScale, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WGiftItemBG.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    // End:0x96A
    if(cItemParam != none)
    {
        sItemDisplayName = cItemParam.strDisplayName;
    }
    // End:0x99C
    if(bGiftIsPoint)
    {
        sItemDisplayName = ((lsGiftPoint $ "( ") $ string(qParam.RewardPoint)) $ " )";
    }
    _PosY = float(WGiftItemBG.OffsetY);
    C.BtrDrawTextJustifiedWithVolumeLine(sItemDisplayName, 1, 0.0000000, (_PosY + (float(6) * fScale)) * _reY, 1600.0000000 * _reX, (_PosY + (float(21) * fScale)) * _reY, int((float(10) * _reY) * fScale), color_Shadow);
    // End:0xA42
    if(cItemResParam != none)
    {
        sRes_Icon = cItemResParam.strRes_Icon;        
    }
    else
    {
        // End:0xA7F
        if(bGiftIsPoint)
        {
            sRes_Icon = "Warfare_UI_Item.ShopIcon.Item_Item_FT_pt_bns";
        }
    }
    // End:0xB5A
    if(Len(sRes_Icon) > 0)
    {
        _PosX = float(WGiftItemBG.OffsetX) + (float(2) * fScale);
        _PosY = float(WGiftItemBG.OffsetY) + (float(25) * fScale);
        C.SetPos(_PosX * _reX, _PosY * _reY);
        mat = Material(DynamicLoadObject(sRes_Icon, Class'Engine.Material'));
        C.DrawTile(mat, (152.0000000 * _reX) * fScale, (50.0000000 * _reY) * fScale, 0.0000000, 0.0000000, 152.0000000, 50.0000000);
    }
    //return;    
}

function float GetValueScaleDown(float fStartScale, float fDestScale, float fDrawTime)
{
    local float rValue;

    return rValue;
    //return;    
}

function float GetValueScaleUp(float fStartScale, float fDestScale, float fDrawTime)
{
    local float rValue;

    return rValue;
    //return;    
}

function DrawBattleAIBot(Canvas C)
{
    local CalCoordsW calW;
    local float fDrawTime;

    WQuestBG1.OffsetX = 1176;
    WQuestBG1.OffsetY = 400;
    CalculateCoordinateEx(C, WQuestBG1, 424.0000000, 64.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WQuestBG1.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    // End:0xE4
    if(iCurrent < iGoal)
    {
        fDrawTime = Level.TimeSeconds - fAIBotBeginTime;        
    }
    else
    {
        fDrawTime = fAIBotEndTime - fAIBotBeginTime;
    }
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine((lsAIBotTime $ ": ") $ string(fDrawTime), 1, 1254.0000000 * _reX, float(WQuestBG1.OffsetY + 6) * _reY, 1.0000000, float((WQuestBG1.OffsetY + 6) + 25) * _reY, int(float(14) * _reY), color_Shadow);
    C.BtrDrawTextJustifiedWithVolumeLine((((lsAIBotKillCount $ ": ") $ string(iCurrent)) $ "/") $ string(iGoal), 1, 1254.0000000 * _reX, float(((WQuestBG1.OffsetY + 6) + 25) + 4) * _reY, 1.0000000, float((((WQuestBG1.OffsetY + 6) + 25) + 4) + 25) * _reY, int(float(14) * _reY), color_Shadow);
    //return;    
}

function DrawNoticeExit(Canvas C)
{
    local CalCoordsW calW;

    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    CalculateCoordinateEx(C, WNoticeExitBG, 424.0000000, 31.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WNoticeExitBG.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    C.BtrDrawTextJustifiedWithVolumeLine(lsNoticeExit, 1, 1254.0000000 * _reX, 10.0000000 * _reY, 1.0000000, 29.0000000 * _reY, int(float(14) * _reY), color_Shadow);
    //return;    
}

function DrawQuest(Canvas C)
{
    local CalCoordsW calW;
    local int fY1, fY2;
    local float _iPosX, _iPosY;
    local string sProgress;

    // End:0x2D
    if(((Len(SQuest) <= 0) && Len(sComment) <= 0) && Len(sComment2) <= 0)
    {
        return;
    }
    _iPosX = 346.0000000;
    _iPosY = 161.0000000;
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    WQuestBG1.OffsetX = (1600 / 2) - (1200 / 2);
    WQuestBG1.OffsetY = int(_iPosY);
    CalculateCoordinateEx(C, WQuestBG1, 1200.0000000, 119.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WQuestBG1.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    // End:0x35D
    if(bDrawKey)
    {
        CalculateCoordinateEx(C, WQuestBGKey, 558.0000000, 67.0000000, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WQuestBGKey.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
        // End:0x271
        if(WQuestKey.WidgetTexture != none)
        {
            CalculateCoordinateEx(C, WQuestKey, fKeyWidth, fKeyHight, calW);
            C.SetPos(calW.X1, calW.Y1);
            C.DrawTile(WQuestKey.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
        }
        // End:0x35D
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
    else
    {
        fY1 = int(float(191) * _reY);
        fY2 = int(float(226) * _reY);
    }
    // End:0x3E7
    if(bDrawProgress)
    {
        sProgress = ((("(" $ string(iCurrent)) $ "/") $ string(iGoal)) $ ")";
    }
    C.SetDrawColor(byte(255), 209, 0, byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine(SQuest $ sProgress, 1, 0.0000000, float(fY1), 1600.0000000 * _reX, float(fY2), int(float(27) * _reY), color_Shadow);
    // End:0x486
    if(Len(sComment2) > 0)
    {
        fY1 = int(float(221) * _reY);
        fY2 = int(float(242) * _reY);        
    }
    else
    {
        fY1 = int(float(232) * _reY);
        fY2 = int(float(253) * _reY);
    }
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine(sComment, 1, 0.0000000, float(fY1), 1600.0000000 * _reX, float(fY2), int(float(16) * _reY), color_Shadow);
    fY1 = int(float(243) * _reY);
    fY2 = int(float(264) * _reY);
    // End:0x58F
    if(Len(sComment2) > 0)
    {
        C.BtrDrawTextJustifiedWithVolumeLine(sComment2, 1, 0.0000000, float(fY1), 1600.0000000 * _reX, float(fY2), int(float(16) * _reY), color_Shadow);
    }
    //return;    
}

function DrawQuestComplete(Canvas C)
{
    local CalCoordsW calW;
    local int fY1, fY2;
    local float _iPosX, _iPosY, fDeltaTime;

    fDeltaTime = Level.TimeSeconds - fBeginMessageTime;
    // End:0x39
    if(fDeltaTime >= (fMessageDrawTime + fFadeOutTime))
    {
        OnNextQuest();
        return;
    }
    // End:0x57
    if((Len(SQuest) <= 0) && Len(sComment) <= 0)
    {
        return;
    }
    _iPosX = 346.0000000;
    _iPosY = 161.0000000;
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    WQuestBG1.OffsetX = (1600 / 2) - (1200 / 2);
    WQuestBG1.OffsetY = int(_iPosY);
    CalculateCoordinateEx(C, WQuestBG1, 1200.0000000, 119.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WQuestBG1.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    fY1 = int(float(191) * _reY);
    fY2 = int(float(226) * _reY);
    C.SetDrawColor(byte(255), 209, 0, byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine(SQuest, 1, 0.0000000, float(fY1), 1600.0000000 * _reX, float(fY2), int(float(27) * _reY), color_Shadow);
    fY1 = int(float(232) * _reY);
    fY2 = int(float(253) * _reY);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine(sComment, 1, 0.0000000, float(fY1), 1600.0000000 * _reX, float(fY2), int(float(16) * _reY), color_Shadow);
    //return;    
}

function DrawBeginTutorial(Canvas C)
{
    local CalCoordsW calW;
    local int fY1, fY2;
    local float _iPosX, _iPosY, fDeltaTime;

    fDeltaTime = Level.TimeSeconds - fBeginMessageTime;
    // End:0x41
    if(fDeltaTime >= (fMessageDrawTime + fFadeOutTime))
    {
        OnNextQuest();
        bDrawBeginTutorial = false;
        return;
    }
    _iPosX = 346.0000000;
    _iPosY = 161.0000000;
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    WQuestBG1.OffsetX = (1600 / 2) - (1200 / 2);
    WQuestBG1.OffsetY = int(_iPosY);
    CalculateCoordinateEx(C, WQuestBG1, 1200.0000000, 119.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WQuestBG1.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    fY1 = int(float(197) * _reY);
    fY2 = int(float(219) * _reY);
    C.BtrDrawTextJustifiedWithVolumeLine(SQuest, 1, 0.0000000, float(fY1), 1600.0000000 * _reX, float(fY2), int(float(17) * _reY), color_Shadow);
    fY1 = int(float(224) * _reY);
    fY2 = int(float(246) * _reY);
    C.BtrDrawTextJustifiedWithVolumeLine(sComment, 1, 0.0000000, float(fY1), 1600.0000000 * _reX, float(fY2), int(float(17) * _reY), color_Shadow);
    //return;    
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
        //return;        
    }

    function EndState()
    {
        //return;        
    }
    stop;    
}

state QuestBase
{
    function BeginState()
    {
        ResetProgress();
        fKeyHight = 52.0000000;
        fKeyWidth = 52.0000000;
        bDrawKey = false;
        bDrawBGKey = false;
        bDrawProgress = false;
        IsFadeOut = false;
        WQuestKey.OffsetX = 774;
        WQuestKey.OffsetY = 294;
        //return;        
    }

    function Timer()
    {
        //return;        
    }

    function EndState()
    {
        ResetProgress();
        //return;        
    }
    stop;    
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
        // End:0xC9
        foreach DynamicActors(Class'UnrealGame.ShootTarget', A)
        {
            A.Disable('Trigger');            
        }        
        Level.GetLocalPlayerController().bGodMode = true;
        //return;        
    }

    function OnNextQuest()
    {
        GotoState('Q01_OnTarget');
        fMessageDrawTime = default.fMessageDrawTime;
        CheckStartTutorial();
        //return;        
    }
    stop;    
}

state Q01_OnTarget extends QuestBase
{
    function BeginState()
    {
        fCheckStartTime_Basic = Level.TimeSeconds;
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
        //return;        
    }

    function OnQuest()
    {
        // End:0x13
        if(float(iProgress) >= 100.0000000)
        {
            return;
        }
        ++iCurrent;
        iProgress = int(float(iCurrent / iGoal) * 100.0000000);
        switch(iCurrent)
        {
            // End:0x77
            case 1:
                EnableShootTarget('ShootTarget3');
                TriggerEvent('MaterialSwitch1_D', none, none);
                TriggerEvent('MaterialSwitch1_C', self, HudOwner.PawnOwner);
                // End:0x110
                break;
            // End:0xB1
            case 2:
                EnableShootTarget('ShootTarget2');
                TriggerEvent('MaterialSwitch1_C', none, none);
                TriggerEvent('MaterialSwitch1_B', self, HudOwner.PawnOwner);
                // End:0x110
                break;
            // End:0xEB
            case 3:
                EnableShootTarget('ShootTarget1');
                TriggerEvent('MaterialSwitch1_B', none, none);
                TriggerEvent('MaterialSwitch1_A', self, HudOwner.PawnOwner);
                // End:0x110
                break;
            // End:0x10D
            case 4:
                TriggerEvent('LineOfSightTrigger', none, none);
                TriggerEvent('MaterialSwitch1_A', none, none);
                // End:0x110
                break;
            // End:0xFFFF
            default:
                break;
        }
        OnTutorialResult(iTutorialID, iCurrent);
        OnNextQuest();
        //return;        
    }

    function OnNextQuest()
    {
        // End:0x13
        if(iProgress >= 100)
        {
            GotoState('Q01_OnTargetEnd');
        }
        //return;        
    }
    stop;    
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
        //return;        
    }

    function OnNextQuest()
    {
        GotoState('Q02_MoveControllA');
        //return;        
    }
    stop;    
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
        fMoveLength = 0.0000000;
        SetTimer(0.1000000, true);
        iTutorialID = 2;
        OnTutorialResult(iTutorialID, iCurrent);
        //return;        
    }

    function EndState()
    {
        iOldTutorialID = 2;
        super.EndState();
        //return;        
    }

    function Timer()
    {
        local Rotator LookDir;
        local Vector currentVelocity, X, Y, Z;
        local float Left;

        // End:0xCE
        if(VSize(HudOwner.PawnOwner.Velocity) > float(0))
        {
            LookDir = HudOwner.PawnOwner.Rotation;
            GetAxes(LookDir, X, Y, Z);
            currentVelocity = Normal(HudOwner.PawnOwner.Velocity);
            Left = Y Dot currentVelocity;
            // End:0xB1
            if(Left < -0.1000000)
            {
                Movelength(HudOwner.PawnOwner.Location);
            }
            vOldLocation = HudOwner.PawnOwner.Location;
        }
        //return;        
    }

    function OnNextQuest()
    {
        GotoState('Q02_MoveControllD');
        //return;        
    }
    stop;    
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
        fMoveLength = 0.0000000;
        SetTimer(0.1000000, true);
        //return;        
    }

    function Timer()
    {
        local Rotator LookDir;
        local Vector currentVelocity, X, Y, Z;
        local float Right;

        // End:0xCE
        if(VSize(HudOwner.PawnOwner.Velocity) > float(0))
        {
            LookDir = HudOwner.PawnOwner.Rotation;
            GetAxes(LookDir, X, Y, Z);
            currentVelocity = Normal(HudOwner.PawnOwner.Velocity);
            Right = Y Dot currentVelocity;
            // End:0xB1
            if(Right > 0.1000000)
            {
                Movelength(HudOwner.PawnOwner.Location);
            }
            vOldLocation = HudOwner.PawnOwner.Location;
        }
        //return;        
    }

    function OnNextQuest()
    {
        GotoState('Q02_MoveControllS');
        //return;        
    }
    stop;    
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
        fMoveLength = 0.0000000;
        SetTimer(0.1000000, true);
        //return;        
    }

    function Timer()
    {
        local Rotator LookDir;
        local Vector currentVelocity, X, Y, Z;
        local float back;

        // End:0xCE
        if(VSize(HudOwner.PawnOwner.Velocity) > float(0))
        {
            LookDir = HudOwner.PawnOwner.Rotation;
            GetAxes(LookDir, X, Y, Z);
            currentVelocity = Normal(HudOwner.PawnOwner.Velocity);
            back = X Dot currentVelocity;
            // End:0xB1
            if(back < -0.1000000)
            {
                Movelength(HudOwner.PawnOwner.Location);
            }
            vOldLocation = HudOwner.PawnOwner.Location;
        }
        //return;        
    }

    function OnNextQuest()
    {
        GotoState('Q02_MoveControllW');
        //return;        
    }
    stop;    
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
        fMoveLength = 0.0000000;
        SetTimer(0.1000000, true);
        //return;        
    }

    function Timer()
    {
        local Rotator LookDir;
        local Vector currentVelocity, X, Y, Z;
        local float Forward;

        // End:0x102
        if(VSize(HudOwner.PawnOwner.Velocity) > float(0))
        {
            LookDir = HudOwner.PawnOwner.Rotation;
            GetAxes(LookDir, X, Y, Z);
            currentVelocity = Normal(HudOwner.PawnOwner.Velocity);
            Forward = X Dot currentVelocity;
            // End:0xE5
            if(Forward > 0.1000000)
            {
                fMoveLength += VSize(HudOwner.PawnOwner.Location - vOldLocation);
                // End:0xE5
                if(fMoveLength > 300.0000000)
                {
                    SetTimer(0.0000000, false);
                    OnCompleteQuest();
                    BeginDrawItem();
                    CalcBasicMovementGrade();
                }
            }
            vOldLocation = HudOwner.PawnOwner.Location;
        }
        //return;        
    }

    function OnNextQuest()
    {
        GotoState('MoveTrainingField');
        EnableTriggerEvent('DoorMover', none, HudOwner.PawnOwner);
        TriggerEvent('DoorMover', none, HudOwner.PawnOwner);
        OnTutorialResult(iTutorialID, iCurrent, true);
        BeginDrawItem();
        //return;        
    }
    stop;    
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
        fKeyWidth = 82.0000000;
        WQuestKey.OffsetX = int(float(1600 / 2) - (fKeyWidth / float(2)));
        //return;        
    }

    function OnNextQuest()
    {
        GotoState('Q03_MoveWalking');
        //return;        
    }
    stop;    
}

state Q03_MoveWalking extends QuestBase
{
    function BeginState()
    {
        fCheckStartTime_Advanced = Level.TimeSeconds;
        super.BeginState();
        OnBeginMessage();
        SQuest = lsQMoveWalking;
        sComment = lsCMoveWalking;
        iTutorialID = 3;
        OnTutorialResult(iTutorialID, iCurrent);
        //return;        
    }

    function OnNextQuest()
    {
        GotoState('Q03_MoveWalkingEnd');
        OnTutorialResult(iTutorialID, iCurrent, true);
        PlaySoundQuest();
        BeginDrawItem();
        //return;        
    }
    stop;    
}

state Q03_MoveWalkingEnd extends QuestBase
{
    function BeginState()
    {
        super.BeginState();
        OnBeginMessage();
        SQuest = lsQMoveWalkingEnd;
        sComment = lsCMoveWalkingEnd;
        //return;        
    }

    function OnNextQuest()
    {
        GotoState('Q04_MoveDucking');
        //return;        
    }
    stop;    
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
        fKeyWidth = 82.0000000;
        WQuestKey.OffsetX = int(float(1600 / 2) - (fKeyWidth / float(2)));
        iTutorialID = 4;
        OnTutorialResult(iTutorialID, iCurrent);
        //return;        
    }

    function OnNextQuest()
    {
        GotoState('Q04_MoveDuckingEnd');
        OnTutorialResult(iTutorialID, iCurrent, true);
        BeginDrawItem();
        PlaySoundQuest();
        //return;        
    }
    stop;    
}

state Q04_MoveDuckingEnd extends QuestBase
{
    function BeginState()
    {
        super.BeginState();
        OnBeginMessage();
        SQuest = lsQMoveDuckingEnd;
        sComment = "";
        //return;        
    }

    function OnNextQuest()
    {
        GotoState('Q05_MoveProne');
        //return;        
    }
    stop;    
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
        WQuestKey.OffsetX = int(float(1600 / 2) - (fKeyWidth / float(2)));
        iTutorialID = 5;
        OnTutorialResult(iTutorialID, iCurrent);
        //return;        
    }

    function OnNextQuest()
    {
        OnTutorialResult(iTutorialID, iCurrent, true);
        GotoState('Q05_MoveProneEnd');
        BeginDrawItem();
        PlaySoundQuest();
        //return;        
    }
    stop;    
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
        fKeyWidth = 82.0000000;
        WQuestKey.OffsetX = int(float(1600 / 2) - (fKeyWidth / float(2)));
        //return;        
    }

    function OnNextQuest()
    {
        GotoState('Q06_MoveJump');
        //return;        
    }
    stop;    
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
        fKeyWidth = 82.0000000;
        WQuestKey.OffsetX = int(float(1600 / 2) - (fKeyWidth / float(2)));
        iTutorialID = 6;
        OnTutorialResult(iTutorialID, iCurrent);
        //return;        
    }

    function OnNextQuest()
    {
        OnTutorialResult(iTutorialID, iCurrent, true);
        GotoState('Q06_MoveJumpEnd');
        BeginDrawItem();
        PlaySoundQuest();
        //return;        
    }
    stop;    
}

state Q06_MoveJumpEnd extends QuestBase
{
    function BeginState()
    {
        super.BeginState();
        OnBeginMessage();
        SQuest = lsQMoveJumpEnd;
        sComment = lsCMoveJumpEnd;
        //return;        
    }

    function OnNextQuest()
    {
        GotoState('Q07_MoveLadder');
        //return;        
    }
    stop;    
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
        //return;        
    }

    function OnNextQuest()
    {
        OnTutorialResult(iTutorialID, iCurrent, true);
        GotoState('Q07_MoveLadderEnd');
        BeginDrawItem();
        PlaySoundQuest();
        //return;        
    }
    stop;    
}

state Q07_MoveLadderEnd extends QuestBase
{
    function BeginState()
    {
        super.BeginState();
        OnBeginMessage();
        SQuest = lsQMoveLadderEnd;
        sComment = lsCMoveLadderEnd;
        //return;        
    }

    function OnNextQuest()
    {
        GotoState('Q08_JumpDown');
        Level.GetLocalPlayerController().bGodMode = false;
        //return;        
    }
    stop;    
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
        //return;        
    }

    function OnNextQuest()
    {
        GotoState('Q08_JumpDownEnd');
        //return;        
    }
    stop;    
}

state Q08_JumpDownEnd extends QuestBase
{
    function BeginState()
    {
        super.BeginState();
        OnBeginMessage();
        SQuest = lsQJumpDownEnd;
        sComment = lsCJumpDownEnd;
        //return;        
    }

    function OnNextQuest()
    {
        GotoState('Q09_RecoveryHealth');
        //return;        
    }
    stop;    
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
        //return;        
    }

    function OnPickUpHealthPack()
    {
        OnTutorialResult(iTutorialID, iCurrent, true);
        GotoState('Q09_RecoveryHealthEnd');
        BeginDrawItem();
        PlaySoundQuest();
        //return;        
    }

    function OnNextQuest()
    {
        //return;        
    }
    stop;    
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
        //return;        
    }

    function OnNextQuest()
    {
        GotoState('Q10_MoveSprint');
        //return;        
    }
    stop;    
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
        fKeyWidth = 82.0000000;
        WQuestKey.OffsetX = int(float(1600 / 2) - (fKeyWidth / float(2)));
        iGoal = 3;
        iTutorialID = 10;
        OnTutorialResult(iTutorialID, iCurrent);
        //return;        
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
        // End:0x4C
        if(iCurrent >= iGoal)
        {
            OnNextQuest();
        }
        //return;        
    }

    function OnNextQuest()
    {
        OnTutorialResult(iTutorialID, iCurrent, true);
        GotoState('Q10_MoveSprintEnd');
        BeginDrawItem();
        PlaySoundQuest();
        //return;        
    }
    stop;    
}

state Q10_MoveSprintEnd extends QuestBase
{
    function BeginState()
    {
        CalcAdvancedMovementGrade();
        super.BeginState();
        SQuest = lsQMoveSprintEnd;
        sComment = lsCMoveSprintEnd;
        EnableTriggerEvent('DoorMover2', none, HudOwner.PawnOwner);
        TriggerEvent('DoorMover2', none, HudOwner.PawnOwner);
        //return;        
    }

    function OnNextQuest()
    {
        GotoState('Q11_DoFire');
        //return;        
    }
    stop;    
}

state Q11_DoFire extends QuestBase
{
    function BeginState()
    {
        fCheckStartTime_Shooting = Level.TimeSeconds;
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
        fKeyHight = 64.0000000;
        fKeyWidth = 64.0000000;
        WQuestKey.OffsetX = int(float(1600 / 2) - (fKeyWidth / float(2)));
        //return;        
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
            fKeyWidth = 52.0000000;
            WQuestKey.OffsetX = int(float(1600 / 2) - (fKeyWidth / float(2)));
            BeginDrawItem();
        }
        //return;        
    }

    function OnNextQuest()
    {
        GotoState('Q12_DoFireAim');
        //return;        
    }
    stop;    
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
        fKeyHight = 64.0000000;
        fKeyWidth = 64.0000000;
        WQuestKey.OffsetX = int(float(1600 / 2) - (fKeyWidth / float(2)));
        SetTimer(0.5000000, true);
        //return;        
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
        // End:0x5A
        if(iCurrent >= iGoal)
        {
            OnCompleteQuest();
            BeginDrawItem();
            CalcShootingGrade();
        }
        //return;        
    }

    function OnNextQuest()
    {
        SetTimer(0.0000000, false);
        EnableTriggerEvent('DoorMover3', none, HudOwner.PawnOwner);
        TriggerEvent('DoorMover3', none, HudOwner.PawnOwner);
        GotoState('MoveTrainingField2');
        //return;        
    }

    function Timer()
    {
        // End:0x39
        if(!wGun(HudOwner.PawnOwner.Weapon).IsAiming())
        {
            WQuestKey = WQuestKeyRightMouse;            
        }
        else
        {
            WQuestKey = WQuestKeyLeftMouse;
        }
        //return;        
    }
    stop;    
}

state MoveTrainingField2 extends QuestBase
{
    function BeginState()
    {
        super.BeginState();
        SQuest = lsQMoveTrainingField2;
        sComment = lsCMoveTrainingField2;
        OnBeginMessage();
        //return;        
    }

    function OnNextQuest()
    {
        GotoState('Q13_DoFireMelee');
        //return;        
    }
    stop;    
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
        WQuestKey.OffsetX = int(float(1600 / 2) - (fKeyWidth / float(2)));
        iGoal = 2;
        iTutorialID = 13;
        OnTutorialResult(iTutorialID, iCurrent);
        //return;        
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
        // End:0x5B
        if(iCurrent >= iGoal)
        {
            GotoState('Q13_DoFireMeleeEnd');
            BeginDrawItem();
            PlaySoundQuest();
        }
        //return;        
    }
    stop;    
}

state Q13_DoFireMeleeEnd extends QuestBase
{
    function BeginState()
    {
        super.BeginState();
        SQuest = lsQDoFireMeleeEnd;
        sComment = lsCDoFireMeleeEnd;
        OnBeginMessage();
        //return;        
    }

    function OnNextQuest()
    {
        GotoState('Q14_PickupRocketLauncher');
        //return;        
    }
    stop;    
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
        WQuestKey.OffsetX = int(float(1600 / 2) - (fKeyWidth / float(2)));
        OnBeginMessage();
        Level.GetLocalPlayerController().bGodMode = true;
        iTutorialID = 14;
        //return;        
    }

    function OnQuest()
    {
        GotoState('Q15_DoFireRocketLauncher');
        //return;        
    }

    function OnNextQuest()
    {
        //return;        
    }
    stop;    
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
        fKeyWidth = 64.0000000;
        WQuestKey.OffsetX = int(float(1600 / 2) - (fKeyWidth / float(2)));
        OnBeginMessage();
        iTutorialID = 15;
        OnTutorialResult(iTutorialID, iCurrent);
        //return;        
    }

    function OnQuest()
    {
        OnTutorialResult(iTutorialID, iCurrent, true);
        BeginDrawItem();
        PlaySoundQuest();
        TriggerEvent('MaterialSwitch10', none, none);
        GotoState('Q15_DoFireRocketLauncherEnd');
        //return;        
    }
    stop;    
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
        //return;        
    }

    function OnNextQuest()
    {
        GotoState('Q16_DoThrowingWeapon');
        //return;        
    }
    stop;    
}

state Q16_DoThrowingWeapon extends QuestBase
{
    function BeginState()
    {
        fCheckStartTime_Grenade = Level.TimeSeconds;
        super.BeginState();
        SQuest = lsQDoThrowingWeapon;
        sComment = lsCDoThrowingWeapon;
        lsQComplete = lsQDoThrowingWeaponEnd;
        lsNext = lsQDoThrowingWeaponEnd;
        iGoal = 1;
        iTutorialID = 16;
        bDrawKey = true;
        GetKeyTexture("4", WQuestKey);
        WQuestKey.OffsetX = int(float(1600 / 2) - (fKeyWidth / float(2)));
        OnTutorialResult(iTutorialID, iCurrent);
        OnBeginMessage();
        wPawn(Level.GetLocalPlayerController().Pawn).AddDefaultInventory();
        wPawn(Level.GetLocalPlayerController().Pawn).RemoveInventoryByDamageType(5);
        Level.GetLocalPlayerController().Pawn.AddWeapon(EmptyBtrDouble(), 6000, 0, false);
        Level.GetLocalPlayerController().Pawn.SetInfiniteAmmoTutorial(false, 999);
        //return;        
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
        CalcGrenadeGrade();
        OnNextQuest();
        //return;        
    }

    function OnNextQuest()
    {
        // End:0x2F
        if(iCurrent >= iGoal)
        {
            TriggerEvent('MaterialSwitch3', none, none);
            BeginDrawItem();
            PlaySoundQuest();
            GotoState('MoveTrainingField3');
        }
        //return;        
    }
    stop;    
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
        //return;        
    }

    function OnNextQuest()
    {
        GotoState('Q17_BattleAIBot');
        //return;        
    }
    stop;    
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
        //return;        
    }

    function OnQuest()
    {
        //return;        
    }

    function OnKill3Enemy()
    {
        // End:0x11
        if(iCurrent >= iGoal)
        {
            return;
        }
        ++iCurrent;
        OnTutorialResult(iTutorialID, iCurrent, iCurrent >= iGoal);
        // End:0x9B
        if(iCurrent >= iGoal)
        {
            OnBeginMessage();
            OnCompleteQuest();
            BeginDrawItem();
            fMessageDrawTime = 6.0000000;
            fAIBotEndTime = Level.TimeSeconds;
            CalcBotBattleGrade();
            DeathMatch(Level.Game).Killaibots();
        }
        //return;        
    }

    function OnNextQuest()
    {
        bAIBotScore = false;
        ResultGrade = ((((float(Grade_BasicMovement) * 0.5000000) + (float(Grade_AdvancedMovement) * 1.0000000)) + (float(Grade_Shooting) * 1.0000000)) + (float(Grade_Grenade) * 0.5000000)) + (float(Grade_Battle) * 2.0000000);
        ResultGrade /= 5.0000000;
        Level.GetMatchMaker().TutorialGrade = ResultGrade;
        GotoState('QuitTutorial2');
        //return;        
    }
    stop;    
}

state QuitTutorial2 extends QuestBase
{
    function BeginState()
    {
        super.BeginState();
        OnEndMessage();
        //return;        
    }

    function OnEndMessage()
    {
        bDrawMessage = false;
        bDrawMessage_QuestComplete = false;
        // End:0x3C
        if(HudOwner.PlayerOwner != none)
        {
            HudOwner.PlayerOwner.ScriptResetInput();
        }
        Level.GetLocalPlayerController().bGodMode = false;
        Level.GetMatchMaker().bCompletedBotTutorial = true;
        HudOwner.PlayerOwner.ConsoleCommand("ShowTutorialEndWindow");
        //return;        
    }
    stop;    
}

defaultproperties
{
    lsStartComment="?????????????????????????????????? "
    lsStartComment2="?????????????????? ?????????????????????????????????"
    lsQOnFocus="??????????????????????????????????????? 4 ???"
    lsCOnFocus="??????????????????????????????"
    lsQOnFocusEnd="?????????????"
    lsQMoveControlA="?????????????????"
    lsCMoveControlA="?????? [A]"
    lsQMoveControlD="?????????????"
    lsCMoveControlD="?????? [D]"
    lsQMoveControlW="?????????????????"
    lsCMoveControlW="?????? [W]"
    lsQMoveControlS="???????"
    lsCMoveControlS="?????? [S]"
    lsQMoveControlQ="??????????????????"
    lsCMoveControlQ="????????????????????????????????"
    lsQMoveTrainingField="????????????????????????????????"
    lsCMoveTrainingField="?? [TAB] ??????????????????"
    lsQMoveComplete="?????????????????? "
    lsQMoveWalking="?????????????????????!"
    lsCMoveWalking="????????????????????????????????????????"
    lsQMoveWalkingEnd="??????????????????????"
    lsQMoveDucking="??????????????????????????"
    lsCMoveDucking="?????? [Ctrl] ???????????"
    lsQMoveDuckingEnd="????????????????????????"
    lsQMoveProne="?????????????????????????"
    lsCMoveProne="?????? [C] ????????????????"
    lsQMoveProneEnd="??????????????????????????"
    lsCMoveProneEnd="?? [Space Bar] ???????????????????????"
    lsQMoveJump="?????????????????????!"
    lsCMoveJump="?? [Space Bar] ???????????"
    lsQMoveJumpEnd="????????????????????????????????"
    lsQMoveLadder="??????????????????"
    lsCMoveLadder="????????????????????????????????????"
    lsQMoveLadderEnd="???????????????????????"
    lsCMoveLadderEnd="????????????!"
    lsQJumpDown="????????????????????"
    lsCJumpDown="????????????!"
    lsQJumpDownEnd="???????????????????????????!"
    lsCJumpDownEnd="???????????????????????????????????????????"
    lsQRecoveryHealth="???????????????????????????!"
    lsCRecoveryHealth="???????????????????????????????????????????"
    lsQRecoveryHealthEnd="?????????????????????????"
    lsQMoveSprint="?????????????????? 3 ??????"
    lsCMoveSprint="?????? [Shift] ?????????????????"
    lsQMoveSprintEnd="??????????????????"
    lsCMoveSprintEnd="????????????????????????????????"
    lsQDoFire="???????????????????????????? 5 ????"
    lsCDoFire="?????????????????????????????????????"
    lsQDoFireEnd="???????????????"
    lsCDoFireEnd="?????? [R] ????????????????????"
    lsQDoFireAim="??????????????????????????? 10 ????"
    lsCDoFireAim="????????????????????????????????????"
    lsQDoFireAimEnd="???????????????"
    lsCDoFireAimEnd="????????????????????????? ?????????????????????????????"
    lsQDoFireMelee="??????????????????????????????????????? 2 ????"
    lsCDoFireMelee="?? [E] ??????????????????????????"
    lsQDoFireMeleeEnd="????????????????????????????"
    lsCDoFireMeleeEnd="????????????????????????????????"
    lsQMoveTrainingField2="????????????????????????????????"
    lsCMoveTrainingField2="????????????????????????? ????????????????????? Rocket Launcher "
    lsQPickUpRocketLauncher="?????????????????????"
    lsCPickUpRocketLauncher="?????? [F] ???????????? Rocket Launcher"
    lsQDoFireRocketLauncher="????????????????????"
    lsCDoFireRocketLauncher="????? ????????????????????????????????????"
    lsQDoFireRocketLauncherEnd="?????????????????? Rocket Launcher"
    lsCDoFireRocketLauncherEnd="???????????????????????????????? ?????????????????????????"
    lsQMoveTrainingField3="????????????????????????????????"
    lsCMoveTrainingField3="???????????????????????????????? ?????????????????????????"
    lsQDoThrowingWeapon="??????????????????????? ????!"
    lsCDoThrowingWeapon="?????? [4] ??????????????????"
    lsQDoThrowingWeaponEnd="?????????????????"
    lsCDoThrowingWeaponEnd="????????????????????????????????"
    lsQBattleAIBot="?????????????"
    lsCBattleAIBot="?????? [1] ???????????????????????"
    lsQBattleAIBotEnd="???????????????????"
    lsCBattleAIBotEnd="???????????????????????????????????????????????"
    lsGiftPoint="BP"
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
    fDrawItemTime=2.0000000
    fDrawEffectTime1=0.4000000
    fDrawEffectTime2=0.2000000
    fDrawEffectTime3=0.1000000
    fFadeOutTime=0.5000000
    WGiftItemPopBG=(WidgetTexture=Texture'Warfare_TH_UI_HUD.Common.img_HUD_back_3',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=1024,Y2=4),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=739,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WGiftItemPopBG2=(WidgetTexture=Texture'Warfare_TH_UI_HUD.Common.img_HUD_back_3',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=1024,Y2=4),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=746,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WGiftItemBG=(WidgetTexture=Texture'Warfare_TH_UI_UI.Store.list_item_store_n',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=156,Y2=85),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=783,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    lsGiftItem="????????????????"
    strGiftItemBG="Warfare_TH_UI_UI.list_item_store_n"
    strRes_Icon="Warfare_TH_UI_Item.ShopIcon.Item_Item_FT_pt_bns"
    WNoticeExitBG=(WidgetTexture=Texture'Warfare_TH_UI_HUD.Common.img_HUD_tutorial_ESCbg',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=424,Y2=31),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=1176,OffsetY=4,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    lsNoticeExit="?????? [ESC] ?????????????????"
    fMessageDrawTime=1.5000000
    WQuestBG1=(WidgetTexture=Texture'Warfare_TH_UI_HUD.Common.img_HUD_tutorial_quest_bg1',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=908,Y2=119),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=346,OffsetY=161,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WQuestBGKey=(WidgetTexture=Texture'Warfare_TH_UI_HUD.Common.img_HUD_tutorial_quest_bg2',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=558,Y2=67),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=521,OffsetY=287,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WQuestKeyMouse=(WidgetTexture=Texture'Warfare_TH_UI_HUD.Common.img_keyboard_2',RenderStyle=5,TextureCoords=(X1=439,Y1=160,X2=503,Y2=224),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=768,OffsetY=289,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WQuestKeyLeftMouse=(WidgetTexture=Texture'Warfare_TH_UI_HUD.Common.img_keyboard_2',RenderStyle=5,TextureCoords=(X1=312,Y1=160,X2=376,Y2=224),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=768,OffsetY=289,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WQuestKeyRightMouse=(WidgetTexture=Texture'Warfare_TH_UI_HUD.Common.img_keyboard_2',RenderStyle=5,TextureCoords=(X1=376,Y1=160,X2=440,Y2=224),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=768,OffsetY=289,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
}