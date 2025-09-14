class wPlayerReplicationInfo extends TeamPlayerReplicationInfo
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var PlayerRecord Rec;
var bool bForceNoPlayerLights;
var bool bNoTeamSkins;

simulated function UpdatePrecacheMaterials()
{
    //return;    
}

simulated function SetCharacterName(string S)
{
    super(PlayerReplicationInfo).SetCharacterName(S);
    UpdateCharacter();
    //return;    
}

simulated event UpdateCharacter()
{
    Rec = Class'WGame_Decompressed.wUtil'.static.FindPlayerRecord(CharacterName);
    //return;    
}

simulated function Material GetPortrait()
{
    // End:0x3A
    if(Rec.Portrait == none)
    {
        return Material(DynamicLoadObject("PlayerPictures.cDefault", Class'Engine.Material'));
    }
    return Rec.Portrait;
    //return;    
}
