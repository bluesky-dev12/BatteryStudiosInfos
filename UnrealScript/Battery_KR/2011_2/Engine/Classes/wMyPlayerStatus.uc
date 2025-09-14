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
var(Base) editconst string Clanname;
var(Base) editconst int Level;
var(Base) editconst int Exp;
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
var float BodyFL_Rot;
var float BodyFR_Rot;
var float BodyBL_Rot;
var float BodyBR_Rot;
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
var int iCurWeaponId;
var int iReceivedItemTotalCount;
var int iReceivedSkillTotalCount;

function int FindItemIDBySlotPos(int SlotPos)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x4C [Loop If]
    if(i < ItemList.Length)
    {
        // End:0x42
        if(ItemList[i].iSlotPosition == SlotPos)
        {
            return ItemList[i].iItemID;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return -1;
    //return;    
}

function int FindItemIndexByUniqueID(BtrDouble UniqueID)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x42 [Loop If]
    if(i < ItemList.Length)
    {
        // End:0x38
        if(__NFUN_912__(ItemList[i].iUniqueID, UniqueID))
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return -1;
    //return;    
}

function int FindSkillItemIndexByUniqueID(int UniqueID)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x41 [Loop If]
    if(i < SkillList.Length)
    {
        // End:0x37
        if(SkillList[i].iUniqueSkillID == UniqueID)
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return -1;
    //return;    
}

function bool IsQuickSlotItem(BtrDouble UniqueID)
{
    local int i, j;

    i = 0;
    J0x07:

    // End:0x61 [Loop If]
    if(i < QuickSlotList.Length)
    {
        j = 0;
        J0x1E:

        // End:0x57 [Loop If]
        if(j < 4)
        {
            // End:0x4D
            if(__NFUN_912__(QuickSlotList[i].iUniqueItemUID[j], UniqueID))
            {
                return true;
            }
            j++;
            // [Loop Continue]
            goto J0x1E;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return false;
    //return;    
}

function bool IsQuickSlotSkillItem(int UniqueID)
{
    local int i, j;

    i = 0;
    J0x07:

    // End:0x60 [Loop If]
    if(i < QuickSlotList.Length)
    {
        j = 0;
        J0x1E:

        // End:0x56 [Loop If]
        if(j < 4)
        {
            // End:0x4C
            if(QuickSlotList[i].iUniqueSkillID[j] == UniqueID)
            {
                return true;
            }
            j++;
            // [Loop Continue]
            goto J0x1E;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return false;
    //return;    
}

function RemoveItem(BtrDouble UniqueID)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x4A [Loop If]
    if(i < ItemList.Length)
    {
        // End:0x40
        if(__NFUN_912__(ItemList[i].iUniqueID, UniqueID))
        {
            ItemList.Remove(i, 1);
            return;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function RemoveQuickSlotItem(BtrDouble UniqueID)
{
    local int i, j;

    i = 0;
    J0x07:

    // End:0xE5 [Loop If]
    if(i < QuickSlotList.Length)
    {
        j = 0;
        J0x1E:

        // End:0xDB [Loop If]
        if(j < 4)
        {
            // End:0xD1
            if(__NFUN_912__(QuickSlotList[i].iUniqueItemUID[j], UniqueID))
            {
                QuickSlotList[i].iItemID[j] = 0;
                QuickSlotList[i].iPartsID[j] = 0;
                QuickSlotList[i].iSkillID[j] = 0;
                QuickSlotList[i].iUniqueItemUID[j] = Class'Engine_Decompressed.BTCustomDrawHK'.static.EmptyBtrDouble();
                QuickSlotList[i].iUniqueSkillID[j] = 0;
            }
            j++;
            // [Loop Continue]
            goto J0x1E;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function RemoveQuickSlotSkillItem(int UniqueID)
{
    local int i, j;

    i = 0;
    J0x07:

    // End:0xE4 [Loop If]
    if(i < QuickSlotList.Length)
    {
        j = 0;
        J0x1E:

        // End:0xDA [Loop If]
        if(j < 4)
        {
            // End:0xD0
            if(QuickSlotList[i].iUniqueSkillID[j] == UniqueID)
            {
                QuickSlotList[i].iItemID[j] = 0;
                QuickSlotList[i].iPartsID[j] = 0;
                QuickSlotList[i].iSkillID[j] = 0;
                QuickSlotList[i].iUniqueItemUID[j] = Class'Engine_Decompressed.BTCustomDrawHK'.static.EmptyBtrDouble();
                QuickSlotList[i].iUniqueSkillID[j] = 0;
            }
            j++;
            // [Loop Continue]
            goto J0x1E;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function SetItemListStart(int Count)
{
    iReceivedItemTotalCount = Count;
    ItemList.Remove(0, ItemList.Length);
    Log("[ItemListStart] Engine.wMyPlayerStatus.ItemListStart - Count : " $ string(Count));
    //return;    
}

function SetItemList(array<BtrDouble> UniqueID, array<int> ItemID, array<int> ItemType, array<int> Durability, array<BtrDouble> UntilTime, array<int> SlotPosition, array<int> AddPartsID, array<int> DamageDegree, array<byte> ItemState, array<int> StackCount, array<int> PaintID)
{
    local int i, iTempTotalCount;
    local sItem tmItem;

    Log("[ItemList] Engine.wMyPlayerStatus.ItemList");
    iTempTotalCount = iReceivedItemTotalCount;
    // End:0x4D
    if(iTempTotalCount > 30)
    {
        iTempTotalCount = 30;
    }
    i = 0;
    J0x54:

    // End:0x173 [Loop If]
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
        tmItem.iItemUsed = int(ItemState[i]);
        tmItem.iOverlapCount = StackCount[i];
        tmItem.iPaintID = PaintID[i];
        ItemList[ItemList.Length] = tmItem;
        i++;
        // [Loop Continue]
        goto J0x54;
    }
    iReceivedItemTotalCount = iReceivedItemTotalCount - iTempTotalCount;
    //return;    
}

function SetItemListEnd()
{
    Log("[ItemList] Engine.wMyPlayerStatus.ItemListEnd");
    // End:0x90
    if(iReceivedItemTotalCount != 0)
    {
        Log("[ERROR] Engine.wMyPlayerStatus.ItemListEnd :: TotalCount is Not Zero - " $ string(iReceivedItemTotalCount));
    }
    //return;    
}

function SetSkillListStart(int Count)
{
    iReceivedSkillTotalCount = Count;
    SkillList.Remove(0, SkillList.Length);
    Log("[SetSkillListStart] Engine.wMyPlayerStatus.SetSkillListStart - Count : " $ string(Count));
    //return;    
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
    J0x5C:

    // End:0xDF [Loop If]
    if(i < iTempTotalCount)
    {
        tmSkill.iUniqueSkillID = UniqueSkillID[i];
        tmSkill.iSkillID = SkillID[i];
        tmSkill.iUntilTime = UntilTime[i];
        tmSkill.bySlotPosition = SlotPosition[i];
        SkillList[SkillList.Length] = tmSkill;
        i++;
        // [Loop Continue]
        goto J0x5C;
    }
    iReceivedSkillTotalCount = iReceivedSkillTotalCount - iTempTotalCount;
    //return;    
}

function SetSkillListEnd()
{
    Log("[SetSkillListEnd] Engine.wMyPlayerStatus.SetSkillListEnd");
    // End:0x9F
    if(iReceivedSkillTotalCount != 0)
    {
        Log("[ERROR] Engine.wMyPlayerStatus.SetSkillListEnd :: TotalCount is Not Zero - " $ string(iReceivedSkillTotalCount));
    }
    //return;    
}

function SetQSlotList(array<int> QSlotID, array<string> QSlotName, array<byte> QSlotDispOrder, array<BtrDouble> MWItemID, array<BtrDouble> PistolItemID, array<BtrDouble> TWItemID1, array<BtrDouble> TWItemID2, array<int> Skill1, array<int> Skill2, array<int> Skill3, array<int> Skill4)
{
    local int i, j, k, iIndex;

    Log("[SetQSlotList] Engine.wMyPlayerStatus.SetQSlotList");
    i = 0;
    J0x3D:

    // End:0x199 [Loop If]
    if(i < QSlotID.Length)
    {
        iIndex = int(QSlotDispOrder[i]) - 1;
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
        i++;
        // [Loop Continue]
        goto J0x3D;
    }
    i = 0;
    J0x1A0:

    // End:0x35A [Loop If]
    if(i < QuickSlotList.Length)
    {
        j = 0;
        J0x1B7:

        // End:0x350 [Loop If]
        if(j < 4)
        {
            // End:0x281
            if(__NFUN_920__(QuickSlotList[i].iUniqueItemUID[j], 0))
            {
                k = 0;
                J0x1E7:

                // End:0x27E [Loop If]
                if(k < ItemList.Length)
                {
                    // End:0x274
                    if(__NFUN_912__(QuickSlotList[i].iUniqueItemUID[j], ItemList[k].iUniqueID))
                    {
                        QuickSlotList[i].iItemID[j] = ItemList[k].iItemID;
                        QuickSlotList[i].iPartsID[j] = ItemList[k].iPartsID;
                        // [Explicit Break]
                        goto J0x27E;
                    }
                    k++;
                    // [Loop Continue]
                    goto J0x1E7;
                }
                J0x27E:
                
            }
            else
            {
                QuickSlotList[i].iItemID[j] = 0;
            }
            // End:0x32E
            if(QuickSlotList[i].iUniqueSkillID[j] != 0)
            {
                k = 0;
                J0x2BC:

                // End:0x32B [Loop If]
                if(k < SkillList.Length)
                {
                    // End:0x321
                    if(QuickSlotList[i].iUniqueSkillID[j] == SkillList[k].iUniqueSkillID)
                    {
                        QuickSlotList[i].iSkillID[j] = SkillList[k].iSkillID;
                        // [Explicit Break]
                        goto J0x32B;
                    }
                    k++;
                    // [Loop Continue]
                    goto J0x2BC;
                }
                J0x32B:

                // [Explicit Continue]
                goto J0x346;
            }
            QuickSlotList[i].iSkillID[j] = 0;
            J0x346:

            j++;
            // [Loop Continue]
            goto J0x1B7;
        }
        i++;
        // [Loop Continue]
        goto J0x1A0;
    }
    //return;    
}

defaultproperties
{
    NickName="DefaultName"
    Clanname="Clan_Default"
    QuickSlotList[0]=(strName="",iUniqueSlotID=0,iItemID=0,iItemID[1]=0,iItemID[2]=0,iItemID[3]=0,iUniqueItemUID=(dummy_1_DO_NOT_USE=0,dummy_2_DO_NOT_USE=0),iUniqueItemUID[1]=(dummy_1_DO_NOT_USE=0,dummy_2_DO_NOT_USE=0),iUniqueItemUID[2]=(dummy_1_DO_NOT_USE=0,dummy_2_DO_NOT_USE=0),iUniqueItemUID[3]=(dummy_1_DO_NOT_USE=0,dummy_2_DO_NOT_USE=0),iPartsID=0,iPartsID[1]=0,iPartsID[2]=0,iPartsID[3]=0,iSkillID=0,iSkillID[1]=0,iSkillID[2]=0,iSkillID[3]=0,iUniqueSkillID=0,iUniqueSkillID[1]=0,iUniqueSkillID[2]=0,iUniqueSkillID[3]=0)
    QuickSlotList[1]=(strName="",iUniqueSlotID=0,iItemID=0,iItemID[1]=0,iItemID[2]=0,iItemID[3]=0,iUniqueItemUID=(dummy_1_DO_NOT_USE=0,dummy_2_DO_NOT_USE=0),iUniqueItemUID[1]=(dummy_1_DO_NOT_USE=0,dummy_2_DO_NOT_USE=0),iUniqueItemUID[2]=(dummy_1_DO_NOT_USE=0,dummy_2_DO_NOT_USE=0),iUniqueItemUID[3]=(dummy_1_DO_NOT_USE=0,dummy_2_DO_NOT_USE=0),iPartsID=0,iPartsID[1]=0,iPartsID[2]=0,iPartsID[3]=0,iSkillID=0,iSkillID[1]=0,iSkillID[2]=0,iSkillID[3]=0,iUniqueSkillID=0,iUniqueSkillID[1]=0,iUniqueSkillID[2]=0,iUniqueSkillID[3]=0)
    QuickSlotList[2]=(strName="",iUniqueSlotID=0,iItemID=0,iItemID[1]=0,iItemID[2]=0,iItemID[3]=0,iUniqueItemUID=(dummy_1_DO_NOT_USE=0,dummy_2_DO_NOT_USE=0),iUniqueItemUID[1]=(dummy_1_DO_NOT_USE=0,dummy_2_DO_NOT_USE=0),iUniqueItemUID[2]=(dummy_1_DO_NOT_USE=0,dummy_2_DO_NOT_USE=0),iUniqueItemUID[3]=(dummy_1_DO_NOT_USE=0,dummy_2_DO_NOT_USE=0),iPartsID=0,iPartsID[1]=0,iPartsID[2]=0,iPartsID[3]=0,iSkillID=0,iSkillID[1]=0,iSkillID[2]=0,iSkillID[3]=0,iUniqueSkillID=0,iUniqueSkillID[1]=0,iUniqueSkillID[2]=0,iUniqueSkillID[3]=0)
    QuickSlotList[3]=(strName="",iUniqueSlotID=0,iItemID=0,iItemID[1]=0,iItemID[2]=0,iItemID[3]=0,iUniqueItemUID=(dummy_1_DO_NOT_USE=0,dummy_2_DO_NOT_USE=0),iUniqueItemUID[1]=(dummy_1_DO_NOT_USE=0,dummy_2_DO_NOT_USE=0),iUniqueItemUID[2]=(dummy_1_DO_NOT_USE=0,dummy_2_DO_NOT_USE=0),iUniqueItemUID[3]=(dummy_1_DO_NOT_USE=0,dummy_2_DO_NOT_USE=0),iPartsID=0,iPartsID[1]=0,iPartsID[2]=0,iPartsID[3]=0,iSkillID=0,iSkillID[1]=0,iSkillID[2]=0,iSkillID[3]=0,iUniqueSkillID=0,iUniqueSkillID[1]=0,iUniqueSkillID[2]=0,iUniqueSkillID[3]=0)
    QuickSlotList[4]=(strName="",iUniqueSlotID=0,iItemID=0,iItemID[1]=0,iItemID[2]=0,iItemID[3]=0,iUniqueItemUID=(dummy_1_DO_NOT_USE=0,dummy_2_DO_NOT_USE=0),iUniqueItemUID[1]=(dummy_1_DO_NOT_USE=0,dummy_2_DO_NOT_USE=0),iUniqueItemUID[2]=(dummy_1_DO_NOT_USE=0,dummy_2_DO_NOT_USE=0),iUniqueItemUID[3]=(dummy_1_DO_NOT_USE=0,dummy_2_DO_NOT_USE=0),iPartsID=0,iPartsID[1]=0,iPartsID[2]=0,iPartsID[3]=0,iSkillID=0,iSkillID[1]=0,iSkillID[2]=0,iSkillID[3]=0,iUniqueSkillID=0,iUniqueSkillID[1]=0,iUniqueSkillID[2]=0,iUniqueSkillID[3]=0)
    SprintSpeed=570.0000000
    RunSpeed=370.0000000
    CrouchSpeed=252.0000000
    PronedSpeed=100.0000000
    AimRunSpeed=122.0000000
    AimCrouchSpeed=83.0000000
    F_DiagmoveRatio=0.9000000
    SideMoveRatio=0.8000000
    B_DiagmoveRatio=0.7000000
    BackMoveRatio=0.7000000
    AccelRate=2048.0000000
    JumpMaxAcc=530.0000000
    JumpMinAcc=260.0000000
    JumpReduceRate=80.0000000
    JumpRecoverRate=200.0000000
    Land_Dropspeed_Rate=0.3000000
    ProneCam_MaxPicth=10000.0000000
    ProneCam_MaxYaw=10000.0000000
    ProneCam_RotSpeed=10.0000000
    FL_Rot=(X=800.0000000,Y=500.0000000,Z=-6000.0000000)
    FR_Rot=(X=-1200.0000000,Y=0.0000000,Z=5800.0000000)
    BL_Rot=(X=-100.0000000,Y=0.0000000,Z=4500.0000000)
    BR_Rot=(X=500.0000000,Y=0.0000000,Z=-4500.0000000)
    CFL_Rot=(X=2200.0000000,Y=200.0000000,Z=-3000.0000000)
    CFR_Rot=(X=-2500.0000000,Y=100.0000000,Z=3000.0000000)
    CBL_Rot=(X=-1400.0000000,Y=0.0000000,Z=2600.0000000)
    CBR_Rot=(X=1600.0000000,Y=500.0000000,Z=-2500.0000000)
    BodyFL_Rot=-7500.0000000
    BodyFR_Rot=7500.0000000
    BodyBL_Rot=5000.0000000
    BodyBR_Rot=-5500.0000000
    iCurWeaponId=-1
}