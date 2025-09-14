/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\GUI.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Constants:13
 *	Enums:15
 *	Structs:7
 *	Properties:7
 *	Functions:6
 *
 *******************************************************************************/
class GUI extends Object
    native
    editinlinenew
    abstract
    instanced;

const Counter = 0;
const QBTN_Ok = 1;
const QBTN_Cancel = 2;
const QBTN_Retry = 4;
const QBTN_Continue = 8;
const QBTN_Yes = 16;
const QBTN_No = 32;
const QBTN_Abort = 64;
const QBTN_Ignore = 128;
const QBTN_OkCancel = 3;
const QBTN_AbortRetry = 68;
const QBTN_YesNo = 48;
const QBTN_YesNoCancel = 50;

enum eMenuState
{
    MSAT_Blurry,
    MSAT_Watched,
    MSAT_Focused,
    MSAT_Pressed,
    MSAT_Disabled
};

enum eDropState
{
    DRP_None,
    DRP_Source,
    DRP_Target,
    DRP_Accept,
    DRP_Reject
};

enum eFontScale
{
    FNS_Small,
    FNS_Medium,
    FNS_Large
};

enum eTextAlign
{
    TXTA_Left,
    TXTA_Center,
    TXTA_Right
};

enum eTextCase
{
    TXTC_None,
    TXTC_Upper,
    TXTC_Lower
};

enum eImgStyle
{
    ISTY_Normal,
    ISTY_Stretched,
    ISTY_Scaled,
    ISTY_Bound,
    ISTY_Justified,
    ISTY_PartialScaled,
    ISTY_Tiled,
    ISTY_CropStretched
};

enum eImgAlign
{
    IMGA_TopLeft,
    IMGA_Center,
    IMGA_BottomRight
};

enum eEditMask
{
    EDM_None,
    EDM_Alpha,
    EDM_Numeric
};

enum EMenuRenderStyle
{
    MSTY_None,
    MSTY_Normal,
    MSTY_Masked,
    MSTY_Translucent,
    MSTY_Modulated,
    MSTY_Alpha,
    MSTY_Additive,
    MSTY_Subtractive,
    MSTY_Particle,
    MSTY_AlphaZ
};

enum eIconPosition
{
    ICP_Normal,
    ICP_Center,
    ICP_Scaled,
    ICP_Stretched,
    ICP_Bound
};

enum ePageAlign
{
    PGA_None,
    PGA_Client,
    PGA_Left,
    PGA_Right,
    PGA_Top,
    PGA_Bottom
};

enum eDrawDirection
{
    DRD_LeftToRight,
    DRD_RightToLeft,
    DRD_TopToBottom,
    DRD_BottomToTop
};

enum eCellStyle
{
    CELL_FixedSize,
    CELL_FixedCount
};

enum EOrientation
{
    ORIENT_Vertical,
    ORIENT_Horizontal
};

enum EAnimationType
{
    AT_Position,
    AT_Dimension
};

struct native init GUIListElem
{
    var string Item;
    var Object ExtraData;
    var string ExtraStrData;
    var bool bSection;
};

struct APackInfo
{
    var string PackageName;
    var localized string Description;
};

struct native init MultiSelectListElem
{
    var string Item;
    var Object ExtraData;
    var string ExtraStrData;
    var bool bSelected;
    var int SelectionIndex;
    var bool bSection;
};

struct native init ImageListElem
{
    var int Item;
    var Material Image;
    var int Locked;
};

struct native init GUITreeNode
{
    var() string Caption;
    var() string Value;
    var() string ParentCaption;
    var() string ExtraInfo;
    var() int Level;
    var() bool bEnabled;
};

struct AutoLoginInfo
{
    var() string IP;
    var() string Port;
    var() string UserName;
    var() string Password;
    var() bool bAutologin;
};

struct GUITabItem
{
    var() string ClassName;
    var() localized string Caption;
    var() localized string Hint;
};

var noexport GUIController Controller;
var noexport Plane SaveModulation;
var noexport float SaveX;
var noexport float SaveY;
var noexport Color SaveColor;
var noexport Font SaveFont;
var noexport byte SaveStyle;

static function bool IsDigit(string Test, optional bool bAllowDecimal)
{
    // End:0x0e
    if(Test == "")
    {
        return false;
    }
    J0x0e:
    // End:0x70 [While If]
    if(Test != "")
    {
        // End:0x2d
        if(Asc(Left(Test, 1)) > 57)
        {
            return false;
        }
        // End:0x5f
        if(Asc(Left(Test, 1)) < 48 && !bAllowDecimal && Left(Test, 1) == ".")
        {
            return false;
        }
        Test = Mid(Test, 1);
        // This is an implied JumpToken; Continue!
        goto J0x0e;
    }
    return true;
}

static final function string JoinArray(array<string> StringArray, optional string Delim, optional bool bIgnoreBlanks)
{
    local int i;
    local string S;

    // End:0x15
    if(Delim == "")
    {
        Delim = ",";
    }
    i = 0;
    J0x1c:
    // End:0x83 [While If]
    if(i < StringArray.Length)
    {
        // End:0x79
        if(StringArray[i] != "" || !bIgnoreBlanks)
        {
            // End:0x65
            if(S != "")
            {
                S $= Delim;
            }
            S $= StringArray[i];
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1c;
    }
    return S;
}

// Export UGUI::execProfile(FFrame&, void* const)
native function Profile(string ProfileName);
// Export UGUI::execGetModList(FFrame&, void* const)
native function GetModList(out array<string> ModDirs, out array<string> ModTitles);
// Export UGUI::execGetModValue(FFrame&, void* const)
native function string GetModValue(string ModDir, string ModKey);
// Export UGUI::execGetModLogo(FFrame&, void* const)
native function Material GetModLogo(string ModDir);
