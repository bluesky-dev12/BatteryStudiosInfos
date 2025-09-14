class IonCannonKillWarning extends CriticalEventPlus
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var() localized string CountDownTrailer;
var() localized string WarningString;

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    // End:0x1D
    if(Switch > 0)
    {
        return string(Switch) $ default.CountDownTrailer;        
    }
    else
    {
        return default.WarningString;
    }
    //return;    
}

static function GetPos(int Switch, out Object.EDrawPivot OutDrawPivot, out LocalMessage.EStackMode OutStackMode, out float OutPosX, out float OutPosY)
{
    super(LocalMessage).GetPos(Switch, OutDrawPivot, OutStackMode, OutPosX, OutPosY);
    // End:0x35
    if(Switch == 0)
    {
        OutPosY = 0.7500000;
    }
    //return;    
}

defaultproperties
{
    CountDownTrailer="..."
    WarningString="??! ?? ??? ?? ???? ????!"
    bIsUnique=false
    bIsPartiallyUnique=true
    Lifetime=1
}