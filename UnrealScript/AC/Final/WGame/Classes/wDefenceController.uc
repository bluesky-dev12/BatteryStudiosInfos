class wDefenceController extends wPlayer
    config(User);

const MaxBuyItem = 6;

struct stItemInfo
{
    var int nBuyItemID;
    var int nBuyItemPrice;
    var byte nBuyItemIndex;
    var byte nBuyEnableLevel;
};

struct stCashItemSlot
{
    var int iItemID;
    var int iCount;
    var int iReserve1;
    var int iReserve2;
};

var Vector vKnockBackDir;
var() config float fKnockBackTime;
var() config float fKnockBackMomentum;
var() config float fKnockBackZ;
var array<byte> BuyItemListWhenRespawn;
var int iRepairValue;
var bool bScoreUp;
var bool bPointUp;
var float fAddScore;
var float fAddPoint;
var stItemInfo myShopInfo[6];
var stCashItemSlot myCashItemSlot[2];
var bool bReqActiveRepair;
var bool bActiveRepairNuclear;
var bool bActiveEffect;

replication
{
    // Pos:0x000
    reliable if(bNetDirty && int(Role) == int(ROLE_Authority))
        bActiveEffect, bActiveRepairNuclear, 
        bPointUp, bScoreUp, 
        fAddPoint, fAddScore, 
        iRepairValue;

    // Pos:0x018
    reliable if(int(Role) < int(ROLE_Authority))
        ServerReqRepairNuclear;
}

simulated event PostNetBeginPlay()
{
    super.PostNetBeginPlay();
    SetItemList();
    //return;    
}

function Possess(Pawn aPawn)
{
    super.Possess(aPawn);
    AddSkillByInventory();
    //return;    
}

simulated event ReceiveMessage_QuestType1(Class<wMessage_Quest> Message, optional int Switch, optional int iRWeaponType, optional int iRweaponId)
{
    //return;    
}

simulated event ReceiveMessage_QuestType2(Class<wMessage_Quest> Message, optional int Switch, optional int iRMode, optional int iRMap, optional int iRMin, optional int iRSec)
{
    //return;    
}

