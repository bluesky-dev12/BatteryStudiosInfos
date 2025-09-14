/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wKnifeFire.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:2
 *
 *******************************************************************************/
class wKnifeFire extends wMeleeFire;

simulated function SetFireAnim();
function PlayFiring()
{
    // End:0x5f
    if(Weapon.Mesh != none)
    {
        // End:0x39
        if(float(0) == float(Rand(9999)) % float(2))
        {
            FireAnim = 'Fire';
        }
        // End:0x44
        else
        {
            FireAnim = 'Fire2';
        }
        Weapon.PlayAnim(FireAnim, FireAnimRate, TweenTime);
    }
}

defaultproperties
{
    FireAnim=Fire
}