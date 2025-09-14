/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wEntryGameInfo.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:4
 *
 *******************************************************************************/
class wEntryGameInfo extends GameInfo
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var bool bLoadedGameTextures;
var bool bLoadedGameStaticMeshes;
var bool bLoadedGameSkeletalMeshes;

event PostLogin(PlayerController NewPlayer)
{
    super.PostLogin(NewPlayer);
    // End:0x39
    if(NewPlayer != none)
    {
        NewPlayer.ReceiveLocalizedMessage(class'StartupMessage', 0, NewPlayer.PlayerReplicationInfo);
    }
}

static function PrecacheGameTextures(LevelInfo myLevel)
{
    // End:0x0e
    if(default.bLoadedGameTextures == true)
    {
        return;
    }
    myLevel.PCI.static.PrecacheGameTextures(myLevel);
    default.bLoadedGameTextures = true;
}

static function PrecacheGameStaticMeshes(LevelInfo myLevel)
{
    // End:0x0e
    if(default.bLoadedGameStaticMeshes == true)
    {
        return;
    }
    myLevel.PCI.static.PrecacheGameStaticMeshes(myLevel);
    default.bLoadedGameStaticMeshes = true;
}

static function PrecacheGameSkeletalMeshes(LevelInfo myLevel)
{
    // End:0x0e
    if(default.bLoadedGameSkeletalMeshes == true)
    {
        return;
    }
    myLevel.PCI.static.PrecacheGameSkeletalMeshes(myLevel);
    default.bLoadedGameSkeletalMeshes = true;
}
