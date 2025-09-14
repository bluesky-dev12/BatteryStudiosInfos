/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Fire\Classes\WaveTexture.uc
 * Package Imports:
 *	Fire
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:4
 *
 *******************************************************************************/
class WaveTexture extends WaterTexture
    hidecategories(Object)
    native
    noexport
    safereplace;

var(WaterPaint) byte BumpMapLight;
var(WaterPaint) byte BumpMapAngle;
var(WaterPaint) byte PhongRange;
var(WaterPaint) byte PhongSize;
