class wSpecialKillMessage extends LocalMessage
    notplaceable
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var string strScore_Heli;
var string strScore_Artillery;
var string strScore_Headshot;
var string strScore_FragGrenade;
var string strScore_Melee;
var string strScore_StepOn;
var string strScore_SpecialETC;
var string strScore_Normal;
var int Code_MessageScore_Heli_Killer;
var int Code_MessageScore_Artillery;
var int Code_MessageScore_Headshot;
var int Code_MessageScore_FragGrenade;
var int Code_MessageScore_Melee;
var int Code_MessageScore_StepOn;
var int Code_MessageScore_SpecialETC;
var int Code_MessageScore_Normal;
var float fTotalEffectRunTime;
var float fEffectRunTime1;
var float fEffectRunTime2;
var float fFadeOutTime;
var Sound HeadShotSound;
var name AHeadShotSound;

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    switch(Switch)
    {
        // End:0x15
        case default.Code_MessageScore_Heli_Killer:
            return default.strScore_Heli;
        // End:0x23
        case default.Code_MessageScore_Artillery:
            return default.strScore_Artillery;
        // End:0x31
        case default.Code_MessageScore_FragGrenade:
            return default.strScore_FragGrenade;
        // End:0x3F
        case default.Code_MessageScore_Melee:
            return default.strScore_Melee;
        // End:0x4D
        case default.Code_MessageScore_StepOn:
            return default.strScore_StepOn;
        // End:0x5B
        case default.Code_MessageScore_SpecialETC:
            return default.strScore_SpecialETC;
        // End:0x69
        case default.Code_MessageScore_Normal:
            return default.strScore_Normal;
        // End:0xFFFF
        default:
            return default.strScore_Headshot;
            break;
    }
    //return;    
}

static simulated function ClientReceive(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    P.myHUD.ResetKillMessageTexture();
    super.ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
    // End:0x5F
    if(Switch == default.Code_MessageScore_Headshot)
    {
        P.PlayRewardAnnouncement(default.AHeadShotSound, 1,, 17);
    }
    //return;    
}

defaultproperties
{
    strScore_Heli="Helikill"
    strScore_Artillery="Artillerykill"
    strScore_Headshot="headshot"
    strScore_FragGrenade="FragGrenadeKill"
    strScore_Melee="MeleeKill"
    strScore_StepOn="StepOnKill"
    strScore_SpecialETC="SpecialETCKill"
    strScore_Normal="NormalKill"
    Code_MessageScore_Heli_Killer=101
    Code_MessageScore_Artillery=102
    Code_MessageScore_Headshot=100
    Code_MessageScore_FragGrenade=103
    Code_MessageScore_Melee=104
    Code_MessageScore_StepOn=105
    Code_MessageScore_SpecialETC=106
    Code_MessageScore_Normal=107
    fTotalEffectRunTime=0.2000000
    fEffectRunTime1=0.1900000
    fFadeOutTime=1.0000000
    AHeadShotSound="v_cb_kill_headshot"
    bFadeMessage=true
    Lifetime=2
    bDrawWithTexture=true
    PosY=0.3750000
    FontSize=30
}