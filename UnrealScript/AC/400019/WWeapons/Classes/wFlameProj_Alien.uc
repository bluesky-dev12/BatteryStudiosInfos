class wFlameProj_Alien extends wFlameProj;

struct SuffInfoEx
{
    var Actor kSuffer;
    var float fLastSuff;
};

var array<SuffInfoEx> arrSuffInfoEx;

simulated function wLoadEmitter()
{
    local Coords cor;
    local Rotator rRot;
    local Vector vVec;

    SetSpeed(BaseParams.fProjSpeed);
    // End:0xF5
    if(int(Level.NetMode) != int(NM_DedicatedServer))
    {
        Instigator.Weapon.Hand = 0.0000000;
        cor = wPawn(Instigator).WeaponAttachment.GetBoneTipLocation3rd();
        // End:0xAC
        if(Instigator.IsA('wAIDefencePawn_Alien'))
        {
            emiFlame = Spawn(Class'XEffects.Alien_MiddleBos_flamethrower', self,, cor.Origin, Instigator.Rotation);            
        }
        else
        {
            // End:0xE8
            if(Instigator.IsA('wAIDefencePawn_Omega'))
            {
                emiFlame = Spawn(Class'XEffects.Alien_omega_flamethrower', self,, cor.Origin, Instigator.Rotation);
            }
        }
        emiFlame.SetBase(self);
    }
    //return;    
}

simulated function VictimSearch()
{
    local Actor Victim;
    local int i;
    local float fLerpValue, fCurColRadius, fCurColHeight;

    fLerpValue = TimerCounter / fTimeGrow;
    fLerpValue = float(Min(1, int(fLerpValue)));
    fCurColRadius = fMinColRadius + ((fMaxColRadius - fMinColRadius) * fLerpValue);
    fCurColHeight = fMinColHeight + ((fMaxColHeight - fMinColHeight) * fLerpValue);
    SetCollisionSize(fCurColRadius, fCurColHeight);
    // End:0x2BA
    foreach TouchingActors(Class'Engine.Actor', Victim)
    {
        // End:0xAB
        if((Instigator != none) && wAIDefencePawn(Instigator) == wAIDefencePawn(Victim))
        {
            continue;            
        }
        // End:0xDD
        if(!Victim.IsA('Decoration') && !Victim.IsA('wPawn'))
        {
            continue;            
        }
        i = 0;
        J0xE4:

        // End:0x1E3 [Loop If]
        if(i < arrSuffInfoEx.Length)
        {
            // End:0x1D9
            if(arrSuffInfoEx[i].kSuffer == Victim)
            {
                // End:0x1D6
                if((arrSuffInfoEx[i].fLastSuff + fDamageDelay) <= Level.TimeSeconds)
                {
                    // End:0x16D
                    if(Pawn(Victim) != none)
                    {
                        DamageLog(Pawn(Victim), float(BaseParams.iDamage), 0.0000000);
                    }
                    Victim.TakeDamage(BaseParams.iDamage, Instigator, Victim.Location, vect(0.0000000, 0.0000000, 0.0000000), ResParams,, int(8));
                    arrSuffInfoEx[i].fLastSuff = Level.TimeSeconds;
                    // [Explicit Continue]
                    goto J0x1D9;
                }
                // [Explicit Break]
                goto J0x1E3;
            }
            J0x1D9:

            i++;
            // [Loop Continue]
            goto J0xE4;
        }
        J0x1E3:

        // End:0x2B9
        if(i == arrSuffInfoEx.Length)
        {
            arrSuffInfoEx.Insert(arrSuffInfoEx.Length, 1);
            arrSuffInfoEx[arrSuffInfoEx.Length - 1].kSuffer = Victim;
            // End:0x24F
            if(Pawn(Victim) != none)
            {
                DamageLog(Pawn(Victim), float(BaseParams.iDamage), 0.0000000);
            }
            Victim.TakeDamage(BaseParams.iDamage, Instigator, Victim.Location, vect(0.0000000, 0.0000000, 0.0000000), ResParams,, int(8));
            arrSuffInfoEx[arrSuffInfo.Length - 1].fLastSuff = Level.TimeSeconds;
        }        
    }    
    //return;    
}