simulated event ReceiveMessage_QuestType3(Class<wMessage_Quest> Message, optional int Switch, optional int iRDifficult, optional int iRMap)
{
    local wMatchMaker kMM;
    local wMapInfo mapInfo;

    Log((((((("[PlayerController::ReceiveMessage_QuestType3] Message=" $ string(Message)) $ "[Code_Message] : ") $ string(Switch)) $ "[iDifficult] :") $ string(iRDifficult)) $ "[iMap]:") $ string(iRMap));
    // End:0xB8
    if((int(Level.NetMode) == int(NM_DedicatedServer)) || GameReplicationInfo == none)
    {
        return;
    }
    kMM = Level.GetMatchMaker();
    iRDifficult = kMM.BotDifficulty;
    mapInfo = kMM.MapSettings.GetMapInfo(kMM.szMapName);
    iRMap = mapInfo.MapID;
    switch(Switch)
    {
        // End:0x150
        case Message.default.Code_Quest_MatchEndInBotMode:
            kMM.UpdateQuest_MatchCompletedInBotMode(iRDifficult);
            // End:0x1A6
            break;
        // End:0x179
        case Message.default.Code_Quest_BestScoreInBotMode:
            kMM.UpdateQuest_WinnerInBotMode(iRDifficult, 1);
            // End:0x1A6
            break;
        // End:0x1A3
        case Message.default.Code_Quest_BestAssistInBotMode:
            kMM.UpdateQuest_WinnerInBotMode(iRDifficult, 2);
            // End:0x1A6
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

simulated event ReceiveMessage_QuestType4(Class<wMessage_Quest> Message, optional int Switch, optional int iRDifficult, optional int iRRound)
{
    local wMatchMaker kMM;

    kMM = Level.GetMatchMaker();
    iRDifficult = kMM.BotDifficulty;
    Log((((((("[PlayerController::ReceiveMessage_QuestType3] Message=" $ string(Message)) $ "[Code_Message] : ") $ string(Switch)) $ "[iDifficult] :") $ string(iRDifficult)) $ "[iRRound]:") $ string(iRRound));
    // End:0xE4
    if((int(Level.NetMode) == int(NM_DedicatedServer)) || GameReplicationInfo == none)
    {
        return;
    }
    switch(Switch)
    {
        // End:0x118
        case Message.default.Code_Quest_RoundEndInBotMode:
            kMM.UpdateQuest_RoundCompletedInBotMode(iRDifficult, iRRound);
            // End:0x11B
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

simulated event ReceiveLocalizedMessage(Class<LocalMessage> Message, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject, optional int iReserve)
{
    local string str;
    local Actor A;
    local int iItemID, iKey;

    Log("[DefenceController::ReceiveLocalizedMessage] Message=" $ string(Message));
    // End:0x6A
    if((int(Level.NetMode) == int(NM_DedicatedServer)) || GameReplicationInfo == none)
    {
        return;
    }
    iItemID = 0;
    // End:0x15C
    if(Message == Class'Engine.wMessage_Game_Defence')
    {
        switch(Switch)
        {
            // End:0xA2
            case Class'Engine.wMessage_Game_Defence'.default.Code_ItemChangeWeapon1:
                iKey = 1;
                // End:0x13B
                break;
            // End:0xBE
            case Class'Engine.wMessage_Game_Defence'.default.Code_ItemChangeWeapon2:
                iKey = 2;
                // End:0x13B
                break;
            // End:0xDA
            case Class'Engine.wMessage_Game_Defence'.default.Code_ItemChangeWeapon3:
                iKey = 3;
                // End:0x13B
                break;
            // End:0xF6
            case Class'Engine.wMessage_Game_Defence'.default.Code_ItemChangeWeapon4:
                iKey = 4;
                // End:0x13B
                break;
            // End:0x112
            case Class'Engine.wMessage_Game_Defence'.default.Code_ItemChangeWeapon5:
                iKey = 5;
                // End:0x13B
                break;
            // End:0x12E
            case Class'Engine.wMessage_Game_Defence'.default.Code_ItemChangeWeapon6:
                iKey = 6;
                // End:0x13B
                break;
            // End:0xFFFF
            default:
                iKey = 0;
                // End:0x13B
                break;
                break;
        }
        // End:0x15C
        if(iKey > 0)
        {
            myHUD.CallItemBuy(iKey);
            return;
        }
    }
    // End:0x1C2
    if((Message == Class'Engine.wMultiKillMessage') || (Message == Class'Engine.wMessage_Score') && Switch == Class'Engine.wMessage_Score'.default.Code_GainBonusPoint)
    {
        Message.static.ClientReceiveEx(self, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject, iReserve);        
    }
    else
    {
        Message.static.ClientReceive(self, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
    }
    // End:0x260
    if((Message.static.IsConsoleMessage(Switch) && Player != none) && Player.Console != none)
    {
        Player.Console.Message(Message.static.GetString(Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject), 0.0000000);
    }
    // End:0x304
    if(RelatedPRI_1 != RelatedPRI_2)
    {
        str = "" $ string(Message);
        // End:0x304
        if((str == "WGame.wDeathMessage") && PlayerReplicationInfo == RelatedPRI_2)
        {
            // End:0x303
            foreach DynamicActors(Class'Engine.Actor', A)
            {
                // End:0x302
                if((Pawn(A) != none) && Pawn(A).PlayerReplicationInfo == RelatedPRI_1)
                {
                    ClientSetViewTargetDied(A, OptionalObject);
                    // End:0x303
                    break;
                }                
            }            
        }
    }
    //return;    
}

function SendQuest_KillSuccession(Controller Killer, byte byKillSuccession)
{
    //return;    
}

function bool SelectItemBuy(int iKey)
{
    local float fDeltaTime, fSendMessageLockTime;
    local int iSendMessage, iItemID, itemPrice, iCode_Message;
    local wWeapon sWeapon;

    // End:0x21
    if(0 == iKey)
    {
        myHUD.CallItemBuy(iKey);
        return false;
    }
    // End:0x62
    if((0 != iKey) && ((IsInState('PlayerWaiting') || IsInState('Spectating')) || IsInState('SpectatingGM')) || IsInState('ChangedHost'))
    {
        return false;
    }
    fDeltaTime = Level.TimeSeconds - fBuyedTime;
    fSendMessageLockTime = 0.2000000;
    // End:0xAB
    if(Level.TimeSeconds < fSendMessageLockTime)
    {
        fDeltaTime = 0.3000000;
    }
    // End:0x145
    if(fDeltaTime > fSendMessageLockTime)
    {
        iItemID = GetItemBuyID(iKey);
        itemPrice = GetItemBuyPrice(iKey);
        // End:0x106
        if(float(itemPrice) <= PlayerReplicationInfo.PointIns)
        {
            ServerBuyItem(byte(iKey));            
        }
        else
        {
            iCode_Message = Class'Engine.wMessage_Game_Defence'.default.Code_ItemNotBuy;
            self.ReceiveLocalizedMessage(Class'Engine.wMessage_Game_Defence', iCode_Message);
            myHUD.CallItemBuy(,, 999);
        }
    }
    //return;    
}

function bool InPutItem(byte byIndex)
{
    local int iItemID, itemPrice, iCode_Message;
    local wItemBaseParam WBP;
    local wWeapon W, W2Drop;
    local Inventory invW;
    local bool bBuy;
    local wWeaponManager wMani;
    local wWeaponBaseParams wBase;
    local wWeaponCustomInfoParam wcParam;
    local int iPartsID;

    wMani = Level.WeaponMgr;
    // End:0x312
    if((int(byIndex) > 0) && Pawn != none)
    {
        iItemID = GetItemBuyID(int(byIndex));
        itemPrice = GetItemBuyPrice(int(byIndex));
        WBP = Level.GameMgr.GetItemParam(iItemID);
        wBase = wMani.GetBaseParam(iItemID);
        // End:0xAB
        if(float(itemPrice) > PlayerReplicationInfo.PointIns)
        {
        }
        // End:0x1C1
        if((wBase.iInventoryGroup == 1) || wBase.iInventoryGroup == 2)
        {
            J0xD6:

            // End:0x1C1 [Loop If]
            if(true)
            {
                // End:0xFC
                if(invW == none)
                {
                    invW = Pawn.Inventory;                    
                }
                else
                {
                    invW = invW.Inventory;
                }
                // End:0x11E
                if(invW == none)
                {
                    // [Explicit Break]
                    goto J0x1C1;
                }
                W2Drop = wWeapon(invW);
                // End:0x13C
                if(W2Drop == none)
                {                    
                }
                else
                {
                    // End:0x162
                    if(int(W2Drop.InventoryGroup) != wBase.iInventoryGroup)
                    {                        
                    }
                    else
                    {
                        // End:0x181
                        if((W != none) && W2Drop == W)
                        {                            
                        }
                        else
                        {
                            // End:0x1AA
                            if((iItemID >= 0) && int(WBP.eGrade) == int(11))
                            {                                
                            }
                            else
                            {
                                Pawn.DeleteInventory(invW);
                            }
                        }
                    }
                }
                // [Loop Continue]
                goto J0xD6;
            }
        }
        J0x1C1:

        switch(WBP.eType)
        {
            // End:0x210
            case Level.GameMgr.19:
                // End:0x20D
                if(90106 == iItemID)
                {
                    bBuy = Pawn.AddWeaponFillAmmoAndMagazine();
                }
                // End:0x312
                break;
            // End:0xFFFF
            default:
                wcParam = Level.GameMgr.GetWeaponCustomInfoParam(iItemID);
                // End:0x285
                if(wcParam != none)
                {
                    iPartsID = ((wcParam.iDefaultBarrelUniID | wcParam.iDefaultGunstockUniID) | wcParam.iDefaultSightUniID) | wcParam.iDefaultSilencerUniID;
                }
                W = Pawn.AddWeapon(EmptyBtrDouble(), iItemID, iPartsID, true);
                // End:0x30F
                if(W != none)
                {
                    // End:0x2E0
                    if(int(W.InventoryGroup) == 5)
                    {
                        self.ClientChangeSlot5(W);                        
                    }
                    else
                    {
                        // End:0x307
                        if(int(W.InventoryGroup) == 6)
                        {
                            self.ClientChangeSlot6(W);
                        }
                    }
                    bBuy = true;
                }
                // End:0x312
                break;
                break;
        }
    }
    return bBuy;
    //return;    
}

function bool ServerBuyItemWhenRespawn(byte byIndex)
{
    local int iItemID, itemPrice, lp1;
    local wItemBaseParam WBP;
    local bool bBuy;
    local wWeaponManager wMani;
    local wWeaponBaseParams wBase;

    wMani = Level.WeaponMgr;
    // End:0x130
    if(int(byIndex) > 0)
    {
        iItemID = GetItemBuyID(int(byIndex));
        itemPrice = GetItemBuyPrice(int(byIndex));
        WBP = Level.GameMgr.GetItemParam(iItemID);
        wBase = wMani.GetBaseParam(iItemID);
        // End:0xA0
        if(float(itemPrice) > PlayerReplicationInfo.PointIns)
        {
            return false;
        }
        // End:0xAF
        if(BuyItemListWhenRespawn.Length >= 6)
        {
            return false;
        }
        lp1 = 0;
        J0xB6:

        // End:0xEB [Loop If]
        if(lp1 < BuyItemListWhenRespawn.Length)
        {
            // End:0xE1
            if(int(byIndex) == int(BuyItemListWhenRespawn[lp1]))
            {
                return false;
            }
            lp1++;
            // [Loop Continue]
            goto J0xB6;
        }
        // End:0x130
        if(true)
        {
            PlayerReplicationInfo.PointIns -= float(itemPrice);
            self.SendLocalizedMessage(byIndex);
            BuyItemListWhenRespawn[BuyItemListWhenRespawn.Length] = byIndex;
            bBuy = true;
        }
    }
    return bBuy;
    //return;    
}

function bool ServerBuyItem(byte byIndex)
{
    local bool bBuy;
    local int itemPrice;

    // End:0x19
    if(IsInState('Dead'))
    {
        ServerBuyItemWhenRespawn(byIndex);        
    }
    else
    {
        bBuy = InPutItem(byIndex);
        // End:0x6E
        if(bBuy)
        {
            itemPrice = GetItemBuyPrice(int(byIndex));
            PlayerReplicationInfo.PointIns -= float(itemPrice);
            self.SendLocalizedMessage(byIndex);
        }
    }
    //return;    
}

function SendLocalizedMessage(byte byIndex)
{
    local int iCode_Message;

    switch(byIndex)
    {
        // End:0x23
        case 1:
            iCode_Message = Class'Engine.wMessage_Game_Defence'.default.Code_ItemChangeWeapon1;
            // End:0xB2
            break;
        // End:0x3F
        case 2:
            iCode_Message = Class'Engine.wMessage_Game_Defence'.default.Code_ItemChangeWeapon2;
            // End:0xB2
            break;
        // End:0x5B
        case 3:
            iCode_Message = Class'Engine.wMessage_Game_Defence'.default.Code_ItemChangeWeapon3;
            // End:0xB2
            break;
        // End:0x77
        case 4:
            iCode_Message = Class'Engine.wMessage_Game_Defence'.default.Code_ItemChangeWeapon4;
            // End:0xB2
            break;
        // End:0x93
        case 5:
            iCode_Message = Class'Engine.wMessage_Game_Defence'.default.Code_ItemChangeWeapon5;
            // End:0xB2
            break;
        // End:0xAF
        case 6:
            iCode_Message = Class'Engine.wMessage_Game_Defence'.default.Code_ItemChangeWeapon6;
            // End:0xB2
            break;
        // End:0xFFFF
        default:
            break;
    }
    // End:0xD2
    if(iCode_Message > 0)
    {
        self.ReceiveLocalizedMessage(Class'Engine.wMessage_Game_Defence', iCode_Message);
    }
    //return;    
}

function int GetItemBuyID(int Index)
{
    local int lp1;

    lp1 = 0;
    J0x07:

    // End:0x4A [Loop If]
    if(lp1 < 6)
    {
        // End:0x40
        if(int(myShopInfo[lp1].nBuyItemIndex) == Index)
        {
            return myShopInfo[lp1].nBuyItemID;
        }
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    return 0;
    //return;    
}

function int GetItemBuyPrice(int Index)
{
    local int lp1;

    lp1 = 0;
    J0x07:

    // End:0x4A [Loop If]
    if(lp1 < 6)
    {
        // End:0x40
        if(int(myShopInfo[lp1].nBuyItemIndex) == Index)
        {
            return myShopInfo[lp1].nBuyItemPrice;
        }
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    return 0;
    //return;    
}

function SetItemList()
{
    local string szIcon;
    local int lp1, lp2, iItemID;
    local wDefenceShopParam cDefenceParam;

    lp1 = 0;
    J0x07:

    // End:0x114 [Loop If]
    if(lp1 < Level.GameMgr.DefenceShopParams.Length)
    {
        cDefenceParam = Level.GameMgr.DefenceShopParams[lp1];
        // End:0x10A
        if((int(cDefenceParam.nBuyEnableLevel) == Level.GetMatchMaker().BotDifficulty) && lp2 < 6)
        {
            myShopInfo[lp2].nBuyItemID = cDefenceParam.nBuyItemID;
            myShopInfo[lp2].nBuyItemPrice = cDefenceParam.nBuyItemPrice;
            myShopInfo[lp2].nBuyItemIndex = cDefenceParam.nBuyItemIndex;
            myShopInfo[lp2].nBuyEnableLevel = cDefenceParam.nBuyEnableLevel;
            lp2++;
        }
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    SortItemList();
    //return;    
}

function bool InOrder(int P1, int P2)
{
    // End:0x11
    if(P1 > P2)
    {
        return false;
    }
    return true;
    //return;    
}

function SortItemList()
{
    local int i, j;
    local stItemInfo ItemInfo;

    i = 0;
    J0x07:

    // End:0xA9 [Loop If]
    if(i < 5)
    {
        j = i + 1;
        J0x21:

        // End:0x9F [Loop If]
        if(j < 6)
        {
            // End:0x95
            if(!InOrder(int(myShopInfo[i].nBuyItemIndex), int(myShopInfo[j].nBuyItemIndex)))
            {
                ItemInfo = myShopInfo[i];
                myShopInfo[i] = myShopInfo[j];
                myShopInfo[j] = ItemInfo;
            }
            j++;
            // [Loop Continue]
            goto J0x21;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function float AdjustRespawnTime()
{
    local float fRespawnTimeLength;

    // End:0x46
    if((SkillBase != none) && SkillBase.bQuickRespawn)
    {
        fRespawnTimeLength = Level.GRI.RespawnTime - 1.4000000;        
    }
    else
    {
        fRespawnTimeLength = Level.GRI.RespawnTime;
    }
    // End:0x7A
    if(bActiveNowRespawn)
    {
        fRespawnTimeLength = 0.0000000;        
    }
    else
    {
        fRespawnTimeLength += PlayerReplicationInfo.Deaths;
    }
    return fRespawnTimeLength;
    //return;    
}

function ProcessUseKey()
{
    // End:0x0D
    if(IsInState('ChangedHost'))
    {
        return;
    }
    // End:0x6A
    if(int(bUseKey) == 1)
    {
        Log((((string(self) $ " bUseKey : ") $ string(bUseKey)) $ " / byOldUseKey :") $ string(byOldUseKey));
        // End:0x67
        if(int(byOldUseKey) == 0)
        {
            ProcessSetObjective();
        }        
    }
    else
    {
        // End:0x9A
        if((int(bUseKey) == 0) && int(byOldUseKey) == 1)
        {
            Pawn.ServerSetUseKeyState(bUseKey);
        }
    }
    byOldUseKey = bUseKey;
    //return;    
}

function bool ProcessSetObjective()
{
    local bool bUsed;

    bUsed = super.ProcessSetObjective();
    // End:0x38
    if(!bUsed)
    {
        self.ConsoleCommand("ShowItemBuyWindow", true);
    }
    return true;
    //return;    
}

function SetBuyItem()
{
    local int lp1;

    lp1 = 0;
    J0x07:

    // End:0x32 [Loop If]
    if(lp1 < BuyItemListWhenRespawn.Length)
    {
        InPutItem(BuyItemListWhenRespawn[lp1]);
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    BuyItemListWhenRespawn.Length = 0;
    //return;    
}

function NotifyTakeHit(Pawn instigatedBy, Vector HitLocation, int Damage, Class<DamageType> DamageType, Vector Momentum, optional int CollisionPart)
{
    local wGameManager GameMgr;

    super.NotifyTakeHit(instigatedBy, HitLocation, Damage, DamageType, Momentum, CollisionPart);
    // End:0x31
    if(instigatedBy == none)
    {
        return;
    }
    // End:0x3E
    if(IsInState('PlayerKnockBack'))
    {
        return;
    }
    // End:0x4F
    if(DamageType != Class'Engine.wDamageMelee')
    {
        return;
    }
    // End:0x67
    if(!instigatedBy.IsA('wDefenceBoss'))
    {
        return;
    }
    vKnockBackDir = Pawn.Location - instigatedBy.Location;
    vKnockBackDir.Z = fKnockBackZ;
    vKnockBackDir = Normal(vKnockBackDir);
    GotoState('PlayerKnockBack');
    //return;    
}

function bool ReqUsingItem(byte byKey)
{
    local float fDeltaTime;
    local int lp1, iItemID, iItemCount;
    local BtrDouble iUniqueID;
    local bool bEnableRequir;

    // End:0x43
    if((0 != int(byKey)) && ((IsInState('PlayerWaiting') || IsInState('Spectating')) || IsInState('SpectatingGM')) || IsInState('ChangedHost'))
    {
        return false;
    }
    // End:0x80
    if(!Level.GetMatchMaker().InGamePlaying || Level.GRI.bMatchOver)
    {
        return false;
    }
    fDeltaTime = Level.TimeSeconds - fReqUsingItemTime;
    // End:0xD9
    if(fDeltaTime > 0.2000000)
    {
        fReqUsingItemTime = Level.TimeSeconds;
        switch(byKey)
        {
            // End:0xD3
            case 7:
                UsingItem_Slot7();
                // End:0xD9
                break;
            // End:0xFFFF
            default:
                // End:0xD9
                break;
                break;
        }
    }
    fDeltaTime = Level.TimeSeconds - fReqLastTime;
    // End:0x11E
    if(fDeltaTime > 1.1000000)
    {
        switch(byKey)
        {
            // End:0x118
            case 8:
                UsingItem_Slot8();
                // End:0x11E
                break;
            // End:0xFFFF
            default:
                // End:0x11E
                break;
                break;
        }
    }
    return true;
    //return;    
}

function bool UsingItem_Slot7()
{
    local int iItemID;
    local BtrDouble iUniqueID;
    local bool bEnableRequir;

    iItemID = 92005;
    iUniqueID = self.GetUniqueID(iItemID);
    bEnableRequir = self.myHUD.IsEnableRepair() && __NFUN_913__(__NFUN_921__(0), iUniqueID);
    Log((((string(self) $ " [ ReqUsingItem::UsingItem_Slot7 1] / bEnableRequir:") $ string(bEnableRequir)) $ "/( IntToBtrDouble(0)!=iUniqueID ):") $ string(__NFUN_913__(__NFUN_921__(0), iUniqueID)));
    bEnableRequir = bEnableRequir && self.GetItemCount(iItemID) > 0;
    Log((((((string(self) $ " [ ReqUsingItem::UsingItem_Slot7 2] / bEnableRequir:") $ string(bEnableRequir)) $ "/ GetItemCount( ):") $ string(self.GetItemCount(iItemID))) $ "/bReqActiveRepair:") $ string(bReqActiveRepair));
    // End:0x1AC
    if(!bReqActiveRepair && bEnableRequir)
    {
        ServerReqRepairNuclear(iUniqueID);
        bReqActiveRepair = true;        
    }
    else
    {
        self.myHUD.LocalizedMessageOptional(Class'Engine.wMessage_Game_Defence', Class'Engine.wMessage_Game_Defence'.default.Code_CantUsing, iItemID);
    }
    Log((((((string(self) $ " [ ReqUsingItem::UsingItem_Slot7 ] / iItemID:") $ string(iItemID)) $ " / iUniqueID: ") $ __NFUN_918__(iUniqueID)) $ " / bEnableRequir:") $ string(bEnableRequir));
    return true;
    //return;    
}

function bool UsingItem_Slot8()
{
    super.UsingItem_Slot8();
    return true;
    //return;    
}

function ServerReqRepairNuclear(BtrDouble iUniqueID)
{
    local wMatchMaker kMM;

    // End:0x1F
    if(!Level.Game.IsEnableRepair())
    {
        return;
    }
    kMM = Level.GetMatchMaker();
    Log(((((string(self) $ " Using Item During Game, PlayerName:") $ PlayerReplicationInfo.PlayerName) $ " /ItemID : 92005") $ " /iUniqueID") $ __NFUN_918__(iUniqueID));
    // End:0xF5
    if((kMM.kTcpChannel != none) && __NFUN_913__(__NFUN_921__(0), iUniqueID))
    {
        kMM.kTcpChannel.sfReqUseItemDuringGame(PlayerReplicationInfo.PlayerName, 92005, iUniqueID, 1);
    }
    //return;    
}

function bool SetRepairNuclear()
{
    local int iCodeID;
    local Controller C;

    bActiveRepairNuclear = true;
    Log((((string(self) $ "[wDefenceController::SetRepairNuclear()] iRepairValue: ") $ string(iRepairValue)) $ " / default.iRepairValue : ") $ string(default.iRepairValue));
    // End:0x8E
    if(iRepairValue <= 0)
    {
        iRepairValue = default.iRepairValue;
    }
    Level.Game.SetRepairNuclear(iRepairValue);
    iCodeID = Class'Engine.wMessage_Game_Defence'.default.Code_RepairNuclear;
    Level.Game.TeamReceiveLocalizedMessage(byte(GetTeamNum()), Class'Engine.wMessage_Game_Defence', iCodeID, PlayerReplicationInfo);
    return true;
    //return;    
}

function AddSkillByInventory()
{
    local int lp1, EquipItemID, iSkillID;
    local wItemBaseParam ItemParam;
    local wSkillBaseParam skillParam;
    local wMatchMaker MM;
    local wMatchUserInfo kUser, kTemp;

    MM = Level.GetMatchMaker();
    bScoreUp = false;
    bPointUp = false;
    fAddScore = 0.0000000;
    fAddPoint = 0.0000000;
    kUser = MM.GetUserInfoByUserName(PlayerReplicationInfo.PlayerName);
    // End:0x6B
    if(kUser == none)
    {
        return;
    }
    lp1 = 0;
    J0x72:

    // End:0x2B7 [Loop If]
    if(lp1 < kUser.EquippedItems.Length)
    {
        // End:0x2AD
        if(((kUser.EquippedItems[lp1].SlotPosition == int(26)) || kUser.EquippedItems[lp1].SlotPosition == int(29)) || kUser.EquippedItems[lp1].SlotPosition == int(30))
        {
            EquipItemID = kUser.EquippedItems[lp1].ItemID;
            ItemParam = Level.GameMgr.GetItemParam(EquipItemID);
            // End:0x1DC
            if((ItemParam.strAddOption[0] == "skill") && int(ItemParam.strOptionValue[0]) > 0)
            {
                self.AddSkill(int(ItemParam.strOptionValue[0]));
                iSkillID = int(ItemParam.strOptionValue[0]);
                skillParam = Level.GameMgr.GetSkillParam(iSkillID);
                iRepairValue = skillParam.iCheckStreakCount;
                // [Explicit Continue]
                goto J0x2AD;
            }
            // End:0x242
            if((ItemParam.strAddOption[0] == "score+") && float(ItemParam.strOptionValue[0]) > float(0))
            {
                self.bScoreUp = true;
                self.fAddScore = float(ItemParam.strOptionValue[0]);
                // [Explicit Continue]
                goto J0x2AD;
            }
            // End:0x2AD
            if((ItemParam.strAddOption[0] == "defence_point+") && float(ItemParam.strOptionValue[0]) > float(0))
            {
                self.bPointUp = true;
                self.fAddPoint = float(ItemParam.strOptionValue[0]);
            }
        }
        J0x2AD:

        lp1++;
        // [Loop Continue]
        goto J0x72;
    }
    //return;    
}

state PlayerWalking
{
    ignores BeginState;

    function BeginState()
    {
        super.BeginState();
        // End:0x1E
        if(int(Role) == int(ROLE_Authority))
        {
            bActiveNowRespawn = false;
        }
        //return;        
    }
    stop;    
}

state Dead
{
    ignores EndState, BeginState;

    function BeginState()
    {
        super.BeginState();
        BuyItemListWhenRespawn.Length = 0;
        fReqLastTime = FMax(0.0000000, Level.TimeSeconds - 1.1000000);
        //return;        
    }

    function EndState()
    {
        super.EndState();
        myHUD.CallItemBuy(0);
        //return;        
    }
    stop;    
}

state PlayerKnockBack extends PlayerWalking
{
    function TickStance(float DeltaTime)
    {
        super(Controller).TickStance(DeltaTime);
        //return;        
    }

    function ProcessMove(float DeltaTime, Vector NewAccel, Actor.EDoubleClickDir DoubleClickMove, Rotator DeltaRot)
    {
        local bool OldCrouch, OldProne;

        // End:0x27
        if(int(Pawn.Physics) == int(1))
        {
            Pawn.SetPhysics(2);
        }
        Pawn.Velocity = vKnockBackDir * fKnockBackMomentum;
        // End:0x60
        if(bPressedJump)
        {
            Pawn.DoJump(bUpdating);
        }
        Pawn.SetViewPitch(Rotation.Pitch);
        // End:0x139
        if(int(Pawn.Physics) != int(2))
        {
            OldCrouch = Pawn.bWantsToCrouch;
            OldProne = Pawn.bWantsToProne;
            // End:0xDE
            if(int(bProne) == 1)
            {
                Pawn.ShouldProne(true);                
            }
            else
            {
                // End:0x11D
                if(int(bDuck) == 1)
                {
                    // End:0x10A
                    if(OldProne == true)
                    {
                        Pawn.ShouldProne(false);                        
                    }
                    else
                    {
                        Pawn.ShouldCrouch(true);
                    }                    
                }
                else
                {
                    // End:0x139
                    if(OldCrouch == true)
                    {
                        Pawn.ShouldCrouch(false);
                    }
                }
            }
        }
        //return;        
    }

    function BeginState()
    {
        // End:0x27
        if(int(Pawn.Physics) == int(1))
        {
            Pawn.SetPhysics(2);
        }
        Pawn.Velocity = vKnockBackDir * fKnockBackMomentum;
        Pawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        //return;        
    }

    function EndState()
    {
        PreviousStateName = "PlayerKnockBack";
        //return;        
    }

    function Timer()
    {
        GotoState(Pawn.LandMovementState);
        //return;        
    }
Begin:

    SetTimer(fKnockBackTime, false);
    stop;            
}

defaultproperties
{
    fKnockBackTime=0.5000000
    fKnockBackMomentum=3000.0000000
    fKnockBackZ=0.1000000
    iRepairValue=1000
}