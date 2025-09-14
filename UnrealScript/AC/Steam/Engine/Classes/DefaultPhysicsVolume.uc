/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\DefaultPhysicsVolume.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class DefaultPhysicsVolume extends PhysicsVolume
    native
    notplaceable;

function Destroyed()
{
    Log(string(self) $ " destroyed!");
    assert(false);
}

defaultproperties
{
    bStatic=true
    bNoDelete=true
}