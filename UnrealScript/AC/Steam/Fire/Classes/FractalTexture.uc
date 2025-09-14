/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Fire\Classes\FractalTexture.uc
 * Package Imports:
 *	Fire
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:7
 *
 *******************************************************************************/
class FractalTexture extends Texture
    hidecategories(Object)
    native
    noexport
    abstract
    safereplace;

var transient int UMask;
var transient int VMask;
var transient int LightOutput;
var transient int SoundOutput;
var transient int GlobalPhase;
var transient byte DrawPhase;
var transient byte AuxPhase;
