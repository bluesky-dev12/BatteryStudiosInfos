/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\PrecacheGameClient.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:3
 *
 *******************************************************************************/
class PrecacheGameClient extends PrecacheInterface;

static function PrecacheGameTextures(LevelInfo myLevel)
{
    myLevel.ResetPrecacheMaterials();
    return;
    UnresolvedNativeFunction_97("...wTeamGame.PrecacheGameTextures OK");
}

static function PrecacheGameStaticMeshes(LevelInfo myLevel)
{
    myLevel.ResetPrecacheStaticMesh();
    UnresolvedNativeFunction_97("...wTeamGame.PrecacheGameStaticMeshes OK");
}

static function PrecacheGameSkeletalMeshes(LevelInfo myLevel)
{
    myLevel.ResetPrecacheSkeletalMeshes();
    UnresolvedNativeFunction_97("...wTeamGame.PrecacheGameSkeletalMeshes OK");
}
