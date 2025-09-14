class RenderedMaterial extends Material
    native
    collapsecategories
    noexport
    hidecategories(Object);

enum ERenderTechnique
{
    RT_None,                        // 0
    RT_DynamicCubeMap,              // 1
    RT_SelfIllumination,            // 2
    RT_Both,                        // 3
    RT_OnlyCubeMap,                 // 4
    RT_SimpleLighting               // 5
};

enum EOutputBlending
{
    OB_Normal,                      // 0
    OB_Masked,                      // 1
    OB_Modulate,                    // 2
    OB_Translucent,                 // 3
    OB_Invisible,                   // 4
    OB_Brighten,                    // 5
    OB_Darken                       // 6
};

var int renderedmaterial_dummy;
