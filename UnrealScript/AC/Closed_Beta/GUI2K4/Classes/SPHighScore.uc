class SPHighScore extends SPHighScoreBase;

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
var protected string PlayerIDHash;
//var delegate<CharUnlocked> __CharUnlocked__Delegate;

delegate CharUnlocked(string CharName)
{
    //return;    
}

function int AddHighScore(UT2K4GameProfile GP)
{
    local int i, newscore;
    local HighScoreEntry newentry;

    // End:0x25
    if(GP.IsCheater())
    {
        newentry.Name = CheaterName;        
    }
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
    J0xC7:

    // End:0xFF [Loop If]
    if(i < Scores.Length)
    {
        // End:0xF5
        if((CalcScore(Scores[i])) < newscore)
        {
            // [Explicit Break]
            goto J0xFF;
        }
        i++;
        // [Loop Continue]
        goto J0xC7;
    }
    J0xFF:

    // End:0x114
    if(i >= MaxEntries)
    {
        return -1;
    }
    Scores.Insert(i, 1);
    Scores[i] = newentry;
    Scores.Length = MaxEntries;
    return i;
    //return;    
}

static function int CalcScore(HighScoreEntry Entry)
{
    local int res;

    res = (int(Entry.Difficulty * float(100000)) - (Entry.Matches * 100)) + Entry.Balance;
    return res;
    //return;    
}

function UnlockChar(string char, optional string PlayerHash)
{
    local int i;

    // End:0x30
    if((PlayerIDHash != PlayerHash) && PlayerHash != "")
    {
        UnlockedChars.Length = 0;
        PlayerIDHash = PlayerHash;
    }
    i = 0;
    J0x37:

    // End:0x68 [Loop If]
    if(i < UnlockedChars.Length)
    {
        // End:0x5E
        if(UnlockedChars[i] == char)
        {
            return;
        }
        i++;
        // [Loop Continue]
        goto J0x37;
    }
    UnlockedChars.Length = UnlockedChars.Length + 1;
    UnlockedChars[UnlockedChars.Length - 1] = char;
    // End:0xA8
    if(char != "")
    {
        CharUnlocked(char);
    }
    //return;    
}

function string StoredPlayerID()
{
    return PlayerIDHash;
    //return;    
}

defaultproperties
{
    Scores[0]=(Name="Xan Kriegor",Balance=5000,Matches=40,Wins=40,Difficulty=2.0000000,bDrone=true)
    Scores[1]=(Name="Clan Lord",Balance=4900,Matches=45,Wins=41,Difficulty=2.0000000,bDrone=true)
    Scores[2]=(Name="Malcolm",Balance=4800,Matches=50,Wins=42,Difficulty=2.0000000,bDrone=true)
    Scores[3]=(Name="Dominator",Balance=4700,Matches=55,Wins=43,Difficulty=2.0000000,bDrone=true)
    Scores[4]=(Name="Enigma",Balance=4600,Matches=60,Wins=44,Difficulty=2.0000000,bDrone=true)
    Scores[5]=(Name="Jakob",Balance=4500,Matches=65,Wins=45,Difficulty=2.0000000,bDrone=true)
    Scores[6]=(Name="Cyclops",Balance=4400,Matches=70,Wins=46,Difficulty=2.0000000,bDrone=true)
    Scores[7]=(Name="Drekorig",Balance=4300,Matches=75,Wins=47,Difficulty=2.0000000,bDrone=true)
    Scores[8]=(Name="Aryss",Balance=4200,Matches=80,Wins=48,Difficulty=2.0000000,bDrone=true)
    Scores[9]=(Name="Axon",Balance=4100,Matches=85,Wins=49,Difficulty=2.0000000,bDrone=true)
    Scores[10]=(Name="Skakruk",Balance=4000,Matches=90,Wins=50,Difficulty=2.0000000,bDrone=true)
    Scores[11]=(Name="Tamika",Balance=3900,Matches=95,Wins=51,Difficulty=2.0000000,bDrone=true)
    Scores[12]=(Name="Cathode",Balance=3800,Matches=100,Wins=52,Difficulty=2.0000000,bDrone=true)
    Scores[13]=(Name="Guardian",Balance=3700,Matches=105,Wins=53,Difficulty=2.0000000,bDrone=true)
    Scores[14]=(Name="Othello",Balance=3600,Matches=110,Wins=54,Difficulty=2.0000000,bDrone=true)
    Scores[15]=(Name="Kraagesh",Balance=3500,Matches=115,Wins=55,Difficulty=2.0000000,bDrone=true)
    Scores[16]=(Name="Azure",Balance=3400,Matches=120,Wins=56,Difficulty=2.0000000,bDrone=true)
    Scores[17]=(Name="Mr.Crow",Balance=3300,Matches=125,Wins=57,Difficulty=2.0000000,bDrone=true)
    Scores[18]=(Name="Gaargod",Balance=3200,Matches=130,Wins=58,Difficulty=2.0000000,bDrone=true)
    Scores[19]=(Name="Annika",Balance=3100,Matches=135,Wins=59,Difficulty=2.0000000,bDrone=true)
    Scores[20]=(Name="Greith",Balance=3000,Matches=140,Wins=60,Difficulty=2.0000000,bDrone=true)
    Scores[21]=(Name="Gkublok",Balance=2900,Matches=145,Wins=61,Difficulty=2.0000000,bDrone=true)
    Scores[22]=(Name="Zarina",Balance=2800,Matches=150,Wins=62,Difficulty=2.0000000,bDrone=true)
    Scores[23]=(Name="Gorge",Balance=2700,Matches=155,Wins=63,Difficulty=2.0000000,bDrone=true)
    Scores[24]=(Name="Perdition",Balance=2600,Matches=160,Wins=64,Difficulty=2.0000000,bDrone=true)
    MaxEntries=25
    CheaterName="*** ?? ***"
}