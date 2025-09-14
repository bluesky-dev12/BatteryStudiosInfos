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
        NewPlayer.ReceiveLocalizedMessage(Class'UnrealGame.StartupMessage', 0, NewPlayer.PlayerReplicationInfo);
    }
    //return;    
}

static function PrecacheGameTextures(LevelInfo myLevel)
{
    // End:0x0E
    if(default.bLoadedGameTextures == true)
    {
        return;
    }
    myLevel.PCI.static.PrecacheGameTextures(myLevel);
    default.bLoadedGameTextures = true;
    //return;    
}

static function PrecacheGameStaticMeshes(LevelInfo myLevel)
{
    // End:0x0E
    if(default.bLoadedGameStaticMeshes == true)
    {
        return;
    }
    myLevel.PCI.static.PrecacheGameStaticMeshes(myLevel);
    default.bLoadedGameStaticMeshes = true;
    //return;    
}

static function PrecacheGameSkeletalMeshes(LevelInfo myLevel)
{
    // End:0x0E
    if(default.bLoadedGameSkeletalMeshes == true)
    {
        return;
    }
    myLevel.PCI.static.PrecacheGameSkeletalMeshes(myLevel);
    default.bLoadedGameSkeletalMeshes = true;
    //return;    
}
