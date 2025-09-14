class HudOverlay extends Actor
    notplaceable;

simulated function Render(Canvas C)
{
    //return;    
}

simulated function Destroyed()
{
    // End:0x25
    if(HUD(Owner) != none)
    {
        HUD(Owner).RemoveHudOverlay(self);
    }
    super.Destroyed();
    //return;    
}

defaultproperties
{
    bHidden=true
    RemoteRole=0
}