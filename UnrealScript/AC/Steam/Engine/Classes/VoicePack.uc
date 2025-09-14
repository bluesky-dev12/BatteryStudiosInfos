/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\VoicePack.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:4
 *
 *******************************************************************************/
class VoicePack extends Info
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    abstract
    notplaceable;

var() localized string VoicePackName;
var() localized string VoicePackDescription;

function ClientInitialize(PlayerReplicationInfo Sender, PlayerReplicationInfo Recipient, name MessageType, byte messageIndex);
static function PlayerSpeech(name Type, int Index, string Callsign, Actor PackOwner);
static function byte GetMessageIndex(name PhraseName)
{
    return 0;
}

static function int PickRandomTauntFor(Controller C, bool bNoMature, bool bNoHumanOnly)
{
    return 0;
}

defaultproperties
{
    LifeSpan=10.0
}