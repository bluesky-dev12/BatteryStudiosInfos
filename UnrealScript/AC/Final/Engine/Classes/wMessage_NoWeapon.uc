class wMessage_NoWeapon extends LocalMessage
    notplaceable
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var localized string strNoWeapon;

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    return "";
    //return;    
}

static simulated function ClientReceive(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    local string S;
    local wWeaponBaseParams resParam;

    resParam = P.Level.WeaponMgr.GetBaseParam(Switch);
    // End:0xD1
    if(resParam != none)
    {
        S = resParam.strName $ default.strNoWeapon;
        P.myHUD.LocalizedMessage(default.Class, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject, S);
        P.Player.Console.AddMessageItem(P.Player.Console.ConstructMessageItem(S, 6));
    }
    //return;    
}

defaultproperties
{
    strNoWeapon=" is used up."
    bFadeMessage=true
    Lifetime=2
    PosY=0.3841700
    FontSize=22
}