class AmbientSound extends Keypoint
    native
    exportstructs
    placeable
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force,Wind);

struct SoundEmitter
{
    var() float EmitInterval;
    var() float EmitVariance;
    var transient float EmitTime;
    var() Sound EmitSound;
};

var(Sound) array<SoundEmitter> SoundEmitters;
var float AmbientVolume;
var bool bPlaying;

defaultproperties
{
    AmbientVolume=0.3000000
    bStatic=false
    bNoDelete=true
    Texture=Texture'Engine.S_Ambient'
    SoundVolume=100
    SoundRadius=100.0000000
    bNotOnDedServer=true
}