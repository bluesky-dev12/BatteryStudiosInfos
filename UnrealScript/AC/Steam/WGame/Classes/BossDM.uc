/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\BossDM.uc
 * Package Imports:
 *	WGame
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:2
 *
 *******************************************************************************/
class BossDM extends wDeathMatch
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    config();

var float BaseDifficulty;

event InitGame(string Options, out string Error)
{
    super(DeathMatch).InitGame(Options, Error);
    BaseDifficulty = GameDifficulty;
    bAdjustSkill = true;
    bForceRespawn = true;
}

function AdjustSkill(AIController B, PlayerController P, bool bWinner)
{
    // End:0x8c
    if(B.PlayerReplicationInfo.Score <= P.PlayerReplicationInfo.Score + float(1))
    {
        // End:0x68
        if(bWinner)
        {
            // End:0x63
            if(AdjustedDifficulty > BaseDifficulty + 1.50)
            {
                AdjustedDifficulty -= 0.20;
            }
            return;
        }
        // End:0x89
        else
        {
            // End:0x89
            if(AdjustedDifficulty < BaseDifficulty + float(4))
            {
                AdjustedDifficulty += 0.80;
            }
        }
    }
    // End:0x101
    else
    {
        // End:0x101
        if(bWinner)
        {
            // End:0xe8
            if(B.PlayerReplicationInfo.Score > P.PlayerReplicationInfo.Score + float(4))
            {
                Bot(B).Accuracy *= 0.50;
            }
            AdjustedDifficulty = FMax(BaseDifficulty, AdjustedDifficulty - 0.40);
        }
    }
    B.Skill = AdjustedDifficulty;
}

defaultproperties
{
    bForceRespawn=true
    bAdjustSkill=true
    GameName="???? ??"
    Acronym=""
}