/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wMessage_Game_Notice.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:2
 *
 *******************************************************************************/
class wMessage_Game_Notice extends wMessage_Game
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    notplaceable;

var string strGameNotice;
var int Code_GameNotice;

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    local string strTemp;

    strTemp = "+" $ string(Switch);
    return strTemp;
}

static simulated function ClientReceive(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    super.ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
}

defaultproperties
{
    Code_GameNotice=1
    bIsPartiallyUnique=true
    Lifetime=10
    DrawColor=(R=255,G=0,B=0,A=255)
    StackMode=0
    PosY=0.15750
    FontSize=18
}