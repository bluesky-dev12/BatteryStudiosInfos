class wSkillBase extends Object;

var array<wSkill> Skills;
var Controller Owner;
var bool bAddStamina;
var bool bIncExplosion;
var bool bQuickRespawn;
var bool bQuickDemolition;
var bool bBombDetection;
var bool bIncHealthPack;

simulated function PostBeginPlay()
{
    local int iTemp;

    bAddStamina = false;
    bIncExplosion = false;
    bQuickRespawn = false;
    bQuickDemolition = false;
    bBombDetection = false;
    bIncHealthPack = false;
    PlayerController(Owner).ServerAddStamina(false);
    PlayerController(Owner).ServerIncExplosion(false);
    PlayerController(Owner).ServerQuickRespawn(false);
    PlayerController(Owner).ServerQuickDemolition(false);
    PlayerController(Owner).ServerBombDetection(false);
    PlayerController(Owner).ServerIncHealthPack(false);
    iTemp = 0;
    J0xB5:

    // End:0xE4 [Loop If]
    if(iTemp < Skills.Length)
    {
        Skills[iTemp].PostBeginPlay();
        iTemp++;
        // [Loop Continue]
        goto J0xB5;
    }
    //return;    
}

simulated function ForceResetSkillUpdateCall()
{
    local int iTemp;

    iTemp = 0;
    J0x07:

    // End:0x37 [Loop If]
    if(iTemp < Skills.Length)
    {
        Skills[iTemp].SetbUpdateCall(false);
        iTemp++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

simulated function UpdateProcess()
{
    local int iTemp;

    iTemp = 0;
    J0x07:

    // End:0x36 [Loop If]
    if(iTemp < Skills.Length)
    {
        Skills[iTemp].UpdateProcess();
        iTemp++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

simulated function DeadPlayer()
{
    local int iTemp;

    iTemp = 0;
    J0x07:

    // End:0x36 [Loop If]
    if(iTemp < Skills.Length)
    {
        Skills[iTemp].DeadPlayer();
        iTemp++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

simulated function ResetSkillState()
{
    local int iTemp;

    bAddStamina = false;
    bIncExplosion = false;
    bQuickRespawn = false;
    bQuickDemolition = false;
    bBombDetection = false;
    bIncHealthPack = false;
    iTemp = 0;
    J0x37:

    // End:0x67 [Loop If]
    if(iTemp < Skills.Length)
    {
        Skills[iTemp].SetIsEnable(false);
        iTemp++;
        // [Loop Continue]
        goto J0x37;
    }
    //return;    
}

simulated function AddSkill(int iSkillID, wGameManager gm)
{
    local wSkillBaseParam Param;
    local Class<wSkill> tmSkillClass;
    local wSkill tmSkill;
    local int iTemp;

    Param = gm.GetSkillParam(iSkillID);
    // End:0x34
    if(Param.iSkillID == -1)
    {
        return;
    }
    iTemp = 0;
    J0x3B:

    // End:0x75 [Loop If]
    if(iTemp < Skills.Length)
    {
        // End:0x6B
        if(Skills[iTemp].SkillID == iSkillID)
        {
            return;
        }
        iTemp++;
        // [Loop Continue]
        goto J0x3B;
    }
    tmSkillClass = Class<wSkill>(DynamicLoadObject(Param.strClassName, Class'Core.Class'));
    tmSkill = new tmSkillClass;
    tmSkill.Initialize(self, Param);
    Skills[Skills.Length] = tmSkill;
    //return;    
}

simulated function RemoveSkill(int iSkillID, wGameManager gm)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x62 [Loop If]
    if(i < Skills.Length)
    {
        // End:0x58
        if(Skills[i].SkillID == iSkillID)
        {
            Skills[i].RemoveSkill();
            Skills.Remove(i, 1);
            return;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

simulated function UsedbyWeapon(int iWeaponID)
{
    local int iTemp;

    iTemp = 0;
    J0x07:

    // End:0x54 [Loop If]
    if(iTemp < Skills.Length)
    {
        // End:0x4A
        if(Skills[iTemp].AttachWeaponID == iWeaponID)
        {
            Skills[iTemp].UsedbyWeapon();
        }
        iTemp++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

simulated function AddSupplyItem(byte byType)
{
    local int iTemp;

    iTemp = 0;
    J0x07:

    // End:0x5D [Loop If]
    if(iTemp < Skills.Length)
    {
        // End:0x53
        if(Skills[iTemp].IsA('wSkill_RestoreSupply'))
        {
            wSkill_RestoreSupply(Skills[iTemp]).SetSupplyItem(byType);
            // [Explicit Break]
            goto J0x5D;
        }
        iTemp++;
        // [Loop Continue]
        goto J0x07;
    }
    J0x5D:

    //return;    
}

simulated function UseSupplyItem(byte byType)
{
    local int iTemp;

    iTemp = 0;
    J0x07:

    // End:0x5D [Loop If]
    if(iTemp < Skills.Length)
    {
        // End:0x53
        if(Skills[iTemp].IsA('wSkill_RestoreSupply'))
        {
            wSkill_RestoreSupply(Skills[iTemp]).RemoveSupplyItem(byType);
            // [Explicit Break]
            goto J0x5D;
        }
        iTemp++;
        // [Loop Continue]
        goto J0x07;
    }
    J0x5D:

    //return;    
}
