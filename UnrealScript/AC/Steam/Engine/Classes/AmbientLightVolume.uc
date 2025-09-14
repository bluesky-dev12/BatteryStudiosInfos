/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\AmbientLightVolume.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:13
 *
 *******************************************************************************/
class AmbientLightVolume extends Volume
    native
    noexport
    notplaceable;

struct AmbientCube
{
    var Color cAmbientCube[6];
};

var() int ALV_Width;
var() int ALV_Breadth;
var() int ALV_Height;
var() bool ShowAmbientCubes;
var() float AmbientIntensity;
var() Color BaseColor;
var() float ShaderOff_AmbientIntensity;
var() float GammaFactor;
var native const array<AmbientCube> AmbientCubes;
var native const Box VolumeBox;
var native const float WidthGap;
var native const float BreadthGap;
var native const float HeightGap;

defaultproperties
{
    ALV_Width=10
    ALV_Breadth=10
    ALV_Height=10
    AmbientIntensity=1.0
    BaseColor=(R=0,G=0,B=0,A=255)
    ShaderOff_AmbientIntensity=1.0
    GammaFactor=2.20
    DrawType=14
    RemoteRole=0
}