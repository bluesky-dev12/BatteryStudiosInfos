class wMessage_Game_Alien extends wMessage_Game
    notplaceable
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var int Code_AMAppearHostAlien;
var int Code_AMTransformdHostAlien;
var int Code_AMTransformdMasterAlien;
var int Code_AMHeadShotAlien;
var int Code_AMSelectedHero;
var int Code_AMAcquiredAttackBuff;
var int Code_AMReadyTimeCount;
var int Code_AMInfectdHero;
var int Code_AMDropRandomItemBox;
var int Code_AMTouchItemBoxToEveryOne;
var int Code_AMTouchItemBoxInWeapon;
var int Code_AMTouchItemBoxInSkill;
var int Code_AMTouchItemBoxInFillAmmo;
var int Code_AMDefenceToAlien;
var int Code_AMInfectToFail;
var int Code_AMYouwereSuperHero;
var int Code_AMAppearSuperHero;
var int Code_AMReadyTimeCountSuperAlien;
var int Code_AMAppearSuperAlien;
var localized string strAMAppearHostAlien;
var localized string strAMTransformdHostAlien;
var localized string strAMTransformdMasterAlien;
var localized string strAMHeadShotAlien;
var localized string strAMSelectedHero;
var localized string strAMAcquiredAttackBuff;
var localized string strAMReadyTimeCount;
var localized string strAMInfectedHero;
var localized string strAMDropRandomItemBox;
var localized string strAMTouchItemBoxToEveryOne;
var localized string strAMTouchItemBoxInWeapon;
var localized string strAMTouchItemBoxInSkill;
var localized string strAMTouchItemBoxInFillAmmo;
var localized string strAMDefenceToAlien;
var localized string strAMInfectToFail;
var localized string strAMYouwereSuperHero;
var localized string strAMAppearSuperHero;
var localized string strAMReadyTimeCountSuperAlien;
var localized string strAMAppearSuperAlien;

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    switch(Switch)
    {
        // End:0x15
        case default.Code_AMAppearHostAlien:
            return default.strAMAppearHostAlien;
        // End:0x23
        case default.Code_AMTransformdHostAlien:
            return default.strAMTransformdHostAlien;
        // End:0x31
        case default.Code_AMTransformdMasterAlien:
            return default.strAMTransformdMasterAlien;
        // End:0x3F
        case default.Code_AMHeadShotAlien:
            return default.strAMHeadShotAlien;
        // End:0x4D
        case default.Code_AMSelectedHero:
            return default.strAMSelectedHero;
        // End:0x5B
        case default.Code_AMAcquiredAttackBuff:
            return default.strAMAcquiredAttackBuff;
        // End:0x69
        case default.Code_AMReadyTimeCount:
            return default.strAMReadyTimeCount;
        // End:0x77
        case default.Code_AMInfectdHero:
            return default.strAMInfectedHero;
        // End:0x85
        case default.Code_AMDropRandomItemBox:
            return default.strAMDropRandomItemBox;
        // End:0x93
        case default.Code_AMTouchItemBoxToEveryOne:
            return default.strAMTouchItemBoxToEveryOne;
        // End:0xA1
        case default.Code_AMTouchItemBoxInWeapon:
            return default.strAMTouchItemBoxInWeapon;
        // End:0xAF
        case default.Code_AMTouchItemBoxInSkill:
            return default.strAMTouchItemBoxInSkill;
        // End:0xBD
        case default.Code_AMTouchItemBoxInFillAmmo:
            return default.strAMTouchItemBoxInFillAmmo;
        // End:0xCB
        case default.Code_AMDefenceToAlien:
            return default.strAMDefenceToAlien;
        // End:0xD9
        case default.Code_AMInfectToFail:
            return default.strAMInfectToFail;
        // End:0xE7
        case default.Code_AMYouwereSuperHero:
            return default.strAMYouwereSuperHero;
        // End:0xF5
        case default.Code_AMAppearSuperHero:
            return default.strAMAppearSuperHero;
        // End:0x103
        case default.Code_AMReadyTimeCountSuperAlien:
            return default.strAMReadyTimeCountSuperAlien;
        // End:0x111
        case default.Code_AMAppearSuperAlien:
            return default.strAMAppearSuperAlien;
        // End:0xFFFF
        default:
            //return;
            break;
    }    
}

static function float GetLifeTime(int Switch)
{
    switch(Switch)
    {
        // End:0x0F
        case default.Code_AMReadyTimeCount:
        // End:0x1D
        case default.Code_AMReadyTimeCountSuperAlien:
            return 1.0000000;
        // End:0x25
        case default.Code_AMDefenceToAlien:
        // End:0x33
        case default.Code_AMInfectToFail:
            return 1.8000000;
        // End:0xFFFF
        default:
            return super(LocalMessage).GetLifeTime(Switch);
            break;
    }
    //return;    
}

defaultproperties
{
    Code_AMAppearHostAlien=30001
    Code_AMTransformdHostAlien=30002
    Code_AMTransformdMasterAlien=30003
    Code_AMHeadShotAlien=30004
    Code_AMSelectedHero=30005
    Code_AMAcquiredAttackBuff=30006
    Code_AMReadyTimeCount=30007
    Code_AMInfectdHero=30008
    Code_AMDropRandomItemBox=30009
    Code_AMTouchItemBoxToEveryOne=30010
    Code_AMTouchItemBoxInWeapon=30011
    Code_AMTouchItemBoxInSkill=30012
    Code_AMTouchItemBoxInFillAmmo=30013
    Code_AMDefenceToAlien=30014
    Code_AMInfectToFail=30015
    Code_AMYouwereSuperHero=30016
    Code_AMAppearSuperHero=30017
    Code_AMReadyTimeCountSuperAlien=30018
    Code_AMAppearSuperAlien=30019
    strAMAppearHostAlien="Alien ????????????"
    strAMTransformdHostAlien="Alien ???????????????? Host"
    strAMTransformdMasterAlien="Alien ???????????????? Master"
    strAMHeadShotAlien="??????????????????????????????????????"
    strAMSelectedHero="[%0] ????????????????? HERO"
    strAMAcquiredAttackBuff="Alien ??????????? %0 ??????"
    strAMReadyTimeCount="??????????????????????????????? %0"
    strAMInfectedHero="[%0] ????????????"
    strAMDropRandomItemBox="???????????????????????????????"
    strAMTouchItemBoxToEveryOne="[%0] ????????????????????"
    strAMTouchItemBoxInWeapon="???????????"
    strAMTouchItemBoxInSkill="?????? Skill"
    strAMTouchItemBoxInFillAmmo="???????????????????"
    strAMDefenceToAlien="????????????????????????"
    strAMInfectToFail="?????????????????? ????????????????????????????"
    strAMYouwereSuperHero="????????????????????????????????"
    strAMAppearSuperHero="???????????????????????"
    strAMReadyTimeCountSuperAlien="???????????????? %0 ??????"
    strAMAppearSuperAlien="???????????????????????"
    DrawColor=(R=255,G=255,B=255,A=255)
    StackMode=0
}