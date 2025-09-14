/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wMyPlayerStatus.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Structs:3
 *	Properties:95
 *	Functions:15
 *
 *******************************************************************************/
class wMyPlayerStatus extends Object
    native;

struct native sItem
{
    var BtrDouble iUniqueID;
    var int iItemID;
    var int iItemType;
    var int iDurability;
    var BtrDouble iUntilTime;
    var int iSlotPosition;
    var int iDamageDegree;
    var int iItemUsed;
    var int iOverlapCount;
    var int iPartsID;
    var int iPaintID;
};

struct native sSkill
{
    var int iUniqueSkillID;
    var int iSkillID;
    var BtrDouble iUntilTime;
    var byte bySlotPosition;
};

struct native sQuickSlot
{
    var string strName;
    var int iUniqueSlotID;
    var int iItemID[4];
    var BtrDouble iUniqueItemUID[4];
    var int iPartsID[4];
    var int iSkillID[4];
    var int iUniqueSkillID[4];
};

var BtrDouble CurrentTime;
var(Base) editconst int UserID;
var(Base) editconst string NickName;
var(Base) editconst string ClanName;
var(Base) editconst int Level;
var(Base) editconst int nExp;
var(Base) editconst int Stamina;
var(Base) editconst int HP;
var(Base) editconst int Ranking;
var(Base) editconst int Kill;
var(Base) editconst int Death;
var(Base) editconst int Win;
var(Base) editconst int Lose;
var(Base) editconst int TeamKill;
var(Base) editconst int Assist;
var(Base) editconst int Point;
var(Base) editconst int Cash;
var(Base) editconst int HeadShot2;
var(Base) editconst int DisCon;
var(Base) editconst int TotPlayTime;
var(Base) editconst int DispHeadItem;
var(Base) editconst int DispHeadAddItem;
var(Base) editconst int DispFaceItem;
var(Base) editconst int DispBodyItem;
var(Base) editconst int DispUniformItem;
var(Base) editconst int DispBackpack;
var byte Activated;
var array<sItem> ItemList;
var array<sSkill> SkillList;
var array<sQuickSlot> QuickSlotList;
var(MoveSpeed) float SprintSpeed;
var(MoveSpeed) float RunSpeed;
var(MoveSpeed) float CrouchSpeed;
var(MoveSpeed) float PronedSpeed;
var(MoveSpeed) float AimRunSpeed;
var(MoveSpeed) float AimCrouchSpeed;
var(MoveRatio) float F_DiagmoveRatio;
var(MoveRatio) float SideMoveRatio;
var(MoveRatio) float B_DiagmoveRatio;
var(MoveRatio) float BackMoveRatio;
var(AccelRate) float AccelRate;
var(Jump) float JumpMaxAcc;
var(Jump) float JumpMinAcc;
var(Jump) float JumpReduceRate;
var(Jump) float JumpRecoverRate;
var(Jump) float Land_Dropspeed_Rate;
var(ProneCamera) float ProneCam_MaxPicth;
var(ProneCamera) float ProneCam_MaxYaw;
var(ProneCamera) float ProneCam_RotSpeed;
var(Stamina) float Stm_MaxTime;
var(Stamina) float Stm_Delay_Stand;
var(Stamina) float Stm_Delay_Crouch;
var(Stamina) float Stm_Delay_Hit;
var(Ani_Test_Roll) Vector FL_Rot;
var(Ani_Test_Roll) Vector FR_Rot;
var(Ani_Test_Roll) Vector BL_Rot;
var(Ani_Test_Roll) Vector BR_Rot;
var(Ani_Test_Roll) Vector CFL_Rot;
var(Ani_Test_Roll) Vector CFR_Rot;
var(Ani_Test_Roll) Vector CBL_Rot;
var(Ani_Test_Roll) Vector CBR_Rot;
var(Ani_Test_Roll) float BodyFL_Rot;
var(Ani_Test_Roll) float BodyFR_Rot;
var(Ani_Test_Roll) float BodyBL_Rot;
var(Ani_Test_Roll) float BodyBR_Rot;
var(Ani_Test_Lean) Rotator Lean_L_Stand_0;
var(Ani_Test_Lean) Rotator Lean_L_Stand_1;
var(Ani_Test_Lean) Rotator Lean_L_Stand_2;
var(Ani_Test_Lean) Rotator Lean_R_Stand_0;
var(Ani_Test_Lean) Rotator Lean_R_Stand_1;
var(Ani_Test_Lean) Rotator Lean_R_Stand_2;
var(Ani_Test_Lean) Rotator Lean_L_Crouch_0;
var(Ani_Test_Lean) Rotator Lean_L_Crouch_1;
var(Ani_Test_Lean) Rotator Lean_L_Crouch_2;
var(Ani_Test_Lean) Rotator Lean_R_Crouch_0;
var(Ani_Test_Lean) Rotator Lean_R_Crouch_1;
var(Ani_Test_Lean) Rotator Lean_R_Crouch_2;
var(Ani_Test_Lean) Rotator Lean_L_Prone_0;
var(Ani_Test_Lean) Rotator Lean_L_Prone_1;
var(Ani_Test_Lean) Rotator Lean_L_Prone_2;
var(Ani_Test_Lean) Rotator Lean_R_Prone_0;
var(Ani_Test_Lean) Rotator Lean_R_Prone_1;
var(Ani_Test_Lean) Rotator Lean_R_Prone_2;
var(TweenTime) float TweenRate_Proned_Run;
var(TweenTime) float TweenRate_Crouched_Run;
var(TweenTime) float TweenRate_Sprint;
var(TweenTime) float TweenRate_Run;
var(TweenTime) float TweenRate_Aim_Run;
var(TweenTime) float TweenRate_Idle;
var(TweenTime) float TweenRate_Proned_Idle;
var(TweenTime) float TweenRate_Crouched_Idle;
var(TweenTime) float TweenRate_SideStep;
var int iCurWeaponId;
var int iReceivedItemTotalCount;
var int iReceivedSkillTotalCount;

