class UT2K4DMRoster extends wDMRoster
    config
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var config array<string> UsedBots;
var array<string> BotList;

function PostBeginPlay()
{
    // End:0x17
    if(UsedBots.Length != 0)
    {
        RosterNames = UsedBots;
    }
    super.PostBeginPlay();
    //return;    
}

function PreInitialize(int TeamBots)
{
    local int i;

    Roster.Length = 0;
    UsedBots.Length = 0;
    i = 0;
    J0x17:

    // End:0x36 [Loop If]
    if(i < TeamBots)
    {
        AddPlayerFromList();
        i++;
        // [Loop Continue]
        goto J0x17;
    }
    SaveConfig();
    //return;    
}

function AddPlayerFromList()
{
    local int i, N;

    Rand(BotList.Length);
    i = Rand(BotList.Length);
    N = Roster.Length;
    Roster.Length = N + 1;
    UsedBots.Length = N + 1;
    Roster[N] = Class'WGame_Decompressed.wRosterEntry'.static.CreateRosterEntryCharacter(BotList[i]);
    Roster[N].PrecacheRosterFor(self);
    UsedBots[N] = BotList[i];
    BotList.Remove(i, 1);
    //return;    
}

defaultproperties
{
    BotList[0]="Avalanche"
    BotList[1]="Sorrow"
    BotList[2]="Perdition"
    BotList[3]="Vengeance"
    BotList[4]="Stargazer"
    BotList[5]="Phantom"
    BotList[6]="Kain"
    BotList[7]="Silhouette"
    BotList[8]="Sphinx"
    BotList[9]="Natron"
    BotList[10]="Nafiret"
    BotList[11]="Tranquility"
    TeamName="????(Death Match)"
}