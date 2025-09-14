class StaticMeshActor extends Actor
    native
    placeable;

var() bool bExactProjectileCollision;
var(ApplyGameInfo) bool ShowInSD;
var(ApplyGameInfo) bool ShowInSBT;
var(ApplyGameInfo) bool ShowInDOM;
var(ApplyGameInfo) bool ShowInTDM;
var(ApplyGameInfo) bool ShowInFFA;
var(ApplyGameInfo) bool _PLEASE_TURN_OFF_STATIC_;

simulated event PreBeginPlay()
{
    switch(Caps(string(Level.Game.Class)))
    {
        // End:0x47
        case "WMISSION.WSDGAMEINFO":
            // End:0x44
            if(!ShowInSD)
            {
                Destroy();
            }
            // End:0xEC
            break;
        // End:0x72
        case "WMISSION.WDOMGAMEINFO":
            // End:0x6F
            if(!ShowInDOM)
            {
                Destroy();
            }
            // End:0xEC
            break;
        // End:0x9D
        case "WMISSION.WSBTGAMEINFO":
            // End:0x9A
            if(!ShowInSBT)
            {
                Destroy();
            }
            // End:0xEC
            break;
        // End:0xC4
        case "WGAME.WDEATHMATCH":
            // End:0xC1
            if(!ShowInFFA)
            {
                Destroy();
            }
            // End:0xEC
            break;
        // End:0xE9
        case "WGAME.WTEAMGAME":
            // End:0xE6
            if(!ShowInSD)
            {
                Destroy();
            }
            // End:0xEC
            break;
        // End:0xFFFF
        default:
            break;
    }
    super.PreBeginPlay();
    //return;    
}

defaultproperties
{
    bExactProjectileCollision=true
    ShowInSD=true
    ShowInSBT=true
    ShowInDOM=true
    ShowInTDM=true
    ShowInFFA=true
    DrawType=8
    bUseDynamicLights=true
    bStatic=true
    bWorldGeometry=true
    bShadowMap=true
    bSelfShadowCast=true
    bShadowCast=true
    bStaticLighting=true
    CollisionRadius=1.0000000
    CollisionHeight=1.0000000
    bCollideActors=true
    bBlockActors=true
    bBlockKarma=true
    bEdShouldSnap=true
}