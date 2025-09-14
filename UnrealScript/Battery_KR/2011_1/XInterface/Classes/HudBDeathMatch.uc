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
var() Class<wWeapon> BaseWeapons[9];
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

simulated function UpdatePrecacheMaterials()
{
    //return;    
}

function PostBeginPlay()
{
    local SceneManager SM;

    super.PostBeginPlay();
    // End:0x3C
    foreach AllActors(Class'Engine.SceneManager', SM)
    {
        MySceneManagers.Length = MySceneManagers.Length + 1;
        MySceneManagers[MySceneManagers.Length - 1] = SM;        
    }    
    // End:0x4C
    if(CustomCrosshairsAllowed())
    {
        SetCustomCrosshairs();
    }
    //return;    
}

function bool CustomCrosshairsAllowed()
{
    return true;
    //return;    
}

function bool CustomCrosshairColorAllowed()
{
    return true;
    //return;    
}

function bool CustomHUDColorAllowed()
{
    return true;
    //return;    
}

function SetCustomCrosshairs()
{
    local int i;
    local array<CrosshairRecord> CustomCrosshairs;

    Class'Engine.CacheManager'.static.GetCrosshairList(CustomCrosshairs);
    Crosshairs.Length = CustomCrosshairs.Length;
    i = 0;
    J0x25:

    // End:0x173 [Loop If]
    if(i < CustomCrosshairs.Length)
    {
        Crosshairs[i].WidgetTexture = CustomCrosshairs[i].CrosshairTexture;
        Crosshairs[i].TextureCoords.X1 = 0;
        Crosshairs[i].TextureCoords.X2 = 64;
        Crosshairs[i].TextureCoords.Y1 = 0;
        Crosshairs[i].TextureCoords.Y2 = 64;
        Crosshairs[i].TextureScale = 0.7500000;
        Crosshairs[i].DrawPivot = 8;
        Crosshairs[i].PosX = 0.5000000;
        Crosshairs[i].PosY = 0.5000000;
        Crosshairs[i].OffsetX = 0;
        Crosshairs[i].OffsetY = 0;
        Crosshairs[i].ScaleMode = 0;
        Crosshairs[i].Scale = 1.0000000;
        Crosshairs[i].RenderStyle = 5;
        i++;
        // [Loop Continue]
        goto J0x25;
    }
    // End:0x182
    if(CustomCrosshairColorAllowed())
    {
        SetCustomCrosshairColors();
    }
    //return;    
}

