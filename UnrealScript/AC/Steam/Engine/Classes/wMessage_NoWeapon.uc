/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wMessage_NoWeapon.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:2
 *
 *******************************************************************************/
class wMessage_NoWeapon extends LocalMessage
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    notplaceable;

var localized string strNoWeapon;

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    return "";
}

static simulated function ClientReceive(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    local string S;
    local wWeaponBaseParams resParam;

    resParam = P.Level.WeaponMgr.GetBaseParam(Switch);
    // End:0x9b
    if(resParam != none)
    {
        S = resParam.strName $ default.strNoWeapon;
        P.Player.Console.AddMessageItem(P.Player.Console.ConstructMessageItem(S, 6));
    }
}

defaultproperties
{
    strNoWeapon=" is used up."
}