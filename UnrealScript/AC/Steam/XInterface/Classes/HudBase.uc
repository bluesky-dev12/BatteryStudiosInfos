/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\HudBase.uc
 * Package Imports:
 *	XInterface
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Structs:1
 *	Properties:94
 *	Functions:81
 *
 *******************************************************************************/
class HudBase extends HUD
    native
    transient;

enum eHUDSOUND
{
    EHS_QUICKSLOT_TOGGLE,
    EHS_QUICKSLOT_CHANGE,
    EHS_MINIMAP_TOGGLE,
    EHS_QUEST_STATE,
    EHS_QUEST_COMPLETE,
    EHS_FRIENDS_ON,
    EHS_WHISPER
};

struct native HudLocalizedMessage
{
    var class<LocalMessage> Message;
    var string StringMessage;
    var int Switch;
    var PlayerReplicationInfo RelatedPRI;
    var PlayerReplicationInfo RelatedPRI2;
    var Object OptionalObject;
    var float EndOfLife;
    var float Lifetime;
    var float StartTime;
    var Font StringFont;
    var Color DrawColor;
    var Core.Object.EDrawPivot DrawPivot;
    var Engine.LocalMessage.EStackMode StackMode;
    var float PosX;
    var float PosY;
    var float dx;
    var float dy;
    var bool Drawn;
    var bool PlaySound;
};

var int SpecPlayerLevel;
var int SpecPlayerLevelMarkID;
var localized string strSpectating;
var localized string strSpectateHelp;
var FloatBox fbSpectateLevel;
var FloatBox fbSpectateUser;
var FloatBox fbSpectateHelp;
var FloatBox fbSpectatingBack;
var() float NametagFactorZ;
var() float NametagExtraZ;
var() int NametagFontSize;
var() float NametagRadius;
var() int NametagShadowX;
var() int NametagShadowY;
var() Color NametagShadowColor;
var localized string NameTagInvulnerablePost;
var float NameTagVisUpdateTime;
var() SpriteWidget IconDefendBombHolder;
var() SpriteWidget IconInvulnerable;
var() transient int TeamIndex;
var() transient Engine.Actor.ERenderStyle PassStyle;
var array<HudBase> ChildHudParts;
var() transient HudLocalizedMessage LocalMessages[8];
var() class<Actor> VoteMenuClass;
var Material TargetMaterial;
var transient bool bShowTargeting;
var transient Vector TargetingLocation;
var transient float TargetingSize;
var() string InstructionText;
var() string InstructionKeyText;
var() float InstructTextBorderX;
var() float InstructTextBorderY;
var() float InstrDelta;
var() float InstrRate;
var() string InstructionFontName;
var() Font InstructionFontFont;
var bool bUsingCustomHUDColor;
var() bool DoCropping;
var bool bIsCinematic;
var byte FontsPrecached;
var bool bHideWeaponName;
var() float CroppingAmount;
var() Material CroppingMaterial;
var string LastWeaponName;
var float WeaponDrawTimer;
var Color WeaponDrawColor;
var() localized string Text;
var() localized string LevelActionLoading;
var() localized string LevelActionPaused;
var() string LevelActionFontName;
var localized string WonMatchPrefix;
var localized string WonMatchPostFix;
var localized string WaitingToSpawn;
var localized string AtMenus;
var localized string YouveWonTheMatch;
var localized string YouveLostTheMatch;
var localized string NowViewing;
var localized string ScoreText;
var localized string InitialViewingString;
var Material LocationDot;
var Material DefaultCrosshair;
var Material TargetCrosshair;
var Color DamageFlash[4];
var float DamageTime[4];
var() byte Emphasized[4];
var int DamageGot;
var float fPainSoundLastPlayed;
var float fStartTime;
var SpriteWidget WAttackedBG;
var bool bAttacked;
var() array<SpriteWidget> Crosshairs;
var Color CustomHUDColor;
var bool bUseCustomWeaponCrosshairs;
var float ScreenRatioX;
var float ScreenRatioY;
var float ScreenRatioXEx;
var float ScreenRatioYEx;
var float _rX;
var float _rY;
var float _reX;
var float _reY;
var bool IsDrawModeMessage;
var bool IsDrawSystemMessage;
var array<string> BaseTeamName;
var() Color BaseTeamColorAlly;
var() array<Color> BaseTeamColor;
var() Color FriendlyColor;
var() Color MyselfColor;
var int TimeMinutes;
var int TimeSeconds;
var bool AlreadyGotMessage17_PlayerCantStart;
var string KillerName;
var float KillerMarkTimeToRemove;
var() SpriteWidget KillerSprite;

function DoUpdateTime();
simulated function UpdateHUD();
simulated function DrawHudPassA(Canvas C);
simulated function DrawHudPassB(Canvas C);
simulated function DrawHudPassC(Canvas C);
simulated function DrawHudPassD(Canvas C);
simulated function PrecacheFonts(Canvas C)
{
    ++ FontsPrecached;
    C.Font = GetConsoleFont(C);
    C.SetPos(0.0, 0.0);
    C.DrawText("<>_Aa1");
    C.Font = GetFontSizeIndex(C, -2);
    C.SetPos(0.0, 0.0);
    C.DrawText("Aa1");
    C.Font = GetFontSizeIndex(C, -4);
    C.SetPos(0.0, 0.0);
    C.DrawText("Aa1");
    C.Font = GetFontSizeIndex(C, MessageFontOffset);
    C.SetPos(0.0, 0.0);
    C.DrawText("Aa1");
    C.Font = GetFontSizeIndex(C, 1 + MessageFontOffset);
    C.SetPos(0.0, 0.0);
    C.DrawText("Aa1");
    C.Font = GetFontSizeIndex(C, 2 + MessageFontOffset);
    C.SetPos(0.0, 0.0);
    C.DrawText("Aa1");
    C.Font = GetFontSizeIndex(C, 3 + MessageFontOffset);
    C.SetPos(0.0, 0.0);
    C.DrawText("Aa1");
}

function PostBeginPlay()
{
    super.PostBeginPlay();
    // End:0x15
    if(CustomHUDColorAllowed())
    {
        SetCustomHUDColor();
    }
}

function bool CustomHUDColorAllowed()
{
    return false;
}

