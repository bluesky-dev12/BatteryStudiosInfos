/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\CTFTeamAI.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:1
 *
 *******************************************************************************/
class CTFTeamAI extends TeamAI
    dependson(CTFSquadAI)
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var CTFFlag FriendlyFlag;
var CTFFlag EnemyFlag;
var float LastGotFlag;

function SquadAI AddSquadWithLeader(Controller C, GameObjective o)
{
    local CTFSquadAI S;

    // End:0x1f
    if(o == none)
    {
        o = EnemyFlag.HomeBase;
    }
    S = CTFSquadAI(super.AddSquadWithLeader(C, o));
    // End:0x6d
    if(S != none)
    {
        S.FriendlyFlag = FriendlyFlag;
        S.EnemyFlag = EnemyFlag;
    }
    return S;
}

defaultproperties
{
    SquadType=class'CTFSquadAI'
    OrderList[0]=Attack
    OrderList[1]=Defend
    OrderList[2]=Attack
    OrderList[3]=Attack
    OrderList[4]=Attack
    OrderList[5]=Defend
    OrderList[6]=Freelance
    OrderList[7]=Attack
}