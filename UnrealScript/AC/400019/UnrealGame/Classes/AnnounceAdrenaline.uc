class AnnounceAdrenaline extends Info
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var Sound AnnounceSound;
var name Announcement;

function Timer()
{
    // End:0x3A
    if(PlayerController(Owner) != none)
    {
        // End:0x3A
        if(Announcement != 'None')
        {
            PlayerController(Owner).PlayRewardAnnouncement(Announcement, 1);
        }
    }
    Destroy();
    //return;    
}

defaultproperties
{
    LifeSpan=30.0000000
}