function SetCustomHUDColor();
function DrawMiniMap(wHudPart_MinimapBase Minimap, Canvas C);
function DisplayHit(Vector HitDir, int Damage, class<DamageType> DamageType)
{
    local int i;
    local Vector X, Y, Z;
    local byte Ignore[4];
    local Rotator LookDir;
    local float NewDamageTime, Forward, Left;

    DamageGot = Damage;
    LookDir = PawnOwner.Rotation;
    LookDir.Pitch = 0;
    GetAxes(LookDir, X, Y, Z);
    HitDir.Z = 0.0;
    HitDir = Normal(HitDir);
    Forward = HitDir Dot X;
    Left = HitDir Dot Y;
    // End:0xb7
    if(Forward > float(0))
    {
        // End:0xa9
        if(Forward > 0.70)
        {
            Emphasized[2] = 1;
        }
        Ignore[3] = 1;
    }
    // End:0xdc
    else
    {
        // End:0xd1
        if(Forward < -0.70)
        {
            Emphasized[3] = 1;
        }
        Ignore[2] = 1;
    }
    // End:0x10f
    if(Left > float(0))
    {
        // End:0x102
        if(Left > 0.70)
        {
            Emphasized[0] = 1;
        }
        Ignore[1] = 1;
    }
    // End:0x132
    else
    {
        // End:0x128
        if(Left < -0.70)
        {
            Emphasized[1] = 1;
        }
        Ignore[0] = 1;
    }
    NewDamageTime = 10.0 * float(Clamp(Damage, 20, 30));
    i = 0;
    J0x153:
    // End:0x1a2 [While If]
    if(i < 4)
    {
        // End:0x198
        if(Ignore[i] != 1)
        {
            DamageFlash[i].R = byte(255);
            DamageTime[i] = NewDamageTime;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x153;
    }
}

function DrawDamageIndicators(Canvas C)
{
    local int nDamageAccumulate;

    nDamageAccumulate = 0;
    // End:0x5d
    if(true == PlayerOwner.IsInState('Dead'))
    {
        Log("Dying");
        DamageTime[0] = 0.0;
        DamageTime[1] = 0.0;
        DamageTime[2] = 0.0;
        DamageTime[3] = 0.0;
    }
    // End:0x151
    if(DamageTime[0] > float(0))
    {
        C.SetPos(0.0, 0.0);
        C.DrawColor = DamageFlash[0];
        C.DrawColor.A = byte(DamageTime[0]);
        // End:0x103
        if(Emphasized[0] == 1)
        {
            ++ nDamageAccumulate;
            C.DrawTile(texture'damage_big', 1024.0, 768.0, 0.0, 0.0, 512.0, 512.0);
        }
        // End:0x14e
        else
        {
            C.DrawTile(texture'damage_small_down', C.ClipX, 0.30 * C.ClipY, 0.0, 0.0, 128.0, 64.0);
        }
    }
    // End:0x15b
    else
    {
        Emphasized[0] = 0;
    }
    // End:0x278
    if(DamageTime[1] > float(0))
    {
        C.SetPos(0.0, 0.0);
        C.DrawColor = DamageFlash[1];
        C.DrawColor.A = byte(DamageTime[1]);
        // End:0x201
        if(Emphasized[1] == 1)
        {
            C.DrawTile(texture'damage_big', 1024.0, 768.0, 0.0, 0.0, 512.0, 512.0);
            ++ nDamageAccumulate;
        }
        // End:0x275
        else
        {
            C.SetPos(0.0, 0.70 * C.ClipY);
            C.DrawTile(texture'damage_small_up', C.ClipX, 0.30 * C.ClipY, 0.0, 0.0, 128.0, 64.0);
        }
    }
    // End:0x282
    else
    {
        Emphasized[1] = 0;
    }
    // End:0x37a
    if(DamageTime[2] > float(0))
    {
        C.SetPos(0.0, 0.0);
        C.DrawColor = DamageFlash[2];
        C.DrawColor.A = byte(DamageTime[2]);
        // End:0x32c
        if(Emphasized[2] == 1)
        {
            C.DrawTile(texture'damage_big', 1024.0, 768.0, 0.0, 0.0, 512.0, 512.0);
            ++ nDamageAccumulate;
        }
        // End:0x377
        else
        {
            C.DrawTile(texture'damage_small_right', 0.30 * C.ClipX, C.ClipY, 0.0, 0.0, 64.0, 128.0);
        }
    }
    // End:0x385
    else
    {
        Emphasized[2] = 0;
    }
    // End:0x4a6
    if(DamageTime[3] > float(0))
    {
        C.SetPos(0.0, 0.0);
        C.DrawColor = DamageFlash[3];
        C.DrawColor.A = byte(DamageTime[3]);
        // End:0x42f
        if(Emphasized[3] == 1)
        {
            C.DrawTile(texture'damage_big', 1024.0, 768.0, 0.0, 0.0, 512.0, 512.0);
            ++ nDamageAccumulate;
        }
        // End:0x4a3
        else
        {
            C.SetPos(0.70 * C.ClipX, 0.0);
            C.DrawTile(texture'damage_small_left', 0.30 * C.ClipX, C.ClipY, 0.0, 0.0, 64.0, 128.0);
        }
    }
    // End:0x4b1
    else
    {
        Emphasized[3] = 0;
    }
    // End:0x4c7
    if(nDamageAccumulate >= 1)
    {
        PlayPainSound(C);
    }
}

function PlayPainSound(Canvas C);
simulated function Tick(float DeltaTime)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x6c [While If]
    if(i < 4)
    {
        // End:0x62
        if(DamageTime[i] > float(0))
        {
            DamageTime[i] -= float(120) * DeltaTime;
            // End:0x62
            if(DamageTime[i] < float(1))
            {
                DamageTime[i] = 0.0;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

simulated function DrawHeadShotSphere()
{
    local Coords co;
    local Pawn P;
    local Vector HeadLoc;

    // End:0xd1
    foreach DynamicActors(class'Pawn', P)
    {
        // End:0xd0
        if(P != none && P.HeadBone != 'None')
        {
            co = P.GetBoneCoords(P.HeadBone);
            HeadLoc = co.Origin + P.HeadHeight * P.HeadScale * co.XAxis;
            P.DrawDebugSphere(HeadLoc, P.HeadRadius * P.HeadScale, 10, 0, byte(255), 0);
        }                
    }
}

function DrawAttacked(Canvas C)
{
    local int iAlpha;
    local float fTotalDrawTime, fDelayDrawTime, fFadeOutDrawTime;

    fTotalDrawTime = 0.50;
    fDelayDrawTime = 0.20;
    fFadeOutDrawTime = 0.30;
    // End:0x4a
    if(fStartTime + fTotalDrawTime < Level.TimeSeconds)
    {
        bAttacked = false;
        return;
    }
    // End:0x74
    if(fStartTime + fDelayDrawTime > Level.TimeSeconds)
    {
        iAlpha = 90;
    }
    // End:0xa5
    else
    {
        iAlpha = int(float(89) * 1.0 - Level.TimeSeconds - fStartTime / fFadeOutDrawTime);
    }
    // End:0xb7
    if(iAlpha < 1)
    {
        iAlpha = 1;
    }
    C.SetPos(0.0, 0.0);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(iAlpha));
    C.DrawTile(WAttackedBG.WidgetTexture, C.ClipX, C.ClipY, float(WAttackedBG.TextureCoords.X1), float(WAttackedBG.TextureCoords.Y1), float(WAttackedBG.TextureCoords.X2 - WAttackedBG.TextureCoords.X1), float(WAttackedBG.TextureCoords.Y2 - WAttackedBG.TextureCoords.Y1));
}

function UpdateScreenRatios(Canvas C)
{
    local int lp1;

    _rX = ScreenRatioX * C.ClipX;
    _rY = ScreenRatioY * C.ClipY;
    _reX = ScreenRatioXEx * C.ClipX;
    _reY = ScreenRatioYEx * C.ClipY;
    lp1 = 0;
    J0x73:
    // End:0xa7 [While If]
    if(lp1 < ChildHudParts.Length)
    {
        ChildHudParts[lp1].UpdateScreenRatios(C);
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x73;
    }
}

simulated function DrawHUD(Canvas C)
{
    UpdateScreenRatios(C);
    // End:0x24
    if(FontsPrecached < 2)
    {
        PrecacheFonts(C);
    }
    super.DrawHUD(C);
    UpdateHUD();
    // End:0x49
    if(bShowTargeting)
    {
        DrawTargeting(C);
    }
    PassStyle = 5;
    DrawDamageIndicators(C);
    DrawCSReviw(C);
    DrawHudPassA(C);
    PassStyle = 5;
    DrawHudPassB(C);
    PassStyle = 5;
    DrawHudPassC(C);
    PassStyle = 5;
    DrawHudPassD(C);
    // End:0xbf
    if(bAttacked)
    {
        DrawAttacked(C);
    }
}

// Export UHudBase::execDrawSpriteWidget(FFrame&, void* const)
native simulated function DrawSpriteWidget(Canvas C, out SpriteWidget W);
// Export UHudBase::execDrawNumericWidget(FFrame&, void* const)
native simulated function DrawNumericWidget(Canvas C, out NumericWidget W, out DigitSet D);
simulated function DrawCSReviw(Canvas C)
{
    local int i;
    local Vector ScreenPos;
    local float width, Height;
    local Vector camLoc;
    local Rotator camRot;

    C.GetCameraLocation(camLoc, camRot);
    i = 0;
    J0x20:
    // End:0x190 [While If]
    if(i < Level.CSReviewNameTags.Length)
    {
        ScreenPos = camLoc - Level.CSReviewNameTags[i].vPos;
        ScreenPos.Z = 0.0;
        // End:0x8c
        if(C.VSize(ScreenPos) > 1000.0)
        {
        }
        // End:0x186
        else
        {
            ScreenPos = C.WorldToScreen(Level.CSReviewNameTags[i].vPos);
            // End:0x186
            if(IsTargetInFrontOfPlayer2(C, Level.CSReviewNameTags[i].vPos, ScreenPos, camLoc, camRot))
            {
                C.BtrTextSize(Level.CSReviewNameTags[i].szName, 15, width, Height);
                C.BtrDrawTextJustified(Level.CSReviewNameTags[i].szName, 0, ScreenPos.X, ScreenPos.Y, ScreenPos.X + width, ScreenPos.Y + Height, 15);
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x20;
    }
}

simulated function DrawDigitSet(Canvas C, float X, float Y, float OffsetX, float XL, float YL, int Value, DigitSet dSet, int totalDigits, string paddingChar)
{
    local int lp1;
    local string str;
    local int val, StrLen;

    str = PadLeft(string(Value), totalDigits, paddingChar);
    StrLen = Len(str);
    lp1 = 0;
    J0x31:
    // End:0x135 [While If]
    if(lp1 < StrLen)
    {
        val = int(Mid(str, lp1, 1));
        C.SetPos(X + OffsetX * float(lp1), Y);
        C.DrawTile(dSet.DigitTexture, XL, YL, float(dSet.TextureCoords[val].X1), float(dSet.TextureCoords[val].Y1), float(dSet.TextureCoords[val].X2 - dSet.TextureCoords[val].X1), float(dSet.TextureCoords[val].Y2 - dSet.TextureCoords[val].Y1));
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x31;
    }
}

simulated function AddChildHudPart(HudBase Child)
{
    ChildHudParts[ChildHudParts.Length] = Child;
}

simulated function ClearMessage(out HudLocalizedMessage M)
{
    M.Message = none;
    M.StringFont = none;
}

simulated function Message(PlayerReplicationInfo PRI, coerce string Msg, name MsgType)
{
    local class<LocalMessage> LocalMessageClass;

    switch(MsgType)
    {
        // End:0x4b
        case 'Say':
            // End:0x1c
            if(PRI == none)
            {
                return;
            }
            Msg = PRI.PlayerName $ ": " $ Msg;
            LocalMessageClass = class'SayMessagePlus';
            // End:0xf6
            break;
        // End:0xa6
        case 'TeamSay':
            // End:0x60
            if(PRI == none)
            {
                return;
            }
            Msg = PRI.PlayerName $ "(" $ PRI.GetLocationName() $ "): " $ Msg;
            LocalMessageClass = class'TeamSayMessagePlus';
            // End:0xf6
            break;
        // End:0xcf
        case 'CriticalEvent':
            LocalMessageClass = class'CriticalEventPlus';
            LocalizedMessage(LocalMessageClass, 0, none, none, none, Msg);
            return;
        // End:0xe5
        case 'DeathMessage':
            LocalMessageClass = class'wDeathMessage';
            // End:0xf6
            break;
        // End:0xffff
        default:
            LocalMessageClass = class'StringMessagePlus';
            // End:0xf6 Break;
            break;
    }
    AddTextMessage(Msg, LocalMessageClass, PRI);
}

simulated function LocalizedMessage(class<LocalMessage> Message, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject, optional string CriticalString)
{
    local int i, k, iCountMessageScore, iIndexMessage;
    local PlayerReplicationInfo HUDPRI;
    local float fAddTime, fIntervalTime, fNextDrawIntervalTime;

    Log("[HudBase::LocalizedMessage] Message=" $ string(Message) $ "  Switch=" $ string(Switch));
    fNextDrawIntervalTime = 0.40;
    // End:0x5f
    if(Message == none)
    {
        return;
    }
    // End:0x7e
    if(bIsCinematic && !ClassIsChildOf(Message, class'ActionMessage'))
    {
        return;
    }
    // End:0x21c
    if(CriticalString == "")
    {
        // End:0xc2
        if(PawnOwner != none && PawnOwner.PlayerReplicationInfo != none)
        {
            HUDPRI = PawnOwner.PlayerReplicationInfo;
        }
        // End:0xd6
        else
        {
            HUDPRI = PlayerOwner.PlayerReplicationInfo;
        }
        // End:0x182
        if(HUDPRI == RelatedPRI_1)
        {
            // End:0x156
            if(Switch == 0)
            {
                Log("Message=" $ string(Message) $ " [Code_CantProne] [Switch] : " $ string(Switch) $ " / player bProne:" $ string(PlayerOwner.bProne));
            }
            CriticalString = Message.static.GetRelatedString(Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
        }
        // End:0x21c
        else
        {
            // End:0x1f3
            if(Switch == 0)
            {
                Log("Message=" $ string(Message) $ " [Code_CantProne] [Switch] : " $ string(Switch) $ " / player bProne:" $ string(PlayerOwner.bProne));
            }
            CriticalString = Message.static.GetString(Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
        }
    }
    // End:0x248
    if(bMessageBeep && Message.default.bBeep)
    {
        PlayerOwner.PlayBeepSound();
    }
    // End:0x2f9
    if(!Message.default.bIsSpecial)
    {
        // End:0x2e2
        if(PlayerOwner.bDemoOwner)
        {
            i = 0;
            J0x275:
            // End:0x2b6 [While If]
            if(i < ConsoleMessageCount)
            {
                // End:0x2ac
                if(i >= 8 || TextMessages[i].Text == "")
                {
                }
                // End:0x2b6
                else
                {
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0x275;
                }
            }
            // End:0x2e2
            if(i > 0 && TextMessages[i - 1].Text == CriticalString)
            {
                return;
            }
        }
        AddTextMessage(CriticalString, Message, RelatedPRI_1);
        return;
    }
    i = 8;
    // End:0x369
    if(Message.default.bIsUnique)
    {
        i = 0;
        J0x31a:
        // End:0x366 [While If]
        if(i < 8)
        {
            // End:0x33f
            if(LocalMessages[i].Message == none)
            {
            }
            // End:0x35c
            else
            {
                // End:0x35c
                if(LocalMessages[i].Message == Message)
                {
                }
                // End:0x366
                else
                {
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x31a;
            }
        }
    }
    // End:0x482
    else
    {
        // End:0x482
        if(Message.default.bIsPartiallyUnique || PlayerOwner.bDemoOwner)
        {
            i = 0;
            J0x396:
            // End:0x482 [While If]
            if(i < 8)
            {
                // End:0x3bb
                if(LocalMessages[i].Message == none)
                {
                }
                // End:0x478
                else
                {
                    // End:0x3f4
                    if(LocalMessages[i].Message == Message && LocalMessages[i].Switch == Switch)
                    {
                    }
                    // End:0x482
                    else
                    {
                        // End:0x469
                        if(Message == class'wMessage_Game_ImpSystem')
                        {
                            // End:0x466
                            if(LocalMessages[i].Message == Message)
                            {
                                // End:0x466
                                if(class'wMessage_Game_ImpSystem'.static.IsMessageMode(LocalMessages[i].Switch) || class'wMessage_Game_ImpSystem'.static.IsMessageSystem(LocalMessages[i].Switch))
                                {
                                }
                                // End:0x482
                                else
                                {
                                }
                                // This is an implied JumpToken;
                                goto J0x478;
                            }
                            // End:0x478
                            if(Message == class'wMessage_Score')
                            {
                            }
                        }
                        ++ i;
                        // This is an implied JumpToken; Continue!
                        goto J0x396;
                    }
                }
            }
        }
    }
    // End:0x4c4
    if(i == 8)
    {
        i = 0;
        J0x495:
        // End:0x4c4 [While If]
        if(i < 8)
        {
            // End:0x4ba
            if(LocalMessages[i].Message == none)
            {
            }
            // End:0x4c4
            else
            {
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x495;
            }
        }
    }
    // End:0x50a
    if(i == 8)
    {
        i = 0;
        J0x4d7:
        // End:0x50a [While If]
        if(i < 8 - 1)
        {
            LocalMessages[i] = LocalMessages[i + 1];
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x4d7;
        }
    }
    ClearMessage(LocalMessages[i]);
    LocalMessages[i].Message = Message;
    LocalMessages[i].Switch = Switch;
    LocalMessages[i].RelatedPRI = RelatedPRI_1;
    LocalMessages[i].RelatedPRI2 = RelatedPRI_2;
    LocalMessages[i].OptionalObject = OptionalObject;
    LocalMessages[i].EndOfLife = Message.static.GetLifeTime(Switch) + Level.TimeSeconds;
    LocalMessages[i].StringMessage = CriticalString;
    LocalMessages[i].Lifetime = Message.static.GetLifeTime(Switch);
    LocalMessages[i].StartTime = Level.TimeSeconds;
    LocalMessages[i].PlaySound = false;
    // End:0x78b
    if(LocalMessages[i].Message == class'wMessage_Score' || LocalMessages[i].Message == class'wMultiKillMessage')
    {
        k = 0;
        J0x668:
        // End:0x6fe [While If]
        if(k < 8)
        {
            // End:0x686
            if(i == k)
            {
            }
            // End:0x6fe
            else
            {
                // End:0x6f4
                if(LocalMessages[k].Message == class'wMessage_Score' || LocalMessages[k].Message == class'wMultiKillMessage')
                {
                    ++ iCountMessageScore;
                    fIntervalTime = Level.TimeSeconds - LocalMessages[k].StartTime;
                    iIndexMessage = k;
                }
                ++ k;
                // This is an implied JumpToken; Continue!
                goto J0x668;
            }
        }
        // End:0x78b
        if(iCountMessageScore >= 1 && fIntervalTime < fNextDrawIntervalTime)
        {
            fAddTime = fNextDrawIntervalTime;
            LocalMessages[i].StartTime = fAddTime + LocalMessages[iIndexMessage].StartTime;
            LocalMessages[i].EndOfLife = fAddTime + Message.static.GetLifeTime(Switch) + LocalMessages[iIndexMessage].StartTime;
        }
    }
    // End:0x8ba
    if(LocalMessages[i].Message == class'wSpecialKillMessage')
    {
        iCountMessageScore = 0;
        k = 0;
        J0x7b3:
        // End:0x82d [While If]
        if(k < 8)
        {
            // End:0x7d1
            if(i == k)
            {
            }
            // End:0x82d
            else
            {
                // End:0x823
                if(LocalMessages[k].Message == class'wSpecialKillMessage')
                {
                    ++ iCountMessageScore;
                    fIntervalTime = Level.TimeSeconds - LocalMessages[k].StartTime;
                    iIndexMessage = k;
                }
                ++ k;
                // This is an implied JumpToken; Continue!
                goto J0x7b3;
            }
        }
        // End:0x8ba
        if(iCountMessageScore >= 1 && fIntervalTime < fNextDrawIntervalTime)
        {
            fAddTime = fNextDrawIntervalTime;
            LocalMessages[i].StartTime = fAddTime + LocalMessages[iIndexMessage].StartTime;
            LocalMessages[i].EndOfLife = fAddTime + Message.static.GetLifeTime(Switch) + LocalMessages[iIndexMessage].StartTime;
        }
    }
}

simulated function LocalizedMessage2(class<LocalMessage> Message, optional int Switch, optional string CriticalString)
{
    local int i;

    i = 8;
    // End:0x70
    if(Message.default.bIsUnique)
    {
        i = 0;
        J0x21:
        // End:0x6d [While If]
        if(i < 8)
        {
            // End:0x46
            if(LocalMessages[i].Message == none)
            {
            }
            // End:0x63
            else
            {
                // End:0x63
                if(LocalMessages[i].Message == Message)
                {
                }
                // End:0x6d
                else
                {
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x21;
            }
        }
    }
    // End:0x189
    else
    {
        // End:0x189
        if(Message.default.bIsPartiallyUnique || PlayerOwner.bDemoOwner)
        {
            i = 0;
            J0x9d:
            // End:0x189 [While If]
            if(i < 8)
            {
                // End:0xc2
                if(LocalMessages[i].Message == none)
                {
                }
                // End:0x17f
                else
                {
                    // End:0xfb
                    if(LocalMessages[i].Message == Message && LocalMessages[i].Switch == Switch)
                    {
                    }
                    // End:0x189
                    else
                    {
                        // End:0x170
                        if(Message == class'wMessage_Game_ImpSystem')
                        {
                            // End:0x16d
                            if(LocalMessages[i].Message == Message)
                            {
                                // End:0x16d
                                if(class'wMessage_Game_ImpSystem'.static.IsMessageMode(LocalMessages[i].Switch) || class'wMessage_Game_ImpSystem'.static.IsMessageSystem(LocalMessages[i].Switch))
                                {
                                }
                                // End:0x189
                                else
                                {
                                }
                                // This is an implied JumpToken;
                                goto J0x17f;
                            }
                            // End:0x17f
                            if(Message == class'wMessage_Score')
                            {
                            }
                        }
                        ++ i;
                        // This is an implied JumpToken; Continue!
                        goto J0x9d;
                    }
                }
            }
        }
    }
    // End:0x1cb
    if(i == 8)
    {
        i = 0;
        J0x19c:
        // End:0x1cb [While If]
        if(i < 8)
        {
            // End:0x1c1
            if(LocalMessages[i].Message == none)
            {
            }
            // End:0x1cb
            else
            {
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x19c;
            }
        }
    }
    // End:0x211
    if(i == 8)
    {
        i = 0;
        J0x1de:
        // End:0x211 [While If]
        if(i < 8 - 1)
        {
            LocalMessages[i] = LocalMessages[i + 1];
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x1de;
        }
    }
    ClearMessage(LocalMessages[i]);
    LocalMessages[i].Message = Message;
    LocalMessages[i].Switch = Switch;
    LocalMessages[i].RelatedPRI = none;
    LocalMessages[i].RelatedPRI2 = none;
    LocalMessages[i].OptionalObject = none;
    LocalMessages[i].EndOfLife = Message.static.GetLifeTime(Switch) + Level.TimeSeconds;
    LocalMessages[i].StringMessage = CriticalString;
    LocalMessages[i].Lifetime = Message.static.GetLifeTime(Switch);
    LocalMessages[i].StartTime = Level.TimeSeconds;
    LocalMessages[i].PlaySound = false;
}

static function Color GetTeamColor(byte TeamNum)
{
    return default.BlackColor;
}

function GetLocalStatsScreen()
{
    // End:0x74
    if(PlayerOwner != none && TeamPlayerReplicationInfo(PlayerOwner.PlayerReplicationInfo) != none && TeamPlayerReplicationInfo(PlayerOwner.PlayerReplicationInfo).LocalStatsScreenClass != none)
    {
        LocalStatsScreen = Spawn(TeamPlayerReplicationInfo(PlayerOwner.PlayerReplicationInfo).LocalStatsScreenClass, Owner);
    }
}

simulated function LayoutMessage(out HudLocalizedMessage Message, Canvas C)
{
    local int FontSize;

    FontSize = Message.Message.static.GetFontSize(Message.Switch, Message.RelatedPRI, Message.RelatedPRI2, PlayerOwner.PlayerReplicationInfo);
    FontSize += MessageFontOffset;
    Message.StringFont = GetFontSizeIndex(C, FontSize);
    Message.DrawColor = Message.Message.static.GetColor(Message.Switch, Message.RelatedPRI, Message.RelatedPRI2);
    Message.Message.static.GetPos(Message.Switch, Message.DrawPivot, Message.StackMode, Message.PosX, Message.PosY);
    C.Font = Message.StringFont;
    C.BtrTextSize(Message.StringMessage, int(float(20) / 768.0 * C.ClipY), Message.dx, Message.dy);
}

simulated function GetScreenCoords(float PosX, float PosY, out float ScreenX, out float ScreenY, out HudLocalizedMessage Message, Canvas C)
{
    ScreenX = PosX * HudCanvasScale * C.ClipX + 1.0 - HudCanvasScale * 0.50 * C.ClipX;
    ScreenY = PosY * HudCanvasScale * C.ClipY + 1.0 - HudCanvasScale * 0.50 * C.ClipY;
    switch(Message.DrawPivot)
    {
        // End:0xa2
        case 0:
            // End:0x1db
            break;
        // End:0xc2
        case 1:
            ScreenX -= Message.dx * 0.50;
            // End:0x1db
            break;
        // End:0xdb
        case 2:
            ScreenX -= Message.dx;
            // End:0x1db
            break;
        // End:0x10c
        case 3:
            ScreenX -= Message.dx;
            ScreenY -= Message.dy * 0.50;
            // End:0x1db
            break;
        // End:0x136
        case 4:
            ScreenX -= Message.dx;
            ScreenY -= Message.dy;
            // End:0x1db
            break;
        // End:0x167
        case 5:
            ScreenX -= Message.dx * 0.50;
            ScreenY -= Message.dy;
            // End:0x1db
            break;
        // End:0x180
        case 6:
            ScreenY -= Message.dy;
            // End:0x1db
            break;
        // End:0x1a0
        case 7:
            ScreenY -= Message.dy * 0.50;
            // End:0x1db
            break;
        // End:0x1d8
        case 8:
            ScreenX -= Message.dx * 0.50;
            ScreenY -= Message.dy * 0.50;
            // End:0x1db
            break;
        // End:0xffff
        default:
}

simulated function DrawMessage(Canvas C, int i, float PosX, float PosY, out float dx, out float dy)
{
    local float FadeValue, ScreenX, ScreenY;

    // End:0x41
    if(!LocalMessages[i].Message.default.bFadeMessage)
    {
        C.DrawColor = LocalMessages[i].DrawColor;
    }
    // End:0xcc
    else
    {
        FadeValue = LocalMessages[i].EndOfLife - Level.TimeSeconds;
        C.DrawColor = LocalMessages[i].DrawColor;
        C.DrawColor.A = byte(float(LocalMessages[i].DrawColor.A) * FadeValue / LocalMessages[i].Lifetime);
    }
    C.Font = LocalMessages[i].StringFont;
    GetScreenCoords(PosX, PosY, ScreenX, ScreenY, LocalMessages[i], C);
    C.SetPos(ScreenX, ScreenY);
    dx = LocalMessages[i].dx / C.ClipX;
    dy = LocalMessages[i].dy / C.ClipY;
    // End:0x229
    if(LocalMessages[i].Message.default.bComplexString)
    {
        LocalMessages[i].Message.static.RenderComplexMessage(C, LocalMessages[i].dx, LocalMessages[i].dy, LocalMessages[i].StringMessage, LocalMessages[i].Switch, LocalMessages[i].RelatedPRI, LocalMessages[i].RelatedPRI2, LocalMessages[i].OptionalObject);
    }
    // End:0x296
    else
    {
        C.BtrDrawTextJustified(LocalMessages[i].StringMessage, 1, 0.0, ScreenY, C.ClipX, ScreenY + LocalMessages[i].dy, int(float(20) / 768.0 * C.ClipY));
    }
    LocalMessages[i].Drawn = true;
}

simulated function DrawMessageWithTexture(Canvas C, int i, float PosX, float PosY, out float dx, out float dy);
simulated function DisplayLocalMessages(Canvas C)
{
    local float PosX, PosY, dy, dx;
    local int i, j, iCount, iCount2;
    local float FadeValue;
    local Plane OldCM;
    local bool bDeleteMessage;
    local float fRemainTime;

    OldCM = C.ColorModulate;
    C.Reset();
    C.ColorModulate = OldCM;
    IsDrawModeMessage = false;
    IsDrawSystemMessage = false;
    i = 0;
    J0x4e:
    // End:0x290 [While If]
    if(i < 8)
    {
        // End:0x73
        if(LocalMessages[i].Message == none)
        {
        }
        // End:0x290
        else
        {
            LocalMessages[i].Drawn = false;
            // End:0xb2
            if(LocalMessages[i].StringFont == none)
            {
                LayoutMessage(LocalMessages[i], C);
            }
            // End:0x1db
            if(LocalMessages[i].Message == class'wMessage_Game_ImpSystem')
            {
                // End:0xfd
                if(!IsDrawModeMessage)
                {
                    IsDrawModeMessage = class'wMessage_Game_ImpSystem'.static.IsMessageMode(LocalMessages[i].Switch);
                }
                // End:0x12e
                if(!IsDrawSystemMessage)
                {
                    IsDrawSystemMessage = class'wMessage_Game_ImpSystem'.static.IsMessageSystem(LocalMessages[i].Switch);
                }
                // End:0x1db
                if(!LocalMessages[i].Message.default.bFadeMessage)
                {
                    FadeValue = LocalMessages[i].EndOfLife - Level.TimeSeconds;
                    // End:0x1db
                    if(FadeValue <= 0.0)
                    {
                        j = i;
                        J0x18d:
                        // End:0x1c0 [While If]
                        if(j < 8 - 1)
                        {
                            LocalMessages[j] = LocalMessages[j + 1];
                            ++ j;
                            // This is an implied JumpToken; Continue!
                            goto J0x18d;
                        }
                        ClearMessage(LocalMessages[j]);
                        -- i;
                    }
                    // End:0x286
                    else
                    {
                    }
                }
                // End:0x286
                if(LocalMessages[i].Message.default.bFadeMessage)
                {
                    FadeValue = LocalMessages[i].EndOfLife - Level.TimeSeconds;
                    // End:0x286
                    if(FadeValue <= 0.0)
                    {
                        j = i;
                        J0x238:
                        // End:0x26b [While If]
                        if(j < 8 - 1)
                        {
                            LocalMessages[j] = LocalMessages[j + 1];
                            ++ j;
                            // This is an implied JumpToken; Continue!
                            goto J0x238;
                        }
                        ClearMessage(LocalMessages[j]);
                        -- i;
                    }
                    // End:0x286
                    else
                    {
                    }
                }
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x4e;
        }
    }
    i = 8 - 1;
    J0x29b:
    // End:0x39d [While If]
    if(i > -1)
    {
        // End:0x393
        if(LocalMessages[i].Message == class'wMessage_Score' || LocalMessages[i].Message == class'wMultiKillMessage')
        {
            // End:0x33b
            if(bDeleteMessage)
            {
                j = i;
                J0x2f4:
                // End:0x327 [While If]
                if(j < 8 - 1)
                {
                    LocalMessages[j] = LocalMessages[j + 1];
                    ++ j;
                    // This is an implied JumpToken; Continue!
                    goto J0x2f4;
                }
                ClearMessage(LocalMessages[j]);
            }
            // End:0x393
            else
            {
                fRemainTime = LocalMessages[i].EndOfLife - Level.TimeSeconds;
                // End:0x393
                if(fRemainTime < float(class'wMessage_Score'.default.Lifetime) - class'wMessage_Score'.default.fTotalEffectRunTime)
                {
                    bDeleteMessage = true;
                }
            }
        }
        -- i;
        // This is an implied JumpToken; Continue!
        goto J0x29b;
    }
    bDeleteMessage = false;
    i = 8 - 1;
    J0x3b0:
    // End:0x496 [While If]
    if(i > -1)
    {
        // End:0x48c
        if(LocalMessages[i].Message == class'wSpecialKillMessage')
        {
            // End:0x434
            if(bDeleteMessage)
            {
                j = i;
                J0x3ed:
                // End:0x420 [While If]
                if(j < 8 - 1)
                {
                    LocalMessages[j] = LocalMessages[j + 1];
                    ++ j;
                    // This is an implied JumpToken; Continue!
                    goto J0x3ed;
                }
                ClearMessage(LocalMessages[j]);
            }
            // End:0x48c
            else
            {
                fRemainTime = LocalMessages[i].EndOfLife - Level.TimeSeconds;
                // End:0x48c
                if(fRemainTime < float(class'wSpecialKillMessage'.default.Lifetime) - class'wSpecialKillMessage'.default.fTotalEffectRunTime)
                {
                    bDeleteMessage = true;
                }
            }
        }
        -- i;
        // This is an implied JumpToken; Continue!
        goto J0x3b0;
    }
    iCount = 8;
    i = 0;
    J0x4a5:
    // End:0x72e [While If]
    if(i < 8)
    {
        // End:0x4ca
        if(LocalMessages[i].Message == none)
        {
        }
        // End:0x72e
        else
        {
            // End:0x4e1
            if(LocalMessages[i].Drawn)
            {
            }
            // End:0x724
            else
            {
                PosX = LocalMessages[i].PosX;
                PosY = LocalMessages[i].PosY;
                // End:0x595
                if(LocalMessages[i].StackMode == 0)
                {
                    // End:0x56e
                    if(!LocalMessages[i].Message.default.bDrawWithTexture)
                    {
                        DrawMessage(C, i, PosX, PosY, dx, dy);
                    }
                    // End:0x592
                    else
                    {
                        DrawMessageWithTexture(C, i, PosX, PosY, dx, dy);
                    }
                }
                // End:0x724
                else
                {
                    iCount2 = 8;
                    j = i;
                    J0x5a8:
                    // End:0x724 [While If]
                    if(j < 8)
                    {
                        // End:0x5cb
                        if(LocalMessages[j].Drawn)
                        {
                        }
                        // End:0x71a
                        else
                        {
                            // End:0x5f3
                            if(LocalMessages[i].PosX != LocalMessages[j].PosX)
                            {
                            }
                            // End:0x71a
                            else
                            {
                                // End:0x61b
                                if(LocalMessages[i].PosY != LocalMessages[j].PosY)
                                {
                                }
                                // End:0x71a
                                else
                                {
                                    // End:0x647
                                    if(LocalMessages[i].DrawPivot != LocalMessages[j].DrawPivot)
                                    {
                                    }
                                    // End:0x71a
                                    else
                                    {
                                        // End:0x673
                                        if(LocalMessages[i].StackMode != LocalMessages[j].StackMode)
                                        {
                                        }
                                        // End:0x71a
                                        else
                                        {
                                            // End:0x6b9
                                            if(!LocalMessages[j].Message.default.bDrawWithTexture)
                                            {
                                                DrawMessage(C, j, PosX, PosY, dx, dy);
                                            }
                                            // End:0x6dd
                                            else
                                            {
                                                DrawMessageWithTexture(C, j, PosX, PosY, dx, dy);
                                            }
                                            switch(LocalMessages[j].StackMode)
                                            {
                                                // End:0x703
                                                case 1:
                                                    PosY -= dy;
                                                    // End:0x71a
                                                    break;
                                                // End:0x717
                                                case 2:
                                                    PosY += dy;
                                                    // End:0x71a
                                                    break;
                                                // End:0xffff
                                                default:
                                                }
                                            }
                                        }
                                    }
                                }
                                ++ j;
                                // This is an implied JumpToken; Continue!
                                goto J0x5a8;
                            }
                        }
                    }
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0x4a5;
                }
            }
}

simulated function CreateKeyMenus()
{
    // End:0x0d
    if(Owner == none)
    {
        return;
    }
    // End:0x5c
    if(PlayerController(Owner) != none && PlayerController(Owner).PlayerReplicationInfo != none && PlayerController(Owner).PlayerReplicationInfo.bOnlySpectator)
    {
        return;
    }
    // End:0x76
    if(VoteMenuClass != none)
    {
        VoteMenu = Spawn(VoteMenuClass, self);
    }
}

function Draw2DLocationDot(Canvas C, Vector loc, float OffsetX, float OffsetY, float ScaleX, float ScaleY)
{
    local Rotator Dir;
    local float Angle, Scaling;
    local Actor Start;

    // End:0x19
    if(PawnOwner == none)
    {
        Start = PlayerOwner;
    }
    // End:0x24
    else
    {
        Start = PawnOwner;
    }
    Dir = rotator(loc - Start.Location);
    Angle = float(int(float(Dir.Yaw - PlayerOwner.Rotation.Yaw)) & 65535) * 6.28320 / float(65536);
    C.Style = 5;
    C.SetPos(OffsetX * C.ClipX + ScaleX * C.ClipX * Sin(Angle), OffsetY * C.ClipY - ScaleY * C.ClipY * Cos(Angle));
    Scaling = 24.0 * C.ClipX * HudScale / float(1600);
    C.DrawTile(LocationDot, Scaling, Scaling, 340.0, 432.0, 78.0, 78.0);
}

simulated function SetTargeting(bool bShow, optional Vector TargetLocation, optional float Size)
{
    bShowTargeting = bShow;
    // End:0x3b
    if(bShow)
    {
        TargetingLocation = TargetLocation;
        // End:0x3b
        if(Size != 0.0)
        {
            TargetingSize = Size;
        }
    }
}

simulated function DrawTargeting(Canvas C)
{
    local int XPos, YPos;
    local Vector ScreenPos, X, Y, Z, Dir;

    local float ratioX, ratioY, tileX, tileY, dist, SizeX,
	    SizeY;

    SizeX = TargetingSize * 96.0;
    SizeY = TargetingSize * 96.0;
    // End:0x31
    if(!bShowTargeting)
    {
        return;
    }
    ScreenPos = C.WorldToScreen(TargetingLocation);
    ratioX = float(C.SizeX) / 640.0;
    ratioY = float(C.SizeY) / 480.0;
    tileX = SizeX * ratioX;
    tileY = SizeY * ratioX;
    GetAxes(PlayerOwner.Rotation, X, Y, Z);
    Dir = TargetingLocation - PawnOwner.Location;
    dist = VSize(Dir);
    Dir = Dir / dist;
    // End:0x218
    if(Dir Dot X > 0.60)
    {
        XPos = int(ScreenPos.X);
        YPos = int(ScreenPos.Y);
        C.Style = 6;
        C.DrawColor.R = byte(255);
        C.DrawColor.G = byte(255);
        C.DrawColor.B = byte(255);
        C.DrawColor.A = byte(255);
        C.SetPos(float(XPos) - tileX * 0.50, float(YPos) - tileY * 0.50);
        C.DrawTile(TargetMaterial, tileX, tileY, 0.0, 0.0, 256.0, 256.0);
    }
    class'BTCustomDrawHK'.static.DrawString(C, "HudBase.DrawHud->DrawTargeting", 4, 20.0, 0.0, 0.0, 1024.0, 100.0);
}

simulated function SetCropping(bool Active)
{
    DoCropping = Active;
}

simulated function DrawInstructionGfx(Canvas C)
{
    local float CropHeight;

    DrawCrosshair(C);
    DrawTargeting(C);
    // End:0x101
    if(DoCropping)
    {
        CropHeight = float(C.SizeY) * CroppingAmount * 0.50;
        C.SetPos(0.0, 0.0);
        C.DrawTile(texture'BlackTexture', float(C.SizeX), CropHeight, 0.0, 0.0, 64.0, 64.0);
        C.SetPos(0.0, float(C.SizeY) - CropHeight);
        C.DrawTile(texture'BlackTexture', float(C.SizeX), CropHeight, 0.0, 0.0, 64.0, 64.0);
    }
    DrawInstructionText(C);
    DrawInstructionKeyText(C);
}

simulated function DrawInstructionText(Canvas C)
{
    // End:0x0e
    if(InstructionText == "")
    {
        return;
    }
    C.Font = LoadInstructionFont();
    C.SetOrigin(InstructTextBorderX, InstructTextBorderY);
    C.SetClip(float(C.SizeX) - InstructTextBorderX, float(C.SizeY));
    C.SetPos(0.0, 0.0);
    C.DrawText(InstructionText);
    C.SetOrigin(0.0, 0.0);
    C.SetClip(float(C.SizeX), float(C.SizeY));
}

simulated function DrawInstructionKeyText(Canvas C)
{
    local float strX, strY;

    // End:0x0e
    if(InstructionKeyText == "")
    {
        return;
    }
    C.Font = LoadInstructionFont();
    C.SetOrigin(InstructTextBorderX, InstructTextBorderY);
    C.SetClip(float(C.SizeX) - InstructTextBorderX, float(C.SizeY));
    C.StrLen(InstructionKeyText, strX, strY);
    C.SetOrigin(InstructTextBorderX, float(C.SizeY) - strY - InstructTextBorderY);
    C.SetClip(float(C.SizeX) - InstructTextBorderX, float(C.SizeY));
    C.SetPos(0.0, 0.0);
    C.DrawText(InstructionKeyText);
    C.SetOrigin(0.0, 0.0);
    C.SetClip(float(C.SizeX), float(C.SizeY));
}

simulated function SetInstructionText(string Text)
{
    InstructionText = Text;
}

simulated function SetInstructionKeyText(string Text)
{
    InstructionKeyText = Text;
}

simulated function Font LoadInstructionFont()
{
    return none;
    // End:0x70
    if(InstructionFontFont == none)
    {
        InstructionFontFont = Font(DynamicLoadObject(InstructionFontName, class'Font'));
        // End:0x70
        if(InstructionFontFont == none)
        {
            Log("Warning: " $ string(self) $ " Couldn't dynamically load font " $ InstructionFontName);
        }
    }
    return InstructionFontFont;
}

simulated function DrawWeaponName(Canvas C)
{
    local string CurWeaponName;
    local float XL, YL, Fade;

    // End:0x0b
    if(bHideWeaponName)
    {
        return;
    }
    // End:0x101
    if(WeaponDrawTimer > Level.TimeSeconds)
    {
        C.Font = GetMediumFontFor(C);
        C.DrawColor = WeaponDrawColor;
        Fade = WeaponDrawTimer - Level.TimeSeconds;
        // End:0x9a
        if(Fade <= float(1))
        {
            C.DrawColor.A = byte(float(255) * Fade);
        }
        C.StrLen(LastWeaponName, XL, YL);
        C.SetPos(C.ClipX / float(2) - XL / float(2), C.ClipY * 0.80 - YL);
    }
    // End:0x124
    if(PawnOwner == none || PawnOwner.PendingWeapon == none)
    {
        return;
    }
    CurWeaponName = PawnOwner.PendingWeapon.GetHumanReadableName();
    // End:0x189
    if(CurWeaponName != LastWeaponName)
    {
        WeaponDrawTimer = Level.TimeSeconds + 1.50;
        WeaponDrawColor = PawnOwner.PendingWeapon.HudColor;
    }
    LastWeaponName = CurWeaponName;
}

function DrawVehicleName(Canvas C);
simulated function DrawCinematicHUD(Canvas C)
{
    super.DrawCinematicHUD(C);
    // End:0x24
    if(SubTitles != none)
    {
        DrawIntroSubtitles(C);
    }
    // End:0x38
    else
    {
        // End:0x38
        if(bHideHUD)
        {
            DisplayLocalMessages(C);
        }
    }
}

simulated function DrawIntroSubtitles(Canvas C)
{
    local string CurrentSubTitles;
    local float XL, YL, YO;
    local array<string> OutArray;
    local int i;

    CurrentSubTitles = SubTitles.GetSubTitles();
    // End:0x23
    if(CurrentSubTitles == "")
    {
        return;
    }
    C.DrawColor = WhiteColor;
    C.Style = 5;
    C.Font = GetFontSizeIndex(C, -1);
    C.WrapStringToArray(CurrentSubTitles, OutArray, C.ClipX * 0.750);
    C.StrLen(OutArray[i], XL, YL);
    YO = FMin(C.ClipY * 0.90 - YL * 0.50 * float(OutArray.Length), C.ClipY - float(OutArray.Length) + 1.10 * YL);
    i = 0;
    J0x118:
    // End:0x1ab [While If]
    if(i < OutArray.Length)
    {
        C.StrLen(OutArray[i], XL, YL);
        C.SetPos(C.ClipX - XL * 0.50, YO + YL * float(i));
        C.DrawText(OutArray[i], false);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x118;
    }
}

static function bool IsTargetInFrontOfPlayer(Canvas C, Actor Target, out Vector ScreenPos, Vector camLoc, Rotator camRot)
{
    return IsTargetInFrontOfPlayer2(C, Target.Location, ScreenPos, camLoc, camRot);
}

static function bool IsTargetInFrontOfPlayer2(Canvas C, Vector TargetPos, out Vector ScreenPos, Vector camLoc, Rotator camRot)
{
    // End:0x1f
    if(TargetPos - camLoc Dot vector(camRot) < float(0))
    {
        return false;
    }
    ScreenPos = C.WorldToScreen(TargetPos);
    // End:0x6c
    if(ScreenPos.X <= float(0) || ScreenPos.X >= C.ClipX)
    {
        return false;
    }
    // End:0x9f
    if(ScreenPos.Y <= float(0) || ScreenPos.Y >= C.ClipY)
    {
        return false;
    }
    return true;
}

static function ClipScreenCoords(Canvas C, out float X, out float Y, optional float XL, optional float YL)
{
    // End:0x1a
    if(X < XL)
    {
        X = XL;
    }
    // End:0x34
    if(Y < YL)
    {
        Y = YL;
    }
    // End:0x6e
    if(X > C.ClipX - XL)
    {
        X = C.ClipX - XL;
    }
    // End:0xa8
    if(Y > C.ClipY - YL)
    {
        Y = C.ClipY - YL;
    }
}

// Export UHudBase::execDrawTileFromSpriteWidget(FFrame&, void* const)
native function DrawTileFromSpriteWidget(Canvas C, SpriteWidget SW);
// Export UHudBase::execDrawTileFromSpriteWidget2(FFrame&, void* const)
native function DrawTileFromSpriteWidget2(Canvas C, SpriteWidget SW, float W, float H);
// Export UHudBase::execCalculateCoordinate(FFrame&, void* const)
native function CalculateCoordinate(Canvas C, SpriteWidget W, float fWidth, float fHeight, out CalCoordsW coordsW);
// Export UHudBase::execCalculateCoordinateEx(FFrame&, void* const)
native function CalculateCoordinateEx(Canvas C, SpriteWidget W, float fWidth, float fHeight, out CalCoordsW coordsW);
// Export UHudBase::execCalculateCoordinateDigit(FFrame&, void* const)
native function CalculateCoordinateDigit(Canvas C, DigitSet W, NumericWidget N, float fWidth, float fHeight, int Index, out CalCoordsW coordsW);
// Export UHudBase::execCalculateCoordinateDigitEx(FFrame&, void* const)
native function CalculateCoordinateDigitEx(Canvas C, DigitSet W, NumericWidget N, float fWidth, float fHeight, int Index, out CalCoordsW coordsW);
// Export UHudBase::execDrawWarfareCrosshairExtNative(FFrame&, void* const)
native function DrawWarfareCrosshairExtNative(Canvas C, int Spread);
function string GetBaseTeamName(int TeamIndex)
{
    return BaseTeamName[TeamIndex];
}

function Color GetBaseTeamColor(int viewerTeamIndex, int targetTeamIndex)
{
    // End:0x18
    if(viewerTeamIndex == targetTeamIndex)
    {
        return BaseTeamColorAlly;
    }
    // End:0x24
    else
    {
        return BaseTeamColor[targetTeamIndex];
    }
}

function PlayerReplicationInfo FindPRI(Pawn P)
{
    local PlayerReplicationInfo PRI;
    local string PlayerName;
    local int lp1;

    // End:0x0d
    if(P == none)
    {
        return none;
    }
    PlayerName = P.LoginName;
    // End:0x41
    if(PlayerName == "")
    {
        PlayerName = P.OwnerName;
    }
    // End:0x67
    if(P.PlayerReplicationInfo != none)
    {
        return P.PlayerReplicationInfo;
    }
    // End:0x11b
    else
    {
        lp1 = 0;
        J0x6e:
        // End:0xe8 [While If]
        if(lp1 < Level.GRI.PRIArray.Length)
        {
            // End:0xde
            if(Level.GRI.PRIArray[lp1].PlayerName == PlayerName)
            {
                return Level.GRI.PRIArray[lp1];
            }
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x6e;
        }
        // End:0x118
        foreach DynamicActors(class'PlayerReplicationInfo', PRI)
        {
            // End:0x117
            if(PRI.PlayerName == PlayerName)
            {
                break;
                return PRI;
            }                        
        }
        return none;
    }
}

function DrawGMHudSpectating(Canvas C);
function DrawHudSpectating(Canvas C);
// Export UHudBase::execDrawNametagsNative(FFrame&, void* const)
native function DrawNametagsNative(Canvas C, bool bSpectateMode, optional bool drawAlways);
function DrawNametags(Canvas C, bool bSpectateMode, optional bool drawAlways)
{
    DrawNametagsScript(C, bSpectateMode, drawAlways);
}

function DrawNametagsScript(Canvas C, bool bSpectateMode, optional bool drawAlways)
{
    local wPawn curPawn, wPawnOwner;
    local Vector camLoc;
    local Rotator camRot;
    local float X1, Y1, X2, Y2, width, Height;

    local bool curPawnSameTeam;
    local Vector centerScreenPos;
    local bool bDraw;
    local Vector curPawnCenterPos, HitLocation, HitNormal, TraceEnd;
    local float markWidth, markHeight;
    local bool bUpdateNametagVis;
    local int lp1;

    centerScreenPos.X = C.ClipX / float(2);
    centerScreenPos.Y = C.ClipY / float(2);
    centerScreenPos.Z = 1.0;
    markWidth = 24.0 * _rX;
    markHeight = 24.0 * _rY;
    bUpdateNametagVis = Level.TimeSeconds - NameTagVisUpdateTime > 0.050;
    // End:0xb2
    if(bUpdateNametagVis)
    {
        NameTagVisUpdateTime = Level.TimeSeconds;
    }
    // End:0x604
    if(PawnOwnerPRI != none)
    {
        wPawnOwner = wPawn(PawnOwner);
        C.GetCameraLocation(camLoc, camRot);
        TraceEnd = camLoc + float(100000) * vector(camRot);
        lp1 = 0;
        J0x10a:
        // End:0x604 [While If]
        if(lp1 < Level.PawnList.Length)
        {
            curPawn = wPawn(Level.PawnList[lp1]);
            // End:0x164
            if(curPawn == none || curPawn.bHidden)
            {
            }
            // End:0x5fa
            else
            {
                // End:0x1b4
                if(curPawn.DrivenVehicle != none && curPawn.PlayerReplicationInfo == none)
                {
                    curPawn.PlayerReplicationInfo = curPawn.DrivenVehicle.PlayerReplicationInfo;
                }
                // End:0x5fa
                if(curPawn.PlayerReplicationInfo != none)
                {
                    // End:0x221
                    if(curPawn.PlayerReplicationInfo.Team == none || Level.GRI.GameClass ~= "wGame.wDeathMatch")
                    {
                        curPawnSameTeam = false;
                    }
                    // End:0x261
                    else
                    {
                        curPawnSameTeam = curPawn.PlayerReplicationInfo.Team.TeamIndex == PawnOwnerPRI.Team.TeamIndex;
                    }
                    curPawn.NametagPosition = CalcNametagPos(curPawn);
                    curPawn.NametagVisInFront = IsTargetInFrontOfPlayer2(C, curPawn.NametagPosition, curPawn.NametagScreenPos, camLoc, camRot);
                    // End:0x5fa
                    if(curPawn.NametagVisInFront)
                    {
                        bDraw = drawAlways;
                        // End:0x2ef
                        if(curPawnSameTeam)
                        {
                            bDraw = true;
                        }
                        // End:0x3b7
                        else
                        {
                            // End:0x3b7
                            if(!bSpectateMode)
                            {
                                // End:0x329
                                if(bUpdateNametagVis)
                                {
                                    curPawn.NametagVisFastTrace = FastTrace(curPawn.NametagPosition, camLoc);
                                }
                                // End:0x3b7
                                if(curPawn.NametagVisFastTrace)
                                {
                                    curPawnCenterPos = curPawn.Location;
                                    curPawnCenterPos.Z += float(40);
                                    // End:0x39b
                                    if(bUpdateNametagVis)
                                    {
                                        curPawn.NametagVisTraceThisActor = curPawn.TraceThisActor(HitLocation, HitNormal, TraceEnd, camLoc);
                                    }
                                    // End:0x3b7
                                    if(!curPawn.NametagVisTraceThisActor)
                                    {
                                        bDraw = true;
                                    }
                                }
                            }
                        }
                        // End:0x4a7
                        if(bDraw)
                        {
                            DrawNameTag(C, curPawn);
                            // End:0x4a7
                            if(curPawnSameTeam == false && curPawn.PlayerReplicationInfo.IsInvulnerable == true)
                            {
                                C.BtrTextSize(curPawn.PlayerReplicationInfo.PlayerName, NametagFontSize + 1, width, Height);
                                IconInvulnerable.PosX = curPawn.NametagScreenPos.X / C.ClipX;
                                IconInvulnerable.PosY = curPawn.NametagScreenPos.Y - Height / C.ClipY;
                                DrawSpriteWidget(C, IconInvulnerable);
                            }
                        }
                        // End:0x5fa
                        if(curPawn.PlayerReplicationInfo != none && Level.TimeSeconds < curPawn.PlayerReplicationInfo.PopMessageEnd)
                        {
                            C.DrawColor = WhiteColor;
                            C.BtrTextSize(curPawn.PlayerReplicationInfo.PopMessage, int(float(10) * _rY), width, Height);
                            X1 = curPawn.NametagScreenPos.X - width / float(2);
                            Y1 = curPawn.NametagScreenPos.Y - float(NametagFontSize) - Height - float(20);
                            X2 = X1 + width;
                            Y2 = Y1 + Height;
                            C.BtrDrawTextJustified(curPawn.PlayerReplicationInfo.PopMessage, 0, X1, Y1, X2, Y2, int(float(10) * _rY));
                        }
                    }
                }
            }
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x10a;
        }
    }
}

function DrawMissionIcon(Canvas C, wPawn curPawn);
function DrawNameTag(Canvas C, wPawn curPawn)
{
    local float X1, Y1, X2, Y2, width, Height;

    local string nametag;
    local Color nametagColor;
    local float markWidth, markHeight;
    local Material Mark;

    markWidth = 24.0 * _rX;
    markHeight = 24.0 * _rY;
    nametag = curPawn.PlayerReplicationInfo.PlayerName;
    // End:0x6a
    if(curPawn.PlayerReplicationInfo.IsInvulnerable)
    {
        nametag $= NameTagInvulnerablePost;
    }
    DrawMissionIcon(C, curPawn);
    C.BtrTextSize(nametag, NametagFontSize + 1, width, Height);
    // End:0xd5
    if(curPawn.PlayerReplicationInfo.ClassMark == none)
    {
        curPawn.PlayerReplicationInfo.LoadLevelMark();
    }
    Mark = curPawn.PlayerReplicationInfo.ClassMark;
    width += markWidth;
    X1 = curPawn.NametagScreenPos.X - width / float(2);
    Y1 = curPawn.NametagScreenPos.Y - Height - markHeight - Height / float(2);
    C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
    C.SetPos(X1, Y1);
    X1 = curPawn.NametagScreenPos.X - width / float(2) + markWidth;
    Y1 = curPawn.NametagScreenPos.Y - Height;
    X2 = X1 + width;
    Y2 = Y1 + Height;
    nametagColor = GetNametagColor(curPawn.PlayerReplicationInfo);
    C.DrawColor = NametagShadowColor;
    C.BtrDrawTextJustified(nametag, 0, X1 + float(NametagShadowX), Y1 + float(NametagShadowY), X2 + float(NametagShadowX), Y2 + float(NametagShadowY), NametagFontSize);
    C.DrawColor = nametagColor;
    C.BtrDrawTextJustified(nametag, 0, X1, Y1, X2, Y2, NametagFontSize);
    // End:0x3a4
    if(nametag == KillerName && KillerMarkTimeToRemove > Level.TimeSeconds)
    {
        C.SetDrawColor(byte(255), byte(255), byte(255));
        C.SetPos(X1 - float(7), Y1 - float(63));
        C.DrawTile(KillerSprite.WidgetTexture, 63.0, 63.0, float(KillerSprite.TextureCoords.X1), float(KillerSprite.TextureCoords.Y1), float(KillerSprite.TextureCoords.X2), float(KillerSprite.TextureCoords.Y2));
    }
}

function RefreshKillerName(string mKillerName)
{
    KillerName = mKillerName;
    KillerMarkTimeToRemove = Level.TimeSeconds + float(5);
}

function Color GetNametagColor(PlayerReplicationInfo Info)
{
    local Color C;

    // End:0x55
    if(Level.GRI.GameClass ~= "wGame.wDeathMatch")
    {
        C = BaseTeamColor[Info.Team.TeamIndex];
    }
    // End:0xe5
    else
    {
        // End:0xc2
        if(PlayerOwner.PlayerReplicationInfo.Team.TeamIndex == Info.Team.TeamIndex)
        {
            // End:0xb4
            if(1 == Info.GetCheckFriendOrClanMember())
            {
                C = FriendlyColor;
            }
            // End:0xbf
            else
            {
                C = BaseTeamColorAlly;
            }
        }
        // End:0xe5
        else
        {
            C = BaseTeamColor[Info.Team.TeamIndex];
        }
    }
    C.A = 196;
    return C;
}

// Export UHudBase::execCalcNametagPosNative(FFrame&, void* const)
native function Vector CalcNametagPosNative(Pawn curPawn);
function Vector CalcNametagPos(Pawn curPawn)
{
    local Vector NametagPosition;

    NametagPosition = curPawn.Location;
    // End:0x39
    if(curPawn.bIsCrouched)
    {
        NametagPosition.Z += float(40);
    }
    // End:0x6e
    else
    {
        // End:0x5e
        if(curPawn.bIsProned)
        {
            NametagPosition.Z += float(25);
        }
        // End:0x6e
        else
        {
            NametagPosition.Z += float(70);
        }
    }
    NametagPosition.Z += NametagExtraZ;
    return NametagPosition;
}

static function PlayHUDSound(PlayerController PC, HudBase.eHUDSOUND soundType)
{
    local string strSound;

    switch(soundType)
    {
        // End:0x3b
        case 0:
            strSound = "Warfare_Sound_UI.com.ui_qslot_change";
            // End:0x17e
            break;
        // End:0x72
        case 1:
            strSound = "Warfare_Sound_UI.etc.ui_etc_qslotchange";
            // End:0x17e
            break;
        // End:0xa5
        case 2:
            strSound = "Warfare_Sound_UI.etc.ui_etc_minimap";
            // End:0x17e
            break;
        // End:0xdb
        case 3:
            strSound = "Warfare_Sound_UI.etc.ui_etc_queststate";
            // End:0x17e
            break;
        // End:0x110
        case 4:
            strSound = "Warfare_Sound_UI.etc.ui_etc_questcomp";
            // End:0x17e
            break;
        // End:0x145
        case 5:
            strSound = "Warfare_Sound_UI.etc.ui_etc_friendson";
            // End:0x17e
            break;
        // End:0x178
        case 6:
            strSound = "Warfare_Sound_UI.etc.ui_etc_whisper";
            // End:0x17e
            break;
        // End:0xffff
        default:
            // End:0x17e Break;
            break;
    }
    // End:0x1b9
    if(PC == none)
    {
        Log("[PLAYHUDSOUND] PC=NONE , Type=" $ string(soundType));
    }
    // End:0x1dd
    else
    {
        PC.ClientPlaySound(Sound(DynamicLoadObject(strSound, class'Sound')));
    }
}

simulated event WorldSpaceOverlays()
{
    local int i;
    local Vector vCenterPos;

    super.WorldSpaceOverlays();
    i = 0;
    J0x0d:
    // End:0x81 [While If]
    if(i < Level.CSReviewLines.Length)
    {
        Draw3DLine(Level.CSReviewLines[i].vStartPos, Level.CSReviewLines[i].vEndPos, Level.CSReviewLines[i].LineColor);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0d;
    }
    i = 0;
    J0x88:
    // End:0x101 [While If]
    if(i < Level.CSReviewArrows.Length)
    {
        DrawDirectionalArrow(Level.CSReviewArrows[i].vPos, Level.CSReviewArrows[i].rRayDir, Level.CSReviewArrows[i].ArrowColor, 1.0);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x88;
    }
    i = 0;
    J0x108:
    // End:0x16a [While If]
    if(i < Level.CSReviewPoints.Length)
    {
        DrawSphere(Level.CSReviewPoints[i].vPos, Level.CSReviewPoints[i].PointColor, 6.0, 8);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x108;
    }
    i = 0;
    J0x171:
    // End:0x248 [While If]
    if(i < Level.CSReviewSpheres.Length)
    {
        vCenterPos = Level.CSReviewSpheres[i].vCenterPos;
        vCenterPos.Z += Level.CSReviewSpheres[i].fInRadius * 0.50;
        DrawCircle(vCenterPos, MakeVector(1.0, 0.0, 0.0), MakeVector(0.0, 1.0, 0.0), Level.CSReviewSpheres[i].kColor, Level.CSReviewSpheres[i].fInRadius, 20);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x171;
    }
}

exec function killlog(string szPath, optional string szCommand)
{
    local bool bResult;

    Level.ResetCombationSituationReview();
    bResult = false;
    // End:0x51
    if(szPath == "del" || szPath == "DEL")
    {
        Level.ResetCombationSituationReview();
        bResult = true;
    }
    // End:0x191
    else
    {
        // End:0x8f
        if(szCommand == "af" || szCommand == "AF")
        {
            bResult = Level.LoadKilllog(szPath, 0, 0);
        }
        // End:0x191
        else
        {
            // End:0xcf
            if(szCommand == "rsa" || szCommand == "RSA")
            {
                bResult = Level.LoadKilllog(szPath, 0, 1);
            }
            // End:0x191
            else
            {
                // End:0x113
                if(szCommand == "all" || szCommand == "ALL")
                {
                    bResult = Level.LoadKilllog(szPath, 0, -1);
                }
                // End:0x191
                else
                {
                    // End:0x154
                    if(szCommand == "ammo" || szCommand == "AMMO")
                    {
                        bResult = Level.LoadKilllog(szPath, 1);
                    }
                    // End:0x191
                    else
                    {
                        // End:0x191
                        if(szCommand == "etc" || szCommand == "ETC")
                        {
                            bResult = Level.LoadKilllog(szPath, 2);
                        }
                    }
                }
            }
        }
    }
    // End:0x1b7
    if(bResult == true)
    {
        clog("killlog Succeed");
    }
    // End:0x1ce
    else
    {
        clog("killlog Failed.");
    }
}

exec function usermove(string szPath, optional string szCommand, optional int nCombatNum)
{
    local bool bResult;

    Level.ResetCombationSituationReview();
    bResult = false;
    // End:0x51
    if(szPath == "del" || szPath == "DEL")
    {
        Level.ResetCombationSituationReview();
        bResult = true;
    }
    // End:0x140
    else
    {
        // End:0x8e
        if(szCommand == "af" || szCommand == "AF")
        {
            bResult = Level.LoadUsermove(szPath, 1);
        }
        // End:0x140
        else
        {
            // End:0xce
            if(szCommand == "rsa" || szCommand == "RSA")
            {
                bResult = Level.LoadUsermove(szPath, 2);
            }
            // End:0x140
            else
            {
                // End:0x10d
                if(szCommand == "all" || szCommand == "ALL")
                {
                    bResult = Level.LoadUsermove(szPath, 0);
                }
                // End:0x140
                else
                {
                    // End:0x140
                    if(szCommand != "")
                    {
                        bResult = Level.LoadUsermove(szPath, 3, nCombatNum, szCommand);
                    }
                }
            }
        }
    }
    // End:0x167
    if(bResult == true)
    {
        clog("usermove Succeed");
    }
    // End:0x17f
    else
    {
        clog("usermove Failed.");
    }
}

exec function userzone(string szPath, string szCommand)
{
    local bool bResult;

    // End:0x16
    if(Level.kUserzoneInfo == none)
    {
        return;
    }
    Level.kUserzoneInfo.CalcMapSize(4.0);
    bResult = false;
    // End:0x7e
    if(szPath == "del" || szPath == "DEL")
    {
        Level.kUserzoneInfo.Destroy();
        bResult = true;
    }
    // End:0x168
    else
    {
        // End:0xbb
        if(szCommand == "af" || szCommand == "AF")
        {
            bResult = Level.LoadUserzone(szPath, 0);
        }
        // End:0x168
        else
        {
            // End:0xfa
            if(szCommand == "rsa" || szCommand == "RSA")
            {
                bResult = Level.LoadUserzone(szPath, 1);
            }
            // End:0x168
            else
            {
                // End:0x13a
                if(szCommand == "all" || szCommand == "ALL")
                {
                    bResult = Level.LoadUserzone(szPath, 2);
                }
                // End:0x168
                else
                {
                    // End:0x168
                    if(szCommand != "")
                    {
                        bResult = Level.LoadUserzone(szPath, 3, szCommand);
                    }
                }
            }
        }
    }
    // End:0x18f
    if(bResult == true)
    {
        clog("userzone Succeed");
    }
    // End:0x1a7
    else
    {
        clog("userzone Failed.");
    }
}

exec function clearkilllog()
{
    Level.ResetCombationSituationReview();
    clog("clearkilllog Successed.");
}

function int GetCurGameTime()
{
    return TimeMinutes * 60 + TimeSeconds;
}

defaultproperties
{
    strSpectateHelp="Switch between players with the left and right mouse buttons."
    fbSpectateLevel=(X1=597.0,Y1=1148.0,X2=642.0,Y2=1193.0)
    fbSpectateUser=(X1=647.0,Y1=1159.0,X2=1600.0,Y2=1183.0)
    fbSpectateHelp=(X1=0.0,Y1=1110.0,X2=1600.0,Y2=1135.0)
    fbSpectatingBack=(X1=0.0,Y1=1099.0,X2=1600.0,Y2=1200.0)
    NametagFactorZ=1.20
    NametagExtraZ=24.0
    NametagFontSize=10
    NametagRadius=48.0
    NametagShadowX=1
    NametagShadowY=1
    NametagShadowColor=(R=0,G=0,B=0,A=160)
    NameTagInvulnerablePost="(Invulnerable)"
    NameTagVisUpdateTime=-999.0
    IconDefendBombHolder=(WidgetTexture=Texture'Warfare_GP_UI_HUD_ETC.DisplayIcon.keep_c4',RenderStyle=5,TextureCoords=(X1=18,Y1=0,X2=110,Y2=128),TextureScale=0.370,DrawPivot=5,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    IconInvulnerable=(WidgetTexture=Texture'Warfare_GP_UI_HUD_ETC.DisplayIcon.invincible_mark',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=0.50,DrawPivot=5,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    InstructTextBorderX=10.0
    InstructTextBorderY=10.0
    InstructionFontName="EntryTex.Entry"
    CroppingAmount=0.250
    LevelActionLoading="Loading... "
    LevelActionPaused="Paused"
    LevelActionFontName="EntryTex.Entry"
    WonMatchPostFix=" You won the match!"
    WaitingToSpawn="Press [Fire] to join the match!"
    AtMenus="Press [ESC] to close menu"
    YouveWonTheMatch="You won the match!"
    YouveLostTheMatch="You lost the match."
    NowViewing="Now Viewing"
    ScoreText="Score"
    InitialViewingString="Click [Fire] to see other players."
    DefaultCrosshair=Texture'Warfare_GP_UI_HUD_ETC.Crosshairs.cross_hair_throw'
    TargetCrosshair=Texture'Warfare_GP_UI_HUD_ETC.Crosshairs.cross_hair_throw_target'
    WAttackedBG=(WidgetTexture=Texture'Warfare_HUD.HUD.hud_damage',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=512,Y2=512),TextureScale=0.650,DrawPivot=8,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=0,ScaleMode=0,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    bUseCustomWeaponCrosshairs=true
    ScreenRatioX=0.0009770
    ScreenRatioY=0.0013020
    ScreenRatioXEx=0.0006250
    ScreenRatioYEx=0.0008330
    BaseTeamName=// Object reference not set to an instance of an object.
    
    BaseTeamColorAlly=(R=71,G=246,B=255,A=255)
    BaseTeamColor=// Object reference not set to an instance of an object.
    
    FriendlyColor=(R=67,G=246,B=55,A=255)
    MyselfColor=(R=255,G=153,B=0,A=255)
    KillerSprite=(WidgetTexture=Texture'Warfare_GP_UI_HUD_ETC.DisplayIcon.our_sol_killer',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=63,Y2=63),TextureScale=0.650,DrawPivot=5,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    FontArrayNames[0]="UT2003Fonts.FontEurostile37"
    FontArrayNames[1]="UT2003Fonts.FontEurostile29"
    FontArrayNames[2]="UT2003Fonts.FontEurostile24"
    FontArrayNames[3]="UT2003Fonts.FontEurostile21"
    FontArrayNames[4]="UT2003Fonts.FontEurostile17"
    FontArrayNames[5]="UT2003Fonts.FontEurostile14"
    FontArrayNames[6]="UT2003Fonts.FontEurostile12"
    FontArrayNames[7]="UT2003Fonts.FontEurostile9"
    FontArrayNames[8]="UT2003Fonts.FontSmallText"
    FontScreenWidthMedium[0]=2048
    FontScreenWidthMedium[1]=1600
    FontScreenWidthMedium[2]=1280
    FontScreenWidthMedium[3]=1024
    FontScreenWidthMedium[4]=800
    FontScreenWidthMedium[5]=640
    FontScreenWidthMedium[6]=512
    FontScreenWidthMedium[7]=400
    FontScreenWidthMedium[8]=320
    FontScreenWidthSmall[0]=4096
    FontScreenWidthSmall[1]=3200
    FontScreenWidthSmall[2]=2560
    FontScreenWidthSmall[3]=2048
    FontScreenWidthSmall[4]=1600
    FontScreenWidthSmall[5]=1280
    FontScreenWidthSmall[6]=1024
    FontScreenWidthSmall[7]=800
    FontScreenWidthSmall[8]=640
}