/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\TexEnvMap.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Properties:1
 *
 *******************************************************************************/
class TexEnvMap extends TexModifier
    hidecategories(Object,Material)
    native
    editinlinenew
    collapsecategories;

enum ETexEnvMapType
{
    EM_WorldSpace,
    EM_CameraSpace
};

var() TexEnvMap.ETexEnvMapType EnvMapType;

defaultproperties
{
    EnvMapType=1
    TexCoordCount=1
}