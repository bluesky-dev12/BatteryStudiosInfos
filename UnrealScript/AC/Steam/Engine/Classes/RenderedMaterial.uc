/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\RenderedMaterial.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:2
 *	Properties:1
 *
 *******************************************************************************/
class RenderedMaterial extends Material
    hidecategories(Object)
    native
    collapsecategories
    noexport;

enum ERenderTechnique
{
    RT_None,
    RT_DynamicCubeMap,
    RT_SelfIllumination,
    RT_Both,
    RT_OnlyCubeMap,
    RT_SimpleLighting
};

enum EOutputBlending
{
    OB_Normal,
    OB_Masked,
    OB_Modulate,
    OB_Translucent,
    OB_Invisible,
    OB_Brighten,
    OB_Darken
};

var int renderedmaterial_dummy;
