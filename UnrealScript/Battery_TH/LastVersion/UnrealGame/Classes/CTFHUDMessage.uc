class CTFHUDMessage extends LocalMessage
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var(Message) localized string YouHaveFlagString;
var(Message) localized string EnemyHasFlagString;
var(Message) Color RedColor;
var(Message) Color YellowColor;

static function Color GetColor(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2)
{
    // End:0x14
    if(Switch == 0)
    {
        return default.YellowColor;        
    }
    else
    {
        return default.RedColor;
    }
    //return;    
}

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    // End:0x14
    if(Switch == 0)
    {
        return default.YouHaveFlagString;        
    }
    else
    {
        return default.EnemyHasFlagString;
    }
    //return;    
}

defaultproperties
{
    YouHaveFlagString="??? ??????. ??? ?? ??????!"
    EnemyHasFlagString="??? ??????. ??? ???? ???!"
    RedColor=(R=255,G=0,B=0,A=255)
    YellowColor=(R=255,G=255,B=0,A=255)
    bIsPartiallyUnique=true
    bIsConsoleMessage=false
    bFadeMessage=true
    Lifetime=1
    DrawColor=(R=0,G=160,B=255,A=255)
    StackMode=2
    PosY=0.1000000
    FontSize=1
}