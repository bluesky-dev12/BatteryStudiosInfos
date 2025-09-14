class PrecacheGameClient extends PrecacheInterface;

static function PrecacheGameTextures(LevelInfo myLevel)
{
    myLevel.ResetPrecacheMaterials();
    return;
    __NFUN_270__("...wTeamGame.PrecacheGameTextures OK");
    //return;    
}

static function PrecacheGameStaticMeshes(LevelInfo myLevel)
{
    myLevel.ResetPrecacheStaticMesh();
    __NFUN_270__("...wTeamGame.PrecacheGameStaticMeshes OK");
    //return;    
}

static function PrecacheGameSkeletalMeshes(LevelInfo myLevel)
{
    myLevel.ResetPrecacheSkeletalMeshes();
    myLevel.AddPrecacheSkeletalMesh(SkeletalMesh'WP_HW_ATR.ATR');
    __NFUN_270__("...wTeamGame.PrecacheGameSkeletalMeshes OK");
    //return;    
}
