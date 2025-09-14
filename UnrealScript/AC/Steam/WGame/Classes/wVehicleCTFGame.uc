/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wVehicleCTFGame.uc
 * Package Imports:
 *	WGame
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:3
 *
 *******************************************************************************/
class wVehicleCTFGame extends wCTFGame
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    config();

var(LoadingHints) private localized array<localized string> VCTFHints;

function bool AllowTransloc()
{
    return false;
}

static function bool NeverAllowTransloc()
{
    return true;
}

static function array<string> GetAllLoadHints(optional bool bThisClassOnly)
{
    local int i;
    local array<string> Hints;

    // End:0x25
    if(!bThisClassOnly || default.VCTFHints.Length == 0)
    {
        Hints = super(CTFGame).GetAllLoadHints();
    }
    i = 0;
    J0x2c:
    // End:0x5e [While If]
    if(i < default.VCTFHints.Length)
    {
        Hints[Hints.Length] = default.VCTFHints[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x2c;
    }
    return Hints;
}

defaultproperties
{
    VCTFHints=// Object reference not set to an instance of an object.
    
    bAllowTrans=true
    bDefaultTranslocator=true
    bAllowVehicles=true
    MapListType="XInterface.MapListVehicleCTF"
    MapPrefix="VCTF"
    BeaconName="VCTF"
    GameName="?? CTF"
    Description="???? ?? ??? ??? ??? ??? ? ????. ??? ??????? ??? ? ????."
    ScreenShotName="UT2004Thumbnails.VCTFShots"
    DecoTextName="WGame.wVehicleCTFGame"
    Acronym="VCTF"
}