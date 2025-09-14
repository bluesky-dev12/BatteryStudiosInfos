/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\I3DL2Listener.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:32
 *
 *******************************************************************************/
class I3DL2Listener extends Object
    native
    editinlinenew
    abstract;

var() float EnvironmentSize;
var() float EnvironmentDiffusion;
var() int Room;
var() int RoomHF;
var() int RoomLF;
var() float DecayTime;
var() float DecayHFRatio;
var() float DecayLFRatio;
var() int Reflections;
var() float ReflectionsDelay;
var() Vector ReflectionsPan;
var() int Reverb;
var() float ReverbDelay;
var() Vector ReverbPan;
var() float EchoTime;
var() float EchoDepth;
var() float ModulationTime;
var() float ModulationDepth;
var() float RoomRolloffFactor;
var() float AirAbsorptionHF;
var() float HFReference;
var() float LFReference;
var() bool bDecayTimeScale;
var() bool bReflectionsScale;
var() bool bReflectionsDelayScale;
var() bool bReverbScale;
var() bool bReverbDelayScale;
var() bool bEchoTimeScale;
var() bool bModulationTimeScale;
var() bool bDecayHFLimit;
var transient int Environment;
var transient int Updated;

defaultproperties
{
    EnvironmentSize=7.50
    EnvironmentDiffusion=1.0
    Room=-1000
    RoomHF=-100
    DecayTime=1.490
    DecayHFRatio=0.830
    DecayLFRatio=1.0
    Reflections=-2602
    ReflectionsDelay=0.0070
    Reverb=200
    ReverbDelay=0.0110
    EchoTime=0.250
    ModulationTime=0.250
    AirAbsorptionHF=-5.0
    HFReference=5000.0
    LFReference=250.0
    bDecayTimeScale=true
    bReflectionsScale=true
    bReflectionsDelayScale=true
    bReverbScale=true
    bReverbDelayScale=true
    bEchoTimeScale=true
    bDecayHFLimit=true
}