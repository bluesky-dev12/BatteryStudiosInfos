/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\TeamPlayerReplicationInfo.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Structs:2
 *	Properties:17
 *	Functions:9
 *
 *******************************************************************************/
class TeamPlayerReplicationInfo extends PlayerReplicationInfo
    dependson(VehicleDamageType)
    dependson(WeaponDamageType)
    dependson(UnrealMPGameInfo)
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

struct WeaponStats
{
    var class<wWeapon> WeaponClass;
    var int Kills;
    var int Deaths;
    var int deathsholding;
};

struct VehicleStats
{
    var class<Vehicle> VehicleClass;
    var int Kills;
    var int Deaths;
    var int DeathsDriving;
};

var class<ScoreBoard> LocalStatsScreenClass;
var SquadAI Squad;
var bool bHolding;
var bool bFirstBlood;
var array<WeaponStats> WeaponStatsArray;
var array<VehicleStats> VehicleStatsArray;
var int FlagTouches;
var int FlagReturns;
var byte Spree[6];
var byte MultiKills[7];
var int Suicides;
var int flakcount;
var int combocount;
var int headcount;
var int ranovercount;
var int DaredevilPoints;
var byte Combos[5];

replication
{
    // Pos:0x00
    reliable if(bNetInitial && Role == 4)
        LocalStatsScreenClass;

    // Pos:0x18
    reliable if(Role == 4)
        Squad, bHolding;

}

simulated function PostBeginPlay()
{
    super.PostBeginPlay();
    // End:0x41
    if(UnrealMPGameInfo(Level.Game) != none)
    {
        LocalStatsScreenClass = UnrealMPGameInfo(Level.Game).LocalStatsScreenClass;
    }
}

