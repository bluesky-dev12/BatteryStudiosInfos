class wHUD_DefenceNew extends wHUD_Mission
    transient
    config(User);

var localized string strBotLevel;
var localized string strBotRound;
var localized string strReactor;
var localized string strPoint;
var localized string strScore;
var localized string strBuy;
var localized string lsIndication[2];
var localized string lsBotDifficulty[4];
var localized string lsNoteiceCanBuyItem;
var SpriteWidget WGaugeBG;
var SpriteWidget WGauge;
var SpriteWidget WGaugeWaring;
var bool bGaugeWaring;
var bool bGaugeWaringBlink;
var float fGaugeWaringBlinkTime;
var float fGaugeWaringBlinkStart;
var float OldHealth;
var wDefenceObjective NuclearFlag;
var Decoration NuclearBarricade;
var float NuclearMaxHeath;
var array<Decoration> arrBarricade;
var array<int> arrBarricadeMaxHealth;
var SpriteWidget WIndication[2];
var string strDifficulty;
var string strMyScore;
var SpriteWidget WItemBG;
var SpriteWidget WItemBG2;
var SpriteWidget WItem;
var SpriteWidget WKey;
var SpriteWidget WItemNumKey[2];
var SpriteWidget WMyPointBG;
var SpriteWidget WDrawBuyButton;
var SpriteWidget WBuyButton[3];
var SpriteWidget WOpenNumKey;
var SpriteWidget WKeyButtonBigF[2];
var bool bPlaySoundWarning;
var SpriteWidget WItemSlot[4];
var int ItemID[2];
var int ItemCount[2];
var string ItemComment[2];
var bool bSellectedItem;
var int iSellectedIndex;
var float fSellectedTime;
var float fBlinkLastTime;
var bool bInverseBlink;
var bool bBlinkBuyButton;
var SpriteWidget WHudBGR;
var SpriteWidget WItemPopBG;
var array<SpriteWidget> aWCashItemList;
var array<int> aCashItemList;
var array<string> aCashItemComment;
var array<byte> aCashItemKeyNum;

function OnTakeDamage()
{
    local float fRatio;

    fRatio = float(NuclearBarricade.Health) / float(NuclearBarricade.MaxHealth);
    // End:0x83
    if(fRatio < 0.1000000)
    {
        bGaugeWaring = true;
        // End:0x81
        if((Level.TimeSeconds - fGaugeWaringBlinkTime) > 0.2000000)
        {
            bGaugeWaringBlink = !bGaugeWaringBlink;
            fGaugeWaringBlinkTime = Level.TimeSeconds;
        }
        return;
    }
    // End:0xC1
    if(!bGaugeWaring)
    {
        bGaugeWaring = true;
        fGaugeWaringBlinkTime = Level.TimeSeconds;
        fGaugeWaringBlinkStart = Level.TimeSeconds;        
    }
    else
    {
        // End:0x103
        if((Level.TimeSeconds - fGaugeWaringBlinkTime) > 0.2000000)
        {
            bGaugeWaringBlink = !bGaugeWaringBlink;
            fGaugeWaringBlinkTime = Level.TimeSeconds;
        }
        // End:0x140
        if((Level.TimeSeconds - fGaugeWaringBlinkStart) > 2.5000000)
        {
            bGaugeWaring = false;
            OldHealth = float(NuclearBarricade.Health);
        }
    }
    //return;    
}

event PostBeginPlay()
{
    local wDefenceObjective DObject;
    local int lp1, EquipItemID, iSkillID, iSlotPos, iKeyNum, Index;

    local wCharacterManager chMgr;
    local wMyPlayerStatus sts;
    local wItemBaseParam ItemParam;
    local wSkillBaseParam skillParam;
    local Material matTex;
    local wItemResourceParam ItemResParam;
    local SpriteWidget WNumKey;
    local bool bDisplay;

    super.PostBeginPlay();
    // End:0x38
    foreach DynamicActors(Class'WMission_Decompressed.wDefenceObjective', DObject)
    {
        // End:0x37
        if(!DObject.IsA('wAttackObjective'))
        {
            NuclearFlag = DObject;
        }        
    }    
    switch(Level.GetMatchMaker().BotDifficulty)
    {
        // End:0x67
        case 1:
            strDifficulty = lsBotDifficulty[0];
            // End:0xB9
            break;
        // End:0x7C
        case 2:
            strDifficulty = lsBotDifficulty[1];
            // End:0xB9
            break;
        // End:0x92
        case 3:
            strDifficulty = lsBotDifficulty[2];
            // End:0xB9
            break;
        // End:0xA8
        case 4:
            strDifficulty = lsBotDifficulty[3];
            // End:0xB9
            break;
        // End:0xFFFF
        default:
            strDifficulty = "...";
            // End:0xB9
            break;
            break;
    }
    strDifficulty = strBotLevel $ strDifficulty;
    SetTimer(1.0000000, true);
    chMgr = Level.CharMgr;
    sts = chMgr.MyPlayer;
    lp1 = 0;
    J0x103:

    // End:0x357 [Loop If]
    if(lp1 < sts.ItemList.Length)
    {
        // End:0x34D
        if((sts.ItemList[lp1].iSlotPosition == int(26)) || sts.ItemList[lp1].iSlotPosition == int(29))
        {
            EquipItemID = sts.ItemList[lp1].iItemID;
            ItemParam = Level.GameMgr.GetItemParam(EquipItemID);
            ItemResParam = Level.GameMgr.GetItemResourceParam(ItemParam.iResourceID);
            matTex = Material(DynamicLoadObject(ItemResParam.Resource_UI_HUDEnable_File, Class'Engine.Material'));
            iKeyNum = -1;
            // End:0x284
            if((ItemParam.strAddOption[0] == "skill") && int(ItemParam.strOptionValue[0]) > 0)
            {
                iSkillID = int(ItemParam.strOptionValue[0]);
                skillParam = Level.GameMgr.GetSkillParam(iSkillID);
                iKeyNum = skillParam.iUseKey;
            }
            switch(iKeyNum)
            {
                // End:0x2E9
                case 7:
                    ItemID[0] = EquipItemID;
                    WItemSlot[0].WidgetTexture = matTex;
                    ItemCount[0] = sts.ItemList[lp1].iOverlapCount;
                    ItemComment[0] = ItemParam.strDescription;
                    // End:0x34D
                    break;
                // End:0x347
                case 8:
                    ItemID[1] = EquipItemID;
                    WItemSlot[1].WidgetTexture = matTex;
                    ItemCount[1] = sts.ItemList[lp1].iOverlapCount;
                    ItemComment[1] = ItemParam.strDescription;
                    // End:0x34D
                    break;
                // End:0xFFFF
                default:
                    // End:0x34D
                    break;
                    break;
            }
        }
        lp1++;
        // [Loop Continue]
        goto J0x103;
    }
    HudPart_ItemBuy.GetKeyTexture("7", WItemNumKey[0]);
    WItemNumKey[0].OffsetX = default.WItemNumKey[0].OffsetX;
    WItemNumKey[0].OffsetY = default.WItemNumKey[0].OffsetY;
    HudPart_ItemBuy.GetKeyTexture("8", WItemNumKey[1]);
    WItemNumKey[1].OffsetX = default.WItemNumKey[1].OffsetX;
    WItemNumKey[1].OffsetY = default.WItemNumKey[1].OffsetY;
    lp1 = 0;
    J0x3F4:

    // End:0x604 [Loop If]
    if(lp1 < Level.GameMgr.ItemParams.Length)
    {
        ItemParam = Level.GameMgr.ItemParams[lp1];
        // End:0x5FA
        if((ItemParam != none) && int(ItemParam.byModeItem) == Class'Engine.wGameSettings'.static.GetModeIndex_Defence())
        {
            bDisplay = false;
            switch(ItemParam.iItemID)
            {
                // End:0x48A
                case 92005:
                // End:0x49D
                case 92006:
                    bDisplay = true;
                    // End:0x4A3
                    break;
                // End:0xFFFF
                default:
                    // End:0x4A3
                    break;
                    break;
            }
            // End:0x4B1
            if(!bDisplay)
            {
                // [Explicit Continue]
                goto J0x5FA;
            }
            ItemResParam = Level.GameMgr.GetItemResourceParam(ItemParam.iResourceID);
            matTex = Material(DynamicLoadObject(ItemResParam.Resource_UI_HUDEnable_File, Class'Engine.Material'));
            Index = aWCashItemList.Length;
            aWCashItemList.Insert(Index, 1);
            aWCashItemList[Index].WidgetTexture = matTex;
            Index = aCashItemComment.Length;
            aCashItemComment.Insert(Index, 1);
            aCashItemComment[Index] = ItemParam.strDescription;
            // End:0x5FA
            if((ItemParam.strAddOption[0] == "skill") && int(ItemParam.strOptionValue[0]) > 0)
            {
                iSkillID = int(ItemParam.strOptionValue[0]);
                skillParam = Level.GameMgr.GetSkillParam(iSkillID);
                iKeyNum = skillParam.iUseKey;
                aCashItemKeyNum[aCashItemKeyNum.Length] = byte(iKeyNum);
            }
        }
        J0x5FA:

        lp1++;
        // [Loop Continue]
        goto J0x3F4;
    }
    //return;    
}

