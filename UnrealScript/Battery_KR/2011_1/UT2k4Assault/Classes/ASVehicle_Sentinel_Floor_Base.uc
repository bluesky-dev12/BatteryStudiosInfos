class ASVehicle_Sentinel_Floor_Base extends ASTurret_Base
    notplaceable;

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    GetBoneCoords('None');
    SetCollision(false, false);
    SetCollision(true, true);
    //return;    
}

auto state Sleeping
{
    simulated event AnimEnd(int Channel)
    {
        // End:0x21
        if(ASVehicle_Sentinel(Owner).bActive)
        {
            GotoState('Opening');            
        }
        else
        {
            PlayAnim('IdleClosed', 4.0000000, 0.0000000);
        }
        //return;        
    }

    simulated function BeginState()
    {
        AnimEnd(0);
        //return;        
    }
    stop;    
}

state Active
{
    simulated function BeginState()
    {
        LoopAnim('IdleOpen', 4.0000000, 0.0000000);
        //return;        
    }
    stop;    
}

state Opening
{
    simulated event AnimEnd(int Channel)
    {
        GotoState('Active');
        //return;        
    }

    simulated function BeginState()
    {
        PlayAnim('Open', 0.3300000, 0.0000000);
        //return;        
    }
    stop;    
}

state Closing
{
    simulated function BeginState()
    {
        PlayAnim('Close', 0.3300000, 0.0000000);
        //return;        
    }
    stop;    
}

defaultproperties
{
    DrawType=2
    DrawScale=0.5000000
    CollisionRadius=96.0000000
    CollisionHeight=100.0000000
}