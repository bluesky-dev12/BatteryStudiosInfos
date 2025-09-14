class Engine extends Subsystem
    transient
    native
    config
    noexport;

var Primitive Cylinder;
var const Client Client;
var const AudioSubsystem Audio;
var const RenderDevice GRenDev;
var const wMatchMaker GMatchMaker;
var int bShowFrameRate;
var int bShowRenderStats;
var int bShowHardwareStats;
var int bShowGameStats;
var int bShowNetStats;
var int bShowAnimStats;
var int bShowLIPSincStats;
var int bShowHistograph;
var int bShowXboxMemStats;
var int bShowMatineeStats;
var int bShowAudioStats;
var int bShowLightStats;
var int TickCycles;
var int GameCycles;
var int ClientCycles;
var int CacheSizeMegs;
var bool UseSound;
var bool UseStaticMeshBatching;
var bool ServerReadsStdin;
var config bool bSlowRefChecking;
var(Settings) float CurrentTickRate;
var int DetectedVideoMemory;
var int ClientFileVersion;
var(Colors) config Color C_WorldBox;
var(Colors) config Color C_GroundPlane;
var(Colors) config Color C_GroundHighlight;
var(Colors) config Color C_BrushWire;
var(Colors) config Color C_Pivot;
var(Colors) config Color C_Select;
var(Colors) config Color C_Current;
var(Colors) config Color C_AddWire;
var(Colors) config Color C_SubtractWire;
var(Colors) config Color C_GreyWire;
var(Colors) config Color C_BrushVertex;
var(Colors) config Color C_BrushSnap;
var(Colors) config Color C_Invalid;
var(Colors) config Color C_ActorWire;
var(Colors) config Color C_ActorHiWire;
var(Colors) config Color C_Black;
var(Colors) config Color C_White;
var(Colors) config Color C_Mask;
var(Colors) config Color C_SemiSolidWire;
var(Colors) config Color C_NonSolidWire;
var(Colors) config Color C_WireBackground;
var(Colors) config Color C_WireGridAxis;
var(Colors) config Color C_ActorArrow;
var(Colors) config Color C_ScaleBox;
var(Colors) config Color C_ScaleBoxHi;
var(Colors) config Color C_ZoneWire;
var(Colors) config Color C_Mover;
var(Colors) config Color C_OrthoBackground;
var(Colors) config Color C_StaticMesh;
var(Colors) config Color C_VolumeBrush;
var(Colors) config Color C_ConstraintLine;
var(Colors) config Color C_AnimMesh;
var(Colors) config Color C_TerrainWire;
var(Colors) config Color C_LinkAntiportalVolume;
var(Colors) config Color C_CubemapVolume;

defaultproperties
{
    CacheSizeMegs=32
    UseSound=true
    UseStaticMeshBatching=true
    C_WorldBox=(R=0,G=0,B=107,A=255)
    C_GroundPlane=(R=0,G=0,B=63,A=255)
    C_GroundHighlight=(R=0,G=0,B=127,A=255)
    C_BrushWire=(R=255,G=63,B=63,A=255)
    C_Pivot=(R=0,G=255,B=0,A=255)
    C_Select=(R=0,G=0,B=127,A=255)
    C_Current=(R=0,G=0,B=0,A=255)
    C_AddWire=(R=127,G=127,B=255,A=255)
    C_SubtractWire=(R=255,G=192,B=63,A=255)
    C_GreyWire=(R=163,G=163,B=163,A=255)
    C_BrushVertex=(R=0,G=0,B=0,A=255)
    C_BrushSnap=(R=0,G=0,B=0,A=255)
    C_Invalid=(R=163,G=163,B=163,A=255)
    C_ActorWire=(R=127,G=63,B=0,A=255)
    C_ActorHiWire=(R=255,G=127,B=0,A=255)
    C_Black=(R=0,G=0,B=0,A=255)
    C_White=(R=255,G=255,B=255,A=255)
    C_Mask=(R=0,G=0,B=0,A=255)
    C_SemiSolidWire=(R=127,G=255,B=0,A=255)
    C_NonSolidWire=(R=63,G=192,B=32,A=255)
    C_WireBackground=(R=0,G=0,B=0,A=255)
    C_WireGridAxis=(R=119,G=119,B=119,A=255)
    C_ActorArrow=(R=163,G=0,B=0,A=255)
    C_ScaleBox=(R=151,G=67,B=11,A=255)
    C_ScaleBoxHi=(R=223,G=149,B=157,A=255)
    C_ZoneWire=(R=0,G=0,B=0,A=255)
    C_Mover=(R=255,G=0,B=255,A=255)
    C_OrthoBackground=(R=163,G=163,B=163,A=255)
    C_StaticMesh=(R=0,G=255,B=255,A=255)
    C_VolumeBrush=(R=255,G=196,B=225,A=255)
    C_ConstraintLine=(R=0,G=255,B=0,A=255)
    C_AnimMesh=(R=221,G=221,B=28,A=255)
    C_TerrainWire=(R=255,G=255,B=255,A=255)
    C_LinkAntiportalVolume=(R=79,G=79,B=255,A=255)
    C_CubemapVolume=(R=255,G=255,B=0,A=255)
}