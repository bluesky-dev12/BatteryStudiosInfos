/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\UDamageTimer.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:1
 *
 *******************************************************************************/
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
}
