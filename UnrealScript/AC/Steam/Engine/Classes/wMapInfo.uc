/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wMapInfo.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:56
 *	Functions:1
 *
 *******************************************************************************/
class wMapInfo extends Object
    native;

var int MapID;
var string File;
var string FriendlyName;
var int MapDifficulty;
var string MapDifficultyDisplay;
var float SupplyHealth;
var float SupplyHelicopter;
var float SupplyBombing;
var float SupplyUAV;
var string ResourceLoadingImage;
var string ResourceMapImage;
var string ResourceSupplyImages[3];
var string ResourceMiniMapInfoImage[4];
var string BGM1;
var int BGM1_Times[4];
var string BGM2;
var int BGM2_Times[4];
var byte ModeFFA;
var byte ModeTDM;
var byte ModeSD;
var byte ModeDOA;
var byte ModeDomination;
var byte ModeSabotage;
var byte ModeBotFFA;
var byte ModeBotTDM;
var byte ModeBotDomination;
var byte ModeBotBeginner;
var byte ModeDefence;
var byte ModeInfection;
var int ModeFFA_Max;
var int ModeTDM_Max;
var int ModeSD_Max;
var int ModeDOA_Max;
var int ModeDomination_Max;
var int ModeSabotage_Max;
var int ModeBotFFA_Max;
var int ModeBotTDM_Max;
var int ModeBotDomination_Max;
var int ModeBotBeginner_Max;
var int ModeDefence_Max;
var int ModeInfection_Max;
var byte SubMode_All;
var byte SubMode_Knife;
var byte SubMode_Pistol;
var byte SubMode_Grenade;
var byte SubMode_Rocket;
var byte SubMode_Sniper;
var byte SubMode_SniperX;
var byte SubMode_FlameThower;
var byte SubMode_ShotGun;
var byte SubMode_MG;
var byte ModeTDM_RandomRespawn;
var byte ModeDOMI_RandomRespawn;
var byte GameLevel;
var int MapDisplaySort;
var string NewMapIcon;

function CopyTo(wMapInfo Dest)
{
    Dest.MapID = MapID;
    Dest.File = File;
    Dest.FriendlyName = FriendlyName;
    Dest.MapDifficulty = MapDifficulty;
    Dest.MapDifficultyDisplay = MapDifficultyDisplay;
    Dest.SupplyHealth = SupplyHealth;
    Dest.SupplyHelicopter = SupplyHelicopter;
    Dest.SupplyBombing = SupplyBombing;
    Dest.SupplyUAV = SupplyUAV;
    Dest.ModeFFA = ModeFFA;
    Dest.ModeTDM = ModeTDM;
    Dest.ModeSD = ModeSD;
    Dest.ModeDOA = ModeDOA;
    Dest.ModeDomination = ModeDomination;
    Dest.ModeSabotage = ModeSabotage;
    Dest.ModeBotFFA = ModeBotFFA;
    Dest.ModeBotTDM = ModeBotTDM;
    Dest.ModeBotDomination = ModeBotDomination;
    Dest.ModeBotBeginner = ModeBotBeginner;
    Dest.ModeDefence = ModeDefence;
    Dest.ModeInfection = ModeInfection;
    Dest.ModeFFA_Max = ModeFFA_Max;
    Dest.ModeTDM_Max = ModeTDM_Max;
    Dest.ModeSD_Max = ModeSD_Max;
    Dest.ModeDOA_Max = ModeDOA_Max;
    Dest.ModeDomination_Max = ModeDomination_Max;
    Dest.ModeSabotage_Max = ModeSabotage_Max;
    Dest.ModeBotFFA_Max = ModeBotFFA_Max;
    Dest.ModeBotTDM_Max = ModeBotTDM_Max;
    Dest.ModeBotDomination_Max = ModeBotDomination_Max;
    Dest.ModeBotBeginner_Max = ModeBotBeginner_Max;
    Dest.ModeDefence_Max = ModeDefence_Max;
    Dest.ModeInfection_Max = ModeInfection_Max;
    Dest.SubMode_All = SubMode_All;
    Dest.SubMode_Sniper = SubMode_Sniper;
    Dest.SubMode_SniperX = SubMode_SniperX;
    Dest.SubMode_Rocket = SubMode_Rocket;
    Dest.SubMode_Knife = SubMode_Knife;
    Dest.SubMode_ShotGun = SubMode_ShotGun;
    Dest.SubMode_MG = SubMode_MG;
    Dest.SubMode_Pistol = SubMode_Pistol;
    Dest.SubMode_FlameThower = SubMode_FlameThower;
    Dest.SubMode_Grenade = SubMode_Grenade;
    Dest.ModeTDM_RandomRespawn = ModeTDM_RandomRespawn;
    Dest.ModeDOMI_RandomRespawn = ModeDOMI_RandomRespawn;
    Dest.ResourceLoadingImage = ResourceLoadingImage;
    Dest.ResourceMapImage = ResourceMapImage;
    Dest.ResourceSupplyImages[0] = ResourceSupplyImages[0];
    Dest.ResourceSupplyImages[1] = ResourceSupplyImages[1];
    Dest.ResourceSupplyImages[2] = ResourceSupplyImages[2];
    Dest.ResourceMiniMapInfoImage[0] = ResourceMiniMapInfoImage[0];
    Dest.ResourceMiniMapInfoImage[1] = ResourceMiniMapInfoImage[1];
    Dest.ResourceMiniMapInfoImage[2] = ResourceMiniMapInfoImage[2];
    Dest.ResourceMiniMapInfoImage[3] = ResourceMiniMapInfoImage[3];
    Dest.BGM1 = BGM1;
    Dest.BGM1_Times[0] = BGM1_Times[0];
    Dest.BGM1_Times[1] = BGM1_Times[1];
    Dest.BGM1_Times[2] = BGM1_Times[2];
    Dest.BGM1_Times[3] = BGM1_Times[3];
    Dest.BGM2 = BGM2;
    Dest.BGM2_Times[0] = BGM2_Times[0];
    Dest.BGM2_Times[1] = BGM2_Times[1];
    Dest.BGM2_Times[2] = BGM2_Times[2];
    Dest.BGM2_Times[3] = BGM2_Times[3];
    Dest.MapDisplaySort = MapDisplaySort;
    Dest.NewMapIcon = NewMapIcon;
}
