class ObjectivePointingArrow extends Actor
    notplaceable;

var Vector DrawOffset;
var Material PulseTeamSkin[2];
var Material TeamSkin[2];

simulated function SetTeamSkin(byte Team, bool bPulse)
{
    // End:0x21
    if(bPulse)
    {
        Skins[0] = PulseTeamSkin[int(Team)];        
    }
    else
    {
        Skins[0] = TeamSkin[int(Team)];
    }
    //return;    
}

simulated function SetYellowColor(bool bPulse)
{
    //return;    
}

simulated function Render(Canvas C, PlayerController PC, Actor TrackedActor)
{
    local Rotator ArrowRot, camRot;
    local Vector ArrowLoc, camLoc, X, Y, Z;

    local Actor A;
    local float ScreenRatio;

    PC.PlayerCalcView(A, camLoc, camRot);
    ScreenRatio = 1.3333334 / (C.ClipX / C.ClipY);
    PC.GetAxes(camRot, X, Y, Z);
    ArrowLoc = ((camLoc + (X * DrawOffset.X)) + (Y * DrawOffset.Y)) + ((Z * ScreenRatio) * DrawOffset.Z);
    SetLocation(ArrowLoc);
    ArrowRot = Rotator(ArrowLoc - TrackedActor.Location);
    ArrowRot.Pitch += 32768;
    SetRotation(ArrowRot);
    C.DrawActor(self, false, false, 90.0000000);
    //return;    
}

defaultproperties
{
    DrawOffset=(X=16.0000000,Y=0.0000000,Z=9.5000000)
    DrawType=8
    bLightingVisibility=false
    bHidden=true
    bOnlyOwnerSee=true
    bAcceptsProjectors=false
    RemoteRole=0
    DrawScale=0.0150000
    DrawScale3D=(X=1.0000000,Y=4.0000000,Z=1.0000000)
    bUnlit=true
    bBlockZeroExtentTraces=false
    bBlockNonZeroExtentTraces=false
}