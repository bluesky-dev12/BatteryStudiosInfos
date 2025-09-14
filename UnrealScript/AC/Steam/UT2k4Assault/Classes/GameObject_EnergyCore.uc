/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UT2k4Assault\Classes\GameObject_EnergyCore.uc
 * Package Imports:
 *	UT2k4Assault
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:10
 *	Functions:8
 *
 *******************************************************************************/
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
    return P.GetTeamNum() != Level.Game.GetDefenderNum() && !P.IsA('Vehicle');
}

function bool ValidHolder(Actor Other)
{
    // End:0x35
    if(super.ValidHolder(Other) && Other.IsA('Pawn'))
    {
        return CanBePickedUpBy(Pawn(Other));
    }
    return false;
}

function SetHolder(Controller C)
{
    local Controller Ctrl;

    // End:0x23
    if(C == none || C.Pawn == none)
    {
        return;
    }
    Ctrl = Level.ControllerList;
    J0x37:
    // End:0x98 [While If]
    if(Ctrl != none)
    {
        // End:0x81
        if(PlayerController(Ctrl) != none)
        {
            PlayerController(Ctrl).ReceiveLocalizedMessage(class'Message_PowerCore', 3, C.PlayerReplicationInfo,, MySpawnObjective);
        }
        Ctrl = Ctrl.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x37;
    }
    super.SetHolder(C);
    HomeBase.DisableObjective(C.Pawn);
}

function ClearHolder()
{
    super.ClearHolder();
}

function Drop(Vector NewVel, optional string sReason)
{
    local Controller C;

    // End:0x98
    if(Holder != none && Holder.PlayerReplicationInfo != none)
    {
        C = Level.ControllerList;
        J0x35:
        // End:0x95 [While If]
        if(C != none)
        {
            // End:0x7e
            if(PlayerController(C) != none)
            {
                PlayerController(C).ReceiveLocalizedMessage(class'Message_PowerCore', 0, Holder.PlayerReplicationInfo,, MySpawnObjective);
            }
            C = C.nextController;
            // This is an implied JumpToken; Continue!
            goto J0x35;
        }
    }
    // End:0xff
    else
    {
        C = Level.ControllerList;
        J0xac:
        // End:0xff [While If]
        if(C != none)
        {
            // End:0xe8
            if(PlayerController(C) != none)
            {
                PlayerController(C).ReceiveLocalizedMessage(class'Message_PowerCore', 1,,, MySpawnObjective);
            }
            C = C.nextController;
            // This is an implied JumpToken; Continue!
            goto J0xac;
        }
    }
    super.Drop(NewVel);
}

function HolderDied()
{
    Drop(vect(0.0, 0.0, 0.0));
}

function LogReturned()
{
    local Controller C;

    C = Level.ControllerList;
    J0x14:
    // End:0x68 [While If]
    if(C != none)
    {
        // End:0x51
        if(PlayerController(C) != none)
        {
            PlayerController(C).ReceiveLocalizedMessage(class'Message_PowerCore', 4,,, MySpawnObjective);
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
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
    GameObjBone=spine
    GameObjOffset=(X=25.0,Y=50.0,Z=0.0)
    GameObjRot=(Pitch=0,Yaw=0,Roll=16384)
    LightType=1
    LightEffect=21
    LightHue=40
    LightBrightness=200.0
    LightRadius=6.0
    DrawType=8
    bStatic=true
    bDynamicLight=true
    bStasis=true
    bAlwaysRelevant=true
    NetUpdateFrequency=100.0
    NetPriority=3.0
    DrawScale=0.750
    PrePivot=(X=2.0,Y=0.0,Z=0.50)
    bUnlit=true
    CollisionRadius=24.0
    CollisionHeight=20.0
    bCollideActors=true
    bCollideWorld=true
    Buoyancy=20.0
}