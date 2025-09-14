/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Fire\Classes\IceTexture.uc
 * Package Imports:
 *	Fire
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:2
 *	Properties:21
 *
 *******************************************************************************/
class IceTexture extends FractalTexture
    hidecategories(Object)
    native
    noexport
    safereplace;

enum PanningType
{
    SLIDE_Linear,
    SLIDE_Circular,
    SLIDE_Gestation,
    SLIDE_WavyX,
    SLIDE_WavyY
};

enum TimingType
{
    TIME_FrameRateSync,
    TIME_RealTimeScroll
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
