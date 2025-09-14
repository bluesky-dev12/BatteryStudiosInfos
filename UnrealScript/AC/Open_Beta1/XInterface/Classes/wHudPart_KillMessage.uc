class wHudPart_KillMessage extends HudBase
    transient
    native;

struct native KillMessageItem
{
    var PlayerReplicationInfo KillerPRI;
    var PlayerReplicationInfo victimPRI;
    var string KillerName;
    var string VictimName;
    var Class<DamageType> DamageType;
    var float TimeToRemove;
    var bool NoKillerName;
    var bool NoVictimName;
    var Material Image;
    var IntBoxWH ImageCoord;
    var Color KillerColor;
    var Color VictimColor;
    var bool IsHeadShot;
    var bool IsAimShot;
    var int NumKillSuccession;
    var bool Cached;
    var float CacheFontSize;
    var float CacheHeight;
    var float CacheTotalWidth;
    var float CacheKillerNameWidth;
    var float CacheKillerNameHeight;
    var float CacheVictimNameWidth;
    var float CacheVictimNameHeight;
    var float CacheImageWidth;
    var float CacheImageHeight;
    var float CacheKillerNameX1;
    var float CacheKillerNameX2;
    var float CacheImageX1;
    var float CacheImageX2;
    var float CacheVictimNameX1;
    var float CacheVictimNameX2;
    var float CacheHSImageWidth;
    var float CacheHSImageHeight;
    var float CacheHSImageX1;
    var float CacheHSImageX2;
    var float CacheKSImageWidth;
    var float CacheKSImageHeight;
    var float CacheKSImageX1;
    var float CacheKSImageX2;
    var float CacheASImageWidth;
    var float CacheASImageHeight;
    var float CacheASImageX1;
    var float CacheASImageX2;
};

var HudBase HudOwner;
var LevelInfo LevelOwner;
var array<KillMessageItem> KillMessages;
var() Material RelatedBG;
var() SpriteWidget SpriteWeaponAirStrike;
var() SpriteWidget SpriteWeaponAR;
var() SpriteWidget SpriteWeaponFlameThrower;
var() SpriteWidget SpriteWeaponGR;
var() SpriteWidget SpriteWeaponHeadshot;
var() SpriteWidget SpriteWeaponMG;
var() SpriteWidget SpriteWeaponPistol;
var() SpriteWidget SpriteWeaponRPG;
var() SpriteWidget SpriteWeaponSMG;
var() SpriteWidget SpriteWeaponSR;
var() SpriteWidget SpriteWeaponMelee;
var() SpriteWidget SpriteWeaponHelicopter;
var() SpriteWidget SpriteWeaponUnknown;
var() SpriteWidget SpriteWeaponHelicopterKill;
var() SpriteWidget SpriteWeaponFell;
var() SpriteWidget SpriteWeaponStepOn;
var int CacheClipX;
var int CacheClipY;
var float MessageDuration;
var int MaxMessages;
var int FontSize;
var float KillMessageWordSpacing;
var float KillMessageLineSpacing;
var float MarginXFromRight;
var float MarginYFromTop;
var int ShadowX;
var int ShadowY;
var Color ShadowColor;
var IntBoxWH Icon_KillSuccession[15];
var IntBoxWH Icon_HeadShot;
var IntBoxWH Icon_AimShot;

function Precache()
{
    DynamicLoadObject(Class'WWeapons_Res.wWeaponRes_AK47'.default.szIcon_Kill, Class'Engine.Material');
    //return;    
}

function Initialize(HudBase myOwner, LevelInfo myLevel)
{
    HudOwner = myOwner;
    HudOwner.AddChildHudPart(self);
    LevelOwner = myLevel;
    Precache();
    //return;    
}

