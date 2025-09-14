class MutGameSpeed extends Mutator
    config
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var globalconfig float NewGameSpeed;

function PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    Level.Game.bAllowMPGameSpeed = true;
    Level.Game.SetGameSpeed(NewGameSpeed);
    //return;    
}

static function FillPlayInfo(PlayInfo PlayInfo)
{
    super(Info).FillPlayInfo(PlayInfo);
    PlayInfo.AddSetting(default.RulesGroup, "NewGameSpeed", Class'Engine.GameInfo'.default.GIPropsDisplayText[3], 0, 0, "Text", "8;0.1:3.5");
    //return;    
}

static event string GetDescriptionText(string PropName)
{
    switch(PropName)
    {
        // End:0x2A
        case "NewGameSpeed":
            return Class'Engine.GameInfo'.default.GIPropDescText[3];
        // End:0xFFFF
        default:
            return super(Info).GetDescriptionText(PropName);
            break;
    }
    //return;    
}

defaultproperties
{
    NewGameSpeed=1.0000000
    GroupName="GameSpeed"
    FriendlyName="?? ???"
    Description="?? ??? ?????"
}