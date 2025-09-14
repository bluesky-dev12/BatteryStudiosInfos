/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\UnrealSecurity.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *	States:1
 *
 *******************************************************************************/
class UnrealSecurity extends Security
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

event ServerCallback(int SecType, string Data)
{
    super.ServerCallback(SecType, Data);
}

auto state StartUp
{
    function Timer();

Begin:
    SetTimer(FRand() + float(1), false);
    stop;        
}
