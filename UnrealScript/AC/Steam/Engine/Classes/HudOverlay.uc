/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\HudOverlay.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:2
 *
 *******************************************************************************/
class HudOverlay extends Actor
    notplaceable;

simulated function Render(Canvas C);
simulated function Destroyed()
{
    // End:0x25
    if(HUD(Owner) != none)
    {
        HUD(Owner).RemoveHudOverlay(self);
    }
    super.Destroyed();
}

defaultproperties
{
    bHidden=true
    RemoteRole=0
}