class wDefenceBossController extends wMonsterController;

function OnBeginRound()
{
    super(Actor).OnBeginRound();
    // End:0x33
    if(Pawn != none)
    {
        Pawn.Died(none, Class'Engine.DamageType', vect(0.0000000, 0.0000000, 0.0000000));
    }
    //return;    
}

function ResetSkill()
{
    local float AdjustedYaw;

    bLeadTarget = Skill >= float(4);
    SetCombatTimer();
    SetPeripheralVision();
    AdjustedYaw = (0.7500000 + (0.0500000 * ReactionTime)) * float(RotationRate.Yaw);
    AcquisitionYawRate = int(AdjustedYaw);
    SetMaxDesiredSpeed();
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
        wDefenceBoss(Pawn).MeshItemID = AILevel.GetItemParamByGroupID(NPCParam.SpCharGroupID_AF).ItemID;        
    }
    else
    {
        wDefenceBoss(Pawn).MeshItemID = AILevel.GetItemParamByGroupID(NPCParam.SpCharGroupID_RSA).ItemID;
    }
    RotationRate.Yaw = int(NPCParam.RotationgSpeed);
    RotationRate.Pitch = int(NPCParam.RotationgSpeed);
    wDefenceBoss(Pawn).RotationRate.Yaw = RotationRate.Yaw;
    wDefenceBoss(Pawn).RotationRate.Pitch = RotationRate.Pitch;
    wDefenceBoss(Pawn).iNpcID = NPCParam.NPCID;
    // End:0x2CC
    if(Pawn != none)
    {
        Pawn.AdjustCollisionSize();
    }
    //return;    
}

simulated function int GetTeamNum()
{
    return Pawn.TeamIndex;
    //return;    
}

function DoCharge()
{
    // End:0x3A
    if(Enemy.PhysicsVolume.bWaterVolume)
    {
        // End:0x37
        if(!Pawn.bCanSwim)
        {
            DoTacticalMove();
            return;
        }        
    }
    else
    {
        // End:0x6C
        if(!Pawn.bCanFly && !Pawn.bCanWalk)
        {
            DoTacticalMove();
            return;
        }
    }
    GotoState('Charging');
    //return;    
}

function TimedFireWeaponAtTarget()
{
    wMonster(Pawn).RangedAttack(Target);
    SetTimer(0.1000000, true);
    //return;    
}

function WanderOrCamp(bool bMayCrouch)
{
    GotoState('AttackNuclearReactor');
    //return;    
}

