/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wSkill_LifeRepair.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:5
 *	Functions:2
 *
 *******************************************************************************/
class wSkill_LifeRepair extends wSkill;

var float CheckTime;
var float DelayTime;
var float DelayCheckTime;
var float AddHealthRate;
var float AddHealthStorage;

simulated function PostBeginPlay()
{
    CheckTime = Base.Owner.Pawn.Level.PlayTimeSeconds;
}

simulated function UpdateProcess()
{
    local float GapTime;

    // End:0x1fb
    if(Base.Owner.Role == 4)
    {
        // End:0x1cc
        if(!Base.Owner.Level.GetMatchMaker().bChangingHost)
        {
            // End:0x1b6
            if(Base.Owner.Pawn.Health < int(Base.Owner.Pawn.HealthMax * 0.50))
            {
                GapTime = Base.Owner.Pawn.Level.PlayTimeSeconds - CheckTime;
                // End:0x10c
                if(DelayCheckTime > 0.0)
                {
                    DelayCheckTime = FMax(0.0, DelayCheckTime - GapTime);
                    AddHealthStorage = 0.0;
                }
                // End:0x1b3
                else
                {
                    AddHealthStorage += AddHealthRate * GapTime;
                    Base.Owner.Pawn.Health = Min(Base.Owner.Pawn.Health + int(AddHealthStorage), int(Base.Owner.Pawn.HealthMax * 0.50));
                    // End:0x1b3
                    if(AddHealthStorage >= 1.0)
                    {
                        AddHealthStorage -= float(int(AddHealthStorage));
                    }
                }
            }
            // End:0x1cc
            else
            {
                DelayCheckTime = DelayTime;
                AddHealthStorage = 0.0;
            }
        }
        CheckTime = Base.Owner.Pawn.Level.PlayTimeSeconds;
    }
}

defaultproperties
{
    DelayTime=2.50
    AddHealthRate=8.0
}