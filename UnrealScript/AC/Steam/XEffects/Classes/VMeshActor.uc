/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\VMeshActor.uc
 * Package Imports:
 *	XEffects
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:1
 *
 *******************************************************************************/
class VMeshActor extends Actor
    placeable;

var() name StartAnim;
var() float StartAnimSpeed;

function Tick(float dt);

defaultproperties
{
    StartAnim=All
    StartAnimSpeed=1.0
    DrawType=2
    RemoteRole=0
    bUnlit=true
}