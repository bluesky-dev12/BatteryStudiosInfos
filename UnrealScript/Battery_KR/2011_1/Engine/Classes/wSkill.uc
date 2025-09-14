class wSkill extends Object;

var wSkillBase Base;
var int SkillID;
var int AttachWeaponID;
var bool IsEnable;
var bool bUsed;
var byte byAddCount;
var bool bUpdateCall;

simulated function PostBeginPlay()
{
    //return;    
}

simulated function UpdateProcess()
{
    //return;    
}

simulated function RemoveSkill()
{
    //return;    
}

simulated function DeadPlayer()
{
    SetIsEnable(false);
    //return;    
}

simulated function Initialize(wSkillBase SkillBase, wSkillBaseParam Param)
{
    Base = SkillBase;
    SkillID = Param.iSkillID;
    AttachWeaponID = Param.iAttachWeaponID;
    //return;    
}

simulated function UsedbyWeapon()
{
    //return;    
}

simulated function SetIsEnable(bool bValue)
{
    local PlayerController PC;

    IsEnable = bValue;
    PC = PlayerController(Base.Owner);
    // End:0x6A
    if((PC != none) && PC.GSSS != none)
    {
        PC.GSSS.SetToStorage_Skill_IsEnable(SkillID, IsEnable);
    }
    //return;    
}

simulated function SetbUsed(bool bValue)
{
    local PlayerController PC;

    bUsed = bValue;
    PC = PlayerController(Base.Owner);
    // End:0x6A
    if((PC != none) && PC.GSSS != none)
    {
        PC.GSSS.SetToStorage_Skill_Used(SkillID, bUsed);
    }
    //return;    
}

simulated function SetbyAddCount(byte byValue)
{
    local PlayerController PC;

    byAddCount = byValue;
    PC = PlayerController(Base.Owner);
    // End:0x75
    if((PC != none) && PC.GSSS != none)
    {
        PlayerController(Base.Owner).GSSS.SetToStorage_Skill_AddCount(SkillID, byAddCount);
    }
    //return;    
}

simulated function SetbUpdateCall(bool bValue)
{
    local PlayerController PC;

    bUpdateCall = bValue;
    PC = PlayerController(Base.Owner);
    Log((("[wSkill::SetbUpdateCall] Skill=" $ string(SkillID)) $ " bValue=") $ string(bValue));
    // End:0xE3
    if((PC != none) && PC.GSSS != none)
    {
        PlayerController(Base.Owner).GSSS.SetToStorage_Skill_UpdateCall(SkillID, bUpdateCall);
        Log("[wSkill::SetbUpdateCall] SetToStorage");
    }
    //return;    
}

defaultproperties
{
    SkillID=-1
    AttachWeaponID=-1
}