/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\ZoneInfo.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:31
 *	Functions:5
 *
 *******************************************************************************/
class ZoneInfo extends Info
    dependson(SkyZoneInfo)
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    native
    placeable;

var SkyZoneInfo SkyZone;
var() name ZoneTag;
var() localized string LocationName;
var() float KillZ;
var() Actor.eKillZType KillZType;
var() bool bSoftKillZ;
var() bool bTerrainZone;
var() bool bDistanceFog;
var() bool bClearToFogColor;
var const array<TerrainInfo> Terrains;
var Vector AmbientVectorShaderOff;
var Vector AmbientVector;
var(ZoneLight) float GammaFactor;
var(ZoneLight) int AmbientBrightness;
var(ZoneLight) int AmbientBrightnessShaderOff;
var(ZoneLight) byte AmbientHue;
var(ZoneLight) byte AmbientSaturation;
var(ZoneLight) Color GroundColor;
var(ZoneLight) Color SkyColor;
var(ZoneLight) Color DistanceFogColor;
var(ZoneLight) float DistanceFogStart;
var(ZoneLight) float DistanceFogEnd;
var transient float RealDistanceFogEnd;
var(ZoneLight) float DistanceFogEndMin;
var(ZoneLight) float DistanceFogBlendTime;
var(ZoneLight) float TexUPanSpeed;
var(ZoneLight) float TexVPanSpeed;
var(ZoneLight) float DramaticLightingScale;
var(ZoneSound) editinline I3DL2Listener ZoneEffect;
var(ZoneVisibility) bool bLonelyZone;
var(ZoneVisibility) editinline array<editinline ZoneInfo> ManualExcludes;

// Export UZoneInfo::execZoneActors(FFrame&, void* const)
native(308) final iterator function ZoneActors(class<Actor> baseClass, out Actor Actor);
simulated function LinkToSkybox()
{
    local SkyZoneInfo TempSkyZone;

    // End:0x21
    foreach AllActors(class'SkyZoneInfo', TempSkyZone, 'None')
    {
        SkyZone = TempSkyZone;                
    }
    // End:0x8a
    if(Level.DetailMode == 0)
    {
        // End:0x86
        foreach AllActors(class'SkyZoneInfo', TempSkyZone, 'None')
        {
            // End:0x85
            if(!TempSkyZone.bHighDetail && !TempSkyZone.bSuperHighDetail)
            {
                SkyZone = TempSkyZone;
            }                        
        }
    }
    // End:0x117
    else
    {
        // End:0xdc
        if(Level.DetailMode == 1)
        {
            // End:0xd8
            foreach AllActors(class'SkyZoneInfo', TempSkyZone, 'None')
            {
                // End:0xd7
                if(!TempSkyZone.bSuperHighDetail)
                {
                    SkyZone = TempSkyZone;
                }                                
            }
        }
        // End:0x117
        else
        {
            // End:0x117
            if(Level.DetailMode == 2)
            {
                // End:0x116
                foreach AllActors(class'SkyZoneInfo', TempSkyZone, 'None')
                {
                    SkyZone = TempSkyZone;                                        
                }
            }
        }
    }
}

simulated function PreBeginPlay()
{
    super(Actor).PreBeginPlay();
    LinkToSkybox();
}

event ActorEntered(Actor Other);
event ActorLeaving(Actor Other);

defaultproperties
{
    KillZ=-10000.0
    GammaFactor=1.70
    AmbientSaturation=255
    GroundColor=(R=128,G=128,B=128,A=0)
    SkyColor=(R=200,G=200,B=200,A=0)
    DistanceFogColor=(R=128,G=128,B=128,A=0)
    DistanceFogStart=3000.0
    DistanceFogEnd=8000.0
    DistanceFogBlendTime=1.0
    TexUPanSpeed=1.0
    TexVPanSpeed=1.0
    DramaticLightingScale=1.20
    bStatic=true
    bNoDelete=true
    Texture=Texture'S_ZoneInfo'
}