class DamRanOver extends DamageType
    abstract
    notplaceable;

defaultproperties
{
    DeathString="%k was run down by %o."
    FemaleSuicide="%o was run down."
    MaleSuicide="%o was run down."
    bLocationalHit=false
    bKUseTearOffMomentum=true
    bNeverSevers=true
    bVehicleHit=true
    GibModifier=2.0000000
    GibPerterbation=0.5000000
}