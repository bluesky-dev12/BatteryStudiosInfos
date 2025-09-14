/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XWeapons\Classes\ShieldEffect.uc
 * Package Imports:
 *	XWeapons
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:3
 *
 *******************************************************************************/
class ShieldEffect extends Actor
    notplaceable;

var float Brightness;
var float DesiredBrightness;

function Flash(int Drain)
{
    Brightness = FMin(Brightness + float(Drain / 2), 250.0);
    Skins[0] = Skins[1];
    SetTimer(0.20, false);
}

function Timer()
{
    Skins[0] = default.Skins[0];
}

function SetBrightness(int B)
{
    DesiredBrightness = FMin(50.0 + float(B * 2), 250.0);
}

defaultproperties
{
    Brightness=250.0
    DesiredBrightness=250.0
    DrawType=8
    bHidden=true
    bOnlyOwnerSee=true
    RemoteRole=0
    DrawScale=1.80
    AmbientGlow=250
    bUnlit=true
}