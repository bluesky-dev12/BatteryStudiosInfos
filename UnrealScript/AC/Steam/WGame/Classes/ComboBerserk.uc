/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\ComboBerserk.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:2
 *
 *******************************************************************************/
class ComboBerserk extends Combo
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var wEmitter Effect;

function StartEffect(wPawn P);
function StopEffect(wPawn P);

defaultproperties
{
    ExecMessage="???!"
    ComboAnnouncementName=Berzerk
    keys[0]=2
    keys[1]=2
    keys[2]=1
    keys[3]=1
}