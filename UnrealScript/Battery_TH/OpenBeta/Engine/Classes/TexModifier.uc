class TexModifier extends Modifier
    native
    noteditinlinenew
    collapsecategories
    hidecategories(Object,Material);

enum ETexCoordSrc
{
    TCS_Stream0,                    // 0
    TCS_Stream1,                    // 1
    TCS_Stream2,                    // 2
    TCS_Stream3,                    // 3
    TCS_Stream4,                    // 4
    TCS_Stream5,                    // 5
    TCS_Stream6,                    // 6
    TCS_Stream7,                    // 7
    TCS_WorldCoords,                // 8
    TCS_CameraCoords,               // 9
    TCS_WorldEnvMapCoords,          // 10
    TCS_CameraEnvMapCoords,         // 11
    TCS_ProjectorCoords,            // 12
    TCS_NoChange                    // 13
};

enum ETexCoordCount
{
    TCN_2DCoords,                   // 0
    TCN_3DCoords,                   // 1
    TCN_4DCoords                    // 2
};

var TexModifier.ETexCoordSrc TexCoordSource;
var() TexModifier.ETexCoordCount TexCoordCount;
var() bool TexCoordProjected;
var int texmodifier_dummy;

defaultproperties
{
    TexCoordSource=13
    MaterialType=4097
}