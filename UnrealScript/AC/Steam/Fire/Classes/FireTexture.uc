/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Fire\Classes\FireTexture.uc
 * Package Imports:
 *	Fire
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:2
 *	Structs:1
 *	Properties:20
 *
 *******************************************************************************/
class FireTexture extends FractalTexture
    hidecategories(Object)
    native
    noexport
    safereplace;

enum ESpark
{
    SPARK_Burn,
    SPARK_Sparkle,
    SPARK_Pulse,
    SPARK_Signal,
    SPARK_Blaze,
    SPARK_OzHasSpoken,
    SPARK_Cone,
    SPARK_BlazeRight,
    SPARK_BlazeLeft,
    SPARK_Cylinder,
    SPARK_Cylinder3D,
    SPARK_Lissajous,
    SPARK_Jugglers,
    SPARK_Emit,
    SPARK_Fountain,
    SPARK_Flocks,
    SPARK_Eels,
    SPARK_Organic,
    SPARK_WanderOrganic,
    SPARK_RandomCloud,
    SPARK_CustomCloud,
    SPARK_LocalCloud,
    SPARK_Stars,
    SPARK_LineLightning,
    SPARK_RampLightning,
    SPARK_SphereLightning,
    SPARK_Wheel,
    SPARK_Gametes,
    SPARK_Sprinkler
};

enum DMode
{
    DRAW_Normal,
    DRAW_Lathe,
    DRAW_Lathe_2,
    DRAW_Lathe_3,
    DRAW_Lathe_4
};

struct Spark
{
    var FireTexture.ESpark Type;
    var byte Heat;
    var byte X;
    var byte Y;
    var byte ByteA;
    var byte ByteB;
    var byte ByteC;
    var byte ByteD;
};

var(FirePaint) FireTexture.ESpark SparkType;
var(FirePaint) byte RenderHeat;
var(FirePaint) bool bRising;
var(FirePaint) byte FX_Heat;
var(FirePaint) byte FX_Size;
var(FirePaint) byte FX_AuxSize;
var(FirePaint) byte FX_Area;
var(FirePaint) byte FX_Frequency;
var(FirePaint) byte FX_Phase;
var(FirePaint) byte FX_HorizSpeed;
var(FirePaint) byte FX_VertSpeed;
var(FirePaint) FireTexture.DMode DrawMode;
var(FirePaint) int SparksLimit;
var int NumSparks;
var transient array<Spark> Sparks;
var transient int OldRenderHeat;
var transient byte RenderTable[1028];
var transient byte StarStatus;
var transient byte PenDownX;
var transient byte PenDownY;
