class InstagibCTF extends wCTFGame
    config
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var globalconfig bool bZoomInstagib;
var globalconfig bool bAllowBoost;
var globalconfig bool bLowGrav;
var localized string ZoomDisplayText;
var localized string ZoomDescText;

static function bool AllowMutator(string MutatorClassName)
{
    // End:0x0E
    if(MutatorClassName == "")
    {
        return false;
    }
    // End:0x1E
    if(IsVehicleMutator(MutatorClassName))
    {
        return false;
    }
    // End:0x3D
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
    //return;    
}

static function FillPlayInfo(PlayInfo PlayInfo)
{
    super(TeamGame).FillPlayInfo(PlayInfo);
    PlayInfo.AddSetting(default.RulesGroup, "bAllowBoost", Class'WGame_Decompressed.MutInstaGib'.default.BoostDisplayText, 0, 1, "Check");
    PlayInfo.AddSetting(default.RulesGroup, "bZoomInstagib", default.ZoomDisplayText, 0, 1, "Check");
    PlayInfo.AddSetting(default.RulesGroup, "bLowGrav", Class'UnrealGame.MutLowGrav'.default.Description, 0, 1, "Check");
    //return;    
}

static event string GetDescriptionText(string PropName)
{
    switch(PropName)
    {
        // End:0x26
        case "bAllowBoost":
            return Class'WGame_Decompressed.MutInstaGib'.default.BoostDescText;
        // End:0x3E
        case "bZoomInstagib":
            return default.ZoomDescText;
        // End:0x5A
        case "bLowGrav":
            return Class'UnrealGame.MutLowGrav'.default.Description;
        // End:0xFFFF
        default:
            return super(TeamGame).GetDescriptionText(PropName);
            break;
    }
    //return;    
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
    //return;    
}

defaultproperties
{
    bAllowBoost=true
    ZoomDisplayText="?? ??"
    ZoomDescText="??? ?? ???? ?? ????."
    bAllowTrans=false
    bDefaultTranslocator=false
    MutatorClass="wGame.InstagibMutator"
    GameName="??? CTF"
    DecoTextName="wGame.InstagibCTF"
    Acronym="ICTF"
}