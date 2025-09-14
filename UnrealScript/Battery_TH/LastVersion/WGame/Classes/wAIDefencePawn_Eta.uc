class wAIDefencePawn_Eta extends wAIDefencePawn;

var Controller infoKiller;
var Vector infoHitlocation;
var Vector infoMomentum;
var Class<DamageType> infoDamageType;
var int infoCollisionPart;
var int infoWeaponType;
var bool infoWallShot;
var int infoActualDamage;
var wWeapon EtaWeapon;

static function wAIDefencePawn Create(LevelInfo Level, Vector Location, Rotator Rotation)
{
    local wAIDefencePawn wBot;

    wBot = Level.Spawn(Class'WGame_Decompressed.wAIDefencePawn_Eta',,, Location, Rotation, true);
    // End:0x57
    if(wBot == none)
    {
        Log("failed to spawn wAIDefencePawn_Eta");
        return none;
    }
    return wBot;
    //return;    
}

simulated function Class<wEmitter> GetBloodHitClass(Actor.CollisionPartsType collisionParts)
{
    return Class'XEffects.xAlienPawnGidGroup'.default.BloodHitClass_Eta;
    //return;    
}

simulated function CheckDamageWithinRadius()
{
    //return;    
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    //return;    
}

function DiedInfo(int Damage, Controller Killer, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    infoActualDamage = Damage;
    infoKiller = Killer;
    infoHitlocation = HitLocation;
    infoMomentum = Momentum;
    infoDamageType = DamageType;
    infoCollisionPart = CollisionPart;
    infoWeaponType = WeaponType;
    infoWallShot = bWallShot;
    //return;    
}

simulated function HurtRadius(float DamageAmount, float DamageRadius, Class<DamageType> DamageType, float Momentum, Vector HitLocation)
{
    local Actor Victims;
    local float dist, damageScale;
    local Vector Dir;
    local float fActualMomentum, fRangeLerp, fRangeMiddle, fActualDamage, fExpRadious_Outer, fExpRadious_Inner,
	    fExplDam_Outer, fExplDam_Inner;

    // End:0x0B
    if(bHurtEntry)
    {
        return;
    }
    bHurtEntry = true;
    fExpRadious_Outer = EtaWeapon.BaseParams.fExplRad_Outer;
    fExpRadious_Inner = EtaWeapon.BaseParams.fExplRad_Inner;
    fExplDam_Outer = EtaWeapon.BaseParams.fExplDam_Outer;
    fExplDam_Inner = EtaWeapon.BaseParams.fExplDam_Inner;
    fActualMomentum = EtaWeapon.BaseParams.fMomentum;
    // End:0x2E8
    foreach VisibleCollidingActors(Class'Engine.Actor', Victims, fExpRadious_Outer, HitLocation)
    {
        // End:0xCD
        if(Victims == none)
        {
            continue;            
        }
        // End:0xE5
        if(Victims.IsA('wAIDefencePawn'))
        {
            continue;            
        }
        // End:0xFD
        if(Victims.IsA('wFlagObjectiveBase'))
        {
            continue;            
        }
        // End:0x2E7
        if(((Victims != self) && int(Victims.Role) == int(ROLE_Authority)) && !Victims.IsA('FluidSurfaceInfo'))
        {
            Dir = Victims.Location - HitLocation;
            dist = FMax(1.0000000, VSize(Dir));
            Dir = Dir / dist;
            fRangeMiddle = fExpRadious_Outer - fExpRadious_Inner;
            // End:0x1A9
            if(fRangeMiddle == float(0))
            {
                fActualDamage = fExplDam_Inner;                
            }
            else
            {
                fRangeLerp = FMax(0.0000000, (dist - fExpRadious_Inner) / fRangeMiddle);
                fActualDamage = (fExplDam_Inner * (float(1) - fRangeLerp)) + (fExplDam_Outer * fRangeLerp);
            }
            damageScale = 1.0000000 - fRangeLerp;
            Victims.TakeDamage(int(fActualDamage), Instigator, Victims.Location - ((0.5000000 * (Victims.CollisionHeight + Victims.CollisionRadius)) * Dir), (damageScale * fActualMomentum) * Dir, DamageType,, int(5));
            // End:0x2E7
            if(((Instigator != none) && Vehicle(Victims) != none) && Vehicle(Victims).Health > 0)
            {
                Vehicle(Victims).DriverRadiusDamage(DamageAmount, DamageRadius, Instigator.Controller, DamageType, Momentum, HitLocation);
            }
        }        
    }    
    bHurtEntry = false;
    //return;    
}

