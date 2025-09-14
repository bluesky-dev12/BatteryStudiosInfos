class wAIPawn extends wPawn;

function AddDefaultInventory(optional bool bQuickslotChange)
{
    super.AddDefaultInventory(bQuickslotChange);
    NotifyAddDefaultInventory();
    //return;    
}

function NotifyAddDefaultInventory()
{
    wAIBot(Controller).NotifyAddDefaultInventory();
    //return;    
}

function SetCannotFIndPath(Actor Dest)
{
    CannotFindPath = true;
    CannotFindPathTime = Level.TimeSeconds;
    CannotFindPathCount++;
    LogCannotFindPath(Dest);
    //return;    
}

function LogCannotFindPath(Actor Dest)
{
    Log((((((((((("[wAIPawn::SetCannotFIndPath] name=" $ PlayerReplicationInfo.PlayerName) $ " count=") $ string(CannotFindPathCount)) $ " loc=") $ string(Location)) $ " from=") $ string(Level.GetClosestNavigationPoint(Location))) $ " dest loc=") $ string(Dest)) $ " dest=") $ string(Level.GetClosestNavigationPoint(Dest.Location)));
    //return;    
}

function UpdateCannotFindPath()
{
    // End:0x27
    if((Level.TimeSeconds - CannotFindPathTime) > CannotFindPathTimeHoldDuration)
    {
        CannotFindPath = false;
    }
    //return;    
}

simulated event Tick(float dt)
{
    super.Tick(dt);
    UpdateCannotFindPath();
    //return;    
}

function CheckEntryVehicle()
{
    //return;    
}

event PlayLandedSound(int SurfType)
{
    // End:0x5F
    if(((Health > 0) && !bHidden) && (Level.TimeSeconds - SplashTime) > 0.2500000)
    {
        FmodPlaySound(SoundGroupClass.static.GetLandedSound3d(SurfType), 0, 1.0000000,,,,, true);
    }
    //return;    
}

defaultproperties
{
    CannotFindPathTimeHoldDuration=3.0000000
    fWallHearingFactor=2.0000000
    SightRadius=5000.0000000
    ControllerClass=Class'WGame_Decompressed.wAIBot'
}