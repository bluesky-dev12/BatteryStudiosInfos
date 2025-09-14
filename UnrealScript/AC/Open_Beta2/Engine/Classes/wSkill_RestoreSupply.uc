class wSkill_RestoreSupply extends wSkill;

struct sSUPPLY_ITEM_EQUIPMENT
{
    var int iWeaponID;
    var bool bHaveSupplyItem;
};

var array<sSUPPLY_ITEM_EQUIPMENT> m_abSupplyItemEquipment;

simulated function Initialize(wSkillBase SkillBase, wSkillBaseParam Param)
{
    local int i;

    super.Initialize(SkillBase, Param);
    m_abSupplyItemEquipment.Length = int(5);
    i = 0;
    J0x22:

    // End:0x4D [Loop If]
    if(i < int(5))
    {
        m_abSupplyItemEquipment[i].bHaveSupplyItem = false;
        ++i;
        // [Loop Continue]
        goto J0x22;
    }
    m_abSupplyItemEquipment[int(1)].iWeaponID = 5010;
    m_abSupplyItemEquipment[int(2)].iWeaponID = 5009;
    m_abSupplyItemEquipment[int(3)].iWeaponID = 5006;
    m_abSupplyItemEquipment[int(4)].iWeaponID = 5018;
    //return;    
}

simulated function PostBeginPlay()
{
    local int i;

    // End:0x16
    if(none == Base.Owner)
    {
        return;
    }
    // End:0x35
    if(none == Base.Owner.Pawn)
    {
        return;
    }
    i = 0;
    J0x3C:

    // End:0x14C [Loop If]
    if(i < int(5))
    {
        // End:0xFB
        if(false == Base.Owner.Level.GetMatchMaker().bChangingHost)
        {
            // End:0xFB
            if(m_abSupplyItemEquipment[i].bHaveSupplyItem)
            {
                Base.Owner.Pawn.PlayerReplicationInfo.abySupplyItemFlag[i] = 1;
                Base.Owner.Pawn.AddWeaponFromSkill(EmptyBtrDouble(), m_abSupplyItemEquipment[i].iWeaponID);
                // [Explicit Continue]
                goto J0x142;
            }
        }
        // End:0x142
        if(Base.Owner.Pawn.HasWeaponByWeaponID(m_abSupplyItemEquipment[i].iWeaponID))
        {
            m_abSupplyItemEquipment[i].bHaveSupplyItem = true;
        }
        J0x142:

        ++i;
        // [Loop Continue]
        goto J0x3C;
    }
    //return;    
}

simulated function RemoveSkill()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x32 [Loop If]
    if(i < int(5))
    {
        m_abSupplyItemEquipment[i].bHaveSupplyItem = false;
        ++i;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

simulated function SetSupplyItem(Object.ESUPPLY_ITEM_TYPE eSupplyItemType)
{
    m_abSupplyItemEquipment[int(eSupplyItemType)].bHaveSupplyItem = true;
    //return;    
}

simulated function RemoveSupplyItem(Object.ESUPPLY_ITEM_TYPE eSupplyItemType)
{
    m_abSupplyItemEquipment[int(eSupplyItemType)].bHaveSupplyItem = false;
    //return;    
}

simulated function UpdateProcess()
{
    //return;    
}
