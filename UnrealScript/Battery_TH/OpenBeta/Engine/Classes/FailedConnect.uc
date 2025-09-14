class FailedConnect extends LocalMessage
    abstract
    notplaceable
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var localized string FailMessage[4];

static function int GetFailSwitch(string FailString)
{
    // End:0x14
    if(FailString ~= "NEEDPW")
    {
        return 0;
    }
    // End:0x29
    if(FailString ~= "WRONGPW")
    {
        return 1;
    }
    // End:0x43
    if(FailString ~= "GAMESTARTED")
    {
        return 2;
    }
    return 3;
    //return;    
}

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    return default.FailMessage[Clamp(Switch, 0, 3)];
    //return;    
}

defaultproperties
{
    FailMessage[0]="?? ?? ??.  ????? ?????."
    FailMessage[1]="?? ?? ??.  ??? ???????."
    FailMessage[2]="?? ?? ??.  ??? ?? ???????."
    FailMessage[3]="?? ?? ??."
    bIsUnique=true
    bFadeMessage=true
    DrawColor=(R=255,G=0,B=128,A=255)
    FontSize=1
}