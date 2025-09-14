class wMedalPack extends wSupplyPack;

replication
{
    // Pos:0x000
    reliable if(int(Role) == int(ROLE_Authority))
        DeleteSuppliesPositions;
}

static simulated function UpdateHUD(HUD H)
{
    super(Pickup).UpdateHUD(H);
    //return;    
}

simulated event PostNetBeginPlay()
{
    local PlayerController PC;

    super(Actor).PostNetBeginPlay();
    PC = Level.GetLocalPlayerController();
    // End:0x3F
    if(PC != none)
    {
        PC.myHUD.CacheSuppliesPositions(self);
    }
    Level.Medals[Level.Medals.Length] = self;
    //return;    
}

function DeleteSuppliesPositions()
{
    local Controller C;
    local PlayerController PC;

    C = Level.ControllerList;
    J0x14:

    // End:0x61 [Loop If]
    if(C != none)
    {
        PC = PlayerController(C);
        // End:0x4A
        if(PC != none)
        {
            PC.ClientDeleteSuppliesPositions(self);
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x14;
    }
    //return;    
}

function DisplayEvent(Pawn P)
{
    local PlayerController PlayerOwner;
    local float fTime;

    // End:0x1B
    if(int(P.Role) != int(ROLE_Authority))
    {
        return;
    }
    // End:0x67
    if((P.Controller != none) && P.Controller.IsA('PlayerController'))
    {
        PlayerOwner = PlayerController(P.Controller);
    }
    //return;    
}

function Reset()
{
    DeleteSuppliesPositions();
    Destroy();
    //return;    
}

auto state Pickup
{
    function Touch(Actor Other)
    {
        local Pawn P;
        local PlayerController PC;
        local int iHeal;

        // End:0x169
        if(ValidTouch(Other))
        {
            P = Pawn(Other);
            PC = PlayerController(P.Controller);
            PC.PlayerReplicationInfo.NumMedals++;
            Level.GRI.Teams[PC.GetTeamNum()].Score2 += 1.0000000;
            PC.ReceiveLocalizedMessage(Class'Engine.wMessage_Game', Class'Engine.wMessage_Game'.default.Code_GotMedal);
            Level.Game.TeamReceiveLocalizedMessageEx(byte(PC.GetTeamNum()), Class'Engine.wMessage_Game', Class'Engine.wMessage_Game'.default.Code_GotMedalAlly, PC.PlayerReplicationInfo, none, none, vect(0.0000000, 0.0000000, 0.0000000), 99999.0000000, true);
            Level.Game.TeamReceiveLocalizedMessage(byte(int(1) - PC.GetTeamNum()), Class'Engine.wMessage_Game', Class'Engine.wMessage_Game'.default.Code_GotMedalEnemy);
            AnnouncePickup(P);
            DisplayEvent(P);
            DeleteSuppliesPositions();
            Destroy();
        }
        //return;        
    }
    stop;    
}

defaultproperties
{
    bAmbientGlow=true
    PickupMessage="You got Health Pack"
    PickupSound=Sound'Warfare_Sound_Char.GetItem.char_getitem_healthpack'
    DrawType=8
    StaticMesh=StaticMesh'WPS_ETC.HealthPack.HealthPack'
    CullDistance=6500.0000000
    DrawScale3D=(X=0.5000000,Y=0.5000000,Z=0.5000000)
    Style=9
    RotationRate=(Pitch=0,Yaw=0,Roll=0)
    MessageClass=Class'UnrealGame.PickupMessagePlus'
}