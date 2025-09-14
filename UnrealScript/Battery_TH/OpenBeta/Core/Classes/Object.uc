class Object
    native
    noexport;

const RF_Transactional = 0x00000001;
const RF_Public = 0x00000004;
const RF_Transient = 0x00004000;
const RF_Standalone = 0x00080000;
const RF_NotForClient = 0x00100000;
const RF_NotForServer = 0x00200000;
const RF_NotForEdit = 0x00400000;
const MaxInt = 0x7fffffff;
const Pi = 3.1415926535897932;

enum EPage
{
    EPage_None,                     // 0
    EPage_BackToLastPage,           // 1
    EPage_Logo,                     // 2
    EPage_Login,                    // 3
    EPage_CharacterCreation,        // 4
    EPage_ServerSelection,          // 5
    EPage_Lobby,                    // 6
    EPage_Lobby2,                   // 7
    EPage_Channel,                  // 8
    EPage_GameRoom,                 // 9
    EPage_RoomLobby,                // 10
    EPage_MatchResult,              // 11
    Epage_MatchResult2,             // 12
    Epage_MatchResult_Booty,        // 13
    EPage_ControlTest,              // 14
    EPage_ControlTest2,             // 15
    EPage_ControlTestTab,           // 16
    EPage_ControlTestVerticalTab,   // 17
    EPage_Auction,                  // 18
    EPage_Help,                     // 19
    EPage_Mail,                     // 20
    EPage_Store,                    // 21
    EPage_Inventory,                // 22
    EPage_MyInfo,                   // 23
    EPage_Clan,                     // 24
    EPage_Credit,                   // 25
    EPage_ClanWar                   // 26
};

enum ESpawnTeam
{
    EST_ATTACK_TEAM,                // 0
    EST_PROTECT_TEAM                // 1
};

enum ECamOrientation
{
    CAMORIENT_None,                 // 0
    CAMORIENT_LookAtActor,          // 1
    CAMORIENT_FacePath,             // 2
    CAMORIENT_Interpolate,          // 3
    CAMORIENT_Dolly                 // 4
};

enum EAxis
{
    AXIS_X,                         // 0
    AXIS_Y,                         // 1
    AXIS_Z                          // 2
};

enum EDrawPivot
{
    DP_UpperLeft,                   // 0
    DP_UpperMiddle,                 // 1
    DP_UpperRight,                  // 2
    DP_MiddleRight,                 // 3
    DP_LowerRight,                  // 4
    DP_LowerMiddle,                 // 5
    DP_LowerLeft,                   // 6
    DP_MiddleLeft,                  // 7
    DP_MiddleMiddle                 // 8
};

enum EDetailMode
{
    DM_Low,                         // 0
    DM_High,                        // 1
    DM_SuperHigh                    // 2
};

enum MessageType
{
    MT_CHAT_ALL,                    // 0
    MT_CHAT_TEAM,                   // 1
    MT_CHAT_GHOST_ALL,              // 2
    MT_CHAT_GHOST_TEAM,             // 3
    MT_WHISPER,                     // 4
    MT_CLAN,                        // 5
    MT_SYSTEM,                      // 6
    MT_COMMUNICATION,               // 7
    MT_CHAT_ALL_SELF,               // 8
    MT_CHAT_TEAM_SELF,              // 9
    MT_CHAT_BROADCAST_ITEM          // 10
};

enum EAPriority
{
    AP_Normal,                      // 0
    AP_NoDuplicates,                // 1
    AP_InstantPlay,                 // 2
    AP_InstantOrQueueSwitch,        // 3
    AP_MustQueue                    // 4
};

struct BtrDouble
{
    var() config int dummy_1_DO_NOT_USE;
    var() config int dummy_2_DO_NOT_USE;
};

struct Guid
{
    var int A;
    var int B;
    var int C;
    var int D;
};

struct Vector
{
    var() config float X;
    var() config float Y;
    var() config float Z;
};

struct Plane extends Vector
{
    var() config float W;
};

struct Rotator
{
    var() config int Pitch;
    var() config int Yaw;
    var() config int Roll;
};

struct Coords
{
    var() config Vector Origin;
    var() config Vector XAxis;
    var() config Vector YAxis;
    var() config Vector ZAxis;
};

struct Quat
{
    var() config float X;
    var() config float Y;
    var() config float Z;
    var() config float W;
};

struct Range
{
    var() config float Min;
    var() config float Max;
};

struct RangeVector
{
    var() config Range X;
    var() config Range Y;
    var() config Range Z;
};

struct Scale
{
    enum ESheerAxis
    {
        SHEER_None,                     // 0
        SHEER_XY,                       // 1
        SHEER_XZ,                       // 2
        SHEER_YX,                       // 3
        SHEER_YZ,                       // 4
        SHEER_ZX,                       // 5
        SHEER_ZY                        // 6
    };

    var() config Vector Scale;
    var() config float SheerRate;
    var() config ESheerAxis SheerAxis;
};

struct Color
{
    var() config byte B;
    var() config byte G;
    var() config byte R;
    var() config byte A;
};

struct Box
{
    var Vector Min;
    var Vector Max;
    var byte IsValid;
};

struct IntBox
{
    var int X1;
    var int Y1;
    var int X2;
    var int Y2;
};

struct IntBoxWH
{
    var int X;
    var int Y;
    var int W;
    var int H;
};

struct FloatBox
{
    var float X1;
    var float Y1;
    var float X2;
    var float Y2;
};

struct FloatBoxWH
{
    var float X;
    var float Y;
    var float W;
    var float H;
};

struct BoundingVolume extends Box
{
    var Plane Sphere;
};

struct Matrix
{
    var() Plane XPlane;
    var() Plane YPlane;
    var() Plane ZPlane;
    var() Plane WPlane;
};

struct InterpCurvePoint
{
    var() float InVal;
    var() float OutVal;
};

struct InterpCurve
{
    var() array<InterpCurvePoint> Points;
};

struct CompressedPosition
{
    var Vector Location;
    var Rotator Rotation;
    var Vector Velocity;
};

