/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\FluidSurfaceOscillator.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:6
 *
 *******************************************************************************/
class FluidSurfaceOscillator extends Actor
    native
    placeable;

var() edfindable FluidSurfaceInfo FluidInfo;
var() float Frequency;
var() byte Phase;
var() float Strength;
var() float Radius;
var const transient float OscTime;

defaultproperties
{
    Frequency=1.0
    Strength=10.0
    bHidden=true
    Texture=Texture'S_FluidSurfOsc'
}