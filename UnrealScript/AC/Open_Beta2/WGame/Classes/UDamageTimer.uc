class UDamageTimer extends Info
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var int SoundCount;

function Timer()
{
    // End:0x15
    if(Pawn(Owner) == none)
    {
        Destroy();
        return;
    }
    Pawn(Owner).DisableUDamage();
    Destroy();
    //return;    
}
