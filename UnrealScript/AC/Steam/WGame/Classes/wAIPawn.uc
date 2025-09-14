/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wAIPawn.uc
 * Package Imports:
 *	WGame
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:6
 *
 *******************************************************************************/
class wAIPawn extends wPawn
    dependson(wAIBot);

function AddDefaultInventory(optional bool bQuickslotChange)
{
    super.AddDefaultInventory(bQuickslotChange);
    wAIBot(Controller).NotifyAddDefaultInventory();
}

function SetCannotFIndPath(Actor Dest)
{
    CannotFindPath = true;
    CannotFindPathTime = Level.TimeSeconds;
    ++ CannotFindPathCount;
    LogCannotFindPath(Dest);
}

function LogCannotFindPath(Actor Dest)
{
    Log("[wAIPawn::SetCannotFIndPath] name=" $ PlayerReplicationInfo.PlayerName $ " count=" $ string(CannotFindPathCount) $ " loc=" $ string(Location) $ " from=" $ string(Level.GetClosestNavigationPoint(Location)) $ " dest loc=" $ string(Dest) $ " dest=" $ string(Level.GetClosestNavigationPoint(Dest.Location)));
}

function UpdateCannotFindPath()
{
    // End:0x27
    if(Level.TimeSeconds - CannotFindPathTime > CannotFindPathTimeHoldDuration)
    {
        CannotFindPath = false;
    }
}

simulated event Tick(float dt)
{
    super.Tick(dt);
    UpdateCannotFindPath();
}

function CheckEntryVehicle();

defaultproperties
{
    CannotFindPathTimeHoldDuration=3.0
    fWallHearingFactor=2.0
    SightRadius=5000.0
    ControllerClass=class'wAIBot'
}