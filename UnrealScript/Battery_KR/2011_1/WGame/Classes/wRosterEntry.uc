class wRosterEntry extends RosterEntry
    transient
    editinlinenew;

var() PlayerRecord PlrProfile;

static function wRosterEntry CreateRosterEntry(int prIdx)
{
    local wRosterEntry xre;
    local PlayerRecord pR;

    xre = new (none) Class'WGame_Decompressed.wRosterEntry';
    xre.PlayerName = pR.DefaultName;
    xre.PawnClassName = "wGame.wPawn";
    xre.Init();
    return xre;
    //return;    
}

static function wRosterEntry CreateRosterEntryCharacter(string CharName)
{
    local wRosterEntry xre;
    local PlayerRecord pR;

    pR = Class'WGame_Decompressed.wUtil'.static.FindPlayerRecord(CharName);
    xre = new (none) Class'WGame_Decompressed.wRosterEntry';
    xre.PlayerName = pR.DefaultName;
    xre.PawnClassName = "wGame.wPawn";
    xre.PlrProfile = pR;
    xre.Init();
    return xre;
    //return;    
}

function PrecacheRosterFor(UnrealTeamInfo t)
{
    // End:0x50
    if(PlrProfile.Species == none)
    {
        Warn((("Could not load species " $ string(PlrProfile.Species)) $ " for ") $ PlrProfile.DefaultName);
        return;
    }
    //return;    
}

function InitBot(Bot B)
{
    B.SetPawnClass(PawnClassName, PlayerName);
    CombatStyle = FClamp(Class'UnrealGame.Bot'.default.CombatStyle + float(PlrProfile.CombatStyle), -1.0000000, 1.0000000);
    Aggressiveness = FClamp(Class'UnrealGame.Bot'.default.BaseAggressiveness + float(PlrProfile.Aggressiveness), 0.0000000, 1.0000000);
    Accuracy = FClamp(float(PlrProfile.Accuracy), -4.0000000, 4.0000000);
    StrafingAbility = FClamp(float(PlrProfile.StrafingAbility), -4.0000000, 4.0000000);
    Tactics = FClamp(float(PlrProfile.Tactics), -4.0000000, 4.0000000);
    ReactionTime = FClamp(float(PlrProfile.ReactionTime), -4.0000000, 4.0000000);
    // End:0x108
    if(PlrProfile.FavoriteWeapon == "")
    {
        FavoriteWeapon = none;        
    }
    else
    {
        FavoriteWeapon = Class<wWeapon>(DynamicLoadObject(PlrProfile.FavoriteWeapon, Class'Core.Class'));
    }
    Jumpiness = float(PlrProfile.Jumpiness);
    super.InitBot(B);
    //return;    
}