function Actor GetNuclearReactor()
{
    return NuclearBarricade;
    //return;    
}

function OnClientReceiveDeathMessage(PlayerController P, int Switch, PlayerReplicationInfo attackerPRI, PlayerReplicationInfo victimPRI, optional Object OptionalObject)
{
    local Class<DamageType> DamageType;

    DamageType = Class<DamageType>(OptionalObject);
    // End:0x107
    if((P != none) && DamageType != none)
    {
        // End:0xE4
        if(attackerPRI != none)
        {
            HudPart_KillMessage.AddKillMessage(attackerPRI, victimPRI, DamageType, Switch);
            // End:0xE1
            if((attackerPRI == PlayerOwner.PlayerReplicationInfo) || victimPRI == PlayerOwner.PlayerReplicationInfo)
            {
                LastSelfKillMessage = MakeSelfKillMessage(attackerPRI.PlayerName, victimPRI.PlayerName, DamageType);
                // End:0xE1
                if(victimPRI == PlayerOwner.PlayerReplicationInfo)
                {
                    RefreshKillerMark(attackerPRI.PlayerName);
                }
            }            
        }
        else
        {
            HudPart_KillMessage.AddKillMessage(attackerPRI, victimPRI, DamageType, Switch);
        }
    }
    //return;    
}

