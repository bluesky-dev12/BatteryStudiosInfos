/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\VehiclePart.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:2
 *
 *******************************************************************************/
class VehiclePart extends Actor
    native
    abstract
    placeable;

var bool bUpdating;

function Update(float DeltaTime);
function Activate(bool bActive);