function KillMessageItem MakeKillMessageItem(PlayerReplicationInfo KillerPRI, PlayerReplicationInfo victimPRI, string KillerName, string VictimName, Class<DamageType> DamageType, int Switch, bool NoKillerName, bool NoVictimName, Material overrideImage)
{
    local KillMessageItem Item;
    local Class<wWeaponRes_Base> resClass;
    local int msgIsHeadShot, msgIsAimShot, msgKillSuccession, msgIsPinPointKill;

    msgIsHeadShot = Switch & 1;
    msgIsAimShot = Switch & 2;
    msgKillSuccession = Switch >> 2;
    Item.IsHeadShot = msgIsHeadShot > 0;
    Item.IsAimShot = msgIsAimShot > 0;
    Item.NumKillSuccession = msgKillSuccession;
    msgIsPinPointKill = Switch & 2048;
    Item.KillerPRI = KillerPRI;
    Item.victimPRI = victimPRI;
    Item.KillerName = KillerName;
    Item.VictimName = VictimName;
    Item.DamageType = DamageType;
    Item.TimeToRemove = LevelOwner.TimeSeconds + MessageDuration;
    Item.NoKillerName = NoKillerName;
    Item.NoVictimName = NoVictimName;
    // End:0x368
    if(overrideImage == none)
    {
        // End:0x165
        if(Class<wDamageMelee>(DamageType) != none)
        {
            resClass = Class<wWeaponRes_Base>(DynamicLoadObject("WWeapons_Res.wWeaponRes_Special_Melee", Class'Core.Class'));            
        }
        else
        {
            // End:0x203
            if(Class<wDamageAirStrike>(DamageType) != none)
            {
                // End:0x1BF
                if(msgIsPinPointKill > 0)
                {
                    resClass = Class<wWeaponRes_Base>(DynamicLoadObject("WWeapons_Res.wWeaponRes_PinpointBomb", Class'Core.Class'));                    
                }
                else
                {
                    resClass = Class<wWeaponRes_Base>(DynamicLoadObject("WWeapons_Res.wWeaponRes_Special_AirStrike", Class'Core.Class'));
                }                
            }
            else
            {
                // End:0x258
                if(Class<wDamageHelicopter>(DamageType) != none)
                {
                    resClass = Class<wWeaponRes_Base>(DynamicLoadObject("WWeapons_Res.wWeaponRes_Special_Helicopter", Class'Core.Class'));                    
                }
                else
                {
                    // End:0x2A7
                    if(Class<fell>(DamageType) != none)
                    {
                        resClass = Class<wWeaponRes_Base>(DynamicLoadObject("WWeapons_Res.wWeaponRes_Special_Fell", Class'Core.Class'));                        
                    }
                    else
                    {
                        // End:0x2F8
                        if(Class<wDamageStepOn>(DamageType) != none)
                        {
                            resClass = Class<wWeaponRes_Base>(DynamicLoadObject("WWeapons_Res.wWeaponRes_Special_StepOn", Class'Core.Class'));                            
                        }
                        else
                        {
                            // End:0x318
                            if(Class<wWeaponRes_Base>(DamageType) != none)
                            {
                                resClass = Class<wWeaponRes_Base>(DamageType);
                            }
                        }
                    }
                }
            }
        }
        // End:0x365
        if(resClass != none)
        {
            Item.Image = Material(DynamicLoadObject(resClass.default.szIcon_Kill, Class'Engine.Material'));
            Item.ImageCoord = resClass.default.ibIcon_Kill;
        }        
    }
    else
    {
        Item.Image = overrideImage;
    }
    Item.KillerColor = GetNameColor(KillerPRI);
    Item.VictimColor = GetNameColor(victimPRI);
    return Item;
    //return;    
}

function Color GetNameColor(PlayerReplicationInfo PRI)
{
    // End:0x90
    if(Locs(LevelOwner.GRI.GameClass) ~= Locs("WGame.wDeathMatch"))
    {
        // End:0x7B
        if(PRI.PlayerName == HudOwner.PlayerOwner.PlayerReplicationInfo.PlayerName)
        {
            return HudOwner.GetBaseTeamColor(0, 0);            
        }
        else
        {
            return HudOwner.GetBaseTeamColor(0, 1);
        }        
    }
    else
    {
        // End:0x144
        if(PRI == none)
        {
            // End:0x107
            if(HudOwner.PlayerOwner.PlayerReplicationInfo.Team.TeamIndex == 0)
            {
                return HudOwner.GetBaseTeamColor(HudOwner.PlayerOwner.PlayerReplicationInfo.Team.TeamIndex, 1);                
            }
            else
            {
                return HudOwner.GetBaseTeamColor(HudOwner.PlayerOwner.PlayerReplicationInfo.Team.TeamIndex, 0);
            }            
        }
        else
        {
            return HudOwner.GetBaseTeamColor(HudOwner.PlayerOwner.PlayerReplicationInfo.Team.TeamIndex, PRI.Team.TeamIndex);
        }
    }
    //return;    
}

function AddKillMessage(PlayerReplicationInfo KillerPRI, PlayerReplicationInfo victimPRI, Class<DamageType> DamageType, int Switch)
{
    AddKillMessageItem(MakeKillMessageItem(KillerPRI, victimPRI, KillerPRI.PlayerName, victimPRI.PlayerName, DamageType, Switch, KillerPRI.PlayerName == victimPRI.PlayerName, false, none));
    //return;    
}

