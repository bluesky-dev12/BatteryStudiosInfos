/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WMission\Classes\wObjectivePointingArrow.uc
 * Package Imports:
 *	WMission
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:3
 *
 *******************************************************************************/
class wObjectivePointingArrow extends Actor
    notplaceable;

var Vector DrawOffset;
var Material PulseTeamSkin[2];
var Material TeamSkin[2];

simulated function SetTeamSkin(byte Team, bool bPulse)
{
    // End:0x21
    if(bPulse)
    {
        Skins[0] = PulseTeamSkin[Team];
    }
    // End:0x36
    else
    {
        Skins[0] = TeamSkin[Team];
    }
}

simulated function SetYellowColor(bool bPulse);
simulated function Render(Canvas C, PlayerController PC, Actor TrackedActor)
{
    local Rotator ArrowRot, camRot;
    local Vector ArrowLoc, camLoc, X, Y, Z;

    local Actor A;
    local float ScreenRatio;

    PC.PlayerCalcView(A, camLoc, camRot);
    ScreenRatio = 1.3333330 / C.ClipX / C.ClipY;
    PC.GetAxes(camRot, X, Y, Z);
    ArrowLoc = camLoc + X * DrawOffset.X + Y * DrawOffset.Y + Z * ScreenRatio * DrawOffset.Z;
    SetLocation(ArrowLoc);
    ArrowRot = rotator(ArrowLoc - TrackedActor.Location);
    ArrowRot.Pitch += 32768;
    SetRotation(ArrowRot);
    C.DrawActor(self, false, false, 90.0);
}

defaultproperties
{
    DrawOffset=(X=16.0,Y=0.0,Z=9.50)
    DrawType=8
    bLightingVisibility=true
    bHidden=true
    bOnlyOwnerSee=true
    bAcceptsProjectors=true
    RemoteRole=0
    DrawScale=0.0150
    DrawScale3D=(X=1.0,Y=4.0,Z=1.0)
    bUnlit=true
    bBlockZeroExtentTraces=true
    bBlockNonZeroExtentTraces=true
}