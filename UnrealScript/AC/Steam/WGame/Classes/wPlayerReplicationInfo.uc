/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wPlayerReplicationInfo.uc
 * Package Imports:
 *	WGame
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:4
 *
 *******************************************************************************/
class wPlayerReplicationInfo extends TeamPlayerReplicationInfo
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var PlayerRecord Rec;
var bool bForceNoPlayerLights;
var bool bNoTeamSkins;

simulated function UpdatePrecacheMaterials();
simulated function SetCharacterName(string S)
{
    super(PlayerReplicationInfo).SetCharacterName(S);
    UpdateCharacter();
}

simulated event UpdateCharacter()
{
    Rec = class'wUtil'.static.FindPlayerRecord(CharacterName);
}

simulated function Material GetPortrait()
{
    // End:0x3a
    if(Rec.Portrait == none)
    {
        return Material(DynamicLoadObject("PlayerPictures.cDefault", class'Material'));
    }
    return Rec.Portrait;
}
