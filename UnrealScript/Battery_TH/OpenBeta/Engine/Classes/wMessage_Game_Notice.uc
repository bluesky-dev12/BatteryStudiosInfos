class wMessage_Game_Notice extends wMessage_Game
    notplaceable
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var string strGameNotice;
var int Code_GameNotice;

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    local string strTemp;

    strTemp = "+" $ string(Switch);
    return strTemp;
    //return;    
}

static simulated function ClientReceive(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    super.ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
    //return;    
}

defaultproperties
{
    Code_GameNotice=1
    bIsPartiallyUnique=true
    Lifetime=10
    DrawColor=(R=255,G=0,B=0,A=255)
    StackMode=0
    PosY=0.1575000
    FontSize=18
}