function FightEnemy(bool bCanCharge)
{
    local Vector X, Y, Z;
    local float enemyDist, AdjustedCombatStyle, Aggression;
    local bool bFarAway, bOldForcedCharge;
    local NavigationPoint N;

    // End:0x45
    if((Enemy == none) || Pawn == none)
    {
        Log((("HERE 3 Enemy " $ string(Enemy)) $ " pawn ") $ string(Pawn));
    }
    // End:0xE3
    if((Enemy == FailedHuntEnemy) && Level.TimeSeconds == FailedHuntTime)
    {
        // End:0x91
        if(!Enemy.Controller.bIsPlayer)
        {
            FindNewEnemy();
        }
        // End:0xE3
        if(Enemy == FailedHuntEnemy)
        {
            GoalString = "FAILED HUNT - HANG OUT";
            // End:0xCF
            if(EnemyVisible())
            {
                bCanCharge = false;
            }
            // End:0xE3
            if(!EnemyVisible())
            {
                WanderOrCamp(true);
                return;
            }
        }
    }
    bOldForcedCharge = bMustCharge;
    bMustCharge = false;
    enemyDist = VSize(Pawn.Location - Enemy.Location);
    AdjustedCombatStyle = CombatStyle;
    Aggression = (((1.5000000 * FRand()) - 0.8000000) + (float(2) * AdjustedCombatStyle)) + (FRand() * (Normal(Enemy.Velocity - Pawn.Velocity) Dot Normal(Enemy.Location - Pawn.Location)));
    // End:0x1CD
    if(Enemy.Weapon != none)
    {
        Aggression += (float(2) * Enemy.Weapon.SuggestDefenseStyle());
    }
    // End:0x1EA
    if(enemyDist > float(8000))
    {
        Aggression += 0.5000000;
    }
    // End:0x2FB
    if((int(Pawn.Physics) == int(1)) || int(Pawn.Physics) == int(2))
    {
        // End:0x275
        if(Pawn.Location.Z > (Enemy.Location.Z + float(1220)))
        {
            Aggression = FMax(0.0000000, (Aggression - 1.0000000) + AdjustedCombatStyle);            
        }
        else
        {
            // End:0x2B4
            if((Skill < float(4)) && enemyDist > (0.6500000 * float(8000)))
            {
                bFarAway = true;
                Aggression += 0.5000000;                
            }
            else
            {
                // End:0x2FB
                if(Pawn.Location.Z < (Enemy.Location.Z - Pawn.CollisionHeight))
                {
                    Aggression += CombatStyle;
                }
            }
        }
    }
    // End:0x359
    if(!EnemyVisible())
    {
        GoalString = "Enemy not visible";
        // End:0x344
        if(!bCanCharge)
        {
            GoalString = "Stake Out";
            DoStakeOut();            
        }
        else
        {
            GoalString = "Hunt";
            GotoState('Hunting');
        }
        return;
    }
    Target = Enemy;
    // End:0x3E2
    if(wDefenceBoss(Pawn).ReadyToRangedAttack())
    {
        // End:0x3E2
        if((!wMonster(Pawn).PreferMelee() && FRand() > (0.1700000 * (Skill - float(1)))) && !DefendMelee(enemyDist))
        {
            GoalString = "Ranged Attack";
            DoRangedAttackOn(Enemy);
            return;
        }
    }
    // End:0x4A1
    if(wMonster(Pawn).GetChargingDist() > enemyDist)
    {
        // End:0x443
        if(wMonster(Pawn).PreferMelee() || bCanCharge && bOldForcedCharge)
        {
            GoalString = "Charge";
            DoCharge();
            return;
        }
        // End:0x4A1
        if((((bCanCharge && Skill < float(5)) && bFarAway) && Aggression > float(1)) && FRand() < 0.5000000)
        {
            GoalString = "Charge closer";
            DoCharge();
            return;
        }
    }
    GoalString = "Do tactical move";
    // End:0x575
    if(((!wMonster(Pawn).RecommendSplashDamage() && wMonster(Pawn).bCanDodge) && FRand() < 0.7000000) && (FRand() * Skill) > float(3))
    {
        GetAxes(Pawn.Rotation, X, Y, Z);
        GoalString = "Try to Duck ";
        // End:0x569
        if(FRand() < 0.5000000)
        {
            Y *= float(-1);
            TryToDuck(Y, true);            
        }
        else
        {
            TryToDuck(Y, false);
        }
    }
    DoTacticalMove();
    //return;    
}

