class wAlienGameReplicationInfo extends wMSGameReplicationInfo
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var int iCurTimeOfAppearence;
var bool bAlienAppeared;
var int iPlayingNum;
var byte CurAlienAttackBuffLevel;
var byte MaxAlienAttackBuffLevel;
var int iPrevAlienAttackIndex;
var byte AlienTeamCount;
var byte HumanTeamCount;
var float fMaxRespawnTime;
var bool bSuperAlienAppeared;
var float fAlienKnockBackDelta;
var float fAlienSpeedDelta;

replication
{
    // Pos:0x000
    reliable if(bNetDirty && int(Role) == int(ROLE_Authority))
        AlienTeamCount, CurAlienAttackBuffLevel, 
        HumanTeamCount, bAlienAppeared, 
        fAlienKnockBackDelta, fAlienSpeedDelta, 
        iCurTimeOfAppearence, iPlayingNum;
}

simulated function int GetStartPlayerCountOfCurRound()
{
    return iPlayingNum;
    //return;    
}

simulated function int GetCurAlienModeWaitingTimeCount()
{
    return iCurTimeOfAppearence;
    //return;    
}

simulated function int GetMaxRound()
{
    return ScoreLimit;
    //return;    
}

simulated function byte GetCurTeamMemberCount(int TeamIndex)
{
    switch(TeamIndex)
    {
        // End:0x11
        case 0:
            return HumanTeamCount;
        // End:0xFFFF
        default:
            return AlienTeamCount;
            break;
    }
    //return;    
}

simulated function int GetAttackLevelIndex()
{
    local int lp1;

    // End:0x19
    if(9 <= int(CurAlienAttackBuffLevel))
    {
        lp1 = 2;        
    }
    else
    {
        // End:0x31
        if(6 <= int(CurAlienAttackBuffLevel))
        {
            lp1 = 1;            
        }
        else
        {
            // End:0x49
            if(3 <= int(CurAlienAttackBuffLevel))
            {
                lp1 = 0;                
            }
            else
            {
                lp1 = -1;
            }
        }
    }
    return lp1;
    //return;    
}

function bool IsCanRespawnTime()
{
    local float fElapsedTime;

    fElapsedTime = float(RoundStartTime - RemainingTime);
    // End:0x46
    if(fElapsedTime < (float(Level.GameMgr.AlienGameParam.20) + fMaxRespawnTime))
    {
        return true;
    }
    return false;
    //return;    
}

function Reset()
{
    super(GameReplicationInfo).Reset();
    iPrevAlienAttackIndex = -1;
    iCurTimeOfAppearence = Level.GameMgr.AlienGameParam.20;
    bSuperAlienAppeared = false;
    fAlienKnockBackDelta = 1.0000000;
    fAlienSpeedDelta = 1.0000000;
    //return;    
}

defaultproperties
{
    MaxAlienAttackBuffLevel=10
    fAlienKnockBackDelta=1.0000000
    fAlienSpeedDelta=1.0000000
}