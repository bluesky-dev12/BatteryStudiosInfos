/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\DamTypeTelefragged.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * 
 *******************************************************************************/
class DamTypeTelefragged extends DamageType
    abstract
    notplaceable;

defaultproperties
{
    DeathString="%o was fragged by %k."
    FemaleSuicide="%o was fragged."
    MaleSuicide="%o was fragged."
    bArmorStops=true
    bAlwaysGibs=true
    bLocationalHit=true
    bAlwaysSevers=true
    GibPerterbation=1.0
}