function int FindItemIDBySlotPos(int SlotPos)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x4c [While If]
    if(i < ItemList.Length)
    {
        // End:0x42
        if(ItemList[i].iSlotPosition == SlotPos)
        {
            return ItemList[i].iItemID;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return -1;
}

function int FindItemIndexByUniqueID(BtrDouble UniqueID)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x42 [While If]
    if(i < ItemList.Length)
    {
        // End:0x38
        if(UnresolvedNativeFunction_99(ItemList[i].iUniqueID, UniqueID))
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return -1;
}

function int FindSkillItemIndexByUniqueID(int UniqueID)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x41 [While If]
    if(i < SkillList.Length)
    {
        // End:0x37
        if(SkillList[i].iUniqueSkillID == UniqueID)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return -1;
}

function bool IsQuickSlotItem(BtrDouble UniqueID)
{
    local int i, j;

    i = 0;
    J0x07:
    // End:0x61 [While If]
    if(i < QuickSlotList.Length)
    {
        j = 0;
        J0x1e:
        // End:0x57 [While If]
        if(j < 4)
        {
            // End:0x4d
            if(UnresolvedNativeFunction_99(QuickSlotList[i].iUniqueItemUID[j], UniqueID))
            {
                return true;
            }
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0x1e;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return false;
}

function bool IsQuickSlotSkillItem(int UniqueID)
{
    local int i, j;

    i = 0;
    J0x07:
    // End:0x60 [While If]
    if(i < QuickSlotList.Length)
    {
        j = 0;
        J0x1e:
        // End:0x56 [While If]
        if(j < 4)
        {
            // End:0x4c
            if(QuickSlotList[i].iUniqueSkillID[j] == UniqueID)
            {
                return true;
            }
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0x1e;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return false;
}

function RemoveItem(BtrDouble UniqueID)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x4a [While If]
    if(i < ItemList.Length)
    {
        // End:0x40
        if(UnresolvedNativeFunction_99(ItemList[i].iUniqueID, UniqueID))
        {
            ItemList.Remove(i, 1);
            return;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function RemoveQuickSlotItem(BtrDouble UniqueID)
{
    local int i, j;

    i = 0;
    J0x07:
    // End:0xe5 [While If]
    if(i < QuickSlotList.Length)
    {
        j = 0;
        J0x1e:
        // End:0xdb [While If]
        if(j < 4)
        {
            // End:0xd1
            if(UnresolvedNativeFunction_99(QuickSlotList[i].iUniqueItemUID[j], UniqueID))
            {
                QuickSlotList[i].iItemID[j] = 0;
                QuickSlotList[i].iPartsID[j] = 0;
                QuickSlotList[i].iSkillID[j] = 0;
                QuickSlotList[i].iUniqueItemUID[j] = class'BTCustomDrawHK'.static.EmptyBtrDouble();
                QuickSlotList[i].iUniqueSkillID[j] = 0;
            }
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0x1e;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function RemoveQuickSlotSkillItem(int UniqueID)
{
    local int i, j;

    i = 0;
    J0x07:
    // End:0xe4 [While If]
    if(i < QuickSlotList.Length)
    {
        j = 0;
        J0x1e:
        // End:0xda [While If]
        if(j < 4)
        {
            // End:0xd0
            if(QuickSlotList[i].iUniqueSkillID[j] == UniqueID)
            {
                QuickSlotList[i].iItemID[j] = 0;
                QuickSlotList[i].iPartsID[j] = 0;
                QuickSlotList[i].iSkillID[j] = 0;
                QuickSlotList[i].iUniqueItemUID[j] = class'BTCustomDrawHK'.static.EmptyBtrDouble();
                QuickSlotList[i].iUniqueSkillID[j] = 0;
            }
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0x1e;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function SetItemListStart(int Count)
{
    iReceivedItemTotalCount = Count;
    ItemList.Remove(0, ItemList.Length);
    Log("[ItemListStart] Engine.wMyPlayerStatus.ItemListStart - Count : " $ string(Count));
}

function SetItemList(array<BtrDouble> UniqueID, array<int> ItemID, array<int> ItemType, array<int> Durability, array<BtrDouble> UntilTime, array<int> SlotPosition, array<int> AddPartsID, array<int> DamageDegree, array<byte> ItemState, array<int> StackCount, array<int> PaintID)
{
    local int i, iTempTotalCount;
    local sItem tmItem;

    Log("[ItemList] Engine.wMyPlayerStatus.ItemList");
    iTempTotalCount = iReceivedItemTotalCount;
    // End:0x4d
    if(iTempTotalCount > 30)
    {
        iTempTotalCount = 30;
    }
    i = 0;
    J0x54:
    // End:0x173 [While If]
    if(i < iTempTotalCount)
    {
        tmItem.iUniqueID = UniqueID[i];
        tmItem.iItemID = ItemID[i];
        tmItem.iItemType = ItemType[i];
        tmItem.iDurability = Durability[i];
        tmItem.iUntilTime = UntilTime[i];
        tmItem.iSlotPosition = SlotPosition[i];
        tmItem.iDamageDegree = DamageDegree[i];
        tmItem.iPartsID = AddPartsID[i];
        tmItem.iItemUsed = ItemState[i];
        tmItem.iOverlapCount = StackCount[i];
        tmItem.iPaintID = PaintID[i];
        ItemList[ItemList.Length] = tmItem;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x54;
    }
    iReceivedItemTotalCount = iReceivedItemTotalCount - iTempTotalCount;
}

function SetItemListEnd()
{
    Log("[ItemList] Engine.wMyPlayerStatus.ItemListEnd");
    // End:0x90
    if(iReceivedItemTotalCount != 0)
    {
        Log("[ERROR] Engine.wMyPlayerStatus.ItemListEnd :: TotalCount is Not Zero - " $ string(iReceivedItemTotalCount));
    }
}

function SetSkillListStart(int Count)
{
    iReceivedSkillTotalCount = Count;
    SkillList.Remove(0, SkillList.Length);
    Log("[SetSkillListStart] Engine.wMyPlayerStatus.SetSkillListStart - Count : " $ string(Count));
}

function SetSkillList(array<int> UniqueSkillID, array<int> SkillID, array<BtrDouble> UntilTime, array<byte> SlotPosition)
{
    local int i, iTempTotalCount;
    local sSkill tmSkill;

    Log("[SetSkillList] Engine.wMyPlayerStatus.SetSkillList");
    iTempTotalCount = iReceivedSkillTotalCount;
    // End:0x55
    if(iTempTotalCount > 30)
    {
        iTempTotalCount = 30;
    }
    i = 0;
    J0x5c:
    // End:0xdf [While If]
    if(i < iTempTotalCount)
    {
        tmSkill.iUniqueSkillID = UniqueSkillID[i];
        tmSkill.iSkillID = SkillID[i];
        tmSkill.iUntilTime = UntilTime[i];
        tmSkill.bySlotPosition = SlotPosition[i];
        SkillList[SkillList.Length] = tmSkill;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x5c;
    }
    iReceivedSkillTotalCount = iReceivedSkillTotalCount - iTempTotalCount;
}

function SetSkillListEnd()
{
    Log("[SetSkillListEnd] Engine.wMyPlayerStatus.SetSkillListEnd");
    // End:0x9f
    if(iReceivedSkillTotalCount != 0)
    {
        Log("[ERROR] Engine.wMyPlayerStatus.SetSkillListEnd :: TotalCount is Not Zero - " $ string(iReceivedSkillTotalCount));
    }
}

function SetQSlotList(array<int> QSlotID, array<string> QSlotName, array<byte> QSlotDispOrder, array<BtrDouble> MWItemID, array<BtrDouble> PistolItemID, array<BtrDouble> TWItemID1, array<BtrDouble> TWItemID2, array<int> Skill1, array<int> Skill2, array<int> Skill3, array<int> Skill4)
{
    local int i, j, k, iIndex;

    Log("[SetQSlotList] Engine.wMyPlayerStatus.SetQSlotList");
    i = 0;
    J0x3d:
    // End:0x199 [While If]
    if(i < QSlotID.Length)
    {
        iIndex = QSlotDispOrder[i] - 1;
        QuickSlotList[iIndex].strName = QSlotName[i];
        QuickSlotList[iIndex].iUniqueSlotID = QSlotID[i];
        QuickSlotList[iIndex].iUniqueItemUID[0] = MWItemID[i];
        QuickSlotList[iIndex].iUniqueItemUID[1] = PistolItemID[i];
        QuickSlotList[iIndex].iUniqueItemUID[2] = TWItemID1[i];
        QuickSlotList[iIndex].iUniqueItemUID[3] = TWItemID2[i];
        QuickSlotList[iIndex].iUniqueSkillID[0] = Skill1[i];
        QuickSlotList[iIndex].iUniqueSkillID[1] = Skill2[i];
        QuickSlotList[iIndex].iUniqueSkillID[2] = Skill3[i];
        QuickSlotList[iIndex].iUniqueSkillID[3] = Skill4[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x3d;
    }
    i = 0;
    J0x1a0:
    // End:0x35a [While If]
    if(i < QuickSlotList.Length)
    {
        j = 0;
        J0x1b7:
        // End:0x350 [While If]
        if(j < 4)
        {
            // End:0x281
            if(UnresolvedNativeFunction_99(QuickSlotList[i].iUniqueItemUID[j], 0))
            {
                k = 0;
                J0x1e7:
                // End:0x27e [While If]
                if(k < ItemList.Length)
                {
                    // End:0x274
                    if(UnresolvedNativeFunction_99(QuickSlotList[i].iUniqueItemUID[j], ItemList[k].iUniqueID))
                    {
                        QuickSlotList[i].iItemID[j] = ItemList[k].iItemID;
                        QuickSlotList[i].iPartsID[j] = ItemList[k].iPartsID;
                    }
                    // End:0x27e
                    else
                    {
                        ++ k;
                        // This is an implied JumpToken; Continue!
                        goto J0x1e7;
                    }
                }
            }
            // End:0x299
            else
            {
                QuickSlotList[i].iItemID[j] = 0;
            }
            // End:0x32e
            if(QuickSlotList[i].iUniqueSkillID[j] != 0)
            {
                k = 0;
                J0x2bc:
                // End:0x32b [While If]
                if(k < SkillList.Length)
                {
                    // End:0x321
                    if(QuickSlotList[i].iUniqueSkillID[j] == SkillList[k].iUniqueSkillID)
                    {
                        QuickSlotList[i].iSkillID[j] = SkillList[k].iSkillID;
                    }
                    // End:0x32b
                    else
                    {
                        ++ k;
                        // This is an implied JumpToken; Continue!
                        goto J0x2bc;
                    }
                }
            }
            // End:0x346
            else
            {
                QuickSlotList[i].iSkillID[j] = 0;
            }
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0x1b7;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1a0;
    }
}

defaultproperties
{
    NickName="DefaultName"
    ClanName="Clan_Default"
    QuickSlotList=// Object reference not set to an instance of an object.
    
    SprintSpeed=570.0
    RunSpeed=370.0
    CrouchSpeed=252.0
    PronedSpeed=100.0
    AimRunSpeed=122.0
    AimCrouchSpeed=83.0
    F_DiagmoveRatio=0.90
    SideMoveRatio=0.80
    B_DiagmoveRatio=0.70
    BackMoveRatio=0.70
    AccelRate=2048.0
    JumpMaxAcc=530.0
    JumpMinAcc=260.0
    JumpReduceRate=80.0
    JumpRecoverRate=200.0
    Land_Dropspeed_Rate=1.0
    ProneCam_MaxPicth=10000.0
    ProneCam_MaxYaw=10000.0
    ProneCam_RotSpeed=10.0
    FL_Rot=(X=800.0,Y=500.0,Z=-6000.0)
    FR_Rot=(X=-1200.0,Y=0.0,Z=5800.0)
    BL_Rot=(X=-100.0,Y=0.0,Z=4500.0)
    BR_Rot=(X=500.0,Y=0.0,Z=-4500.0)
    CFL_Rot=(X=2200.0,Y=200.0,Z=-3000.0)
    CFR_Rot=(X=-2500.0,Y=100.0,Z=3000.0)
    CBL_Rot=(X=-1400.0,Y=0.0,Z=2600.0)
    CBR_Rot=(X=1600.0,Y=500.0,Z=-2500.0)
    BodyFL_Rot=-8500.0
    BodyFR_Rot=8500.0
    BodyBL_Rot=8500.0
    BodyBR_Rot=-8000.0
    TweenRate_Proned_Run=0.30
    TweenRate_Crouched_Run=0.20
    TweenRate_Sprint=0.10
    TweenRate_Run=0.20
    TweenRate_Aim_Run=0.20
    TweenRate_Idle=0.30
    TweenRate_Proned_Idle=0.20
    TweenRate_Crouched_Idle=0.20
    TweenRate_SideStep=0.10
    iCurWeaponId=-1
}