function AddKillMessageItem(KillMessageItem Item)
{
    // End:0x16
    if(Item.DamageType == Class'Engine.Suicided')
    {
        return;
    }
    // End:0x60
    if((Item.KillerPRI.Team.TeamIndex == 255) || Item.victimPRI.Team.TeamIndex == 255)
    {
        return;
    }
    KillMessages[KillMessages.Length] = Item;
    // End:0x8A
    if(KillMessages.Length > MaxMessages)
    {
        KillMessages.Remove(0, 1);
    }
    //return;    
}

function Update()
{
    local int lp1;

    lp1 = KillMessages.Length - 1;
    J0x0F:

    // End:0x53 [Loop If]
    if(lp1 >= 0)
    {
        // End:0x49
        if(KillMessages[lp1].TimeToRemove < LevelOwner.TimeSeconds)
        {
            KillMessages.Remove(lp1, 1);
        }
        lp1--;
        // [Loop Continue]
        goto J0x0F;
    }
    //return;    
}

// Export UwHudPart_KillMessage::execDrawNative(FFrame&, void* const)
native function DrawNative(Canvas C)
{
    //native.C;        
}

function Begin(Canvas C)
{
    C.Flush();
    //return;    
}

function End(Canvas C)
{
    C.Flush();
    //return;    
}

