class wFlyingDefenceBotController extends wHelicopterController;

var bool bFlyingAttack;
var int iNpcID;
//var delegate<OnDisappear> __OnDisappear__Delegate;

delegate OnDisappear(wFlyingDefenceBotController FlyingAlien)
{
    //return;    
}

function Controller GetCaller()
{
    return self;
    //return;    
}

function Disappear()
{
    GotoState('Dying');
    Pawn.bHidden = true;
    //return;    
}

function InitBot(int Grade)
{
    local wAILevel AILevel;
    local int lp1;

    AILevel = wAILevel(Level.GetAILevel());
    NPCParam = AILevel.GetNPCParam(Grade);
    Pawn.Health = int(float(NPCParam.HP) * Level.Game.GetAddHealthRatio());
    Pawn.HealthMax = float(Pawn.Health);
    Pawn.DealDamageRatio_Default = NPCParam.DamageRate;
    Pawn.DealDamageRatio_Explosive = NPCParam.ExplosionDmageRate;
    Pawn.DealDamageRatio_Melee = NPCParam.MeleeDamageRate;
    lp1 = 0;
    J0xEC:

    // End:0x189 [Loop If]
    if(lp1 < Level.GameMgr.NPCNameGroupParams.Length)
    {
        // End:0x17F
        if(Level.GameMgr.NPCNameGroupParams[lp1].GroupID == NPCParam.NameGroupID)
        {
            Pawn.OwnerName = Level.GameMgr.NPCNameGroupParams[lp1].NickName;
            // [Explicit Break]
            goto J0x189;
        }
        lp1++;
        // [Loop Continue]
        goto J0xEC;
    }
    J0x189:

    // End:0x1DA
    if(Pawn.TeamIndex == 0)
    {
        wFlyingDefenceBot(Pawn).MeshItemID = AILevel.GetItemParamByGroupID(NPCParam.SpCharGroupID_AF).ItemID;        
    }
    else
    {
        wFlyingDefenceBot(Pawn).MeshItemID = AILevel.GetItemParamByGroupID(NPCParam.SpCharGroupID_RSA).ItemID;
    }
    RotationRate.Yaw = int(NPCParam.RotationgSpeed);
    self.iNpcID = NPCParam.NPCID;
    wFlyingDefenceBot(Pawn).iNpcID = NPCParam.NPCID;
    switch(Grade)
    {
        // End:0x279
        case 903:
        // End:0x281
        case 904:
        // End:0x289
        case 905:
        // End:0x29C
        case 906:
            bFlyingAttack = false;
            // End:0x2BA
            break;
        // End:0x2A4
        case 910:
        // End:0x2B7
        case 911:
            bFlyingAttack = true;
            // End:0x2BA
            break;
        // End:0xFFFF
        default:
            break;
    }
    // End:0x2D4
    if(Pawn != none)
    {
        Pawn.AdjustCollisionSize();
    }
    //return;    
}

function Possess(Pawn aPawn)
{
    super.Possess(aPawn);
    //return;    
}

simulated function int GetTeamNum()
{
    return Pawn.TeamIndex;
    //return;    
}

state Dying
{
    function BeginState()
    {
        Pawn.Died(self, Class'Engine.DamageType', vect(0.0000000, 0.0000000, 0.0000000));
        //return;        
    }
    stop;    
}

state BirdFollowingPath
{
    function BeginState()
    {
        //return;        
    }

    function float EstimateDistanceIfDecelerate(int N)
    {
        local int lp1;
        local float dist;

        lp1 = 0;
        J0x07:

        // End:0x4C [Loop If]
        if(lp1 < N)
        {
            dist += FMax(CONFIG_MinSpeed, Pawn.AirSpeed - (CONFIG_Deceleration * float(lp1)));
            lp1++;
            // [Loop Continue]
            goto J0x07;
        }
        return dist - CONFIG_MaxSpeed;
        //return;        
    }

    function Tick(float dt)
    {
        local float leftoverDist;

        leftoverDist = VSize(CurrentPathNode.Location - Pawn.Location);
        // End:0x46
        if(leftoverDist < (EstimateDistanceIfDecelerate(3)))
        {
            Decelerate(dt);            
        }
        else
        {
            Accelerate(dt);
            FocalPoint = GetFocalPoint2(CurrentPathNode.Location);
        }
        //return;        
    }

    function Vector GetFocalPoint2(Vector V)
    {
        local float S;
        local Vector Dir, ndir, Result;
        local Rotator R;

        Dir = V - Pawn.Location;
        Dir.Z = 0.0000000;
        ndir = Normal(Dir);
        S = Pawn.AirSpeed / CONFIG_MaxSpeed;
        R = Rotator(ndir);
        R.Pitch = int((S * S) * float(Degree2Unreal(CONFIG_MoveMaxSlope)));
        Result = Pawn.Location + ((Vector(R) * VSize(Dir)) * float(3));
        return Result;
        //return;        
    }
Begin:

    CurrentPathNode = GetNextFlyingPathNode();
    ProgressFlyingPathNode();
    MoveTo(CurrentPathNode.Location,,, GetFocalPoint(CurrentPathNode.Location));
    // End:0x59
    if((GetNextFlyingPathNode()) == none)
    {
        OnDisappear(self);
        Disappear();        
    }
    else
    {
        Destination = GetMomentousRandomDest();
        // End:0x78
        if(bFlyingAttack)
        {
            GotoState('BirdAttacking');            
        }
        else
        {
            GotoState('BirdFollowingPath');
        }
    }
    stop;                    
}

defaultproperties
{
    eControllerType=2
}