class wMessage_Game_ImpSystem extends wMessage_Game
    notplaceable
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var float PosY1;
var float PosY2;
var float fFadeOutTime;
var int Code_NoWeapon;
var int Code_NoThrowingGreanade;
var int Code_NoThrowingStun;
var int Code_NoThrowingSmoke;
var int Code_NoThrowingC4;
var int Code_NotHasAmmoRPG7;
var int Code_NotHasAmmoIncen;
var int Code_NotHasAmmoHellFire;
var int Code_NotHasPinpointBomb;
var int Code_NotHasAmmoSpiltGrenade;
var int Code_ChangeQS_0;
var int Code_ChangeQS_1;
var int Code_ChangeQS_2;
var int Code_ChangeQS_3;
var int Code_ChangeQS_4;
var int Code_ChangeQS_5;
var int Code_QuickSlotChangeFailed;
var int Code_ChangeQSInPlayerWalking;
var int Code_CloseQSTime;
var int Code_CloseQSDistance;
var int Code_CloseQSWindow;
var localized string strGameMode_TD;
var localized string strGameMode_FFA;
var localized string strGameMode_DOM;
var localized string strGameMode_SD;
var localized string strGameMode_SBT;
var localized string strNoWeapon;
var localized string strNoThrowingGreanade;
var localized string strNoThrowingSturn;
var localized string strNoThrowingSmoke;
var localized string strNoThrowingC4;
var localized string strNotHasAmmoRPG7;
var localized string strChangeQS[6];
var localized string strChangeQSInPlayerWalking;
var localized string strCloseQSTime;
var localized string strCloseQSDistance;
var localized string strQuickSlotChangeFailed;
var localized string strCloseQSWindow;
var localized string strNotHasAmmoIncen;
var localized string strNotHasAmmoPinpointBomb;
var localized string strNotHasAmmoHellFire;
var localized string StrNotHasAmmoSpiltGrenade;
var localized string strHoldWeapon;
var int Code_HoldWeapon;
var localized string strHoldFireByOverHeat;
var int Code_HoldFireOverHeat;
var string SoundNotReady;
var int Code_DFSupplyAmmo;
var localized string strDFSupplyAmmo;

static function float GetLifeTime(int Switch)
{
    switch(Switch)
    {
        // End:0x0F
        case default.Code_EnemyHelicopter:
        // End:0x17
        case default.Code_EnemyArtillery:
        // End:0x25
        case default.Code_EnemyUAV:
            return 6.0000000;
        // End:0xFFFF
        default:
            return super(LocalMessage).GetLifeTime(Switch);
            break;
    }
    //return;    
}

static function bool GotoHud(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    return true;
    //return;    
}

static function bool GotoBTConsole(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    return false;
    //return;    
}

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    switch(Switch)
    {
        // End:0x15
        case default.Code_CantProne:
            return default.strCantProne;
        // End:0x23
        case default.Code_EnemyHelicopter:
            return default.strEnemyHelicopter;
        // End:0x31
        case default.Code_EnemyArtillery:
            return default.strEnemyArtillery;
        // End:0x3F
        case default.Code_EnemyUAV:
            return default.strEnemyUAV;
        // End:0x4D
        case default.Code_NoThrowingGreanade:
            return default.strNoThrowingGreanade;
        // End:0x5B
        case default.Code_NoThrowingStun:
            return default.strNoThrowingSturn;
        // End:0x69
        case default.Code_NoThrowingSmoke:
            return default.strNoThrowingSmoke;
        // End:0x77
        case default.Code_NoThrowingC4:
            return default.strNoThrowingC4;
        // End:0x85
        case default.Code_NotHasAmmoRPG7:
            return default.strNotHasAmmoRPG7;
        // End:0x95
        case default.Code_ChangeQS_0:
            return default.strChangeQS[0];
        // End:0xA5
        case default.Code_ChangeQS_1:
            return default.strChangeQS[1];
        // End:0xB6
        case default.Code_ChangeQS_2:
            return default.strChangeQS[2];
        // End:0xC7
        case default.Code_ChangeQS_3:
            return default.strChangeQS[3];
        // End:0xD8
        case default.Code_ChangeQS_4:
            return default.strChangeQS[4];
        // End:0xE9
        case default.Code_ChangeQS_5:
            return default.strChangeQS[5];
        // End:0xF7
        case default.Code_QuickSlotChangeFailed:
            return default.strQuickSlotChangeFailed;
        // End:0x105
        case default.Code_ChangeQSInPlayerWalking:
            return default.strChangeQSInPlayerWalking;
        // End:0x113
        case default.Code_CloseQSTime:
            return default.strCloseQSTime;
        // End:0x121
        case default.Code_CloseQSDistance:
            return default.strCloseQSDistance;
        // End:0x12F
        case default.Code_CloseQSWindow:
            return default.strCloseQSWindow;
        // End:0x13D
        case default.Code_NotHasAmmoIncen:
            return default.strNotHasAmmoIncen;
        // End:0x14B
        case default.Code_NotHasPinpointBomb:
            return default.strNotHasAmmoPinpointBomb;
        // End:0x159
        case default.Code_NotHasAmmoHellFire:
            return default.strNotHasAmmoHellFire;
        // End:0x167
        case default.Code_NotHasAmmoSpiltGrenade:
            return default.StrNotHasAmmoSpiltGrenade;
        // End:0x175
        case default.Code_HoldWeapon:
            return default.strHoldWeapon;
        // End:0x183
        case default.Code_HoldFireOverHeat:
            return default.strHoldFireByOverHeat;
        // End:0x191
        case default.Code_DFSupplyAmmo:
            return default.strDFSupplyAmmo;
        // End:0xFFFF
        default:
            return super.GetString(Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
            break;
    }
    //return;    
}

