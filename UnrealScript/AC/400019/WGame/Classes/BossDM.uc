class BossDM extends wDeathMatch
    config
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var float BaseDifficulty;

event InitGame(string Options, out string Error)
{
    super(DeathMatch).InitGame(Options, Error);
    BaseDifficulty = GameDifficulty;
    bAdjustSkill = true;
    bForceRespawn = true;
    //return;    
}

function AdjustSkill(AIController B, PlayerController P, bool bWinner)
{
    // End:0x8C
    if(B.PlayerReplicationInfo.Score <= (P.PlayerReplicationInfo.Score + float(1)))
    {
        // End:0x68
        if(bWinner)
        {
            // End:0x63
            if(AdjustedDifficulty > (BaseDifficulty + 1.5000000))
            {
                AdjustedDifficulty -= 0.2000000;
            }
            return;            
        }
        else
        {
            // End:0x89
            if(AdjustedDifficulty < (BaseDifficulty + float(4)))
            {
                AdjustedDifficulty += 0.8000000;
            }
        }        
    }
    else
    {
        // End:0x101
        if(bWinner)
        {
            // End:0xE8
            if(B.PlayerReplicationInfo.Score > (P.PlayerReplicationInfo.Score + float(4)))
            {
                Bot(B).Accuracy *= 0.5000000;
            }
            AdjustedDifficulty = FMax(BaseDifficulty, AdjustedDifficulty - 0.4000000);
        }
    }
    B.Skill = AdjustedDifficulty;
    //return;    
}

defaultproperties
{
    bForceRespawn=true
    bAdjustSkill=true
    GameName="???? ??"
    Acronym=""
}