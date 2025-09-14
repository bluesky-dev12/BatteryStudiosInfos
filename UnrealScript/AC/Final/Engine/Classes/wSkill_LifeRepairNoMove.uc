class wSkill_LifeRepairNoMove extends wSkill;

var float fAddHealthValue;
var float fLastTime;
var float fCurNoMoveTime;
var float fMaxNoMoveTime;
var float fCurRepairTime;
var float fMaxRepairTime;

simulated function Initialize(wSkillBase SkillBase, wSkillBaseParam Param)
{
    super.Initialize(SkillBase, Param);
    fLastTime = Base.Owner.Pawn.Level.PlayTimeSeconds;
    //return;    
}

simulated function UpdateProcess()
{
    local float fGapTime;

    // End:0x32C
    if(int(Base.Owner.Role) == int(ROLE_Authority))
    {
        // End:0x2FD
        if(!Base.Owner.Level.GetMatchMaker().bChangingHost)
        {
            // End:0x2E7
            if(((Base.Owner.Pawn.Health < int(Base.Owner.Pawn.HealthMax)) && Base.Owner.Pawn.Acceleration == vect(0.0000000, 0.0000000, 0.0000000)) && (Base.Owner.Level.TimeSeconds - Base.Owner.Pawn.LastDamageReceiveTime) >= 1.0000000)
            {
                fGapTime = Base.Owner.Pawn.Level.PlayTimeSeconds - fLastTime;
                fCurNoMoveTime += fGapTime;
                // End:0x175
                if((fCurNoMoveTime - fMaxNoMoveTime) < 0.0001000)
                {
                    return;
                }
                fCurRepairTime += fGapTime;
                // End:0x2E4
                if((fCurRepairTime - fMaxRepairTime) >= 0.0001000)
                {
                    Base.Owner.Pawn.GiveHealth(int(fAddHealthValue), int(Base.Owner.Pawn.HealthMax));
                    Log((((("[wSkill_NoMoveLifeRepair::UpdateProcess] Add Health : " $ string(Base.Owner.Pawn.Health)) $ " CurNoMoveTime : ") $ string(fCurNoMoveTime)) $ " CurRepairTime : ") $ string(fCurRepairTime));
                    fCurRepairTime = 0.0000000;
                    PlayerController(Base.Owner).FmodClientPlaySound("Warfare_Sound_Alien_Mode/Character/char_alien_breath_healing_01");
                }                
            }
            else
            {
                fCurNoMoveTime = 0.0000000;
                fCurRepairTime = 0.0000000;
            }
        }
        fLastTime = Base.Owner.Pawn.Level.PlayTimeSeconds;
    }
    //return;    
}

defaultproperties
{
    fAddHealthValue=500.0000000
    fMaxNoMoveTime=5.0000000
    fMaxRepairTime=3.0000000
}