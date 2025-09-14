/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\AnnounceAdrenaline.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:1
 *
 *******************************************************************************/
class AnnounceAdrenaline extends Info
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var Sound AnnounceSound;
var name Announcement;

function Timer()
{
    // End:0x63
    if(PlayerController(Owner) != none)
    {
        // End:0x3d
        if(Announcement != 'None')
        {
            PlayerController(Owner).PlayRewardAnnouncement(Announcement, 1);
        }
        // End:0x63
        else
        {
            // End:0x63
            if(AnnounceSound != none)
            {
                PlayerController(Owner).PlayAnnouncement(AnnounceSound, 1);
            }
        }
    }
    Destroy();
}

defaultproperties
{
    LifeSpan=30.0
}