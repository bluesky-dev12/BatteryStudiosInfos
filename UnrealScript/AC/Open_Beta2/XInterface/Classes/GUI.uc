class GUI extends Object
    abstract
    native
    editinlinenew
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
    MSAT_Blurry,                    // 0
    MSAT_Watched,                   // 1
    MSAT_Focused,                   // 2
    MSAT_Pressed,                   // 3
    MSAT_Disabled                   // 4
};

enum eDropState
{
    DRP_None,                       // 0
    DRP_Source,                     // 1
    DRP_Target,                     // 2
    DRP_Accept,                     // 3
    DRP_Reject                      // 4
};

enum eFontScale
{
    FNS_Small,                      // 0
    FNS_Medium,                     // 1
    FNS_Large                       // 2
};

enum eTextAlign
{
    TXTA_Left,                      // 0
    TXTA_Center,                    // 1
    TXTA_Right                      // 2
};

enum eTextCase
{
    TXTC_None,                      // 0
    TXTC_Upper,                     // 1
    TXTC_Lower                      // 2
};

enum eImgStyle
{
    ISTY_Normal,                    // 0
    ISTY_Stretched,                 // 1
    ISTY_Scaled,                    // 2
    ISTY_Bound,                     // 3
    ISTY_Justified,                 // 4
    ISTY_PartialScaled,             // 5
    ISTY_Tiled,                     // 6
    ISTY_CropStretched              // 7
};

enum eImgAlign
{
    IMGA_TopLeft,                   // 0
    IMGA_Center,                    // 1
    IMGA_BottomRight                // 2
};

enum eEditMask
{
    EDM_None,                       // 0
    EDM_Alpha,                      // 1
    EDM_Numeric                     // 2
};

enum EMenuRenderStyle
{
    MSTY_None,                      // 0
    MSTY_Normal,                    // 1
    MSTY_Masked,                    // 2
    MSTY_Translucent,               // 3
    MSTY_Modulated,                 // 4
    MSTY_Alpha,                     // 5
    MSTY_Additive,                  // 6
    MSTY_Subtractive,               // 7
    MSTY_Particle,                  // 8
    MSTY_AlphaZ                     // 9
};

enum eIconPosition
{
    ICP_Normal,                     // 0
    ICP_Center,                     // 1
    ICP_Scaled,                     // 2
    ICP_Stretched,                  // 3
    ICP_Bound                       // 4
};

enum ePageAlign
{
    PGA_None,                       // 0
    PGA_Client,                     // 1
    PGA_Left,                       // 2
    PGA_Right,                      // 3
    PGA_Top,                        // 4
    PGA_Bottom                      // 5
};

enum eDrawDirection
{
    DRD_LeftToRight,                // 0
    DRD_RightToLeft,                // 1
    DRD_TopToBottom,                // 2
    DRD_BottomToTop                 // 3
};

enum eCellStyle
{
    CELL_FixedSize,                 // 0
    CELL_FixedCount                 // 1
};

enum EOrientation
{
    ORIENT_Vertical,                // 0
    ORIENT_Horizontal               // 1
};

enum EAnimationType
{
    AT_Position,                    // 0
    AT_Dimension                    // 1
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
    // End:0x0E
    if(Test == "")
    {
        return false;
    }
    J0x0E:

    // End:0x70 [Loop If]
    if(Test != "")
    {
        // End:0x2D
        if(Asc(Left(Test, 1)) > 57)
        {
            return false;
        }
        // End:0x5F
        if((Asc(Left(Test, 1)) < 48) && !bAllowDecimal && Left(Test, 1) == ".")
        {
            return false;
        }
        Test = Mid(Test, 1);
        // [Loop Continue]
        goto J0x0E;
    }
    return true;
    //return;    
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
    J0x1C:

    // End:0x83 [Loop If]
    if(i < StringArray.Length)
    {
        // End:0x79
        if((StringArray[i] != "") || !bIgnoreBlanks)
        {
            // End:0x65
            if(S != "")
            {
                S $= Delim;
            }
            S $= StringArray[i];
        }
        i++;
        // [Loop Continue]
        goto J0x1C;
    }
    return S;
    //return;    
}

// Export UGUI::execProfile(FFrame&, void* const)
native function Profile(string ProfileName)
{
    //native.ProfileName;        
}

// Export UGUI::execGetModList(FFrame&, void* const)
native function GetModList(out array<string> ModDirs, out array<string> ModTitles)
{
    //native.ModDirs;
    //native.ModTitles;        
}

// Export UGUI::execGetModValue(FFrame&, void* const)
native function string GetModValue(string ModDir, string ModKey)
{
    //native.ModDir;
    //native.ModKey;        
}

// Export UGUI::execGetModLogo(FFrame&, void* const)
native function Material GetModLogo(string ModDir)
{
    //native.ModDir;        
}
