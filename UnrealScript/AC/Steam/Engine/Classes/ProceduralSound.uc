/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\ProceduralSound.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:7
 *
 *******************************************************************************/
class ProceduralSound extends Sound
    hidecategories(Object,Object)
    native
    noexport;

var(Sound) Sound BaseSound;
var(Sound) float PitchModification;
var(Sound) float VolumeModification;
var(Sound) float PitchVariance;
var(Sound) float VolumeVariance;
var transient float RenderedPitchModification;
var transient float RenderedVolumeModification;
