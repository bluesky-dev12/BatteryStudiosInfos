/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\Material.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Properties:6
 *	Functions:4
 *
 *******************************************************************************/
class Material extends Object
    hidecategories(Object)
    native
    collapsecategories
    noexport;

enum ESurfaceTypes
{
    EST_Default,
    EST_ETC,
    EST_Rock,
    EST_Brick,
    EST_Concrete,
    EST_Dirt,
    EST_Metal,
    EST_Metal_pt,
    EST_Wood,
    EST_Plant,
    EST_Flesh,
    EST_Ice,
    EST_Snow,
    EST_Water,
    EST_Glass,
    EST_cotton,
    EST_blood_headshot,
    EST_blood,
    EST_blood_death,
    EST_blood_spurt,
    EST_crackwood,
    EST_plastic,
    EST_paper,
    EST_rubber,
    EST_carpet,
    EST_leaves,
    EST_cloth,
    EST_sand,
    EST_mud,
    EST_water_foot,
    EST_water_wall,
    EST_alien_tankersheld,
    EST_Custom10,
    EST_Custom11,
    EST_Custom12,
    EST_Custom13,
    EST_Custom14,
    EST_Custom15,
    EST_Custom16,
    EST_Custom17,
    EST_Custom18,
    EST_Custom19,
    EST_Custom20,
    EST_Custom21,
    EST_Custom22,
    EST_Custom23,
    EST_Custom24,
    EST_Custom25,
    EST_Custom26,
    EST_Custom27,
    EST_Custom28,
    EST_Custom29,
    EST_Custom30,
    EST_Custom31
};

var() Material FallbackMaterial;
var Material DefaultMaterial;
var const transient bool UseFallback;
var const transient bool Validated;
var() Material.ESurfaceTypes SurfaceType;
var int MaterialType;

function Reset()
{
    // End:0x1a
    if(FallbackMaterial != none)
    {
        FallbackMaterial.Reset();
    }
}

function Trigger(Actor Other, Actor EventInstigator)
{
    // End:0x24
    if(FallbackMaterial != none)
    {
        FallbackMaterial.Trigger(Other, EventInstigator);
    }
}

// Export UMaterial::execMaterialUSize(FFrame&, void* const)
native function int MaterialUSize();
// Export UMaterial::execMaterialVSize(FFrame&, void* const)
native function int MaterialVSize();

defaultproperties
{
    DefaultMaterial=Texture'DefaultTexture'
}