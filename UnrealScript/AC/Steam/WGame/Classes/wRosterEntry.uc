/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wRosterEntry.uc
 * Package Imports:
 *	WGame
 *	UnrealGame
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:4
 *
 *******************************************************************************/
class wRosterEntry extends RosterEntry
    dependson(wUtil)
    transient
    editinlinenew;

var() PlayerRecord PlrProfile;

static function wRosterEntry CreateRosterEntry(int prIdx)
{
    local wRosterEntry xre;
    local PlayerRecord pR;

    xre = new (none) class'wRosterEntry';
    xre.PlayerName = pR.DefaultName;
    xre.PawnClassName = "wGame.wPawn";
    xre.Init();
    return xre;
}

static function wRosterEntry CreateRosterEntryCharacter(string CharName)
{
    local wRosterEntry xre;
    local PlayerRecord pR;

    pR = class'wUtil'.static.FindPlayerRecord(CharName);
    xre = new (none) class'wRosterEntry';
    xre.PlayerName = pR.DefaultName;
    xre.PawnClassName = "wGame.wPawn";
    xre.PlrProfile = pR;
    xre.Init();
    return xre;
}

function PrecacheRosterFor(UnrealTeamInfo t)
{
    // End:0x50
    if(PlrProfile.Species == none)
    {
        Warn("Could not load species " $ string(PlrProfile.Species) $ " for " $ PlrProfile.DefaultName);
        return;
    }
}

function InitBot(Bot B)
{
    B.SetPawnClass(PawnClassName, PlayerName);
    CombatStyle = FClamp(class'Bot'.default.CombatStyle + float(PlrProfile.CombatStyle), -1.0, 1.0);
    Aggressiveness = FClamp(class'Bot'.default.BaseAggressiveness + float(PlrProfile.Aggressiveness), 0.0, 1.0);
    Accuracy = FClamp(float(PlrProfile.Accuracy), -4.0, 4.0);
    StrafingAbility = FClamp(float(PlrProfile.StrafingAbility), -4.0, 4.0);
    Tactics = FClamp(float(PlrProfile.Tactics), -4.0, 4.0);
    ReactionTime = FClamp(float(PlrProfile.ReactionTime), -4.0, 4.0);
    // End:0x108
    if(PlrProfile.FavoriteWeapon == "")
    {
        FavoriteWeapon = none;
    }
    // End:0x128
    else
    {
        FavoriteWeapon = class<wWeapon>(DynamicLoadObject(PlrProfile.FavoriteWeapon, class'Class'));
    }
    Jumpiness = float(PlrProfile.Jumpiness);
    super.InitBot(B);
}