function Actor FindRandEnemy()
{
    local Pawn BestEnemy;
    local bool bSeeNew, bSeeBest;
    local float BestDist, newdist;
    local Controller C;
    local int iAlivePawnCount;
    local array<Controller> arrC;
    local int i;

    // End:0x1D
    if(Level.Game.bGameEnded)
    {
        return none;
    }
    iAlivePawnCount = 1;
    C = Level.ControllerList;
    J0x38:

    // End:0xC5 [Loop If]
    if(C != none)
    {
        // End:0xAE
        if((C.bIsPlayer && C.Pawn != none) && !C.Pawn.PlayerReplicationInfo.IsDead)
        {
            arrC[iAlivePawnCount - 1] = C;
            iAlivePawnCount++;
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x38;
    }
    // End:0xD2
    if(iAlivePawnCount == 0)
    {
        return none;
    }
    i = Rand(iAlivePawnCount);
    // End:0x10A
    if(i == (iAlivePawnCount - 1))
    {
        return Level.Game.GetNuclearReactor();
    }
    // End:0x133
    if(i >= arrC.Length)
    {
        return Level.Game.GetNuclearReactor();
    }
    return arrC[i].Pawn;
    //return;    
}

state DestoryNuclearReactor extends MoveToGoal
{
    function BeginState()
    {
        Pawn.AirSpeed *= wDefenceBoss(Pawn).fLastChargingSpeed;
        wDefenceBoss(Pawn).bAlwaysStrafe = false;
        //return;        
    }

    function EndState()
    {
        Pawn.AirSpeed = Class'WGame_Decompressed.wDefenceBoss'.default.AirSpeed;
        //return;        
    }

    function FightEnemy(bool bCanCharge)
    {
        //return;        
    }

    function Timer()
    {
        Enable('NotifyBump');
        Target = Level.Game.GetNuclearReactor();
        Focus = Target;
        wDefenceBoss(Pawn).LastMeleeAttack(Target);
        //return;        
    }

    event bool NotifyBump(Actor Other)
    {
        // End:0x35
        if(Other == Target)
        {
            // End:0x33
            if(Pawn != none)
            {
                wDefenceBoss(Pawn).LastMeleeAttack(Target);
            }
            return false;
        }
        return global.NotifyBump(Other);
        //return;        
    }

    function bool PickDestination()
    {
        local NavigationPoint nav;
        local Actor aReactor, HitActor;
        local Vector ReactorLoc, StartLoc, HitLocation, HitNormal, traceExtent;

        local bool bSeeTarget;

        aReactor = Level.Game.GetNuclearReactor();
        // End:0x34
        if(aReactor == none)
        {
            WhatToDoNext(100);            
        }
        else
        {
            Target = Level.Game.GetNuclearReactor();
            Focus = Target;
            ReactorLoc = aReactor.Location;
            ReactorLoc.Z += float(300);
            StartLoc = Pawn.Location;
            bSeeTarget = FastTrace(ReactorLoc, Pawn.Location);
            // End:0xCD
            if(actorReachable(aReactor))
            {
                Destination = ReactorLoc;
                return true;
            }
            // End:0xE2
            if(FindBestPathToward(aReactor, true, true))
            {
                return true;                
            }
            else
            {
                nav = Level.GetRandomNavigationPointAround(ReactorLoc);
                // End:0x148
                if(nav != none)
                {
                    MoveTarget = nav;
                    self.clog("GetRandomNavigationPointAround" $ string(nav));
                    return true;
                }
                traceExtent.X = Pawn.CollisionRadius;
                traceExtent.Y = Pawn.CollisionRadius;
                traceExtent.Z = Pawn.CollisionHeight / 2.0000000;
                HitActor = Trace(HitLocation, HitNormal, ReactorLoc, Pawn.Location,, traceExtent);
                // End:0x201
                if((aReactor == HitActor) || HitActor == none)
                {
                    Destination = ReactorLoc;
                    self.clog("Trace");
                    return true;
                }
                Destination = Pawn.Location;
                Destination.Z += float(500);
            }
        }
        return false;
        //return;        
    }
Begin:

    PickDestination();
WaitForMove:


    // End:0x6A
    if(PickDestination())
    {
        // End:0x5A
        if(MoveTarget != none)
        {
            MoveToward(MoveTarget, Focus);
            // End:0x57
            if(MoveTarget != Level.Game.GetNuclearReactor())
            {
                Sleep(0.5000000);
                goto 'WaitForMove';
            }            
        }
        else
        {
            MoveTo(Destination, Focus);
        }        
    }
    else
    {
        MoveTo(Destination, Focus);
        Sleep(0.5000000);
        goto 'WaitForMove';
    }
    stop;            
}

state AttackNuclearReactor extends MoveToGoal
{
    function BeginState()
    {
        //return;        
    }

    function EndState()
    {
        //return;        
    }

    function Timer()
    {
        TimedFireWeaponAtTarget();
        //return;        
    }

    function PickDestination()
    {
        local Actor aReactor;
        local NavigationPoint nav;

        aReactor = Level.Game.GetNuclearReactor();
        // End:0x34
        if(aReactor == none)
        {
            WhatToDoNext(100);            
        }
        else
        {
            // End:0x5C
            if(actorReachable(aReactor))
            {
                Destination = aReactor.Location;
                MoveTarget = none;
                return;
            }
            // End:0x71
            if(FindBestPathToward(aReactor, true, true))
            {
                return;                
            }
            else
            {
                nav = Level.GetRandomNavigationPointAround(aReactor.Location);
                // End:0xAC
                if(nav != none)
                {
                    MoveTarget = nav;
                    return;
                }
                GotoState('RestFormation');
            }
        }
        //return;        
    }
Begin:

    Target = Level.Game.GetNuclearReactor();
    Focus = Target;
    PickDestination();
moving:


    WaitForLanding();
    PickDestination();
WaitForAnim:


    // End:0x5D
    if(wMonster(Pawn).bShotAnim)
    {
        Sleep(0.5000000);
        goto 'WaitForAnim';
    }
    MoveTo(Destination,, true);
    // End:0x90
    if(Pawn.bCanFly && int(Physics) == int(1))
    {
        SetPhysics(4);
    }
    WhatToDoNext(8);
    goto 'Begin';
    stop;        
}

state RangedAttack
{
    function BeginState()
    {
        StopStartTime = Level.TimeSeconds;
        bHasFired = false;
        Pawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        // End:0x4E
        if(Target == none)
        {
            Target = Enemy;
        }
        // End:0xB3
        if(Target == none)
        {
            Target = Level.Game.GetNuclearReactor();
            Log((GetHumanReadableName()) $ " no target in ranged attack.. attack on Reactor ");
        }
        //return;        
    }
    stop;    
}

state Charging
{
    ignores EndState, BeginState, EnemyNotVisible, Timer, NotifyBump, NotifyTakeHit, 
	    TryStrafe, StrafeFromDamage, TryToDuck, MayFall;

    function MayFall()
    {
        // End:0x11
        if(MoveTarget != Enemy)
        {
            return;
        }
        Pawn.bCanJump = actorReachable(Enemy);
        // End:0x48
        if(!Pawn.bCanJump)
        {
            MoveTimer = -1.0000000;
        }
        //return;        
    }

    function bool TryToDuck(Vector duckDir, bool bReversed)
    {
        // End:0x1E
        if(FRand() < 0.6000000)
        {
            return global.TryToDuck(duckDir, bReversed);
        }
        // End:0x39
        if(MoveTarget == Enemy)
        {
            return TryStrafe(duckDir);
        }
        //return;        
    }

    function bool StrafeFromDamage(float Damage, Class<DamageType> DamageType, bool bFindDest)
    {
        local Vector SideDir;

        // End:0x2E
        if((FRand() * Damage) < ((0.1500000 * CombatStyle) * float(Pawn.Health)))
        {
            return false;
        }
        // End:0x3B
        if(!bFindDest)
        {
            return true;
        }
        SideDir = Normal(Normal(Enemy.Location - Pawn.Location) Cross vect(0.0000000, 0.0000000, 1.0000000));
        // End:0x9D
        if((Pawn.Velocity Dot SideDir) > float(0))
        {
            SideDir *= float(-1);
        }
        return TryStrafe(SideDir);
        //return;        
    }

    function bool TryStrafe(Vector SideDir)
    {
        local Vector Extent, HitLocation, HitNormal;
        local Actor HitActor;

        Extent = Pawn.GetCollisionExtent();
        HitActor = Trace(HitLocation, HitNormal, Pawn.Location + (float(300) * SideDir), Pawn.Location, false, Extent);
        // End:0xB8
        if(HitActor != none)
        {
            SideDir *= float(-1);
            HitActor = Trace(HitLocation, HitNormal, Pawn.Location + (float(300) * SideDir), Pawn.Location, false, Extent);
        }
        // End:0xC5
        if(HitActor != none)
        {
            return false;
        }
        // End:0x156
        if(int(Pawn.Physics) == int(1))
        {
            HitActor = Trace(HitLocation, HitNormal, (Pawn.Location + (float(300) * SideDir)) - (35.0000000 * vect(0.0000000, 0.0000000, 1.0000000)), Pawn.Location + (float(300) * SideDir), false, Extent);
            // End:0x156
            if(HitActor == none)
            {
                return false;
            }
        }
        Destination = Pawn.Location + (float(2 * 300) * SideDir);
        GotoState('TacticalMove', 'DoStrafeMove');
        return true;
        //return;        
    }

    function NotifyTakeHit(Pawn instigatedBy, Vector HitLocation, int Damage, Class<DamageType> DamageType, Vector Momentum, optional int CollisionPart)
    {
        local float pick;
        local Vector SideDir;
        local bool bWasOnGround;

        super.NotifyTakeHit(instigatedBy, HitLocation, Damage, DamageType, Momentum, CollisionPart);
        bWasOnGround = int(Pawn.Physics) == int(1);
        // End:0x57
        if(Pawn.Health <= 0)
        {
            return;
        }
        // End:0x72
        if(StrafeFromDamage(float(Damage), DamageType, true))
        {
            return;            
        }
        else
        {
            // End:0x15B
            if((bWasOnGround && MoveTarget == Enemy) && int(Pawn.Physics) == int(2))
            {
                pick = 1.0000000;
                // End:0xC6
                if(bStrafeDir)
                {
                    pick = -1.0000000;
                }
                SideDir = Normal(Normal(Enemy.Location - Pawn.Location) Cross vect(0.0000000, 0.0000000, 1.0000000));
                SideDir.Z = 0.0000000;
                Pawn.Velocity += (((pick * Pawn.GroundSpeed) * 0.7000000) * SideDir);
                // End:0x15B
                if(FRand() < 0.2000000)
                {
                    bStrafeDir = !bStrafeDir;
                }
            }
        }
        //return;        
    }

    event bool NotifyBump(Actor Other)
    {
        // End:0x1C
        if(Other == Enemy)
        {
            DoRangedAttackOn(Enemy);
            return false;
        }
        return global.NotifyBump(Other);
        //return;        
    }

    function Timer()
    {
        Enable('NotifyBump');
        Target = Enemy;
        TimedFireWeaponAtEnemy();
        //return;        
    }

    function EnemyNotVisible()
    {
        WhatToDoNext(15);
        //return;        
    }

    function BeginState()
    {
        Pawn.AirSpeed *= 2.0000000;
        wDefenceBoss(Pawn).bAlwaysStrafe = false;
        //return;        
    }

    function EndState()
    {
        // End:0x34
        if((Pawn != none) && Pawn.JumpZ > float(0))
        {
            Pawn.bCanJump = true;
        }
        wDefenceBoss(Pawn).bAlwaysStrafe = true;
        Pawn.AirSpeed = Class'WGame_Decompressed.wDefenceBoss'.default.AirSpeed;
        //return;        
    }
Begin:

    // End:0x3B
    if(int(Pawn.Physics) == int(2))
    {
        Focus = Enemy;
        Destination = Enemy.Location;
        WaitForLanding();
    }
    // End:0x4E
    if(Enemy == none)
    {
        WhatToDoNext(16);
    }
WaitForAnim:


    // End:0x73
    if(wMonster(Pawn).bShotAnim)
    {
        Sleep(0.3500000);
        goto 'WaitForAnim';
    }
    // End:0x8C
    if(!FindBestPathToward(Enemy, false, true))
    {
        GotoState('TacticalMove');
    }
moving:


    MoveToward(MoveTarget, FaceActor(1.0000000),, ShouldStrafeTo(MoveTarget));
    WhatToDoNext(17);
    // End:0xD6
    if(bSoaking)
    {
        SoakStop("STUCK IN CHARGING!");
    }
    stop;        
}
