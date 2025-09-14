/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\Cubemap.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *
 *******************************************************************************/
class Cubemap extends Texture
    hidecategories(Object)
    native
    noexport
    safereplace;

var() Texture Faces[6];
var transient pointer CubemapRenderInterface;
