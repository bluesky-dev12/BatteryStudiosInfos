class MeshEditProps extends MeshObject
    native
    hidecategories(Object);

struct native FSectionDigest
{
    var() MeshObject.EMeshSectionMethod MeshSectionMethod;
    var() int MaxRigidParts;
    var() int MinPartFaces;
    var() float MeldSize;
};

struct native LODLevel
{
    var() float DistanceFactor;
    var() float ReductionFactor;
    var() float Hysteresis;
    var() int MaxInfluences;
    var() bool RedigestSwitch;
    var() FSectionDigest Rigidize;
};

struct native AttachSocket
{
    var() Vector A_Translation;
    var() Rotator A_Rotation;
    var() name AttachAlias;
    var() name BoneName;
    var() float Test_Scale;
    var() Mesh TestMesh;
    var() StaticMesh TestStaticMesh;
};

struct native MEPBonePrimSphere
{
    var() name BoneName;
    var() Vector offset;
    var() float Radius;
    var() int bBlockKarma;
    var() int bBlockNonZeroExtent;
    var() int bBlockZeroExtent;
};

struct native MEPBonePrimBox
{
    var() name BoneName;
    var() Vector offset;
    var() Vector Radii;
    var() int bBlockKarma;
    var() int bBlockNonZeroExtent;
    var() int bBlockZeroExtent;
};

var const transient pointer WBrowserAnimationPtr;
var(Mesh) Vector Scale;
var(Mesh) Vector Translation;
var(Mesh) Rotator Rotation;
var(Mesh) Vector MinVisBound;
var(Mesh) Vector MaxVisBound;
var(Mesh) Vector VisSphereCenter;
var(Mesh) float VisSphereRadius;
var(Redigest) int LODStyle;
var(Animation) MeshAnimation DefaultAnimation;
var(Skin) array<Material> Material;
var(Shadow) array<bool> Shadow;
var(LOD) float LOD_Strength;
var(LOD) array<LODLevel> LODLevels;
var(LOD) float SkinTesselationFactor;
var(Collision) float TestCollisionRadius;
var(Collision) float TestCollisionHeight;
var(Collision) array<MEPBonePrimSphere> CollisionSpheres;
var(Collision) array<MEPBonePrimBox> CollisionBoxes;
var(Collision) StaticMesh CollisionStaticMesh;
var(Attach) array<AttachSocket> Sockets;
var(Impostor) bool bImpostorPresent;
var(Impostor) Material SpriteMaterial;
var(Impostor) Vector Scale3D;
var(Impostor) Rotator RelativeRotation;
var(Impostor) Vector RelativeLocation;
var(Impostor) Color ImpColor;
var(Impostor) MeshObject.EImpSpaceMode ImpSpaceMode;
var(Impostor) MeshObject.EImpDrawMode ImpDrawMode;
var(Impostor) MeshObject.EImpLightMode ImpLightMode;

defaultproperties
{
    Scale=(X=1.0000000,Y=1.0000000,Z=1.0000000)
    LODStyle=10
    SkinTesselationFactor=1.0000000
    Scale3D=(X=1.0000000,Y=1.0000000,Z=1.0000000)
    ImpSpaceMode=2
}