class wHudPart_KillMessage_Defence extends wHudPart_KillMessage
    transient
    native;

var localized string strBotName[24];
var IntBoxWH Icon_AIBot[24];
var SpriteWidget Icon_Kill;

function Initialize(HudBase myOwner, LevelInfo myLevel)
{
    local int lp1, GroupID;
    local string NickName;

    super.Initialize(myOwner, myLevel);
    lp1 = 0;
    J0x17:

    // End:0x21A [Loop If]
    if(lp1 < Level.GameMgr.NPCNameGroupParams.Length)
    {
        GroupID = Level.GameMgr.NPCNameGroupParams[lp1].GroupID;
        NickName = Level.GameMgr.NPCNameGroupParams[lp1].NickName;
        switch(GroupID)
        {
            // End:0xB0
            case 901:
                strBotName[0] = NickName;
                // End:0x210
                break;
            // End:0xC8
            case 902:
                strBotName[1] = NickName;
                // End:0x210
                break;
            // End:0xE1
            case 903:
                strBotName[10] = NickName;
                // End:0x210
                break;
            // End:0xFA
            case 904:
                strBotName[11] = NickName;
                // End:0x210
                break;
            // End:0x113
            case 905:
                strBotName[12] = NickName;
                // End:0x210
                break;
            // End:0x12C
            case 906:
                strBotName[13] = NickName;
                // End:0x210
                break;
            // End:0x145
            case 907:
                strBotName[2] = NickName;
                // End:0x210
                break;
            // End:0x15E
            case 908:
                strBotName[3] = NickName;
                // End:0x210
                break;
            // End:0x177
            case 909:
                strBotName[4] = NickName;
                // End:0x210
                break;
            // End:0x190
            case 910:
                strBotName[5] = NickName;
                // End:0x210
                break;
            // End:0x1A9
            case 911:
                strBotName[6] = NickName;
                // End:0x210
                break;
            // End:0x1C2
            case 912:
                strBotName[7] = NickName;
                // End:0x210
                break;
            // End:0x1DB
            case 913:
                strBotName[8] = NickName;
                // End:0x210
                break;
            // End:0x1F4
            case 914:
                strBotName[9] = NickName;
                // End:0x210
                break;
            // End:0x20D
            case 915:
                strBotName[14] = NickName;
                // End:0x210
                break;
            // End:0xFFFF
            default:
                break;
        }
        lp1++;
        // [Loop Continue]
        goto J0x17;
    }
    //return;    
}

function AddKillMessage(PlayerReplicationInfo KillerPRI, PlayerReplicationInfo victimPRI, Class<DamageType> DamageType, int Switch)
{
    local int iBotType, iRetSwitch;
    local string KillerName, VictimName;
    local KillMessageItem kItem;

    iBotType = Switch & 15;
    // End:0xC8
    if(iBotType > 0)
    {
        // End:0x92
        if(KillerPRI == none)
        {
            KillerName = strBotName[iBotType - 1];
            VictimName = victimPRI.PlayerName;
            DamageType = Class<DamageType>(DynamicLoadObject("WWeapons_Res.wWeaponRes_Special_AlienMelee", Class'Core.Class'));            
        }
        else
        {
            // End:0xC5
            if(victimPRI == none)
            {
                VictimName = strBotName[iBotType - 1];
                KillerName = KillerPRI.PlayerName;
            }
        }        
    }
    else
    {
        KillerName = KillerPRI.PlayerName;
        VictimName = victimPRI.PlayerName;
    }
    iRetSwitch = Switch >> 4;
    kItem = MakeKillMessageItem(KillerPRI, victimPRI, KillerName, VictimName, DamageType, iRetSwitch, KillerPRI.PlayerName == victimPRI.PlayerName, false, none);
    // End:0x1DE
    if(iBotType > 0)
    {
        kItem.iBotType = iBotType;
        // End:0x17C
        if(KillerPRI == none)
        {
            kItem.KillerIsBot = true;
        }
        // End:0x194
        if(victimPRI == none)
        {
            kItem.VictimIsBot = true;
        }
        // End:0x1D3
        if(kItem.KillerIsBot)
        {
            kItem.ImageKiller = Icon_Kill.WidgetTexture;
            kItem.ImageKillerCoord = Icon_AIBot[iBotType - 1];            
        }
        else
        {
            // End:0x1DE
            if(victimPRI == none)
            {
            }
        }
    }
    Log((((((((((((string(self) $ " / KillerPRI:") $ string(KillerPRI)) $ " / VictimPRI:") $ string(victimPRI)) $ " / iBotType :") $ string(iBotType)) $ " / DamageType :") $ string(DamageType)) $ " / Switch:") $ string(Switch)) $ " /ImageKiller :") $ string(kItem.ImageKiller));
    AddKillMessageItem(kItem);
    //return;    
}

