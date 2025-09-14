/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\TeamSayMessagePlus.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:2
 *
 *******************************************************************************/
class TeamSayMessagePlus extends StringMessagePlus
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

static function RenderComplexMessage(Canvas Canvas, out float XL, out float YL, optional string MessageString, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    local string LocationName;

    // End:0x0d
    if(RelatedPRI_1 == none)
    {
        return;
    }
    Canvas.SetDrawColor(0, byte(255), 0);
    Canvas.DrawText(RelatedPRI_1.PlayerName $ " ", false);
    Canvas.SetPos(Canvas.CurX, Canvas.CurY - YL);
    LocationName = RelatedPRI_1.GetLocationName();
    // End:0xcf
    if(LocationName != "")
    {
        Canvas.SetDrawColor(0, 128, byte(255));
        Canvas.DrawText(" (" $ LocationName $ "):", false);
    }
    // End:0xe0
    else
    {
        Canvas.DrawText(": ", false);
    }
    Canvas.SetPos(Canvas.CurX, Canvas.CurY - YL);
    Canvas.SetDrawColor(0, 128, 0);
    Canvas.DrawText(MessageString, false);
}

static function string AssembleString(HUD myHUD, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional string MessageString)
{
    local string LocationName;

    // End:0x0e
    if(RelatedPRI_1 == none)
    {
        return "";
    }
    LocationName = RelatedPRI_1.GetLocationName();
    // End:0x4d
    if(LocationName == "")
    {
        return RelatedPRI_1.PlayerName @ ":" @ MessageString;
    }
    // End:0x78
    else
    {
        return RelatedPRI_1.PlayerName $ "  (" $ LocationName $ "): " $ MessageString;
    }
}

defaultproperties
{
    bBeep=true
    Lifetime=6
    DrawColor=(R=128,G=255,B=128,A=255)
}