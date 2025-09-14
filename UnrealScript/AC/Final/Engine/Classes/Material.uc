class Material extends Object
    native
    collapsecategories
    noexport
    hidecategories(Object);

enum ESurfaceTypes
{
    EST_Default,                    // 0
    EST_ETC,                        // 1
    EST_Rock,                       // 2
    EST_Brick,                      // 3
    EST_Concrete,                   // 4
    EST_Dirt,                       // 5
    EST_Metal,                      // 6
    EST_Metal_pt,                   // 7
    EST_Wood,                       // 8
    EST_Plant,                      // 9
    EST_Flesh,                      // 10
    EST_Ice,                        // 11
    EST_Snow,                       // 12
    EST_Water,                      // 13
    EST_Glass,                      // 14
    EST_cotton,                     // 15
    EST_blood_headshot,             // 16
    EST_blood,                      // 17
    EST_blood_death,                // 18
    EST_blood_spurt,                // 19
    EST_crackwood,                  // 20
    EST_plastic,                    // 21
    EST_paper,                      // 22
    EST_rubber,                     // 23
    EST_carpet,                     // 24
    EST_leaves,                     // 25
    EST_cloth,                      // 26
    EST_sand,                       // 27
    EST_mud,                        // 28
    EST_water_foot,                 // 29
    EST_water_wall,                 // 30
    EST_alien_tankersheld,          // 31
    EST_Custom10,                   // 32
    EST_Custom11,                   // 33
    EST_Custom12,                   // 34
    EST_Custom13,                   // 35
    EST_Custom14,                   // 36
    EST_Custom15,                   // 37
    EST_Custom16,                   // 38
    EST_Custom17,                   // 39
    EST_Custom18,                   // 40
    EST_Custom19,                   // 41
    EST_Custom20,                   // 42
    EST_Custom21,                   // 43
    EST_Custom22,                   // 44
    EST_Custom23,                   // 45
    EST_Custom24,                   // 46
    EST_Custom25,                   // 47
    EST_Custom26,                   // 48
    EST_Custom27,                   // 49
    EST_Custom28,                   // 50
    EST_Custom29,                   // 51
    EST_Custom30,                   // 52
    EST_Custom31                    // 53
};

var() Material FallbackMaterial;
var Material DefaultMaterial;
var const transient bool UseFallback;
var const transient bool Validated;
var() Material.ESurfaceTypes SurfaceType;
var int MaterialType;

function Reset()
{
    // End:0x1A
    if(FallbackMaterial != none)
    {
        FallbackMaterial.Reset();
    }
    //return;    
}

function Trigger(Actor Other, Actor EventInstigator)
{
    // End:0x24
    if(FallbackMaterial != none)
    {
        FallbackMaterial.Trigger(Other, EventInstigator);
    }
    //return;    
}

// Export UMaterial::execMaterialUSize(FFrame&, void* const)
native function int MaterialUSize();

// Export UMaterial::execMaterialVSize(FFrame&, void* const)
native function int MaterialVSize();

defaultproperties
{
    DefaultMaterial=Texture'Engine_Decompressed.DefaultTexture'
}