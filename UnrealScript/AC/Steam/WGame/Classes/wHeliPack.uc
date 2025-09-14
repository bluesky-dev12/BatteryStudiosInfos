/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wHeliPack.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:5
 *	Functions:7
 *	States:1
 *
 *******************************************************************************/
class wHeliPack extends wSupplyPack;

var float fStayTime;
var Sound SoundPickUP;
var string StrSoundPickup;
var string strSoundStandby;
var int weaponID;

static simulated function UpdateHUD(HUD H)
{
    local float fTime;

    super(Pickup).UpdateHUD(H);
    fTime = H.Level.TimeSeconds;
    H.LastPickupTime = fTime;
    H.LastHeliPickupTime = fTime;
}

function DisplayEvent(Pawn P)
{
    local PlayerController PlayerOwner;
    local float fTime;

    // End:0x1b
    if(P.Role != 4)
    {
        return;
    }
    // End:0xd2
    if(P.Controller != none && P.Controller.IsA('PlayerController'))
    {
        PlayerOwner = PlayerController(P.Controller);
        // End:0xd2
        if(PlayerOwner.myHUD != none)
        {
            fTime = PlayerOwner.Level.TimeSeconds;
            PlayerOwner.myHUD.LastPickupTime = fTime;
            PlayerOwner.myHUD.LastHeliPickupTime = fTime;
        }
    }
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
    Level.SupplyList_Helicopter[Level.SupplyList_Helicopter.Length] = self;
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

function Reset()
{
    DeleteSuppliesPositions();
    Destroy();
}

function AnnouncePickup(Pawn Receiver)
{
    Receiver.HandlePickup(self);
}

function bool CanAddHelipack(Pawn P)
{
    // End:0x21
    if(P.PlayerReplicationInfo.bySupply_Helipack == 1)
    {
        return false;
    }
    // End:0x3a
    if(none != P.GetWeaponByInvenGroup(6))
    {
        return false;
    }
    return true;
}

auto state Pickup
{
    function Touch(Actor Other)
    {
        local Pawn P;
        local wWeapon W;

        // End:0x160
        if(ValidTouch(Other))
        {
            P = Pawn(Other);
            // End:0x160
            if(CanAddHelipack(P))
            {
                P.PlayerReplicationInfo.bySupply_Helipack = 1;
                W = P.AddWeapon(EmptyBtrDouble(), weaponID, 0, false);
                DisplayEvent(P);
                AnnouncePickup(P);
                PlayerController(P.Controller).ClientPlaySound(SoundPickUP,,, 0);
                PlayerController(P.Controller).QueueAnnouncement(class'wGameManager'.default.VoicePackageName $ strSoundStandby, 1);
                PlayerController(P.Controller).ClientChangeSlot6(W);
                DeleteSuppliesPositions();
                PlayerController(P.Controller).SkillBase.AddSupplyItem(1);
                PlayerController(P.Controller).ReceiveMessage_QuestType2(class'wMessage_Quest', class'wMessage_Quest'.default.Code_Quest_AcquireTrophy,,,, 2);
                Destroy();
            }
        }
    }

    function DestroyedByTime()
    {
        DeleteSuppliesPositions();
        Destroy();
    }

}

defaultproperties
{
    fStayTime=120.0
    SoundPickUP=Sound'Warfare_Sound_ATS.cb.ats_cb_ready_helicopter'
    strSoundStandby=".Combat_self.v_cb_ready_helicopter_R"
    weaponID=5009
    bAmbientGlow=true
    PickupMessage="You got Heli Pack"
    CullDistance=6500.0
    Physics=5
    Mesh=SkeletalMesh'WP_ETC_itembox.ItemBox_Heli'
    Style=9
    RotationRate=(Pitch=0,Yaw=20000,Roll=0)
    MessageClass=Class'UnrealGame.PickupMessagePlus'
}