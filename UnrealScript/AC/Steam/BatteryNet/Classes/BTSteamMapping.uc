/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path BatteryNet\Classes\BTSteamMapping.uc
 * Package Imports:
 *	BatteryNet
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class BTSteamMapping extends Object
    native;

// Export UBTSteamMapping::execGetPayURL(FFrame&, void* const)
native static function string GetPayURL(string AccountID, byte connectAlpha);
