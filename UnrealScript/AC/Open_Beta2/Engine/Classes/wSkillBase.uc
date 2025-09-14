class wSkillBase extends Object;

var array<wSkill> Skills;
var Controller Owner;
var bool bAddStamina;
var bool bIncExplosion;
var bool bQuickRespawn;
var bool bQuickDemolition;
var bool bBombDetection;
var bool bIncHealthPack;
var bool bActiveNowRespawn;
var bool bActiveRepairNuclear;
var bool bAddManazine;

simulated function PostBeginPlay()
{
    local int iTemp;

    bAddStamina = false;
    bIncExplosion = false;
    bQuickRespawn = false;
    bQuickDemolition = false;
    bBombDetection = false;
    bIncHealthPack = false;
    bAddManazine = false;
    PlayerController(Owner).ServerAddStamina(false);
    PlayerController(Owner).ServerIncExplosion(false);
    PlayerController(Owner).ServerQuickRespawn(false);
    PlayerController(Owner).ServerQuickDemolition(false);
    PlayerController(Owner).ServerBombDetection(false);
    PlayerController(Owner).ServerIncHealthPack(false);
    iTemp = 0;
    J0xBD:

    // End:0x140 [Loop If]
    if(iTemp < Skills.Length)
    {
        // End:0x136
        if((Skills[iTemp] != none) && Skills[iTemp].bUpdateProcess)
        {
            // End:0x136
            if(Skills[iTemp].bActiveSkill)
            {
                Owner.SetActiveSkill(Skills[iTemp].SkillID);
                // [Explicit Break]
                goto J0x140;
            }
        }
        iTemp++;
        // [Loop Continue]
        goto J0xBD;
    }
    J0x140:

    iTemp = 0;
    J0x147:

    // End:0x1A1 [Loop If]
    if(iTemp < Skills.Length)
    {
        // End:0x197
        if((Skills[iTemp] != none) && Skills[iTemp].bUpdateProcess)
        {
            Skills[iTemp].PostBeginPlay();
        }
        iTemp++;
        // [Loop Continue]
        goto J0x147;
    }
    //return;    
}