struct TMultiMap
{
    var transient pointer FArray_Data;
    var int FArray_ArrayNum;
    var int FArray_ArrayMax;
    var transient pointer TMapBase_Hash;
    var int TMapBase_HashCount;
};

struct CombatSituationLine
{
    var Vector vStartPos;
    var Vector vEndPos;
    var Color LineColor;
};

struct CombatSituationPoint
{
    var Vector vPos;
    var Color PointColor;
};

struct CombatSituationNameTag
{
    var Vector vPos;
    var string szName;
};

struct CombatSituationArrow
{
    var Vector vPos;
    var Rotator rRayDir;
    var Color ArrowColor;
};

struct CombatSituationSphere
{
    var Vector vCenterPos;
    var float fInRadius;
    var float fOutRadius;
    var Color kColor;
};

struct MessageItem
{
    var string Text;
    var Object.MessageType Type;
    var float TimeWritten;
    var int FontSize;
    var Color TextColor;
    var float TimeToRemove;
};

struct GameModeInfo
{
    var string ClassName;
    var string UserFriendlyName;
    var string ModeDescription;
    var array<string> TimeLimits;
    var array<string> Scores;
    var array<string> Scores_DefaultTimeLimits;
    var string ScoreDefault;
    var array<int> UserCount;
    var int UserCount_Default;
    var bool bPlayWithBots;
    var int BotUserTeam_Default;
    var int BotNum0_Default;
    var int BotNum1_Default;
    var int BotDifficulty_Default;
    var int ModeIndex;
};

struct IntArray
{
    var array<int> Values;
};

struct BtrTime
{
    var int Year;
    var int Month;
    var int DayOfWeek;
    var int Day;
    var int Hour;
    var int Minute;
    var int Second;
    var int Milliseconds;
};

var private native const transient pointer ObjectInternal[7];
var native const Object Outer;
var native const int ObjectFlags;
var() native const editconst noexport name Name;
var native const editconst Class Class;

static function BtrTime BtrTimeToBtrDayTime(BtrTime it)
{
    local BtrTime t;
    local int nTotal_day, i, nMonth_day;

    nMonth_day[0] = 31;
    nMonth_day[1] = 0;
    nMonth_day[2] = 31;
    nMonth_day[3] = 30;
    nMonth_day[4] = 31;
    nMonth_day[5] = 30;
    nMonth_day[6] = 31;
    nMonth_day[7] = 31;
    nMonth_day[8] = 30;
    nMonth_day[9] = 31;
    nMonth_day[10] = 30;
    nMonth_day[11] = 31;
    i = 2009;
    J0x8C:

    // End:0x10B [Loop If]
    if(i < it.Year)
    {
        // End:0xF5
        if((((float(i) % float(4)) == float(0)) && (float(i) % float(100)) != float(0)) || (float(i) % float(400)) == float(0))
        {
            nTotal_day += 366;
            // [Explicit Continue]
            goto J0x101;
        }
        nTotal_day += 365;
        J0x101:

        i++;
        // [Loop Continue]
        goto J0x8C;
    }
    // End:0x16D
    if((((float(it.Year) % float(4)) == float(0)) && (float(it.Year) % float(100)) != float(0)) || (float(it.Year) % float(400)) == float(0))
    {
        nMonth_day[1] = 29;        
    }
    else
    {
        nMonth_day[1] = 28;
    }
    i = 0;
    J0x17E:

    // End:0x1B1 [Loop If]
    if(i < (it.Month - 1))
    {
        nTotal_day += nMonth_day[i];
        i++;
        // [Loop Continue]
        goto J0x17E;
    }
    nTotal_day += it.Day;
    t.Year = 0;
    t.Month = 0;
    t.Day = nTotal_day;
    t.DayOfWeek = it.DayOfWeek;
    t.Hour = it.Hour;
    t.Minute = it.Minute;
    t.Second = it.Second;
    t.Milliseconds = it.Milliseconds;
    return t;
    //return;    
}

static function BtrTime BtrTimeSubstract(BtrTime leftT, BtrTime rightT)
{
    local BtrTime t;

    leftT = BtrTimeToBtrDayTime(leftT);
    rightT = BtrTimeToBtrDayTime(rightT);
    t.Day = leftT.Day - rightT.Day;
    t.Hour = leftT.Hour - rightT.Hour;
    t.Minute = leftT.Minute - rightT.Minute;
    t.Second = leftT.Second - rightT.Second;
    t.Milliseconds = leftT.Milliseconds - rightT.Milliseconds;
    // End:0xF4
    if(t.Milliseconds < 0)
    {
        t.Second--;
        t.Milliseconds += 1000;
    }
    // End:0x11E
    if(t.Second < 0)
    {
        t.Minute--;
        t.Second += 60;
    }
    // End:0x148
    if(t.Minute < 0)
    {
        t.Hour--;
        t.Minute += 60;
    }
    // End:0x172
    if(t.Hour < 0)
    {
        t.Day--;
        t.Hour += 24;
    }
    return t;
    //return;    
}

static function BtrDouble EmptyBtrDouble()
{
    local BtrDouble bd;

    bd.dummy_1_DO_NOT_USE = 0;
    bd.dummy_2_DO_NOT_USE = 0;
    return bd;
    //return;    
}

static function BtrTime EmptyBtrTime()
{
    local BtrTime bt;

    return bt;
    //return;    
}

