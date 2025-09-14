class DamTypeTelefragged extends DamageType
    abstract
    notplaceable;

defaultproperties
{
    DeathString="%o was fragged by %k."
    FemaleSuicide="%o was fragged."
    MaleSuicide="%o was fragged."
    bArmorStops=false
    bAlwaysGibs=true
    bLocationalHit=false
    bAlwaysSevers=true
    GibPerterbation=1.0000000
}