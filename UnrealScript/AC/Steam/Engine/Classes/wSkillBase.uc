/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wSkillBase.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:8
 *	Functions:10
 *
 *******************************************************************************/
class wSkillBase extends Object
    dependson(wSkill)
    dependson(wSkill_RestoreSupply)
    dependson(wSkillBaseParam);

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
    J0xb5:
    // End:0xf5 [While If]
    if(iTemp < Skills.Length)
    {
        // End:0xeb
        if(Skills[iTemp] != none)
        {
            Skills[iTemp].PostBeginPlay();
        }
        ++ iTemp;
        // This is an implied JumpToken; Continue!
        goto J0xb5;
    }
}

simulated function ForceResetSkillUpdateCall()
{
    local int iTemp;

    iTemp = 0;
    J0x07:
    // End:0x48 [While If]
    if(iTemp < Skills.Length)
    {
        // End:0x3e
        if(Skills[iTemp] != none)
        {
            Skills[iTemp].SetbUpdateCall(false);
        }
        ++ iTemp;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

simulated function UpdateProcess()
{
    local int iTemp;

    iTemp = 0;
    J0x07:
    // End:0x47 [While If]
    if(iTemp < Skills.Length)
    {
        // End:0x3d
        if(Skills[iTemp] != none)
        {
            Skills[iTemp].UpdateProcess();
        }
        ++ iTemp;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

simulated function DeadPlayer()
{
    local int iTemp;

    iTemp = 0;
    J0x07:
    // End:0x47 [While If]
    if(iTemp < Skills.Length)
    {
        // End:0x3d
        if(Skills[iTemp] != none)
        {
            Skills[iTemp].DeadPlayer();
        }
        ++ iTemp;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
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
    // End:0x78 [While If]
    if(iTemp < Skills.Length)
    {
        // End:0x6e
        if(Skills[iTemp] != none)
        {
            Skills[iTemp].SetIsEnable(false);
        }
        ++ iTemp;
        // This is an implied JumpToken; Continue!
        goto J0x37;
    }
}

simulated function AddSkill(int iSkillID, wGameManager gm)
{
    local wSkillBaseParam Param;
    local class<wSkill> tmSkillClass;
    local wSkill tmSkill;
    local int iTemp;

    Param = gm.GetSkillParam(iSkillID);
    // End:0x34
    if(Param.iSkillID == -1)
    {
        return;
    }
    iTemp = 0;
    J0x3b:
    // End:0x88 [While If]
    if(iTemp < Skills.Length)
    {
        // End:0x7e
        if(Skills[iTemp] != none && Skills[iTemp].SkillID == iSkillID)
        {
            return;
        }
        ++ iTemp;
        // This is an implied JumpToken; Continue!
        goto J0x3b;
    }
    tmSkillClass = class<wSkill>(DynamicLoadObject(Param.strClassName, class'Class'));
    tmSkill = new tmSkillClass;
    tmSkill.Initialize(self, Param);
    Skills[Skills.Length] = tmSkill;
}

simulated function RemoveSkill(int iSkillID, wGameManager gm)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x75 [While If]
    if(i < Skills.Length)
    {
        // End:0x6b
        if(Skills[i] != none && Skills[i].SkillID == iSkillID)
        {
            Skills[i].RemoveSkill();
            Skills.Remove(i, 1);
            return;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

simulated function UsedbyWeapon(int iWeaponID)
{
    local int iTemp;

    iTemp = 0;
    J0x07:
    // End:0x67 [While If]
    if(iTemp < Skills.Length)
    {
        // End:0x5d
        if(Skills[iTemp] != none && Skills[iTemp].AttachWeaponID == iWeaponID)
        {
            Skills[iTemp].UsedbyWeapon();
        }
        ++ iTemp;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

simulated function AddSupplyItem(byte byType)
{
    local int iTemp;

    iTemp = 0;
    J0x07:
    // End:0x70 [While If]
    if(iTemp < Skills.Length)
    {
        // End:0x66
        if(Skills[iTemp] != none && Skills[iTemp].IsA('wSkill_RestoreSupply'))
        {
            wSkill_RestoreSupply(Skills[iTemp]).SetSupplyItem(byType);
        }
        // End:0x70
        else
        {
            ++ iTemp;
            // This is an implied JumpToken; Continue!
            goto J0x07;
        }
    }
}

simulated function UseSupplyItem(byte byType)
{
    local int iTemp;

    iTemp = 0;
    J0x07:
    // End:0x70 [While If]
    if(iTemp < Skills.Length)
    {
        // End:0x66
        if(Skills[iTemp] != none && Skills[iTemp].IsA('wSkill_RestoreSupply'))
        {
            wSkill_RestoreSupply(Skills[iTemp]).RemoveSupplyItem(byType);
        }
        // End:0x70
        else
        {
            ++ iTemp;
            // This is an implied JumpToken; Continue!
            goto J0x07;
        }
    }
}
