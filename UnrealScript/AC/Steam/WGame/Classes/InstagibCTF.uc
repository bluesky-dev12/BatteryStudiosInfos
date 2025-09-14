/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\InstagibCTF.uc
 * Package Imports:
 *	WGame
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:5
 *	Functions:4
 *
 *******************************************************************************/
class InstagibCTF extends wCTFGame
    dependson(wCTFGame)
    dependson(MutInstaGib)
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    config();

var globalconfig bool bZoomInstagib;
var globalconfig bool bAllowBoost;
var globalconfig bool bLowGrav;
var localized string ZoomDisplayText;
var localized string ZoomDescText;

static function bool AllowMutator(string MutatorClassName)
{
    // End:0x0e
    if(MutatorClassName == "")
    {
        return false;
    }
    // End:0x1e
    if(IsVehicleMutator(MutatorClassName))
    {
        return false;
    }
    // End:0x3d
    if(MutatorClassName ~= "wGame.MutInstagib")
    {
        return false;
    }
    // End:0x60
    if(MutatorClassName ~= "wGame.MutZoomInstagib")
    {
        return false;
    }
    return super(GameInfo).AllowMutator(MutatorClassName);
}

static function FillPlayInfo(PlayInfo PlayInfo)
{
    super(TeamGame).FillPlayInfo(PlayInfo);
    PlayInfo.AddSetting(default.RulesGroup, "bAllowBoost", class'MutInstaGib'.default.BoostDisplayText, 0, 1, "Check");
    PlayInfo.AddSetting(default.RulesGroup, "bZoomInstagib", default.ZoomDisplayText, 0, 1, "Check");
    PlayInfo.AddSetting(default.RulesGroup, "bLowGrav", class'MutLowGrav'.default.Description, 0, 1, "Check");
}

static event string GetDescriptionText(string PropName)
{
    switch(PropName)
    {
        // End:0x26
        case "bAllowBoost":
            return class'MutInstaGib'.default.BoostDescText;
        // End:0x3e
        case "bZoomInstagib":
            return default.ZoomDescText;
        // End:0x5a
        case "bLowGrav":
            return class'MutLowGrav'.default.Description;
        // End:0xffff
        default:
            return super(TeamGame).GetDescriptionText(PropName);
    }
}

static event bool AcceptPlayInfoProperty(string PropertyName)
{
    // End:0x20
    if(InStr(PropertyName, "bWeaponStay") != -1)
    {
        return false;
    }
    // End:0x49
    if(InStr(PropertyName, "bAllowWeaponThrowing") != -1)
    {
        return false;
    }
    return super(TeamGame).AcceptPlayInfoProperty(PropertyName);
}

defaultproperties
{
    bAllowBoost=true
    ZoomDisplayText="?? ??"
    ZoomDescText="??? ?? ???? ?? ????."
    bAllowTrans=true
    bDefaultTranslocator=true
    MutatorClass="wGame.InstagibMutator"
    GameName="??? CTF"
    DecoTextName="wGame.InstagibCTF"
    Acronym="ICTF"
}