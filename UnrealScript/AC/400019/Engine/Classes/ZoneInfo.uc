class ZoneInfo extends Info
    native
    placeable
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

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
native(308) final iterator function ZoneActors(Class<Actor> baseClass, out Actor Actor)
{
    //native.baseClass;
    //native.Actor;        
}

simulated function LinkToSkybox()
{
    local SkyZoneInfo TempSkyZone;

    // End:0x21
    foreach AllActors(Class'Engine.SkyZoneInfo', TempSkyZone, 'None')
    {
        SkyZone = TempSkyZone;        
    }    
    // End:0x8A
    if(int(Level.DetailMode) == int(0))
    {
        // End:0x86
        foreach AllActors(Class'Engine.SkyZoneInfo', TempSkyZone, 'None')
        {
            // End:0x85
            if(!TempSkyZone.bHighDetail && !TempSkyZone.bSuperHighDetail)
            {
                SkyZone = TempSkyZone;
            }            
        }                
    }
    else
    {
        // End:0xDC
        if(int(Level.DetailMode) == int(1))
        {
            // End:0xD8
            foreach AllActors(Class'Engine.SkyZoneInfo', TempSkyZone, 'None')
            {
                // End:0xD7
                if(!TempSkyZone.bSuperHighDetail)
                {
                    SkyZone = TempSkyZone;
                }                
            }                        
        }
        else
        {
            // End:0x117
            if(int(Level.DetailMode) == int(2))
            {
                // End:0x116
                foreach AllActors(Class'Engine.SkyZoneInfo', TempSkyZone, 'None')
                {
                    SkyZone = TempSkyZone;                    
                }                
            }
        }
    }
    //return;    
}

simulated function PreBeginPlay()
{
    super(Actor).PreBeginPlay();
    LinkToSkybox();
    //return;    
}

event ActorEntered(Actor Other)
{
    //return;    
}

event ActorLeaving(Actor Other)
{
    //return;    
}

defaultproperties
{
    KillZ=-10000.0000000
    GammaFactor=1.7000000
    AmbientSaturation=255
    GroundColor=(R=128,G=128,B=128,A=0)
    SkyColor=(R=200,G=200,B=200,A=0)
    DistanceFogColor=(R=128,G=128,B=128,A=0)
    DistanceFogStart=3000.0000000
    DistanceFogEnd=8000.0000000
    DistanceFogBlendTime=1.0000000
    TexUPanSpeed=1.0000000
    TexVPanSpeed=1.0000000
    DramaticLightingScale=1.2000000
    bStatic=true
    bNoDelete=true
    Texture=Texture'Engine.S_ZoneInfo'
}