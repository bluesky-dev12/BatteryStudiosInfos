class wAlienGameParam extends Object
    native;

const MAX_ALIEN_HOST_LV = 3;
const MAX_ALIEN_MASTER_LV = 5;
const MAX_ALIEN_WAITING_TIME = 20;
const MAX_ALIEN_ATK_BUFFER_LV = 10;

var byte PlayerStart_Alien_Count[3];
var byte PlayerStart_Hero_Count[3];
var byte PlayerStart_Hero_Appear_Per[3];
var float fGunAttackDamagePer[7];
var float fAlien_Hit_Delay_Time;
var float fAlien_Hit_Move_Time;
var float fAlien_Hit_Move_Speed;
var float fAttackBuffValue[10];
var int iBaseAlienMaxHP[3];
var int iHostAlienMaxHP[3];
var int iMasterAlienMaxHP[3];
var byte AlienKnockBack_UseDamage;
var float AlienKnockBack_Time;
var float AlienKnockBack_Momentum;
var int AlienSupplyPackWeaponArray[10];
var byte AlienSupplyPackWeaponCount;
var float AlienSupplyPackDropTime;
var byte AlienSupplyPackOneTimeCount[3];
var byte AlienSupplyPackDropMaxCount[3];
var byte AlienSupplyPackDropTryCount[3];
