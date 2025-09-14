class MutMovementModifier extends Mutator
    config
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var() globalconfig bool bMegaSpeed;
var() globalconfig float AirControl;

function ModifyPlayer(Pawn Other)
{
    Other.AirControl = AirControl;
    // End:0x33
    if(NextMutator != none)
    {
        NextMutator.ModifyPlayer(Other);
    }
    //return;    
}

static function FillPlayInfo(PlayInfo PlayInfo)
{
    super(Info).FillPlayInfo(PlayInfo);
    PlayInfo.AddSetting(default.RulesGroup, "AirControl", Class'UnrealGame_Decompressed.DMMutator'.default.DMMutPropsDisplayText[1], 0, 1, "Text", "8;0.1:10.0");
    //return;    
}

static event string GetDescriptionText(string PropName)
{
    switch(PropName)
    {
        // End:0x27
        case "AirControl":
            return Class'UnrealGame_Decompressed.DMMutator'.default.DMMutDescText[1];
        // End:0xFFFF
        default:
            return super(Info).GetDescriptionText(PropName);
            break;
    }
    //return;    
}

defaultproperties
{
    AirControl=0.3500000
    FriendlyName="?? ???"
    Description="??? ??? ??, ????? ??? ??? ?????."
}