simulated function UpdateWeaponStats(TeamPlayerReplicationInfo PRI, class<wWeapon> W, int newKills, int newDeaths, int newDeathsHolding)
{
    local int i;
    local WeaponStats NewWeaponStats;

    i = 0;
    J0x07:
    // End:0x7f [While If]
    if(i < WeaponStatsArray.Length)
    {
        // End:0x75
        if(WeaponStatsArray[i].WeaponClass == W)
        {
            WeaponStatsArray[i].Kills = newKills;
            WeaponStatsArray[i].Deaths = newDeaths;
            WeaponStatsArray[i].deathsholding = newDeathsHolding;
            return;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    NewWeaponStats.WeaponClass = W;
    NewWeaponStats.Kills = newKills;
    NewWeaponStats.Deaths = newDeaths;
    NewWeaponStats.deathsholding = newDeathsHolding;
    WeaponStatsArray[WeaponStatsArray.Length] = NewWeaponStats;
}

function AddWeaponKill(class<DamageType> D)
{
    local class<wWeapon> W;
    local int i;
    local WeaponStats NewWeaponStats;

    // End:0x22
    if(class<VehicleDamageType>(D) != none)
    {
        AddVehicleKill(class<VehicleDamageType>(D));
        return;
    }
    // End:0x34
    if(class<WeaponDamageType>(D) == none)
    {
        return;
    }
    W = class<WeaponDamageType>(D).default.WeaponClass;
    i = 0;
    J0x54:
    // End:0x9c [While If]
    if(i < WeaponStatsArray.Length)
    {
        // End:0x92
        if(WeaponStatsArray[i].WeaponClass == W)
        {
            ++ WeaponStatsArray[i].Kills;
            return;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x54;
    }
    NewWeaponStats.WeaponClass = W;
    NewWeaponStats.Kills = 1;
    WeaponStatsArray[WeaponStatsArray.Length] = NewWeaponStats;
}

function AddWeaponDeath(class<DamageType> D)
{
    local class<wWeapon> W, LastWeapon;
    local int i;
    local WeaponStats NewWeaponStats;
    local Vehicle DrivenVehicle;

    // End:0x83
    if(Controller(Owner).Pawn != none)
    {
        DrivenVehicle = Vehicle(Controller(Owner).Pawn);
        // End:0x64
        if(DrivenVehicle == none)
        {
            DrivenVehicle = Controller(Owner).Pawn.DrivenVehicle;
        }
        // End:0x83
        if(DrivenVehicle != none)
        {
            AddVehicleDeathDriving(DrivenVehicle.Class);
        }
    }
    // End:0xbe
    if(DrivenVehicle == none)
    {
        LastWeapon = Controller(Owner).GetLastWeapon();
        // End:0xbe
        if(LastWeapon != none)
        {
            AddWeaponDeathHolding(LastWeapon);
        }
    }
    // End:0xe0
    if(class<VehicleDamageType>(D) != none)
    {
        AddVehicleDeath(class<VehicleDamageType>(D));
        return;
    }
    // End:0xf2
    if(class<WeaponDamageType>(D) == none)
    {
        return;
    }
    W = class<WeaponDamageType>(D).default.WeaponClass;
    i = 0;
    J0x112:
    // End:0x15a [While If]
    if(i < WeaponStatsArray.Length)
    {
        // End:0x150
        if(WeaponStatsArray[i].WeaponClass == W)
        {
            ++ WeaponStatsArray[i].Deaths;
            return;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x112;
    }
    NewWeaponStats.WeaponClass = W;
    NewWeaponStats.Deaths = 1;
    WeaponStatsArray[WeaponStatsArray.Length] = NewWeaponStats;
}

function AddWeaponDeathHolding(class<wWeapon> W)
{
    local int i;
    local WeaponStats NewWeaponStats;

    i = 0;
    J0x07:
    // End:0x4f [While If]
    if(i < WeaponStatsArray.Length)
    {
        // End:0x45
        if(WeaponStatsArray[i].WeaponClass == W)
        {
            ++ WeaponStatsArray[i].deathsholding;
            return;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    NewWeaponStats.WeaponClass = W;
    NewWeaponStats.deathsholding = 1;
    WeaponStatsArray[WeaponStatsArray.Length] = NewWeaponStats;
}

simulated function UpdateVehicleStats(TeamPlayerReplicationInfo PRI, class<Vehicle> V, int newKills, int newDeaths, int newDeathsDriving)
{
    local int i;
    local VehicleStats NewVehicleStats;

    i = 0;
    J0x07:
    // End:0x7f [While If]
    if(i < VehicleStatsArray.Length)
    {
        // End:0x75
        if(VehicleStatsArray[i].VehicleClass == V)
        {
            VehicleStatsArray[i].Kills = newKills;
            VehicleStatsArray[i].Deaths = newDeaths;
            VehicleStatsArray[i].DeathsDriving = newDeathsDriving;
            return;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    NewVehicleStats.VehicleClass = V;
    NewVehicleStats.Kills = newKills;
    NewVehicleStats.Deaths = newDeaths;
    NewVehicleStats.DeathsDriving = newDeathsDriving;
    VehicleStatsArray[VehicleStatsArray.Length] = NewVehicleStats;
}

function AddVehicleKill(class<VehicleDamageType> D)
{
    local class<Vehicle> V;
    local int i;
    local VehicleStats NewVehicleStats;

    V = D.default.VehicleClass;
    // End:0x21
    if(V == none)
    {
        return;
    }
    i = 0;
    J0x28:
    // End:0x70 [While If]
    if(i < VehicleStatsArray.Length)
    {
        // End:0x66
        if(VehicleStatsArray[i].VehicleClass == V)
        {
            ++ VehicleStatsArray[i].Kills;
            return;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x28;
    }
    NewVehicleStats.VehicleClass = V;
    NewVehicleStats.Kills = 1;
    VehicleStatsArray[VehicleStatsArray.Length] = NewVehicleStats;
}

function AddVehicleDeath(class<DamageType> D)
{
    local class<Vehicle> V;
    local int i;
    local VehicleStats NewVehicleStats;

    // End:0x12
    if(class<VehicleDamageType>(D) == none)
    {
        return;
    }
    V = class<VehicleDamageType>(D).default.VehicleClass;
    // End:0x38
    if(V == none)
    {
        return;
    }
    i = 0;
    J0x3f:
    // End:0x87 [While If]
    if(i < VehicleStatsArray.Length)
    {
        // End:0x7d
        if(VehicleStatsArray[i].VehicleClass == V)
        {
            ++ VehicleStatsArray[i].Deaths;
            return;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x3f;
    }
    NewVehicleStats.VehicleClass = V;
    NewVehicleStats.Deaths = 1;
    VehicleStatsArray[VehicleStatsArray.Length] = NewVehicleStats;
}

function AddVehicleDeathDriving(class<Vehicle> V)
{
    local int i;
    local VehicleStats NewVehicleStats;

    i = 0;
    J0x07:
    // End:0x4f [While If]
    if(i < VehicleStatsArray.Length)
    {
        // End:0x45
        if(VehicleStatsArray[i].VehicleClass == V)
        {
            ++ VehicleStatsArray[i].DeathsDriving;
            return;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    NewVehicleStats.VehicleClass = V;
    NewVehicleStats.DeathsDriving = 1;
    VehicleStatsArray[VehicleStatsArray.Length] = NewVehicleStats;
}
