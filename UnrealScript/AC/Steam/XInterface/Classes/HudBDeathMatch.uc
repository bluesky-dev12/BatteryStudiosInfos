/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\HudBDeathMatch.uc
 * Package Imports:
 *	XInterface
 *	Engine
 *	Core
 *
 * Stats:
 *	Constants:1
 *	Properties:78
 *	Functions:41
 *
 *******************************************************************************/
class HudBDeathMatch extends HudBase
    transient;

const WEAPON_BAR_SIZE = 9;

var() DigitSet DigitsBig;
var() SpriteWidget LHud1[4];
var() SpriteWidget LHud2[4];
var() SpriteWidget RHud1[4];
var() SpriteWidget RHud2[4];
var() SpriteWidget WeaponBarAmmoFill[9];
var() SpriteWidget WeaponBarTint[9];
var() SpriteWidget WeaponBarTrim[9];
var() SpriteWidget WeaponBarIcon[9];
var() class<wWeapon> BaseWeapons[9];
var() SpriteWidget AmmoIcon;
var() SpriteWidget ScoreBg[4];
var() SpriteWidget Adrenaline[5];
var() SpriteWidget HealthIcon;
var() NumericWidget AdrenalineCount;
var() NumericWidget combocount;
var() NumericWidget HealthCount;
var() NumericWidget ammoCount;
var() NumericWidget ShieldCount;
var() NumericWidget mySpread;
var() NumericWidget myRank;
var() NumericWidget MyScore;
var() SpriteWidget ShieldIconGlow;
var() SpriteWidget ShieldIcon;
var() SpriteWidget AdrenalineIcon;
var() SpriteWidget ReloadingTeamTint;
var() SpriteWidget ReloadingTrim;
var() SpriteWidget ReloadingFill;
var() SpriteWidget UDamageTeamTint;
var() SpriteWidget UDamageTrim;
var() SpriteWidget UDamageFill;
var() Font LevelActionFontFont;
var() Color LevelActionFontColor;
var() float LevelActionPositionX;
var() float LevelActionPositionY;
var() float CurrentWeaponPositionX;
var() float CurrentWeaponPositionY;
var() Texture LogoTexture;
var() float LogoScaleX;
var() float LogoScaleY;
var() float LogoPosX;
var() float LogoPosY;
var() float testLerp;
var() float comboTime;
var() float accumData[4];
var() float growScale[4];
var() float growTrace[4];
var() int Pulse[5];
var() bool ArmorGlow;
var() bool Displaying;
var() bool growing;
var() bool LowHealthPulse;
var() bool TeamLinked;
var() bool AdrenalineReady;
var bool bRealSmallWeaponBar;
var float OldHUDScale;
var() float TransRechargeAmount;
var transient float CurHealth;
var transient float LastHealth;
var transient float CurShield;
var transient float LastShield;
var transient float CurEnergy;
var transient float CurAmmoPrimary;
var transient float pulseHealthIcon;
var transient float pulseArmorIcon;
var transient float MaxShield;
var transient float MaxEnergy;
var transient float MaxAmmoPrimary;
var transient int CurScore;
var transient int CurRank;
var transient int ScoreDiff;
var int OldRemainingTime;
var PlayerReplicationInfo NamedPlayer;
var float NameTime;
var Material Portrait;
var float PortraitTime;
var float PortraitX;
var array<SceneManager> MySceneManagers;

simulated function UpdatePrecacheMaterials();
function PostBeginPlay()
{
    local SceneManager SM;

    super.PostBeginPlay();
    // End:0x3c
    foreach AllActors(class'SceneManager', SM)
    {
        MySceneManagers.Length = MySceneManagers.Length + 1;
        MySceneManagers[MySceneManagers.Length - 1] = SM;                
    }
    // End:0x4c
    if(CustomCrosshairsAllowed())
    {
        SetCustomCrosshairs();
    }
}

function bool CustomCrosshairsAllowed()
{
    return true;
}

function bool CustomCrosshairColorAllowed()
{
    return true;
}

function bool CustomHUDColorAllowed()
{
    return true;
}

function SetCustomCrosshairs()
{
    local int i;
    local array<CrosshairRecord> CustomCrosshairs;

    class'CacheManager'.static.GetCrosshairList(CustomCrosshairs);
    Crosshairs.Length = CustomCrosshairs.Length;
    i = 0;
    J0x25:
    // End:0x173 [While If]
    if(i < CustomCrosshairs.Length)
    {
        Crosshairs[i].WidgetTexture = CustomCrosshairs[i].CrosshairTexture;
        Crosshairs[i].TextureCoords.X1 = 0;
        Crosshairs[i].TextureCoords.X2 = 64;
        Crosshairs[i].TextureCoords.Y1 = 0;
        Crosshairs[i].TextureCoords.Y2 = 64;
        Crosshairs[i].TextureScale = 0.750;
        Crosshairs[i].DrawPivot = 8;
        Crosshairs[i].PosX = 0.50;
        Crosshairs[i].PosY = 0.50;
        Crosshairs[i].OffsetX = 0;
        Crosshairs[i].OffsetY = 0;
        Crosshairs[i].ScaleMode = 0;
        Crosshairs[i].Scale = 1.0;
        Crosshairs[i].RenderStyle = 5;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x25;
    }
    // End:0x182
    if(CustomCrosshairColorAllowed())
    {
        SetCustomCrosshairColors();
    }
}

