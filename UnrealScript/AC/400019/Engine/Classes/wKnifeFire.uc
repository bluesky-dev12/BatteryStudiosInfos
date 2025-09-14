class wKnifeFire extends wMeleeFire;

simulated function SetFireAnim()
{
    //return;    
}

function PlayFiring()
{
    // End:0x79
    if(Weapon.Mesh != none)
    {
        // End:0x39
        if(float(0) == (float(Rand(9999)) % float(2)))
        {
            FireAnim = 'Fire';            
        }
        else
        {
            FireAnim = 'Fire2';
        }
        Weapon.PlayAnim(FireAnim, FireAnimRate, TweenTime);
        Instigator.Controller.bMeleeFire = 1;
    }
    //return;    
}
