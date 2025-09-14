class wSkill extends Object;

const defaultCountFontSize = 16;
const maxCountFontSize = 25;

var wSkillBase Base;
var int SkillID;
var int AttachWeaponID;
var int CheckStreakCount;
var bool IsEnable;
var bool bUsed;
var bool bActiveSkill;
var bool bUpdateProcess;
var bool bCoolTimeSkill;
var byte byAddCount;
var bool bUpdateCall;
var float addCountStartTime;
var float changeFontSizeTime;
var localized string TopInfoName;
var int iEnableCount;
var float fApplyValue;

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

simulated function float GetApplyValue()
{
    return fApplyValue;
    //return;    
}

simulated function int GetSkillID()
{
    return SkillID;
    //return;    
}

simulated function DeadPlayer()
{
    SetIsEnable(false);
    SetbUsed(false);
    //return;    
}

simulated function ResetSkill()
{
    //return;    
}

simulated function Initialize(wSkillBase SkillBase, wSkillBaseParam Param)
{
    Base = SkillBase;
    SkillID = Param.iSkillID;
    AttachWeaponID = Param.iAttachWeaponID;
    CheckStreakCount = Param.iCheckStreakCount;
    //return;    
}

simulated function UsedbyWeapon()
{
    SetIsEnable(false);
    SetbUsed(true);
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

function SetbyAddCount(byte byValue)
{
    local PlayerController PC;

    PC = PlayerController(Base.Owner);
    // End:0x6A
    if((PC != none) && PC.GSSS != none)
    {
        PlayerController(Base.Owner).GSSS.SetToStorage_Skill_AddCount(SkillID, byAddCount);
    }
    ChangeAddValue(byValue);
    PC.ChangeSkillAddValue(SkillID, int(byValue));
    //return;    
}

simulated function Client_SetbyAddCount(byte byValue)
{
    ChangeAddValue(byValue);
    //return;    
}

simulated function ChangeAddValue(byte byValue)
{
    local PlayerController PC;

    PC = PlayerController(Base.Owner);
    // End:0x49
    if(int(byValue) > int(byAddCount))
    {
        addCountStartTime = PC.Level.TimeSeconds;
    }
    byAddCount = byValue;
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

simulated function ChangedQuickSlot()
{
    //return;    
}

simulated function GetTopInfo(out string strInfo, out string strCountInfo, out int FontSize)
{
    strInfo = TopInfoName;
    FontSize = GetTopInfoFontSize();
    //return;    
}

simulated function int GetTopInfoFontSize()
{
    local int FontSize;
    local float lerpValue, GapTime;

    GapTime = Base.Owner.Level.TimeSeconds - addCountStartTime;
    // End:0x73
    if(GapTime < changeFontSizeTime)
    {
        lerpValue = Sin(3.1415927 * (GapTime / changeFontSizeTime));
        FontSize = int(Lerp(lerpValue, 16.0000000, 25.0000000));        
    }
    else
    {
        FontSize = 16;
    }
    return FontSize;
    //return;    
}

function AddProcess()
{
    ActiveSkill();
    //return;    
}

function ActiveSkill()
{
    SetIsEnable(true);
    SetbUpdateCall(true);
    Base.Owner.SetActiveSkill(SkillID);
    Base.Owner.ClientEnableSkill(SkillID);
    // End:0xA3
    if((int(Base.Owner.Role) == int(ROLE_Authority)) && AttachWeaponID != 0)
    {
        Base.Owner.Pawn.AddWeaponFromSkill(EmptyBtrDouble(), AttachWeaponID);
    }
    //return;    
}

simulated function Client_AddProcess()
{
    PlayerController(Base.Owner).myHUD.InsertUsingSkillList(SkillID, AttachWeaponID);
    //return;    
}

simulated function float GetMaxCoolTime()
{
    return 0.0000000;
    //return;    
}

simulated function float GetMaxActiveTime()
{
    return 0.0000000;
    //return;    
}

simulated function int SetEnableCount(int iCount)
{
    iEnableCount = iCount;
    //return;    
}

simulated function int GetEnableCount()
{
    return iEnableCount;
    //return;    
}

defaultproperties
{
    SkillID=-1
    AttachWeaponID=-1
    changeFontSizeTime=0.3000000
}