simulated function DiedAction()
{
    local Inventory Inv;
    local int Count;
    local Controller C;
    local PlayerController PC;

    // End:0x0D
    if(Inventory == none)
    {
        return;
    }
    Inv = Inventory;
    J0x18:

    // End:0x92 [Loop If]
    if(Inv != none)
    {
        // End:0x63
        if((int(Inv.InventoryGroup) == 4) && Inv.IsA('wWeapon'))
        {
            EtaWeapon = wWeapon(Inv);
            // [Explicit Break]
            goto J0x92;
        }
        Count++;
        // End:0x7B
        if(Count > 1000)
        {
            return;
        }
        Inv = Inv.Inventory;
        // [Loop Continue]
        goto J0x18;
    }
    J0x92:

    // End:0x9F
    if(EtaWeapon == none)
    {
        return;
    }
    // End:0xB3
    if(bPhysicsAnimUpdate)
    {
        TearOffMomentum = infoMomentum;
    }
    Level.Game.KDLOG_Initialize();
    Level.Game.SC.KDLog.KillDamage = infoActualDamage;
    HurtRadius(EtaWeapon.BaseParams.fExplDam_Outer, EtaWeapon.BaseParams.fExplRad_Outer, Class'Engine.wDamageGR', EtaWeapon.BaseParams.fMomentum, self.Location);
    // End:0x16C
    if(infoKiller == none)
    {
        infoKiller = self.GetKillerController();
    }
    C = Level.ControllerList;
    J0x180:

    // End:0x1E6 [Loop If]
    if(C != none)
    {
        PC = PlayerController(C);
        // End:0x1CF
        if(PC != none)
        {
            PC.ClientFmodPlaySoundLocal(sndDie, 0, 1.0000000, false, true, false, -1, false, Location);
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x180;
    }
    Died(infoKiller, infoDamageType, infoHitlocation, infoCollisionPart, infoWeaponType, infoWallShot);
    //return;    
}

function Died(Controller Killer, Class<DamageType> DamageType, Vector HitLocation, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    super(wPawn).Died(Killer, DamageType, HitLocation, CollisionPart, WeaponType, bWallShot);
    //return;    
}

function KilledBy(Pawn EventInstigator)
{
    Health = 0;
    //return;    
}

state BeAction
{
    simulated function CheckDamageWithinRadius()
    {
        local PlayerController P;
        local Controller C;
        local Pawn Pawn;
        local float fDist;

        // End:0x98
        if((AttackFlag != none) && !AttackFlag.bDisabled)
        {
            fDist = VSize(Location - AttackFlag.Location);
            // End:0x98
            if(fDist < (AttackFlag.ReachRadius + self.CollisionRadius))
            {
                wAIBotBase(Controller).IsStopAction = true;
                // End:0x96
                if(!self.IsInState('SuicideExplode'))
                {
                    self.GotoState('SuicideExplode');
                }
                return;
            }
        }
        C = Level.ControllerList;
        J0xAC:

        // End:0x1BD [Loop If]
        if(C != none)
        {
            // End:0xCE
            if(C.IsA('wAIDefenceBot'))
            {                
            }
            else
            {
                // End:0xE5
                if(C.IsA('wMonsterController'))
                {                    
                }
                else
                {
                    // End:0xFC
                    if(C.IsA('wHelicopterController'))
                    {                        
                    }
                    else
                    {
                        P = PlayerController(C);
                        // End:0x12E
                        if(none == P)
                        {
                            Pawn = C.Pawn;                            
                        }
                        else
                        {
                            Pawn = P.GetMyPawn();
                        }
                        // End:0x1A6
                        if(Pawn != none)
                        {
                            // End:0x1A6
                            if(VSize(Location - Pawn.Location) < MeleeRange)
                            {
                                wAIBotBase(Controller).IsStopAction = true;
                                // End:0x1A3
                                if(!self.IsInState('SuicideExplode'))
                                {
                                    self.GotoState('SuicideExplode');
                                }
                                // [Explicit Break]
                                goto J0x1BD;
                            }
                        }
                    }
                }
            }
            C = C.nextController;
            // [Loop Continue]
            goto J0xAC;
        }
        J0x1BD:

        //return;        
    }

    function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
    {
        local int ActualDamage;
        local Controller Killer;

        // End:0x6D
        if(DamageType == none)
        {
            // End:0x62
            if(instigatedBy != none)
            {
                Warn((("No damagetype for damage by " $ string(instigatedBy)) $ " with weapon ") $ string(instigatedBy.Weapon));
            }
            DamageType = Class'Engine.DamageType';
        }
        // End:0xB6
        if(int(Role) < int(ROLE_Authority))
        {
            Log((((string(self) $ " client damage type ") $ string(DamageType)) $ " by ") $ string(instigatedBy));
            return;
        }
        // End:0xE2
        if((Health <= 0) || !Level.Game.CanPawnTakeDamage())
        {
            return;
        }
        // End:0x138
        if((((instigatedBy == none) || instigatedBy.Controller == none) && DamageType.default.bDelayedDamage) && DelayedDamageInstigatorController != none)
        {
            instigatedBy = DelayedDamageInstigatorController.Pawn;
        }
        // End:0x15B
        if((int(Physics) == int(0)) && DrivenVehicle == none)
        {
            SetMovementPhysics();
        }
        // End:0x1A4
        if((int(Physics) == int(1)) && DamageType.default.bExtraMomentumZ)
        {
            Momentum.Z = FMax(Momentum.Z, 0.4000000 * VSize(Momentum));
        }
        // End:0x1BB
        if(instigatedBy == self)
        {
            Momentum *= 0.6000000;
        }
        Momentum = Momentum / Mass;
        // End:0x200
        if(Weapon != none)
        {
            Weapon.AdjustPlayerDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType);
        }
        // End:0x233
        if(DrivenVehicle != none)
        {
            DrivenVehicle.AdjustDriverDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType);
        }
        // End:0x25D
        if((instigatedBy != none) && instigatedBy.HasUDamage())
        {
            Damage *= float(2);
        }
        ActualDamage = Level.Game.ReduceDamage(Damage, self, instigatedBy, HitLocation, Momentum, DamageType, WeaponType);
        // End:0x2CA
        if(DamageType.default.bArmorStops && ActualDamage > 0)
        {
            ActualDamage = ShieldAbsorb(ActualDamage);
        }
        ApplyDealDamageRatio(instigatedBy, DamageType, WeaponType, ActualDamage);
        // End:0x306
        if(HitLocation == vect(0.0000000, 0.0000000, 0.0000000))
        {
            HitLocation = Location;
        }
        AddDamageInfo(instigatedBy, ActualDamage, DamageType);
        // End:0x36B
        if(ActualDamage > 0)
        {
            instigatedBy.LastDamageDealtTime = Level.TimeSeconds;
            instigatedBy.LastDamageCollisionPart = CollisionPart;
            LastDamageReceiveTime = Level.TimeSeconds;
        }
        PlayHit(float(ActualDamage), instigatedBy, HitLocation, DamageType, Momentum, CollisionPart);
        Killer = GetDamagedByKiller(DamageType, instigatedBy);
        // End:0x410
        if((Health - ActualDamage) <= 0)
        {
            Health = 0;
            DiedInfo(ActualDamage, Killer, HitLocation, Momentum, DamageType, CollisionPart, WeaponType, bWallShot);
            // End:0x40D
            if(!self.IsInState('SuicideExplode'))
            {
                self.GotoState('SuicideExplode');
            }            
        }
        else
        {
            AttackerLoc = instigatedBy.Location;
            // End:0x47C
            if(DrivenVehicle != none)
            {
                // End:0x479
                if(DrivenVehicle.Controller != none)
                {
                    DrivenVehicle.Controller.NotifyTakeHit(instigatedBy, HitLocation, ActualDamage, DamageType, Momentum, CollisionPart);
                }                
            }
            else
            {
                // End:0x4B4
                if(Controller != none)
                {
                    Controller.NotifyTakeHit(instigatedBy, HitLocation, ActualDamage, DamageType, Momentum, CollisionPart);
                }
            }
            // End:0x4E0
            if((instigatedBy != none) && instigatedBy != self)
            {
                LastHitBy = instigatedBy.Controller;
            }
            Health -= ActualDamage;
            TakeDamageSound(Health, ActualDamage, HitLocation, DamageType, CollisionPart, WeaponType, Killer);
        }
        MakeNoise(1.0000000);
        //return;        
    }
    stop;    
}

