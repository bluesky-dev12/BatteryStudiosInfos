/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\InternetInfo.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:3
 *
 *******************************************************************************/
class InternetInfo extends Info
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    native
    transient
    notplaceable;

function int GetBeaconCount()
{
    return 0;
}

function string GetBeaconAddress(int i);
function string GetBeaconText(int i);
