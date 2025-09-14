class SayMessagePlus extends StringMessagePlus
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var Color RedTeamColor;
var Color BlueTeamColor;

static function RenderComplexMessage(Canvas Canvas, out float XL, out float YL, optional string MessageString, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    // End:0x0D
    if(RelatedPRI_1 == none)
    {
        return;
    }
    Canvas.SetDrawColor(0, byte(255), 0);
    Canvas.DrawText(RelatedPRI_1.PlayerName $ ": ", false);
    Canvas.SetPos(Canvas.CurX, Canvas.CurY - YL);
    Canvas.SetDrawColor(0, 128, 0);
    Canvas.DrawText(MessageString, false);
    //return;    
}

static function string AssembleString(HUD myHUD, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional string MessageString)
{
    // End:0x0E
    if(RelatedPRI_1 == none)
    {
        return "";
    }
    // End:0x26
    if(RelatedPRI_1.PlayerName == "")
    {
        return "";
    }
    return (RelatedPRI_1.PlayerName $ ": ") @ MessageString;
    //return;    
}

static function Color GetConsoleColor(PlayerReplicationInfo RelatedPRI_1)
{
    // End:0x27
    if((RelatedPRI_1 == none) || RelatedPRI_1.Team == none)
    {
        return default.DrawColor;
    }
    // End:0x4D
    if(RelatedPRI_1.Team.TeamIndex == 0)
    {
        return default.RedTeamColor;        
    }
    else
    {
        return default.BlueTeamColor;
    }
    //return;    
}

defaultproperties
{
    RedTeamColor=(R=255,G=64,B=64,A=255)
    BlueTeamColor=(R=64,G=192,B=255,A=255)
    bBeep=true
    Lifetime=6
    DrawColor=(R=255,G=255,B=0,A=255)
}