function SetCustomCrosshairColors()
{
    local int i, j;

    i = 0;
    J0x07:

    // End:0x5A [Loop If]
    if(i < Crosshairs.Length)
    {
        j = 0;
        J0x1E:

        // End:0x50 [Loop If]
        if(j < 2)
        {
            Crosshairs[i].Tints[j] = CrossHairColor;
            j++;
            // [Loop Continue]
            goto J0x1E;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function SetCustomHUDColor()
{
    local int i, j;

    // End:0x50
    if((((int(CustomHUDColor.R) == 0) && int(CustomHUDColor.G) == 0) && int(CustomHUDColor.B) == 0) && int(CustomHUDColor.A) == 0)
    {
        return;
    }
    bUsingCustomHUDColor = true;
    j = 0;
    J0x5F:

    // End:0x19F [Loop If]
    if(j < 2)
    {
        ReloadingTeamTint.Tints[j] = CustomHUDColor;
        UDamageTeamTint.Tints[j] = CustomHUDColor;
        i = 1;
        J0x9E:

        // End:0x15C [Loop If]
        if(i < 3)
        {
            LHud1[i].Tints[j] = CustomHUDColor;
            LHud2[i].Tints[j] = CustomHUDColor;
            RHud1[i].Tints[j] = CustomHUDColor;
            RHud2[i].Tints[j] = CustomHUDColor;
            Adrenaline[i].Tints[j] = CustomHUDColor;
            ScoreBg[i].Tints[j] = CustomHUDColor;
            i++;
            // [Loop Continue]
            goto J0x9E;
        }
        i = 0;
        J0x163:

        // End:0x195 [Loop If]
        if(i < 9)
        {
            WeaponBarTint[i].Tints[j] = CustomHUDColor;
            i++;
            // [Loop Continue]
            goto J0x163;
        }
        j++;
        // [Loop Continue]
        goto J0x5F;
    }
    //return;    
}

function CheckCountdown(GameReplicationInfo GRI)
{
    //return;    
}

simulated function Tick(float DeltaTime)
{
    local Material NewPortrait;

    super.Tick(DeltaTime);
    // End:0x10F
    if(((Level.TimeSeconds - LastPlayerIDTalkingTime) < 0.1000000) && PlayerOwner.GameReplicationInfo != none)
    {
        // End:0xF1
        if((PortraitPRI == none) || PortraitPRI.PlayerID != LastPlayerIDTalking)
        {
            PortraitPRI = PlayerOwner.GameReplicationInfo.FindPlayerByID(LastPlayerIDTalking);
            // End:0xEE
            if(PortraitPRI != none)
            {
                NewPortrait = PortraitPRI.GetPortrait();
                // End:0xEE
                if(NewPortrait != none)
                {
                    // End:0xC9
                    if(Portrait == none)
                    {
                        PortraitX = 1.0000000;
                    }
                    Portrait = NewPortrait;
                    PortraitTime = Level.TimeSeconds + float(3);
                }
            }            
        }
        else
        {
            PortraitTime = Level.TimeSeconds + 0.2000000;
        }        
    }
    else
    {
        LastPlayerIDTalking = 0;
    }
    // End:0x155
    if((PortraitTime - Level.TimeSeconds) > float(0))
    {
        PortraitX = FMax(0.0000000, PortraitX - (float(3) * DeltaTime));        
    }
    else
    {
        // End:0x19A
        if(Portrait != none)
        {
            PortraitX = FMin(1.0000000, PortraitX + (float(3) * DeltaTime));
            // End:0x19A
            if(PortraitX == float(1))
            {
                Portrait = none;
                PortraitPRI = none;
            }
        }
    }
    pulseNumber(0, HealthCount, 0.2600000, 0.0500000, DeltaTime, 0.2500000, 0.0000000, 255.0000000, CurHealth, LastHealth);
    pulseNumber(1, ShieldCount, 0.2600000, 0.0500000, DeltaTime, 0.2500000, 0.0000000, 255.0000000, CurShield, LastShield);
    ArmorPulse(DeltaTime, 255.0000000, 0.0000000, ShieldIconGlow, TeamIndex, 250.0000000);
    // End:0x25E
    if(CurHealth < float(50))
    {
        LowHealth(DeltaTime, 255.0000000, 0.0000000, LHud2[3], TeamIndex, 1000.0000000);        
    }
    else
    {
        LHud2[3].Tints[TeamIndex].A = 50;
    }
    // End:0x2B0
    if(CurHealth < float(25))
    {
        pulseWidget(DeltaTime, 255.0000000, 0.0000000, HealthIcon, TeamIndex, 2, 2000.0000000);        
    }
    else
    {
        HealthIcon.Tints[TeamIndex].A = byte(255);
    }
    // End:0x2FF
    if(AdrenalineReady)
    {
        pulseWidget(DeltaTime, 255.0000000, 0.0000000, Adrenaline[4], TeamIndex, 2, 1000.0000000);        
    }
    else
    {
        Adrenaline[4].Tints[TeamIndex].A = 0;
    }
    //return;    
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
    //return;    
}

simulated function pulseNumber(int gIndex, out NumericWidget Number, float nScale, float growSpeed, float DeltaTime, float oScale, float Test1, float Test2, float first, float Last)
{
    local float growAccum;

    growAccum = DeltaTime * growSpeed;
    testLerp = Test1 + ((DeltaTime * float(2)) * (Test2 - Test1));
    // End:0x150
    if(growing)
    {
        growScale[gIndex] -= growAccum;
        growTrace[gIndex] += testLerp;
        // End:0x8A
        if(growTrace[gIndex] > float(255))
        {
            growTrace[gIndex] = 255.0000000;
        }
        // End:0xBB
        if(first < Last)
        {
            growTrace[gIndex] = 0.0000000;
            growScale[gIndex] = nScale;
        }
        // End:0xE1
        if(growScale[gIndex] < oScale)
        {
            growScale[gIndex] = oScale;
        }
        // End:0x114
        if((growScale[gIndex] < oScale) && growTrace[gIndex] == float(255))
        {
            growing = false;
        }
        Number.Tints[TeamIndex].B = byte(growTrace[gIndex]);
        Number.TextureScale = growScale[gIndex];        
    }
    else
    {
        // End:0x18C
        if(first < Last)
        {
            growTrace[gIndex] = 0.0000000;
            growScale[gIndex] = nScale;
            growing = true;            
        }
        else
        {
            growScale[gIndex] = oScale;
        }
    }
    //return;    
}

simulated function ArmorPulse(float DeltaTime, float Max, float Min, out SpriteWidget Sprite, int tIndex, float pRate)
{
    local int accum;

    accum = int(DeltaTime * pRate);
    // End:0x2E
    if(ArmorGlow)
    {
        pulseArmorIcon += float(accum);        
    }
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
    //return;    
}

simulated function LowHealth(float DeltaTime, float Max, float Min, out SpriteWidget Sprite, int tIndex, float pRate)
{
    local int accum;

    accum = int(DeltaTime * pRate);
    // End:0x2E
    if(LowHealthPulse)
    {
        pulseHealthIcon += float(accum);        
    }
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
    //return;    
}

simulated function UpdateRankAndSpread(Canvas C)
{
    local int i;

    // End:0x23
    if((ScoreBoard == none) || !ScoreBoard.UpdateGRI())
    {
        return;
    }
    i = 0;
    J0x2A:

    // End:0x93 [Loop If]
    if(i < PlayerOwner.GameReplicationInfo.PRIArray.Length)
    {
        // End:0x89
        if(PawnOwnerPRI == PlayerOwner.GameReplicationInfo.PRIArray[i])
        {
            myRank.Value = i + 1;
            // [Explicit Break]
            goto J0x93;
        }
        i++;
        // [Loop Continue]
        goto J0x2A;
    }
    J0x93:

    MyScore.Value = Min(int(PawnOwnerPRI.Score), 999);
    // End:0x14E
    if(PawnOwnerPRI == PlayerOwner.GameReplicationInfo.PRIArray[0])
    {
        // End:0x13F
        if(PlayerOwner.GameReplicationInfo.PRIArray.Length > 1)
        {
            mySpread.Value = Min(int(PawnOwnerPRI.Score - PlayerOwner.GameReplicationInfo.PRIArray[1].Score), 999);            
        }
        else
        {
            mySpread.Value = 0;
        }        
    }
    else
    {
        mySpread.Value = Min(int(PawnOwnerPRI.Score - PlayerOwner.GameReplicationInfo.PRIArray[0].Score), 999);
    }
    // End:0x1F6
    if(bShowPoints)
    {
        DrawNumericWidget(C, MyScore, DigitsBig);
        // End:0x1E1
        if(C.ClipX >= float(640))
        {
            DrawNumericWidget(C, mySpread, DigitsBig);
        }
        DrawNumericWidget(C, myRank, DigitsBig);
    }
    // End:0x234
    if(myRank.Value > 9)
    {
        myRank.TextureScale = 0.1200000;
        myRank.OffsetX = 240;
        myRank.OffsetY = 90;        
    }
    else
    {
        myRank.TextureScale = 0.1800000;
        myRank.OffsetX = 150;
        myRank.OffsetY = 40;
    }
    //return;    
}

simulated function CalculateHealth()
{
    LastHealth = CurHealth;
    CurHealth = float(PawnOwner.Health);
    //return;    
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
    else
    {
        MaxShield = 100.0000000;
        CurShield = 0.0000000;
    }
    //return;    
}

simulated function CalculateEnergy()
{
    // End:0x4D
    if(PawnOwner.Controller == none)
    {
        MaxEnergy = PlayerOwner.AdrenalineMax;
        CurEnergy = float(Clamp(int(PlayerOwner.Adrenaline), 0, int(MaxEnergy)));        
    }
    else
    {
        MaxEnergy = PawnOwner.Controller.AdrenalineMax;
        CurEnergy = float(Clamp(int(PawnOwner.Controller.Adrenaline), 0, int(MaxEnergy)));
    }
    AdrenalineCount.Value = int(CurEnergy);
    //return;    
}

simulated function CalculateAmmo()
{
    MaxAmmoPrimary = 1.0000000;
    CurAmmoPrimary = 1.0000000;
    // End:0x59
    if((PawnOwner != none) && PawnOwner.Weapon != none)
    {
        PawnOwner.Weapon.GetAmmoCount(MaxAmmoPrimary, CurAmmoPrimary);
    }
    //return;    
}

simulated function CalculateScore()
{
    ScoreDiff = CurScore;
    CurScore = int(PawnOwnerPRI.Score);
    //return;    
}

simulated function string GetScoreText()
{
    return ScoreText;
    //return;    
}

simulated function string GetScoreValue(PlayerReplicationInfo PRI)
{
    return "" $ string(int(PRI.Score));
    //return;    
}

simulated function string GetScoreTagLine()
{
    return InitialViewingString;
    //return;    
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
        J0x1E:

        // End:0x52 [Loop If]
        if(i < MySceneManagers.Length)
        {
            // End:0x48
            if(MySceneManagers[i].bIsRunning)
            {
                return;
            }
            i++;
            // [Loop Continue]
            goto J0x1E;
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
    Top = (C.ClipY - float(8)) - Full;
    Scale = (Full + float(16)) / float(128);
    TextTop = Top + float(4);
    GRI = PlayerOwner.GameReplicationInfo;
    // End:0x2C1
    if(UnrealPlayer(Owner).bDisplayWinner || UnrealPlayer(Owner).bDisplayLoser)
    {
        // End:0x1A0
        if(UnrealPlayer(Owner).bDisplayWinner)
        {
            InfoString = YouveWonTheMatch;            
        }
        else
        {
            // End:0x1FE
            if(PlayerReplicationInfo(PlayerOwner.GameReplicationInfo.Winner) != none)
            {
                InfoString = (WonMatchPrefix $ PlayerReplicationInfo(PlayerOwner.GameReplicationInfo.Winner).PlayerName) $ WonMatchPostFix;                
            }
            else
            {
                InfoString = YouveLostTheMatch;
            }
        }
        C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
        C.Font = GetMediumFontFor(C);
        C.StrLen(InfoString, XL, YL);
        C.SetPos((C.ClipX / float(2)) - (XL / float(2)), (Top + (Full / float(2))) - (YL / float(2)));
        C.DrawText(InfoString, false);        
    }
    else
    {
        // End:0x30C
        if((Pawn(PlayerOwner.ViewTarget) != none) && Pawn(PlayerOwner.ViewTarget).PlayerReplicationInfo != none)
        {
            DrawHudSpectating(C);            
        }
    }
    C.ColorModulate = OldModulate;
    //return;    
}

simulated function string GetInfoString()
{
    local string InfoString;

    // End:0x9E
    if(PlayerOwner.IsDead())
    {
        // End:0x44
        if(PlayerOwner.PlayerReplicationInfo.bOutOfLives)
        {
            InfoString = Class'XInterface_Decompressed.ScoreBoardDeathMatch'.default.OutFireText;            
        }
        else
        {
            // End:0x87
            if((Level.TimeSeconds - UnrealPlayer(PlayerOwner).LastKickWarningTime) < float(2))
            {
                InfoString = Class'Engine.GameMessage'.default.KickWarning;                
            }
            else
            {
                InfoString = Class'XInterface_Decompressed.ScoreBoardDeathMatch'.default.Restart;
            }
        }        
    }
    else
    {
        // End:0xE1
        if((Level.TimeSeconds - UnrealPlayer(PlayerOwner).LastKickWarningTime) < float(2))
        {
            InfoString = Class'Engine.GameMessage'.default.KickWarning;            
        }
        else
        {
            // End:0x11A
            if(GUIController(PlayerOwner.Player.GUIController).ActivePage != none)
            {
                InfoString = AtMenus;                
            }
            else
            {
                // End:0x159
                if((PlayerOwner.PlayerReplicationInfo != none) && PlayerOwner.PlayerReplicationInfo.bWaitingPlayer)
                {
                    InfoString = WaitingToSpawn;                    
                }
                else
                {
                    InfoString = InitialViewingString;
                }
            }
        }
    }
    return InfoString;
    //return;    
}

simulated function DrawCrosshair(Canvas C)
{
    local float NormalScale;
    local int i, CurrentCrosshair;
    local float OldScale, OldW, CurrentCrosshairScale;
    local Color CurrentCrosshairColor;
    local SpriteWidget CHtexture;

    // End:0x0D
    if(!bCrosshairShow)
    {
        return;
    }
    // End:0x1DB
    if((bUseCustomWeaponCrosshairs && PawnOwner != none) && PawnOwner.Weapon != none)
    {
        CurrentCrosshair = PawnOwner.Weapon.CustomCrosshair;
        // End:0x84
        if((CurrentCrosshair == -1) || CurrentCrosshair == Crosshairs.Length)
        {
            DrawEnemyName(C);
            return;
        }
        CurrentCrosshairColor = PawnOwner.Weapon.CustomCrossHairColor;
        CurrentCrosshairScale = PawnOwner.Weapon.CustomCrossHairScale;
        // End:0x1D8
        if(PawnOwner.Weapon.CustomCrossHairTextureName != "")
        {
            // End:0x1A9
            if(PawnOwner.Weapon.CustomCrossHairTexture == none)
            {
                PawnOwner.Weapon.CustomCrossHairTexture = Texture(DynamicLoadObject(PawnOwner.Weapon.CustomCrossHairTextureName, Class'Engine.Texture'));
                // End:0x1A9
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
    else
    {
        CurrentCrosshair = CrosshairStyle;
        CurrentCrosshairColor = CrossHairColor;
        CurrentCrosshairScale = CrosshairScale;
    }
    CurrentCrosshair = Clamp(CurrentCrosshair, 0, Crosshairs.Length - 1);
    NormalScale = Crosshairs[CurrentCrosshair].TextureScale;
    // End:0x24A
    if(CHtexture.WidgetTexture == none)
    {
        CHtexture = Crosshairs[CurrentCrosshair];
    }
    CHtexture.TextureScale *= CurrentCrosshairScale;
    i = 0;
    J0x262:

    // End:0x28E [Loop If]
    if(i < 2)
    {
        CHtexture.Tints[i] = CurrentCrosshairColor;
        i++;
        // [Loop Continue]
        goto J0x262;
    }
    // End:0x32E
    if(LastPickupTime > (Level.TimeSeconds - 0.4000000))
    {
        // End:0x2FB
        if(LastPickupTime > (Level.TimeSeconds - 0.2000000))
        {
            CHtexture.TextureScale *= (float(1) + (float(5) * (Level.TimeSeconds - LastPickupTime)));            
        }
        else
        {
            CHtexture.TextureScale *= (float(1) + (float(5) * ((LastPickupTime + 0.4000000) - Level.TimeSeconds)));
        }
    }
    OldScale = HudScale;
    HudScale = 1.0000000;
    OldW = C.ColorModulate.W;
    C.ColorModulate.W = 1.0000000;
    DrawSpriteWidget(C, CHtexture);
    C.ColorModulate.W = OldW;
    HudScale = OldScale;
    CHtexture.TextureScale = NormalScale;
    DrawEnemyName(C);
    //return;    
}

function DrawEnemyName(Canvas C)
{
    local Actor HitActor;
    local Vector HitLocation, HitNormal, ViewPos;

    // End:0x35
    if((PlayerOwner.bBehindView || bNoEnemyNames) || PawnOwner.Controller == none)
    {
        return;
    }
    ViewPos = PawnOwner.Location + (PawnOwner.BaseEyeHeight * vect(0.0000000, 0.0000000, 1.0000000));
    HitActor = Trace(HitLocation, HitNormal, ViewPos + (float(1200) * Vector(PawnOwner.Controller.Rotation)), ViewPos, true);
    // End:0x1C8
    if((((Pawn(HitActor) != none) && Pawn(HitActor).PlayerReplicationInfo != none) && HitActor != PawnOwner) && (PawnOwner.PlayerReplicationInfo.Team == none) || PawnOwner.PlayerReplicationInfo.Team != Pawn(HitActor).PlayerReplicationInfo.Team)
    {
        // End:0x1AF
        if((NamedPlayer != Pawn(HitActor).PlayerReplicationInfo) || (Level.TimeSeconds - NameTime) > 0.5000000)
        {
            DisplayEnemyName(C, Pawn(HitActor).PlayerReplicationInfo);
            NameTime = Level.TimeSeconds;
        }
        NamedPlayer = Pawn(HitActor).PlayerReplicationInfo;
    }
    //return;    
}

function DisplayEnemyName(Canvas C, PlayerReplicationInfo PRI)
{
    PlayerOwner.ReceiveLocalizedMessage(Class'UnrealGame.PlayerNameMessage', 0, PRI);
    //return;    
}

function SetSmallWeaponBar()
{
    local int i;

    bRealSmallWeaponBar = bSmallWeaponBar;
    // End:0x3CD
    if(bSmallWeaponBar)
    {
        LHud1[0].TextureCoords.Y2 = 893;
        LHud1[1].TextureCoords.Y2 = 893;
        LHud1[0].PosY = 0.8900000;
        LHud1[1].PosY = 0.8900000;
        LHud1[0].TextureScale = 0.2500000;
        LHud1[1].TextureScale = 0.2500000;
        LHud2[1].PosY = 0.8800000;
        LHud2[0].PosY = 0.8800000;
        LHud1[3].PosY = 0.8800000;
        LHud2[3].PosY = 0.8800000;
        HealthIcon.PosY = 0.8800000;
        HealthCount.PosY = 0.8800000;
        LHud2[1].PosX = -0.0300000;
        LHud2[0].PosX = -0.0300000;
        LHud1[3].PosX = -0.0300000;
        LHud2[3].PosX = -0.0300000;
        HealthIcon.PosX = -0.0300000;
        HealthCount.PosX = -0.0300000;
        UDamageTrim.TextureScale = 0.2700000;
        UDamageTeamTint.TextureScale = 0.2700000;
        UDamageFill.TextureScale = 0.2700000;
        UDamageTrim.PosX = -0.0050000;
        UDamageTeamTint.PosX = -0.0050000;
        UDamageFill.PosX = -0.0050000;
        UDamageTrim.PosY = 0.8800000;
        UDamageTeamTint.PosY = 0.8800000;
        UDamageFill.PosY = 0.8800000;
        RHud1[0].TextureCoords.Y2 = 893;
        RHud1[1].TextureCoords.Y2 = 893;
        RHud1[0].PosY = 0.8900000;
        RHud1[1].PosY = 0.8900000;
        RHud1[0].TextureScale = 0.2500000;
        RHud1[1].TextureScale = 0.2500000;
        RHud2[1].PosY = 0.8800000;
        RHud2[0].PosY = 0.8800000;
        RHud1[3].PosY = 0.8800000;
        RHud2[3].PosY = 0.8800000;
        AmmoIcon.PosY = 0.8800000;
        ammoCount.PosY = 0.8800000;
        RHud2[1].PosX = 1.0300000;
        RHud2[0].PosX = 1.0300000;
        RHud1[3].PosX = 1.0300000;
        RHud2[3].PosX = 1.0300000;
        AmmoIcon.PosX = 1.0300000;
        ammoCount.PosX = 1.0300000;
        ReloadingTrim.TextureScale = 0.2700000;
        ReloadingTeamTint.TextureScale = 0.2700000;
        ReloadingFill.TextureScale = 0.2700000;
        ReloadingTrim.PosX = 1.0050000;
        ReloadingTeamTint.PosX = 1.0050000;
        ReloadingFill.PosX = 1.0050000;
        ReloadingTrim.PosY = 0.8800000;
        ReloadingTeamTint.PosY = 0.8800000;
        ReloadingFill.PosY = 0.8800000;        
    }
    else
    {
        i = 0;
        J0x3D4:

        // End:0x531 [Loop If]
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
            i++;
            // [Loop Continue]
            goto J0x3D4;
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
    //return;    
}

function SetHUDScale()
{
    local int i;
    local float NewPosX, NewPosY;

    OldHUDScale = HudScale;
    // End:0x48
    if(bSmallWeaponBar)
    {
        HudScale *= 0.6700000;
        NewPosY = default.WeaponBarTint[0].PosY + ((float(1) - HudScale) * 0.0430000);        
    }
    else
    {
        NewPosY = default.WeaponBarTint[0].PosY;
    }
    i = 0;
    J0x61:

    // End:0x165 [Loop If]
    if(i < 9)
    {
        NewPosX = (0.5000000 * (float(1) - HudScale)) + (HudScale * default.WeaponBarAmmoFill[i].PosX);
        WeaponBarAmmoFill[i].PosX = NewPosX;
        WeaponBarTint[i].PosX = NewPosX;
        WeaponBarTrim[i].PosX = NewPosX;
        WeaponBarIcon[i].PosX = NewPosX;
        WeaponBarAmmoFill[i].PosY = NewPosY + (0.0430000 * HudScale);
        WeaponBarTint[i].PosY = NewPosY;
        WeaponBarTrim[i].PosY = NewPosY;
        WeaponBarIcon[i].PosY = NewPosY;
        i++;
        // [Loop Continue]
        goto J0x61;
    }
    HudScale = OldHUDScale;
    //return;    
}

function DisplayVoiceGain(Canvas C)
{
    local Texture Tex;
    local float VoiceGain, PosY, BlockSize;
    local int i;

    BlockSize = (8192.0000000 / C.ClipX) * HudScale;
    Tex = Texture'Engine.WhiteSquareTexture';
    PosY = C.ClipY * 0.3750000;
    VoiceGain = (1.0000000 - float(3 * Min(int(Level.TimeSeconds - LastVoiceGainTime), int(0.3333000)))) * LastVoiceGain;
    i = 0;
    J0x89:

    // End:0x16D [Loop If]
    if(i < 10)
    {
        // End:0x163
        if(VoiceGain > (0.1000000 * float(i)))
        {
            C.SetPos(0.5000000 * BlockSize, PosY);
            C.SetDrawColor(byte(28.2999992 * float(i)), byte(float(255) - (28.2999992 * float(i))), 0, byte(255));
            C.DrawTile(Tex, BlockSize, BlockSize, 0.0000000, 0.0000000, float(Tex.USize), float(Tex.VSize));
            PosY -= (1.2000000 * BlockSize);
        }
        i++;
        // [Loop Continue]
        goto J0x89;
    }
    //return;    
}

simulated function DrawHudPassA(Canvas C)
{
    local Class<wAmmunition> AmmoClass;

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
    // End:0xC0
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
    // End:0xEA
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
        // End:0x1E5
        if(PawnOwner.Weapon.bShowChargingBar)
        {
            ReloadingFill.Scale = PawnOwner.Weapon.ChargeBar();
            DrawSpriteWidget(C, ReloadingFill);
            DrawSpriteWidget(C, ReloadingTeamTint);
            DrawSpriteWidget(C, ReloadingTrim);
        }
        AmmoClass = PawnOwner.Weapon.GetAmmoClass(0);
        // End:0x267
        if((AmmoClass != none) && AmmoClass.default.IconMaterial != none)
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
    // End:0x2BC
    if((Level.TimeSeconds - LastVoiceGainTime) < 0.3330000)
    {
        DisplayVoiceGain(C);
    }
    //return;    
}

simulated function ShowPointBarTop(Canvas C)
{
    // End:0x2E
    if(bShowPoints)
    {
        DrawSpriteWidget(C, ScoreBg[0]);
        DrawSpriteWidget(C, ScoreBg[3]);
    }
    //return;    
}

simulated function ShowPointBarBottom(Canvas C)
{
    // End:0x2E
    if(bShowPoints)
    {
        DrawSpriteWidget(C, ScoreBg[2]);
        DrawSpriteWidget(C, ScoreBg[1]);
    }
    //return;    
}

simulated function DrawHudPassC(Canvas C)
{
    local float PortraitWidth, PortraitHeight, XL, YL, Abbrev, SmallH,
	    NameWidth;

    local string PortraitString;

    ShowPointBarTop(C);
    // End:0xCB
    if(bShowPersonalInfo)
    {
        DrawSpriteWidget(C, Adrenaline[0]);
        DrawSpriteWidget(C, Adrenaline[3]);
        DrawSpriteWidget(C, Adrenaline[4]);
        DrawNumericWidget(C, AdrenalineCount, DigitsBig);
        DrawSpriteWidget(C, AdrenalineIcon);
        DrawSpriteWidget(C, HealthIcon);
        // End:0xB6
        if(ShieldCount.Value > 0)
        {
            DrawSpriteWidget(C, ShieldIcon);
            DrawNumericWidget(C, ShieldCount, DigitsBig);
        }
        DrawNumericWidget(C, HealthCount, DigitsBig);
    }
    UpdateRankAndSpread(C);
    // End:0x187
    if((bShowWeaponInfo && PawnOwner != none) && PawnOwner.Weapon != none)
    {
        DrawNumericWidget(C, ammoCount, DigitsBig);
        // End:0x155
        if(bSmallWeaponBar)
        {
            PawnOwner.Weapon.NewDrawWeaponInfo(C, 0.8700000 * C.ClipX);            
        }
        else
        {
            PawnOwner.Weapon.NewDrawWeaponInfo(C, 0.7050000 * C.ClipX);
        }
    }
    // End:0x1CD
    if(((PawnOwner != PlayerOwner.Pawn) && PawnOwner != none) && PawnOwner.PlayerReplicationInfo != none)
    {
        DrawHudSpectating(C);
    }
    DrawCrosshair(C);
    //return;    
}

simulated function DrawWeaponBar(Canvas C)
{
    local int i;
    local wWeapon Weapons[9];
    local Inventory Inv;
    local wWeapon W, PendingWeapon;
    local int Count;
    local float RealHUDScale, NewPosX, NewPosY, SavedPosY, AddPosX;

    // End:0x2B
    if(PawnOwner.PendingWeapon != none)
    {
        PendingWeapon = PawnOwner.PendingWeapon;        
    }
    else
    {
        PendingWeapon = PawnOwner.Weapon;
    }
    Inv = PawnOwner.Inventory;
    J0x53:

    // End:0x11D [Loop If]
    if(Inv != none)
    {
        W = wWeapon(Inv);
        Count++;
        // End:0x84
        if(Count > 100)
        {
            // [Explicit Break]
            goto J0x11D;
        }
        // End:0x92
        if(W == none)
        {            
        }
        else
        {
            // End:0xA9
            if(W.IconMaterial == none)
            {                
            }
            else
            {
                // End:0xD0
                if(int(W.InventoryGroup) == 0)
                {
                    Weapons[8] = W;                    
                }
                else
                {
                    // End:0x106
                    if(int(W.InventoryGroup) < 10)
                    {
                        Weapons[int(W.InventoryGroup) - 1] = W;
                    }
                }
            }
        }
        Inv = Inv.Inventory;
        // [Loop Continue]
        goto J0x53;
    }
    J0x11D:

    // End:0x185
    if(PendingWeapon != none)
    {
        // End:0x14F
        if(int(PendingWeapon.InventoryGroup) == 0)
        {
            Weapons[8] = PendingWeapon;            
        }
        else
        {
            // End:0x185
            if(int(PendingWeapon.InventoryGroup) < 10)
            {
                Weapons[int(PendingWeapon.InventoryGroup) - 1] = PendingWeapon;
            }
        }
    }
    // End:0x1CA
    if(bSmallWeaponBar)
    {
        RealHUDScale = HudScale;
        HudScale *= 0.6700000;
        SavedPosY = default.WeaponBarTint[0].PosY + ((float(1) - HudScale) * 0.0430000);
    }
    i = 0;
    J0x1D1:

    // End:0x6F9 [Loop If]
    if(i < 9)
    {
        W = Weapons[i];
        // End:0x37D
        if(bSmallWeaponBar)
        {
            // End:0x266
            if(W == PendingWeapon)
            {
                NewPosX = (0.5000000 * (float(1) - HudScale)) + (HudScale * (0.0950000 + (0.0850000 * float(i))));
                NewPosY = default.WeaponBarTint[0].PosY;
                AddPosX = 0.0300000;
                HudScale = RealHUDScale;                
            }
            else
            {
                HudScale = 0.6700000 * RealHUDScale;
                NewPosX = (AddPosX + (0.5000000 * (float(1) - HudScale))) + (HudScale * (0.0950000 + (0.0850000 * float(i))));
                NewPosY = SavedPosY;
            }
            WeaponBarAmmoFill[i].PosX = NewPosX;
            WeaponBarTint[i].PosX = NewPosX;
            WeaponBarTrim[i].PosX = NewPosX;
            WeaponBarIcon[i].PosX = NewPosX;
            WeaponBarAmmoFill[i].PosY = NewPosY + (0.0430000 * HudScale);
            WeaponBarTint[i].PosY = NewPosY;
            WeaponBarTrim[i].PosY = NewPosY;
            WeaponBarIcon[i].PosY = NewPosY;
        }
        // End:0x3B9
        if(bUsingCustomHUDColor)
        {
            WeaponBarTint[i].Tints[0] = CustomHUDColor;
            WeaponBarTint[i].Tints[1] = CustomHUDColor;            
        }
        else
        {
            WeaponBarTint[i].Tints[0] = default.WeaponBarTint[i].Tints[0];
            WeaponBarTint[i].Tints[1] = default.WeaponBarTint[i].Tints[1];
        }
        // End:0x4ED
        if(W == none)
        {
            WeaponBarAmmoFill[i].Scale = 0.0000000;
            WeaponBarIcon[i].Tints[TeamIndex].A = 50;
            WeaponBarIcon[i].Tints[TeamIndex].R = byte(255);
            WeaponBarIcon[i].Tints[TeamIndex].B = 0;
            WeaponBarIcon[i].Tints[TeamIndex].G = byte(255);
            WeaponBarIcon[i].WidgetTexture = BaseWeapons[i].default.IconMaterial;
            WeaponBarIcon[i].TextureCoords = BaseWeapons[i].default.IconCoords;            
        }
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
        i++;
        // [Loop Continue]
        goto J0x1D1;
    }
    // End:0x70D
    if(bSmallWeaponBar)
    {
        HudScale = RealHUDScale;
    }
    //return;    
}

simulated function UpdateHUD()
{
    // End:0x45
    if((PawnOwnerPRI != none) && PawnOwnerPRI.Team != none)
    {
        TeamIndex = Clamp(PawnOwnerPRI.Team.TeamIndex, 0, 1);        
    }
    else
    {
        TeamIndex = 1;
    }
    CalculateScore();
    CalculateHealth();
    HealthCount.Value = int(CurHealth);
    HealthIcon.Tints[TeamIndex].R = byte(float(255) - (float(255) * FClamp(CurHealth / float(100), 0.0000000, 1.0000000)));
    HealthIcon.Tints[TeamIndex].G = 0;
    HealthIcon.Tints[TeamIndex].B = byte(255);
    CalculateShield();
    ShieldCount.Value = int(CurShield);
    CalculateEnergy();
    AdrenalineReady = CurEnergy == MaxEnergy;
    CalculateAmmo();
    ammoCount.Value = int(CurAmmoPrimary);
    // End:0x1BE
    if(!TeamLinked)
    {
        RHud2[3].Tints[TeamIndex].R = byte(float(255) - (float(255) * FClamp(CurAmmoPrimary / MaxAmmoPrimary, 0.0000000, 1.0000000)));
        RHud2[3].Tints[TeamIndex].G = byte(float(255) * FClamp(CurAmmoPrimary / MaxAmmoPrimary, 0.0000000, 1.0000000));
        RHud2[3].Tints[TeamIndex].B = 0;
    }
    super.UpdateHUD();
    //return;    
}

function bool DrawLevelAction(Canvas C)
{
    local string LevelActionText;
    local Plane OldModulate;

    // End:0x3D
    if((int(Level.LevelAction) == int(0)) && Level.Pauser != none)
    {
        LevelActionText = LevelActionPaused;        
    }
    else
    {
        // End:0x7F
        if((int(Level.LevelAction) == int(1)) || int(Level.LevelAction) == int(4))
        {
            LevelActionText = LevelActionLoading;            
        }
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
    //return;    
}

function DisplayPortrait(PlayerReplicationInfo PRI)
{
    local Material NewPortrait;

    // End:0x0D
    if(LastPlayerIDTalking > 0)
    {
        return;
    }
    NewPortrait = PRI.GetPortrait();
    // End:0x2F
    if(NewPortrait == none)
    {
        return;
    }
    // End:0x45
    if(Portrait == none)
    {
        PortraitX = 1.0000000;
    }
    Portrait = NewPortrait;
    PortraitTime = Level.TimeSeconds + float(3);
    PortraitPRI = PRI;
    //return;    
}

simulated function Message(PlayerReplicationInfo PRI, coerce string Msg, name MsgType)
{
    super.Message(PRI, Msg, MsgType);
    //return;    
}

simulated function Font LoadLevelActionFont()
{
    return none;
    // End:0x70
    if(LevelActionFontFont == none)
    {
        LevelActionFontFont = Font(DynamicLoadObject(LevelActionFontName, Class'Engine.Font'));
        // End:0x70
        if(LevelActionFontFont == none)
        {
            Log((("Warning: " $ string(self)) $ " Couldn't dynamically load font ") $ LevelActionFontName);
        }
    }
    return LevelActionFontFont;
    //return;    
}

defaultproperties
{
    WeaponBarIcon[0]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=169,Y1=39,X2=241,Y2=77),TextureScale=0.5300000,DrawPivot=0,PosX=0.1390000,PosY=1.0000000,OffsetX=18,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WeaponBarIcon[1]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=245,Y1=39,X2=329,Y2=79),TextureScale=0.5300000,DrawPivot=0,PosX=0.2190000,PosY=1.0000000,OffsetX=18,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WeaponBarIcon[2]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=179,Y1=127,X2=241,Y2=175),TextureScale=0.5300000,DrawPivot=0,PosX=0.3000000,PosY=1.0000000,OffsetX=18,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WeaponBarIcon[3]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=250,Y1=110,X2=330,Y2=145),TextureScale=0.5300000,DrawPivot=0,PosX=0.3800000,PosY=1.0000000,OffsetX=18,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WeaponBarIcon[4]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=169,Y1=78,X2=244,Y2=124),TextureScale=0.5300000,DrawPivot=0,PosX=0.4600000,PosY=1.0000000,OffsetX=18,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WeaponBarIcon[5]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=246,Y1=80,X2=332,Y2=106),TextureScale=0.5300000,DrawPivot=0,PosX=0.5400000,PosY=1.0000000,OffsetX=18,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WeaponBarIcon[6]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=169,Y1=172,X2=245,Y2=208),TextureScale=0.5300000,DrawPivot=0,PosX=0.6210000,PosY=1.0000000,OffsetX=18,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WeaponBarIcon[7]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=253,Y1=146,X2=333,Y2=181),TextureScale=0.5300000,DrawPivot=0,PosX=0.7000000,PosY=1.0000000,OffsetX=18,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WeaponBarIcon[8]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=246,Y1=182,X2=331,Y2=210),TextureScale=0.5300000,DrawPivot=0,PosX=0.7800000,PosY=1.0000000,OffsetX=18,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    AmmoIcon=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=0,Y2=0),TextureScale=0.4500000,DrawPivot=0,PosX=1.0000000,PosY=0.8350000,OffsetX=-151,OffsetY=44,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    AdrenalineCount=(RenderStyle=5,MinDigitCount=0,TextureScale=0.1800000,DrawPivot=2,PosX=1.0000000,PosY=0.0000000,OffsetX=-260,OffsetY=40,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    HealthCount=(RenderStyle=5,MinDigitCount=0,TextureScale=0.2500000,DrawPivot=3,PosX=0.0000000,PosY=0.8350000,OffsetX=620,OffsetY=145,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    ammoCount=(RenderStyle=5,MinDigitCount=0,TextureScale=0.2500000,DrawPivot=2,PosX=1.0000000,PosY=0.8350000,OffsetX=-340,OffsetY=95,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    ShieldCount=(RenderStyle=5,MinDigitCount=0,TextureScale=0.2500000,DrawPivot=8,PosX=0.5000000,PosY=0.8350000,OffsetX=0,OffsetY=145,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    mySpread=(RenderStyle=5,MinDigitCount=2,TextureScale=0.0900000,DrawPivot=2,PosX=0.0000000,PosY=0.0000000,OffsetX=655,OffsetY=135,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    myRank=(RenderStyle=5,MinDigitCount=2,TextureScale=0.1500000,DrawPivot=2,PosX=0.0000000,PosY=0.0000000,OffsetX=150,OffsetY=40,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    MyScore=(RenderStyle=5,MinDigitCount=2,TextureScale=0.1800000,DrawPivot=2,PosX=0.0000000,PosY=0.0000000,OffsetX=560,OffsetY=40,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    LevelActionFontColor=(R=255,G=255,B=255,A=255)
    LevelActionPositionX=0.5000000
    LevelActionPositionY=0.2500000
    CurrentWeaponPositionX=0.8450000
    CurrentWeaponPositionY=0.9000000
    LogoScaleX=0.2500000
    LogoScaleY=0.2500000
    LogoPosX=0.4900000
    LogoPosY=0.1500000
    OldHUDScale=1.0000000
    ConsoleMessagePosX=0.0050000
    ConsoleMessagePosY=0.8250000
}