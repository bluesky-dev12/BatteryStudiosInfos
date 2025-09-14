class HudBase extends HUD
    transient
    native;

enum eHUDSOUND
{
    EHS_QUICKSLOT_TOGGLE,           // 0
    EHS_QUICKSLOT_CHANGE,           // 1
    EHS_MINIMAP_TOGGLE,             // 2
    EHS_QUEST_STATE,                // 3
    EHS_QUEST_COMPLETE,             // 4
    EHS_FRIENDS_ON,                 // 5
    EHS_WHISPER                     // 6
};

struct native HudLocalizedMessage
{
    var Class<LocalMessage> Message;
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
    var Object.EDrawPivot DrawPivot;
    var LocalMessage.EStackMode StackMode;
    var float PosX;
    var float PosY;
    var float dx;
    var float dy;
    var bool Drawn;
    var bool PlaySound;
};

var string SpecPlayerName;
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
var() transient int TeamIndex;
var() transient Actor.ERenderStyle PassStyle;
var array<HudBase> ChildHudParts;
var() transient HudLocalizedMessage LocalMessages[8];
var() Class<Actor> VoteMenuClass;
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

function DoUpdateTime()
{
    //return;    
}

simulated function UpdateHUD()
{
    //return;    
}

simulated function DrawHudPassA(Canvas C)
{
    //return;    
}

simulated function DrawHudPassB(Canvas C)
{
    //return;    
}

simulated function DrawHudPassC(Canvas C)
{
    //return;    
}

simulated function DrawHudPassD(Canvas C)
{
    //return;    
}

simulated function PrecacheFonts(Canvas C)
{
    FontsPrecached++;
    C.Font = GetConsoleFont(C);
    C.SetPos(0.0000000, 0.0000000);
    C.DrawText("<>_Aa1");
    C.Font = GetFontSizeIndex(C, -2);
    C.SetPos(0.0000000, 0.0000000);
    C.DrawText("Aa1");
    C.Font = GetFontSizeIndex(C, -4);
    C.SetPos(0.0000000, 0.0000000);
    C.DrawText("Aa1");
    C.Font = GetFontSizeIndex(C, MessageFontOffset);
    C.SetPos(0.0000000, 0.0000000);
    C.DrawText("Aa1");
    C.Font = GetFontSizeIndex(C, 1 + MessageFontOffset);
    C.SetPos(0.0000000, 0.0000000);
    C.DrawText("Aa1");
    C.Font = GetFontSizeIndex(C, 2 + MessageFontOffset);
    C.SetPos(0.0000000, 0.0000000);
    C.DrawText("Aa1");
    C.Font = GetFontSizeIndex(C, 3 + MessageFontOffset);
    C.SetPos(0.0000000, 0.0000000);
    C.DrawText("Aa1");
    //return;    
}

function PostBeginPlay()
{
    super.PostBeginPlay();
    // End:0x15
    if(CustomHUDColorAllowed())
    {
        SetCustomHUDColor();
    }
    //return;    
}

function bool CustomHUDColorAllowed()
{
    return false;
    //return;    
}

function SetCustomHUDColor()
{
    //return;    
}

function DrawMinimap(wHudPart_MinimapBase Minimap, Canvas C)
{
    //return;    
}

function DisplayHit(Vector HitDir, int Damage, Class<DamageType> DamageType)
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
    HitDir.Z = 0.0000000;
    HitDir = Normal(HitDir);
    Forward = HitDir Dot X;
    Left = HitDir Dot Y;
    // End:0xB7
    if(Forward > float(0))
    {
        // End:0xA9
        if(Forward > 0.7000000)
        {
            Emphasized[2] = 1;
        }
        Ignore[3] = 1;        
    }
    else
    {
        // End:0xD1
        if(Forward < -0.7000000)
        {
            Emphasized[3] = 1;
        }
        Ignore[2] = 1;
    }
    // End:0x10F
    if(Left > float(0))
    {
        // End:0x102
        if(Left > 0.7000000)
        {
            Emphasized[0] = 1;
        }
        Ignore[1] = 1;        
    }
    else
    {
        // End:0x128
        if(Left < -0.7000000)
        {
            Emphasized[1] = 1;
        }
        Ignore[0] = 1;
    }
    NewDamageTime = 10.0000000 * float(Clamp(Damage, 20, 30));
    i = 0;
    J0x153:

    // End:0x1A2 [Loop If]
    if(i < 4)
    {
        // End:0x198
        if(int(Ignore[i]) != 1)
        {
            DamageFlash[i].R = byte(255);
            DamageTime[i] = NewDamageTime;
        }
        i++;
        // [Loop Continue]
        goto J0x153;
    }
    //return;    
}

function DrawDamageIndicators(Canvas C)
{
    local int nDamageAccumulate;

    nDamageAccumulate = 0;
    // End:0x5D
    if(true == PlayerOwner.IsInState('Dead'))
    {
        Log("Dying");
        DamageTime[0] = 0.0000000;
        DamageTime[1] = 0.0000000;
        DamageTime[2] = 0.0000000;
        DamageTime[3] = 0.0000000;
    }
    // End:0x151
    if(DamageTime[0] > float(0))
    {
        C.SetPos(0.0000000, 0.0000000);
        C.DrawColor = DamageFlash[0];
        C.DrawColor.A = byte(DamageTime[0]);
        // End:0x103
        if(int(Emphasized[0]) == 1)
        {
            nDamageAccumulate++;
            C.DrawTile(Texture'FX_TEX.Damage.damage_big', 1024.0000000, 768.0000000, 0.0000000, 0.0000000, 512.0000000, 512.0000000);            
        }
        else
        {
            C.DrawTile(Texture'FX_TEX.Damage.damage_small_down', C.ClipX, 0.3000000 * C.ClipY, 0.0000000, 0.0000000, 128.0000000, 64.0000000);
        }        
    }
    else
    {
        Emphasized[0] = 0;
    }
    // End:0x278
    if(DamageTime[1] > float(0))
    {
        C.SetPos(0.0000000, 0.0000000);
        C.DrawColor = DamageFlash[1];
        C.DrawColor.A = byte(DamageTime[1]);
        // End:0x201
        if(int(Emphasized[1]) == 1)
        {
            C.DrawTile(Texture'FX_TEX.Damage.damage_big', 1024.0000000, 768.0000000, 0.0000000, 0.0000000, 512.0000000, 512.0000000);
            nDamageAccumulate++;            
        }
        else
        {
            C.SetPos(0.0000000, 0.7000000 * C.ClipY);
            C.DrawTile(Texture'FX_TEX.Damage.damage_small_up', C.ClipX, 0.3000000 * C.ClipY, 0.0000000, 0.0000000, 128.0000000, 64.0000000);
        }        
    }
    else
    {
        Emphasized[1] = 0;
    }
    // End:0x37A
    if(DamageTime[2] > float(0))
    {
        C.SetPos(0.0000000, 0.0000000);
        C.DrawColor = DamageFlash[2];
        C.DrawColor.A = byte(DamageTime[2]);
        // End:0x32C
        if(int(Emphasized[2]) == 1)
        {
            C.DrawTile(Texture'FX_TEX.Damage.damage_big', 1024.0000000, 768.0000000, 0.0000000, 0.0000000, 512.0000000, 512.0000000);
            nDamageAccumulate++;            
        }
        else
        {
            C.DrawTile(Texture'FX_TEX.Damage.damage_small_right', 0.3000000 * C.ClipX, C.ClipY, 0.0000000, 0.0000000, 64.0000000, 128.0000000);
        }        
    }
    else
    {
        Emphasized[2] = 0;
    }
    // End:0x4A6
    if(DamageTime[3] > float(0))
    {
        C.SetPos(0.0000000, 0.0000000);
        C.DrawColor = DamageFlash[3];
        C.DrawColor.A = byte(DamageTime[3]);
        // End:0x42F
        if(int(Emphasized[3]) == 1)
        {
            C.DrawTile(Texture'FX_TEX.Damage.damage_big', 1024.0000000, 768.0000000, 0.0000000, 0.0000000, 512.0000000, 512.0000000);
            nDamageAccumulate++;            
        }
        else
        {
            C.SetPos(0.7000000 * C.ClipX, 0.0000000);
            C.DrawTile(Texture'FX_TEX.Damage.damage_small_left', 0.3000000 * C.ClipX, C.ClipY, 0.0000000, 0.0000000, 64.0000000, 128.0000000);
        }        
    }
    else
    {
        Emphasized[3] = 0;
    }
    // End:0x4C7
    if(nDamageAccumulate >= 1)
    {
        PlayPainSound(C);
    }
    //return;    
}

