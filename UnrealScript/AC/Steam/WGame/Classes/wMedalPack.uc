/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wMedalPack.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:5
 *	States:1
 *
 *******************************************************************************/
class wMedalPack extends wSupplyPack;

replication
{
    // Pos:0x00
    reliable if(Role == 4)
        DeleteSuppliesPositions;

}

static simulated function UpdateHUD(HUD H)
{
    super(Pickup).UpdateHUD(H);
}

simulated event PostNetBeginPlay()
{
    local PlayerController PC;

    super(Actor).PostNetBeginPlay();
    PC = Level.GetLocalPlayerController();
    // End:0x3f
    if(PC != none)
    {
        PC.myHUD.CacheSuppliesPositions(self);
    }
    Level.Medals[Level.Medals.Length] = self;
}

function DeleteSuppliesPositions()
{
    local Controller C;
    local PlayerController PC;

    C = Level.ControllerList;
    J0x14:
    // End:0x61 [While If]
    if(C != none)
    {
        PC = PlayerController(C);
        // End:0x4a
        if(PC != none)
        {
            PC.ClientDeleteSuppliesPositions(self);
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
}

function DisplayEvent(Pawn P)
{
    local PlayerController PlayerOwner;

    // End:0x1b
    if(P.Role != 4)
    {
        return;
    }
    // End:0x67
    if(P.Controller != none && P.Controller.IsA('PlayerController'))
    {
        PlayerOwner = PlayerController(P.Controller);
    }
}

function Reset()
{
    DeleteSuppliesPositions();
    Destroy();
}

auto state Pickup
{
    function Touch(Actor Other)
    {
        local Pawn P;
        local PlayerController PC;

        // End:0x169
        if(ValidTouch(Other))
        {
            P = Pawn(Other);
            PC = PlayerController(P.Controller);
            ++ PC.PlayerReplicationInfo.NumMedals;
            Level.GRI.Teams[PC.GetTeamNum()].Score2 += 1.0;
            PC.ReceiveLocalizedMessage(class'wMessage_Game', class'wMessage_Game'.default.Code_GotMedal);
            Level.Game.TeamReceiveLocalizedMessageEx(byte(PC.GetTeamNum()), class'wMessage_Game', class'wMessage_Game'.default.Code_GotMedalAlly, PC.PlayerReplicationInfo, none, none, vect(0.0, 0.0, 0.0), 99999.0, true);
            Level.Game.TeamReceiveLocalizedMessage(byte(1 - PC.GetTeamNum()), class'wMessage_Game', class'wMessage_Game'.default.Code_GotMedalEnemy);
            AnnouncePickup(P);
            DisplayEvent(P);
            DeleteSuppliesPositions();
            Destroy();
        }
    }

}

defaultproperties
{
    bAmbientGlow=true
    PickupMessage="You got Health Pack"
    PickupSound=Sound'Warfare_Sound_Char.GetItem.char_getitem_healthpack'
    DrawType=8
    StaticMesh=StaticMesh'WPS_ETC.HealthPack.HealthPack'
    CullDistance=6500.0
    DrawScale3D=(X=0.50,Y=0.50,Z=0.50)
    Style=9
    RotationRate=(Pitch=0,Yaw=0,Roll=0)
    MessageClass=Class'UnrealGame.PickupMessagePlus'
}