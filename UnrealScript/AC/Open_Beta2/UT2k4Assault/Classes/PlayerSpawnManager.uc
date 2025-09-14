class PlayerSpawnManager extends Info
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

enum EPSM_AssaultTeam
{
    EPSM_Attackers,                 // 0
    EPSM_Defenders                  // 1
};

enum EPSM_ForcePossessPawn
{
    EPSM_None,                      // 0
    EPSM_ForcedPawnClass,           // 1
    EPSM_ForceDefaultPawnClass      // 2
};

var() PlayerSpawnManager.EPSM_AssaultTeam AssaultTeam;
var() PlayerSpawnManager.EPSM_ForcePossessPawn OverridePawnClass;
var() Class<Pawn> ForcedPawnClass;
var() int PlayerStartTeam;
var() bool bEnabled;
var bool BACKUP_bEnabled;
var() bool bAllowTeleporting;
var() editinline array<editinline name> DisabledVehicleFactoriesTag;

simulated function PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    BACKUP_bEnabled = bEnabled;
    //return;    
}

simulated function UpdatePrecacheMaterials()
{
    super(Actor).UpdatePrecacheMaterials();
    // End:0x40
    if((ForcedPawnClass != none) && int(Level.NetMode) != int(NM_DedicatedServer))
    {
        ForcedPawnClass.static.StaticPrecache(Level);
    }
    //return;    
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
    // End:0x9A
    if(!bEnabled)
    {
        // End:0x97
        if(DisabledVehicleFactoriesTag.Length > 0)
        {
            // End:0x96
            foreach DynamicActors(Class'UT2k4Assault_Decompressed.ASVehicleFactory', ASVF)
            {
                i = 0;
                J0x4E:

                // End:0x95 [Loop If]
                if(i < DisabledVehicleFactoriesTag.Length)
                {
                    // End:0x8B
                    if(ASVF.Tag == DisabledVehicleFactoriesTag[i])
                    {
                        ASVF.Shutdown();
                    }
                    i++;
                    // [Loop Continue]
                    goto J0x4E;
                }                
            }            
        }        
    }
    else
    {
        // End:0xCD
        if(bAllowTeleporting)
        {
            ASGameInfo(Level.Game).NewSpawnAreaEnabled(int(AssaultTeam) == int(1));
        }
    }
    //return;    
}

function Trigger(Actor Other, Pawn EventInstigator)
{
    // End:0x1A
    if(bEnabled)
    {
        TriggerEvent(Event, self, EventInstigator);
    }
    SetEnabled(!bEnabled);
    //return;    
}

singular function bool ApprovePlayerStart(PlayerStart P, byte Team, Controller Player)
{
    local name OverrideTag;

    // End:0x33
    if((Player == none) || Player.Event == 'None')
    {
        OverrideTag = 'None';        
    }
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
    if(int(P.TeamNumber) != PlayerStartTeam)
    {
        return false;
    }
    // End:0x105
    if(Level.Game.IsA('ASGameInfo'))
    {
        // End:0xDC
        if(int(AssaultTeam) == int(0))
        {
            // End:0xD9
            if(!ASGameInfo(Level.Game).IsAttackingTeam(int(Team)))
            {
                return false;
            }            
        }
        else
        {
            // End:0x105
            if(ASGameInfo(Level.Game).IsAttackingTeam(int(Team)))
            {
                return false;
            }
        }
    }
    // End:0x127
    if((OverrideTag != 'None') && OverrideTag != Tag)
    {
        return false;
    }
    return true;
    //return;    
}

function string PawnClassOverride(Controller C, NavigationPoint np, byte Team)
{
    // End:0x13
    if(int(OverridePawnClass) == int(0))
    {
        return "";
    }
    // End:0x46
    if(((C == none) || np == none) || !np.IsA('PlayerStart'))
    {
        return "";
    }
    // End:0x68
    if(!ApprovePlayerStart(PlayerStart(np), Team, C))
    {
        return "";
    }
    // End:0x8D
    if((int(OverridePawnClass) == int(1)) && ForcedPawnClass != none)
    {
        return string(ForcedPawnClass);
    }
    // End:0xA0
    if(int(OverridePawnClass) == int(2))
    {
        return "";
    }
    return "";
    //return;    
}

function Reset()
{
    super(Actor).Reset();
    bEnabled = BACKUP_bEnabled;
    //return;    
}

defaultproperties
{
    OverridePawnClass=2
    bEnabled=true
    bAllowTeleporting=true
    bNoDelete=true
}