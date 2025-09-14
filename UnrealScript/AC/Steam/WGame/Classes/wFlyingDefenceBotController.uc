/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wFlyingDefenceBotController.uc
 * Package Imports:
 *	WGame
 *	Gameplay
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:4
 *	States:1
 *
 *******************************************************************************/
class wFlyingDefenceBotController extends wHelicopterController;

var wNPCParam NPCParam;
var delegate<OnDisappear> __OnDisappear__Delegate;

delegate OnDisappear(wFlyingDefenceBotController FlyingAlien);
function InitBot(int Grade)
{
    local wAILevel AILevel;

    AILevel = wAILevel(Level.GetAILevel());
    NPCParam = AILevel.GetNPCParam(Grade);
    Pawn.Health = NPCParam.HP;
    Pawn.HealthMax = float(NPCParam.HP);
    Pawn.DealDamageRatio_Default = NPCParam.DamageRate;
    Pawn.DealDamageRatio_Explosive = NPCParam.ExplosionDmageRate;
    Pawn.DealDamageRatio_Melee = NPCParam.MeleeDamageRate;
    // End:0x118
    if(Pawn.TeamIndex == 0)
    {
        wFlyingDefenceBot(Pawn).MeshItemID = AILevel.GetItemParamByGroupID(NPCParam.SpCharGroupID_AF).ItemID;
    }
    // End:0x152
    else
    {
        wFlyingDefenceBot(Pawn).MeshItemID = AILevel.GetItemParamByGroupID(NPCParam.SpCharGroupID_RSA).ItemID;
    }
    RotationRate.Yaw = int(NPCParam.RotationgSpeed);
}

function Possess(Pawn aPawn)
{
    super.Possess(aPawn);
    aPawn.AirSpeed = float(NPCParam.DefaultRunSpeed);
}

simulated function int GetTeamNum()
{
    return Pawn.TeamIndex;
}

state BirdFollowingPath
{

Begin:
    CurrentPathNode = GetNextFlyingPathNode();
    ProgressFlyingPathNode();
    MoveTo(CurrentPathNode.Location,,, GetFocalPoint(CurrentPathNode.Location));
    // End:0x59
    if(GetNextFlyingPathNode() == none)
    {
        OnDisappear(self);
        Disappear();
    }
    // End:0x6c
    else
    {
        Destination = GetMomentousRandomDest();
        GotoState('BirdFollowingPath');
    }
    stop;    
}
