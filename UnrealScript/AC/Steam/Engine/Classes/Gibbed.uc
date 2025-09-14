/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\Gibbed.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * 
 *******************************************************************************/
class Gibbed extends DamageType
    abstract
    notplaceable;

defaultproperties
{
    DeathString="%o was gibbed. There's barely anything left to identify."
    FemaleSuicide="%o was gibbed. There's barely anything left to identify."
    MaleSuicide="%o was gibbed. There's barely anything left to identify."
    bArmorStops=true
    bAlwaysGibs=true
    bLocationalHit=true
    GibPerterbation=1.0
}