function UpdateCache(Canvas C)
{
    local int lp1;
    local bool needToCacheAll, needCaching;

    // End:0x23
    if((HudOwner == none) || HudOwner.PlayerOwner == none)
    {
        return;
    }
    needToCacheAll = (float(CacheClipX) != C.ClipX) || float(CacheClipY) != C.ClipY;
    // End:0x92
    if(needToCacheAll)
    {
        CacheClipX = int(C.ClipX);
        CacheClipY = int(C.ClipY);
    }
    lp1 = 0;
    J0x99:

    // End:0x762 [Loop If]
    if(lp1 < KillMessages.Length)
    {
        needCaching = needToCacheAll || !KillMessages[lp1].Cached;
        // End:0x758
        if(needCaching)
        {
            KillMessages[lp1].Cached = true;
            KillMessages[lp1].CacheFontSize = float(FontSize) * _rY;
            // End:0x136
            if(KillMessages[lp1].NoKillerName)
            {
                KillMessages[lp1].CacheKillerNameWidth = 0.0000000;                
            }
            else
            {
                C.BtrTextSize(KillMessages[lp1].KillerName, int(KillMessages[lp1].CacheFontSize), KillMessages[lp1].CacheKillerNameWidth, KillMessages[lp1].CacheKillerNameHeight);
            }
            // End:0x1B4
            if(KillMessages[lp1].NoVictimName)
            {
                KillMessages[lp1].CacheVictimNameWidth = 0.0000000;                
            }
            else
            {
                C.BtrTextSize(KillMessages[lp1].VictimName, int(KillMessages[lp1].CacheFontSize), KillMessages[lp1].CacheVictimNameWidth, KillMessages[lp1].CacheVictimNameHeight);
            }
            // End:0x24A
            if(KillMessages[lp1].Image == none)
            {
                KillMessages[lp1].CacheImageWidth = 32.0000000;
                KillMessages[lp1].CacheImageHeight = 32.0000000;                
            }
            else
            {
                KillMessages[lp1].CacheImageWidth = 99.0000000 * _rX;
                KillMessages[lp1].CacheImageHeight = 25.0000000 * _rY;
            }
            KillMessages[lp1].CacheHeight = KillMessages[lp1].CacheImageHeight;
            KillMessages[lp1].CacheTotalWidth = (((KillMessages[lp1].CacheKillerNameWidth + KillMessageWordSpacing) + KillMessages[lp1].CacheImageWidth) + KillMessageWordSpacing) + KillMessages[lp1].CacheVictimNameWidth;
            KillMessages[lp1].CacheKillerNameX1 = (C.ClipX - KillMessages[lp1].CacheTotalWidth) - (C.ClipX * MarginXFromRight);
            KillMessages[lp1].CacheKillerNameX2 = KillMessages[lp1].CacheKillerNameX1 + KillMessages[lp1].CacheKillerNameWidth;
            KillMessages[lp1].CacheImageX1 = (KillMessages[lp1].CacheKillerNameX1 + KillMessages[lp1].CacheKillerNameWidth) + KillMessageWordSpacing;
            KillMessages[lp1].CacheImageX2 = KillMessages[lp1].CacheImageX1 + KillMessages[lp1].CacheImageWidth;
            KillMessages[lp1].CacheVictimNameX1 = (KillMessages[lp1].CacheImageX1 + KillMessages[lp1].CacheImageWidth) + KillMessageWordSpacing;
            KillMessages[lp1].CacheVictimNameX2 = KillMessages[lp1].CacheImageX1 + KillMessages[lp1].CacheVictimNameWidth;
            KillMessages[lp1].CacheASImageWidth = 30.7691994 * _rX;
            KillMessages[lp1].CacheASImageHeight = 25.0000000 * _rY;
            KillMessages[lp1].CacheHSImageWidth = 30.7691994 * _rX;
            KillMessages[lp1].CacheHSImageHeight = 25.0000000 * _rY;
            KillMessages[lp1].CacheKSImageWidth = 99.0000000 * _rX;
            KillMessages[lp1].CacheKSImageHeight = 25.0000000 * _rY;
            // End:0x599
            if(KillMessages[lp1].IsAimShot)
            {
                KillMessages[lp1].CacheASImageX2 = KillMessages[lp1].CacheKillerNameX1;
                KillMessages[lp1].CacheASImageX1 = KillMessages[lp1].CacheASImageX2 - KillMessages[lp1].CacheASImageWidth;
                KillMessages[lp1].CacheTotalWidth = KillMessages[lp1].CacheTotalWidth + KillMessages[lp1].CacheASImageWidth;                
            }
            else
            {
                KillMessages[lp1].CacheASImageX2 = KillMessages[lp1].CacheKillerNameX1;
                KillMessages[lp1].CacheASImageX1 = KillMessages[lp1].CacheASImageX2;
            }
            // End:0x679
            if(KillMessages[lp1].IsHeadShot)
            {
                KillMessages[lp1].CacheHSImageX2 = KillMessages[lp1].CacheASImageX1;
                KillMessages[lp1].CacheHSImageX1 = KillMessages[lp1].CacheHSImageX2 - KillMessages[lp1].CacheHSImageWidth;
                KillMessages[lp1].CacheTotalWidth = KillMessages[lp1].CacheTotalWidth + KillMessages[lp1].CacheHSImageWidth;                
            }
            else
            {
                KillMessages[lp1].CacheHSImageX2 = KillMessages[lp1].CacheASImageX1;
                KillMessages[lp1].CacheHSImageX1 = KillMessages[lp1].CacheHSImageX2;
            }
            // End:0x758
            if(KillMessages[lp1].NumKillSuccession > 1)
            {
                KillMessages[lp1].CacheKSImageX2 = KillMessages[lp1].CacheHSImageX1;
                KillMessages[lp1].CacheKSImageX1 = KillMessages[lp1].CacheKSImageX2 - KillMessages[lp1].CacheKSImageWidth;
                KillMessages[lp1].CacheTotalWidth = KillMessages[lp1].CacheTotalWidth + KillMessages[lp1].CacheKSImageWidth;
            }
        }
        lp1++;
        // [Loop Continue]
        goto J0x99;
    }
    //return;    
}

function DrawOnlyText(Canvas C)
{
    local int lp1;
    local float CurrentY, currentY2;

    // End:0x23
    if((HudOwner == none) || HudOwner.PlayerOwner == none)
    {
        return;
    }
    CurrentY = C.ClipY * MarginYFromTop;
    lp1 = 0;
    J0x45:

    // End:0x2E8 [Loop If]
    if(lp1 < KillMessages.Length)
    {
        currentY2 = CurrentY + KillMessages[lp1].CacheHeight;
        // End:0x199
        if(!KillMessages[lp1].NoKillerName)
        {
            C.DrawColor = ShadowColor;
            C.BtrDrawTextJustified(KillMessages[lp1].KillerName, 1, KillMessages[lp1].CacheKillerNameX1 + float(ShadowX), CurrentY + float(ShadowY), KillMessages[lp1].CacheKillerNameX2 + float(ShadowX), currentY2 + float(ShadowY), int(KillMessages[lp1].CacheFontSize));
            C.DrawColor = KillMessages[lp1].KillerColor;
            C.BtrDrawTextJustified(KillMessages[lp1].KillerName, 1, KillMessages[lp1].CacheKillerNameX1, CurrentY, KillMessages[lp1].CacheKillerNameX2, currentY2, int(KillMessages[lp1].CacheFontSize));
        }
        // End:0x2C0
        if(!KillMessages[lp1].NoVictimName)
        {
            C.DrawColor = ShadowColor;
            C.BtrDrawTextJustified(KillMessages[lp1].VictimName, 1, KillMessages[lp1].CacheVictimNameX1 + float(ShadowX), CurrentY + float(ShadowY), KillMessages[lp1].CacheVictimNameX2 + float(ShadowX), currentY2 + float(ShadowY), int(KillMessages[lp1].CacheFontSize));
            C.DrawColor = KillMessages[lp1].VictimColor;
            C.BtrDrawTextJustified(KillMessages[lp1].VictimName, 1, KillMessages[lp1].CacheVictimNameX1, CurrentY, KillMessages[lp1].CacheVictimNameX2, currentY2, int(KillMessages[lp1].CacheFontSize));
        }
        CurrentY += (KillMessages[lp1].CacheImageHeight + KillMessageLineSpacing);
        lp1++;
        // [Loop Continue]
        goto J0x45;
    }
    //return;    
}

