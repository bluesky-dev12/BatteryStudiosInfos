class wSkill_CoolTime extends wSkill;

var float fCurActiveTime;
var float fMaxActiveTime;
var float fLastTime;
var float fCurCoolTime;
var float fMaxCoolTime;
var bool bUseSkill;
var bool bRedaySkill;

simulated function Initialize(wSkillBase SkillBase, wSkillBaseParam Param)
{
    super.Initialize(SkillBase, Param);
    ResetSkill();
    //return;    
}

simulated function PostBeginPlay()
{
    super.PostBeginPlay();
    ActiveSkill();
    //return;    
}

simulated function float GetMaxCoolTime()
{
    return fMaxCoolTime;
    //return;    
}

simulated function float GetMaxActiveTime()
{
    return fMaxActiveTime;
    //return;    
}

simulated function UpdateProcess()
{
    local float fGapTime;

    // End:0x167
    if(int(Base.Owner.Role) == int(ROLE_Authority))
    {
        // End:0x167
        if(!Base.Owner.Level.GetMatchMaker().bChangingHost)
        {
            fGapTime = Base.Owner.Pawn.Level.PlayTimeSeconds - fLastTime;
            // End:0xF9
            if(bUseSkill == false)
            {
                fCurCoolTime += fGapTime;
                // End:0xF6
                if(fCurCoolTime >= fMaxCoolTime)
                {
                    // End:0xC9
                    if(bRedaySkill == false)
                    {
                        bRedaySkill = true;
                        ReadySkill();
                    }
                    // End:0xF6
                    if((CheckSkill()) == true)
                    {
                        fCurActiveTime = 0.0000000;
                        bRedaySkill = false;
                        bUseSkill = true;
                        UseSkill();
                    }
                }                
            }
            else
            {
                fCurActiveTime += fGapTime;
                // End:0x138
                if(fCurActiveTime > fMaxActiveTime)
                {
                    fCurCoolTime = 0.0000000;
                    fCurActiveTime = fMaxActiveTime;
                    bUseSkill = false;
                    UnuseSkill();
                }
            }
            fLastTime = Base.Owner.Pawn.Level.PlayTimeSeconds;
        }
    }
    //return;    
}

simulated function ReadySkill()
{
    Base.Owner.ClientReadyCoolTimeSkill(SkillID);
    //return;    
}

simulated function bool CheckSkill()
{
    //return;    
}

simulated function UseSkill()
{
    Base.Owner.CallCoolTimeSkill(SkillID);
    Base.Owner.ClientCallCoolTimeSkill(SkillID);
    //return;    
}

simulated function UnuseSkill()
{
    Base.Owner.ClientCallCoolTimeSkill(SkillID);
    //return;    
}

simulated function ResetSkill()
{
    fCurActiveTime = fMaxActiveTime;
    fCurCoolTime = 0.0000000;
    bUseSkill = false;
    bRedaySkill = false;
    fLastTime = Base.Owner.Pawn.Level.PlayTimeSeconds;
    //return;    
}

simulated function DeadPlayer()
{
    super.DeadPlayer();
    ResetSkill();
    //return;    
}
