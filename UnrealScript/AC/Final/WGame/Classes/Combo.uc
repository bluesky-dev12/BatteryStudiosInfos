class Combo extends Info
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var localized string ExecMessage;
var float AdrenalineCost;
var float Duration;
var Sound ActivateSound;
var Material Icon;
var Sound ComboAnnouncement;
var name ComboAnnouncementName;
var int keys[4];
var Class<SpeciesType> Species;

function PostBeginPlay()
{
    local wPawn P;

    P = wPawn(Owner);
    // End:0x20
    if(P == none)
    {
        Destroy();
        return;
    }
    StartEffect(P);
    //return;    
}

function AdrenalineEmpty()
{
    Destroy();
    //return;    
}

function Destroyed()
{
    local wPawn P;

    P = wPawn(Owner);
    // End:0x4A
    if(P != none)
    {
        StopEffect(P);
        // End:0x4A
        if(P.CurrentCombo == self)
        {
            P.CurrentCombo = none;
        }
    }
    //return;    
}

function StartEffect(wPawn P)
{
    //return;    
}

function StopEffect(wPawn P)
{
    //return;    
}

simulated function Tick(float DeltaTime)
{
    local Pawn P;

    P = Pawn(Owner);
    // End:0x36
    if((P == none) || P.Controller == none)
    {
        Destroy();
        return;
    }
    // End:0x86
    if((P.Controller.PlayerReplicationInfo != none) && P.Controller.PlayerReplicationInfo.HasFlag != none)
    {
        DeltaTime *= float(2);
    }
    P.Controller.Adrenaline -= ((AdrenalineCost * DeltaTime) / Duration);
    // End:0xF3
    if(P.Controller.Adrenaline <= 0.0000000)
    {
        P.Controller.Adrenaline = 0.0000000;
        Destroy();
    }
    //return;    
}

defaultproperties
{
    AdrenalineCost=100.0000000
    Duration=30.0000000
}