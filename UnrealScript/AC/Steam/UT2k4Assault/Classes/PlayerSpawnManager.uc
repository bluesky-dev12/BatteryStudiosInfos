/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UT2k4Assault\Classes\PlayerSpawnManager.uc
 * Package Imports:
 *	UT2k4Assault
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:2
 *	Properties:8
 *	Functions:7
 *
 *******************************************************************************/
class PlayerSpawnManager extends Info
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

enum EPSM_AssaultTeam
{
    EPSM_Attackers,
    EPSM_Defenders
};

enum EPSM_ForcePossessPawn
{
    EPSM_None,
    EPSM_ForcedPawnClass,
    EPSM_ForceDefaultPawnClass
};

var() PlayerSpawnManager.EPSM_AssaultTeam AssaultTeam;
var() PlayerSpawnManager.EPSM_ForcePossessPawn OverridePawnClass;
var() class<Pawn> ForcedPawnClass;
var() int PlayerStartTeam;
var() bool bEnabled;
var bool BACKUP_bEnabled;
var() bool bAllowTeleporting;
var() editinline array<editinline name> DisabledVehicleFactoriesTag;

simulated function PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    BACKUP_bEnabled = bEnabled;
}

simulated function UpdatePrecacheMaterials()
{
    super(Actor).UpdatePrecacheMaterials();
    // End:0x40
    if(ForcedPawnClass != none && Level.NetMode != 1)
    {
        ForcedPawnClass.static.StaticPrecache(Level);
    }
}

function SetEnabled(bool bNewStatus)
{
    local ASVehicleFactory ASVF;
    local int i;

    // End:0x13
    if(bNewStatus == bEnabled)
    {
        return;
    }
    bEnabled = bNewStatus;
    // End:0x9a
    if(!bEnabled)
    {
        // End:0x97
        if(DisabledVehicleFactoriesTag.Length > 0)
        {
            // End:0x96
            foreach DynamicActors(class'ASVehicleFactory', ASVF)
            {
                i = 0;
                J0x4e:
                // End:0x95 [While If]
                if(i < DisabledVehicleFactoriesTag.Length)
                {
                    // End:0x8b
                    if(ASVF.Tag == DisabledVehicleFactoriesTag[i])
                    {
                        ASVF.Shutdown();
                    }
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0x4e;
                }                                
            }
        }
    }
    // End:0xcd
    else
    {
        // End:0xcd
        if(bAllowTeleporting)
        {
            ASGameInfo(Level.Game).NewSpawnAreaEnabled(AssaultTeam == 1);
        }
    }
}

function Trigger(Actor Other, Pawn EventInstigator)
{
    // End:0x1a
    if(bEnabled)
    {
        TriggerEvent(Event, self, EventInstigator);
    }
    SetEnabled(!bEnabled);
}

singular function bool ApprovePlayerStart(PlayerStart P, byte Team, Controller Player)
{
    local name OverrideTag;

    // End:0x33
    if(Player == none || Player.Event == 'None')
    {
        OverrideTag = 'None';
    }
    // End:0x47
    else
    {
        OverrideTag = Player.Event;
    }
    // End:0x65
    if(!bEnabled && OverrideTag == 'None')
    {
        return false;
    }
    // End:0x81
    if(P.TeamNumber != PlayerStartTeam)
    {
        return false;
    }
    // End:0x105
    if(Level.Game.IsA('ASGameInfo'))
    {
        // End:0xdc
        if(AssaultTeam == 0)
        {
            // End:0xd9
            if(!ASGameInfo(Level.Game).IsAttackingTeam(Team))
            {
                return false;
            }
        }
        // End:0x105
        else
        {
            // End:0x105
            if(ASGameInfo(Level.Game).IsAttackingTeam(Team))
            {
                return false;
            }
        }
    }
    // End:0x127
    if(OverrideTag != 'None' && OverrideTag != Tag)
    {
        return false;
    }
    return true;
}

function string PawnClassOverride(Controller C, NavigationPoint np, byte Team)
{
    // End:0x13
    if(OverridePawnClass == 0)
    {
        return "";
    }
    // End:0x46
    if(C == none || np == none || !np.IsA('PlayerStart'))
    {
        return "";
    }
    // End:0x68
    if(!ApprovePlayerStart(PlayerStart(np), Team, C))
    {
        return "";
    }
    // End:0x8d
    if(OverridePawnClass == 1 && ForcedPawnClass != none)
    {
        return string(ForcedPawnClass);
    }
    // End:0xa0
    if(OverridePawnClass == 2)
    {
        return "";
    }
    return "";
}

function Reset()
{
    super(Actor).Reset();
    bEnabled = BACKUP_bEnabled;
}

defaultproperties
{
    OverridePawnClass=2
    bEnabled=true
    bAllowTeleporting=true
    bNoDelete=true
}