/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\DamRanOver.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * 
 *******************************************************************************/
class DamRanOver extends DamageType
    abstract
    notplaceable;

defaultproperties
{
    DeathString="%k was run down by %o."
    FemaleSuicide="%o was run down."
    MaleSuicide="%o was run down."
    bLocationalHit=true
    bKUseTearOffMomentum=true
    bNeverSevers=true
    bVehicleHit=true
    GibModifier=2.0
    GibPerterbation=0.50
}