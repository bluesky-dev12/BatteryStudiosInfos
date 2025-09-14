/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Editor\Classes\EditorEngine.uc
 * Package Imports:
 *	Editor
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:50
 *
 *******************************************************************************/
class EditorEngine extends Engine
    native
    config()
    transient
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
    Bad=Texture'Bad'
    Bkgnd=Texture'Bkgnd'
    BkgndHi=Texture'BkgndHi'
    BadHighlight=Texture'BadHighlight'
    MaterialArrow=Texture'MaterialArrow'
    MaterialBackdrop=Texture'MaterialBackdrop'
    TexPropCube=StaticMesh'TexPropCube'
    TexPropSphere=StaticMesh'TexPropSphere'
    GridSize=(X=16.0,Y=16.0,Z=16.0)
}