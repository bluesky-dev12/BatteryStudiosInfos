/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\DummySkyView.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class DummySkyView extends Actor
    placeable;

event PostNetBeginPlay()
{
    super.PostNetBeginPlay();
    Level.SkyViewLocation = Location;
    Destroy();
}
