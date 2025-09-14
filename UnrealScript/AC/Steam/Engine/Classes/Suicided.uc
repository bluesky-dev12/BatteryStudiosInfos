/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\Suicided.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * 
 *******************************************************************************/
class Suicided extends DamageType
    abstract
    notplaceable;

defaultproperties
{
    DeathString="%o succumbed to poison."
    FemaleSuicide="%o poisoned herself."
    MaleSuicide="%o poisoned himself."
    bArmorStops=true
    bLocationalHit=true
}