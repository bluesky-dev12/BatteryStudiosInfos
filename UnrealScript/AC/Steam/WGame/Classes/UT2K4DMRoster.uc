/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\UT2K4DMRoster.uc
 * Package Imports:
 *	WGame
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:3
 *
 *******************************************************************************/
class UT2K4DMRoster extends wDMRoster
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    config();

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
}

function PreInitialize(int TeamBots)
{
    local int i;

    Roster.Length = 0;
    UsedBots.Length = 0;
    i = 0;
    J0x17:
    // End:0x36 [While If]
    if(i < TeamBots)
    {
        AddPlayerFromList();
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x17;
    }
    SaveConfig();
}

function AddPlayerFromList()
{
    local int i, N;

    Rand(BotList.Length);
    i = Rand(BotList.Length);
    N = Roster.Length;
    Roster.Length = N + 1;
    UsedBots.Length = N + 1;
    Roster[N] = class'wRosterEntry'.static.CreateRosterEntryCharacter(BotList[i]);
    Roster[N].PrecacheRosterFor(self);
    UsedBots[N] = BotList[i];
    BotList.Remove(i, 1);
}

defaultproperties
{
    BotList=// Object reference not set to an instance of an object.
    
    TeamName="????(Death Match)"
}