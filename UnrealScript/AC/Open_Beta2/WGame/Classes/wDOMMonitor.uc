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
    // End:0x2D
    if(int(NewTeam) == 254)
    {
        Skins[2] = InactiveTeamShader;
        Skins[3] = InactiveShader;        
    }
    else
    {
        // End:0x59
        if(int(NewTeam) == 0)
        {
            Skins[2] = RedTeamShader;
            Skins[3] = RedShader;            
        }
        else
        {
            // End:0x85
            if(int(NewTeam) == 1)
            {
                Skins[2] = BlueTeamShader;
                Skins[3] = BlueShader;                
            }
            else
            {
                Skins[2] = ActiveTeamShader;
                Skins[3] = ActiveShader;
            }
        }
    }
    //return;    
}

simulated function Trigger(Actor Other, Pawn EventInstigator)
{
    local wDomPoint DPoint;

    DPoint = wDomPoint(Other);
    // End:0x80
    if(DPoint != none)
    {
        // End:0x3A
        if(!DPoint.bControllable)
        {
            NewTeam = 254;            
        }
        else
        {
            // End:0x5B
            if(DPoint.ControllingTeam == none)
            {
                NewTeam = byte(255);                
            }
            else
            {
                NewTeam = byte(DPoint.ControllingTeam.TeamIndex);
            }
        }
        UpdateForTeam();
    }
    //return;    
}

defaultproperties
{
    NewTeam=255
    Team=255
    DrawScale=0.5000000
}