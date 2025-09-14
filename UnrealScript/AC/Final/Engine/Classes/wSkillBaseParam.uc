class wSkillBaseParam extends Object
    native;

var int iSkillID;
var string strName;
var string strClassName;
var int iRequirementSkillid;
var int iCheckStreakCount;
var int iAttachWeaponID;
var wGameManager.ESkillType ESkillType;
var wGameManager.ESkillActiveType eActiveType;
var int iUseKey;
var string strDescription;

defaultproperties
{
    iSkillID=-1
    strName="-"
    iRequirementSkillid=-1
    iAttachWeaponID=-1
    ESkillType=6
    eActiveType=2
    iUseKey=99
    strDescription="-"
}