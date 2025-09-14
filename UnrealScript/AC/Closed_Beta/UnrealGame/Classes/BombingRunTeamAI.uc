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
    if((Bomb.Holder == none) || Bomb.Holder.PlayerReplicationInfo.Team != Team)
    {
        return;
    }
    B = Bot(Bomb.Holder.Controller);
    // End:0x71
    if(B == none)
    {
        return;
    }
    BombingRunSquadAI(B.Squad).TryPassTo(Vector(Bomb.Holder.Rotation), B, Recipient);
    //return;    
}

function SetObjectiveLists()
{
    local GameObjective o;

    // End:0x31
    foreach AllActors(Class'UnrealGame_Decompressed.GameObjective', o)
    {
        // End:0x30
        if(o.bFirstObjective)
        {
            Objectives = o;
            // End:0x31
            break;
        }        
    }    
    o = Objectives;
    J0x3D:

    // End:0xC0 [Loop If]
    if(o != none)
    {
        // End:0x6D
        if(int(o.DefenderTeamIndex) == 255)
        {
            BombBase = o;            
        }
        else
        {
            // End:0x9E
            if(int(o.DefenderTeamIndex) == Team.TeamIndex)
            {
                HomeBase = o;                
            }
            else
            {
                EnemyBase = o;
            }
        }
        o = o.NextObjective;
        // [Loop Continue]
        goto J0x3D;
    }
    //return;    
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
    //return;    
}

defaultproperties
{
    SquadType=Class'UnrealGame_Decompressed.BombingRunSquadAI'
    OrderList[0]="Attack"
    OrderList[3]="Attack"
    OrderList[4]="Freelance"
    OrderList[5]="Defend"
    OrderList[6]="Attack"
    OrderList[7]="Defend"
}