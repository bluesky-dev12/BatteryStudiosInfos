/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\DynamicProjector.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class DynamicProjector extends Projector
    placeable;

function Tick(float DeltaTime)
{
    DetachProjector();
    AttachProjector();
}

defaultproperties
{
    bDynamicAttach=true
    bStatic=true
}