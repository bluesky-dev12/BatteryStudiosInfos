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
    local wItemResourceParam resParam;

    resParam = P.Level.GameMgr.GetItemResourceParam(Switch);
    // End:0xA8
    if(resParam.iItemResourceID != -1)
    {
        S = resParam.strResName $ default.strNoWeapon;
        P.Player.Console.AddMessageItem(P.Player.Console.ConstructMessageItem(S, 6));
    }
    //return;    
}

defaultproperties
{
    strNoWeapon="???????????????"
}