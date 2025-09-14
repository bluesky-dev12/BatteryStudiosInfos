/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\AmbientSound.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:2
 *
 *******************************************************************************/
class AmbientSound extends Keypoint
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force,Wind)
    native
    exportstructs
    placeable;

struct SoundEmitter
{
    var() float EmitInterval;
    var() float EmitVariance;
    var transient float EmitTime;
    var() Sound EmitSound;
};

var(Sound) array<SoundEmitter> SoundEmitters;
var float AmbientVolume;

defaultproperties
{
    AmbientVolume=0.30
    bStatic=true
    bNoDelete=true
    Texture=Texture'S_Ambient'
    SoundVolume=100
    SoundRadius=100.0
    bNotOnDedServer=true
}