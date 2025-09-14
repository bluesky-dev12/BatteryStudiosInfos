class TeamPlayerReplicationInfo extends PlayerReplicationInfo
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

struct WeaponStats
{
    var Class<wWeapon> WeaponClass;
    var int Kills;
    var int Deaths;
    var int deathsholding;
};

struct VehicleStats
{
    var Class<Vehicle> VehicleClass;
    var int Kills;
    var int Deaths;
    var int DeathsDriving;
};

var Class<ScoreBoard> LocalStatsScreenClass;
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
    // Pos:0x000
    reliable if(bNetInitial && int(Role) == int(ROLE_Authority))
        LocalStatsScreenClass;

    // Pos:0x018
    reliable if(int(Role) == int(ROLE_Authority))
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
    //return;    
}

simulated function UpdateWeaponStats(TeamPlayerReplicationInfo PRI, Class<wWeapon> W, int newKills, int newDeaths, int newDeathsHolding)
{
    local int i;
    local WeaponStats NewWeaponStats;

    i = 0;
    J0x07:

    // End:0x7F [Loop If]
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
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    NewWeaponStats.WeaponClass = W;
    NewWeaponStats.Kills = newKills;
    NewWeaponStats.Deaths = newDeaths;
    NewWeaponStats.deathsholding = newDeathsHolding;
    WeaponStatsArray[WeaponStatsArray.Length] = NewWeaponStats;
    //return;    
}

function AddWeaponKill(Class<DamageType> D)
{
    local Class<wWeapon> W;
    local int i;
    local WeaponStats NewWeaponStats;

    // End:0x22
    if(Class<VehicleDamageType>(D) != none)
    {
        AddVehicleKill(Class<VehicleDamageType>(D));
        return;
    }
    // End:0x34
    if(Class<WeaponDamageType>(D) == none)
    {
        return;
    }
    W = Class<WeaponDamageType>(D).default.WeaponClass;
    i = 0;
    J0x54:

    // End:0x9C [Loop If]
    if(i < WeaponStatsArray.Length)
    {
        // End:0x92
        if(WeaponStatsArray[i].WeaponClass == W)
        {
            WeaponStatsArray[i].Kills++;
            return;
        }
        i++;
        // [Loop Continue]
        goto J0x54;
    }
    NewWeaponStats.WeaponClass = W;
    NewWeaponStats.Kills = 1;
    WeaponStatsArray[WeaponStatsArray.Length] = NewWeaponStats;
    //return;    
}

function AddWeaponDeath(Class<DamageType> D)
{
    local Class<wWeapon> W, LastWeapon;
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
    // End:0xBE
    if(DrivenVehicle == none)
    {
        LastWeapon = Controller(Owner).GetLastWeapon();
        // End:0xBE
        if(LastWeapon != none)
        {
            AddWeaponDeathHolding(LastWeapon);
        }
    }
    // End:0xE0
    if(Class<VehicleDamageType>(D) != none)
    {
        AddVehicleDeath(Class<VehicleDamageType>(D));
        return;
    }
    // End:0xF2
    if(Class<WeaponDamageType>(D) == none)
    {
        return;
    }
    W = Class<WeaponDamageType>(D).default.WeaponClass;
    i = 0;
    J0x112:

    // End:0x15A [Loop If]
    if(i < WeaponStatsArray.Length)
    {
        // End:0x150
        if(WeaponStatsArray[i].WeaponClass == W)
        {
            WeaponStatsArray[i].Deaths++;
            return;
        }
        i++;
        // [Loop Continue]
        goto J0x112;
    }
    NewWeaponStats.WeaponClass = W;
    NewWeaponStats.Deaths = 1;
    WeaponStatsArray[WeaponStatsArray.Length] = NewWeaponStats;
    //return;    
}

function AddWeaponDeathHolding(Class<wWeapon> W)
{
    local int i;
    local WeaponStats NewWeaponStats;

    i = 0;
    J0x07:

    // End:0x4F [Loop If]
    if(i < WeaponStatsArray.Length)
    {
        // End:0x45
        if(WeaponStatsArray[i].WeaponClass == W)
        {
            WeaponStatsArray[i].deathsholding++;
            return;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    NewWeaponStats.WeaponClass = W;
    NewWeaponStats.deathsholding = 1;
    WeaponStatsArray[WeaponStatsArray.Length] = NewWeaponStats;
    //return;    
}

simulated function UpdateVehicleStats(TeamPlayerReplicationInfo PRI, Class<Vehicle> V, int newKills, int newDeaths, int newDeathsDriving)
{
    local int i;
    local VehicleStats NewVehicleStats;

    i = 0;
    J0x07:

    // End:0x7F [Loop If]
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
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    NewVehicleStats.VehicleClass = V;
    NewVehicleStats.Kills = newKills;
    NewVehicleStats.Deaths = newDeaths;
    NewVehicleStats.DeathsDriving = newDeathsDriving;
    VehicleStatsArray[VehicleStatsArray.Length] = NewVehicleStats;
    //return;    
}

function AddVehicleKill(Class<VehicleDamageType> D)
{
    local Class<Vehicle> V;
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

    // End:0x70 [Loop If]
    if(i < VehicleStatsArray.Length)
    {
        // End:0x66
        if(VehicleStatsArray[i].VehicleClass == V)
        {
            VehicleStatsArray[i].Kills++;
            return;
        }
        i++;
        // [Loop Continue]
        goto J0x28;
    }
    NewVehicleStats.VehicleClass = V;
    NewVehicleStats.Kills = 1;
    VehicleStatsArray[VehicleStatsArray.Length] = NewVehicleStats;
    //return;    
}

function AddVehicleDeath(Class<DamageType> D)
{
    local Class<Vehicle> V;
    local int i;
    local VehicleStats NewVehicleStats;

    // End:0x12
    if(Class<VehicleDamageType>(D) == none)
    {
        return;
    }
    V = Class<VehicleDamageType>(D).default.VehicleClass;
    // End:0x38
    if(V == none)
    {
        return;
    }
    i = 0;
    J0x3F:

    // End:0x87 [Loop If]
    if(i < VehicleStatsArray.Length)
    {
        // End:0x7D
        if(VehicleStatsArray[i].VehicleClass == V)
        {
            VehicleStatsArray[i].Deaths++;
            return;
        }
        i++;
        // [Loop Continue]
        goto J0x3F;
    }
    NewVehicleStats.VehicleClass = V;
    NewVehicleStats.Deaths = 1;
    VehicleStatsArray[VehicleStatsArray.Length] = NewVehicleStats;
    //return;    
}

function AddVehicleDeathDriving(Class<Vehicle> V)
{
    local int i;
    local VehicleStats NewVehicleStats;

    i = 0;
    J0x07:

    // End:0x4F [Loop If]
    if(i < VehicleStatsArray.Length)
    {
        // End:0x45
        if(VehicleStatsArray[i].VehicleClass == V)
        {
            VehicleStatsArray[i].DeathsDriving++;
            return;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    NewVehicleStats.VehicleClass = V;
    NewVehicleStats.DeathsDriving = 1;
    VehicleStatsArray[VehicleStatsArray.Length] = NewVehicleStats;
    //return;    
}
