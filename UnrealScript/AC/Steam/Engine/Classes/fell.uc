/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\fell.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * 
 *******************************************************************************/
class fell extends DamageType
    abstract
    notplaceable;

defaultproperties
{
    DeathString="%k pushed %o off a cliff."
    FemaleSuicide="%o fell to her death."
    MaleSuicide="%o fell to his death."
    bLocationalHit=true
    bCausedByWorld=true
    GibModifier=2.0
    GibPerterbation=0.50
}