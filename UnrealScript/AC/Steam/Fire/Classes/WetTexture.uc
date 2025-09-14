/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Fire\Classes\WetTexture.uc
 * Package Imports:
 *	Fire
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:3
 *
 *******************************************************************************/
class WetTexture extends WaterTexture
    hidecategories(Object)
    native
    noexport
    safereplace;

var(WaterPaint) Texture SourceTexture;
var transient Texture OldSourceTex;
var transient pointer LocalSourceBitmap;
