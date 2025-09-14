/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\MutGameSpeed.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:3
 *
 *******************************************************************************/
class MutGameSpeed extends Mutator
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    config();

var globalconfig float NewGameSpeed;

function PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    Level.Game.bAllowMPGameSpeed = true;
    Level.Game.SetGameSpeed(NewGameSpeed);
}

static function FillPlayInfo(PlayInfo PlayInfo)
{
    super(Info).FillPlayInfo(PlayInfo);
    PlayInfo.AddSetting(default.RulesGroup, "NewGameSpeed", class'GameInfo'.default.GIPropsDisplayText[3], 0, 0, "Text", "8;0.1:3.5");
}

static event string GetDescriptionText(string PropName)
{
    switch(PropName)
    {
        // End:0x2a
        case "NewGameSpeed":
            return class'GameInfo'.default.GIPropDescText[3];
        // End:0xffff
        default:
            return super(Info).GetDescriptionText(PropName);
    }
}

defaultproperties
{
    NewGameSpeed=1.0
    GroupName="GameSpeed"
    FriendlyName="?? ???"
    Description="?? ??? ?????"
}