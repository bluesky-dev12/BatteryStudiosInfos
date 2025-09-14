/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\ComboInvis.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:2
 *
 *******************************************************************************/
class ComboInvis extends Combo
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

function StartEffect(wPawn P)
{
    P.SetInvisibility(60.0);
}

function StopEffect(wPawn P)
{
    P.SetInvisibility(0.0);
}

defaultproperties
{
    ExecMessage="??!"
    ComboAnnouncementName=Invisible
    keys[0]=8
    keys[1]=8
    keys[2]=4
    keys[3]=4
}