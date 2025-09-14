/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\ClientMover.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *	States:1
 *
 *******************************************************************************/
class ClientMover extends Mover
    notplaceable;

function PostBeginPlay()
{
    super.PostBeginPlay();
    // End:0x34
    if(Level.NetMode == 1)
    {
        GotoState('ServerIdle');
        SetTimer(0.0, false);
        SetPhysics(0);
    }
}

state ServerIdle
{

}

defaultproperties
{
    bAlwaysRelevant=true
    RemoteRole=0
    bClientAuthoritative=true
}