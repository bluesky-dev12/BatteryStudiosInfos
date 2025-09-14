/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\MutMovementModifier.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:3
 *
 *******************************************************************************/
class MutMovementModifier extends Mutator
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    config();

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
}

static function FillPlayInfo(PlayInfo PlayInfo)
{
    super(Info).FillPlayInfo(PlayInfo);
    PlayInfo.AddSetting(default.RulesGroup, "AirControl", class'DMMutator'.default.DMMutPropsDisplayText[1], 0, 1, "Text", "8;0.1:10.0");
}

static event string GetDescriptionText(string PropName)
{
    switch(PropName)
    {
        // End:0x27
        case "AirControl":
            return class'DMMutator'.default.DMMutDescText[1];
        // End:0xffff
        default:
            return super(Info).GetDescriptionText(PropName);
    }
}

defaultproperties
{
    AirControl=0.350
    FriendlyName="?? ???"
    Description="??? ??? ??, ????? ??? ??? ?????."
}