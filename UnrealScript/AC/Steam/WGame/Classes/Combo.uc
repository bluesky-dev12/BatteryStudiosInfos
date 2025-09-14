/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\Combo.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:9
 *	Functions:6
 *
 *******************************************************************************/
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
var class<SpeciesType> Species;

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
    // End:0x41
    if(ActivateSound != none)
    {
        PlaySound(ActivateSound, 0, 2.0 * TransientSoundVolume);
    }
    StartEffect(P);
}

function AdrenalineEmpty()
{
    Destroy();
}

function Destroyed()
{
    local wPawn P;

    P = wPawn(Owner);
    // End:0x4a
    if(P != none)
    {
        StopEffect(P);
        // End:0x4a
        if(P.CurrentCombo == self)
        {
            P.CurrentCombo = none;
        }
    }
}

function StartEffect(wPawn P);
function StopEffect(wPawn P);
simulated function Tick(float DeltaTime)
{
    local Pawn P;

    P = Pawn(Owner);
    // End:0x36
    if(P == none || P.Controller == none)
    {
        Destroy();
        return;
    }
    // End:0x86
    if(P.Controller.PlayerReplicationInfo != none && P.Controller.PlayerReplicationInfo.HasFlag != none)
    {
        DeltaTime *= float(2);
    }
    P.Controller.Adrenaline -= AdrenalineCost * DeltaTime / Duration;
    // End:0xf3
    if(P.Controller.Adrenaline <= 0.0)
    {
        P.Controller.Adrenaline = 0.0;
        Destroy();
    }
}

defaultproperties
{
    AdrenalineCost=100.0
    Duration=30.0
}