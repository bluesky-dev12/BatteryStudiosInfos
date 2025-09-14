class wAISentryGunController extends wAIBot;

event Tick(float dt)
{
    local float fMaxAmmo, fAmmo;
    local MemoryItem mi;

    super(Actor).Tick(dt);
    // End:0x21
    if(none == Pawn.Weapon)
    {
        return;
    }
    Pawn.Weapon.GetAmmoCount(fMaxAmmo, fAmmo);
    // End:0x6C
    if(float(0) >= fAmmo)
    {
        Pawn.Died(none, Class'Engine.DamageType', Location);
        return;
    }
    mi = TargetSystem.GetTarget();
    // End:0xB9
    if(none == mi)
    {
        wSentryGunPawn(Pawn).m_TargetPawn = none;
        wSentryGunPawn(Pawn).m_bCanSeeTarget = false;
        return;
    }
    Memory.Update(dt);
    wSentryGunPawn(Pawn).m_TargetPawn = mi.Pawn;
    // End:0x12C
    if(none != mi.Pawn)
    {
        wSentryGunPawn(Pawn).m_bCanSeeTarget = CanSee(mi.Pawn);        
    }
    else
    {
        wSentryGunPawn(Pawn).m_bCanSeeTarget = false;
    }
    // End:0x14F
    if(none == Goal)
    {
        return;
    }
    UpdateElapsed += dt;
    // End:0x16C
    if(UpdateElapsed <= UpdateInterval)
    {
        return;
    }
    Goal.SetFocus();
    switch(Goal.Process(UpdateElapsed))
    {
        // End:0x196
        case 3:
        // End:0x1AC
        case 2:
            Goal = none;
            GotoState('IdleState');
            // End:0x1AF
            break;
        // End:0xFFFF
        default:
            break;
    }
    UpdateElapsed = 0.0000000;
    //return;    
}

state InstallState
{
    function Tick(float dt)
    {
        // End:0xA0
        if(none != Pawn.Weapon)
        {
            // End:0x71
            if(none == Goal)
            {
                Goal = Goal_PlanAndExec(AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_PlanAndExec')).Init(self, Planner);
                Planner.WorkingState.bFireNotInflueceAmmo = true;
            }
            Memory.SetOffsetStandHeight(100.0000000);
            Memory.SetOffsetCrouchHeight(80.0000000);
            GotoState('None');
        }
        //return;        
    }
    stop;    
}

defaultproperties
{
    UpdateInterval=0.1000000
    StateOnPossess="InstallState"
    eControllerType=1
    PawnClass=Class'WGame_Decompressed.wSentryGunPawn'
    bMovable=false
}