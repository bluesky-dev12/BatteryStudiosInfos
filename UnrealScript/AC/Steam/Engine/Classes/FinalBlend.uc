/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\FinalBlend.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Properties:7
 *
 *******************************************************************************/
class FinalBlend extends Modifier
    hidecategories(Object)
    native
    editinlinenew
    collapsecategories;

enum EFrameBufferBlending
{
    FB_Overwrite,
    FB_Modulate,
    FB_AlphaBlend,
    FB_AlphaModulate_MightNotFogCorrectly,
    FB_Translucent,
    FB_Darken,
    FB_Brighten,
    FB_Invisible
};

var() FinalBlend.EFrameBufferBlending FrameBufferBlending;
var() bool ZWrite;
var() bool ZTest;
var() bool AlphaTest;
var() bool TwoSided;
var() byte AlphaRef;
var() bool UseShader;

defaultproperties
{
    ZWrite=true
    ZTest=true
    MaterialType=17
}