function DrawOnlyImage(Canvas C)
{
    local int lp1;
    local float CurrentY, currentY2;

    // End:0x23
    if((HudOwner == none) || HudOwner.PlayerOwner == none)
    {
        return;
    }
    CurrentY = C.ClipY * MarginYFromTop;
    lp1 = 0;
    J0x45:

    // End:0x19D [Loop If]
    if(lp1 < KillMessages.Length)
    {
        currentY2 = CurrentY + KillMessages[lp1].CacheHeight;
        // End:0x175
        if(KillMessages[lp1].Image != none)
        {
            C.SetPos(KillMessages[lp1].CacheImageX1, CurrentY);
            C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
            C.DrawTile(KillMessages[lp1].Image, KillMessages[lp1].CacheImageWidth, KillMessages[lp1].CacheImageHeight, float(KillMessages[lp1].ImageCoord.X), float(KillMessages[lp1].ImageCoord.Y), float(KillMessages[lp1].ImageCoord.W), float(KillMessages[lp1].ImageCoord.H));
        }
        CurrentY += (KillMessages[lp1].CacheImageHeight + KillMessageLineSpacing);
        lp1++;
        // [Loop Continue]
        goto J0x45;
    }
    //return;    
}

function Draw(Canvas C)
{
    local int lp1;
    local bool needToCacheAll, needCaching;
    local float CurrentY, currentY2;

    // End:0x23
    if((HudOwner == none) || HudOwner.PlayerOwner == none)
    {
        return;
    }
    needToCacheAll = (float(CacheClipX) != C.ClipX) || float(CacheClipY) != C.ClipY;
    // End:0x92
    if(needToCacheAll)
    {
        CacheClipX = int(C.ClipX);
        CacheClipY = int(C.ClipY);
    }
    CurrentY = C.ClipY * MarginYFromTop;
    lp1 = 0;
    J0xB4:

    // End:0xDDE [Loop If]
    if(lp1 < KillMessages.Length)
    {
        needCaching = needToCacheAll || !KillMessages[lp1].Cached;
        // End:0x773
        if(needCaching)
        {
            KillMessages[lp1].Cached = true;
            KillMessages[lp1].CacheFontSize = float(FontSize) * _rY;
            // End:0x151
            if(KillMessages[lp1].NoKillerName)
            {
                KillMessages[lp1].CacheKillerNameWidth = 0.0000000;                
            }
            else
            {
                C.BtrTextSize(KillMessages[lp1].KillerName, int(KillMessages[lp1].CacheFontSize), KillMessages[lp1].CacheKillerNameWidth, KillMessages[lp1].CacheKillerNameHeight);
            }
            // End:0x1CF
            if(KillMessages[lp1].NoVictimName)
            {
                KillMessages[lp1].CacheVictimNameWidth = 0.0000000;                
            }
            else
            {
                C.BtrTextSize(KillMessages[lp1].VictimName, int(KillMessages[lp1].CacheFontSize), KillMessages[lp1].CacheVictimNameWidth, KillMessages[lp1].CacheVictimNameHeight);
            }
            // End:0x265
            if(KillMessages[lp1].Image == none)
            {
                KillMessages[lp1].CacheImageWidth = 32.0000000;
                KillMessages[lp1].CacheImageHeight = 32.0000000;                
            }
            else
            {
                KillMessages[lp1].CacheImageWidth = 99.0000000 * _rX;
                KillMessages[lp1].CacheImageHeight = 25.0000000 * _rY;
            }
            KillMessages[lp1].CacheHeight = KillMessages[lp1].CacheImageHeight;
            KillMessages[lp1].CacheTotalWidth = (((KillMessages[lp1].CacheKillerNameWidth + KillMessageWordSpacing) + KillMessages[lp1].CacheImageWidth) + KillMessageWordSpacing) + KillMessages[lp1].CacheVictimNameWidth;
            KillMessages[lp1].CacheKillerNameX1 = (C.ClipX - KillMessages[lp1].CacheTotalWidth) - (C.ClipX * MarginXFromRight);
            KillMessages[lp1].CacheKillerNameX2 = KillMessages[lp1].CacheKillerNameX1 + KillMessages[lp1].CacheKillerNameWidth;
            KillMessages[lp1].CacheImageX1 = (KillMessages[lp1].CacheKillerNameX1 + KillMessages[lp1].CacheKillerNameWidth) + KillMessageWordSpacing;
            KillMessages[lp1].CacheImageX2 = KillMessages[lp1].CacheImageX1 + KillMessages[lp1].CacheImageWidth;
            KillMessages[lp1].CacheVictimNameX1 = (KillMessages[lp1].CacheImageX1 + KillMessages[lp1].CacheImageWidth) + KillMessageWordSpacing;
            KillMessages[lp1].CacheVictimNameX2 = KillMessages[lp1].CacheImageX1 + KillMessages[lp1].CacheVictimNameWidth;
            KillMessages[lp1].CacheASImageWidth = 30.7691994 * _rX;
            KillMessages[lp1].CacheASImageHeight = 25.0000000 * _rY;
            KillMessages[lp1].CacheHSImageWidth = 30.7691994 * _rX;
            KillMessages[lp1].CacheHSImageHeight = 25.0000000 * _rY;
            KillMessages[lp1].CacheKSImageWidth = 99.0000000 * _rX;
            KillMessages[lp1].CacheKSImageHeight = 25.0000000 * _rY;
            // End:0x5B4
            if(KillMessages[lp1].IsAimShot)
            {
                KillMessages[lp1].CacheASImageX2 = KillMessages[lp1].CacheKillerNameX1;
                KillMessages[lp1].CacheASImageX1 = KillMessages[lp1].CacheASImageX2 - KillMessages[lp1].CacheASImageWidth;
                KillMessages[lp1].CacheTotalWidth = KillMessages[lp1].CacheTotalWidth + KillMessages[lp1].CacheASImageWidth;                
            }
            else
            {
                KillMessages[lp1].CacheASImageX2 = KillMessages[lp1].CacheKillerNameX1;
                KillMessages[lp1].CacheASImageX1 = KillMessages[lp1].CacheASImageX2;
            }
            // End:0x694
            if(KillMessages[lp1].IsHeadShot)
            {
                KillMessages[lp1].CacheHSImageX2 = KillMessages[lp1].CacheASImageX1;
                KillMessages[lp1].CacheHSImageX1 = KillMessages[lp1].CacheHSImageX2 - KillMessages[lp1].CacheHSImageWidth;
                KillMessages[lp1].CacheTotalWidth = KillMessages[lp1].CacheTotalWidth + KillMessages[lp1].CacheHSImageWidth;                
            }
            else
            {
                KillMessages[lp1].CacheHSImageX2 = KillMessages[lp1].CacheASImageX1;
                KillMessages[lp1].CacheHSImageX1 = KillMessages[lp1].CacheHSImageX2;
            }
            // End:0x773
            if(KillMessages[lp1].NumKillSuccession > 1)
            {
                KillMessages[lp1].CacheKSImageX2 = KillMessages[lp1].CacheHSImageX1;
                KillMessages[lp1].CacheKSImageX1 = KillMessages[lp1].CacheKSImageX2 - KillMessages[lp1].CacheKSImageWidth;
                KillMessages[lp1].CacheTotalWidth = KillMessages[lp1].CacheTotalWidth + KillMessages[lp1].CacheKSImageWidth;
            }
        }
        currentY2 = CurrentY + KillMessages[lp1].CacheHeight;
        // End:0x8B7
        if(!KillMessages[lp1].NoKillerName)
        {
            C.DrawColor = ShadowColor;
            C.BtrDrawTextJustified(KillMessages[lp1].KillerName, 1, KillMessages[lp1].CacheKillerNameX1 + float(ShadowX), CurrentY + float(ShadowY), KillMessages[lp1].CacheKillerNameX2 + float(ShadowX), currentY2 + float(ShadowY), int(KillMessages[lp1].CacheFontSize));
            C.DrawColor = KillMessages[lp1].KillerColor;
            C.BtrDrawTextJustified(KillMessages[lp1].KillerName, 1, KillMessages[lp1].CacheKillerNameX1, CurrentY, KillMessages[lp1].CacheKillerNameX2, currentY2, int(KillMessages[lp1].CacheFontSize));
        }
        // End:0xC8F
        if(KillMessages[lp1].Image != none)
        {
            C.SetPos(KillMessages[lp1].CacheImageX1, CurrentY);
            C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
            C.DrawTile(KillMessages[lp1].Image, KillMessages[lp1].CacheImageWidth, KillMessages[lp1].CacheImageHeight, float(KillMessages[lp1].ImageCoord.X), float(KillMessages[lp1].ImageCoord.Y), float(KillMessages[lp1].ImageCoord.W), float(KillMessages[lp1].ImageCoord.H));
            // End:0xA8F
            if(KillMessages[lp1].IsAimShot)
            {
                C.SetPos(KillMessages[lp1].CacheHSImageWidth, CurrentY);
                C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
                C.DrawTile(KillMessages[lp1].Image, KillMessages[lp1].CacheASImageWidth, KillMessages[lp1].CacheASImageHeight, float(Icon_HeadShot.X), float(Icon_HeadShot.Y), float(Icon_HeadShot.W), float(Icon_HeadShot.H));
            }
            // End:0xB64
            if(KillMessages[lp1].IsHeadShot)
            {
                C.SetPos(KillMessages[lp1].CacheHSImageWidth, CurrentY);
                C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
                C.DrawTile(KillMessages[lp1].Image, KillMessages[lp1].CacheHSImageWidth, KillMessages[lp1].CacheHSImageHeight, float(Icon_HeadShot.X), float(Icon_HeadShot.Y), float(Icon_HeadShot.W), float(Icon_HeadShot.H));
            }
            // End:0xC8F
            if(KillMessages[lp1].NumKillSuccession > 1)
            {
                C.SetPos(KillMessages[lp1].CacheKSImageWidth, CurrentY);
                C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
                C.DrawTile(KillMessages[lp1].Image, KillMessages[lp1].CacheKSImageWidth, KillMessages[lp1].CacheKSImageHeight, float(Icon_KillSuccession[KillMessages[lp1].NumKillSuccession - 2].X), float(Icon_KillSuccession[KillMessages[lp1].NumKillSuccession - 2].Y), float(Icon_KillSuccession[KillMessages[lp1].NumKillSuccession - 2].W), float(Icon_KillSuccession[KillMessages[lp1].NumKillSuccession - 2].H));
            }
        }
        // End:0xDB6
        if(!KillMessages[lp1].NoVictimName)
        {
            C.DrawColor = ShadowColor;
            C.BtrDrawTextJustified(KillMessages[lp1].VictimName, 1, KillMessages[lp1].CacheVictimNameX1 + float(ShadowX), CurrentY + float(ShadowY), KillMessages[lp1].CacheVictimNameX2 + float(ShadowX), currentY2 + float(ShadowY), int(KillMessages[lp1].CacheFontSize));
            C.DrawColor = KillMessages[lp1].VictimColor;
            C.BtrDrawTextJustified(KillMessages[lp1].VictimName, 1, KillMessages[lp1].CacheVictimNameX1, CurrentY, KillMessages[lp1].CacheVictimNameX2, currentY2, int(KillMessages[lp1].CacheFontSize));
        }
        CurrentY += (KillMessages[lp1].CacheImageHeight + KillMessageLineSpacing);
        lp1++;
        // [Loop Continue]
        goto J0xB4;
    }
    //return;    
}