simulated function LocalizedMessageEx(Class<LocalMessage> Message, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject, optional string CriticalString, optional int iReserve)
{
    local int i, k, iCountMessageScore, iIndexMessage;
    local PlayerReplicationInfo HUDPRI;
    local float fAddTime, fIntervalTime, fNextDrawIntervalTime;

    Log((((string(self) $ "[LocalizedMessageEx] Message=") $ string(Message)) $ "  Switch=") $ string(Switch));
    fNextDrawIntervalTime = 0.4000000;
    // End:0x5D
    if(Message == none)
    {
        return;
    }
    // End:0x7C
    if(bIsCinematic && !ClassIsChildOf(Message, Class'Gameplay.ActionMessage'))
    {
        return;
    }
    // End:0x21A
    if(CriticalString == "")
    {
        // End:0xC0
        if((PawnOwner != none) && PawnOwner.PlayerReplicationInfo != none)
        {
            HUDPRI = PawnOwner.PlayerReplicationInfo;            
        }
        else
        {
            HUDPRI = PlayerOwner.PlayerReplicationInfo;
        }
        // End:0x180
        if(HUDPRI == RelatedPRI_1)
        {
            // End:0x154
            if(Switch == 0)
            {
                Log((((("Message=" $ string(Message)) $ " [Code_CantProne] [Switch] : ") $ string(Switch)) $ " / player bProne:") $ string(PlayerOwner.bProne));
            }
            CriticalString = Message.static.GetRelatedString(Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);            
        }
        else
        {
            // End:0x1F1
            if(Switch == 0)
            {
                Log((((("Message=" $ string(Message)) $ " [Code_CantProne] [Switch] : ") $ string(Switch)) $ " / player bProne:") $ string(PlayerOwner.bProne));
            }
            CriticalString = Message.static.GetString(Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
        }
    }
    // End:0x246
    if(bMessageBeep && Message.default.bBeep)
    {
        PlayerOwner.PlayBeepSound();
    }
    // End:0x2E2
    if(!Message.default.bIsSpecial)
    {
        // End:0x2E0
        if(PlayerOwner.bDemoOwner)
        {
            i = 0;
            J0x273:

            // End:0x2B4 [Loop If]
            if(i < ConsoleMessageCount)
            {
                // End:0x2AA
                if((i >= 8) || TextMessages[i].Text == "")
                {
                    // [Explicit Break]
                    goto J0x2B4;
                }
                i++;
                // [Loop Continue]
                goto J0x273;
            }
            J0x2B4:

            // End:0x2E0
            if((i > 0) && TextMessages[i - 1].Text == CriticalString)
            {
                return;
            }
        }
        return;
    }
    i = 8;
    // End:0x352
    if(Message.default.bIsUnique)
    {
        i = 0;
        J0x303:

        // End:0x34F [Loop If]
        if(i < 8)
        {
            // End:0x328
            if(LocalMessages[i].Message == none)
            {
                // [Explicit Continue]
                goto J0x345;
            }
            // End:0x345
            if(LocalMessages[i].Message == Message)
            {
                // [Explicit Break]
                goto J0x34F;
            }
            J0x345:

            i++;
            // [Loop Continue]
            goto J0x303;
        }
        J0x34F:
        
    }
    else
    {
        // End:0x46B
        if(Message.default.bIsPartiallyUnique || PlayerOwner.bDemoOwner)
        {
            i = 0;
            J0x37F:

            // End:0x46B [Loop If]
            if(i < 8)
            {
                // End:0x3A4
                if(LocalMessages[i].Message == none)
                {
                    // [Explicit Continue]
                    goto J0x461;
                }
                // End:0x3DD
                if((LocalMessages[i].Message == Message) && LocalMessages[i].Switch == Switch)
                {
                    // [Explicit Break]
                    goto J0x46B;
                }
                // End:0x452
                if(Message == Class'Engine.wMessage_Game_ImpSystem')
                {
                    // End:0x44F
                    if(LocalMessages[i].Message == Message)
                    {
                        // End:0x44F
                        if(Class'Engine.wMessage_Game_ImpSystem'.static.IsMessageMode(LocalMessages[i].Switch) || Class'Engine.wMessage_Game_ImpSystem'.static.IsMessageSystem(LocalMessages[i].Switch))
                        {
                            // [Explicit Break]
                            goto J0x46B;
                        }
                    }
                    // [Explicit Continue]
                    goto J0x461;
                }
                // End:0x461
                if(Message == Class'Engine.wMessage_Score')
                {
                }
                J0x461:

                i++;
                // [Loop Continue]
                goto J0x37F;
            }
        }
    }
    J0x46B:

    // End:0x4AD
    if(i == 8)
    {
        i = 0;
        J0x47E:

        // End:0x4AD [Loop If]
        if(i < 8)
        {
            // End:0x4A3
            if(LocalMessages[i].Message == none)
            {
                // [Explicit Break]
                goto J0x4AD;
            }
            i++;
            // [Loop Continue]
            goto J0x47E;
        }
    }
    J0x4AD:

    // End:0x4F3
    if(i == 8)
    {
        i = 0;
        J0x4C0:

        // End:0x4F3 [Loop If]
        if(i < (8 - 1))
        {
            LocalMessages[i] = LocalMessages[i + 1];
            i++;
            // [Loop Continue]
            goto J0x4C0;
        }
    }
    ClearMessage(LocalMessages[i]);
    LocalMessages[i].Message = Message;
    LocalMessages[i].Switch = Switch;
    LocalMessages[i].RelatedPRI = RelatedPRI_1;
    LocalMessages[i].RelatedPRI2 = RelatedPRI_2;
    LocalMessages[i].OptionalObject = OptionalObject;
    LocalMessages[i].EndOfLife = Message.static.GetLifeTime(Switch) + Level.TimeSeconds;
    LocalMessages[i].StringMessage = CriticalString;
    LocalMessages[i].Lifetime = Message.static.GetLifeTime(Switch);
    LocalMessages[i].StartTime = Level.TimeSeconds;
    LocalMessages[i].PlaySound = false;
    LocalMessages[i].iReserve = iReserve;
    // End:0x78A
    if((LocalMessages[i].Message == Class'Engine.wMessage_Score') || LocalMessages[i].Message == Class'Engine.wMultiKillMessage')
    {
        k = 0;
        J0x667:

        // End:0x6FD [Loop If]
        if(k < 8)
        {
            // End:0x685
            if(i == k)
            {
                // [Explicit Break]
                goto J0x6FD;
            }
            // End:0x6F3
            if((LocalMessages[k].Message == Class'Engine.wMessage_Score') || LocalMessages[k].Message == Class'Engine.wMultiKillMessage')
            {
                iCountMessageScore++;
                fIntervalTime = Level.TimeSeconds - LocalMessages[k].StartTime;
                iIndexMessage = k;
            }
            k++;
            // [Loop Continue]
            goto J0x667;
        }
        J0x6FD:

        // End:0x78A
        if((iCountMessageScore >= 1) && fIntervalTime < fNextDrawIntervalTime)
        {
            fAddTime = fNextDrawIntervalTime;
            LocalMessages[i].StartTime = fAddTime + LocalMessages[iIndexMessage].StartTime;
            LocalMessages[i].EndOfLife = (fAddTime + Message.static.GetLifeTime(Switch)) + LocalMessages[iIndexMessage].StartTime;
        }
    }
    // End:0x8B9
    if(LocalMessages[i].Message == Class'Engine.wSpecialKillMessage')
    {
        iCountMessageScore = 0;
        k = 0;
        J0x7B2:

        // End:0x82C [Loop If]
        if(k < 8)
        {
            // End:0x7D0
            if(i == k)
            {
                // [Explicit Break]
                goto J0x82C;
            }
            // End:0x822
            if(LocalMessages[k].Message == Class'Engine.wSpecialKillMessage')
            {
                iCountMessageScore++;
                fIntervalTime = Level.TimeSeconds - LocalMessages[k].StartTime;
                iIndexMessage = k;
            }
            k++;
            // [Loop Continue]
            goto J0x7B2;
        }
        J0x82C:

        // End:0x8B9
        if((iCountMessageScore >= 1) && fIntervalTime < fNextDrawIntervalTime)
        {
            fAddTime = fNextDrawIntervalTime;
            LocalMessages[i].StartTime = fAddTime + LocalMessages[iIndexMessage].StartTime;
            LocalMessages[i].EndOfLife = (fAddTime + Message.static.GetLifeTime(Switch)) + LocalMessages[iIndexMessage].StartTime;
        }
    }
    //return;    
}

function InitHudPart_ItemBuy()
{
    local array<string> keys, LocalizedKeys;

    HudPart_ItemBuy = Spawn(Class'XInterface.wHudPart_ItemBuy', self);
    HudPart_ItemBuy.Initialize(self, Level);
    WOpenNumKey = WKeyButtonBigF[0];
    //return;    
}

exec function ShowItemBuyWindow()
{
    local float fDeltaTime;

    // End:0x0D
    if(PlayerOwner == none)
    {
        return;
    }
    fDeltaTime = Level.TimeSeconds - PlayerOwner.fBuyedTime;
    // End:0x54
    if(Level.TimeSeconds < 0.3000000)
    {
        fDeltaTime = 0.4000000;
    }
    // End:0x65
    if(fDeltaTime < 0.3000000)
    {
        return;
    }
    // End:0x7D
    if(int(byShowItemBuy) != 1)
    {
        byShowItemBuy = 1;        
    }
    else
    {
        byShowItemBuy = 0;
    }
    // End:0x129
    if(int(byShowItemBuy) > 0)
    {
        // End:0xB8
        if(true == PlayerOwner.bToggleRadioMessage)
        {
            PlayerOwner.bToggleRadioMessage = false;
        }
        // End:0xDE
        if(true == PlayerOwner.bToggleQuickSlotWindow)
        {
            PlayerOwner.bToggleQuickSlotWindow = false;
        }
        PlayerOwner.bToggleItemBuyWindow = true;
        PlayerOwner.FmodClientPlaySound("Warfare_Sound_Defense_Mode/ui/buyclick");        
    }
    else
    {
        PlayerOwner.bToggleItemBuyWindow = false;
    }
    PlayerOwner.fBuyedTime = Level.TimeSeconds;
    //return;    
}

function CacheSpecialPositions()
{
    local DECO_Barricade Deco;

    Log(string(self) $ "[CacheSpecialPositions]");
    super(HudCDeathmatch).CacheSpecialPositions();
    arrBarricade.Length = 0;
    arrBarricadeMaxHealth.Length = 0;
    // End:0x92
    foreach DynamicActors(Class'WGame.DECO_Barricade', Deco)
    {
        arrBarricade[arrBarricade.Length] = Deco;
        // End:0x91
        if((NuclearFlag != none) && NuclearFlag.Barricade == Deco.EventTagName)
        {
            NuclearBarricade = Deco;
        }        
    }    
    //return;    
}

simulated function DrawHudPassA(Canvas C)
{
    super.DrawHudPassA(C);
    DrawMyGainPoint(C);
    // End:0x3C
    if(PlayerOwner.bToggleItemBuyWindow)
    {
        HudPart_ItemBuy.DrawHudPassA(C);
    }
    bSellectedItem = false;
    //return;    
}

function DrawSpectatingHud(Canvas C)
{
    super.DrawSpectatingHud(C);
    // End:0x6A
    if(DiedTime > float(0))
    {
        DrawItemDescriptionWhenRespawn(C);
        DrawNoticeCanBuyItem(C);
        DrawMyGainPoint(C);
        // End:0x5F
        if(PlayerOwner.bToggleItemBuyWindow)
        {
            HudPart_ItemBuy.DrawHudPassA(C);
        }
        DrawNuclearHP(C);
    }
    //return;    
}

function DrawNoticeCanBuyItem(Canvas C)
{
    local CalCoordsW calW;
    local float fWidth, fHeigt;
    local int Y1, Y2;

    fWidth = 800.0000000;
    fHeigt = 56.0000000;
    WHudBGR.OffsetX = int(float(800) - (fWidth / float(2)));
    WHudBGR.OffsetY = 870;
    CalculateCoordinateEx(C, WHudBGR, fWidth, fHeigt, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WHudBGR.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    Y1 = int(float(870) * _reY);
    Y2 = int(float(Y1) + (fHeigt * _reY));
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine(lsNoteiceCanBuyItem, 1, 0.0000000, float(Y1), 1600.0000000 * _reX, float(Y2), int(float(26) * _reY));
    //return;    
}

function DrawItemDescriptionWhenRespawn(Canvas C)
{
    local CalCoordsW calW;
    local float fWidth, X1, Y1, X2, Y2, fRespawnTimeLength,
	    fRmaingTime;

    local int iFirst, iSecond, iCashItemCount, irandnum, iKeyIndex;

    local string strDescription;

    fRespawnTimeLength = PlayerOwner.AdjustRespawnTime();
    // End:0x36
    if(Level.TimeSeconds > (DiedTime + fRespawnTimeLength))
    {
        return;
    }
    // End:0x53
    if(Level.GRI.bStopCountDown)
    {
        return;
    }
    iCashItemCount = aWCashItemList.Length;
    // End:0x212
    if(iCashItemCount > 0)
    {
        // End:0xE9
        if(!bSellectedItem)
        {
            irandnum = int(float(Rand(1000)) % float(iCashItemCount));
            // End:0xC2
            if(irandnum == iSellectedIndex)
            {
                irandnum = irandnum + 1;
                // End:0xC2
                if(irandnum >= iCashItemCount)
                {
                    irandnum = 0;
                }
            }
            iSellectedIndex = irandnum;
            bSellectedItem = true;
            fSellectedTime = Level.TimeSeconds;
        }
        // End:0x110
        if((Level.TimeSeconds - fSellectedTime) > 3.0000000)
        {
            bSellectedItem = false;
        }
        // End:0x12E
        if(int(aCashItemKeyNum[iSellectedIndex]) == 7)
        {
            iKeyIndex = 0;            
        }
        else
        {
            iKeyIndex = 1;
        }
        DrawItemDescription(C, 531.0000000, 445.0000000, WItemBG, aWCashItemList[iSellectedIndex].WidgetTexture, iKeyIndex, -1);
        X1 = 641.0000000 * _reX;
        Y1 = 466.0000000 * _reY;
        X2 = 1273.0000000 * _reX;
        Y2 = 484.0000000 * _reY;
        C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
        C.BtrDrawTextJustifiedWithVolumeLine(aCashItemComment[iSellectedIndex], 0, X1, Y1, X2, Y2, int(float(14) * _reY), DefaultShadow);
    }
    fRmaingTime = fRespawnTimeLength - (Level.TimeSeconds - self.DiedTime);
    fRmaingTime = fRmaingTime % 100.0000000;
    iFirst = int(fRmaingTime % float(100));
    iSecond = int(float(int(fRmaingTime * float(10))) % float(10));
    C.SetDrawColor(byte(255), 0, 0, byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine((string(iFirst) $ ".") $ string(iSecond), 1, 0.0000000, 390.0000000 * _reY, C.ClipX, 415.0000000 * _reY, int(float(18) * _reY), DefaultShadow);
    //return;    
}

function DrawItemDescription(Canvas C, float PosX, float PosY, SpriteWidget WBG, Material mItem, optional int isellect, optional int ItemNum)
{
    local CalCoordsW calW;
    local float fWidth, fHeight, X1, Y1, X2, Y2;

    local string strDescription;
    local SpriteWidget ItemBG;

    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    ItemBG = WBG;
    ItemBG.OffsetX = int(PosX);
    ItemBG.OffsetY = int(PosY);
    CalculateCoordinateEx(C, ItemBG, float(ItemBG.TextureCoords.X2), float(ItemBG.TextureCoords.Y2), calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(ItemBG.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    // End:0x38F
    if(mItem != none)
    {
        WItemPopBG.OffsetX = int(PosX - float(4));
        WItemPopBG.OffsetY = int(PosY - float(4));
        C.BtrTextSize(aCashItemComment[iSellectedIndex], 14, fWidth, fHeight);
        CalculateCoordinateEx(C, WItemPopBG, 110.0000000 + fWidth, 64.0000000 + float(12), calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WItemPopBG.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
        WItem.WidgetTexture = mItem;
        WItem.OffsetX = int(PosX + float(2));
        WItem.OffsetY = int(PosY + float(2));
        CalculateCoordinateEx(C, WItem, float(WItem.TextureCoords.X2), float(WItem.TextureCoords.Y2), calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WItem.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
        // End:0x38F
        if(ItemNum >= 0)
        {
            X1 = PosX * _reX;
            Y1 = (PosY + float(48)) * _reY;
            X2 = (PosX + float(56)) * _reX;
            Y2 = (PosY + float(60)) * _reY;
            C.BtrDrawTextJustifiedWithVolumeLine(string(ItemNum), 2, X1, Y1, X2, Y2, int(float(10) * _reY));
        }
    }
    // End:0x479
    if(isellect >= 0)
    {
        WItemNumKey[isellect].OffsetX = int(PosX + float(66));
        WItemNumKey[isellect].OffsetY = int(PosY + float(3));
        CalculateCoordinateEx(C, WItemNumKey[isellect], 26.0000000, 26.0000000, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WItemNumKey[isellect].WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    }
    //return;    
}

function DrawSelfKillMessage(Canvas C)
{
    local CalCoordsW calW;

    // End:0x1A3
    if((LastSelfKillMessage.Time != float(0)) && (Level.TimeSeconds - LastSelfKillMessage.Time) < float(3))
    {
        // End:0x7B
        if((LastSelfKillMessage.KillerName != LastSelfKillMessage.VictimName) && LastSelfKillMessage.KillerName == PlayerOwner.PlayerReplicationInfo.PlayerName)
        {            
        }
        else
        {
            CalculateCoordinateEx(C, WBGKillMessage, 1600.0000000, 104.0000000, calW);
            C.SetPos(calW.X1, calW.Y1);
            C.DrawTile(WBGKillMessage.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
            C.DrawColor = LastSelfKillMessage.MessageColor;
            C.BtrDrawTextJustifiedWithVolumeLine(LastSelfKillMessage.Message, 1, 0.0000000 * _reX, 365.0000000 * _reY, 1600.0000000 * _reX, 365.0000000 * _reY, int(float(24) * _reY), color_Shadow);
            C.SetDrawColor(byte(255), byte(255), byte(255));
        }
    }
    //return;    
}

function DrawMyGainPoint(Canvas C)
{
    local CalCoordsW calW;
    local float fWidth, X1, Y1, X2, Y2;

    local int iPoint;

    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    CalculateCoordinateEx(C, WMyPointBG, 916.0000000, 49.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WMyPointBG.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    X1 = 432.0000000 * _reX;
    Y1 = 1169.0000000 * _reY;
    X2 = 583.0000000 * _reX;
    Y2 = 1189.0000000 * _reY;
    C.BtrDrawTextJustifiedWithVolumeLine(strPoint, 2, X1, Y1, X2, Y2, int(float(15) * _reY));
    // End:0x1B2
    if(HudPart_ItemBuy.bEnableItemBuy)
    {
        // End:0x160
        if(bInverseBlink)
        {
            WDrawBuyButton = WBuyButton[0];            
        }
        else
        {
            WDrawBuyButton = WBuyButton[1];
        }
        // End:0x1AF
        if((Level.TimeSeconds - fBlinkLastTime) > 0.5000000)
        {
            bInverseBlink = !bInverseBlink;
            fBlinkLastTime = Level.TimeSeconds;
        }        
    }
    else
    {
        WDrawBuyButton = WBuyButton[0];
    }
    CalculateCoordinateEx(C, WDrawBuyButton, 282.0000000, 71.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WDrawBuyButton.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    WOpenNumKey.OffsetX = 824;
    WOpenNumKey.OffsetY = 1134;
    CalculateCoordinateEx(C, WOpenNumKey, 52.0000000, 52.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WOpenNumKey.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    X1 = 880.0000000 * _reX;
    Y1 = 1148.0000000 * _reY;
    X2 = 1098.0000000 * _reX;
    Y2 = 1171.0000000 * _reY;
    C.BtrDrawTextJustifiedWithVolumeLine(strBuy, 1, X1, Y1, X2, Y2, int(float(15) * _reY));
    iPoint = int(PlayerOwner.PlayerReplicationInfo.PointIns);
    X1 = 598.0000000 * _reX;
    Y1 = 1169.0000000 * _reY;
    X2 = 807.0000000 * _reX;
    Y2 = 1189.0000000 * _reY;
    C.SetDrawColor(174, byte(255), 0, byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine(string(iPoint), 1, X1, Y1, X2, Y2, int(float(17) * _reY));
    X1 = 598.0000000 * _reX;
    Y1 = 1169.0000000 * _reY;
    X2 = 807.0000000 * _reX;
    Y2 = 1189.0000000 * _reY;
    C.BtrDrawTextJustifiedWithVolumeLine("p", 2, X1, Y1, X2, Y2, int(float(17) * _reY));
    //return;    
}

function DrawHudPassA_Score(Canvas C)
{
    DrawNuclearHP(C);
    HudPart_DisplayEvent.DrawDFScore(C);
    //return;    
}

function DrawNuclearHP(Canvas C)
{
    local CalCoordsW calW;
    local float fWidth, fProgressPct, X1, Y1, X2, Y2;

    local string strRound, sHealth;
    local int iScore, lp1;

    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    CalculateCoordinateEx(C, WGaugeBG, 867.0000000, 99.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WGaugeBG.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    // End:0x161
    if(bGaugeWaring && bGaugeWaringBlink)
    {
        CalculateCoordinateEx(C, WGaugeWaring, 440.0000000, 48.0000000, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WGaugeWaring.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    }
    // End:0x197
    if(NuclearBarricade != none)
    {
        fProgressPct = float(NuclearBarricade.Health) / float(NuclearBarricade.MaxHealth);        
    }
    fWidth = 412.0000000 * fProgressPct;
    CalculateCoordinateEx(C, WGauge, fWidth, 26.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WGauge.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL * fProgressPct, calW.VL);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    X1 = 785.0000000 * _reX;
    Y1 = 12.0000000 * _reY;
    X2 = 826.0000000 * _reX;
    Y2 = 28.0000000 * _reY;
    C.BtrDrawTextJustifiedWithVolumeLine(string(HudPart_DisplayEvent.CurrentRound), 1, X1, Y1, X2, Y2, int(float(15) * _reY));
    X1 = 666.0000000 * _reX;
    Y1 = 72.0000000 * _reY;
    X2 = 917.0000000 * _reX;
    Y2 = 96.0000000 * _reY;
    iScore = int(PlayerOwner.PlayerReplicationInfo.Score);
    C.BtrDrawTextJustifiedWithVolumeLine((string(iScore) $ "  ") $ strScore, 1, X1, Y1, X2, Y2, int(float(23) * _reY));
    C.SetDrawColor(byte(255), 204, 0, byte(255));
    X1 = 583.0000000 * _reX;
    Y1 = 14.0000000 * _reY;
    X2 = 710.0000000 * _reX;
    Y2 = 28.0000000 * _reY;
    C.BtrDrawTextJustifiedWithVolumeLine(strDifficulty, 0, X1, Y1, X2, Y2, int(float(12) * _reY));
    C.SetDrawColor(204, 204, 204, byte(255));
    X1 = 420.0000000 * _reX;
    Y1 = 44.0000000 * _reY;
    X2 = 577.0000000 * _reX;
    Y2 = 58.0000000 * _reY;
    C.BtrDrawTextJustifiedWithVolumeLine(strReactor, 2, X1, Y1, X2, Y2, int(float(10) * _reY));
    X1 = 697.0000000 * _reX;
    Y1 = 12.0000000 * _reY;
    X2 = 785.0000000 * _reX;
    Y2 = 28.0000000 * _reY;
    C.BtrDrawTextJustifiedWithVolumeLine(strBotRound, 1, X1, Y1, X2, Y2, int(float(14) * _reY));
    X1 = 831.0000000 * _reX;
    Y1 = 12.0000000 * _reY;
    X2 = 872.0000000 * _reX;
    Y2 = 28.0000000 * _reY;
    C.BtrDrawTextJustifiedWithVolumeLine(string(Level.GRI.GoalScore), 1, X1, Y1, X2, Y2, int(float(15) * _reY));
    lp1 = 0;
    J0x5E8:

    // End:0x645 [Loop If]
    if(lp1 < 2)
    {
        DrawItemDescription(C, 1502.0000000, 434.0000000 + float(lp1 * 72), WItemBG2, WItemSlot[lp1].WidgetTexture, lp1, ItemCount[lp1]);
        lp1++;
        // [Loop Continue]
        goto J0x5E8;
    }
    // End:0x665
    if(OldHealth != float(NuclearBarricade.Health))
    {
        OnTakeDamage();
    }
    //return;    
}

function DrawAddScore(Canvas C, int i, float ScorePosX, float ScorePosY, optional int MessageScoreEffect, optional float CurrentScale)
{
    local int iGainPoint;

    // End:0xA0
    if(LocalMessages[i].Message == Class'Engine.wMessage_Score')
    {
        // End:0x56
        if(LocalMessages[i].Switch == Class'Engine.wMessage_Score'.default.Code_GainBonusPoint)
        {
            iGainPoint = LocalMessages[i].iReserve;            
        }
        else
        {
            iGainPoint = LocalMessages[i].Switch;
        }
        HudPart_DisplayEvent.DrawPlusPoint_Defence(C, iGainPoint, int(ScorePosX), int(ScorePosY), MessageScoreEffect, CurrentScale);        
    }
    else
    {
        // End:0xF6
        if(LocalMessages[i].Message == Class'Engine.wMultiKillMessage')
        {
            HudPart_DisplayEvent.DrawPlusPoint_Defence(C, LocalMessages[i].iReserve, int(ScorePosX), int(ScorePosY), MessageScoreEffect, CurrentScale);
        }
    }
    //return;    
}

function DrawHPBar_Alien(Canvas C, Pawn Pawn)
{
    local float fRatioX, fRatioY, fWidth, fHeight, fProgressPct;

    local CalCoordsW calW;
    local float X1, Y1, X2, Y2, fRatioWidth;

    local string sHealth;

    fRatioWidth = 1.0000000;
    C.SetDrawColor(0, 0, 0, 150);
    CalculateCoordinateEx(C, WGauge, 420.0000000, 24.0000000, calW);
    C.SetPos(590.0000000 * _reX, 108.0000000 * _reY);
    C.DrawTile(WGauge.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    C.SetDrawColor(byte(255), 0, 0, byte(255));
    fProgressPct = float(Pawn.Health) / Pawn.HealthMax;
    fWidth = 420.0000000 * fProgressPct;
    CalculateCoordinateEx(C, WGauge, fWidth, 24.0000000, calW);
    C.SetPos(590.0000000 * _reX, 108.0000000 * _reY);
    C.DrawTile(WGauge.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL * fProgressPct, calW.VL);
    C.DrawColor = WhiteColor;
    sHealth = (string(Pawn.Health) $ "/") $ string(int(Pawn.HealthMax));
    X1 = 590.0000000 * _reX;
    Y1 = 108.0000000 * _reY;
    X2 = X1 + (float(420) * _reX);
    Y2 = Y1 + (float(20) * _reY);
    C.BtrDrawTextJustified((Caps(Pawn.OwnerName) $ ":") $ sHealth, 0, X1, Y1, X2, Y2, int(float(10) * _rY));
    //return;    
}

function DrawNametags_Barricade(Canvas C, bool bSpectateMode)
{
    local int i;
    local Decoration Deco;
    local bool bFront;
    local Vector vPos, NametagScreenPos, camLoc;
    local Rotator camRot;
    local string strHealth;
    local float fRatioZ, fWidth, fHeight, fProgressPct, X1, Y1,
	    X2, Y2;

    local CalCoordsW calW;
    local SpriteWidget objectSprite;
    local float W, H;
    local Vector ScreenPos;
    local byte clipped;

    i = 0;
    J0x07:

    // End:0x466 [Loop If]
    if(i < arrBarricade.Length)
    {
        Deco = arrBarricade[i];
        // End:0x53
        if(Deco.bHidden || Deco.Health < 1)
        {
            // [Explicit Continue]
            goto J0x45C;
        }
        vPos = Deco.Location;
        vPos.Z += Deco.CollisionHeight;
        C.GetCameraLocation(camLoc, camRot);
        bFront = IsTargetInFrontOfPlayer2(C, vPos, NametagScreenPos, camLoc, camRot);
        // End:0x45C
        if(bFront)
        {
            // End:0xE8
            if(NuclearBarricade == Deco)
            {
                objectSprite = WIndication[1];                
            }
            else
            {
                objectSprite = WIndication[0];
            }
            objectSprite.PosX = NametagScreenPos.X / C.ClipX;
            objectSprite.PosY = NametagScreenPos.Y / C.ClipY;
            C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
            CalculateCoordinateEx(C, WIndication[0], 128.0000000, 128.0000000, calW);
            C.SetPos(NametagScreenPos.X, NametagScreenPos.Y);
            // End:0x21F
            if(NuclearBarricade == Deco)
            {
                C.DrawTile(WIndication[1].WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
                C.DrawColor = GreenColor;                
            }
            else
            {
                C.DrawTile(WIndication[0].WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
                C.DrawColor = RedColor;
            }
            X1 = NametagScreenPos.X + (float(11) * _reX);
            Y1 = NametagScreenPos.Y + (float(40) * _reY);
            X2 = X1 + (float(106) * _reX);
            Y2 = Y1 + (float(15) * _reY);
            // End:0x33F
            if(NuclearBarricade == Deco)
            {
                C.BtrDrawTextJustified(lsIndication[1], 1, X1, Y1, X2, Y2, int(float(12) * _reY));                
            }
            else
            {
                C.BtrDrawTextJustified(lsIndication[0], 1, X1, Y1, X2, Y2, int(float(12) * _reY));
            }
            C.DrawColor = WhiteColor;
            strHealth = string(Deco.Health);
            X1 = NametagScreenPos.X + (float(11) * _reX);
            Y1 = NametagScreenPos.Y + (float(58) * _reY);
            X2 = X1 + (float(106) * _reX);
            Y2 = Y1 + (float(15) * _reY);
            C.BtrDrawTextJustifiedWithVolumeLine((strHealth $ " / ") $ string(Deco.MaxHealth), 1, X1, Y1, X2, Y2, int(float(12) * _reY));
        }
        J0x45C:

        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function DrawNametags(Canvas C, bool bSpectateMode, optional bool drawAlways)
{
    DrawNametagsScript(C, bSpectateMode, drawAlways);
    DrawNametags_Barricade(C, bSpectateMode);
    //return;    
}

function DrawNametagsScript(Canvas C, bool bSpectateMode, optional bool drawAlways)
{
    local wPawn curPawn, sellectedPawn, wPawnOwner;
    local Vector camLoc;
    local Rotator camRot;
    local float X1, Y1, X2, Y2, width, Height;

    local bool curPawnSameTeam;
    local Vector centerScreenPos;
    local bool bDraw;
    local Vector curPawnCenterPos, HitLocation, HitNormal, TraceEnd;
    local float markWidth, markHeight;
    local bool bUpdateNametagVis;
    local int lp1;

    centerScreenPos.X = C.ClipX / float(2);
    centerScreenPos.Y = C.ClipY / float(2);
    centerScreenPos.Z = 1.0000000;
    markWidth = 24.0000000 * _rX;
    markHeight = 24.0000000 * _rY;
    bUpdateNametagVis = (Level.TimeSeconds - NameTagVisUpdateTime) > 0.0500000;
    // End:0xB2
    if(bUpdateNametagVis)
    {
        NameTagVisUpdateTime = Level.TimeSeconds;
    }
    // End:0x5A6
    if(PawnOwnerPRI != none)
    {
        wPawnOwner = wPawn(PawnOwner);
        C.GetCameraLocation(camLoc, camRot);
        TraceEnd = camLoc + (float(100000) * Vector(camRot));
        lp1 = 0;
        J0x10A:

        // End:0x5A6 [Loop If]
        if(lp1 < Level.PawnList.Length)
        {
            curPawn = wPawn(Level.PawnList[lp1]);
            // End:0x164
            if((curPawn == none) || curPawn.bHidden)
            {
                // [Explicit Continue]
                goto J0x59C;
            }
            // End:0x1B4
            if((curPawn.DrivenVehicle != none) && curPawn.PlayerReplicationInfo == none)
            {
                curPawn.PlayerReplicationInfo = curPawn.DrivenVehicle.PlayerReplicationInfo;
            }
            // End:0x59C
            if(curPawn != none)
            {
                // End:0x20F
                if((curPawn.TeamIndex < 0) || Level.GRI.GameClass ~= "wGame.wDeathMatch")
                {
                    curPawnSameTeam = false;                    
                }
                else
                {
                    curPawnSameTeam = curPawn.TeamIndex == PawnOwnerPRI.Team.TeamIndex;
                }
                curPawn.NametagPosition = CalcNametagPos(curPawn);
                // End:0x28E
                if(curPawn.IsA('wDefenceBoss'))
                {
                    curPawn.NametagPosition.Z += curPawn.CollisionHeight;
                }
                curPawn.NametagVisInFront = IsTargetInFrontOfPlayer2(C, curPawn.NametagPosition, curPawn.NametagScreenPos, camLoc, camRot);
                // End:0x59C
                if(curPawn.NametagVisInFront)
                {
                    bDraw = drawAlways;
                    // End:0x302
                    if(curPawnSameTeam)
                    {
                        bDraw = true;                        
                    }
                    else
                    {
                        // End:0x3CA
                        if(!bSpectateMode)
                        {
                            // End:0x33C
                            if(bUpdateNametagVis)
                            {
                                curPawn.NametagVisFastTrace = FastTrace(curPawn.NametagPosition, camLoc);
                            }
                            // End:0x3CA
                            if(curPawn.NametagVisFastTrace)
                            {
                                curPawnCenterPos = curPawn.Location;
                                curPawnCenterPos.Z += float(40);
                                // End:0x3AE
                                if(bUpdateNametagVis)
                                {
                                    curPawn.NametagVisTraceThisActor = curPawn.TraceThisActor(HitLocation, HitNormal, TraceEnd, camLoc);
                                }
                                // End:0x3CA
                                if(!curPawn.NametagVisTraceThisActor)
                                {
                                    bDraw = true;
                                }
                            }
                        }
                    }
                    // End:0x449
                    if(bDraw)
                    {
                        DrawNameTag(C, curPawn);
                        // End:0x449
                        if((curPawn.IsA('wAIDefencePawn') || curPawn.IsA('wFlyingDefenceBot')) || curPawn.IsA('wDefenceBoss'))
                        {
                            // End:0x439
                            if(sellectedPawn == none)
                            {
                                sellectedPawn = curPawn;
                            }
                            DrawHPBar_Alien(C, sellectedPawn);
                        }
                    }
                    // End:0x59C
                    if((curPawn.PlayerReplicationInfo != none) && Level.TimeSeconds < curPawn.PlayerReplicationInfo.PopMessageEnd)
                    {
                        C.DrawColor = WhiteColor;
                        C.BtrTextSize(curPawn.PlayerReplicationInfo.PopMessage, int(float(10) * _rY), width, Height);
                        X1 = curPawn.NametagScreenPos.X - (width / float(2));
                        Y1 = ((curPawn.NametagScreenPos.Y - float(NametagFontSize)) - Height) - float(20);
                        X2 = X1 + width;
                        Y2 = Y1 + Height;
                        C.BtrDrawTextJustified(curPawn.PlayerReplicationInfo.PopMessage, 0, X1, Y1, X2, Y2, int(float(10) * _rY));
                    }
                }
            }
            J0x59C:

            lp1++;
            // [Loop Continue]
            goto J0x10A;
        }
    }
    //return;    
}

function DrawNameTag(Canvas C, wPawn curPawn)
{
    local float X1, Y1, X2, Y2, width, Height;

    local string nametag;
    local Color nametagColor;
    local float markWidth, markHeight;
    local Material Mark;

    markWidth = 24.0000000 * _rX;
    markHeight = 24.0000000 * _rY;
    // End:0x58
    if(curPawn.PlayerReplicationInfo != none)
    {
        nametag = curPawn.PlayerReplicationInfo.PlayerName;        
    }
    else
    {
        nametag = curPawn.OwnerName;
    }
    C.BtrTextSize(nametag, NametagFontSize + 1, width, Height);
    // End:0xDD
    if((curPawn.PlayerReplicationInfo != none) && curPawn.PlayerReplicationInfo.ClassMark == none)
    {
        curPawn.PlayerReplicationInfo.LoadLevelMark();
    }
    width += markWidth;
    X1 = curPawn.NametagScreenPos.X - (width / float(2));
    Y1 = (curPawn.NametagScreenPos.Y - Height) - ((markHeight - Height) / float(2));
    C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
    C.SetPos(X1, Y1);
    X1 = (curPawn.NametagScreenPos.X - (width / float(2))) + markWidth;
    Y1 = curPawn.NametagScreenPos.Y - Height;
    X2 = X1 + width;
    Y2 = Y1 + Height;
    nametagColor = GetNametagColorDefence(curPawn);
    C.DrawColor = NametagShadowColor;
    C.BtrDrawTextJustified(nametag, 0, X1 + float(NametagShadowX), Y1 + float(NametagShadowY), X2 + float(NametagShadowX), Y2 + float(NametagShadowY), NametagFontSize);
    C.DrawColor = nametagColor;
    C.BtrDrawTextJustified(nametag, 0, X1, Y1, X2, Y2, NametagFontSize);
    //return;    
}

function Color GetNametagColorDefence(Pawn curPawn)
{
    local Color C;
    local PlayerReplicationInfo Info;

    Info = curPawn.PlayerReplicationInfo;
    // End:0xA1
    if((PlayerOwner.PlayerReplicationInfo.Team != none) && PlayerOwner.PlayerReplicationInfo.Team.TeamIndex == (GetTeamIndexDefence(curPawn)))
    {
        // End:0x93
        if((Info != none) && 1 == Info.GetCheckFriendOrClanMember())
        {
            C = FriendlyColor;            
        }
        else
        {
            C = BaseTeamColorAlly;
        }        
    }
    else
    {
        C = BaseTeamColor[GetTeamIndexDefence(curPawn)];
    }
    C.A = 196;
    return C;
    //return;    
}

function int GetTeamIndexDefence(Pawn curPawn)
{
    // End:0x35
    if(curPawn.PlayerReplicationInfo != none)
    {
        return curPawn.PlayerReplicationInfo.Team.TeamIndex;
    }
    return curPawn.TeamIndex;
    //return;    
}

function Timer()
{
    local float fRatio;

    super(Actor).Timer();
    // End:0x9E
    if((!bPlaySoundWarning && NuclearBarricade != none) && !NuclearBarricade.bHidden)
    {
        fRatio = float(NuclearBarricade.Health) / float(NuclearBarricade.MaxHealth);
        // End:0x9E
        if(fRatio < 0.1000000)
        {
            PlayerOwner.ReceiveLocalizedMessage(Class'Engine.wMessage_Game_Defence', Class'Engine.wMessage_Game_Defence'.default.Code_WaringNuclear);
            bPlaySoundWarning = true;
            SetTimer(0.0000000, false);
        }
    }
    //return;    
}

function CallUsingItem(int iItemID, optional int iRemainCount, optional int iReservation2)
{
    local int iCode_Message;

    switch(iItemID)
    {
        // End:0x35
        case ItemID[0]:
            ItemCount[0] = iRemainCount;
            iCode_Message = Class'Engine.wMessage_Game_Defence'.default.Code_UsingCashItemSlot1;
            // End:0x83
            break;
        // End:0x7D
        case ItemID[1]:
            ItemCount[1] = iRemainCount;
            iCode_Message = Class'Engine.wMessage_Game_Defence'.default.Code_UsingCashItemSlot2;
            self.LocalizedMessageOptional(Class'Engine.wMessage_Game_Defence', iCode_Message, iItemID);
            // End:0x83
            break;
        // End:0xFFFF
        default:
            // End:0x83
            break;
            break;
    }
    //return;    
}

simulated function LocalizedMessageOptional(Class<LocalMessage> Message, optional int iCode_Message, optional int iItemID, optional int iReserve2)
{
    local string strMessage, strItemName;
    local wItemBaseParam WBP;

    switch(iCode_Message)
    {
        // End:0xFFFF
        default:
            // End:0x0D
            break;
            break;
    }
    strMessage = Class'Engine.wMessage_Game_Defence'.static.GetString(iCode_Message);
    // End:0x7B
    if(iItemID > 0)
    {
        WBP = Level.GameMgr.GetItemParam(iItemID);
        strItemName = WBP.strDisplayName;
        strMessage = strMessage $ strItemName;
    }
    self.LocalizedMessage2(Class'Engine.wMessage_Game_Defence', iCode_Message,, strMessage);
    //return;    
}

function bool IsEnableRepair()
{
    local bool bEnable;

    bEnable = NuclearBarricade.Health > 0;
    bEnable = bEnable && NuclearBarricade.Health < NuclearBarricade.MaxHealth;
    return bEnable;
    //return;    
}

defaultproperties
{
    strBotLevel="????????????"
    strBotRound="Round"
    strReactor="HP ??????????????"
    strPoint="Point"
    strScore="Score"
    strBuy="????"
    lsIndication[0]="???????"
    lsIndication[1]="??????????????"
    lsBotDifficulty[0]="Easy"
    lsBotDifficulty[1]="Normal"
    lsBotDifficulty[2]="Hard"
    lsBotDifficulty[3]="Very Hard"
    lsNoteiceCanBuyItem="?? \"F\" ???????????????????"
    WGaugeBG=(WidgetTexture=Texture'Warfare_TH_UI_HUD.Common.img_HUD_pve_reactorHP_bg',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=867,Y2=99),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=356,OffsetY=5,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WGauge=(WidgetTexture=Texture'Warfare_TH_UI_HUD.Common.img_HUD_pve_reactorHP_hpbar',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=412,Y2=26),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=590,OffsetY=37,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WGaugeWaring=(WidgetTexture=Texture'Warfare_TH_UI_HUD.Common.img_HUD_pve_atomicHP_effect',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=434,Y2=48),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=579,OffsetY=26,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WIndication[0]=(WidgetTexture=Texture'Warfare_TH_UI_HUD_ETC.DisplayIcon.hurdleHP_defense',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=128,Y2=128),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WIndication[1]=(WidgetTexture=Texture'Warfare_TH_UI_HUD_ETC.DisplayIcon.atomicHP_defense',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=128,Y2=128),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WItemBG=(WidgetTexture=Texture'Warfare_TH_UI_HUD.Common.img_HUD_pve_item_respawn_bg',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=93,Y2=64),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=531,OffsetY=445,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WItemBG2=(WidgetTexture=Texture'Warfare_TH_UI_HUD.Common.img_HUD_pve_item_bg',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=98,Y2=71),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WItem=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=531,OffsetY=445,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WItemNumKey[0]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=0,Y2=0),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=1570,OffsetY=439,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WItemNumKey[1]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=0,Y2=0),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=1570,OffsetY=511,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WMyPointBG=(WidgetTexture=Texture'Warfare_TH_UI_HUD.Common.img_HUD_pve_itembuyHUD_bg',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=916,Y2=49),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=275,OffsetY=1151,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WBuyButton[0]=(WidgetTexture=Texture'Warfare_TH_UI_UI.HUD_ETC.butt_hud_quickslot_openslot',RenderStyle=5,TextureCoords=(X1=0,Y1=98,X2=282,Y2=169),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=815,OffsetY=1124,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WBuyButton[1]=(WidgetTexture=Texture'Warfare_TH_UI_UI.HUD_ETC.butt_hud_quickslot_openslot',RenderStyle=5,TextureCoords=(X1=0,Y1=169,X2=282,Y2=240),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=815,OffsetY=1124,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WBuyButton[2]=(WidgetTexture=Texture'Warfare_TH_UI_UI.HUD_ETC.butt_hud_quickslot_openslot',RenderStyle=5,TextureCoords=(X1=0,Y1=169,X2=282,Y2=240),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=815,OffsetY=1124,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WKeyButtonBigF[0]=(WidgetTexture=Texture'Warfare_TH_UI_HUD.Common.img_keyboard_2',RenderStyle=5,TextureCoords=(X1=260,Y1=182,X2=312,Y2=234),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WKeyButtonBigF[1]=(WidgetTexture=Texture'Warfare_TH_UI_HUD.Common.img_keyboard_2',RenderStyle=5,TextureCoords=(X1=208,Y1=182,X2=260,Y2=234),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WHudBGR=(WidgetTexture=Texture'Warfare_TH_UI_HUD.Common.img_HUD_back_red',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=512,Y2=8),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=121,OffsetY=150,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WItemPopBG=(WidgetTexture=Texture'Warfare_TH_UI_HUD.Common.img_HUD_back_3',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=1024,Y2=4),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=739,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    bDrawRoundResult=false
    VisibleDistance=30.0000000
    HudPart_KillMessage_Class=Class'XInterface.wHudPart_KillMessage_Defence'
    MinimapClass=Class'XInterface.wHudPart_MinimapDefence'
}