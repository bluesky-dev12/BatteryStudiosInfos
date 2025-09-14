/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\DMStatsScreen.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:34
 *	Functions:3
 *
 *******************************************************************************/
class DMStatsScreen extends ScoreBoard
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var UnrealPlayer PlayerOwner;
var TeamPlayerReplicationInfo PRI;
var localized string StatsString;
var localized string AwardsString;
var localized string FirstBloodString;
var localized string SuicidesString;
var localized string LongestSpreeString;
var localized string FlakMonkey;
var localized string ComboWhore;
var localized string HeadHunter;
var localized string RoadRampage;
var localized string DaredevilString;
var localized string FlagTouches;
var localized string FlagReturns;
var localized string GoalsScored;
var localized string HatTrick;
var localized string KillString[7];
var localized string AdrenalineCombos;
var localized string ComboNames[5];
var localized string KillsByWeapon;
var localized string CombatResults;
var localized string Kills;
var localized string Deaths;
var localized string Suicides;
var localized string NextStatsString;
var localized string WeaponString;
var localized string DeathsBy;
var localized string deathsholding;
var localized string EfficiencyString;
var localized string WaitingForStats;
var localized string KillsByVehicle;
var localized string VehicleString;
var float LastUpdateTime;
var Material BoxMaterial;

static function string MakeColorCode(Color NewColor)
{
    // End:0x1f
    if(NewColor.R == 0)
    {
        NewColor.R = 1;
    }
    // End:0x3e
    if(NewColor.G == 0)
    {
        NewColor.G = 1;
    }
    // End:0x5d
    if(NewColor.B == 0)
    {
        NewColor.B = 1;
    }
    return Chr(27) $ Chr(NewColor.R) $ Chr(NewColor.G) $ Chr(NewColor.B);
}

