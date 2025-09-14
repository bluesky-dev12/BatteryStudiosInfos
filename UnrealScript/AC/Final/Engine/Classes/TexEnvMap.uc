class TexEnvMap extends TexModifier
    native
    editinlinenew
    collapsecategories
    hidecategories(Object,Material);

enum ETexEnvMapType
{
    EM_WorldSpace,                  // 0
    EM_CameraSpace                  // 1
};

var() TexEnvMap.ETexEnvMapType EnvMapType;

defaultproperties
{
    EnvMapType=1
    TexCoordCount=1
}