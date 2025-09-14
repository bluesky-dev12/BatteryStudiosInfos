class GameObject_EnergyCore extends GameObject;

var localized string PlayerDroppedMessage;
var localized string DroppedMessage;
var localized string EnergyCorePickedUp;
var localized string PlayerPickedUpEnergyCore;
var localized string PlayerCoreReset;
var string Announcer_EnergyCore_Dropped;
var string Announcer_EnergyCore_PickedUp;
var string Announcer_EnergyCore_Reset;
var bool bSoundsPrecached;
var ASOBJ_EnergyCore_Spawn MySpawnObjective;

function bool CanBePickedUpBy(Pawn P)
{
    return (P.GetTeamNum() != Level.Game.GetDefenderNum()) && !P.IsA('Vehicle');
    //return;    
}

function bool ValidHolder(Actor Other)
{
    // End:0x35
    if(super.ValidHolder(Other) && Other.IsA('Pawn'))
    {
        return CanBePickedUpBy(Pawn(Other));
    }
    return false;
    //return;    
}

function SetHolder(Controller C)
{
    local Controller Ctrl;

    // End:0x23
    if((C == none) || C.Pawn == none)
    {
        return;
    }
    Ctrl = Level.ControllerList;
    J0x37:

    // End:0x98 [Loop If]
    if(Ctrl != none)
    {
        // End:0x81
        if(PlayerController(Ctrl) != none)
        {
            PlayerController(Ctrl).ReceiveLocalizedMessage(Class'UT2k4Assault_Decompressed.Message_PowerCore', 3, C.PlayerReplicationInfo,, MySpawnObjective);
        }
        Ctrl = Ctrl.nextController;
        // [Loop Continue]
        goto J0x37;
    }
    super.SetHolder(C);
    HomeBase.DisableObjective(C.Pawn);
    //return;    
}

function ClearHolder()
{
    super.ClearHolder();
    //return;    
}

function Drop(Vector NewVel, optional string sReason)
{
    local Controller C;

    // End:0x98
    if((Holder != none) && Holder.PlayerReplicationInfo != none)
    {
        C = Level.ControllerList;
        J0x35:

        // End:0x95 [Loop If]
        if(C != none)
        {
            // End:0x7E
            if(PlayerController(C) != none)
            {
                PlayerController(C).ReceiveLocalizedMessage(Class'UT2k4Assault_Decompressed.Message_PowerCore', 0, Holder.PlayerReplicationInfo,, MySpawnObjective);
            }
            C = C.nextController;
            // [Loop Continue]
            goto J0x35;
        }        
    }
    else
    {
        C = Level.ControllerList;
        J0xAC:

        // End:0xFF [Loop If]
        if(C != none)
        {
            // End:0xE8
            if(PlayerController(C) != none)
            {
                PlayerController(C).ReceiveLocalizedMessage(Class'UT2k4Assault_Decompressed.Message_PowerCore', 1,,, MySpawnObjective);
            }
            C = C.nextController;
            // [Loop Continue]
            goto J0xAC;
        }
    }
    super.Drop(NewVel);
    //return;    
}

function HolderDied()
{
    Drop(vect(0.0000000, 0.0000000, 0.0000000));
    //return;    
}

function LogReturned()
{
    local Controller C;

    C = Level.ControllerList;
    J0x14:

    // End:0x68 [Loop If]
    if(C != none)
    {
        // End:0x51
        if(PlayerController(C) != none)
        {
            PlayerController(C).ReceiveLocalizedMessage(Class'UT2k4Assault_Decompressed.Message_PowerCore', 4,,, MySpawnObjective);
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x14;
    }
    //return;    
}

simulated function PrecacheAnnouncer(AnnouncerVoice V, bool bRewardSounds)
{
    // End:0x48
    if(!bRewardSounds && !bSoundsPrecached)
    {
        bSoundsPrecached = true;
        V.PrecacheSound(Announcer_EnergyCore_Dropped);
        V.PrecacheSound(Announcer_EnergyCore_PickedUp);
    }
    //return;    
}

defaultproperties
{
    PlayerDroppedMessage="????? ??? ??? ???????!"
    DroppedMessage="??? ??? ???????!"
    EnergyCorePickedUp="??? ??? ???????!"
    PlayerPickedUpEnergyCore=" ????? ??? ??? ???????!"
    PlayerCoreReset="??? ??? ??????!"
    Announcer_EnergyCore_Dropped="JY_PowerCoreDropped"
    Announcer_EnergyCore_PickedUp="JY_PowerCorePickedUp"
    Announcer_EnergyCore_Reset="JY_PowerCoreReset"
    bHome=true
    GameObjBone="spine"
    GameObjOffset=(X=25.0000000,Y=50.0000000,Z=0.0000000)
    GameObjRot=(Pitch=0,Yaw=0,Roll=16384)
    LightType=1
    LightEffect=21
    LightHue=40
    LightBrightness=200.0000000
    LightRadius=6.0000000
    DrawType=8
    bStatic=false
    bDynamicLight=true
    bStasis=false
    bAlwaysRelevant=true
    NetUpdateFrequency=100.0000000
    NetPriority=3.0000000
    DrawScale=0.7500000
    PrePivot=(X=2.0000000,Y=0.0000000,Z=0.5000000)
    bUnlit=true
    CollisionRadius=24.0000000
    CollisionHeight=20.0000000
    bCollideActors=true
    bCollideWorld=true
    Buoyancy=20.0000000
}