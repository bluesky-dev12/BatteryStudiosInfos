class wSkill_LifeRepair extends wSkill;

var float CheckTime;
var float DelayTime;
var float DelayCheckTime;
var float AddHealthRate;
var float AddHealthStorage;

simulated function PostBeginPlay()
{
    CheckTime = Base.Owner.Pawn.Level.PlayTimeSeconds;
    //return;    
}

simulated function UpdateProcess()
{
    local float GapTime;

    // End:0x1FB
    if(int(Base.Owner.Role) == int(ROLE_Authority))
    {
        // End:0x1CC
        if(!Base.Owner.Level.GetMatchMaker().bChangingHost)
        {
            // End:0x1B6
            if(Base.Owner.Pawn.Health < int(Base.Owner.Pawn.HealthMax * 0.5000000))
            {
                GapTime = Base.Owner.Pawn.Level.PlayTimeSeconds - CheckTime;
                // End:0x10C
                if(DelayCheckTime > 0.0000000)
                {
                    DelayCheckTime = FMax(0.0000000, DelayCheckTime - GapTime);
                    AddHealthStorage = 0.0000000;                    
                }
                else
                {
                    AddHealthStorage += (AddHealthRate * GapTime);
                    Base.Owner.Pawn.Health = Min(Base.Owner.Pawn.Health + int(AddHealthStorage), int(Base.Owner.Pawn.HealthMax * 0.5000000));
                    // End:0x1B3
                    if(AddHealthStorage >= 1.0000000)
                    {
                        AddHealthStorage -= float(int(AddHealthStorage));
                    }
                }                
            }
            else
            {
                DelayCheckTime = DelayTime;
                AddHealthStorage = 0.0000000;
            }
        }
        CheckTime = Base.Owner.Pawn.Level.PlayTimeSeconds;
    }
    //return;    
}

defaultproperties
{
    DelayTime=2.5000000
    AddHealthRate=8.0000000
}