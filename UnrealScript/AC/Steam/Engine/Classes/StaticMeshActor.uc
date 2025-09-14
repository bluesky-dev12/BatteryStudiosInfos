/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\StaticMeshActor.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:7
 *	Functions:1
 *
 *******************************************************************************/
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
            // End:0x5b
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
            // End:0xb1
            case "WMISSION.WSBTGAMEINFO":
                // End:0xae
                if(!ShowInSBT)
                {
                    Destroy();
                }
                // End:0x100
                break;
            // End:0xd8
            case "WGAME.WDEATHMATCH":
                // End:0xd5
                if(!ShowInFFA)
                {
                    Destroy();
                }
                // End:0x100
                break;
            // End:0xfd
            case "WGAME.WTEAMGAME":
                // End:0xfa
                if(!ShowInSD)
                {
                    Destroy();
                }
                // End:0x100
                break;
            // End:0xffff
            default:
            }
            super.PreBeginPlay();
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
    CollisionRadius=1.0
    CollisionHeight=1.0
    bCollideActors=true
    bBlockActors=true
    bBlockKarma=true
    bEdShouldSnap=true
}