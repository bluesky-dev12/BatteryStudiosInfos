/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\BombingRunTeamAI.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:5
 *	Functions:3
 *
 *******************************************************************************/
class BombingRunTeamAI extends TeamAI
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var GameObject Bomb;
var float LastGotFlag;
var GameObjective HomeBase;
var GameObjective EnemyBase;
var GameObjective BombBase;

function CallForBall(Pawn Recipient)
{
    local Bot B;

    // End:0x42
    if(Bomb.Holder == none || Bomb.Holder.PlayerReplicationInfo.Team != Team)
    {
        return;
    }
    B = Bot(Bomb.Holder.Controller);
    // End:0x71
    if(B == none)
    {
        return;
    }
    BombingRunSquadAI(B.Squad).TryPassTo(vector(Bomb.Holder.Rotation), B, Recipient);
}

function SetObjectiveLists()
{
    local GameObjective o;

    // End:0x31
    foreach AllActors(class'GameObjective', o)
    {
        // End:0x30
        if(o.bFirstObjective)
        {
            Objectives = o;
        }
        // End:0x31
        else
        {
            continue;
        }        
    }
    o = Objectives;
    J0x3d:
    // End:0xc0 [While If]
    if(o != none)
    {
        // End:0x6d
        if(o.DefenderTeamIndex == 255)
        {
            BombBase = o;
        }
        // End:0xa9
        else
        {
            // End:0x9e
            if(o.DefenderTeamIndex == Team.TeamIndex)
            {
                HomeBase = o;
            }
            // End:0xa9
            else
            {
                EnemyBase = o;
            }
        }
        o = o.NextObjective;
        // This is an implied JumpToken; Continue!
        goto J0x3d;
    }
}

function SquadAI AddSquadWithLeader(Controller C, GameObjective o)
{
    local BombingRunSquadAI S;

    // End:0x16
    if(o == none)
    {
        o = EnemyBase;
    }
    S = BombingRunSquadAI(super.AddSquadWithLeader(C, o));
    S.Bomb = Bomb;
    S.HomeBase = HomeBase;
    S.EnemyBase = EnemyBase;
    S.BombBase = BombBase;
    return S;
}

defaultproperties
{
    SquadType=class'BombingRunSquadAI'
    OrderList[0]=Attack
    OrderList[3]=Attack
    OrderList[4]=Freelance
    OrderList[5]=Defend
    OrderList[6]=Attack
    OrderList[7]=Defend
}