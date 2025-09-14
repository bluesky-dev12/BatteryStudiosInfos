class wSpecialKillMessage extends LocalMessage
    notplaceable
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var(Messages) localized string DecapitationString;
var Sound HeadShotSound;
var name AHeadShotSound;

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    return default.DecapitationString;
    //return;    
}

static simulated function ClientReceive(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    P.myHUD.ResetKillMessageTexture();
    super.ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
    P.PlayRewardAnnouncement(default.AHeadShotSound, 1,, 17);
    //return;    
}

defaultproperties
{
    DecapitationString="headshot"
    AHeadShotSound="v_cb_kill_headshot"
    bIsUnique=true
    bFadeMessage=true
    Lifetime=2
    bDrawWithTexture=true
    PosY=0.3750000
    FontSize=30
}