static function bool IsMessageMode(int iCode)
{
    switch(iCode)
    {
        // End:0x0F
        case default.Code_SDAllyBombPlanted:
        // End:0x17
        case default.Code_SDEnemyBombPlanted:
        // End:0x1F
        case default.Code_SDAllyBombDefused:
        // End:0x27
        case default.Code_SDEnemyBombDefused:
        // End:0x2F
        case default.Code_SDAllyGotTheBomb:
        // End:0x37
        case default.Code_SDAllyLostTheBomb:
        // End:0x3F
        case default.Code_SDIGotTheBomb:
        // End:0x47
        case default.Code_SDAllyThrowTheBomb:
        // End:0x4F
        case default.Code_SBTAllyGotTheBomb:
        // End:0x57
        case default.Code_SBTEnemyGotTheBomb:
        // End:0x5F
        case default.Code_SBTIGotTheBomb:
        // End:0x67
        case default.Code_SBTAllyLostTheBomb:
        // End:0x6F
        case default.Code_SBTAllyBombPlanted:
        // End:0x77
        case default.Code_SBTEnemyBombPlanted:
        // End:0x7F
        case default.Code_DOMAllyCapturedAll:
        // End:0x87
        case default.Code_DOMEnemyCapturedAll:
        // End:0x8F
        case default.Code_DOMAllyCapturedA:
        // End:0x97
        case default.Code_DOMAllyCapturedB:
        // End:0x9F
        case default.Code_DOMAllyCapturedC:
        // End:0xA7
        case default.Code_DOMEnemyCapturedA:
        // End:0xAF
        case default.Code_DOMEnemyCapturedB:
        // End:0xB9
        case default.Code_DOMEnemyCapturedC:
            return true;
        // End:0xFFFF
        default:
            return false;
            break;
    }
    //return;    
}

