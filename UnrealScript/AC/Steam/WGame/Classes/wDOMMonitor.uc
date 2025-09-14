/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wDOMMonitor.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:7
 *	Functions:2
 *
 *******************************************************************************/
class wDOMMonitor extends wMonitor
    abstract;

var() Material RedShader;
var() Material BlueShader;
var() Material ActiveShader;
var() Material InactiveShader;
var() Material ActiveTeamShader;
var() Material InactiveTeamShader;
var byte NewTeam;

simulated function UpdateForTeam()
{
    // End:0x2d
    if(NewTeam == 254)
    {
        Skins[2] = InactiveTeamShader;
        Skins[3] = InactiveShader;
    }
    // End:0xa1
    else
    {
        // End:0x59
        if(NewTeam == 0)
        {
            Skins[2] = RedTeamShader;
            Skins[3] = RedShader;
        }
        // End:0xa1
        else
        {
            // End:0x85
            if(NewTeam == 1)
            {
                Skins[2] = BlueTeamShader;
                Skins[3] = BlueShader;
            }
            // End:0xa1
            else
            {
                Skins[2] = ActiveTeamShader;
                Skins[3] = ActiveShader;
            }
        }
    }
}

simulated function Trigger(Actor Other, Pawn EventInstigator)
{
    local wDomPoint DPoint;

    DPoint = wDomPoint(Other);
    // End:0x80
    if(DPoint != none)
    {
        // End:0x3a
        if(!DPoint.bControllable)
        {
            NewTeam = 254;
        }
        // End:0x7a
        else
        {
            // End:0x5b
            if(DPoint.ControllingTeam == none)
            {
                NewTeam = byte(255);
            }
            // End:0x7a
            else
            {
                NewTeam = byte(DPoint.ControllingTeam.TeamIndex);
            }
        }
        UpdateForTeam();
    }
}

defaultproperties
{
    NewTeam=255
    Team=255
    DrawScale=0.50
}