state SuicideExplode
{
    ignores Timer, EndState, BeginState, CheckDamageWithinRadius, TakeDamage, AnimEnd;

    simulated function AnimEnd(int Channel)
    {
        local name szAnim;
        local float frame, Rate;

        super(wPawn).AnimEnd(Channel);
        GetAnimParams(0, szAnim, frame, Rate);
        // End:0x36
        if(szAnim == 'Mattack_Bomb1')
        {
            DiedAction();
        }
        //return;        
    }

    simulated function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
    {
        //return;        
    }

    simulated function CheckDamageWithinRadius()
    {
        //return;        
    }

    function BeginState()
    {
        // End:0x25
        if(wAIDefenceBot_Eta(Controller) != none)
        {
            wAIDefenceBot_Eta(Controller).GotoState('SuicideExplode');
        }
        PlayerReplicationInfo.IsInvulnerable = true;
        SetPhysics(0);
        SetAnimAction(AttackMotion);
        //return;        
    }

    function EndState()
    {
        //return;        
    }

    function Timer()
    {
        //return;        
    }
Begin:

    stop;                
}

defaultproperties
{
    SpawnEffectExplosion=Class'XEffects.XWFX_Alien_Eta_explosion'
    AttackMotion="Mattack_Bomb1"
    SoundFootsteps_3rd="Warfare_Sound_Defense_Mode/Monster_Eta/char_enemy_move_eta"
    sndScream="Warfare_Sound_Defense_Mode/Monster_eta/char_enemy_wail_eta"
    sndDie="Warfare_Sound_Defense_Mode/Monster_eta/char_enemy_death_eta"
    CrouchHeight=25.0000000
    CrouchRadius=20.0000000
    ControllerClass=Class'WGame_Decompressed.wAIDefenceBot_Eta'
    CollisionRadius=30.0000000
    CollisionHeight=32.0000000
}