simulated event DrawScoreboard(Canvas C)
{
    local int i, j, temp, AwardsNum, CombosNum, GoalsNum,
	    Ordered;

    local float OffsetY, AwardsOffsetY, CombosOffsetY, GoalsOffsetY, CombatOffsetY, WeaponsOffsetY,
	    VehiclesOffsetY, AwardsBoxSizeY, CombosBoxSizeY, GoalsBoxSizeY, CombatBoxSizeY,
	    WeaponsBoxSizeY, VehiclesBoxSizeY, XL, LargeYL, IndentX,
	    AwardWidth, WeaponWidth, AwardX, AwardsBoxX, CombatBoxX,
	    GoalsBoxX, CombosBoxX;

    // End:0x52
    if(PlayerOwner == none)
    {
        PlayerOwner = UnrealPlayer(Owner);
        // End:0x52
        if(PlayerOwner == none)
        {
            C.SetPos(IndentX, IndentX);
            C.DrawText(WaitingForStats);
            return;
        }
    }
    // End:0xad
    if(PRI == none)
    {
        PRI = TeamPlayerReplicationInfo(PlayerOwner.PlayerReplicationInfo);
        // End:0xad
        if(PRI == none)
        {
            C.SetPos(IndentX, IndentX);
            C.DrawText(WaitingForStats);
            return;
        }
    }
    // End:0xf3
    if(Level.TimeSeconds - LastUpdateTime > float(2))
    {
        LastUpdateTime = Level.TimeSeconds;
        PlayerOwner.ServerUpdateStats(PRI);
    }
    C.DrawColor = HudClass.default.WhiteColor;
    C.Font = PlayerOwner.myHUD.GetFontSizeIndex(C, -2);
    C.StrLen(StatsString, XL, LargeYL);
    IndentX = 0.0150 * C.ClipX;
    AwardsOffsetY = IndentX + float(2) * LargeYL;
    // End:0x1a8
    if(PRI.bFirstBlood)
    {
        ++ AwardsNum;
    }
    i = 0;
    J0x1af:
    // End:0x1e8 [While If]
    if(i < 6)
    {
        // End:0x1de
        if(PRI.Spree[i] > 0)
        {
            ++ AwardsNum;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1af;
    }
    i = 0;
    J0x1ef:
    // End:0x228 [While If]
    if(i < 7)
    {
        // End:0x21e
        if(PRI.MultiKills[i] > 0)
        {
            ++ AwardsNum;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1ef;
    }
    // End:0x244
    if(PRI.flakcount >= 15)
    {
        ++ AwardsNum;
    }
    // End:0x260
    if(PRI.combocount >= 15)
    {
        ++ AwardsNum;
    }
    // End:0x27c
    if(PRI.headcount >= 15)
    {
        ++ AwardsNum;
    }
    // End:0x298
    if(PRI.ranovercount >= 10)
    {
        ++ AwardsNum;
    }
    // End:0x2b3
    if(PRI.DaredevilPoints > 0)
    {
        ++ AwardsNum;
    }
    // End:0x2cf
    if(PRI.GoalsScored >= 3)
    {
        ++ AwardsNum;
    }
    C.StrLen("REALLY X999" $ KillString[5], AwardWidth, LargeYL);
    // End:0x3d3
    if(AwardsNum > 0)
    {
        AwardsBoxX = FMin(0.90 * C.ClipX, float(Min(3, AwardsNum)) * AwardWidth + float(4) * IndentX);
        AwardsBoxSizeY = LargeYL + float(2 + AwardsNum - 1 / 3) * LargeYL;
        C.SetPos(IndentX, AwardsOffsetY);
        C.DrawColor = HudClass.default.PurpleColor;
        C.DrawColor.R = 128;
        C.DrawTileStretched(BoxMaterial, AwardsBoxX, AwardsBoxSizeY);
    }
    CombosOffsetY = AwardsOffsetY + AwardsBoxSizeY + 0.50 * LargeYL;
    i = 0;
    J0x3fa:
    // End:0x433 [While If]
    if(i < 5)
    {
        // End:0x429
        if(PRI.Combos[i] > 0)
        {
            ++ CombosNum;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x3fa;
    }
    // End:0x4ea
    if(CombosNum > 0)
    {
        C.DrawColor = HudClass.default.BlueColor;
        CombosBoxSizeY = LargeYL + float(1 + CombosNum) * LargeYL;
        C.SetPos(IndentX, CombosOffsetY);
        C.StrLen(AdrenalineCombos, XL, LargeYL);
        CombosBoxX = 4.0 * IndentX + float(2) * XL;
        C.DrawTileStretched(BoxMaterial, CombosBoxX, CombosBoxSizeY);
    }
    C.DrawColor = HudClass.default.GreenColor;
    CombatOffsetY = CombosOffsetY + CombosBoxSizeY + 0.50 * LargeYL;
    CombatBoxSizeY = LargeYL + float(4) * LargeYL;
    C.SetPos(IndentX, CombatOffsetY);
    C.StrLen(CombatResults, XL, LargeYL);
    CombatBoxX = XL + float(4) * IndentX;
    C.DrawTileStretched(BoxMaterial, CombatBoxX, CombatBoxSizeY);
    GoalsOffsetY = CombatOffsetY;
    // End:0x5cf
    if(PRI.GoalsScored > 0)
    {
        ++ GoalsNum;
    }
    // End:0x5ea
    if(PRI.FlagTouches > 0)
    {
        ++ GoalsNum;
    }
    // End:0x605
    if(PRI.FlagReturns > 0)
    {
        ++ GoalsNum;
    }
    // End:0x6c3
    if(GoalsNum > 0)
    {
        C.DrawColor = HudClass.default.GoldColor;
        GoalsBoxSizeY = LargeYL + float(GoalsNum) * LargeYL;
        C.SetPos(3.0 * IndentX + CombatBoxX, GoalsOffsetY);
        C.StrLen(GoalsScored $ " 999 XXXxxXX", XL, LargeYL);
        GoalsBoxX = CombatBoxX;
        C.DrawTileStretched(BoxMaterial, GoalsBoxX, GoalsBoxSizeY);
    }
    C.DrawColor = HudClass.default.WhiteColor;
    WeaponsOffsetY = GoalsOffsetY + FMax(CombatBoxSizeY, GoalsBoxSizeY) + 0.50 * LargeYL;
    WeaponsBoxSizeY = FMin(3.0 * LargeYL + float(PRI.WeaponStatsArray.Length) * LargeYL, C.ClipY - WeaponsOffsetY - IndentX);
    C.SetPos(IndentX, WeaponsOffsetY);
    C.StrLen("ROCKET LAUNCHER REALLY", WeaponWidth, LargeYL);
    C.DrawTileStretched(BoxMaterial, C.ClipX - float(2) * IndentX, WeaponsBoxSizeY);
    // End:0x898
    if(PRI.VehicleStatsArray.Length > 0)
    {
        VehiclesOffsetY = WeaponsOffsetY + WeaponsBoxSizeY + 0.50 * LargeYL;
        VehiclesBoxSizeY = FMin(3.0 * LargeYL + float(PRI.VehicleStatsArray.Length) * LargeYL, C.ClipY - VehiclesOffsetY - IndentX);
        C.SetPos(IndentX, VehiclesOffsetY);
        C.DrawTileStretched(BoxMaterial, C.ClipX - float(2) * IndentX, VehiclesBoxSizeY);
    }
    C.SetPos(IndentX, IndentX);
    C.DrawText(StatsString @ PRI.PlayerName);
    C.SetPos(IndentX, IndentX + LargeYL);
    // End:0x95d
    if(Level.NetMode == 3 && PRI.WeaponStatsArray.Length == 0 && AwardsNum == 0 && CombosNum == 0 && GoalsNum == 0)
    {
        C.DrawText(WaitingForStats);
    }
    // End:0x96e
    else
    {
        C.DrawText(NextStatsString);
    }
    // End:0x1049
    if(AwardsNum > 0)
    {
        AwardsNum = 0;
        AwardX = 2.0 * IndentX;
        OffsetY = AwardsOffsetY + 0.50 * LargeYL;
        C.SetPos(AwardX, OffsetY);
        C.DrawColor = HudClass.default.GoldColor;
        C.DrawText(AwardsString);
        OffsetY += LargeYL;
        C.SetPos(AwardX, OffsetY);
        C.DrawColor = HudClass.default.RedColor;
        // End:0xab5
        if(PRI.bFirstBlood)
        {
            C.DrawText(FirstBloodString);
            ++ AwardsNum;
            // End:0xa7f
            if(float(AwardsNum) % float(3) == float(0))
            {
                OffsetY += LargeYL;
            }
            C.SetPos(AwardX + float(AwardsNum) % float(3) * AwardsBoxX * 0.330, OffsetY);
        }
        C.DrawColor = HudClass.default.TurqColor;
        i = 0;
        J0xad9:
        // End:0xbbc [While If]
        if(i < 6)
        {
            // End:0xbb2
            if(PRI.Spree[i] > 0)
            {
                C.DrawText(class'KillingSpreeMessage'.default.SelfSpreeNote[i] @ MakeColorCode(HudClass.default.GoldColor) $ "X" $ string(PRI.Spree[i]));
                ++ AwardsNum;
                // End:0xb7c
                if(float(AwardsNum) % float(3) == float(0))
                {
                    OffsetY += LargeYL;
                }
                C.SetPos(AwardX + float(AwardsNum) % float(3) * AwardsBoxX * 0.330, OffsetY);
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0xad9;
        }
        C.DrawColor = HudClass.default.RedColor;
        C.DrawColor.G = 128;
        i = 0;
        J0xbf6:
        // End:0xcd0 [While If]
        if(i < 7)
        {
            // End:0xcc6
            if(PRI.MultiKills[i] > 0)
            {
                C.DrawText(KillString[i] @ MakeColorCode(HudClass.default.GoldColor) $ "X" $ string(PRI.MultiKills[i]));
                ++ AwardsNum;
                // End:0xc90
                if(float(AwardsNum) % float(3) == float(0))
                {
                    OffsetY += LargeYL;
                }
                C.SetPos(AwardX + float(AwardsNum) % float(3) * AwardsBoxX * 0.330, OffsetY);
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0xbf6;
        }
        C.DrawColor = HudClass.default.WhiteColor;
        // End:0xd71
        if(PRI.flakcount >= 15)
        {
            C.DrawText(FlakMonkey);
            ++ AwardsNum;
            // End:0xd3b
            if(float(AwardsNum) % float(3) == float(0))
            {
                OffsetY += LargeYL;
            }
            C.SetPos(AwardX + float(AwardsNum) % float(3) * AwardsBoxX * 0.330, OffsetY);
        }
        // End:0xdf5
        if(PRI.combocount >= 15)
        {
            C.DrawText(ComboWhore);
            ++ AwardsNum;
            // End:0xdbf
            if(float(AwardsNum) % float(3) == float(0))
            {
                OffsetY += LargeYL;
            }
            C.SetPos(AwardX + float(AwardsNum) % float(3) * AwardsBoxX * 0.330, OffsetY);
        }
        // End:0xe79
        if(PRI.headcount >= 15)
        {
            C.DrawText(HeadHunter);
            ++ AwardsNum;
            // End:0xe43
            if(float(AwardsNum) % float(3) == float(0))
            {
                OffsetY += LargeYL;
            }
            C.SetPos(AwardX + float(AwardsNum) % float(3) * AwardsBoxX * 0.330, OffsetY);
        }
        // End:0xefd
        if(PRI.ranovercount >= 10)
        {
            C.DrawText(RoadRampage);
            ++ AwardsNum;
            // End:0xec7
            if(float(AwardsNum) % float(3) == float(0))
            {
                OffsetY += LargeYL;
            }
            C.SetPos(AwardX + float(AwardsNum) % float(3) * AwardsBoxX * 0.330, OffsetY);
        }
        // End:0xf9e
        if(PRI.GoalsScored >= 3)
        {
            C.DrawColor = HudClass.default.GoldColor;
            C.DrawText(HatTrick);
            ++ AwardsNum;
            // End:0xf68
            if(float(AwardsNum) % float(3) == float(0))
            {
                OffsetY += LargeYL;
            }
            C.SetPos(AwardX + float(AwardsNum) % float(3) * AwardsBoxX * 0.330, OffsetY);
        }
        // End:0x1049
        if(PRI.DaredevilPoints > 0)
        {
            C.DrawText(DaredevilString @ MakeColorCode(HudClass.default.GoldColor) $ string(PRI.DaredevilPoints));
            ++ AwardsNum;
            // End:0x1013
            if(float(AwardsNum) % float(3) == float(0))
            {
                OffsetY += LargeYL;
            }
            C.SetPos(AwardX + float(AwardsNum) % float(3) * AwardsBoxX * 0.330, OffsetY);
        }
    }
    // End:0x11f3
    if(CombosNum > 0)
    {
        CombosNum = 0;
        OffsetY = CombosOffsetY + 0.50 * LargeYL;
        C.SetPos(2.0 * IndentX, OffsetY);
        C.DrawColor = HudClass.default.GoldColor;
        C.DrawText(AdrenalineCombos);
        OffsetY += LargeYL;
        C.SetPos(2.0 * IndentX, OffsetY);
        C.DrawColor = HudClass.default.CyanColor;
        i = 0;
        J0x1112:
        // End:0x11f3 [While If]
        if(i < 5)
        {
            // End:0x11e9
            if(PRI.Combos[i] > 0)
            {
                C.DrawText(ComboNames[i] @ MakeColorCode(HudClass.default.GoldColor) $ "X" $ string(PRI.Combos[i]));
                ++ CombosNum;
                // End:0x11ac
                if(float(CombosNum) % float(2) == float(0))
                {
                    OffsetY += LargeYL;
                }
                C.SetPos(2.0 * IndentX + float(CombosNum) % float(2) * 0.50 * CombosBoxX, OffsetY);
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x1112;
        }
    }
    C.DrawColor = HudClass.default.GoldColor;
    OffsetY = CombatOffsetY + 0.50 * LargeYL;
    C.SetPos(2.0 * IndentX, OffsetY);
    C.DrawText(CombatResults);
    C.DrawColor = HudClass.default.WhiteColor;
    OffsetY += LargeYL;
    C.SetPos(2.0 * IndentX, OffsetY);
    C.DrawText(Kills);
    C.StrLen(string(PRI.Kills), XL, LargeYL);
    C.SetPos(CombatBoxX - XL - float(2) * IndentX, OffsetY);
    C.DrawText(string(PRI.Kills));
    OffsetY += LargeYL;
    C.SetPos(2.0 * IndentX, OffsetY);
    C.DrawText(Deaths);
    C.StrLen(string(int(PRI.Deaths)), XL, LargeYL);
    C.SetPos(CombatBoxX - XL - float(2) * IndentX, OffsetY);
    C.DrawText(string(int(PRI.Deaths)));
    OffsetY += LargeYL;
    C.SetPos(2.0 * IndentX, OffsetY);
    C.DrawText(Suicides);
    C.StrLen(string(PRI.Suicides), XL, LargeYL);
    C.SetPos(CombatBoxX - XL - float(2) * IndentX, OffsetY);
    C.DrawText(string(PRI.Suicides));
    // End:0x173f
    if(GoalsNum > 0)
    {
        C.DrawColor = HudClass.default.CyanColor;
        OffsetY = CombatOffsetY + 0.50 * LargeYL;
        C.SetPos(4.0 * IndentX + CombatBoxX, OffsetY);
        // End:0x15af
        if(PRI.GoalsScored > 0)
        {
            C.DrawText(GoalsScored);
            C.StrLen(string(PRI.GoalsScored), XL, LargeYL);
            C.SetPos(IndentX + CombatBoxX + GoalsBoxX - XL, OffsetY);
            C.DrawText(string(PRI.GoalsScored));
            OffsetY += LargeYL;
            C.SetPos(4.0 * IndentX + CombatBoxX, OffsetY);
        }
        // End:0x1677
        if(PRI.FlagTouches > 0)
        {
            C.DrawText(FlagTouches);
            C.StrLen(string(PRI.FlagTouches), XL, LargeYL);
            C.SetPos(IndentX + CombatBoxX + GoalsBoxX - XL, OffsetY);
            C.DrawText(string(PRI.FlagTouches));
            OffsetY += LargeYL;
            C.SetPos(4.0 * IndentX + CombatBoxX, OffsetY);
        }
        // End:0x173f
        if(PRI.FlagReturns > 0)
        {
            C.DrawText(FlagReturns);
            C.StrLen(string(PRI.FlagReturns), XL, LargeYL);
            C.SetPos(IndentX + CombatBoxX + GoalsBoxX - XL, OffsetY);
            C.DrawText(string(PRI.FlagReturns));
            OffsetY += LargeYL;
            C.SetPos(4.0 * IndentX + CombatBoxX, OffsetY);
        }
    }
    OffsetY = WeaponsOffsetY + 0.50 * LargeYL;
    C.SetPos(2.0 * IndentX, OffsetY);
    C.DrawColor = HudClass.default.GoldColor;
    C.DrawText(KillsByWeapon);
    OffsetY += LargeYL;
    C.SetPos(2.0 * IndentX, OffsetY);
    C.DrawColor = HudClass.default.GrayColor;
    C.DrawColor.G = byte(255);
    C.SetPos(2.0 * IndentX, OffsetY);
    C.DrawText(WeaponString);
    C.SetPos(2.0 * IndentX + WeaponWidth, OffsetY);
    C.DrawText(Kills);
    C.SetPos(2.0 * IndentX + WeaponWidth + 0.20 * C.ClipX - float(4) * IndentX - WeaponWidth, OffsetY);
    C.DrawText(DeathsBy);
    C.SetPos(2.0 * IndentX + WeaponWidth + 0.50 * C.ClipX - float(4) * IndentX - WeaponWidth, OffsetY);
    C.DrawText(deathsholding);
    C.SetPos(2.0 * IndentX + WeaponWidth + 0.80 * C.ClipX - float(4) * IndentX - WeaponWidth, OffsetY);
    C.DrawText(EfficiencyString);
    OffsetY += LargeYL;
    C.SetPos(2.0 * IndentX, OffsetY);
    C.DrawColor = HudClass.default.GreenColor;
    i = 0;
    J0x19e9:
    // End:0x1a1d [While If]
    if(i < PRI.WeaponStatsArray.Length)
    {
        Ordered[i] = i;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x19e9;
    }
    i = 0;
    J0x1a24:
    // End:0x1af1 [While If]
    if(i < PRI.WeaponStatsArray.Length)
    {
        j = i;
        J0x1a48:
        // End:0x1ae7 [While If]
        if(j < PRI.WeaponStatsArray.Length)
        {
            // End:0x1add
            if(PRI.WeaponStatsArray[Ordered[i]].Kills < PRI.WeaponStatsArray[Ordered[j]].Kills)
            {
                temp = Ordered[i];
                Ordered[i] = Ordered[j];
                Ordered[j] = temp;
            }
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0x1a48;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1a24;
    }
    i = 0;
    J0x1af8:
    // End:0x1e21 [While If]
    if(i < PRI.WeaponStatsArray.Length)
    {
        C.DrawText(PRI.WeaponStatsArray[Ordered[i]].WeaponClass.default.ItemName);
        C.SetPos(2.0 * IndentX + WeaponWidth, OffsetY);
        C.DrawText(string(PRI.WeaponStatsArray[Ordered[i]].Kills));
        C.SetPos(2.0 * IndentX + WeaponWidth + 0.20 * C.ClipX - float(4) * IndentX - WeaponWidth, OffsetY);
        C.DrawText(string(PRI.WeaponStatsArray[Ordered[i]].Deaths));
        C.SetPos(2.0 * IndentX + WeaponWidth + 0.50 * C.ClipX - float(4) * IndentX - WeaponWidth, OffsetY);
        C.DrawText(string(PRI.WeaponStatsArray[Ordered[i]].deathsholding));
        C.SetPos(2.0 * IndentX + WeaponWidth + 0.80 * C.ClipX - float(4) * IndentX - WeaponWidth, OffsetY);
        // End:0x1d42
        if(PRI.WeaponStatsArray[Ordered[i]].deathsholding + PRI.WeaponStatsArray[Ordered[i]].Kills == 0)
        {
            C.DrawText("0%");
        }
        // End:0x1dc2
        else
        {
            C.DrawText(string(int(float(100) * float(PRI.WeaponStatsArray[Ordered[i]].Kills) / float(PRI.WeaponStatsArray[Ordered[i]].deathsholding + PRI.WeaponStatsArray[Ordered[i]].Kills))) $ "%");
        }
        OffsetY += LargeYL;
        C.SetPos(2.0 * IndentX, OffsetY);
        // End:0x1e17
        if(OffsetY > C.ClipY - LargeYL - IndentX)
        {
        }
        // End:0x1e21
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x1af8;
        }
    }
    // End:0x2518
    if(PRI.VehicleStatsArray.Length > 0)
    {
        OffsetY = VehiclesOffsetY + 0.50 * LargeYL;
        C.SetPos(2.0 * IndentX, OffsetY);
        C.DrawColor = HudClass.default.GoldColor;
        C.DrawText(KillsByVehicle);
        OffsetY += LargeYL;
        C.SetPos(2.0 * IndentX, OffsetY);
        C.DrawColor = HudClass.default.GrayColor;
        C.DrawColor.G = byte(255);
        C.SetPos(2.0 * IndentX, OffsetY);
        C.DrawText(VehicleString);
        C.SetPos(2.0 * IndentX + WeaponWidth, OffsetY);
        C.DrawText(Kills);
        C.SetPos(2.0 * IndentX + WeaponWidth + 0.20 * C.ClipX - float(4) * IndentX - WeaponWidth, OffsetY);
        C.DrawText(DeathsBy);
        C.SetPos(2.0 * IndentX + WeaponWidth + 0.50 * C.ClipX - float(4) * IndentX - WeaponWidth, OffsetY);
        C.DrawText(deathsholding);
        C.SetPos(2.0 * IndentX + WeaponWidth + 0.80 * C.ClipX - float(4) * IndentX - WeaponWidth, OffsetY);
        C.DrawText(EfficiencyString);
        OffsetY += LargeYL;
        C.SetPos(2.0 * IndentX, OffsetY);
        C.DrawColor = HudClass.default.GreenColor;
        i = 0;
        J0x20e0:
        // End:0x2114 [While If]
        if(i < PRI.VehicleStatsArray.Length)
        {
            Ordered[i] = i;
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x20e0;
        }
        i = 0;
        J0x211b:
        // End:0x21e8 [While If]
        if(i < PRI.VehicleStatsArray.Length)
        {
            j = i;
            J0x213f:
            // End:0x21de [While If]
            if(j < PRI.VehicleStatsArray.Length)
            {
                // End:0x21d4
                if(PRI.VehicleStatsArray[Ordered[i]].Kills < PRI.VehicleStatsArray[Ordered[j]].Kills)
                {
                    temp = Ordered[i];
                    Ordered[i] = Ordered[j];
                    Ordered[j] = temp;
                }
                ++ j;
                // This is an implied JumpToken; Continue!
                goto J0x213f;
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x211b;
        }
        i = 0;
        J0x21ef:
        // End:0x2518 [While If]
        if(i < PRI.VehicleStatsArray.Length)
        {
            C.DrawText(PRI.VehicleStatsArray[Ordered[i]].VehicleClass.default.VehicleNameString);
            C.SetPos(2.0 * IndentX + WeaponWidth, OffsetY);
            C.DrawText(string(PRI.VehicleStatsArray[Ordered[i]].Kills));
            C.SetPos(2.0 * IndentX + WeaponWidth + 0.20 * C.ClipX - float(4) * IndentX - WeaponWidth, OffsetY);
            C.DrawText(string(PRI.VehicleStatsArray[Ordered[i]].Deaths));
            C.SetPos(2.0 * IndentX + WeaponWidth + 0.50 * C.ClipX - float(4) * IndentX - WeaponWidth, OffsetY);
            C.DrawText(string(PRI.VehicleStatsArray[Ordered[i]].DeathsDriving));
            C.SetPos(2.0 * IndentX + WeaponWidth + 0.80 * C.ClipX - float(4) * IndentX - WeaponWidth, OffsetY);
            // End:0x2439
            if(PRI.VehicleStatsArray[Ordered[i]].DeathsDriving + PRI.VehicleStatsArray[Ordered[i]].Kills == 0)
            {
                C.DrawText("0%");
            }
            // End:0x24b9
            else
            {
                C.DrawText(string(int(float(100) * float(PRI.VehicleStatsArray[Ordered[i]].Kills) / float(PRI.VehicleStatsArray[Ordered[i]].DeathsDriving + PRI.VehicleStatsArray[Ordered[i]].Kills))) $ "%");
            }
            OffsetY += LargeYL;
            C.SetPos(2.0 * IndentX, OffsetY);
            // End:0x250e
            if(OffsetY > C.ClipY - LargeYL - IndentX)
            {
            }
            // End:0x2518
            else
            {
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x21ef;
            }
        }
    }
}

function NextStats()
{
    local int i, j;

    // End:0x23
    if(PlayerOwner == none || PlayerOwner.GameReplicationInfo == none)
    {
        return;
    }
    LastUpdateTime = 0.0;
    i = 0;
    J0x35:
    // End:0xfa [While If]
    if(i < PlayerOwner.GameReplicationInfo.PRIArray.Length - 1)
    {
        // End:0xf0
        if(PRI == PlayerOwner.GameReplicationInfo.PRIArray[i])
        {
            j = i + 1;
            J0x8f:
            // End:0xf0 [While If]
            if(j < PlayerOwner.GameReplicationInfo.PRIArray.Length)
            {
                PRI = TeamPlayerReplicationInfo(PlayerOwner.GameReplicationInfo.PRIArray[j]);
                // End:0xe6
                if(PRI != none)
                {
                    return;
                }
                ++ j;
                // This is an implied JumpToken; Continue!
                goto J0x8f;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x35;
    }
    PRI = TeamPlayerReplicationInfo(PlayerOwner.GameReplicationInfo.PRIArray[0]);
}

defaultproperties
{
    StatsString="?? ??"
    AwardsString="?"
    FirstBloodString="??? ??!"
    FlakMonkey="????!"
    ComboWhore="??? ??!"
    HeadHunter="?? ??!"
    RoadRampage="??? ??!"
    DaredevilString="????:"
    FlagTouches="?? ??"
    FlagReturns="?? ???"
    GoalsScored="? ??:"
    HatTrick="?? ??!"
    KillString[0]="?? ?!"
    KillString[1]="?? ?!"
    KillString[2]="?? ?!"
    KillString[3]="??? ?!"
    KillString[4]="??? ?!"
    KillString[5]="????? ?!"
    KillString[6]="?? ?!"
    AdrenalineCombos="????? ??"
    ComboNames[0]="???"
    ComboNames[1]="???"
    ComboNames[2]="???"
    ComboNames[3]="??"
    ComboNames[4]="??"
    KillsByWeapon="?? ??"
    CombatResults="?? ??"
    Kills="??"
    Deaths="??"
    Suicides="??"
    NextStatsString="?? ????? ??? ??? F8 ????"
    WeaponString="??"
    DeathsBy="??? ??? ?"
    deathsholding="???? ??"
    EfficiencyString="???"
    WaitingForStats="????? ??? ?????. ?? ???? ????? F3 ?????."
    KillsByVehicle="?? ??"
    VehicleString="??"
}