function PlayPainSound(Canvas C)
{
    //return;    
}

simulated function Tick(float DeltaTime)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x6C [Loop If]
    if(i < 4)
    {
        // End:0x62
        if(DamageTime[i] > float(0))
        {
            DamageTime[i] -= (float(120) * DeltaTime);
            // End:0x62
            if(DamageTime[i] < float(1))
            {
                DamageTime[i] = 0.0000000;
            }
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

simulated function DrawHeadShotSphere()
{
    local Coords co;
    local Pawn P;
    local Vector HeadLoc;

    // End:0xD1
    foreach DynamicActors(Class'Engine.Pawn', P)
    {
        // End:0xD0
        if((P != none) && P.HeadBone != 'None')
        {
            co = P.GetBoneCoords(P.HeadBone);
            HeadLoc = co.Origin + ((P.HeadHeight * P.HeadScale) * co.XAxis);
            P.DrawDebugSphere(HeadLoc, P.HeadRadius * P.HeadScale, 10, 0, byte(255), 0);
        }        
    }    
    //return;    
}

function DrawAttacked(Canvas C)
{
    local int iAlpha;
    local float fTotalDrawTime, fDelayDrawTime, fFadeOutDrawTime;

    fTotalDrawTime = 0.5000000;
    fDelayDrawTime = 0.2000000;
    fFadeOutDrawTime = 0.3000000;
    // End:0x4A
    if((fStartTime + fTotalDrawTime) < Level.TimeSeconds)
    {
        bAttacked = false;
        return;
    }
    // End:0x74
    if((fStartTime + fDelayDrawTime) > Level.TimeSeconds)
    {
        iAlpha = 90;        
    }
    else
    {
        iAlpha = int(float(89) * (1.0000000 - ((Level.TimeSeconds - fStartTime) / fFadeOutDrawTime)));
    }
    // End:0xB7
    if(iAlpha < 1)
    {
        iAlpha = 1;
    }
    C.SetPos(0.0000000, 0.0000000);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(iAlpha));
    C.DrawTile(WAttackedBG.WidgetTexture, C.ClipX, C.ClipY, 0.0000000, 0.0000000, 2.0000000, 2.0000000);
    //return;    
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

    // End:0xA7 [Loop If]
    if(lp1 < ChildHudParts.Length)
    {
        ChildHudParts[lp1].UpdateScreenRatios(C);
        lp1++;
        // [Loop Continue]
        goto J0x73;
    }
    //return;    
}

simulated function DrawHUD(Canvas C)
{
    UpdateScreenRatios(C);
    // End:0x24
    if(int(FontsPrecached) < 2)
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
    DrawHudPassA(C);
    PassStyle = 5;
    DrawHudPassB(C);
    PassStyle = 5;
    DrawHudPassC(C);
    PassStyle = 5;
    DrawHudPassD(C);
    DisplayLocalMessages(C);
    // End:0xBF
    if(bAttacked)
    {
        DrawAttacked(C);
    }
    //return;    
}

// Export UHudBase::execDrawSpriteWidget(FFrame&, void* const)
native simulated function DrawSpriteWidget(Canvas C, out SpriteWidget W)
{
    //native.C;
    //native.W;        
}

// Export UHudBase::execDrawNumericWidget(FFrame&, void* const)
native simulated function DrawNumericWidget(Canvas C, out NumericWidget W, out DigitSet D)
{
    //native.C;
    //native.W;
    //native.D;        
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

    // End:0x135 [Loop If]
    if(lp1 < StrLen)
    {
        val = int(Mid(str, lp1, 1));
        C.SetPos(X + (OffsetX * float(lp1)), Y);
        C.DrawTile(dSet.DigitTexture, XL, YL, float(dSet.TextureCoords[val].X1), float(dSet.TextureCoords[val].Y1), float(dSet.TextureCoords[val].X2 - dSet.TextureCoords[val].X1), float(dSet.TextureCoords[val].Y2 - dSet.TextureCoords[val].Y1));
        lp1++;
        // [Loop Continue]
        goto J0x31;
    }
    //return;    
}

simulated function AddChildHudPart(HudBase Child)
{
    ChildHudParts[ChildHudParts.Length] = Child;
    //return;    
}

simulated function ClearMessage(out HudLocalizedMessage M)
{
    M.Message = none;
    M.StringFont = none;
    //return;    
}

simulated function Message(PlayerReplicationInfo PRI, coerce string Msg, name MsgType)
{
    local Class<LocalMessage> LocalMessageClass;

    switch(MsgType)
    {
        // End:0x4B
        case 'Say':
            // End:0x1C
            if(PRI == none)
            {
                return;
            }
            Msg = (PRI.PlayerName $ ": ") $ Msg;
            LocalMessageClass = Class'UnrealGame.SayMessagePlus';
            // End:0xF6
            break;
        // End:0xA6
        case 'TeamSay':
            // End:0x60
            if(PRI == none)
            {
                return;
            }
            Msg = (((PRI.PlayerName $ "(") $ PRI.GetLocationName()) $ "): ") $ Msg;
            LocalMessageClass = Class'UnrealGame.TeamSayMessagePlus';
            // End:0xF6
            break;
        // End:0xCF
        case 'CriticalEvent':
            LocalMessageClass = Class'Gameplay.CriticalEventPlus';
            LocalizedMessage(LocalMessageClass, 0, none, none, none, Msg);
            return;
        // End:0xE5
        case 'DeathMessage':
            LocalMessageClass = Class'WGame.wDeathMessage';
            // End:0xF6
            break;
        // End:0xFFFF
        default:
            LocalMessageClass = Class'UnrealGame.StringMessagePlus';
            // End:0xF6
            break;
            break;
    }
    AddTextMessage(Msg, LocalMessageClass, PRI);
    //return;    
}

simulated function LocalizedMessage(Class<LocalMessage> Message, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject, optional string CriticalString)
{
    local int i, k, iCountMessageScore, iIndexMessage;
    local PlayerReplicationInfo HUDPRI;
    local float fAddTime, fIntervalTime, fNextDrawIntervalTime;

    Log((("[HudBase::LocalizedMessage] Message=" $ string(Message)) $ "  Switch=") $ string(Switch));
    fNextDrawIntervalTime = 0.4000000;
    // End:0x5F
    if(Message == none)
    {
        return;
    }
    // End:0x7E
    if(bIsCinematic && !ClassIsChildOf(Message, Class'Gameplay.ActionMessage'))
    {
        return;
    }
    // End:0x21C
    if(CriticalString == "")
    {
        // End:0xC2
        if((PawnOwner != none) && PawnOwner.PlayerReplicationInfo != none)
        {
            HUDPRI = PawnOwner.PlayerReplicationInfo;            
        }
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
                Log((((("Message=" $ string(Message)) $ " [Code_CantProne] [Switch] : ") $ string(Switch)) $ " / player bProne:") $ string(PlayerOwner.bProne));
            }
            CriticalString = Message.static.GetRelatedString(Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);            
        }
        else
        {
            // End:0x1F3
            if(Switch == 0)
            {
                Log((((("Message=" $ string(Message)) $ " [Code_CantProne] [Switch] : ") $ string(Switch)) $ " / player bProne:") $ string(PlayerOwner.bProne));
            }
            CriticalString = Message.static.GetString(Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
        }
    }
    // End:0x248
    if(bMessageBeep && Message.default.bBeep)
    {
        PlayerOwner.PlayBeepSound();
    }
    // End:0x2F9
    if(!Message.default.bIsSpecial)
    {
        // End:0x2E2
        if(PlayerOwner.bDemoOwner)
        {
            i = 0;
            J0x275:

            // End:0x2B6 [Loop If]
            if(i < ConsoleMessageCount)
            {
                // End:0x2AC
                if((i >= 8) || TextMessages[i].Text == "")
                {
                    // [Explicit Break]
                    goto J0x2B6;
                }
                i++;
                // [Loop Continue]
                goto J0x275;
            }
            J0x2B6:

            // End:0x2E2
            if((i > 0) && TextMessages[i - 1].Text == CriticalString)
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
        J0x31A:

        // End:0x366 [Loop If]
        if(i < 8)
        {
            // End:0x33F
            if(LocalMessages[i].Message == none)
            {
                // [Explicit Continue]
                goto J0x35C;
            }
            // End:0x35C
            if(LocalMessages[i].Message == Message)
            {
                // [Explicit Break]
                goto J0x366;
            }
            J0x35C:

            i++;
            // [Loop Continue]
            goto J0x31A;
        }
        J0x366:
        
    }
    else
    {
        // End:0x482
        if(Message.default.bIsPartiallyUnique || PlayerOwner.bDemoOwner)
        {
            i = 0;
            J0x396:

            // End:0x482 [Loop If]
            if(i < 8)
            {
                // End:0x3BB
                if(LocalMessages[i].Message == none)
                {
                    // [Explicit Continue]
                    goto J0x478;
                }
                // End:0x3F4
                if((LocalMessages[i].Message == Message) && LocalMessages[i].Switch == Switch)
                {
                    // [Explicit Break]
                    goto J0x482;
                }
                // End:0x469
                if(Message == Class'Engine.wMessage_Game_ImpSystem')
                {
                    // End:0x466
                    if(LocalMessages[i].Message == Message)
                    {
                        // End:0x466
                        if(Class'Engine.wMessage_Game_ImpSystem'.static.IsMessageMode(LocalMessages[i].Switch) || Class'Engine.wMessage_Game_ImpSystem'.static.IsMessageSystem(LocalMessages[i].Switch))
                        {
                            // [Explicit Break]
                            goto J0x482;
                        }
                    }
                    // [Explicit Continue]
                    goto J0x478;
                }
                // End:0x478
                if(Message == Class'Engine.wMessage_Score')
                {
                }
                J0x478:

                i++;
                // [Loop Continue]
                goto J0x396;
            }
        }
    }
    J0x482:

    // End:0x4C4
    if(i == 8)
    {
        i = 0;
        J0x495:

        // End:0x4C4 [Loop If]
        if(i < 8)
        {
            // End:0x4BA
            if(LocalMessages[i].Message == none)
            {
                // [Explicit Break]
                goto J0x4C4;
            }
            i++;
            // [Loop Continue]
            goto J0x495;
        }
    }
    J0x4C4:

    // End:0x50A
    if(i == 8)
    {
        i = 0;
        J0x4D7:

        // End:0x50A [Loop If]
        if(i < (8 - 1))
        {
            LocalMessages[i] = LocalMessages[i + 1];
            i++;
            // [Loop Continue]
            goto J0x4D7;
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
    // End:0x7C3
    if(((LocalMessages[i].Message == Class'Engine.wMessage_Score') || LocalMessages[i].Message == Class'Engine.wMultiKillMessage') || LocalMessages[i].Message == Class'Engine.wSpecialKillMessage')
    {
        k = 0;
        J0x684:

        // End:0x736 [Loop If]
        if(k < 8)
        {
            // End:0x6A2
            if(i == k)
            {
                // [Explicit Break]
                goto J0x736;
            }
            // End:0x72C
            if(((LocalMessages[k].Message == Class'Engine.wMessage_Score') || LocalMessages[k].Message == Class'Engine.wMultiKillMessage') || LocalMessages[k].Message == Class'Engine.wSpecialKillMessage')
            {
                iCountMessageScore++;
                fIntervalTime = Level.TimeSeconds - LocalMessages[k].StartTime;
                iIndexMessage = k;
            }
            k++;
            // [Loop Continue]
            goto J0x684;
        }
        J0x736:

        // End:0x7C3
        if((iCountMessageScore >= 1) && fIntervalTime < fNextDrawIntervalTime)
        {
            fAddTime = fNextDrawIntervalTime;
            LocalMessages[i].StartTime = fAddTime + LocalMessages[iIndexMessage].StartTime;
            LocalMessages[i].EndOfLife = (fAddTime + Message.static.GetLifeTime(Switch)) + LocalMessages[iIndexMessage].StartTime;
        }
    }
    //return;    
}

static function Color GetTeamColor(byte TeamNum)
{
    return default.BlackColor;
    //return;    
}

function GetLocalStatsScreen()
{
    // End:0x74
    if(((PlayerOwner != none) && TeamPlayerReplicationInfo(PlayerOwner.PlayerReplicationInfo) != none) && TeamPlayerReplicationInfo(PlayerOwner.PlayerReplicationInfo).LocalStatsScreenClass != none)
    {
        LocalStatsScreen = Spawn(TeamPlayerReplicationInfo(PlayerOwner.PlayerReplicationInfo).LocalStatsScreenClass, Owner);
    }
    //return;    
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
    C.BtrTextSize(Message.StringMessage, int((float(20) / 768.0000000) * C.ClipY), Message.dx, Message.dy);
    //return;    
}

simulated function GetScreenCoords(float PosX, float PosY, out float ScreenX, out float ScreenY, out HudLocalizedMessage Message, Canvas C)
{
    ScreenX = ((PosX * HudCanvasScale) * C.ClipX) + (((1.0000000 - HudCanvasScale) * 0.5000000) * C.ClipX);
    ScreenY = ((PosY * HudCanvasScale) * C.ClipY) + (((1.0000000 - HudCanvasScale) * 0.5000000) * C.ClipY);
    switch(Message.DrawPivot)
    {
        // End:0xA2
        case 0:
            // End:0x1DB
            break;
        // End:0xC2
        case 1:
            ScreenX -= (Message.dx * 0.5000000);
            // End:0x1DB
            break;
        // End:0xDB
        case 2:
            ScreenX -= Message.dx;
            // End:0x1DB
            break;
        // End:0x10C
        case 3:
            ScreenX -= Message.dx;
            ScreenY -= (Message.dy * 0.5000000);
            // End:0x1DB
            break;
        // End:0x136
        case 4:
            ScreenX -= Message.dx;
            ScreenY -= Message.dy;
            // End:0x1DB
            break;
        // End:0x167
        case 5:
            ScreenX -= (Message.dx * 0.5000000);
            ScreenY -= Message.dy;
            // End:0x1DB
            break;
        // End:0x180
        case 6:
            ScreenY -= Message.dy;
            // End:0x1DB
            break;
        // End:0x1A0
        case 7:
            ScreenY -= (Message.dy * 0.5000000);
            // End:0x1DB
            break;
        // End:0x1D8
        case 8:
            ScreenX -= (Message.dx * 0.5000000);
            ScreenY -= (Message.dy * 0.5000000);
            // End:0x1DB
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

simulated function DrawMessage(Canvas C, int i, float PosX, float PosY, out float dx, out float dy)
{
    local float FadeValue, ScreenX, ScreenY;

    // End:0x41
    if(!LocalMessages[i].Message.default.bFadeMessage)
    {
        C.DrawColor = LocalMessages[i].DrawColor;        
    }
    else
    {
        FadeValue = LocalMessages[i].EndOfLife - Level.TimeSeconds;
        C.DrawColor = LocalMessages[i].DrawColor;
        C.DrawColor.A = byte(float(LocalMessages[i].DrawColor.A) * (FadeValue / LocalMessages[i].Lifetime));
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
    else
    {
        C.BtrDrawTextJustified(LocalMessages[i].StringMessage, 1, 0.0000000, ScreenY, C.ClipX, ScreenY + LocalMessages[i].dy, int((float(20) / 768.0000000) * C.ClipY));
    }
    LocalMessages[i].Drawn = true;
    //return;    
}

simulated function DrawMessageWithTexture(Canvas C, int i, float PosX, float PosY, out float dx, out float dy)
{
    //return;    
}

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
    J0x4E:

    // End:0x290 [Loop If]
    if(i < 8)
    {
        // End:0x73
        if(LocalMessages[i].Message == none)
        {
            // [Explicit Break]
            goto J0x290;
        }
        LocalMessages[i].Drawn = false;
        // End:0xB2
        if(LocalMessages[i].StringFont == none)
        {
            LayoutMessage(LocalMessages[i], C);
        }
        // End:0x1DB
        if(LocalMessages[i].Message == Class'Engine.wMessage_Game_ImpSystem')
        {
            // End:0xFD
            if(!IsDrawModeMessage)
            {
                IsDrawModeMessage = Class'Engine.wMessage_Game_ImpSystem'.static.IsMessageMode(LocalMessages[i].Switch);
            }
            // End:0x12E
            if(!IsDrawSystemMessage)
            {
                IsDrawSystemMessage = Class'Engine.wMessage_Game_ImpSystem'.static.IsMessageSystem(LocalMessages[i].Switch);
            }
            // End:0x1DB
            if(!LocalMessages[i].Message.default.bFadeMessage)
            {
                FadeValue = LocalMessages[i].EndOfLife - Level.TimeSeconds;
                // End:0x1DB
                if(FadeValue <= 0.0000000)
                {
                    j = i;
                    J0x18D:

                    // End:0x1C0 [Loop If]
                    if(j < (8 - 1))
                    {
                        LocalMessages[j] = LocalMessages[j + 1];
                        j++;
                        // [Loop Continue]
                        goto J0x18D;
                    }
                    ClearMessage(LocalMessages[j]);
                    i--;
                    // [Explicit Continue]
                    goto J0x286;
                }
            }
        }
        // End:0x286
        if(LocalMessages[i].Message.default.bFadeMessage)
        {
            FadeValue = LocalMessages[i].EndOfLife - Level.TimeSeconds;
            // End:0x286
            if(FadeValue <= 0.0000000)
            {
                j = i;
                J0x238:

                // End:0x26B [Loop If]
                if(j < (8 - 1))
                {
                    LocalMessages[j] = LocalMessages[j + 1];
                    j++;
                    // [Loop Continue]
                    goto J0x238;
                }
                ClearMessage(LocalMessages[j]);
                i--;
                // [Explicit Continue]
            }
        }
        J0x286:

        i++;
        // [Loop Continue]
        goto J0x4E;
    }
    J0x290:

    i = 8 - 1;
    J0x29B:

    // End:0x3B9 [Loop If]
    if(i > -1)
    {
        // End:0x3AF
        if(((LocalMessages[i].Message == Class'Engine.wMessage_Score') || LocalMessages[i].Message == Class'Engine.wMultiKillMessage') || LocalMessages[i].Message == Class'Engine.wSpecialKillMessage')
        {
            // End:0x357
            if(bDeleteMessage)
            {
                j = i;
                J0x310:

                // End:0x343 [Loop If]
                if(j < (8 - 1))
                {
                    LocalMessages[j] = LocalMessages[j + 1];
                    j++;
                    // [Loop Continue]
                    goto J0x310;
                }
                ClearMessage(LocalMessages[j]);
                // [Explicit Continue]
                goto J0x3AF;
            }
            fRemainTime = LocalMessages[i].EndOfLife - Level.TimeSeconds;
            // End:0x3AF
            if(fRemainTime < (float(Class'Engine.wMessage_Score'.default.Lifetime) - Class'Engine.wMessage_Score'.default.fTotalEffectRunTime))
            {
                bDeleteMessage = true;
            }
        }
        J0x3AF:

        i--;
        // [Loop Continue]
        goto J0x29B;
    }
    iCount = 8;
    i = 0;
    J0x3C8:

    // End:0x651 [Loop If]
    if(i < 8)
    {
        // End:0x3ED
        if(LocalMessages[i].Message == none)
        {
            // [Explicit Break]
            goto J0x651;
        }
        // End:0x404
        if(LocalMessages[i].Drawn)
        {
            // [Explicit Continue]
            goto J0x647;
        }
        PosX = LocalMessages[i].PosX;
        PosY = LocalMessages[i].PosY;
        // End:0x4B8
        if(int(LocalMessages[i].StackMode) == int(0))
        {
            // End:0x491
            if(!LocalMessages[i].Message.default.bDrawWithTexture)
            {
                DrawMessage(C, i, PosX, PosY, dx, dy);                
            }
            else
            {
                DrawMessageWithTexture(C, i, PosX, PosY, dx, dy);
            }
            // [Explicit Continue]
            goto J0x647;
        }
        iCount2 = 8;
        j = i;
        J0x4CB:

        // End:0x647 [Loop If]
        if(j < 8)
        {
            // End:0x4EE
            if(LocalMessages[j].Drawn)
            {
                // [Explicit Continue]
                goto J0x63D;
            }
            // End:0x516
            if(LocalMessages[i].PosX != LocalMessages[j].PosX)
            {
                // [Explicit Continue]
                goto J0x63D;
            }
            // End:0x53E
            if(LocalMessages[i].PosY != LocalMessages[j].PosY)
            {
                // [Explicit Continue]
                goto J0x63D;
            }
            // End:0x56A
            if(int(LocalMessages[i].DrawPivot) != int(LocalMessages[j].DrawPivot))
            {
                // [Explicit Continue]
                goto J0x63D;
            }
            // End:0x596
            if(int(LocalMessages[i].StackMode) != int(LocalMessages[j].StackMode))
            {
                // [Explicit Continue]
                goto J0x63D;
            }
            // End:0x5DC
            if(!LocalMessages[j].Message.default.bDrawWithTexture)
            {
                DrawMessage(C, j, PosX, PosY, dx, dy);                
            }
            else
            {
                DrawMessageWithTexture(C, j, PosX, PosY, dx, dy);
            }
            switch(LocalMessages[j].StackMode)
            {
                // End:0x626
                case 1:
                    PosY -= dy;
                    // End:0x63D
                    break;
                // End:0x63A
                case 2:
                    PosY += dy;
                    // End:0x63D
                    break;
                // End:0xFFFF
                default:
                    break;
            }
            J0x63D:

            j++;
            // [Loop Continue]
            goto J0x4CB;
        }
        J0x647:

        i++;
        // [Loop Continue]
        goto J0x3C8;
    }
    J0x651:

    //return;    
}

simulated function CreateKeyMenus()
{
    // End:0x0D
    if(Owner == none)
    {
        return;
    }
    // End:0x5C
    if(((PlayerController(Owner) != none) && PlayerController(Owner).PlayerReplicationInfo != none) && PlayerController(Owner).PlayerReplicationInfo.bOnlySpectator)
    {
        return;
    }
    // End:0x76
    if(VoteMenuClass != none)
    {
        VoteMenu = Spawn(VoteMenuClass, self);
    }
    //return;    
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
    else
    {
        Start = PawnOwner;
    }
    Dir = Rotator(loc - Start.Location);
    Angle = (float(int(float(Dir.Yaw - PlayerOwner.Rotation.Yaw)) & 65535) * 6.2831998) / float(65536);
    C.Style = 5;
    C.SetPos((OffsetX * C.ClipX) + ((ScaleX * C.ClipX) * Sin(Angle)), (OffsetY * C.ClipY) - ((ScaleY * C.ClipY) * Cos(Angle)));
    Scaling = ((24.0000000 * C.ClipX) * HudScale) / float(1600);
    C.DrawTile(LocationDot, Scaling, Scaling, 340.0000000, 432.0000000, 78.0000000, 78.0000000);
    //return;    
}

simulated function SetTargeting(bool bShow, optional Vector TargetLocation, optional float Size)
{
    bShowTargeting = bShow;
    // End:0x3B
    if(bShow)
    {
        TargetingLocation = TargetLocation;
        // End:0x3B
        if(Size != 0.0000000)
        {
            TargetingSize = Size;
        }
    }
    //return;    
}

simulated function DrawTargeting(Canvas C)
{
    local int XPos, YPos;
    local Vector ScreenPos, X, Y, Z, Dir;

    local float ratioX, ratioY, tileX, tileY, dist, SizeX,
	    SizeY;

    SizeX = TargetingSize * 96.0000000;
    SizeY = TargetingSize * 96.0000000;
    // End:0x31
    if(!bShowTargeting)
    {
        return;
    }
    ScreenPos = C.WorldToScreen(TargetingLocation);
    ratioX = float(C.SizeX) / 640.0000000;
    ratioY = float(C.SizeY) / 480.0000000;
    tileX = SizeX * ratioX;
    tileY = SizeY * ratioX;
    GetAxes(PlayerOwner.Rotation, X, Y, Z);
    Dir = TargetingLocation - PawnOwner.Location;
    dist = VSize(Dir);
    Dir = Dir / dist;
    // End:0x218
    if((Dir Dot X) > 0.6000000)
    {
        XPos = int(ScreenPos.X);
        YPos = int(ScreenPos.Y);
        C.Style = 6;
        C.DrawColor.R = byte(255);
        C.DrawColor.G = byte(255);
        C.DrawColor.B = byte(255);
        C.DrawColor.A = byte(255);
        C.SetPos(float(XPos) - (tileX * 0.5000000), float(YPos) - (tileY * 0.5000000));
        C.DrawTile(TargetMaterial, tileX, tileY, 0.0000000, 0.0000000, 256.0000000, 256.0000000);
    }
    Class'Engine.BTCustomDrawHK'.static.DrawString(C, "HudBase.DrawHud->DrawTargeting", 4, 20.0000000, 0.0000000, 0.0000000, 1024.0000000, 100.0000000);
    //return;    
}

simulated function SetCropping(bool Active)
{
    DoCropping = Active;
    //return;    
}

simulated function DrawInstructionGfx(Canvas C)
{
    local float CropHeight;

    DrawCrosshair(C);
    DrawTargeting(C);
    // End:0x101
    if(DoCropping)
    {
        CropHeight = (float(C.SizeY) * CroppingAmount) * 0.5000000;
        C.SetPos(0.0000000, 0.0000000);
        C.DrawTile(Texture'Engine.BlackTexture', float(C.SizeX), CropHeight, 0.0000000, 0.0000000, 64.0000000, 64.0000000);
        C.SetPos(0.0000000, float(C.SizeY) - CropHeight);
        C.DrawTile(Texture'Engine.BlackTexture', float(C.SizeX), CropHeight, 0.0000000, 0.0000000, 64.0000000, 64.0000000);
    }
    DrawInstructionText(C);
    DrawInstructionKeyText(C);
    //return;    
}

simulated function DrawInstructionText(Canvas C)
{
    // End:0x0E
    if(InstructionText == "")
    {
        return;
    }
    C.Font = LoadInstructionFont();
    C.SetOrigin(InstructTextBorderX, InstructTextBorderY);
    C.SetClip(float(C.SizeX) - InstructTextBorderX, float(C.SizeY));
    C.SetPos(0.0000000, 0.0000000);
    C.DrawText(InstructionText);
    C.SetOrigin(0.0000000, 0.0000000);
    C.SetClip(float(C.SizeX), float(C.SizeY));
    //return;    
}

simulated function DrawInstructionKeyText(Canvas C)
{
    local float strX, strY;

    // End:0x0E
    if(InstructionKeyText == "")
    {
        return;
    }
    C.Font = LoadInstructionFont();
    C.SetOrigin(InstructTextBorderX, InstructTextBorderY);
    C.SetClip(float(C.SizeX) - InstructTextBorderX, float(C.SizeY));
    C.StrLen(InstructionKeyText, strX, strY);
    C.SetOrigin(InstructTextBorderX, (float(C.SizeY) - strY) - InstructTextBorderY);
    C.SetClip(float(C.SizeX) - InstructTextBorderX, float(C.SizeY));
    C.SetPos(0.0000000, 0.0000000);
    C.DrawText(InstructionKeyText);
    C.SetOrigin(0.0000000, 0.0000000);
    C.SetClip(float(C.SizeX), float(C.SizeY));
    //return;    
}

simulated function SetInstructionText(string Text)
{
    InstructionText = Text;
    //return;    
}

simulated function SetInstructionKeyText(string Text)
{
    InstructionKeyText = Text;
    //return;    
}

simulated function Font LoadInstructionFont()
{
    return none;
    // End:0x70
    if(InstructionFontFont == none)
    {
        InstructionFontFont = Font(DynamicLoadObject(InstructionFontName, Class'Engine.Font'));
        // End:0x70
        if(InstructionFontFont == none)
        {
            Log((("Warning: " $ string(self)) $ " Couldn't dynamically load font ") $ InstructionFontName);
        }
    }
    return InstructionFontFont;
    //return;    
}

simulated function DrawWeaponName(Canvas C)
{
    local string CurWeaponName;
    local float XL, YL, Fade;

    // End:0x0B
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
        // End:0x9A
        if(Fade <= float(1))
        {
            C.DrawColor.A = byte(float(255) * Fade);
        }
        C.StrLen(LastWeaponName, XL, YL);
        C.SetPos((C.ClipX / float(2)) - (XL / float(2)), (C.ClipY * 0.8000000) - YL);
    }
    // End:0x124
    if((PawnOwner == none) || PawnOwner.PendingWeapon == none)
    {
        return;
    }
    CurWeaponName = PawnOwner.PendingWeapon.GetHumanReadableName();
    // End:0x189
    if(CurWeaponName != LastWeaponName)
    {
        WeaponDrawTimer = Level.TimeSeconds + 1.5000000;
        WeaponDrawColor = PawnOwner.PendingWeapon.HudColor;
    }
    LastWeaponName = CurWeaponName;
    //return;    
}

function DrawVehicleName(Canvas C)
{
    //return;    
}

simulated function DrawCinematicHUD(Canvas C)
{
    super.DrawCinematicHUD(C);
    // End:0x24
    if(SubTitles != none)
    {
        DrawIntroSubtitles(C);        
    }
    else
    {
        // End:0x38
        if(bHideHUD)
        {
            DisplayLocalMessages(C);
        }
    }
    //return;    
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
    C.WrapStringToArray(CurrentSubTitles, OutArray, C.ClipX * 0.7500000);
    C.StrLen(OutArray[i], XL, YL);
    YO = FMin((C.ClipY * 0.9000000) - ((YL * 0.5000000) * float(OutArray.Length)), C.ClipY - ((float(OutArray.Length) + 1.1000000) * YL));
    i = 0;
    J0x118:

    // End:0x1AB [Loop If]
    if(i < OutArray.Length)
    {
        C.StrLen(OutArray[i], XL, YL);
        C.SetPos((C.ClipX - XL) * 0.5000000, YO + (YL * float(i)));
        C.DrawText(OutArray[i], false);
        i++;
        // [Loop Continue]
        goto J0x118;
    }
    //return;    
}

static function bool IsTargetInFrontOfPlayer(Canvas C, Actor Target, out Vector ScreenPos, Vector camLoc, Rotator camRot)
{
    return IsTargetInFrontOfPlayer2(C, Target.Location, ScreenPos, camLoc, camRot);
    //return;    
}

static function bool IsTargetInFrontOfPlayer2(Canvas C, Vector TargetPos, out Vector ScreenPos, Vector camLoc, Rotator camRot)
{
    // End:0x1F
    if(((TargetPos - camLoc) Dot Vector(camRot)) < float(0))
    {
        return false;
    }
    ScreenPos = C.WorldToScreen(TargetPos);
    // End:0x6C
    if((ScreenPos.X <= float(0)) || ScreenPos.X >= C.ClipX)
    {
        return false;
    }
    // End:0x9F
    if((ScreenPos.Y <= float(0)) || ScreenPos.Y >= C.ClipY)
    {
        return false;
    }
    return true;
    //return;    
}

static function ClipScreenCoords(Canvas C, out float X, out float Y, optional float XL, optional float YL)
{
    // End:0x1A
    if(X < XL)
    {
        X = XL;
    }
    // End:0x34
    if(Y < YL)
    {
        Y = YL;
    }
    // End:0x6E
    if(X > (C.ClipX - XL))
    {
        X = C.ClipX - XL;
    }
    // End:0xA8
    if(Y > (C.ClipY - YL))
    {
        Y = C.ClipY - YL;
    }
    //return;    
}

// Export UHudBase::execDrawTileFromSpriteWidget(FFrame&, void* const)
native function DrawTileFromSpriteWidget(Canvas C, SpriteWidget SW)
{
    //native.C;
    //native.SW;        
}

// Export UHudBase::execDrawTileFromSpriteWidget2(FFrame&, void* const)
native function DrawTileFromSpriteWidget2(Canvas C, SpriteWidget SW, float W, float H)
{
    //native.C;
    //native.SW;
    //native.W;
    //native.H;        
}

// Export UHudBase::execCalculateCoordinate(FFrame&, void* const)
native function CalculateCoordinate(Canvas C, SpriteWidget W, float fWidth, float fHeight, out CalCoordsW coordsW)
{
    //native.C;
    //native.W;
    //native.fWidth;
    //native.fHeight;
    //native.coordsW;        
}

// Export UHudBase::execCalculateCoordinateEx(FFrame&, void* const)
native function CalculateCoordinateEx(Canvas C, SpriteWidget W, float fWidth, float fHeight, out CalCoordsW coordsW)
{
    //native.C;
    //native.W;
    //native.fWidth;
    //native.fHeight;
    //native.coordsW;        
}

// Export UHudBase::execCalculateCoordinateDigit(FFrame&, void* const)
native function CalculateCoordinateDigit(Canvas C, DigitSet W, NumericWidget N, float fWidth, float fHeight, int Index, out CalCoordsW coordsW)
{
    //native.C;
    //native.W;
    //native.N;
    //native.fWidth;
    //native.fHeight;
    //native.Index;
    //native.coordsW;        
}

// Export UHudBase::execCalculateCoordinateDigitEx(FFrame&, void* const)
native function CalculateCoordinateDigitEx(Canvas C, DigitSet W, NumericWidget N, float fWidth, float fHeight, int Index, out CalCoordsW coordsW)
{
    //native.C;
    //native.W;
    //native.N;
    //native.fWidth;
    //native.fHeight;
    //native.Index;
    //native.coordsW;        
}

// Export UHudBase::execDrawWarfareCrosshairExtNative(FFrame&, void* const)
native function DrawWarfareCrosshairExtNative(Canvas C, int Spread)
{
    //native.C;
    //native.Spread;        
}

function string GetBaseTeamName(int TeamIndex)
{
    return BaseTeamName[TeamIndex];
    //return;    
}

function Color GetBaseTeamColor(int viewerTeamIndex, int targetTeamIndex)
{
    // End:0x18
    if(viewerTeamIndex == targetTeamIndex)
    {
        return BaseTeamColorAlly;        
    }
    else
    {
        return BaseTeamColor[targetTeamIndex];
    }
    //return;    
}

function PlayerReplicationInfo FindPRI(Pawn P)
{
    local PlayerReplicationInfo PRI;
    local string PlayerName;
    local int lp1;

    // End:0x0D
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
    else
    {
        lp1 = 0;
        J0x6E:

        // End:0xE8 [Loop If]
        if(lp1 < Level.GRI.PRIArray.Length)
        {
            // End:0xDE
            if(Level.GRI.PRIArray[lp1].PlayerName == PlayerName)
            {
                return Level.GRI.PRIArray[lp1];
            }
            lp1++;
            // [Loop Continue]
            goto J0x6E;
        }
        // End:0x118
        foreach DynamicActors(Class'Engine.PlayerReplicationInfo', PRI)
        {
            // End:0x117
            if(PRI.PlayerName == PlayerName)
            {                
                return PRI;
            }            
        }        
        return none;
    }
    //return;    
}

function DrawHudSpectating(Canvas C)
{
    //return;    
}

// Export UHudBase::execDrawNametagsNative(FFrame&, void* const)
native function DrawNametagsNative(Canvas C, bool bSpectateMode, optional bool drawAlways)
{
    //native.C;
    //native.bSpectateMode;
    //native.drawAlways;        
}

function DrawNametags(Canvas C, bool bSpectateMode, optional bool drawAlways)
{
    DrawNametagsScript(C, bSpectateMode, drawAlways);
    //return;    
}

function DrawNametagsScript(Canvas C, bool bSpectateMode, optional bool drawAlways)
{
    local wPawn curPawn, wPawnOwner;
    local Vector camLoc;
    local Rotator camRot;
    local float X1, Y1, X2, Y2, Width, Height;

    local bool curPawnSameTeam;
    local Vector centerScreenPos;
    local bool bDraw;
    local Vector curPawnCenterPos, HitLocation, HitNormal, TraceEnd;
    local float markWidth, markHeight;
    local bool bUpdateNametagVis;
    local int lp1, fl1;
    local wMatchUserInfo UserInfo;
    local int UID, UID2;

    centerScreenPos.X = C.ClipX / float(2);
    centerScreenPos.Y = C.ClipY / float(2);
    centerScreenPos.Z = 1.0000000;
    markWidth = 24.0000000 * _rX;
    markHeight = 24.0000000 * _rY;
    bUpdateNametagVis = (Level.TimeSeconds - NameTagVisUpdateTime) > 0.0500000;
    // End:0xB2
    if(bUpdateNametagVis)
    {
        NameTagVisUpdateTime = Level.TimeSeconds;
    }
    // End:0x519
    if(PawnOwnerPRI != none)
    {
        wPawnOwner = wPawn(PawnOwner);
        C.GetCameraLocation(camLoc, camRot);
        TraceEnd = camLoc + (float(100000) * Vector(camRot));
        lp1 = 0;
        J0x10A:

        // End:0x519 [Loop If]
        if(lp1 < Level.PawnList.Length)
        {
            curPawn = wPawn(Level.PawnList[lp1]);
            // End:0x150
            if(curPawn == none)
            {
                // [Explicit Continue]
                goto J0x50F;
            }
            // End:0x1A0
            if((curPawn.DrivenVehicle != none) && curPawn.PlayerReplicationInfo == none)
            {
                curPawn.PlayerReplicationInfo = curPawn.DrivenVehicle.PlayerReplicationInfo;
            }
            // End:0x50F
            if(curPawn.PlayerReplicationInfo != none)
            {
                // End:0x20D
                if((curPawn.PlayerReplicationInfo.Team == none) || Level.GRI.GameClass ~= "wGame.wDeathMatch")
                {
                    curPawnSameTeam = false;                    
                }
                else
                {
                    curPawnSameTeam = curPawn.PlayerReplicationInfo.Team.TeamIndex == PawnOwnerPRI.Team.TeamIndex;
                }
                curPawn.NametagPosition = CalcNametagPos(curPawn);
                curPawn.NametagVisInFront = IsTargetInFrontOfPlayer2(C, curPawn.NametagPosition, curPawn.NametagScreenPos, camLoc, camRot);
                // End:0x50F
                if(curPawn.NametagVisInFront)
                {
                    bDraw = drawAlways;
                    // End:0x2DB
                    if(curPawnSameTeam)
                    {
                        bDraw = true;                        
                    }
                    else
                    {
                        // End:0x3A3
                        if(!bSpectateMode)
                        {
                            // End:0x315
                            if(bUpdateNametagVis)
                            {
                                curPawn.NametagVisFastTrace = FastTrace(curPawn.NametagPosition, camLoc);
                            }
                            // End:0x3A3
                            if(curPawn.NametagVisFastTrace)
                            {
                                curPawnCenterPos = curPawn.Location;
                                curPawnCenterPos.Z += float(40);
                                // End:0x387
                                if(bUpdateNametagVis)
                                {
                                    curPawn.NametagVisTraceThisActor = curPawn.TraceThisActor(HitLocation, HitNormal, TraceEnd, camLoc);
                                }
                                // End:0x3A3
                                if(!curPawn.NametagVisTraceThisActor)
                                {
                                    bDraw = true;
                                }
                            }
                        }
                    }
                    // End:0x3BC
                    if(bDraw)
                    {
                        DrawNameTag(C, curPawn);
                    }
                    // End:0x50F
                    if((curPawn.PlayerReplicationInfo != none) && Level.TimeSeconds < curPawn.PlayerReplicationInfo.PopMessageEnd)
                    {
                        C.DrawColor = WhiteColor;
                        C.BtrTextSize(curPawn.PlayerReplicationInfo.PopMessage, int(float(10) * _rY), Width, Height);
                        X1 = curPawn.NametagScreenPos.X - (Width / float(2));
                        Y1 = ((curPawn.NametagScreenPos.Y - float(NametagFontSize)) - Height) - float(20);
                        X2 = X1 + Width;
                        Y2 = Y1 + Height;
                        C.BtrDrawTextJustified(curPawn.PlayerReplicationInfo.PopMessage, 0, X1, Y1, X2, Y2, int(float(10) * _rY));
                    }
                }
            }
            J0x50F:

            lp1++;
            // [Loop Continue]
            goto J0x10A;
        }
    }
    //return;    
}

function DrawMissionIcon(Canvas C, wPawn curPawn)
{
    //return;    
}

function DrawNameTag(Canvas C, wPawn curPawn)
{
    local float X1, Y1, X2, Y2, Width, Height;

    local string nametag;
    local Color nametagColor;
    local float markWidth, markHeight;
    local Material Mark;

    markWidth = 24.0000000 * _rX;
    markHeight = 24.0000000 * _rY;
    nametag = curPawn.PlayerReplicationInfo.PlayerName;
    // End:0x6A
    if(curPawn.PlayerReplicationInfo.IsInvulnerable)
    {
        nametag $= NameTagInvulnerablePost;
    }
    DrawMissionIcon(C, curPawn);
    C.BtrTextSize(nametag, NametagFontSize + 1, Width, Height);
    // End:0xD5
    if(curPawn.PlayerReplicationInfo.ClassMark == none)
    {
        curPawn.PlayerReplicationInfo.LoadLevelMark();
    }
    Mark = curPawn.PlayerReplicationInfo.ClassMark;
    Width += markWidth;
    X1 = curPawn.NametagScreenPos.X - (Width / float(2));
    Y1 = (curPawn.NametagScreenPos.Y - Height) - ((markHeight - Height) / float(2));
    C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
    C.SetPos(X1, Y1);
    X1 = (curPawn.NametagScreenPos.X - (Width / float(2))) + markWidth;
    Y1 = curPawn.NametagScreenPos.Y - Height;
    X2 = X1 + Width;
    Y2 = Y1 + Height;
    nametagColor = GetNametagColor(curPawn.PlayerReplicationInfo);
    C.DrawColor = NametagShadowColor;
    C.BtrDrawTextJustified(nametag, 0, X1 + float(NametagShadowX), Y1 + float(NametagShadowY), X2 + float(NametagShadowX), Y2 + float(NametagShadowY), NametagFontSize);
    C.DrawColor = nametagColor;
    C.BtrDrawTextJustified(nametag, 0, X1, Y1, X2, Y2, NametagFontSize);
    //return;    
}

function Color GetNametagColor(PlayerReplicationInfo Info)
{
    local Color C;

    // End:0x55
    if(Level.GRI.GameClass ~= "wGame.wDeathMatch")
    {
        C = BaseTeamColor[Info.Team.TeamIndex];        
    }
    else
    {
        // End:0xC2
        if(PlayerOwner.PlayerReplicationInfo.Team.TeamIndex == Info.Team.TeamIndex)
        {
            // End:0xB4
            if(1 == Info.GetCheckFriendOrClanMember())
            {
                C = FriendlyColor;                
            }
            else
            {
                C = BaseTeamColorAlly;
            }            
        }
        else
        {
            C = BaseTeamColor[Info.Team.TeamIndex];
        }
    }
    C.A = 196;
    return C;
    //return;    
}

// Export UHudBase::execCalcNametagPosNative(FFrame&, void* const)
native function Vector CalcNametagPosNative(Pawn curPawn)
{
    //native.curPawn;        
}

function Vector CalcNametagPos(Pawn curPawn)
{
    local Vector NametagPosition;

    NametagPosition = curPawn.Location;
    // End:0x39
    if(curPawn.bIsCrouched)
    {
        NametagPosition.Z += float(40);        
    }
    else
    {
        // End:0x5E
        if(curPawn.bIsProned)
        {
            NametagPosition.Z += float(25);            
        }
        else
        {
            NametagPosition.Z += float(70);
        }
    }
    NametagPosition.Z += NametagExtraZ;
    return NametagPosition;
    //return;    
}

static function PlayHUDSound(PlayerController PC, HudBase.eHUDSOUND soundType)
{
    local string strSound;

    switch(soundType)
    {
        // End:0x3B
        case 0:
            strSound = "Warfare_Sound_UI.com.ui_qslot_change";
            // End:0x17E
            break;
        // End:0x72
        case 1:
            strSound = "Warfare_Sound_UI.etc.ui_etc_qslotchange";
            // End:0x17E
            break;
        // End:0xA5
        case 2:
            strSound = "Warfare_Sound_UI.etc.ui_etc_minimap";
            // End:0x17E
            break;
        // End:0xDB
        case 3:
            strSound = "Warfare_Sound_UI.etc.ui_etc_queststate";
            // End:0x17E
            break;
        // End:0x110
        case 4:
            strSound = "Warfare_Sound_UI.etc.ui_etc_questcomp";
            // End:0x17E
            break;
        // End:0x145
        case 5:
            strSound = "Warfare_Sound_UI.etc.ui_etc_friendson";
            // End:0x17E
            break;
        // End:0x178
        case 6:
            strSound = "Warfare_Sound_UI.etc.ui_etc_whisper";
            // End:0x17E
            break;
        // End:0xFFFF
        default:
            // End:0x17E
            break;
            break;
    }
    // End:0x1B9
    if(PC == none)
    {
        Log("[PLAYHUDSOUND] PC=NONE , Type=" $ string(int(soundType)));        
    }
    else
    {
        PC.ClientPlaySound(Sound(DynamicLoadObject(strSound, Class'Engine.Sound')));
    }
    //return;    
}

defaultproperties
{
    strSpectating=" ? ???"
    strSpectateHelp="??? ??, ??? ??? ??? ?? ????? ?? ? ????."
    fbSpectateLevel=(X1=597.0000000,Y1=1148.0000000,X2=642.0000000,Y2=1193.0000000)
    fbSpectateUser=(X1=647.0000000,Y1=1159.0000000,X2=1600.0000000,Y2=1183.0000000)
    fbSpectateHelp=(X1=0.0000000,Y1=1110.0000000,X2=1600.0000000,Y2=1135.0000000)
    fbSpectatingBack=(X1=0.0000000,Y1=1099.0000000,X2=1600.0000000,Y2=1200.0000000)
    NametagFactorZ=1.2000000
    NametagExtraZ=24.0000000
    NametagFontSize=10
    NametagRadius=48.0000000
    NametagShadowX=1
    NametagShadowY=1
    NametagShadowColor=(R=0,G=0,B=0,A=160)
    NameTagInvulnerablePost="(??)"
    NameTagVisUpdateTime=-999.0000000
    IconDefendBombHolder=(WidgetTexture=Texture'Warfare_UI_HUD_ETC.DisplayIcon.keep_c4',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=63,Y2=126),TextureScale=0.3700000,DrawPivot=5,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    InstructTextBorderX=10.0000000
    InstructTextBorderY=10.0000000
    InstructionFontName="EntryTex.Entry"
    CroppingAmount=0.2500000
    LevelActionLoading="???? ?... "
    LevelActionPaused="?? ?????"
    LevelActionFontName="EntryTex.Entry"
    WonMatchPostFix=" ???? ?????!"
    WaitingToSpawn="  "
    AtMenus="  "
    YouveWonTheMatch="???? ?????!"
    YouveLostTheMatch="???? ????."
    NowViewing="?? ?"
    ScoreText="??"
    InitialViewingString="?? ????? ??? ????? ????"
    DefaultCrosshair=Texture'Warfare_UI_HUD_ETC.Crosshairs.cross_hair_throw'
    WAttackedBG=(WidgetTexture=Texture'Warfare_HUD.HUD.hud_damage',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=2,Y2=2),TextureScale=0.6500000,DrawPivot=8,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=0,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    bUseCustomWeaponCrosshairs=true
    ScreenRatioX=0.0009766
    ScreenRatioY=0.0013021
    ScreenRatioXEx=0.0006250
    ScreenRatioYEx=0.0008333
    BaseTeamName[0]="AF"
    BaseTeamName[1]="RSA"
    BaseTeamName[2]="LAG"
    BaseTeamColorAlly=(R=255,G=255,B=255,A=255)
    BaseTeamColor[0]=(StyleName=/* ERROR: System.Exception */)
    BaseTeamColor[1]=(StyleName[1]=// Unable to decompile FixedArray data.)
    BaseTeamColor[2]=none
    FriendlyColor=(R=124,G=241,B=126,A=255)
    MyselfColor=(R=255,G=153,B=0,A=255)
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