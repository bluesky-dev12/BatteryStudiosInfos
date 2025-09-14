/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wSkill.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:7
 *	Functions:10
 *
 *******************************************************************************/
class wSkill extends Object
    dependson(wSkillBaseParam);

var wSkillBase Base;
var int SkillID;
var int AttachWeaponID;
var bool IsEnable;
var bool bUsed;
var byte byAddCount;
var bool bUpdateCall;

simulated function PostBeginPlay();
simulated function UpdateProcess();
simulated function RemoveSkill();
simulated function DeadPlayer()
{
    SetIsEnable(false);
}

simulated function Initialize(wSkillBase SkillBase, wSkillBaseParam Param)
{
    Base = SkillBase;
    SkillID = Param.iSkillID;
    AttachWeaponID = Param.iAttachWeaponID;
}

simulated function UsedbyWeapon();
simulated function SetIsEnable(bool bValue)
{
    local PlayerController PC;

    IsEnable = bValue;
    PC = PlayerController(Base.Owner);
    // End:0x6a
    if(PC != none && PC.GSSS != none)
    {
        PC.GSSS.SetToStorage_Skill_IsEnable(SkillID, IsEnable);
    }
}

simulated function SetbUsed(bool bValue)
{
    local PlayerController PC;

    bUsed = bValue;
    PC = PlayerController(Base.Owner);
    // End:0x6a
    if(PC != none && PC.GSSS != none)
    {
        PC.GSSS.SetToStorage_Skill_Used(SkillID, bUsed);
    }
}

simulated function SetbyAddCount(byte byValue)
{
    local PlayerController PC;

    byAddCount = byValue;
    PC = PlayerController(Base.Owner);
    // End:0x75
    if(PC != none && PC.GSSS != none)
    {
        PlayerController(Base.Owner).GSSS.SetToStorage_Skill_AddCount(SkillID, byAddCount);
    }
}

simulated function SetbUpdateCall(bool bValue)
{
    local PlayerController PC;

    bUpdateCall = bValue;
    PC = PlayerController(Base.Owner);
    Log("[wSkill::SetbUpdateCall] Skill=" $ string(SkillID) $ " bValue=" $ string(bValue));
    // End:0xe3
    if(PC != none && PC.GSSS != none)
    {
        PlayerController(Base.Owner).GSSS.SetToStorage_Skill_UpdateCall(SkillID, bUpdateCall);
        Log("[wSkill::SetbUpdateCall] SetToStorage");
    }
}

defaultproperties
{
    SkillID=-1
    AttachWeaponID=-1
}