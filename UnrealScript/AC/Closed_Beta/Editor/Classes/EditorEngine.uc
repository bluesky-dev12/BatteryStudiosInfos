class EditorEngine extends Engine
    transient
    native
    config
    noexport;

var const Level Level;
var const Model TempModel;
var const Texture CurrentTexture;
var const StaticMesh CurrentStaticMesh;
var const Mesh CurrentMesh;
var const Class CurrentClass;
var const TransBuffer Trans;
var const TextBuffer Results;
var const int Pad[8];
var const Texture Bad;
var const Texture Bkgnd;
var const Texture BkgndHi;
var const Texture BadHighlight;
var const Texture MaterialArrow;
var const Texture MaterialBackdrop;
var StaticMesh TexPropCube;
var StaticMesh TexPropSphere;
var const bool bFastRebuild;
var const bool bBootstrapping;
var const config int AutoSaveIndex;
var const int AutoSaveCount;
var const int Mode;
var const int TerrainEditBrush;
var const int ClickFlags;
var const float MovementSpeed;
var const Package PackageContext;
var const Vector AddLocation;
var const Plane AddPlane;
var const array<Object> Tools;
var const Class BrowseClass;
var const int ConstraintsVtbl;
var(Grid) config bool GridEnabled;
var(Grid) config bool SnapVertices;
var(Grid) config float SnapDistance;
var(Grid) config Vector GridSize;
var(RotationGrid) config bool RotGridEnabled;
var(RotationGrid) config Rotator RotGridSize;
var(Advanced) config bool UseSizingBox;
var(Advanced) config bool UseAxisIndicator;
var(Advanced) config float FovAngleDegrees;
var(Advanced) config bool GodMode;
var(Advanced) config bool AutoSave;
var(Advanced) config byte AutosaveTimeMinutes;
var(Advanced) config string GameCommandLine;
var(Advanced) array<string> EditPackages;
var(Advanced) array<string> CutdownPackages;
var(Advanced) config bool AlwaysShowTerrain;
var(Advanced) config bool UseActorRotationGizmo;
var(Advanced) config bool LoadEntirePackageWhenSaving;
var(Advanced) config bool ShowIntWarnings;

defaultproperties
{
    Bad=Texture'Editor_Decompressed.Bad'
    Bkgnd=Texture'Editor_Decompressed.Bkgnd'
    BkgndHi=Texture'Editor_Decompressed.BkgndHi'
    BadHighlight=Texture'Editor_Decompressed.BadHighlight'
    MaterialArrow=Texture'Editor_Decompressed.MaterialArrow'
    MaterialBackdrop=Texture'Editor_Decompressed.MaterialBackdrop'
    TexPropCube=StaticMesh'Editor_Decompressed.TexPropCube'
    TexPropSphere=StaticMesh'Editor_Decompressed.TexPropSphere'
    GridSize=(X=16.0000000,Y=16.0000000,Z=16.0000000)
}