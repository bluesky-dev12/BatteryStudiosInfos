/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Fire\Classes\WaterTexture.uc
 * Package Imports:
 *	Fire
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Structs:1
 *	Properties:17
 *
 *******************************************************************************/
class WaterTexture extends FractalTexture
    hidecategories(Object)
    native
    noexport
    abstract
    safereplace;

enum WDrop
{
    DROP_FixedDepth,
    DROP_PhaseSpot,
    DROP_ShallowSpot,
    DROP_HalfAmpl,
    DROP_RandomMover,
    DROP_FixedRandomSpot,
    DROP_WhirlyThing,
    DROP_BigWhirly,
    DROP_HorizontalLine,
    DROP_VerticalLine,
    DROP_DiagonalLine1,
    DROP_DiagonalLine2,
    DROP_HorizontalOsc,
    DROP_VerticalOsc,
    DROP_DiagonalOsc1,
    DROP_DiagonalOsc2,
    DROP_RainDrops,
    DROP_AreaClamp,
    DROP_LeakyTap,
    DROP_DrippyTap
};

struct ADrop
{
    var WaterTexture.WDrop Type;
    var byte depth;
    var byte X;
    var byte Y;
    var byte ByteA;
    var byte ByteB;
    var byte ByteC;
    var byte ByteD;
};

var(WaterPaint) WaterTexture.WDrop DropType;
var(WaterPaint) byte WaveAmp;
var(WaterPaint) byte FX_Frequency;
var(WaterPaint) byte FX_Phase;
var(WaterPaint) byte FX_Amplitude;
var(WaterPaint) byte FX_Speed;
var(WaterPaint) byte FX_Radius;
var(WaterPaint) byte FX_Size;
var(WaterPaint) byte FX_Depth;
var(WaterPaint) byte FX_Time;
var int NumDrops;
var ADrop Drops[256];
var transient pointer SourceFields;
var transient byte RenderTable[1028];
var transient byte WaterTable[1536];
var transient byte WaterParity;
var transient int OldWaveAmp;
