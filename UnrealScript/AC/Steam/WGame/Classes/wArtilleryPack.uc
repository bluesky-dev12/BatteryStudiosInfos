/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wArtilleryPack.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:6
 *	States:1
 *
 *******************************************************************************/
class wArtilleryPack extends wSupplyPack;

var float fStayTime;
var int iAddWeaponID;
var Sound SoundPickUP;
var string strSoundStandby;

static simulated function UpdateHUD(HUD H)
{
    local float fTime;

    super(Pickup).UpdateHUD(H);
    fTime = H.Level.TimeSeconds;
    H.LastPickupTime = fTime;
    H.LastAirStirkePickupTime = fTime;
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
    Level.SupplyList_Artillery[Level.SupplyList_Artillery.Length] = self;
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

static function bool CanAddArtilleryPack(Pawn P)
{
    local Inventory Inv;
    local wWeapon Wpn;

    Inv = P.Inventory;
    J0x14:
    // End:0xad [While If]
    if(Inv != none)
    {
        Wpn = wWeapon(Inv);
        // End:0x53
        if(Wpn == none || Wpn.BaseParams == none)
        {
        }
        // End:0x96
        else
        {
            // End:0x76
            if(Wpn.BaseParams.iWeaponID == default.iAddWeaponID)
            {
                return false;
            }
            // End:0x96
            if(Wpn.BaseParams.iInventoryGroup == 6)
            {
                return false;
            }
        }
        Inv = Inv.Inventory;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
    return true;
}

auto state Pickup
{
    function Touch(Actor Other)
    {
        local wWeapon W;
        local Pawn P;
        local Sound sndStandby;

        sndStandby = Sound(DynamicLoadObject(class'wGameManager'.default.VoicePackageName $ strSoundStandby, class'Sound'));
        // End:0x180
        if(ValidTouch(Other))
        {
            P = Pawn(Other);
            // End:0x180
            if(CanAddArtilleryPack(P))
            {
                W = P.AddWeapon(EmptyBtrDouble(), iAddWeaponID, 0, false);
                P.PlayerReplicationInfo.bySupply_AirStrike = 1;
                AnnouncePickup(P);
                PlayerController(P.Controller).ClientChangeSlot6(W);
                PlayerController(P.Controller).ClientPlaySound(SoundPickUP,,, 0);
                PlayerController(P.Controller).QueueAnnouncement(class'wGameManager'.default.VoicePackageName $ strSoundStandby, 1);
                DeleteSuppliesPositions();
                PlayerController(P.Controller).SkillBase.AddSupplyItem(0);
                PlayerController(P.Controller).ReceiveMessage_QuestType2(class'wMessage_Quest', class'wMessage_Quest'.default.Code_Quest_AcquireTrophy,,,, 3);
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
    iAddWeaponID=5006
    SoundPickUP=Sound'Warfare_Sound_ATS.cb.ats_cb_ready_artillery'
    strSoundStandby=".Combat_self.v_cb_ready_artillery_R"
    bAmbientGlow=true
    PickupMessage="You got Artillery Pack"
    CullDistance=6500.0
    Physics=5
    Mesh=SkeletalMesh'WP_ETC_itembox.ItemBox_Artil'
    Style=9
    RotationRate=(Pitch=0,Yaw=20000,Roll=0)
    MessageClass=Class'UnrealGame.PickupMessagePlus'
}