simulated function ForceResetSkillUpdateCall()
{
    local int iTemp;

    iTemp = 0;
    J0x07:

    // End:0x48 [Loop If]
    if(iTemp < Skills.Length)
    {
        // End:0x3E
        if(Skills[iTemp] != none)
        {
            Skills[iTemp].SetbUpdateCall(false);
        }
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

    // End:0x61 [Loop If]
    if(iTemp < Skills.Length)
    {
        // End:0x57
        if((Skills[iTemp] != none) && Skills[iTemp].bUpdateProcess)
        {
            Skills[iTemp].UpdateProcess();
        }
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

    // End:0x47 [Loop If]
    if(iTemp < Skills.Length)
    {
        // End:0x3D
        if(Skills[iTemp] != none)
        {
            Skills[iTemp].DeadPlayer();
        }
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

    // End:0x78 [Loop If]
    if(iTemp < Skills.Length)
    {
        // End:0x6E
        if(Skills[iTemp] != none)
        {
            Skills[iTemp].SetIsEnable(false);
        }
        iTemp++;
        // [Loop Continue]
        goto J0x37;
    }
    //return;    
}

simulated function AddSkill(int iSkillID, wGameManager GM)
{
    local wSkillBaseParam Param;
    local Class<wSkill> tmSkillClass;
    local wSkill tmSkill;
    local int iTemp;

    Param = GM.GetSkillParam(iSkillID);
    // End:0x34
    if(Param.iSkillID == -1)
    {
        return;
    }
    iTemp = 0;
    J0x3B:

    // End:0x9F [Loop If]
    if(iTemp < Skills.Length)
    {
        // End:0x95
        if((Skills[iTemp] != none) && Skills[iTemp].SkillID == iSkillID)
        {
            Skills[iTemp].bUpdateProcess = true;
            return;
        }
        iTemp++;
        // [Loop Continue]
        goto J0x3B;
    }
    tmSkillClass = Class<wSkill>(DynamicLoadObject(Param.strClassName, Class'Core.Class'));
    tmSkill = new tmSkillClass;
    tmSkill.Initialize(self, Param);
    tmSkill.bUpdateProcess = true;
    tmSkill.bActiveSkill = int(Param.eActiveType) == int(GM.0);
    Skills[Skills.Length] = tmSkill;
    //return;    
}

simulated function RemoveSkill(int iSkillID, wGameManager GM)
{
    local int i;

    i = 0;
    J0x07:

    // End:0xA6 [Loop If]
    if(i < Skills.Length)
    {
        // End:0x9C
        if(Skills[i] != none)
        {
            Skills[i].bUpdateProcess = false;
            // End:0x9C
            if(!Skills[i].bActiveSkill && Skills[i].SkillID == iSkillID)
            {
                Skills[i].RemoveSkill();
                Skills.Remove(i, 1);
                return;
            }
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

simulated function wSkill FindSkill(int iSkillID)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x5C [Loop If]
    if(i < Skills.Length)
    {
        // End:0x52
        if(Skills[i] != none)
        {
            // End:0x52
            if(Skills[i].SkillID == iSkillID)
            {
                return Skills[i];
            }
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return none;
    //return;    
}

simulated function wSkill FindSkillByClassName(name SkillClassName)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x58 [Loop If]
    if(i < Skills.Length)
    {
        // End:0x4E
        if(Skills[i] != none)
        {
            // End:0x4E
            if(Skills[i].IsA(SkillClassName))
            {
                return Skills[i];
            }
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return none;
    //return;    
}

simulated function bool IsDuplicationSkill(int iSkillID)
{
    local wSkill Skill;

    Skill = FindSkill(iSkillID);
    // End:0x1E
    if(Skill != none)
    {
        return true;
    }
    return false;
    //return;    
}

simulated function UsedbyWeapon(int iWeaponID)
{
    local int iTemp;

    iTemp = 0;
    J0x07:

    // End:0x67 [Loop If]
    if(iTemp < Skills.Length)
    {
        // End:0x5D
        if((Skills[iTemp] != none) && Skills[iTemp].AttachWeaponID == iWeaponID)
        {
            Skills[iTemp].UsedbyWeapon();
        }
        iTemp++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

simulated function AddSupplyItem(Object.ESUPPLY_ITEM_TYPE eSupplyItemType)
{
    local int iTemp;

    iTemp = 0;
    J0x07:

    // End:0x70 [Loop If]
    if(iTemp < Skills.Length)
    {
        // End:0x66
        if((Skills[iTemp] != none) && Skills[iTemp].IsA('wSkill_RestoreSupply'))
        {
            wSkill_RestoreSupply(Skills[iTemp]).SetSupplyItem(eSupplyItemType);
            // [Explicit Break]
            goto J0x70;
        }
        iTemp++;
        // [Loop Continue]
        goto J0x07;
    }
    J0x70:

    //return;    
}

simulated function UseSupplyItem(Object.ESUPPLY_ITEM_TYPE eSupplyItemType)
{
    local int iTemp;

    iTemp = 0;
    J0x07:

    // End:0x70 [Loop If]
    if(iTemp < Skills.Length)
    {
        // End:0x66
        if((Skills[iTemp] != none) && Skills[iTemp].IsA('wSkill_RestoreSupply'))
        {
            wSkill_RestoreSupply(Skills[iTemp]).RemoveSupplyItem(eSupplyItemType);
            // [Explicit Break]
            goto J0x70;
        }
        iTemp++;
        // [Loop Continue]
        goto J0x07;
    }
    J0x70:

    //return;    
}

simulated function RemoveSupplyItem(Object.ESUPPLY_ITEM_TYPE eSupplyItemType)
{
    UseSupplyItem(eSupplyItemType);
    //return;    
}

simulated function bool GetUsed(int SkillID)
{
    local int iTemp;
    local bool bSkillUsed;

    bSkillUsed = false;
    iTemp = 0;
    J0x0F:

    // End:0x79 [Loop If]
    if(iTemp < Skills.Length)
    {
        // End:0x6F
        if((Skills[iTemp] != none) && Skills[iTemp].SkillID == SkillID)
        {
            bSkillUsed = Skills[iTemp].bUsed;
            // [Explicit Break]
            goto J0x79;
        }
        iTemp++;
        // [Loop Continue]
        goto J0x0F;
    }
    J0x79:

    return bSkillUsed;
    //return;    
}

simulated function ChangedQuickSlot()
{
    local int iTemp;

    iTemp = 0;
    J0x07:

    // End:0x61 [Loop If]
    if(iTemp < Skills.Length)
    {
        // End:0x57
        if((Skills[iTemp] != none) && Skills[iTemp].bUpdateProcess)
        {
            Skills[iTemp].ChangedQuickSlot();
        }
        iTemp++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

simulated function GetTopInfo(int SkillID, out string strInfo, out string strCountInfo, out int FontSize)
{
    local int iTemp;

    iTemp = 0;
    J0x07:

    // End:0x93 [Loop If]
    if(iTemp < Skills.Length)
    {
        // End:0x89
        if(((Skills[iTemp] != none) && Skills[iTemp].bUpdateProcess) && Skills[iTemp].SkillID == SkillID)
        {
            Skills[iTemp].GetTopInfo(strInfo, strCountInfo, FontSize);
            // [Explicit Break]
            goto J0x93;
        }
        iTemp++;
        // [Loop Continue]
        goto J0x07;
    }
    J0x93:

    //return;    
}

simulated function SetActiveSkill(int SkillID)
{
    local int iTemp;

    iTemp = 0;
    J0x07:

    // End:0x84 [Loop If]
    if(iTemp < Skills.Length)
    {
        // End:0x7A
        if(((Skills[iTemp] != none) && Skills[iTemp].bUpdateProcess) && Skills[iTemp].SkillID == SkillID)
        {
            Skills[iTemp].Client_AddProcess();
            // [Explicit Break]
            goto J0x84;
        }
        iTemp++;
        // [Loop Continue]
        goto J0x07;
    }
    J0x84:

    //return;    
}

simulated function Client_ChangeAddValue(int SkillID, int addValue)
{
    local int iTemp;

    iTemp = 0;
    J0x07:

    // End:0x88 [Loop If]
    if(iTemp < Skills.Length)
    {
        // End:0x7E
        if(((Skills[iTemp] != none) && Skills[iTemp].bUpdateProcess) && Skills[iTemp].SkillID == SkillID)
        {
            Skills[iTemp].Client_SetbyAddCount(byte(addValue));
        }
        iTemp++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

simulated function ClientEnableSkill(int SkillID)
{
    local int iTemp;

    iTemp = 0;
    J0x07:

    // End:0x81 [Loop If]
    if(iTemp < Skills.Length)
    {
        // End:0x77
        if((Skills[iTemp] != none) && Skills[iTemp].SkillID == SkillID)
        {
            Skills[iTemp].SetIsEnable(true);
            Skills[iTemp].SetbUpdateCall(true);
            // [Explicit Break]
            goto J0x81;
        }
        iTemp++;
        // [Loop Continue]
        goto J0x07;
    }
    J0x81:

    //return;    
}

function wSkill GetEnableSkill()
{
    local wSkill enableSkill;
    local int iTemp;

    iTemp = 0;
    J0x07:

    // End:0x7A [Loop If]
    if(iTemp < Skills.Length)
    {
        // End:0x70
        if(((Skills[iTemp] != none) && Skills[iTemp].bUpdateProcess) && Skills[iTemp].IsEnable)
        {
            enableSkill = Skills[iTemp];
            // [Explicit Break]
            goto J0x7A;
        }
        iTemp++;
        // [Loop Continue]
        goto J0x07;
    }
    J0x7A:

    return enableSkill;
    //return;    
}