static function bool IsMessageSystem(int iCode)
{
    switch(iCode)
    {
        // End:0x0F
        case default.Code_CantProne:
        // End:0x17
        case default.Code_EnemyHelicopter:
        // End:0x1F
        case default.Code_EnemyArtillery:
        // End:0x27
        case default.Code_EnemyUAV:
        // End:0x2F
        case default.Code_NoThrowingGreanade:
        // End:0x37
        case default.Code_NoThrowingStun:
        // End:0x3F
        case default.Code_NoThrowingSmoke:
        // End:0x47
        case default.Code_NoThrowingC4:
        // End:0x4F
        case default.Code_NotHasAmmoRPG7:
        // End:0x57
        case default.Code_ChangeQS_0:
        // End:0x5F
        case default.Code_ChangeQS_1:
        // End:0x67
        case default.Code_ChangeQS_2:
        // End:0x6F
        case default.Code_ChangeQS_3:
        // End:0x77
        case default.Code_ChangeQS_4:
        // End:0x7F
        case default.Code_ChangeQS_5:
        // End:0x87
        case default.Code_QuickSlotChangeFailed:
        // End:0x8F
        case default.Code_ChangeQSInPlayerWalking:
        // End:0x97
        case default.Code_CloseQSTime:
        // End:0x9F
        case default.Code_CloseQSDistance:
        // End:0xA7
        case default.Code_CloseQSWindow:
        // End:0xAF
        case default.Code_NotHasAmmoIncen:
        // End:0xB7
        case default.Code_NotHasPinpointBomb:
        // End:0xBF
        case default.Code_NotHasAmmoHellFire:
        // End:0xC7
        case default.Code_NotHasAmmoSpiltGrenade:
        // End:0xCF
        case default.Code_HoldWeapon:
        // End:0xD9
        case default.Code_HoldFireOverHeat:
            return true;
        // End:0xFFFF
        default:
            return false;
            break;
    }
    //return;    
}

static simulated function ClientReceive(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    super.ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
    switch(Switch)
    {
        // End:0x31
        case default.Code_HoldFireOverHeat:
            // End:0x34
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

defaultproperties
{
    PosY1=0.3667000
    PosY2=0.4025000
    fFadeOutTime=1.0000000
    Code_NoWeapon=20001
    Code_NoThrowingGreanade=20002
    Code_NoThrowingStun=20003
    Code_NoThrowingSmoke=20004
    Code_NoThrowingC4=20005
    Code_NotHasAmmoRPG7=20006
    Code_NotHasAmmoIncen=20018
    Code_NotHasAmmoHellFire=20023
    Code_NotHasPinpointBomb=20019
    Code_NotHasAmmoSpiltGrenade=20020
    Code_ChangeQS_0=20007
    Code_ChangeQS_1=20008
    Code_ChangeQS_2=20009
    Code_ChangeQS_3=20010
    Code_ChangeQS_4=20011
    Code_ChangeQS_5=20012
    Code_QuickSlotChangeFailed=20013
    Code_ChangeQSInPlayerWalking=20014
    Code_CloseQSTime=20015
    Code_CloseQSDistance=20016
    Code_CloseQSWindow=20017
    strGameMode_TD="[Team Deathmatch]"
    strGameMode_FFA="[Free-For-All]"
    strGameMode_DOM="[Domination]"
    strGameMode_SD="[Search & Destroy]"
    strGameMode_SBT="[Demolition]"
    strNoWeapon=" is used up."
    strNoThrowingGreanade="Out of grenades."
    strNoThrowingSmoke="Out of smoke grenades."
    strNoThrowingC4="Out of timed C4."
    strNotHasAmmoRPG7="Out of RPG ammo."
    strChangeQS[0]="Changed to the weapon in the default slot."
    strChangeQS[1]="Changed to the weapon in quick slot 1."
    strChangeQS[2]="Changed to the weapon in quick slot 2."
    strChangeQS[3]="Changed to the weapon in quick slot 3."
    strChangeQS[4]="Changed to the weapon in quick slot 4."
    strChangeQS[5]="Changed to the weapon in quick slot 5."
    strChangeQSInPlayerWalking="Your weapons will change on next respawn."
    strCloseQSTime="The quick slot window closed because time expired."
    strCloseQSDistance="The quick slot window closed because you left the respawn area."
    strQuickSlotChangeFailed="Unable to change quick slots."
    strCloseQSWindow="The quick slot window was closed by using an attack action."
    strNotHasAmmoIncen="Out of incendiaries."
    strNotHasAmmoHellFire="Out of Hellfire missiles."
    StrNotHasAmmoSpiltGrenade="Out of cluster grenades."
    strHoldWeapon="Hold Weapon!!!"
    Code_HoldWeapon=20021
    strHoldFireByOverHeat="Unable to use while overheated."
    Code_HoldFireOverHeat=20022
    SoundNotReady="Warfare_Sound_ATS.cb.ats_cb_use_fail"
    Code_DFSupplyAmmo=20024
    bIsPartiallyUnique=true
    Lifetime=3
    DrawColor=(R=255,G=255,B=255,A=255)
    DrawPivot=0
    StackMode=0
    PosY=0.3841700
    FontSize=22
}