// Export UObject::execBtrDoubleMinus(FFrame&, void* const)
native final function BtrDouble BtrDoubleMinus(BtrDouble A, BtrDouble B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execBtrDoublePlus(FFrame&, void* const)
native final function BtrDouble BtrDoublePlus(BtrDouble A, BtrDouble B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execGetLocalTimeToBtrDouble(FFrame&, void* const)
native final function GetLocalTimeToBtrDouble(out BtrDouble A)
{
    //native.A;        
}

// Export UObject::execGetLocalTimeToBtrTime(FFrame&, void* const)
native final function GetLocalTimeToBtrTime(out BtrTime A)
{
    //native.A;        
}

// Export UObject::execBtrDoubleToBtrTime(FFrame&, void* const)
native final function BtrDoubleToBtrTime(out BtrDouble A, out BtrTime B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execBtrDoubleLessEqual(FFrame&, void* const)
native final function bool BtrDoubleLessEqual(out BtrDouble A, out BtrDouble B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execBtrTimeToBtrDouble(FFrame&, void* const)
native final function BtrTimeToBtrDouble(out BtrTime A, out BtrDouble B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execNot_PreBool(FFrame&, void* const)
native(129) static final preoperator bool !(bool A)
{
    //native.A;        
}

// Export UObject::execEqualEqual_BoolBool(FFrame&, void* const)
native(242) static final operator(24) bool ==(bool A, bool B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execNotEqual_BoolBool(FFrame&, void* const)
native(243) static final operator(26) bool !=(bool A, bool B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execAndAnd_BoolBool(FFrame&, void* const)
native(130) static final operator(30) bool &&(bool A, skip bool B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execXorXor_BoolBool(FFrame&, void* const)
native(131) static final operator(30) bool ^^(bool A, bool B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execOrOr_BoolBool(FFrame&, void* const)
native(132) static final operator(32) bool ||(bool A, skip bool B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execMultiplyEqual_ByteByte(FFrame&, void* const)
native(133) static final operator(34) byte *=(out byte A, byte B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execDivideEqual_ByteByte(FFrame&, void* const)
native(134) static final operator(34) byte /=(out byte A, byte B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execAddEqual_ByteByte(FFrame&, void* const)
native(135) static final operator(34) byte +=(out byte A, byte B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execSubtractEqual_ByteByte(FFrame&, void* const)
native(136) static final operator(34) byte -=(out byte A, byte B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execAddAdd_PreByte(FFrame&, void* const)
native(137) static final preoperator byte ++(out byte A)
{
    //native.A;        
}

// Export UObject::execSubtractSubtract_PreByte(FFrame&, void* const)
native(138) static final preoperator byte --(out byte A)
{
    //native.A;        
}

// Export UObject::execAddAdd_Byte(FFrame&, void* const)
native(139) static final postoperator byte ++(out byte A)
{
    //native.A;        
}

// Export UObject::execSubtractSubtract_Byte(FFrame&, void* const)
native(140) static final postoperator byte --(out byte A)
{
    //native.A;        
}

// Export UObject::execComplement_PreInt(FFrame&, void* const)
native(141) static final preoperator int ~(int A)
{
    //native.A;        
}

// Export UObject::execSubtract_PreInt(FFrame&, void* const)
native(143) static final preoperator int -(int A)
{
    //native.A;        
}

// Export UObject::execMultiply_IntInt(FFrame&, void* const)
native(144) static final operator(16) int *(int A, int B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execDivide_IntInt(FFrame&, void* const)
native(145) static final operator(16) int /(int A, int B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execAdd_IntInt(FFrame&, void* const)
native(146) static final operator(20) int +(int A, int B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execSubtract_IntInt(FFrame&, void* const)
native(147) static final operator(20) int -(int A, int B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execLessLess_IntInt(FFrame&, void* const)
native(148) static final operator(22) int <<(int A, int B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execGreaterGreater_IntInt(FFrame&, void* const)
native(149) static final operator(22) int >>(int A, int B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execGreaterGreaterGreater_IntInt(FFrame&, void* const)
native(196) static final operator(22) int >>>(int A, int B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execLess_IntInt(FFrame&, void* const)
native(150) static final operator(24) bool <(int A, int B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execGreater_IntInt(FFrame&, void* const)
native(151) static final operator(24) bool >(int A, int B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execLessEqual_IntInt(FFrame&, void* const)
native(152) static final operator(24) bool <=(int A, int B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execGreaterEqual_IntInt(FFrame&, void* const)
native(153) static final operator(24) bool >=(int A, int B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execEqualEqual_IntInt(FFrame&, void* const)
native(154) static final operator(24) bool ==(int A, int B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execNotEqual_IntInt(FFrame&, void* const)
native(155) static final operator(26) bool !=(int A, int B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execAnd_IntInt(FFrame&, void* const)
native(156) static final operator(28) int &(int A, int B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execXor_IntInt(FFrame&, void* const)
native(157) static final operator(28) int ^(int A, int B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execOr_IntInt(FFrame&, void* const)
native(158) static final operator(28) int |(int A, int B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execMultiplyEqual_IntFloat(FFrame&, void* const)
native(159) static final operator(34) int *=(out int A, float B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execDivideEqual_IntFloat(FFrame&, void* const)
native(160) static final operator(34) int /=(out int A, float B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execAddEqual_IntInt(FFrame&, void* const)
native(161) static final operator(34) int +=(out int A, int B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execSubtractEqual_IntInt(FFrame&, void* const)
native(162) static final operator(34) int -=(out int A, int B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execAddAdd_PreInt(FFrame&, void* const)
native(163) static final preoperator int ++(out int A)
{
    //native.A;        
}

// Export UObject::execSubtractSubtract_PreInt(FFrame&, void* const)
native(164) static final preoperator int --(out int A)
{
    //native.A;        
}

// Export UObject::execAddAdd_Int(FFrame&, void* const)
native(165) static final postoperator int ++(out int A)
{
    //native.A;        
}

// Export UObject::execSubtractSubtract_Int(FFrame&, void* const)
native(166) static final postoperator int --(out int A)
{
    //native.A;        
}

// Export UObject::execRand(FFrame&, void* const)
native(167) static final function int Rand(int Max)
{
    //native.Max;        
}

// Export UObject::execMin(FFrame&, void* const)
native(249) static final function int Min(int A, int B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execMax(FFrame&, void* const)
native(250) static final function int Max(int A, int B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execClamp(FFrame&, void* const)
native(251) static final function int Clamp(int V, int A, int B)
{
    //native.V;
    //native.A;
    //native.B;        
}

// Export UObject::execSubtract_PreFloat(FFrame&, void* const)
native(169) static final preoperator float -(float A)
{
    //native.A;        
}

// Export UObject::execMultiplyMultiply_FloatFloat(FFrame&, void* const)
native(170) static final operator(12) float **(float A, float B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execMultiply_FloatFloat(FFrame&, void* const)
native(171) static final operator(16) float *(float A, float B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execDivide_FloatFloat(FFrame&, void* const)
native(172) static final operator(16) float /(float A, float B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execPercent_FloatFloat(FFrame&, void* const)
native(173) static final operator(18) float %(float A, float B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execAdd_FloatFloat(FFrame&, void* const)
native(174) static final operator(20) float +(float A, float B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execSubtract_FloatFloat(FFrame&, void* const)
native(175) static final operator(20) float -(float A, float B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execLess_FloatFloat(FFrame&, void* const)
native(176) static final operator(24) bool <(float A, float B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execGreater_FloatFloat(FFrame&, void* const)
native(177) static final operator(24) bool >(float A, float B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execLessEqual_FloatFloat(FFrame&, void* const)
native(178) static final operator(24) bool <=(float A, float B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execGreaterEqual_FloatFloat(FFrame&, void* const)
native(179) static final operator(24) bool >=(float A, float B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execEqualEqual_FloatFloat(FFrame&, void* const)
native(180) static final operator(24) bool ==(float A, float B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execComplementEqual_FloatFloat(FFrame&, void* const)
native(210) static final operator(24) bool ~=(float A, float B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execNotEqual_FloatFloat(FFrame&, void* const)
native(181) static final operator(26) bool !=(float A, float B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execMultiplyEqual_FloatFloat(FFrame&, void* const)
native(182) static final operator(34) float *=(out float A, float B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execDivideEqual_FloatFloat(FFrame&, void* const)
native(183) static final operator(34) float /=(out float A, float B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execAddEqual_FloatFloat(FFrame&, void* const)
native(184) static final operator(34) float +=(out float A, float B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execSubtractEqual_FloatFloat(FFrame&, void* const)
native(185) static final operator(34) float -=(out float A, float B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execAbs(FFrame&, void* const)
native(186) static final function float Abs(float A)
{
    //native.A;        
}

// Export UObject::execSin(FFrame&, void* const)
native(187) static final function float Sin(float A)
{
    //native.A;        
}

// Export UObject::execAsin(FFrame&, void* const)
native static final function float Asin(float A)
{
    //native.A;        
}

// Export UObject::execCos(FFrame&, void* const)
native(188) static final function float Cos(float A)
{
    //native.A;        
}

// Export UObject::execAcos(FFrame&, void* const)
native static final function float Acos(float A)
{
    //native.A;        
}

// Export UObject::execTan(FFrame&, void* const)
native(189) static final function float Tan(float A)
{
    //native.A;        
}

// Export UObject::execAtan(FFrame&, void* const)
native(190) static final function float Atan(float A, float B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execExp(FFrame&, void* const)
native(191) static final function float Exp(float A)
{
    //native.A;        
}

// Export UObject::execLoge(FFrame&, void* const)
native(192) static final function float Loge(float A)
{
    //native.A;        
}

// Export UObject::execSqrt(FFrame&, void* const)
native(193) static final function float Sqrt(float A)
{
    //native.A;        
}

// Export UObject::execSquare(FFrame&, void* const)
native(194) static final function float Square(float A)
{
    //native.A;        
}

// Export UObject::execFRand(FFrame&, void* const)
native(195) static final function float FRand();

// Export UObject::execFMin(FFrame&, void* const)
native(244) static final function float FMin(float A, float B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execFMax(FFrame&, void* const)
native(245) static final function float FMax(float A, float B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execFClamp(FFrame&, void* const)
native(246) static final function float FClamp(float V, float A, float B)
{
    //native.V;
    //native.A;
    //native.B;        
}

// Export UObject::execLerp(FFrame&, void* const)
native(247) static final function float Lerp(float Alpha, float A, float B, optional bool bClampRange)
{
    //native.Alpha;
    //native.A;
    //native.B;
    //native.bClampRange;        
}

// Export UObject::execSmerp(FFrame&, void* const)
native(248) static final function float Smerp(float Alpha, float A, float B)
{
    //native.Alpha;
    //native.A;
    //native.B;        
}

// Export UObject::execCeil(FFrame&, void* const)
native(253) static final function float Ceil(float A)
{
    //native.A;        
}

// Export UObject::execRound(FFrame&, void* const)
native(257) static final function float Round(float A)
{
    //native.A;        
}

// Export UObject::execSubtract_PreVector(FFrame&, void* const)
native(211) static final preoperator Vector -(Vector A)
{
    //native.A;        
}

// Export UObject::execMultiply_VectorFloat(FFrame&, void* const)
native(212) static final operator(16) Vector *(Vector A, float B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execMultiply_FloatVector(FFrame&, void* const)
native(213) static final operator(16) Vector *(float A, Vector B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execMultiply_VectorVector(FFrame&, void* const)
native(296) static final operator(16) Vector *(Vector A, Vector B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execDivide_VectorFloat(FFrame&, void* const)
native(214) static final operator(16) Vector /(Vector A, float B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execAdd_VectorVector(FFrame&, void* const)
native(215) static final operator(20) Vector +(Vector A, Vector B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execSubtract_VectorVector(FFrame&, void* const)
native(216) static final operator(20) Vector -(Vector A, Vector B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execLessLess_VectorRotator(FFrame&, void* const)
native(275) static final operator(22) Vector <<(Vector A, Rotator B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execGreaterGreater_VectorRotator(FFrame&, void* const)
native(276) static final operator(22) Vector >>(Vector A, Rotator B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execEqualEqual_VectorVector(FFrame&, void* const)
native(217) static final operator(24) bool ==(Vector A, Vector B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execNotEqual_VectorVector(FFrame&, void* const)
native(218) static final operator(26) bool !=(Vector A, Vector B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execDot_VectorVector(FFrame&, void* const)
native(219) static final operator(16) float Dot(Vector A, Vector B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execCross_VectorVector(FFrame&, void* const)
native(220) static final operator(16) Vector Cross(Vector A, Vector B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execMultiplyEqual_VectorFloat(FFrame&, void* const)
native(221) static final operator(34) Vector *=(out Vector A, float B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execMultiplyEqual_VectorVector(FFrame&, void* const)
native(297) static final operator(34) Vector *=(out Vector A, Vector B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execDivideEqual_VectorFloat(FFrame&, void* const)
native(222) static final operator(34) Vector /=(out Vector A, float B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execAddEqual_VectorVector(FFrame&, void* const)
native(223) static final operator(34) Vector +=(out Vector A, Vector B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execSubtractEqual_VectorVector(FFrame&, void* const)
native(224) static final operator(34) Vector -=(out Vector A, Vector B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execVSize(FFrame&, void* const)
native(225) static final function float VSize(Vector A)
{
    //native.A;        
}

// Export UObject::execNormal(FFrame&, void* const)
native(226) static final function Vector Normal(Vector A)
{
    //native.A;        
}

// Export UObject::execInvert(FFrame&, void* const)
native(227) static final function Invert(out Vector X, out Vector Y, out Vector Z)
{
    //native.X;
    //native.Y;
    //native.Z;        
}

// Export UObject::execVRand(FFrame&, void* const)
native(252) static final function Vector VRand();

// Export UObject::execMirrorVectorByNormal(FFrame&, void* const)
native(300) static final function Vector MirrorVectorByNormal(Vector Vect, Vector Normal)
{
    //native.Vect;
    //native.Normal;        
}

// Export UObject::execEqualEqual_RotatorRotator(FFrame&, void* const)
native(142) static final operator(24) bool ==(Rotator A, Rotator B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execNotEqual_RotatorRotator(FFrame&, void* const)
native(203) static final operator(26) bool !=(Rotator A, Rotator B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execMultiply_RotatorFloat(FFrame&, void* const)
native(287) static final operator(16) Rotator *(Rotator A, float B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execMultiply_FloatRotator(FFrame&, void* const)
native(288) static final operator(16) Rotator *(float A, Rotator B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execDivide_RotatorFloat(FFrame&, void* const)
native(289) static final operator(16) Rotator /(Rotator A, float B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execMultiplyEqual_RotatorFloat(FFrame&, void* const)
native(290) static final operator(34) Rotator *=(out Rotator A, float B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execDivideEqual_RotatorFloat(FFrame&, void* const)
native(291) static final operator(34) Rotator /=(out Rotator A, float B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execAdd_RotatorRotator(FFrame&, void* const)
native(316) static final operator(20) Rotator +(Rotator A, Rotator B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execSubtract_RotatorRotator(FFrame&, void* const)
native(317) static final operator(20) Rotator -(Rotator A, Rotator B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execAddEqual_RotatorRotator(FFrame&, void* const)
native(318) static final operator(34) Rotator +=(out Rotator A, Rotator B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execSubtractEqual_RotatorRotator(FFrame&, void* const)
native(319) static final operator(34) Rotator -=(out Rotator A, Rotator B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execGetAxes(FFrame&, void* const)
native(229) static final function GetAxes(Rotator A, out Vector X, out Vector Y, out Vector Z)
{
    //native.A;
    //native.X;
    //native.Y;
    //native.Z;        
}

// Export UObject::execGetUnAxes(FFrame&, void* const)
native(230) static final function GetUnAxes(Rotator A, out Vector X, out Vector Y, out Vector Z)
{
    //native.A;
    //native.X;
    //native.Y;
    //native.Z;        
}

// Export UObject::execRotRand(FFrame&, void* const)
native(320) static final function Rotator RotRand(optional bool bRoll)
{
    //native.bRoll;        
}

// Export UObject::execOrthoRotation(FFrame&, void* const)
native static final function Rotator OrthoRotation(Vector X, Vector Y, Vector Z)
{
    //native.X;
    //native.Y;
    //native.Z;        
}

// Export UObject::execNormalize(FFrame&, void* const)
native static final function Rotator Normalize(Rotator Rot)
{
    //native.Rot;        
}

// Export UObject::execClockwiseFrom_IntInt(FFrame&, void* const)
native static final operator(24) bool ClockwiseFrom(int A, int B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execConcat_StrStr(FFrame&, void* const)
native(112) static final operator(40) string $(coerce string A, coerce string B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execAt_StrStr(FFrame&, void* const)
native(168) static final operator(40) string @(coerce string A, coerce string B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execLess_StrStr(FFrame&, void* const)
native(115) static final operator(24) bool <(string A, string B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execGreater_StrStr(FFrame&, void* const)
native(116) static final operator(24) bool >(string A, string B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execLessEqual_StrStr(FFrame&, void* const)
native(120) static final operator(24) bool <=(string A, string B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execGreaterEqual_StrStr(FFrame&, void* const)
native(121) static final operator(24) bool >=(string A, string B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execEqualEqual_StrStr(FFrame&, void* const)
native(122) static final operator(24) bool ==(string A, string B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execNotEqual_StrStr(FFrame&, void* const)
native(123) static final operator(26) bool !=(string A, string B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execComplementEqual_StrStr(FFrame&, void* const)
native(124) static final operator(24) bool ~=(string A, string B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execConcatEqual_StrStr(FFrame&, void* const)
native(322) static final operator(44) string $=(out string A, coerce string B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execAtEqual_StrStr(FFrame&, void* const)
native(323) static final operator(44) string @=(out string A, coerce string B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execSubtractEqual_StrStr(FFrame&, void* const)
native(324) static final operator(45) string -=(out string A, coerce string B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execLen(FFrame&, void* const)
native(125) static final function int Len(coerce string S)
{
    //native.S;        
}

// Export UObject::execInStr(FFrame&, void* const)
native(126) static final function int InStr(coerce string S, coerce string t)
{
    //native.S;
    //native.t;        
}

// Export UObject::execMid(FFrame&, void* const)
native(127) static final function string Mid(coerce string S, int i, optional int j)
{
    //native.S;
    //native.i;
    //native.j;        
}

// Export UObject::execLeft(FFrame&, void* const)
native(128) static final function string Left(coerce string S, int i)
{
    //native.S;
    //native.i;        
}

// Export UObject::execRight(FFrame&, void* const)
native(234) static final function string Right(coerce string S, int i)
{
    //native.S;
    //native.i;        
}

// Export UObject::execCaps(FFrame&, void* const)
native(235) static final function string Caps(coerce string S)
{
    //native.S;        
}

// Export UObject::execChr(FFrame&, void* const)
native(236) static final function string Chr(int i)
{
    //native.i;        
}

// Export UObject::execAsc(FFrame&, void* const)
native(237) static final function int Asc(string S)
{
    //native.S;        
}

// Export UObject::execLocs(FFrame&, void* const)
native(238) static final function string Locs(coerce string S)
{
    //native.S;        
}

// Export UObject::execDivide(FFrame&, void* const)
native(239) static final function bool Divide(coerce string Src, string Divider, out string LeftPart, out string RightPart)
{
    //native.Src;
    //native.Divider;
    //native.LeftPart;
    //native.RightPart;        
}

// Export UObject::execSplit(FFrame&, void* const)
native(240) static final function int Split(coerce string Src, string Divider, out array<string> Parts)
{
    //native.Src;
    //native.Divider;
    //native.Parts;        
}

// Export UObject::execKeyCode(FFrame&, void* const)
native(241) static final function int KeyCode(string S, int i)
{
    //native.S;
    //native.i;        
}

// Export UObject::execStrCmp(FFrame&, void* const)
native(200) static final function int StrCmp(coerce string S, coerce string t, optional int Count, optional bool bCaseSensitive)
{
    //native.S;
    //native.t;
    //native.Count;
    //native.bCaseSensitive;        
}

// Export UObject::execRepl(FFrame&, void* const)
native(201) static final function string Repl(coerce string Src, coerce string Match, coerce string With, optional bool bCaseSensitive)
{
    //native.Src;
    //native.Match;
    //native.With;
    //native.bCaseSensitive;        
}

// Export UObject::execEval(FFrame&, void* const)
native(202) static final function string Eval(bool Condition, coerce string ResultIfTrue, coerce string ResultIfFalse)
{
    //native.Condition;
    //native.ResultIfTrue;
    //native.ResultIfFalse;        
}

// Export UObject::execEqualEqual_ObjectObject(FFrame&, void* const)
native(114) static final operator(24) bool ==(Object A, Object B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execNotEqual_ObjectObject(FFrame&, void* const)
native(119) static final operator(26) bool !=(Object A, Object B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execEqualEqual_NameName(FFrame&, void* const)
native(254) static final operator(24) bool ==(name A, name B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execNotEqual_NameName(FFrame&, void* const)
native(255) static final operator(26) bool !=(name A, name B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execMultiply_BtrDoubleBtrDouble(FFrame&, void* const)
native(900) static final operator(16) BtrDouble *(BtrDouble A, BtrDouble B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execMultiply_BtrDoubleInt(FFrame&, void* const)
native(901) static final operator(16) BtrDouble *(BtrDouble A, int B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execMultiply_BtrDoubleFloat(FFrame&, void* const)
native(902) static final operator(16) BtrDouble *(BtrDouble A, float B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execDivide_BtrDoubleBtrDouble(FFrame&, void* const)
native(903) static final operator(16) BtrDouble /(BtrDouble A, BtrDouble B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execDivide_BtrDoubleInt(FFrame&, void* const)
native(904) static final operator(16) BtrDouble /(BtrDouble A, int B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execDivide_BtrDoubleFloat(FFrame&, void* const)
native(905) static final operator(16) BtrDouble /(BtrDouble A, float B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execAdd_BtrDoubleBtrDouble(FFrame&, void* const)
native(906) static final operator(20) BtrDouble +(BtrDouble A, BtrDouble B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execAdd_BtrDoubleInt(FFrame&, void* const)
native(907) static final operator(20) BtrDouble +(BtrDouble A, int B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execAdd_BtrDoubleFloat(FFrame&, void* const)
native(908) static final operator(20) BtrDouble +(BtrDouble A, float B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execSubtract_BtrDoubleBtrDouble(FFrame&, void* const)
native(909) static final operator(20) BtrDouble -(BtrDouble A, BtrDouble B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execSubtract_BtrDoubleInt(FFrame&, void* const)
native(910) static final operator(20) BtrDouble -(BtrDouble A, int B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execSubtract_BtrDoubleFloat(FFrame&, void* const)
native(911) static final operator(20) BtrDouble -(BtrDouble A, float B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execEqualEqual_BtrDoubleBtrDouble(FFrame&, void* const)
native(912) static final operator(24) bool ==(BtrDouble A, BtrDouble B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execNotEqual_BtrDoubleBtrDouble(FFrame&, void* const)
native(913) static final operator(26) bool !=(BtrDouble A, BtrDouble B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execMultiplyEqual_BtrDoubleBtrDouble(FFrame&, void* const)
native(914) static final operator(34) BtrDouble *=(out BtrDouble A, BtrDouble B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execDivideEqual_BtrDoubleBtrDouble(FFrame&, void* const)
native(915) static final operator(34) BtrDouble /=(out BtrDouble A, BtrDouble B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execAddEqual_BtrDoubleBtrDouble(FFrame&, void* const)
native(916) static final operator(34) BtrDouble +=(out BtrDouble A, BtrDouble B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execSubtractEqual_BtrDoubleBtrDouble(FFrame&, void* const)
native(917) static final operator(34) BtrDouble -=(out BtrDouble A, BtrDouble B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execBtrDoubleGetToStr(FFrame&, void* const)
native(918) static final function string BtrDoubleGetToStr(BtrDouble A)
{
    //native.A;        
}

// Export UObject::execIntToBtrDouble(FFrame&, void* const)
native(921) static final function BtrDouble IntToBtrDouble(int A)
{
    //native.A;        
}

// Export UObject::execBtrDoubleToInt(FFrame&, void* const)
native(923) static final function int BtrDoubleToInt(BtrDouble A)
{
    //native.A;        
}

// Export UObject::execStringToBtrDouble(FFrame&, void* const)
native(924) static final function BtrDouble StringToBtrDouble(string A)
{
    //native.A;        
}

// Export UObject::execLess_BtrDoubleBtrDouble(FFrame&, void* const)
native(922) static final operator(24) bool <(BtrDouble A, BtrDouble B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execEqualEqual_BtrDoubleInt(FFrame&, void* const)
native(919) static final operator(24) bool ==(BtrDouble A, int B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execNotEqual_BtrDoubleInt(FFrame&, void* const)
native(920) static final operator(26) bool !=(BtrDouble A, int B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execInterpCurveEval(FFrame&, void* const)
native static final function float InterpCurveEval(InterpCurve curve, float Input)
{
    //native.curve;
    //native.Input;        
}

// Export UObject::execInterpCurveGetOutputRange(FFrame&, void* const)
native static final function InterpCurveGetOutputRange(InterpCurve curve, out float Min, out float Max)
{
    //native.curve;
    //native.Min;
    //native.Max;        
}

// Export UObject::execInterpCurveGetInputDomain(FFrame&, void* const)
native static final function InterpCurveGetInputDomain(InterpCurve curve, out float Min, out float Max)
{
    //native.curve;
    //native.Min;
    //native.Max;        
}

// Export UObject::execQuatProduct(FFrame&, void* const)
native static final function Quat QuatProduct(Quat A, Quat B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execQuatInvert(FFrame&, void* const)
native static final function Quat QuatInvert(Quat A)
{
    //native.A;        
}

// Export UObject::execQuatRotateVector(FFrame&, void* const)
native static final function Vector QuatRotateVector(Quat A, Vector B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execQuatFindBetween(FFrame&, void* const)
native static final function Quat QuatFindBetween(Vector A, Vector B)
{
    //native.A;
    //native.B;        
}

// Export UObject::execQuatFromAxisAndAngle(FFrame&, void* const)
native static final function Quat QuatFromAxisAndAngle(Vector Axis, float Angle)
{
    //native.Axis;
    //native.Angle;        
}

// Export UObject::execQuatFromRotator(FFrame&, void* const)
native static final function Quat QuatFromRotator(Rotator A)
{
    //native.A;        
}

// Export UObject::execQuatToRotator(FFrame&, void* const)
native static final function Rotator QuatToRotator(Quat A)
{
    //native.A;        
}

// Export UObject::execQuatSlerp(FFrame&, void* const)
native static final function Quat QuatSlerp(Quat A, Quat B, float Slerp)
{
    //native.A;
    //native.B;
    //native.Slerp;        
}

// Export UObject::execLog(FFrame&, void* const)
native(231) static final function Log(coerce string S, optional name Tag)
{
    //native.S;
    //native.Tag;        
}

// Export UObject::execWarn(FFrame&, void* const)
native(232) static final function Warn(coerce string S)
{
    //native.S;        
}

// Export UObject::execLocalize(FFrame&, void* const)
native static function string Localize(string SectionName, string KeyName, string PackageName)
{
    //native.SectionName;
    //native.KeyName;
    //native.PackageName;        
}

// Export UObject::execCrashLog(FFrame&, void* const)
native(270) static final function CrashLog(coerce string S, optional name Tag)
{
    //native.S;
    //native.Tag;        
}

// Export UObject::execCombatLog(FFrame&, void* const)
native static final function CombatLog(coerce string S, optional name Tag)
{
    //native.S;
    //native.Tag;        
}

// Export UObject::execResetCombatLog(FFrame&, void* const)
native static final function ResetCombatLog();

// Export UObject::execGotoState(FFrame&, void* const)
native(113) final function GotoState(optional name NewState, optional name Label)
{
    //native.NewState;
    //native.Label;        
}

// Export UObject::execIsInState(FFrame&, void* const)
native(281) final function bool IsInState(name TestState)
{
    //native.TestState;        
}

// Export UObject::execGetStateName(FFrame&, void* const)
native(284) final function name GetStateName();

// Export UObject::execClassIsChildOf(FFrame&, void* const)
native(258) static final function bool ClassIsChildOf(Class TestClass, Class ParentClass)
{
    //native.TestClass;
    //native.ParentClass;        
}

// Export UObject::execIsA(FFrame&, void* const)
native(303) final function bool IsA(name ClassName)
{
    //native.ClassName;        
}

// Export UObject::execEnable(FFrame&, void* const)
native(117) final function Enable(name ProbeFunc)
{
    //native.ProbeFunc;        
}

// Export UObject::execDisable(FFrame&, void* const)
native(118) final function Disable(name ProbeFunc)
{
    //native.ProbeFunc;        
}

// Export UObject::execGetPropertyText(FFrame&, void* const)
native final function string GetPropertyText(string PropName)
{
    //native.PropName;        
}

// Export UObject::execSetPropertyText(FFrame&, void* const)
native final function bool SetPropertyText(string PropName, string PropValue)
{
    //native.PropName;
    //native.PropValue;        
}

// Export UObject::execGetEnum(FFrame&, void* const)
native static final function name GetEnum(Object E, coerce int i)
{
    //native.E;
    //native.i;        
}

// Export UObject::execDynamicLoadObject(FFrame&, void* const)
native static final function Object DynamicLoadObject(string ObjectName, Class ObjectClass, optional bool MayFail)
{
    //native.ObjectName;
    //native.ObjectClass;
    //native.MayFail;        
}

// Export UObject::execFindObject(FFrame&, void* const)
native static final function Object FindObject(string ObjectName, Class ObjectClass)
{
    //native.ObjectName;
    //native.ObjectClass;        
}

// Export UObject::execSaveConfig(FFrame&, void* const)
native(536) final function SaveConfig();

// Export UObject::execClearConfig(FFrame&, void* const)
native(537) final function ClearConfig(optional string PropName)
{
    //native.PropName;        
}

// Export UObject::execStaticSaveConfig(FFrame&, void* const)
native static final function StaticSaveConfig();

// Export UObject::execResetConfig(FFrame&, void* const)
native static final function ResetConfig(optional string PropName)
{
    //native.PropName;        
}

// Export UObject::execStaticClearConfig(FFrame&, void* const)
native static final function StaticClearConfig(optional string PropName)
{
    //native.PropName;        
}

// Export UObject::execGetPerObjectNames(FFrame&, void* const)
native static final function array<string> GetPerObjectNames(string ININame, optional string ObjectClass, optional int MaxResults)
{
    //native.ININame;
    //native.ObjectClass;
    //native.MaxResults;        
}

final function float RandRange(float Min, float Max)
{
    return Min + ((Max - Min) * FRand());
    //return;    
}

// Export UObject::execStopWatch(FFrame&, void* const)
native(535) static final function StopWatch(optional bool bStop)
{
    //native.bStop;        
}

// Export UObject::execIsOnConsole(FFrame&, void* const)
native final function bool IsOnConsole();

// Export UObject::execIsSoaking(FFrame&, void* const)
native final function bool IsSoaking();

// Export UObject::execPlatformIsMacOS(FFrame&, void* const)
native final function bool PlatformIsMacOS();

// Export UObject::execPlatformIsUnix(FFrame&, void* const)
native final function bool PlatformIsUnix();

// Export UObject::execPlatformIsWindows(FFrame&, void* const)
native final function bool PlatformIsWindows();

// Export UObject::execPlatformIs64Bit(FFrame&, void* const)
native final function bool PlatformIs64Bit();

// Export UObject::execGetLastErrCode(FFrame&, void* const)
native final function int GetLastErrCode();

// Export UObject::execGetErrMsg(FFrame&, void* const)
native final function string GetErrMsg(int ErrCode)
{
    //native.ErrCode;        
}

event BeginState()
{
    //return;    
}

event EndState()
{
    //return;    
}

event Created()
{
    //return;    
}

// Export UObject::execAllObjects(FFrame&, void* const)
native(197) final iterator function AllObjects(Class baseClass, out Object obj)
{
    //native.baseClass;
    //native.obj;        
}

// Export UObject::execGetReferencers(FFrame&, void* const)
native final function GetReferencers(Object Target, out array<Object> Referencers)
{
    //native.Target;
    //native.Referencers;        
}

static simulated function string GetItemName(string FullName)
{
    local int pos;

    pos = InStr(FullName, ".");
    J0x10:

    // End:0x47 [Loop If]
    if(pos != -1)
    {
        FullName = Mid(FullName, pos + 1);
        pos = InStr(FullName, ".");
        // [Loop Continue]
        goto J0x10;
    }
    return FullName;
    //return;    
}

static final simulated function ReplaceText(out string Text, string Replace, string With)
{
    local int i;
    local string Input;

    // End:0x1C
    if((Text == "") || Replace == "")
    {
        return;
    }
    Input = Text;
    Text = "";
    i = InStr(Input, Replace);
    J0x41:

    // End:0xA0 [Loop If]
    if(i != -1)
    {
        Text = (Text $ Left(Input, i)) $ With;
        Input = Mid(Input, i + Len(Replace));
        i = InStr(Input, Replace);
        // [Loop Continue]
        goto J0x41;
    }
    Text = Text $ Input;
    //return;    
}

static final function EatStr(out string Dest, out string Source, int Num)
{
    Dest = Dest $ Left(Source, Num);
    Source = Mid(Source, Num);
    //return;    
}

static function Vector MakeVector(float X, float Y, float Z)
{
    local Vector V;

    V.X = X;
    V.Y = Y;
    V.Z = Z;
    return V;
    //return;    
}

static function slog(coerce string S)
{
    Log("");
    Log("");
    Log("");
    Log("");
    Log(S);
    Log("");
    Log("");
    Log("");
    Log("");
    //return;    
}

static simulated function string PadString(coerce string str, int totalDigits, string paddingChar)
{
    local int sLen, lp1;

    sLen = Len(str);
    lp1 = 0;
    J0x14:

    // End:0x46 [Loop If]
    if(lp1 < (totalDigits - sLen))
    {
        str = paddingChar $ str;
        lp1++;
        // [Loop Continue]
        goto J0x14;
    }
    return str;
    //return;    
}

static simulated function string PadLeft(coerce string str, int totalDigits, optional string paddingChar)
{
    local int sLen, lp1;

    // End:0x15
    if(paddingChar == "")
    {
        paddingChar = " ";
    }
    sLen = Len(str);
    lp1 = 0;
    J0x29:

    // End:0x5B [Loop If]
    if(lp1 < (totalDigits - sLen))
    {
        str = paddingChar $ str;
        lp1++;
        // [Loop Continue]
        goto J0x29;
    }
    return str;
    //return;    
}

static simulated function string PadRight(coerce string str, int totalDigits, optional string paddingChar)
{
    local int sLen, lp1;

    // End:0x15
    if(paddingChar == "")
    {
        paddingChar = " ";
    }
    sLen = Len(str);
    lp1 = 0;
    J0x29:

    // End:0x5B [Loop If]
    if(lp1 < (totalDigits - sLen))
    {
        str = str $ paddingChar;
        lp1++;
        // [Loop Continue]
        goto J0x29;
    }
    return str;
    //return;    
}

static function bool StrStartsWith(coerce string str, coerce string startStr)
{
    local int strL, startstrL;

    strL = Len(str);
    startstrL = Len(startStr);
    return Left(str, startstrL) == startStr;
    //return;    
}

function float Pow(float A, int B)
{
    local float t;
    local int lp1;

    t = 1.0000000;
    lp1 = 0;
    J0x12:

    // End:0x37 [Loop If]
    if(lp1 < B)
    {
        t *= A;
        lp1++;
        // [Loop Continue]
        goto J0x12;
    }
    return t;
    //return;    
}

function bool IsZeroVector(out Vector V)
{
    return ((V.X == float(0)) && V.Y == float(0)) && V.Z == float(0);
    //return;    
}

function ZeroVector(out Vector V)
{
    V.X = 0.0000000;
    V.Y = 0.0000000;
    V.Z = 0.0000000;
    //return;    
}

function NotifyDestroyed(Actor A)
{
    //return;    
}
