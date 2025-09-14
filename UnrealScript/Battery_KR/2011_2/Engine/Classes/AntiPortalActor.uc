class AntiPortalActor extends Actor
    native
    placeable;

enum EnumAntiPortalMode
{
    APM_Global,                     // 0
    APM_TouchingZone,               // 1
    APM_Link                        // 2
};

var(AntiPortal) AntiPortalActor.EnumAntiPortalMode AntiPortalMode;

defaultproperties
{
    DrawType=11
    bNoDelete=true
    RemoteRole=0
    bEdShouldSnap=true
}