/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\IonCannonKillWarning.uc
 * Package Imports:
 *	WGame
 *	Gameplay
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:2
 *
 *******************************************************************************/
class IonCannonKillWarning extends CriticalEventPlus
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var() localized string CountDownTrailer;
var() localized string WarningString;

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    // End:0x1d
    if(Switch > 0)
    {
        return string(Switch) $ default.CountDownTrailer;
    }
    // End:0x23
    else
    {
        return default.WarningString;
    }
}

static function GetPos(int Switch, out Core.Object.EDrawPivot OutDrawPivot, out Engine.LocalMessage.EStackMode OutStackMode, out float OutPosX, out float OutPosY)
{
    super(LocalMessage).GetPos(Switch, OutDrawPivot, OutStackMode, OutPosX, OutPosY);
    // End:0x35
    if(Switch == 0)
    {
        OutPosY = 0.750;
    }
}

defaultproperties
{
    CountDownTrailer="..."
    WarningString="??! ?? ??? ?? ???? ????!"
    bIsUnique=true
    bIsPartiallyUnique=true
    Lifetime=1
}