/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\SPHighScore.uc
 * Package Imports:
 *	GUI2K4
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:5
 *	Functions:5
 *
 *******************************************************************************/
class SPHighScore extends SPHighScoreBase
    dependson(SPHighScoreBase);

struct HighScoreEntry
{
    var string Name;
    var int Balance;
    var int Matches;
    var int Wins;
    var float Difficulty;
    var bool bDrone;
};

var array<HighScoreEntry> Scores;
var int MaxEntries;
var localized string CheaterName;
var string PlayerIDHash;
var delegate<CharUnlocked> __CharUnlocked__Delegate;

delegate CharUnlocked(string CharName);
function int AddHighScore(UT2K4GameProfile GP)
{
    local int i, newscore;
    local HighScoreEntry newentry;

    // End:0x25
    if(GP.IsCheater())
    {
        newentry.Name = CheaterName;
    }
    // End:0x3e
    else
    {
        newentry.Name = GP.PlayerName;
    }
    newentry.Balance = GP.Balance;
    newentry.Matches = GP.Matches;
    newentry.Wins = GP.Wins;
    newentry.Difficulty = GP.Difficulty;
    newentry.bDrone = false;
    newscore = CalcScore(newentry);
    i = 0;
    J0xc7:
    // End:0xff [While If]
    if(i < Scores.Length)
    {
        // End:0xf5
        if(CalcScore(Scores[i]) < newscore)
        {
        }
        // End:0xff
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0xc7;
        }
    }
    // End:0x114
    if(i >= MaxEntries)
    {
        return -1;
    }
    Scores.Insert(i, 1);
    Scores[i] = newentry;
    Scores.Length = MaxEntries;
    return i;
}

static function int CalcScore(HighScoreEntry Entry)
{
    local int res;

    res = int(Entry.Difficulty * float(100000)) - Entry.Matches * 100 + Entry.Balance;
    return res;
}

function UnlockChar(string char, optional string PlayerHash)
{
    local int i;

    // End:0x30
    if(PlayerIDHash != PlayerHash && PlayerHash != "")
    {
        UnlockedChars.Length = 0;
        PlayerIDHash = PlayerHash;
    }
    i = 0;
    J0x37:
    // End:0x68 [While If]
    if(i < UnlockedChars.Length)
    {
        // End:0x5e
        if(UnlockedChars[i] == char)
        {
            return;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x37;
    }
    UnlockedChars.Length = UnlockedChars.Length + 1;
    UnlockedChars[UnlockedChars.Length - 1] = char;
    // End:0xa8
    if(char != "")
    {
        CharUnlocked(char);
    }
}

function string StoredPlayerID()
{
    return PlayerIDHash;
}

defaultproperties
{
    Scores=// Object reference not set to an instance of an object.
    
    MaxEntries=25
    CheaterName="*** ?? ***"
}