defaultproperties
{
    SpriteWeaponAirStrike=(WidgetTexture=Texture'Warfare_UI_Item.KillIcon.Item_Kill_WP_ETC_TargetIndicator',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=32,Y2=35),TextureScale=0.6500000,DrawPivot=8,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    SpriteWeaponAR=(WidgetTexture=Texture'Warfare_UI_Item.KillIcon.Item_Kill_WP_AR_AK47',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=58,Y2=19),TextureScale=0.6500000,DrawPivot=8,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    SpriteWeaponFlameThrower=(WidgetTexture=Texture'Warfare_UI_Item.KillIcon.Item_Kill_WP_HW_M2B',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=63,Y2=31),TextureScale=0.6500000,DrawPivot=8,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    SpriteWeaponGR=(WidgetTexture=Texture'Warfare_UI_Item.KillIcon.Item_Kill_WP_GR_Frag_A',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=21,Y2=25),TextureScale=0.6500000,DrawPivot=8,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    SpriteWeaponHeadshot=(WidgetTexture=Texture'Warfare_UI_Item.KillIcon.Item_Kill_Head_Shot',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=27,Y2=28),TextureScale=0.6500000,DrawPivot=8,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    SpriteWeaponMG=(WidgetTexture=Texture'Warfare_UI_Item.KillIcon.Item_Kill_WP_HW_M249',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=34,Y2=26),TextureScale=0.6500000,DrawPivot=8,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    SpriteWeaponPistol=(WidgetTexture=Texture'Warfare_UI_Item.KillIcon.Item_Kill_WP_PS_Glock17',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=27,Y2=20),TextureScale=0.6500000,DrawPivot=8,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    SpriteWeaponRPG=(WidgetTexture=Texture'Warfare_UI_Item.KillIcon.Item_Kill_WP_HW_RPG7',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=57,Y2=15),TextureScale=0.6500000,DrawPivot=8,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    SpriteWeaponSMG=(WidgetTexture=Texture'Warfare_UI_Item.KillIcon.Item_Kill_WP_SMG_MP5',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=51,Y2=21),TextureScale=0.6500000,DrawPivot=8,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    SpriteWeaponSR=(WidgetTexture=Texture'Warfare_UI_Item.KillIcon.Item_Kill_WP_SR_CheyTacLRRS',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=57,Y2=16),TextureScale=0.6500000,DrawPivot=8,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    SpriteWeaponMelee=(WidgetTexture=Texture'Warfare_UI_Item.KillIcon.Item_Kill_Melee_Attack',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=31,Y2=31),TextureScale=0.6500000,DrawPivot=8,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    SpriteWeaponHelicopter=(WidgetTexture=Texture'Warfare_UI_Item.KillIcon.Item_Kill_Helicopter',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=31,Y2=31),TextureScale=0.6500000,DrawPivot=8,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    SpriteWeaponUnknown=(WidgetTexture=Texture'Warfare_UI_Item.KillIcon.Item_Kill_Carblast',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=34,Y2=26),TextureScale=0.6500000,DrawPivot=8,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    SpriteWeaponHelicopterKill=(WidgetTexture=Texture'Warfare_UI_Item.KillIcon.Item_Kill_Helicopter_down',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=31,Y2=31),TextureScale=0.6500000,DrawPivot=8,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    SpriteWeaponFell=(WidgetTexture=Texture'Warfare_UI_Item.KillIcon.Item_Kill_Fall',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=31,Y2=31),TextureScale=0.6500000,DrawPivot=8,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    SpriteWeaponStepOn=(WidgetTexture=Texture'Warfare_UI_Item.KillIcon.Item_Kill_Step_On',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=31,Y2=31),TextureScale=0.6500000,DrawPivot=8,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    MessageDuration=15.0000000
    MaxMessages=5
    FontSize=9
    KillMessageLineSpacing=3.0000000
    MarginXFromRight=0.0200000
    MarginYFromTop=0.0200000
    ShadowX=1
    ShadowY=1
    ShadowColor=(R=0,G=0,B=0,A=160)
    Icon_KillSuccession[0]=(X=0,Y=614,W=128,H=32)
    Icon_KillSuccession[1]=(X=128,Y=614,W=128,H=32)
    Icon_KillSuccession[2]=(X=256,Y=614,W=128,H=32)
    Icon_KillSuccession[3]=(X=384,Y=614,W=128,H=32)
    Icon_KillSuccession[4]=(X=0,Y=648,W=128,H=32)
    Icon_KillSuccession[5]=(X=128,Y=648,W=128,H=32)
    Icon_KillSuccession[6]=(X=256,Y=648,W=128,H=32)
    Icon_KillSuccession[7]=(X=384,Y=648,W=128,H=32)
    Icon_KillSuccession[8]=(X=0,Y=682,W=128,H=32)
    Icon_KillSuccession[9]=(X=128,Y=682,W=128,H=32)
    Icon_KillSuccession[10]=(X=256,Y=682,W=128,H=32)
    Icon_KillSuccession[11]=(X=384,Y=682,W=128,H=32)
    Icon_KillSuccession[12]=(X=0,Y=716,W=128,H=32)
    Icon_KillSuccession[13]=(X=128,Y=716,W=128,H=32)
    Icon_KillSuccession[14]=(X=256,Y=716,W=128,H=32)
    Icon_HeadShot=(X=40,Y=920,W=40,H=32)
    Icon_AimShot=(X=0,Y=886,W=40,H=32)
}