function KillMessageItem MakeKillMessageItem(PlayerReplicationInfo KillerPRI, PlayerReplicationInfo victimPRI, string KillerName, string VictimName, Class<DamageType> DamageType, int Switch, bool NoKillerName, bool NoVictimName, Material overrideImage)
{
    local KillMessageItem Item;
    local Class<wWeaponRes_Base> resClass;
    local int msgIsHeadShot, msgIsAimShot, msgKillSuccession;

    msgIsHeadShot = Switch & 1;
    msgIsAimShot = Switch & 2;
    msgKillSuccession = Switch >> 2;
    Item.IsHeadShot = msgIsHeadShot > 0;
    Item.IsAimShot = msgIsAimShot > 0;
    Item.NumKillSuccession = msgKillSuccession;
    Item.KillerPRI = KillerPRI;
    Item.victimPRI = victimPRI;
    Item.KillerName = KillerName;
    Item.VictimName = VictimName;
    Item.DamageType = DamageType;
    Item.TimeToRemove = LevelOwner.TimeSeconds + MessageDuration;
    Item.NoKillerName = NoKillerName;
    Item.NoVictimName = NoVictimName;
    // End:0x35B
    if(overrideImage == none)
    {
        // End:0x153
        if(Class<wDamageMelee>(DamageType) != none)
        {
            resClass = Class<wWeaponRes_Base>(DynamicLoadObject("WWeapons_Res.wWeaponRes_Special_Melee", Class'Core.Class'));            
        }
        else
        {
            // End:0x1A7
            if(Class<wDamageAirStrike>(DamageType) != none)
            {
                resClass = Class<wWeaponRes_Base>(DynamicLoadObject("WWeapons_Res.wWeaponRes_Special_AirStrike", Class'Core.Class'));                
            }
            else
            {
                // End:0x1F6
                if(Class<wDamagePinpointBomb>(DamageType) != none)
                {
                    resClass = Class<wWeaponRes_Base>(DynamicLoadObject("WWeapons_Res.wWeaponRes_PinpointBomb", Class'Core.Class'));                    
                }
                else
                {
                    // End:0x24B
                    if(Class<wDamageHelicopter>(DamageType) != none)
                    {
                        resClass = Class<wWeaponRes_Base>(DynamicLoadObject("WWeapons_Res.wWeaponRes_Special_Helicopter", Class'Core.Class'));                        
                    }
                    else
                    {
                        // End:0x29A
                        if(Class<fell>(DamageType) != none)
                        {
                            resClass = Class<wWeaponRes_Base>(DynamicLoadObject("WWeapons_Res.wWeaponRes_Special_Fell", Class'Core.Class'));                            
                        }
                        else
                        {
                            // End:0x2EB
                            if(Class<wDamageStepOn>(DamageType) != none)
                            {
                                resClass = Class<wWeaponRes_Base>(DynamicLoadObject("WWeapons_Res.wWeaponRes_Special_StepOn", Class'Core.Class'));                                
                            }
                            else
                            {
                                // End:0x30B
                                if(Class<wWeaponRes_Base>(DamageType) != none)
                                {
                                    resClass = Class<wWeaponRes_Base>(DamageType);
                                }
                            }
                        }
                    }
                }
            }
        }
        // End:0x358
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

function Draw(Canvas C)
{
    local int lp1;
    local bool needToCacheAll, needCaching;
    local float CurrentY, currentY2;
    local KillMessageItem kItem;

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

    // End:0xA32 [Loop If]
    if(lp1 < KillMessages.Length)
    {
        needCaching = needToCacheAll || !kItem.Cached;
        kItem = KillMessages[lp1];
        // End:0x5B4
        if(needCaching)
        {
            kItem.Cached = true;
            kItem.CacheFontSize = float(FontSize) * _rY;
            // End:0x144
            if(kItem.NoKillerName)
            {
                kItem.CacheKillerNameWidth = 0.0000000;                
            }
            else
            {
                // End:0x16C
                if(kItem.KillerIsBot)
                {
                    kItem.CacheKillerNameWidth = 128.0000000 * _rX;                    
                }
                else
                {
                    C.BtrTextSize(kItem.KillerName, int(kItem.CacheFontSize), kItem.CacheKillerNameWidth, kItem.CacheKillerNameHeight);
                }
            }
            // End:0x1C6
            if(kItem.NoVictimName)
            {
                kItem.CacheVictimNameWidth = 0.0000000;                
            }
            else
            {
                C.BtrTextSize(kItem.VictimName, int(kItem.CacheFontSize), kItem.CacheVictimNameWidth, kItem.CacheVictimNameHeight);
            }
            // End:0x232
            if(kItem.Image == none)
            {
                kItem.CacheImageWidth = 32.0000000;
                kItem.CacheImageHeight = 32.0000000;                
            }
            else
            {
                kItem.CacheImageWidth = 99.0000000 * _rX;
                kItem.CacheImageHeight = 25.0000000 * _rY;
            }
            kItem.CacheHeight = kItem.CacheImageHeight;
            kItem.CacheTotalWidth = (((kItem.CacheKillerNameWidth + KillMessageWordSpacing) + kItem.CacheImageWidth) + KillMessageWordSpacing) + kItem.CacheVictimNameWidth;
            kItem.CacheKillerNameX1 = (C.ClipX - kItem.CacheTotalWidth) - (C.ClipX * MarginXFromRight);
            kItem.CacheKillerNameX2 = kItem.CacheKillerNameX1 + kItem.CacheKillerNameWidth;
            kItem.CacheImageX1 = (kItem.CacheKillerNameX1 + kItem.CacheKillerNameWidth) + KillMessageWordSpacing;
            kItem.CacheImageX2 = kItem.CacheImageX1 + kItem.CacheImageWidth;
            kItem.CacheVictimNameX1 = (kItem.CacheImageX1 + kItem.CacheImageWidth) + KillMessageWordSpacing;
            kItem.CacheVictimNameX2 = kItem.CacheImageX1 + kItem.CacheVictimNameWidth;
            kItem.CacheASImageWidth = 30.7691994 * _rX;
            kItem.CacheASImageHeight = 25.0000000 * _rY;
            kItem.CacheHSImageWidth = 30.7691994 * _rX;
            kItem.CacheHSImageHeight = 25.0000000 * _rY;
            kItem.CacheKSImageWidth = 99.0000000 * _rX;
            kItem.CacheKSImageHeight = 25.0000000 * _rY;
            // End:0x491
            if(kItem.IsAimShot)
            {
                kItem.CacheASImageX2 = kItem.CacheKillerNameX1;
                kItem.CacheASImageX1 = kItem.CacheASImageX2 - kItem.CacheASImageWidth;
                kItem.CacheTotalWidth = kItem.CacheTotalWidth + kItem.CacheASImageWidth;                
            }
            else
            {
                kItem.CacheASImageX2 = kItem.CacheKillerNameX1;
                kItem.CacheASImageX1 = kItem.CacheASImageX2;
            }
            // End:0x523
            if(kItem.IsHeadShot)
            {
                kItem.CacheHSImageX2 = kItem.CacheASImageX1;
                kItem.CacheHSImageX1 = kItem.CacheHSImageX2 - kItem.CacheHSImageWidth;
                kItem.CacheTotalWidth = kItem.CacheTotalWidth + kItem.CacheHSImageWidth;                
            }
            else
            {
                kItem.CacheHSImageX2 = kItem.CacheASImageX1;
                kItem.CacheHSImageX1 = kItem.CacheHSImageX2;
            }
            // End:0x5B4
            if(kItem.NumKillSuccession > 1)
            {
                kItem.CacheKSImageX2 = kItem.CacheHSImageX1;
                kItem.CacheKSImageX1 = kItem.CacheKSImageX2 - kItem.CacheKSImageWidth;
                kItem.CacheTotalWidth = kItem.CacheTotalWidth + kItem.CacheKSImageWidth;
            }
        }
        currentY2 = CurrentY + kItem.CacheHeight;
        // End:0x5F5
        if(!kItem.NoKillerName)
        {
            DrawKiller(C, kItem, CurrentY, currentY2);
        }
        // End:0x925
        if(kItem.Image != none)
        {
            C.SetPos(kItem.CacheImageX1, CurrentY);
            C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
            C.DrawTile(kItem.Image, kItem.CacheImageWidth, kItem.CacheImageHeight, float(kItem.ImageCoord.X), float(kItem.ImageCoord.Y), float(kItem.ImageCoord.W), float(kItem.ImageCoord.H));
            // End:0x779
            if(kItem.IsAimShot)
            {
                C.SetPos(kItem.CacheHSImageWidth, CurrentY);
                C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
                C.DrawTile(kItem.Image, kItem.CacheASImageWidth, kItem.CacheASImageHeight, float(Icon_HeadShot.X), float(Icon_HeadShot.Y), float(Icon_HeadShot.W), float(Icon_HeadShot.H));
            }
            // End:0x830
            if(kItem.IsHeadShot)
            {
                C.SetPos(kItem.CacheHSImageWidth, CurrentY);
                C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
                C.DrawTile(kItem.Image, kItem.CacheHSImageWidth, kItem.CacheHSImageHeight, float(Icon_HeadShot.X), float(Icon_HeadShot.Y), float(Icon_HeadShot.W), float(Icon_HeadShot.H));
            }
            // End:0x925
            if(kItem.NumKillSuccession > 1)
            {
                C.SetPos(kItem.CacheKSImageWidth, CurrentY);
                C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
                C.DrawTile(kItem.Image, kItem.CacheKSImageWidth, kItem.CacheKSImageHeight, float(Icon_KillSuccession[kItem.NumKillSuccession - 2].X), float(Icon_KillSuccession[kItem.NumKillSuccession - 2].Y), float(Icon_KillSuccession[kItem.NumKillSuccession - 2].W), float(Icon_KillSuccession[kItem.NumKillSuccession - 2].H));
            }
        }
        // End:0xA10
        if(!kItem.NoVictimName)
        {
            C.DrawColor = ShadowColor;
            C.BtrDrawTextJustified(kItem.VictimName, 1, kItem.CacheVictimNameX1 + float(ShadowX), CurrentY + float(ShadowY), kItem.CacheVictimNameX2 + float(ShadowX), currentY2 + float(ShadowY), int(kItem.CacheFontSize));
            C.DrawColor = kItem.VictimColor;
            C.BtrDrawTextJustified(kItem.VictimName, 1, kItem.CacheVictimNameX1, CurrentY, kItem.CacheVictimNameX2, currentY2, int(kItem.CacheFontSize));
        }
        CurrentY += (kItem.CacheImageHeight + KillMessageLineSpacing);
        lp1++;
        // [Loop Continue]
        goto J0xB4;
    }
    //return;    
}

function DrawKiller(Canvas C, KillMessageItem kItem, float CurrentY, float currentY2)
{
    local int iIndex;
    local float XL, YL, WL, HL;

    // End:0x120
    if(kItem.KillerIsBot)
    {
        XL = float(Icon_AIBot[kItem.iBotType - 1].X);
        YL = float(Icon_AIBot[kItem.iBotType - 1].Y);
        WL = float(Icon_AIBot[kItem.iBotType - 1].W);
        HL = float(Icon_AIBot[kItem.iBotType - 1].H);
        C.SetPos(kItem.CacheKillerNameX1, CurrentY);
        C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
        C.DrawTile(Icon_Kill.WidgetTexture, 128.0000000 * _rX, kItem.CacheImageHeight, XL, YL, WL, HL);        
    }
    else
    {
        C.DrawColor = ShadowColor;
        C.BtrDrawTextJustified(kItem.KillerName, 1, kItem.CacheKillerNameX1 + float(ShadowX), CurrentY + float(ShadowY), kItem.CacheKillerNameX2 + float(ShadowX), currentY2 + float(ShadowY), int(kItem.CacheFontSize));
        C.DrawColor = kItem.KillerColor;
        C.BtrDrawTextJustified(kItem.KillerName, 1, kItem.CacheKillerNameX1, CurrentY, kItem.CacheKillerNameX2, currentY2, int(kItem.CacheFontSize));
    }
    //return;    
}

function DrawVictim(Canvas C, KillMessageItem kItem, float CurrentY, float currentY2)
{
    //return;    
}

function int GetIndexTextureArea(string sBotName)
{
    local int lp1;

    lp1 = 0;
    J0x07:

    // End:0x38 [Loop If]
    if(lp1 < 24)
    {
        // End:0x2E
        if(sBotName ~= strBotName[lp1])
        {
            return lp1;
        }
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    return -1;
    //return;    
}

defaultproperties
{
    strBotName[0]="Alpha"
    strBotName[1]="Beta"
    strBotName[2]="Eta"
    strBotName[3]="Theta"
    strBotName[4]="Lota"
    strBotName[5]="Kappa"
    strBotName[6]="Ramda"
    strBotName[7]="Omega"
    strBotName[8]="Alien1"
    strBotName[9]="Alien3"
    strBotName[10]="Gamma"
    strBotName[11]="Delta"
    strBotName[12]="Epsilon"
    strBotName[13]="Zeta"
    strBotName[14]="Nemesis"
    Icon_AIBot[0]=(X=0,Y=2,W=128,H=32)
    Icon_AIBot[1]=(X=128,Y=2,W=128,H=32)
    Icon_AIBot[2]=(X=256,Y=2,W=128,H=32)
    Icon_AIBot[3]=(X=384,Y=2,W=128,H=32)
    Icon_AIBot[4]=(X=0,Y=36,W=128,H=32)
    Icon_AIBot[5]=(X=128,Y=36,W=128,H=32)
    Icon_AIBot[6]=(X=256,Y=36,W=128,H=32)
    Icon_AIBot[7]=(X=384,Y=36,W=128,H=32)
    Icon_AIBot[8]=(X=0,Y=70,W=128,H=32)
    Icon_AIBot[9]=(X=256,Y=70,W=128,H=32)
    Icon_AIBot[10]=(X=128,Y=36,W=128,H=32)
    Icon_AIBot[11]=(X=128,Y=36,W=128,H=32)
    Icon_AIBot[12]=(X=128,Y=36,W=128,H=32)
    Icon_AIBot[13]=(X=128,Y=36,W=128,H=32)
    Icon_AIBot[14]=(X=384,Y=172,W=128,H=32)
    Icon_Kill=(WidgetTexture=Texture'Warfare_UI_Item.KillIcon.Item_killIcon2',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=512,Y2=512),TextureScale=0.6500000,DrawPivot=8,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
}