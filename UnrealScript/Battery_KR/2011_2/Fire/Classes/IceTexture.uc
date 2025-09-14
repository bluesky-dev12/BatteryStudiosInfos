class IceTexture extends FractalTexture
    native
    noexport
    safereplace
    hidecategories(Object);

enum PanningType
{
    SLIDE_Linear,                   // 0
    SLIDE_Circular,                 // 1
    SLIDE_Gestation,                // 2
    SLIDE_WavyX,                    // 3
    SLIDE_WavyY                     // 4
};

enum TimingType
{
    TIME_FrameRateSync,             // 0
    TIME_RealTimeScroll             // 1
};

var(IceLayer) Texture GlassTexture;
var(IceLayer) Texture SourceTexture;
var(IceLayer) IceTexture.PanningType PanningStyle;
var(IceLayer) IceTexture.TimingType TimeMethod;
var(IceLayer) byte HorizPanSpeed;
var(IceLayer) byte VertPanSpeed;
var(IceLayer) byte Frequency;
var(IceLayer) byte Amplitude;
var(IceLayer) bool MoveIce;
var float MasterCount;
var float UDisplace;
var float VDisplace;
var float UPosition;
var float VPosition;
var transient float TickAccu;
var transient int OldUDisplace;
var transient int OldVDisplace;
var transient Texture OldGlassTex;
var transient Texture OldSourceTex;
var transient pointer LocalSource;
var transient int ForceRefresh;
