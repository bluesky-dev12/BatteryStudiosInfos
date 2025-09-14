class WaterTexture extends FractalTexture
    abstract
    native
    noexport
    safereplace
    hidecategories(Object);

enum WDrop
{
    DROP_FixedDepth,                // 0
    DROP_PhaseSpot,                 // 1
    DROP_ShallowSpot,               // 2
    DROP_HalfAmpl,                  // 3
    DROP_RandomMover,               // 4
    DROP_FixedRandomSpot,           // 5
    DROP_WhirlyThing,               // 6
    DROP_BigWhirly,                 // 7
    DROP_HorizontalLine,            // 8
    DROP_VerticalLine,              // 9
    DROP_DiagonalLine1,             // 10
    DROP_DiagonalLine2,             // 11
    DROP_HorizontalOsc,             // 12
    DROP_VerticalOsc,               // 13
    DROP_DiagonalOsc1,              // 14
    DROP_DiagonalOsc2,              // 15
    DROP_RainDrops,                 // 16
    DROP_AreaClamp,                 // 17
    DROP_LeakyTap,                  // 18
    DROP_DrippyTap                  // 19
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
