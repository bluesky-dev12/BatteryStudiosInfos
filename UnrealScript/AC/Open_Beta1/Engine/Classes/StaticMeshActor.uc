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
    // End:0x100
    if(Level.Game != none)
    {
        switch(Caps(string(Level.Game.Class)))
        {
            // End:0x5B
            case "WMISSION.WSDGAMEINFO":
                // End:0x58
                if(!ShowInSD)
                {
                    Destroy();
                }
                // End:0x100
                break;
            // End:0x86
            case "WMISSION.WDOMGAMEINFO":
                // End:0x83
                if(!ShowInDOM)
                {
                    Destroy();
                }
                // End:0x100
                break;
            // End:0xB1
            case "WMISSION.WSBTGAMEINFO":
                // End:0xAE
                if(!ShowInSBT)
                {
                    Destroy();
                }
                // End:0x100
                break;
            // End:0xD8
            case "WGAME.WDEATHMATCH":
                // End:0xD5
                if(!ShowInFFA)
                {
                    Destroy();
                }
                // End:0x100
                break;
            // End:0xFD
            case "WGAME.WTEAMGAME":
                // End:0xFA
                if(!ShowInSD)
                {
                    Destroy();
                }
                // End:0x100
                break;
            // End:0xFFFF
            default:
                break;
        }
    }
    else
    {
        super.PreBeginPlay();
        //return;        
    }
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