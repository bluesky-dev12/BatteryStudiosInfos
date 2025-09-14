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
    // End:0x1F
    if(int(NewColor.R) == 0)
    {
        NewColor.R = 1;
    }
    // End:0x3E
    if(int(NewColor.G) == 0)
    {
        NewColor.G = 1;
    }
    // End:0x5D
    if(int(NewColor.B) == 0)
    {
        NewColor.B = 1;
    }
    return ((Chr(27) $ Chr(int(NewColor.R))) $ Chr(int(NewColor.G))) $ Chr(int(NewColor.B));
    //return;    
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
    // End:0xAD
    if(PRI == none)
    {
        PRI = TeamPlayerReplicationInfo(PlayerOwner.PlayerReplicationInfo);
        // End:0xAD
        if(PRI == none)
        {
            C.SetPos(IndentX, IndentX);
            C.DrawText(WaitingForStats);
            return;
        }
    }
    // End:0xF3
    if((Level.TimeSeconds - LastUpdateTime) > float(2))
    {
        LastUpdateTime = Level.TimeSeconds;
        PlayerOwner.ServerUpdateStats(PRI);
    }
    C.DrawColor = HudClass.default.WhiteColor;
    C.Font = PlayerOwner.myHUD.GetFontSizeIndex(C, -2);
    C.StrLen(StatsString, XL, LargeYL);
    IndentX = 0.0150000 * C.ClipX;
    AwardsOffsetY = IndentX + (float(2) * LargeYL);
    // End:0x1A8
    if(PRI.bFirstBlood)
    {
        AwardsNum++;
    }
    i = 0;
    J0x1AF:

    // End:0x1E8 [Loop If]
    if(i < 6)
    {
        // End:0x1DE
        if(int(PRI.Spree[i]) > 0)
        {
            AwardsNum++;
        }
        i++;
        // [Loop Continue]
        goto J0x1AF;
    }
    i = 0;
    J0x1EF:

    // End:0x228 [Loop If]
    if(i < 7)
    {
        // End:0x21E
        if(int(PRI.MultiKills[i]) > 0)
        {
            AwardsNum++;
        }
        i++;
        // [Loop Continue]
        goto J0x1EF;
    }
    // End:0x244
    if(PRI.flakcount >= 15)
    {
        AwardsNum++;
    }
    // End:0x260
    if(PRI.combocount >= 15)
    {
        AwardsNum++;
    }
    // End:0x27C
    if(PRI.headcount >= 15)
    {
        AwardsNum++;
    }
    // End:0x298
    if(PRI.ranovercount >= 10)
    {
        AwardsNum++;
    }
    // End:0x2B3
    if(PRI.DaredevilPoints > 0)
    {
        AwardsNum++;
    }
    // End:0x2CF
    if(PRI.GoalsScored >= 3)
    {
        AwardsNum++;
    }
    C.StrLen("REALLY X999" $ KillString[5], AwardWidth, LargeYL);
    // End:0x3D3
    if(AwardsNum > 0)
    {
        AwardsBoxX = FMin(0.9000000 * C.ClipX, (float(Min(3, AwardsNum)) * AwardWidth) + (float(4) * IndentX));
        AwardsBoxSizeY = LargeYL + (float(2 + ((AwardsNum - 1) / 3)) * LargeYL);
        C.SetPos(IndentX, AwardsOffsetY);
        C.DrawColor = HudClass.default.PurpleColor;
        C.DrawColor.R = 128;
        C.DrawTileStretched(BoxMaterial, AwardsBoxX, AwardsBoxSizeY);
    }
    CombosOffsetY = (AwardsOffsetY + AwardsBoxSizeY) + (0.5000000 * LargeYL);
    i = 0;
    J0x3FA:

    // End:0x433 [Loop If]
    if(i < 5)
    {
        // End:0x429
        if(int(PRI.Combos[i]) > 0)
        {
            CombosNum++;
        }
        i++;
        // [Loop Continue]
        goto J0x3FA;
    }
    // End:0x4EA
    if(CombosNum > 0)
    {
        C.DrawColor = HudClass.default.BlueColor;
        CombosBoxSizeY = LargeYL + (float(1 + CombosNum) * LargeYL);
        C.SetPos(IndentX, CombosOffsetY);
        C.StrLen(AdrenalineCombos, XL, LargeYL);
        CombosBoxX = (4.0000000 * IndentX) + (float(2) * XL);
        C.DrawTileStretched(BoxMaterial, CombosBoxX, CombosBoxSizeY);
    }
    C.DrawColor = HudClass.default.GreenColor;
    CombatOffsetY = (CombosOffsetY + CombosBoxSizeY) + (0.5000000 * LargeYL);
    CombatBoxSizeY = LargeYL + (float(4) * LargeYL);
    C.SetPos(IndentX, CombatOffsetY);
    C.StrLen(CombatResults, XL, LargeYL);
    CombatBoxX = XL + (float(4) * IndentX);
    C.DrawTileStretched(BoxMaterial, CombatBoxX, CombatBoxSizeY);
    GoalsOffsetY = CombatOffsetY;
    // End:0x5CF
    if(PRI.GoalsScored > 0)
    {
        GoalsNum++;
    }
    // End:0x5EA
    if(PRI.FlagTouches > 0)
    {
        GoalsNum++;
    }
    // End:0x605
    if(PRI.FlagReturns > 0)
    {
        GoalsNum++;
    }
    // End:0x6C3
    if(GoalsNum > 0)
    {
        C.DrawColor = HudClass.default.GoldColor;
        GoalsBoxSizeY = LargeYL + (float(GoalsNum) * LargeYL);
        C.SetPos((3.0000000 * IndentX) + CombatBoxX, GoalsOffsetY);
        C.StrLen(GoalsScored $ " 999 XXXxxXX", XL, LargeYL);
        GoalsBoxX = CombatBoxX;
        C.DrawTileStretched(BoxMaterial, GoalsBoxX, GoalsBoxSizeY);
    }
    C.DrawColor = HudClass.default.WhiteColor;
    WeaponsOffsetY = (GoalsOffsetY + FMax(CombatBoxSizeY, GoalsBoxSizeY)) + (0.5000000 * LargeYL);
    WeaponsBoxSizeY = FMin((3.0000000 * LargeYL) + (float(PRI.WeaponStatsArray.Length) * LargeYL), (C.ClipY - WeaponsOffsetY) - IndentX);
    C.SetPos(IndentX, WeaponsOffsetY);
    C.StrLen("ROCKET LAUNCHER REALLY", WeaponWidth, LargeYL);
    C.DrawTileStretched(BoxMaterial, C.ClipX - (float(2) * IndentX), WeaponsBoxSizeY);
    // End:0x898
    if(PRI.VehicleStatsArray.Length > 0)
    {
        VehiclesOffsetY = (WeaponsOffsetY + WeaponsBoxSizeY) + (0.5000000 * LargeYL);
        VehiclesBoxSizeY = FMin((3.0000000 * LargeYL) + (float(PRI.VehicleStatsArray.Length) * LargeYL), (C.ClipY - VehiclesOffsetY) - IndentX);
        C.SetPos(IndentX, VehiclesOffsetY);
        C.DrawTileStretched(BoxMaterial, C.ClipX - (float(2) * IndentX), VehiclesBoxSizeY);
    }
    C.SetPos(IndentX, IndentX);
    C.DrawText(StatsString @ PRI.PlayerName);
    C.SetPos(IndentX, IndentX + LargeYL);
    // End:0x95D
    if(((((int(Level.NetMode) == int(NM_Client)) && PRI.WeaponStatsArray.Length == 0) && AwardsNum == 0) && CombosNum == 0) && GoalsNum == 0)
    {
        C.DrawText(WaitingForStats);        
    }
    else
    {
        C.DrawText(NextStatsString);
    }
    // End:0x1049
    if(AwardsNum > 0)
    {
        AwardsNum = 0;
        AwardX = 2.0000000 * IndentX;
        OffsetY = AwardsOffsetY + (0.5000000 * LargeYL);
        C.SetPos(AwardX, OffsetY);
        C.DrawColor = HudClass.default.GoldColor;
        C.DrawText(AwardsString);
        OffsetY += LargeYL;
        C.SetPos(AwardX, OffsetY);
        C.DrawColor = HudClass.default.RedColor;
        // End:0xAB5
        if(PRI.bFirstBlood)
        {
            C.DrawText(FirstBloodString);
            AwardsNum++;
            // End:0xA7F
            if((float(AwardsNum) % float(3)) == float(0))
            {
                OffsetY += LargeYL;
            }
            C.SetPos(AwardX + (((float(AwardsNum) % float(3)) * AwardsBoxX) * 0.3300000), OffsetY);
        }
        C.DrawColor = HudClass.default.TurqColor;
        i = 0;
        J0xAD9:

        // End:0xBBC [Loop If]
        if(i < 6)
        {
            // End:0xBB2
            if(int(PRI.Spree[i]) > 0)
            {
                C.DrawText(((Class'UnrealGame_Decompressed.KillingSpreeMessage'.default.SelfSpreeNote[i] @ (MakeColorCode(HudClass.default.GoldColor))) $ "X") $ string(PRI.Spree[i]));
                AwardsNum++;
                // End:0xB7C
                if((float(AwardsNum) % float(3)) == float(0))
                {
                    OffsetY += LargeYL;
                }
                C.SetPos(AwardX + (((float(AwardsNum) % float(3)) * AwardsBoxX) * 0.3300000), OffsetY);
            }
            i++;
            // [Loop Continue]
            goto J0xAD9;
        }
        C.DrawColor = HudClass.default.RedColor;
        C.DrawColor.G = 128;
        i = 0;
        J0xBF6:

        // End:0xCD0 [Loop If]
        if(i < 7)
        {
            // End:0xCC6
            if(int(PRI.MultiKills[i]) > 0)
            {
                C.DrawText(((KillString[i] @ (MakeColorCode(HudClass.default.GoldColor))) $ "X") $ string(PRI.MultiKills[i]));
                AwardsNum++;
                // End:0xC90
                if((float(AwardsNum) % float(3)) == float(0))
                {
                    OffsetY += LargeYL;
                }
                C.SetPos(AwardX + (((float(AwardsNum) % float(3)) * AwardsBoxX) * 0.3300000), OffsetY);
            }
            i++;
            // [Loop Continue]
            goto J0xBF6;
        }
        C.DrawColor = HudClass.default.WhiteColor;
        // End:0xD71
        if(PRI.flakcount >= 15)
        {
            C.DrawText(FlakMonkey);
            AwardsNum++;
            // End:0xD3B
            if((float(AwardsNum) % float(3)) == float(0))
            {
                OffsetY += LargeYL;
            }
            C.SetPos(AwardX + (((float(AwardsNum) % float(3)) * AwardsBoxX) * 0.3300000), OffsetY);
        }
        // End:0xDF5
        if(PRI.combocount >= 15)
        {
            C.DrawText(ComboWhore);
            AwardsNum++;
            // End:0xDBF
            if((float(AwardsNum) % float(3)) == float(0))
            {
                OffsetY += LargeYL;
            }
            C.SetPos(AwardX + (((float(AwardsNum) % float(3)) * AwardsBoxX) * 0.3300000), OffsetY);
        }
        // End:0xE79
        if(PRI.headcount >= 15)
        {
            C.DrawText(HeadHunter);
            AwardsNum++;
            // End:0xE43
            if((float(AwardsNum) % float(3)) == float(0))
            {
                OffsetY += LargeYL;
            }
            C.SetPos(AwardX + (((float(AwardsNum) % float(3)) * AwardsBoxX) * 0.3300000), OffsetY);
        }
        // End:0xEFD
        if(PRI.ranovercount >= 10)
        {
            C.DrawText(RoadRampage);
            AwardsNum++;
            // End:0xEC7
            if((float(AwardsNum) % float(3)) == float(0))
            {
                OffsetY += LargeYL;
            }
            C.SetPos(AwardX + (((float(AwardsNum) % float(3)) * AwardsBoxX) * 0.3300000), OffsetY);
        }
        // End:0xF9E
        if(PRI.GoalsScored >= 3)
        {
            C.DrawColor = HudClass.default.GoldColor;
            C.DrawText(HatTrick);
            AwardsNum++;
            // End:0xF68
            if((float(AwardsNum) % float(3)) == float(0))
            {
                OffsetY += LargeYL;
            }
            C.SetPos(AwardX + (((float(AwardsNum) % float(3)) * AwardsBoxX) * 0.3300000), OffsetY);
        }
        // End:0x1049
        if(PRI.DaredevilPoints > 0)
        {
            C.DrawText((DaredevilString @ (MakeColorCode(HudClass.default.GoldColor))) $ string(PRI.DaredevilPoints));
            AwardsNum++;
            // End:0x1013
            if((float(AwardsNum) % float(3)) == float(0))
            {
                OffsetY += LargeYL;
            }
            C.SetPos(AwardX + (((float(AwardsNum) % float(3)) * AwardsBoxX) * 0.3300000), OffsetY);
        }
    }
    // End:0x11F3
    if(CombosNum > 0)
    {
        CombosNum = 0;
        OffsetY = CombosOffsetY + (0.5000000 * LargeYL);
        C.SetPos(2.0000000 * IndentX, OffsetY);
        C.DrawColor = HudClass.default.GoldColor;
        C.DrawText(AdrenalineCombos);
        OffsetY += LargeYL;
        C.SetPos(2.0000000 * IndentX, OffsetY);
        C.DrawColor = HudClass.default.CyanColor;
        i = 0;
        J0x1112:

        // End:0x11F3 [Loop If]
        if(i < 5)
        {
            // End:0x11E9
            if(int(PRI.Combos[i]) > 0)
            {
                C.DrawText(((ComboNames[i] @ (MakeColorCode(HudClass.default.GoldColor))) $ "X") $ string(PRI.Combos[i]));
                CombosNum++;
                // End:0x11AC
                if((float(CombosNum) % float(2)) == float(0))
                {
                    OffsetY += LargeYL;
                }
                C.SetPos((2.0000000 * IndentX) + (((float(CombosNum) % float(2)) * 0.5000000) * CombosBoxX), OffsetY);
            }
            i++;
            // [Loop Continue]
            goto J0x1112;
        }
    }
    C.DrawColor = HudClass.default.GoldColor;
    OffsetY = CombatOffsetY + (0.5000000 * LargeYL);
    C.SetPos(2.0000000 * IndentX, OffsetY);
    C.DrawText(CombatResults);
    C.DrawColor = HudClass.default.WhiteColor;
    OffsetY += LargeYL;
    C.SetPos(2.0000000 * IndentX, OffsetY);
    C.DrawText(Kills);
    C.StrLen(string(PRI.Kills), XL, LargeYL);
    C.SetPos((CombatBoxX - XL) - (float(2) * IndentX), OffsetY);
    C.DrawText(string(PRI.Kills));
    OffsetY += LargeYL;
    C.SetPos(2.0000000 * IndentX, OffsetY);
    C.DrawText(Deaths);
    C.StrLen(string(int(PRI.Deaths)), XL, LargeYL);
    C.SetPos((CombatBoxX - XL) - (float(2) * IndentX), OffsetY);
    C.DrawText(string(int(PRI.Deaths)));
    OffsetY += LargeYL;
    C.SetPos(2.0000000 * IndentX, OffsetY);
    C.DrawText(Suicides);
    C.StrLen(string(PRI.Suicides), XL, LargeYL);
    C.SetPos((CombatBoxX - XL) - (float(2) * IndentX), OffsetY);
    C.DrawText(string(PRI.Suicides));
    // End:0x173F
    if(GoalsNum > 0)
    {
        C.DrawColor = HudClass.default.CyanColor;
        OffsetY = CombatOffsetY + (0.5000000 * LargeYL);
        C.SetPos((4.0000000 * IndentX) + CombatBoxX, OffsetY);
        // End:0x15AF
        if(PRI.GoalsScored > 0)
        {
            C.DrawText(GoalsScored);
            C.StrLen(string(PRI.GoalsScored), XL, LargeYL);
            C.SetPos(((IndentX + CombatBoxX) + GoalsBoxX) - XL, OffsetY);
            C.DrawText(string(PRI.GoalsScored));
            OffsetY += LargeYL;
            C.SetPos((4.0000000 * IndentX) + CombatBoxX, OffsetY);
        }
        // End:0x1677
        if(PRI.FlagTouches > 0)
        {
            C.DrawText(FlagTouches);
            C.StrLen(string(PRI.FlagTouches), XL, LargeYL);
            C.SetPos(((IndentX + CombatBoxX) + GoalsBoxX) - XL, OffsetY);
            C.DrawText(string(PRI.FlagTouches));
            OffsetY += LargeYL;
            C.SetPos((4.0000000 * IndentX) + CombatBoxX, OffsetY);
        }
        // End:0x173F
        if(PRI.FlagReturns > 0)
        {
            C.DrawText(FlagReturns);
            C.StrLen(string(PRI.FlagReturns), XL, LargeYL);
            C.SetPos(((IndentX + CombatBoxX) + GoalsBoxX) - XL, OffsetY);
            C.DrawText(string(PRI.FlagReturns));
            OffsetY += LargeYL;
            C.SetPos((4.0000000 * IndentX) + CombatBoxX, OffsetY);
        }
    }
    OffsetY = WeaponsOffsetY + (0.5000000 * LargeYL);
    C.SetPos(2.0000000 * IndentX, OffsetY);
    C.DrawColor = HudClass.default.GoldColor;
    C.DrawText(KillsByWeapon);
    OffsetY += LargeYL;
    C.SetPos(2.0000000 * IndentX, OffsetY);
    C.DrawColor = HudClass.default.GrayColor;
    C.DrawColor.G = byte(255);
    C.SetPos(2.0000000 * IndentX, OffsetY);
    C.DrawText(WeaponString);
    C.SetPos((2.0000000 * IndentX) + WeaponWidth, OffsetY);
    C.DrawText(Kills);
    C.SetPos(((2.0000000 * IndentX) + WeaponWidth) + (0.2000000 * ((C.ClipX - (float(4) * IndentX)) - WeaponWidth)), OffsetY);
    C.DrawText(DeathsBy);
    C.SetPos(((2.0000000 * IndentX) + WeaponWidth) + (0.5000000 * ((C.ClipX - (float(4) * IndentX)) - WeaponWidth)), OffsetY);
    C.DrawText(deathsholding);
    C.SetPos(((2.0000000 * IndentX) + WeaponWidth) + (0.8000000 * ((C.ClipX - (float(4) * IndentX)) - WeaponWidth)), OffsetY);
    C.DrawText(EfficiencyString);
    OffsetY += LargeYL;
    C.SetPos(2.0000000 * IndentX, OffsetY);
    C.DrawColor = HudClass.default.GreenColor;
    i = 0;
    J0x19E9:

    // End:0x1A1D [Loop If]
    if(i < PRI.WeaponStatsArray.Length)
    {
        Ordered[i] = i;
        i++;
        // [Loop Continue]
        goto J0x19E9;
    }
    i = 0;
    J0x1A24:

    // End:0x1AF1 [Loop If]
    if(i < PRI.WeaponStatsArray.Length)
    {
        j = i;
        J0x1A48:

        // End:0x1AE7 [Loop If]
        if(j < PRI.WeaponStatsArray.Length)
        {
            // End:0x1ADD
            if(PRI.WeaponStatsArray[Ordered[i]].Kills < PRI.WeaponStatsArray[Ordered[j]].Kills)
            {
                temp = Ordered[i];
                Ordered[i] = Ordered[j];
                Ordered[j] = temp;
            }
            j++;
            // [Loop Continue]
            goto J0x1A48;
        }
        i++;
        // [Loop Continue]
        goto J0x1A24;
    }
    i = 0;
    J0x1AF8:

    // End:0x1E21 [Loop If]
    if(i < PRI.WeaponStatsArray.Length)
    {
        C.DrawText(PRI.WeaponStatsArray[Ordered[i]].WeaponClass.default.ItemName);
        C.SetPos((2.0000000 * IndentX) + WeaponWidth, OffsetY);
        C.DrawText(string(PRI.WeaponStatsArray[Ordered[i]].Kills));
        C.SetPos(((2.0000000 * IndentX) + WeaponWidth) + (0.2000000 * ((C.ClipX - (float(4) * IndentX)) - WeaponWidth)), OffsetY);
        C.DrawText(string(PRI.WeaponStatsArray[Ordered[i]].Deaths));
        C.SetPos(((2.0000000 * IndentX) + WeaponWidth) + (0.5000000 * ((C.ClipX - (float(4) * IndentX)) - WeaponWidth)), OffsetY);
        C.DrawText(string(PRI.WeaponStatsArray[Ordered[i]].deathsholding));
        C.SetPos(((2.0000000 * IndentX) + WeaponWidth) + (0.8000000 * ((C.ClipX - (float(4) * IndentX)) - WeaponWidth)), OffsetY);
        // End:0x1D42
        if((PRI.WeaponStatsArray[Ordered[i]].deathsholding + PRI.WeaponStatsArray[Ordered[i]].Kills) == 0)
        {
            C.DrawText("0%");            
        }
        else
        {
            C.DrawText(string(int((float(100) * float(PRI.WeaponStatsArray[Ordered[i]].Kills)) / float(PRI.WeaponStatsArray[Ordered[i]].deathsholding + PRI.WeaponStatsArray[Ordered[i]].Kills))) $ "%");
        }
        OffsetY += LargeYL;
        C.SetPos(2.0000000 * IndentX, OffsetY);
        // End:0x1E17
        if(OffsetY > ((C.ClipY - LargeYL) - IndentX))
        {
            // [Explicit Break]
            goto J0x1E21;
        }
        i++;
        // [Loop Continue]
        goto J0x1AF8;
    }
    J0x1E21:

    // End:0x2518
    if(PRI.VehicleStatsArray.Length > 0)
    {
        OffsetY = VehiclesOffsetY + (0.5000000 * LargeYL);
        C.SetPos(2.0000000 * IndentX, OffsetY);
        C.DrawColor = HudClass.default.GoldColor;
        C.DrawText(KillsByVehicle);
        OffsetY += LargeYL;
        C.SetPos(2.0000000 * IndentX, OffsetY);
        C.DrawColor = HudClass.default.GrayColor;
        C.DrawColor.G = byte(255);
        C.SetPos(2.0000000 * IndentX, OffsetY);
        C.DrawText(VehicleString);
        C.SetPos((2.0000000 * IndentX) + WeaponWidth, OffsetY);
        C.DrawText(Kills);
        C.SetPos(((2.0000000 * IndentX) + WeaponWidth) + (0.2000000 * ((C.ClipX - (float(4) * IndentX)) - WeaponWidth)), OffsetY);
        C.DrawText(DeathsBy);
        C.SetPos(((2.0000000 * IndentX) + WeaponWidth) + (0.5000000 * ((C.ClipX - (float(4) * IndentX)) - WeaponWidth)), OffsetY);
        C.DrawText(deathsholding);
        C.SetPos(((2.0000000 * IndentX) + WeaponWidth) + (0.8000000 * ((C.ClipX - (float(4) * IndentX)) - WeaponWidth)), OffsetY);
        C.DrawText(EfficiencyString);
        OffsetY += LargeYL;
        C.SetPos(2.0000000 * IndentX, OffsetY);
        C.DrawColor = HudClass.default.GreenColor;
        i = 0;
        J0x20E0:

        // End:0x2114 [Loop If]
        if(i < PRI.VehicleStatsArray.Length)
        {
            Ordered[i] = i;
            i++;
            // [Loop Continue]
            goto J0x20E0;
        }
        i = 0;
        J0x211B:

        // End:0x21E8 [Loop If]
        if(i < PRI.VehicleStatsArray.Length)
        {
            j = i;
            J0x213F:

            // End:0x21DE [Loop If]
            if(j < PRI.VehicleStatsArray.Length)
            {
                // End:0x21D4
                if(PRI.VehicleStatsArray[Ordered[i]].Kills < PRI.VehicleStatsArray[Ordered[j]].Kills)
                {
                    temp = Ordered[i];
                    Ordered[i] = Ordered[j];
                    Ordered[j] = temp;
                }
                j++;
                // [Loop Continue]
                goto J0x213F;
            }
            i++;
            // [Loop Continue]
            goto J0x211B;
        }
        i = 0;
        J0x21EF:

        // End:0x2518 [Loop If]
        if(i < PRI.VehicleStatsArray.Length)
        {
            C.DrawText(PRI.VehicleStatsArray[Ordered[i]].VehicleClass.default.VehicleNameString);
            C.SetPos((2.0000000 * IndentX) + WeaponWidth, OffsetY);
            C.DrawText(string(PRI.VehicleStatsArray[Ordered[i]].Kills));
            C.SetPos(((2.0000000 * IndentX) + WeaponWidth) + (0.2000000 * ((C.ClipX - (float(4) * IndentX)) - WeaponWidth)), OffsetY);
            C.DrawText(string(PRI.VehicleStatsArray[Ordered[i]].Deaths));
            C.SetPos(((2.0000000 * IndentX) + WeaponWidth) + (0.5000000 * ((C.ClipX - (float(4) * IndentX)) - WeaponWidth)), OffsetY);
            C.DrawText(string(PRI.VehicleStatsArray[Ordered[i]].DeathsDriving));
            C.SetPos(((2.0000000 * IndentX) + WeaponWidth) + (0.8000000 * ((C.ClipX - (float(4) * IndentX)) - WeaponWidth)), OffsetY);
            // End:0x2439
            if((PRI.VehicleStatsArray[Ordered[i]].DeathsDriving + PRI.VehicleStatsArray[Ordered[i]].Kills) == 0)
            {
                C.DrawText("0%");                
            }
            else
            {
                C.DrawText(string(int((float(100) * float(PRI.VehicleStatsArray[Ordered[i]].Kills)) / float(PRI.VehicleStatsArray[Ordered[i]].DeathsDriving + PRI.VehicleStatsArray[Ordered[i]].Kills))) $ "%");
            }
            OffsetY += LargeYL;
            C.SetPos(2.0000000 * IndentX, OffsetY);
            // End:0x250E
            if(OffsetY > ((C.ClipY - LargeYL) - IndentX))
            {
                // [Explicit Break]
                goto J0x2518;
            }
            i++;
            // [Loop Continue]
            goto J0x21EF;
        }
    }
    J0x2518:

    //return;    
}

function NextStats()
{
    local int i, j;

    // End:0x23
    if((PlayerOwner == none) || PlayerOwner.GameReplicationInfo == none)
    {
        return;
    }
    LastUpdateTime = 0.0000000;
    i = 0;
    J0x35:

    // End:0xFA [Loop If]
    if(i < (PlayerOwner.GameReplicationInfo.PRIArray.Length - 1))
    {
        // End:0xF0
        if(PRI == PlayerOwner.GameReplicationInfo.PRIArray[i])
        {
            j = i + 1;
            J0x8F:

            // End:0xF0 [Loop If]
            if(j < PlayerOwner.GameReplicationInfo.PRIArray.Length)
            {
                PRI = TeamPlayerReplicationInfo(PlayerOwner.GameReplicationInfo.PRIArray[j]);
                // End:0xE6
                if(PRI != none)
                {
                    return;
                }
                j++;
                // [Loop Continue]
                goto J0x8F;
            }
        }
        i++;
        // [Loop Continue]
        goto J0x35;
    }
    PRI = TeamPlayerReplicationInfo(PlayerOwner.GameReplicationInfo.PRIArray[0]);
    //return;    
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