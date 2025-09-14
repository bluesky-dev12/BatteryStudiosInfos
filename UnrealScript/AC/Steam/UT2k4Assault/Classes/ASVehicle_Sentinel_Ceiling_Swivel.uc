/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UT2k4Assault\Classes\ASVehicle_Sentinel_Ceiling_Swivel.uc
 * Package Imports:
 *	UT2k4Assault
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *	States:4
 *
 *******************************************************************************/
class ASVehicle_Sentinel_Ceiling_Swivel extends ASTurret_Minigun_Swivel
    notplaceable;

simulated event PostBeginPlay()
{
    super(ASTurret_Base).PostBeginPlay();
    GetBoneCoords('None');
    SetCollision(false, false);
    SetCollision(true, true);
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
        // End:0x33
        else
        {
            PlayAnim('IdleClosed', 4.0, 0.0);
        }
    }

    simulated function BeginState()
    {
        AnimEnd(0);
    }

}

state Active
{
    simulated event AnimEnd(int Channel)
    {
        GotoState('Active');
    }

    simulated function BeginState()
    {
        PlayAnim('IdleOpen', 4.0, 0.0);
    }

}

state Opening
{
    simulated function BeginState()
    {
        PlayAnim('Open', 0.330, 0.0);
    }

}

state Closing
{
    simulated function BeginState()
    {
        PlayAnim('Close', 0.330, 0.0);
    }

}

defaultproperties
{
    DrawType=2
    DrawScale=0.50
    CollisionRadius=96.0
    CollisionHeight=100.0
}