function SetCustomCrosshairColors()
{
    local int i, j;

    i = 0;
    J0x07:
    // End:0x5a [While If]
    if(i < Crosshairs.Length)
    {
        j = 0;
        J0x1e:
        // End:0x50 [While If]
        if(j < 2)
        {
            Crosshairs[i].Tints[j] = CrossHairColor;
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0x1e;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function SetCustomHUDColor()
{
    local int i, j;

    // End:0x50
    if(CustomHUDColor.R == 0 && CustomHUDColor.G == 0 && CustomHUDColor.B == 0 && CustomHUDColor.A == 0)
    {
        return;
    }
    bUsingCustomHUDColor = true;
    j = 0;
    J0x5f:
    // End:0x19f [While If]
    if(j < 2)
    {
        ReloadingTeamTint.Tints[j] = CustomHUDColor;
        UDamageTeamTint.Tints[j] = CustomHUDColor;
        i = 1;
        J0x9e:
        // End:0x15c [While If]
        if(i < 3)
        {
            LHud1[i].Tints[j] = CustomHUDColor;
            LHud2[i].Tints[j] = CustomHUDColor;
            RHud1[i].Tints[j] = CustomHUDColor;
            RHud2[i].Tints[j] = CustomHUDColor;
            Adrenaline[i].Tints[j] = CustomHUDColor;
            ScoreBg[i].Tints[j] = CustomHUDColor;
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x9e;
        }
        i = 0;
        J0x163:
        // End:0x195 [While If]
        if(i < 9)
        {
            WeaponBarTint[i].Tints[j] = CustomHUDColor;
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x163;
        }
        ++ j;
        // This is an implied JumpToken; Continue!
        goto J0x5f;
    }
}

function CheckCountdown(GameReplicationInfo GRI);
simulated function Tick(float DeltaTime)
{
    local Material NewPortrait;

    super.Tick(DeltaTime);
    // End:0x10f
    if(Level.TimeSeconds - LastPlayerIDTalkingTime < 0.10 && PlayerOwner.GameReplicationInfo != none)
    {
        // End:0xf1
        if(PortraitPRI == none || PortraitPRI.PlayerID != LastPlayerIDTalking)
        {
            PortraitPRI = PlayerOwner.GameReplicationInfo.FindPlayerByID(LastPlayerIDTalking);
            // End:0xee
            if(PortraitPRI != none)
            {
                NewPortrait = PortraitPRI.GetPortrait();
                // End:0xee
                if(NewPortrait != none)
                {
                    // End:0xc9
                    if(Portrait == none)
                    {
                        PortraitX = 1.0;
                    }
                    Portrait = NewPortrait;
                    PortraitTime = Level.TimeSeconds + float(3);
                }
            }
        }
        // End:0x10c
        else
        {
            PortraitTime = Level.TimeSeconds + 0.20;
        }
    }
    // End:0x116
    else
    {
        LastPlayerIDTalking = 0;
    }
    // End:0x155
    if(PortraitTime - Level.TimeSeconds > float(0))
    {
        PortraitX = FMax(0.0, PortraitX - float(3) * DeltaTime);
    }
    // End:0x19a
    else
    {
        // End:0x19a
        if(Portrait != none)
        {
            PortraitX = FMin(1.0, PortraitX + float(3) * DeltaTime);
            // End:0x19a
            if(PortraitX == float(1))
            {
                Portrait = none;
                PortraitPRI = none;
            }
        }
    }
    pulseNumber(0, HealthCount, 0.260, 0.050, DeltaTime, 0.250, 0.0, 255.0, CurHealth, LastHealth);
    pulseNumber(1, ShieldCount, 0.260, 0.050, DeltaTime, 0.250, 0.0, 255.0, CurShield, LastShield);
    ArmorPulse(DeltaTime, 255.0, 0.0, ShieldIconGlow, TeamIndex, 250.0);
    // End:0x25e
    if(CurHealth < float(50))
    {
        LowHealth(DeltaTime, 255.0, 0.0, LHud2[3], TeamIndex, 1000.0);
    }
    // End:0x279
    else
    {
        LHud2[3].Tints[TeamIndex].A = 50;
    }
    // End:0x2b0
    if(CurHealth < float(25))
    {
        pulseWidget(DeltaTime, 255.0, 0.0, HealthIcon, TeamIndex, 2, 2000.0);
    }
    // End:0x2ca
    else
    {
        HealthIcon.Tints[TeamIndex].A = byte(255);
    }
    // End:0x2ff
    if(AdrenalineReady)
    {
        pulseWidget(DeltaTime, 255.0, 0.0, Adrenaline[4], TeamIndex, 2, 1000.0);
    }
    // End:0x31a
    else
    {
        Adrenaline[4].Tints[TeamIndex].A = 0;
    }
}

simulated function pulseWidget(float DeltaTime, float Max, float Min, out SpriteWidget Sprite, int tIndex, int pIndex, float pRate)
{
    local float accum;

    accum = DeltaTime * pRate;
    // End:0x48
    if(float(Sprite.Tints[tIndex].A) < Min)
    {
        accumData[pIndex] += accum;
    }
    // End:0x5a
    else
    {
        accumData[pIndex] -= accum;
    }
    // End:0x80
    if(accumData[pIndex] < Min)
    {
        accumData[pIndex] = Max;
    }
    Sprite.Tints[tIndex].A = byte(accumData[pIndex]);
}

simulated function pulseNumber(int gIndex, out NumericWidget Number, float nScale, float growSpeed, float DeltaTime, float oScale, float Test1, float Test2, float first, float Last)
{
    local float growAccum;

    growAccum = DeltaTime * growSpeed;
    testLerp = Test1 + DeltaTime * float(2) * Test2 - Test1;
    // End:0x150
    if(growing)
    {
        growScale[gIndex] -= growAccum;
        growTrace[gIndex] += testLerp;
        // End:0x8a
        if(growTrace[gIndex] > float(255))
        {
            growTrace[gIndex] = 255.0;
        }
        // End:0xbb
        if(first < Last)
        {
            growTrace[gIndex] = 0.0;
            growScale[gIndex] = nScale;
        }
        // End:0xe1
        if(growScale[gIndex] < oScale)
        {
            growScale[gIndex] = oScale;
        }
        // End:0x114
        if(growScale[gIndex] < oScale && growTrace[gIndex] == float(255))
        {
            growing = false;
        }
        Number.Tints[TeamIndex].B = byte(growTrace[gIndex]);
        Number.TextureScale = growScale[gIndex];
    }
    // End:0x19d
    else
    {
        // End:0x18c
        if(first < Last)
        {
            growTrace[gIndex] = 0.0;
            growScale[gIndex] = nScale;
            growing = true;
        }
        // End:0x19d
        else
        {
            growScale[gIndex] = oScale;
        }
    }
}

simulated function ArmorPulse(float DeltaTime, float Max, float Min, out SpriteWidget Sprite, int tIndex, float pRate)
{
    local int accum;

    accum = int(DeltaTime * pRate);
    // End:0x2e
    if(ArmorGlow)
    {
        pulseArmorIcon += float(accum);
    }
    // End:0x3c
    else
    {
        pulseArmorIcon -= float(accum);
    }
    // End:0x61
    if(pulseArmorIcon <= Min)
    {
        pulseArmorIcon = Min;
        ArmorGlow = true;
    }
    // End:0x83
    else
    {
        // End:0x83
        if(pulseArmorIcon >= Max)
        {
            pulseArmorIcon = Max;
            ArmorGlow = false;
        }
    }
    Sprite.Tints[tIndex].A = byte(pulseArmorIcon);
    Sprite.Tints[tIndex].B = byte(pulseArmorIcon);
}

simulated function LowHealth(float DeltaTime, float Max, float Min, out SpriteWidget Sprite, int tIndex, float pRate)
{
    local int accum;

    accum = int(DeltaTime * pRate);
    // End:0x2e
    if(LowHealthPulse)
    {
        pulseHealthIcon += float(accum);
    }
    // End:0x3c
    else
    {
        pulseHealthIcon -= float(accum);
    }
    // End:0x61
    if(pulseHealthIcon <= Min)
    {
        pulseHealthIcon = Min;
        LowHealthPulse = true;
    }
    // End:0x83
    else
    {
        // End:0x83
        if(pulseHealthIcon >= Max)
        {
            pulseHealthIcon = Max;
            LowHealthPulse = false;
        }
    }
    Sprite.Tints[tIndex].A = byte(pulseHealthIcon);
}

simulated function UpdateRankAndSpread(Canvas C)
{
    local int i;

    // End:0x23
    if(ScoreBoard == none || !ScoreBoard.UpdateGRI())
    {
        return;
    }
    i = 0;
    J0x2a:
    // End:0x93 [While If]
    if(i < PlayerOwner.GameReplicationInfo.PRIArray.Length)
    {
        // End:0x89
        if(PawnOwnerPRI == PlayerOwner.GameReplicationInfo.PRIArray[i])
        {
            myRank.Value = i + 1;
        }
        // End:0x93
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x2a;
        }
    }
    MyScore.Value = Min(int(PawnOwnerPRI.Score), 999);
    // End:0x14e
    if(PawnOwnerPRI == PlayerOwner.GameReplicationInfo.PRIArray[0])
    {
        // End:0x13f
        if(PlayerOwner.GameReplicationInfo.PRIArray.Length > 1)
        {
            mySpread.Value = Min(int(PawnOwnerPRI.Score - PlayerOwner.GameReplicationInfo.PRIArray[1].Score), 999);
        }
        // End:0x14b
        else
        {
            mySpread.Value = 0;
        }
    }
    // End:0x194
    else
    {
        mySpread.Value = Min(int(PawnOwnerPRI.Score - PlayerOwner.GameReplicationInfo.PRIArray[0].Score), 999);
    }
    // End:0x1f6
    if(bShowPoints)
    {
        DrawNumericWidget(C, MyScore, DigitsBig);
        // End:0x1e1
        if(C.ClipX >= float(640))
        {
            DrawNumericWidget(C, mySpread, DigitsBig);
        }
        DrawNumericWidget(C, myRank, DigitsBig);
    }
    // End:0x234
    if(myRank.Value > 9)
    {
        myRank.TextureScale = 0.120;
        myRank.OffsetX = 240;
        myRank.OffsetY = 90;
    }
    // End:0x25e
    else
    {
        myRank.TextureScale = 0.180;
        myRank.OffsetX = 150;
        myRank.OffsetY = 40;
    }
}

simulated function CalculateHealth()
{
    LastHealth = CurHealth;
    CurHealth = float(PawnOwner.Health);
}

simulated function CalculateShield()
{
    LastShield = CurShield;
    // End:0x62
    if(PawnOwner.IsA('wPawn'))
    {
        MaxShield = wPawn(PawnOwner).ShieldStrengthMax;
        CurShield = float(Clamp(int(wPawn(PawnOwner).ShieldStrength), 0, int(MaxShield)));
    }
    // End:0x78
    else
    {
        MaxShield = 100.0;
        CurShield = 0.0;
    }
}

simulated function CalculateEnergy()
{
    // End:0x4d
    if(PawnOwner.Controller == none)
    {
        MaxEnergy = PlayerOwner.AdrenalineMax;
        CurEnergy = float(Clamp(int(PlayerOwner.Adrenaline), 0, int(MaxEnergy)));
    }
    // End:0x95
    else
    {
        MaxEnergy = PawnOwner.Controller.AdrenalineMax;
        CurEnergy = float(Clamp(int(PawnOwner.Controller.Adrenaline), 0, int(MaxEnergy)));
    }
    AdrenalineCount.Value = int(CurEnergy);
}

simulated function CalculateAmmo()
{
    MaxAmmoPrimary = 1.0;
    CurAmmoPrimary = 1.0;
    // End:0x59
    if(PawnOwner != none && PawnOwner.Weapon != none)
    {
        PawnOwner.Weapon.GetAmmoCount(MaxAmmoPrimary, CurAmmoPrimary);
    }
}

simulated function CalculateScore()
{
    ScoreDiff = CurScore;
    CurScore = int(PawnOwnerPRI.Score);
}

simulated function string GetScoreText()
{
    return ScoreText;
}

simulated function string GetScoreValue(PlayerReplicationInfo PRI)
{
    return "" $ string(int(PRI.Score));
}

simulated function string GetScoreTagLine()
{
    return InitialViewingString;
}

simulated function DrawSpectatingHud(Canvas C)
{
    local string InfoString;
    local Plane OldModulate;
    local float XL, YL, Full, Height, Top, TextTop,
	    MedH, SmallH, Scale;

    local GameReplicationInfo GRI;
    local int i;

    DisplayLocalMessages(C);
    // End:0x52
    if(MySceneManagers.Length > 0)
    {
        i = 0;
        J0x1e:
        // End:0x52 [While If]
        if(i < MySceneManagers.Length)
        {
            // End:0x48
            if(MySceneManagers[i].bIsRunning)
            {
                return;
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x1e;
        }
    }
    OldModulate = C.ColorModulate;
    C.Font = GetMediumFontFor(C);
    C.StrLen("W", XL, MedH);
    Height = MedH;
    C.Font = GetConsoleFont(C);
    C.StrLen("W", XL, SmallH);
    Height += SmallH;
    Full = Height;
    Top = C.ClipY - float(8) - Full;
    Scale = Full + float(16) / float(128);
    TextTop = Top + float(4);
    GRI = PlayerOwner.GameReplicationInfo;
    // End:0x2c1
    if(UnrealPlayer(Owner).bDisplayWinner || UnrealPlayer(Owner).bDisplayLoser)
    {
        // End:0x1a0
        if(UnrealPlayer(Owner).bDisplayWinner)
        {
            InfoString = YouveWonTheMatch;
        }
        // End:0x209
        else
        {
            // End:0x1fe
            if(PlayerReplicationInfo(PlayerOwner.GameReplicationInfo.Winner) != none)
            {
                InfoString = WonMatchPrefix $ PlayerReplicationInfo(PlayerOwner.GameReplicationInfo.Winner).PlayerName $ WonMatchPostFix;
            }
            // End:0x209
            else
            {
                InfoString = YouveLostTheMatch;
            }
        }
        C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
        C.Font = GetMediumFontFor(C);
        C.StrLen(InfoString, XL, YL);
        C.SetPos(C.ClipX / float(2) - XL / float(2), Top + Full / float(2) - YL / float(2));
        C.DrawText(InfoString, false);
    }
    // End:0x30c
    else
    {
        // End:0x30c
        if(Pawn(PlayerOwner.ViewTarget) != none && Pawn(PlayerOwner.ViewTarget).PlayerReplicationInfo != none)
        {
            DrawHudSpectating(C);
        }
        // End:0x30c
        else
        {
        }
    }
    C.ColorModulate = OldModulate;
}

simulated function string GetInfoString()
{
    local string InfoString;

    // End:0x9e
    if(PlayerOwner.IsDead())
    {
        // End:0x44
        if(PlayerOwner.PlayerReplicationInfo.bOutOfLives)
        {
            InfoString = class'ScoreBoardDeathMatch'.default.OutFireText;
        }
        // End:0x9b
        else
        {
            // End:0x87
            if(Level.TimeSeconds - UnrealPlayer(PlayerOwner).LastKickWarningTime < float(2))
            {
                InfoString = class'GameMessage'.default.KickWarning;
            }
            // End:0x9b
            else
            {
                InfoString = class'ScoreBoardDeathMatch'.default.Restart;
            }
        }
    }
    // End:0x164
    else
    {
        // End:0xe1
        if(Level.TimeSeconds - UnrealPlayer(PlayerOwner).LastKickWarningTime < float(2))
        {
            InfoString = class'GameMessage'.default.KickWarning;
        }
        // End:0x164
        else
        {
            // End:0x11a
            if(GUIController(PlayerOwner.Player.GUIController).ActivePage != none)
            {
                InfoString = AtMenus;
            }
            // End:0x164
            else
            {
                // End:0x159
                if(PlayerOwner.PlayerReplicationInfo != none && PlayerOwner.PlayerReplicationInfo.bWaitingPlayer)
                {
                    InfoString = WaitingToSpawn;
                }
                // End:0x164
                else
                {
                    InfoString = InitialViewingString;
                }
            }
        }
    }
    return InfoString;
}

simulated function DrawCrosshair(Canvas C)
{
    local float NormalScale;
    local int i, CurrentCrosshair;
    local float OldScale, OldW, CurrentCrosshairScale;
    local Color CurrentCrosshairColor;
    local SpriteWidget CHtexture;

    // End:0x0d
    if(!bCrosshairShow)
    {
        return;
    }
    // End:0x1db
    if(bUseCustomWeaponCrosshairs && PawnOwner != none && PawnOwner.Weapon != none)
    {
        CurrentCrosshair = PawnOwner.Weapon.CustomCrosshair;
        // End:0x84
        if(CurrentCrosshair == -1 || CurrentCrosshair == Crosshairs.Length)
        {
            DrawEnemyName(C);
            return;
        }
        CurrentCrosshairColor = PawnOwner.Weapon.CustomCrossHairColor;
        CurrentCrosshairScale = PawnOwner.Weapon.CustomCrossHairScale;
        // End:0x1d8
        if(PawnOwner.Weapon.CustomCrossHairTextureName != "")
        {
            // End:0x1a9
            if(PawnOwner.Weapon.CustomCrossHairTexture == none)
            {
                PawnOwner.Weapon.CustomCrossHairTexture = Texture(DynamicLoadObject(PawnOwner.Weapon.CustomCrossHairTextureName, class'Texture'));
                // End:0x1a9
                if(PawnOwner.Weapon.CustomCrossHairTexture == none)
                {
                    Log(string(PawnOwner.Weapon) $ " custom crosshair texture not found!");
                    PawnOwner.Weapon.CustomCrossHairTextureName = "";
                }
            }
            CHtexture = Crosshairs[0];
            CHtexture.WidgetTexture = PawnOwner.Weapon.CustomCrossHairTexture;
        }
    }
    // End:0x1fc
    else
    {
        CurrentCrosshair = CrosshairStyle;
        CurrentCrosshairColor = CrossHairColor;
        CurrentCrosshairScale = CrosshairScale;
    }
    CurrentCrosshair = Clamp(CurrentCrosshair, 0, Crosshairs.Length - 1);
    NormalScale = Crosshairs[CurrentCrosshair].TextureScale;
    // End:0x24a
    if(CHtexture.WidgetTexture == none)
    {
        CHtexture = Crosshairs[CurrentCrosshair];
    }
    CHtexture.TextureScale *= CurrentCrosshairScale;
    i = 0;
    J0x262:
    // End:0x28e [While If]
    if(i < 2)
    {
        CHtexture.Tints[i] = CurrentCrosshairColor;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x262;
    }
    // End:0x32e
    if(LastPickupTime > Level.TimeSeconds - 0.40)
    {
        // End:0x2fb
        if(LastPickupTime > Level.TimeSeconds - 0.20)
        {
            CHtexture.TextureScale *= float(1) + float(5) * Level.TimeSeconds - LastPickupTime;
        }
        // End:0x32e
        else
        {
            CHtexture.TextureScale *= float(1) + float(5) * LastPickupTime + 0.40 - Level.TimeSeconds;
        }
    }
    OldScale = HudScale;
    HudScale = 1.0;
    OldW = C.ColorModulate.W;
    C.ColorModulate.W = 1.0;
    DrawSpriteWidget(C, CHtexture);
    C.ColorModulate.W = OldW;
    HudScale = OldScale;
    CHtexture.TextureScale = NormalScale;
    DrawEnemyName(C);
}

function DrawEnemyName(Canvas C)
{
    local Actor HitActor;
    local Vector HitLocation, HitNormal, ViewPos;

    // End:0x35
    if(PlayerOwner.bBehindView || bNoEnemyNames || PawnOwner.Controller == none)
    {
        return;
    }
    ViewPos = PawnOwner.Location + PawnOwner.BaseEyeHeight * vect(0.0, 0.0, 1.0);
    HitActor = Trace(HitLocation, HitNormal, ViewPos + float(1200) * vector(PawnOwner.Controller.Rotation), ViewPos, true);
    // End:0x1c8
    if(Pawn(HitActor) != none && Pawn(HitActor).PlayerReplicationInfo != none && HitActor != PawnOwner && PawnOwner.PlayerReplicationInfo.Team == none || PawnOwner.PlayerReplicationInfo.Team != Pawn(HitActor).PlayerReplicationInfo.Team)
    {
        // End:0x1af
        if(NamedPlayer != Pawn(HitActor).PlayerReplicationInfo || Level.TimeSeconds - NameTime > 0.50)
        {
            DisplayEnemyName(C, Pawn(HitActor).PlayerReplicationInfo);
            NameTime = Level.TimeSeconds;
        }
        NamedPlayer = Pawn(HitActor).PlayerReplicationInfo;
    }
}

function DisplayEnemyName(Canvas C, PlayerReplicationInfo PRI)
{
    PlayerOwner.ReceiveLocalizedMessage(class'PlayerNameMessage', 0, PRI);
}

function SetSmallWeaponBar()
{
    local int i;

    bRealSmallWeaponBar = bSmallWeaponBar;
    // End:0x3cd
    if(bSmallWeaponBar)
    {
        LHud1[0].TextureCoords.Y2 = 893;
        LHud1[1].TextureCoords.Y2 = 893;
        LHud1[0].PosY = 0.890;
        LHud1[1].PosY = 0.890;
        LHud1[0].TextureScale = 0.250;
        LHud1[1].TextureScale = 0.250;
        LHud2[1].PosY = 0.880;
        LHud2[0].PosY = 0.880;
        LHud1[3].PosY = 0.880;
        LHud2[3].PosY = 0.880;
        HealthIcon.PosY = 0.880;
        HealthCount.PosY = 0.880;
        LHud2[1].PosX = -0.030;
        LHud2[0].PosX = -0.030;
        LHud1[3].PosX = -0.030;
        LHud2[3].PosX = -0.030;
        HealthIcon.PosX = -0.030;
        HealthCount.PosX = -0.030;
        UDamageTrim.TextureScale = 0.270;
        UDamageTeamTint.TextureScale = 0.270;
        UDamageFill.TextureScale = 0.270;
        UDamageTrim.PosX = -0.0050;
        UDamageTeamTint.PosX = -0.0050;
        UDamageFill.PosX = -0.0050;
        UDamageTrim.PosY = 0.880;
        UDamageTeamTint.PosY = 0.880;
        UDamageFill.PosY = 0.880;
        RHud1[0].TextureCoords.Y2 = 893;
        RHud1[1].TextureCoords.Y2 = 893;
        RHud1[0].PosY = 0.890;
        RHud1[1].PosY = 0.890;
        RHud1[0].TextureScale = 0.250;
        RHud1[1].TextureScale = 0.250;
        RHud2[1].PosY = 0.880;
        RHud2[0].PosY = 0.880;
        RHud1[3].PosY = 0.880;
        RHud2[3].PosY = 0.880;
        AmmoIcon.PosY = 0.880;
        ammoCount.PosY = 0.880;
        RHud2[1].PosX = 1.030;
        RHud2[0].PosX = 1.030;
        RHud1[3].PosX = 1.030;
        RHud2[3].PosX = 1.030;
        AmmoIcon.PosX = 1.030;
        ammoCount.PosX = 1.030;
        ReloadingTrim.TextureScale = 0.270;
        ReloadingTeamTint.TextureScale = 0.270;
        ReloadingFill.TextureScale = 0.270;
        ReloadingTrim.PosX = 1.0050;
        ReloadingTeamTint.PosX = 1.0050;
        ReloadingFill.PosX = 1.0050;
        ReloadingTrim.PosY = 0.880;
        ReloadingTeamTint.PosY = 0.880;
        ReloadingFill.PosY = 0.880;
    }
    // End:0x81b
    else
    {
        i = 0;
        J0x3d4:
        // End:0x531 [While If]
        if(i < 4)
        {
            LHud1[i].PosX = default.LHud1[i].PosX;
            LHud1[i].PosY = default.LHud1[i].PosY;
            LHud2[i].PosX = default.LHud2[i].PosX;
            LHud2[i].PosY = default.LHud2[i].PosY;
            RHud1[i].PosX = default.RHud1[i].PosX;
            RHud1[i].PosY = default.RHud1[i].PosY;
            RHud2[i].PosX = default.RHud2[i].PosX;
            RHud2[i].PosY = default.RHud2[i].PosY;
            ShieldCount.PosY = default.ShieldCount.PosY;
            ShieldIcon.PosY = default.ShieldIcon.PosY;
            ShieldIconGlow.PosY = default.ShieldIconGlow.PosY;
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x3d4;
        }
        LHud1[0].TextureScale = default.LHud1[0].TextureScale;
        LHud1[0].TextureCoords = default.LHud1[0].TextureCoords;
        RHud1[0].TextureScale = default.RHud1[0].TextureScale;
        RHud1[0].TextureCoords = default.RHud1[0].TextureCoords;
        LHud1[1].TextureScale = default.LHud1[1].TextureScale;
        LHud1[1].TextureCoords = default.LHud1[1].TextureCoords;
        RHud1[1].TextureScale = default.RHud1[1].TextureScale;
        RHud1[1].TextureCoords = default.RHud1[1].TextureCoords;
        HealthIcon.PosY = default.HealthIcon.PosY;
        HealthCount.PosY = default.HealthCount.PosY;
        HealthIcon.PosX = default.HealthIcon.PosX;
        HealthCount.PosX = default.HealthCount.PosX;
        UDamageTrim.TextureScale = default.UDamageTrim.TextureScale;
        UDamageTeamTint.TextureScale = default.UDamageTeamTint.TextureScale;
        UDamageFill.TextureScale = default.UDamageFill.TextureScale;
        UDamageTrim.PosX = default.UDamageTrim.PosX;
        UDamageTeamTint.PosX = default.UDamageTeamTint.PosX;
        UDamageFill.PosX = default.UDamageFill.PosX;
        UDamageTrim.PosY = default.UDamageTrim.PosY;
        UDamageTeamTint.PosY = default.UDamageTeamTint.PosY;
        UDamageFill.PosY = default.UDamageFill.PosY;
        AmmoIcon.PosY = default.AmmoIcon.PosY;
        ammoCount.PosY = default.ammoCount.PosY;
        AmmoIcon.PosX = default.AmmoIcon.PosX;
        ammoCount.PosX = default.ammoCount.PosX;
        ReloadingTrim.TextureScale = default.ReloadingTrim.TextureScale;
        ReloadingTeamTint.TextureScale = default.ReloadingTeamTint.TextureScale;
        ReloadingFill.TextureScale = default.ReloadingFill.TextureScale;
        ReloadingTrim.PosX = default.ReloadingTrim.PosX;
        ReloadingTeamTint.PosX = default.ReloadingTeamTint.PosX;
        ReloadingFill.PosX = default.ReloadingFill.PosX;
        ReloadingTrim.PosY = default.ReloadingTrim.PosY;
        ReloadingTeamTint.PosY = default.ReloadingTeamTint.PosY;
        ReloadingFill.PosY = default.ReloadingFill.PosY;
    }
    SetHUDScale();
}

function SetHUDScale()
{
    local int i;
    local float NewPosX, NewPosY;

    OldHUDScale = HudScale;
    // End:0x48
    if(bSmallWeaponBar)
    {
        HudScale *= 0.670;
        NewPosY = default.WeaponBarTint[0].PosY + float(1) - HudScale * 0.0430;
    }
    // End:0x5a
    else
    {
        NewPosY = default.WeaponBarTint[0].PosY;
    }
    i = 0;
    J0x61:
    // End:0x165 [While If]
    if(i < 9)
    {
        NewPosX = 0.50 * float(1) - HudScale + HudScale * default.WeaponBarAmmoFill[i].PosX;
        WeaponBarAmmoFill[i].PosX = NewPosX;
        WeaponBarTint[i].PosX = NewPosX;
        WeaponBarTrim[i].PosX = NewPosX;
        WeaponBarIcon[i].PosX = NewPosX;
        WeaponBarAmmoFill[i].PosY = NewPosY + 0.0430 * HudScale;
        WeaponBarTint[i].PosY = NewPosY;
        WeaponBarTrim[i].PosY = NewPosY;
        WeaponBarIcon[i].PosY = NewPosY;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x61;
    }
    HudScale = OldHUDScale;
}

function DisplayVoiceGain(Canvas C)
{
    local Texture Tex;
    local float VoiceGain, PosY, BlockSize;
    local int i;

    BlockSize = 8192.0 / C.ClipX * HudScale;
    Tex = texture'WhiteSquareTexture';
    PosY = C.ClipY * 0.3750;
    VoiceGain = 1.0 - float(3 * Min(int(Level.TimeSeconds - LastVoiceGainTime), int(0.33330))) * LastVoiceGain;
    i = 0;
    J0x89:
    // End:0x16d [While If]
    if(i < 10)
    {
        // End:0x163
        if(VoiceGain > 0.10 * float(i))
        {
            C.SetPos(0.50 * BlockSize, PosY);
            C.SetDrawColor(byte(28.30 * float(i)), byte(float(255) - 28.30 * float(i)), 0, byte(255));
            C.DrawTile(Tex, BlockSize, BlockSize, 0.0, 0.0, float(Tex.USize), float(Tex.VSize));
            PosY -= 1.20 * BlockSize;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x89;
    }
}

simulated function DrawHudPassA(Canvas C)
{
    local class<wAmmunition> AmmoClass;

    ShowPointBarBottom(C);
    // End:0x22
    if(bSmallWeaponBar != bRealSmallWeaponBar)
    {
        SetSmallWeaponBar();
    }
    // End:0x37
    if(HudScale != OldHUDScale)
    {
        SetHUDScale();
    }
    // End:0xc0
    if(bShowPersonalInfo)
    {
        DrawSpriteWidget(C, LHud1[1]);
        DrawSpriteWidget(C, LHud2[1]);
        DrawSpriteWidget(C, Adrenaline[1]);
        DrawSpriteWidget(C, LHud1[0]);
        DrawSpriteWidget(C, LHud2[0]);
        DrawSpriteWidget(C, LHud1[3]);
        DrawSpriteWidget(C, LHud2[3]);
    }
    // End:0xea
    if(bShowWeaponBar && PawnOwner.Weapon != none)
    {
        DrawWeaponBar(C);
    }
    // End:0x267
    if(bShowWeaponInfo && PawnOwner.Weapon != none)
    {
        DrawSpriteWidget(C, RHud1[1]);
        DrawSpriteWidget(C, RHud2[1]);
        DrawSpriteWidget(C, RHud1[0]);
        DrawSpriteWidget(C, RHud2[0]);
        DrawSpriteWidget(C, RHud1[3]);
        DrawSpriteWidget(C, RHud2[3]);
        // End:0x1e5
        if(PawnOwner.Weapon.bShowChargingBar)
        {
            ReloadingFill.Scale = PawnOwner.Weapon.ChargeBar();
            DrawSpriteWidget(C, ReloadingFill);
            DrawSpriteWidget(C, ReloadingTeamTint);
            DrawSpriteWidget(C, ReloadingTrim);
        }
        AmmoClass = PawnOwner.Weapon.GetAmmoClass(0);
        // End:0x267
        if(AmmoClass != none && AmmoClass.default.IconMaterial != none)
        {
            AmmoIcon.WidgetTexture = AmmoClass.default.IconMaterial;
            AmmoIcon.TextureCoords = AmmoClass.default.IconCoords;
            DrawSpriteWidget(C, AmmoIcon);
        }
    }
    // End:0x292
    if(bShowPersonalInfo && ShieldCount.Value > 0)
    {
        DrawSpriteWidget(C, ShieldIconGlow);
    }
    // End:0x2bc
    if(Level.TimeSeconds - LastVoiceGainTime < 0.3330)
    {
        DisplayVoiceGain(C);
    }
}

simulated function ShowPointBarTop(Canvas C)
{
    // End:0x2e
    if(bShowPoints)
    {
        DrawSpriteWidget(C, ScoreBg[0]);
        DrawSpriteWidget(C, ScoreBg[3]);
    }
}

simulated function ShowPointBarBottom(Canvas C)
{
    // End:0x2e
    if(bShowPoints)
    {
        DrawSpriteWidget(C, ScoreBg[2]);
        DrawSpriteWidget(C, ScoreBg[1]);
    }
}

simulated function DrawHudPassC(Canvas C)
{
    ShowPointBarTop(C);
    // End:0xcb
    if(bShowPersonalInfo)
    {
        DrawSpriteWidget(C, Adrenaline[0]);
        DrawSpriteWidget(C, Adrenaline[3]);
        DrawSpriteWidget(C, Adrenaline[4]);
        DrawNumericWidget(C, AdrenalineCount, DigitsBig);
        DrawSpriteWidget(C, AdrenalineIcon);
        DrawSpriteWidget(C, HealthIcon);
        // End:0xb6
        if(ShieldCount.Value > 0)
        {
            DrawSpriteWidget(C, ShieldIcon);
            DrawNumericWidget(C, ShieldCount, DigitsBig);
        }
        DrawNumericWidget(C, HealthCount, DigitsBig);
    }
    UpdateRankAndSpread(C);
    // End:0x187
    if(bShowWeaponInfo && PawnOwner != none && PawnOwner.Weapon != none)
    {
        DrawNumericWidget(C, ammoCount, DigitsBig);
        // End:0x155
        if(bSmallWeaponBar)
        {
            PawnOwner.Weapon.NewDrawWeaponInfo(C, 0.870 * C.ClipX);
        }
        // End:0x187
        else
        {
            PawnOwner.Weapon.NewDrawWeaponInfo(C, 0.7050 * C.ClipX);
        }
    }
    // End:0x1cd
    if(PawnOwner != PlayerOwner.Pawn && PawnOwner != none && PawnOwner.PlayerReplicationInfo != none)
    {
        DrawHudSpectating(C);
    }
    DrawCrosshair(C);
}

simulated function DrawWeaponBar(Canvas C)
{
    local int i;
    local wWeapon Weapons[9];
    local Inventory Inv;
    local wWeapon W, PendingWeapon;
    local int Count;
    local float RealHUDScale, NewPosX, NewPosY, SavedPosY, AddPosX;

    // End:0x2b
    if(PawnOwner.PendingWeapon != none)
    {
        PendingWeapon = PawnOwner.PendingWeapon;
    }
    // End:0x3f
    else
    {
        PendingWeapon = PawnOwner.Weapon;
    }
    Inv = PawnOwner.Inventory;
    J0x53:
    // End:0x11d [While If]
    if(Inv != none)
    {
        W = wWeapon(Inv);
        ++ Count;
        // End:0x84
        if(Count > 100)
        {
        }
        // End:0x11d
        else
        {
            // End:0x92
            if(W == none)
            {
            }
            // End:0x106
            else
            {
                // End:0xa9
                if(W.IconMaterial == none)
                {
                }
                // End:0x106
                else
                {
                    // End:0xd0
                    if(W.InventoryGroup == 0)
                    {
                        Weapons[8] = W;
                    }
                    // End:0x106
                    else
                    {
                        // End:0x106
                        if(W.InventoryGroup < 10)
                        {
                            Weapons[W.InventoryGroup - 1] = W;
                        }
                    }
                }
            }
            Inv = Inv.Inventory;
            // This is an implied JumpToken; Continue!
            goto J0x53;
        }
    }
    // End:0x185
    if(PendingWeapon != none)
    {
        // End:0x14f
        if(PendingWeapon.InventoryGroup == 0)
        {
            Weapons[8] = PendingWeapon;
        }
        // End:0x185
        else
        {
            // End:0x185
            if(PendingWeapon.InventoryGroup < 10)
            {
                Weapons[PendingWeapon.InventoryGroup - 1] = PendingWeapon;
            }
        }
    }
    // End:0x1ca
    if(bSmallWeaponBar)
    {
        RealHUDScale = HudScale;
        HudScale *= 0.670;
        SavedPosY = default.WeaponBarTint[0].PosY + float(1) - HudScale * 0.0430;
    }
    i = 0;
    J0x1d1:
    // End:0x6f9 [While If]
    if(i < 9)
    {
        W = Weapons[i];
        // End:0x37d
        if(bSmallWeaponBar)
        {
            // End:0x266
            if(W == PendingWeapon)
            {
                NewPosX = 0.50 * float(1) - HudScale + HudScale * 0.0950 + 0.0850 * float(i);
                NewPosY = default.WeaponBarTint[0].PosY;
                AddPosX = 0.030;
                HudScale = RealHUDScale;
            }
            // End:0x2bf
            else
            {
                HudScale = 0.670 * RealHUDScale;
                NewPosX = AddPosX + 0.50 * float(1) - HudScale + HudScale * 0.0950 + 0.0850 * float(i);
                NewPosY = SavedPosY;
            }
            WeaponBarAmmoFill[i].PosX = NewPosX;
            WeaponBarTint[i].PosX = NewPosX;
            WeaponBarTrim[i].PosX = NewPosX;
            WeaponBarIcon[i].PosX = NewPosX;
            WeaponBarAmmoFill[i].PosY = NewPosY + 0.0430 * HudScale;
            WeaponBarTint[i].PosY = NewPosY;
            WeaponBarTrim[i].PosY = NewPosY;
            WeaponBarIcon[i].PosY = NewPosY;
        }
        // End:0x3b9
        if(bUsingCustomHUDColor)
        {
            WeaponBarTint[i].Tints[0] = CustomHUDColor;
            WeaponBarTint[i].Tints[1] = CustomHUDColor;
        }
        // End:0x403
        else
        {
            WeaponBarTint[i].Tints[0] = default.WeaponBarTint[i].Tints[0];
            WeaponBarTint[i].Tints[1] = default.WeaponBarTint[i].Tints[1];
        }
        // End:0x4ed
        if(W == none)
        {
            WeaponBarAmmoFill[i].Scale = 0.0;
            WeaponBarIcon[i].Tints[TeamIndex].A = 50;
            WeaponBarIcon[i].Tints[TeamIndex].R = byte(255);
            WeaponBarIcon[i].Tints[TeamIndex].B = 0;
            WeaponBarIcon[i].Tints[TeamIndex].G = byte(255);
            WeaponBarIcon[i].WidgetTexture = BaseWeapons[i].default.IconMaterial;
            WeaponBarIcon[i].TextureCoords = BaseWeapons[i].default.IconCoords;
        }
        // End:0x697
        else
        {
            WeaponBarAmmoFill[i].Scale = W.AmmoStatus();
            WeaponBarIcon[i].WidgetTexture = W.IconMaterial;
            WeaponBarIcon[i].TextureCoords = W.IconCoords;
            // End:0x617
            if(W == PendingWeapon)
            {
                WeaponBarIcon[i].Tints[TeamIndex].A = byte(255);
                WeaponBarIcon[i].Tints[TeamIndex].R = byte(255);
                WeaponBarIcon[i].Tints[TeamIndex].B = 0;
                WeaponBarIcon[i].Tints[TeamIndex].G = byte(255);
                WeaponBarTint[i].Tints[TeamIndex].A = 50;
                WeaponBarTint[i].Tints[TeamIndex].G = 128;
            }
            // End:0x697
            else
            {
                WeaponBarIcon[i].Tints[TeamIndex].A = byte(255);
                WeaponBarIcon[i].Tints[TeamIndex].R = byte(255);
                WeaponBarIcon[i].Tints[TeamIndex].B = byte(255);
                WeaponBarIcon[i].Tints[TeamIndex].G = byte(255);
            }
        }
        DrawSpriteWidget(C, WeaponBarAmmoFill[i]);
        DrawSpriteWidget(C, WeaponBarTint[i]);
        DrawSpriteWidget(C, WeaponBarTrim[i]);
        DrawSpriteWidget(C, WeaponBarIcon[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1d1;
    }
    // End:0x70d
    if(bSmallWeaponBar)
    {
        HudScale = RealHUDScale;
    }
}

simulated function UpdateHUD()
{
    // End:0x45
    if(PawnOwnerPRI != none && PawnOwnerPRI.Team != none)
    {
        TeamIndex = Clamp(PawnOwnerPRI.Team.TeamIndex, 0, 1);
    }
    // End:0x4c
    else
    {
        TeamIndex = 1;
    }
    CalculateScore();
    CalculateHealth();
    HealthCount.Value = int(CurHealth);
    HealthIcon.Tints[TeamIndex].R = byte(float(255) - float(255) * FClamp(CurHealth / float(100), 0.0, 1.0));
    HealthIcon.Tints[TeamIndex].G = 0;
    HealthIcon.Tints[TeamIndex].B = byte(255);
    CalculateShield();
    ShieldCount.Value = int(CurShield);
    CalculateEnergy();
    AdrenalineReady = CurEnergy == MaxEnergy;
    CalculateAmmo();
    ammoCount.Value = int(CurAmmoPrimary);
    // End:0x1be
    if(!TeamLinked)
    {
        RHud2[3].Tints[TeamIndex].R = byte(float(255) - float(255) * FClamp(CurAmmoPrimary / MaxAmmoPrimary, 0.0, 1.0));
        RHud2[3].Tints[TeamIndex].G = byte(float(255) * FClamp(CurAmmoPrimary / MaxAmmoPrimary, 0.0, 1.0));
        RHud2[3].Tints[TeamIndex].B = 0;
    }
    super.UpdateHUD();
}

function bool DrawLevelAction(Canvas C)
{
    local string LevelActionText;
    local Plane OldModulate;

    // End:0x3d
    if(Level.LevelAction == 0 && Level.Pauser != none)
    {
        LevelActionText = LevelActionPaused;
    }
    // End:0x87
    else
    {
        // End:0x7f
        if(Level.LevelAction == 1 || Level.LevelAction == 4)
        {
            LevelActionText = LevelActionLoading;
        }
        // End:0x87
        else
        {
            LevelActionText = "";
        }
    }
    // End:0x95
    if(LevelActionText == "")
    {
        return false;
    }
    C.Font = LoadLevelActionFont();
    C.DrawColor = LevelActionFontColor;
    C.Style = 5;
    OldModulate = C.ColorModulate;
    C.ColorModulate = C.default.ColorModulate;
    C.DrawScreenText(LevelActionText, LevelActionPositionX, LevelActionPositionY, 8);
    C.ColorModulate = OldModulate;
    return true;
}

function DisplayPortrait(PlayerReplicationInfo PRI)
{
    local Material NewPortrait;

    // End:0x0d
    if(LastPlayerIDTalking > 0)
    {
        return;
    }
    NewPortrait = PRI.GetPortrait();
    // End:0x2f
    if(NewPortrait == none)
    {
        return;
    }
    // End:0x45
    if(Portrait == none)
    {
        PortraitX = 1.0;
    }
    Portrait = NewPortrait;
    PortraitTime = Level.TimeSeconds + float(3);
    PortraitPRI = PRI;
}

simulated function Message(PlayerReplicationInfo PRI, coerce string Msg, name MsgType)
{
    super.Message(PRI, Msg, MsgType);
}

simulated function Font LoadLevelActionFont()
{
    return none;
    // End:0x70
    if(LevelActionFontFont == none)
    {
        LevelActionFontFont = Font(DynamicLoadObject(LevelActionFontName, class'Font'));
        // End:0x70
        if(LevelActionFontFont == none)
        {
            Log("Warning: " $ string(self) $ " Couldn't dynamically load font " $ LevelActionFontName);
        }
    }
    return LevelActionFontFont;
}

defaultproperties
{
    WeaponBarIcon[0]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=169,Y1=39,X2=241,Y2=77),TextureScale=0.530,DrawPivot=0,PosX=0.1390,PosY=1.0,OffsetX=18,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WeaponBarIcon[1]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=245,Y1=39,X2=329,Y2=79),TextureScale=0.530,DrawPivot=0,PosX=0.2190,PosY=1.0,OffsetX=18,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WeaponBarIcon[2]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=179,Y1=127,X2=241,Y2=175),TextureScale=0.530,DrawPivot=0,PosX=0.30,PosY=1.0,OffsetX=18,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WeaponBarIcon[3]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=250,Y1=110,X2=330,Y2=145),TextureScale=0.530,DrawPivot=0,PosX=0.380,PosY=1.0,OffsetX=18,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WeaponBarIcon[4]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=169,Y1=78,X2=244,Y2=124),TextureScale=0.530,DrawPivot=0,PosX=0.460,PosY=1.0,OffsetX=18,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WeaponBarIcon[5]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=246,Y1=80,X2=332,Y2=106),TextureScale=0.530,DrawPivot=0,PosX=0.540,PosY=1.0,OffsetX=18,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WeaponBarIcon[6]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=169,Y1=172,X2=245,Y2=208),TextureScale=0.530,DrawPivot=0,PosX=0.6210,PosY=1.0,OffsetX=18,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WeaponBarIcon[7]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=253,Y1=146,X2=333,Y2=181),TextureScale=0.530,DrawPivot=0,PosX=0.70,PosY=1.0,OffsetX=18,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WeaponBarIcon[8]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=246,Y1=182,X2=331,Y2=210),TextureScale=0.530,DrawPivot=0,PosX=0.780,PosY=1.0,OffsetX=18,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    AmmoIcon=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=0,Y2=0),TextureScale=0.450,DrawPivot=0,PosX=1.0,PosY=0.8350,OffsetX=-151,OffsetY=44,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    AdrenalineCount=(RenderStyle=5,MinDigitCount=0,TextureScale=0.180,DrawPivot=2,PosX=1.0,PosY=0.0,OffsetX=-260,OffsetY=40,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    HealthCount=(RenderStyle=5,MinDigitCount=0,TextureScale=0.250,DrawPivot=3,PosX=0.0,PosY=0.8350,OffsetX=620,OffsetY=145,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    ammoCount=(RenderStyle=5,MinDigitCount=0,TextureScale=0.250,DrawPivot=2,PosX=1.0,PosY=0.8350,OffsetX=-340,OffsetY=95,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    ShieldCount=(RenderStyle=5,MinDigitCount=0,TextureScale=0.250,DrawPivot=8,PosX=0.50,PosY=0.8350,OffsetX=0,OffsetY=145,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    mySpread=(RenderStyle=5,MinDigitCount=2,TextureScale=0.090,DrawPivot=2,PosX=0.0,PosY=0.0,OffsetX=655,OffsetY=135,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    myRank=(RenderStyle=5,MinDigitCount=2,TextureScale=0.150,DrawPivot=2,PosX=0.0,PosY=0.0,OffsetX=150,OffsetY=40,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    MyScore=(RenderStyle=5,MinDigitCount=2,TextureScale=0.180,DrawPivot=2,PosX=0.0,PosY=0.0,OffsetX=560,OffsetY=40,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    LevelActionFontColor=(R=255,G=255,B=255,A=255)
    LevelActionPositionX=0.50
    LevelActionPositionY=0.250
    CurrentWeaponPositionX=0.8450
    CurrentWeaponPositionY=0.90
    LogoScaleX=0.250
    LogoScaleY=0.250
    LogoPosX=0.490
    LogoPosY=0.150
    OldHUDScale=1.0
    ConsoleMessagePosX=0.0050
    ConsoleMessagePosY=0.8250
}