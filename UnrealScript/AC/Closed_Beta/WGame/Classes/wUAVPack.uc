class wUAVPack extends wSupplyPack;

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
    H.LastUAVPickupTime = fTime;
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
    // End:0xD2
    if((P.Controller != none) && P.Controller.IsA('PlayerController'))
    {
        PlayerOwner = PlayerController(P.Controller);
        // End:0xD2
        if(PlayerOwner.myHUD != none)
        {
            fTime = PlayerOwner.Level.TimeSeconds;
            PlayerOwner.myHUD.LastPickupTime = fTime;
            PlayerOwner.myHUD.LastUAVPickupTime = fTime;
        }
    }
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
    Level.SupplyList_UAV[Level.SupplyList_UAV.Length] = self;
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

function Reset()
{
    DeleteSuppliesPositions();
    Destroy();
    //return;    
}

function AnnouncePickup(Pawn Receiver)
{
    Receiver.HandlePickup(self);
    //return;    
}

function bool CanAdUAVpack(Pawn P)
{
    // End:0x21
    if(int(P.PlayerReplicationInfo.bySupply_UAV) == 1)
    {
        return false;
    }
    // End:0x3A
    if(none != P.GetWeaponByInvenGroup(6))
    {
        return false;
    }
    return true;
    //return;    
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
            if(CanAdUAVpack(P))
            {
                P.PlayerReplicationInfo.bySupply_UAV = 1;
                W = P.AddWeapon(EmptyBtrDouble(), weaponID, 0, false);
                DisplayEvent(P);
                AnnouncePickup(P);
                PlayerController(P.Controller).ClientPlaySound(SoundPickUP,,, 0);
                PlayerController(P.Controller).QueueAnnouncement(Class'Engine.wGameManager'.default.VoicePackageName $ strSoundStandby, 1);
                PlayerController(P.Controller).ClientChangeSlot6(W);
                DeleteSuppliesPositions();
                PlayerController(P.Controller).SkillBase.AddSupplyItem(2);
                PlayerController(P.Controller).ReceiveMessage_QuestType2(Class'Engine.wMessage_Quest', Class'Engine.wMessage_Quest'.default.Code_Quest_AcquireTrophy,,,, 4);
                Destroy();
            }
        }
        //return;        
    }

    function DestroyedByTime()
    {
        DeleteSuppliesPositions();
        Destroy();
        //return;        
    }
    stop;    
}

defaultproperties
{
    fStayTime=120.0000000
    SoundPickUP=Sound'Warfare_Sound_ATS.cb.ats_cb_ready_uav'
    StrSoundPickup=".cb.ats_cb_ready_uav"
    strSoundStandby=".Combat_self.v_cb_ready_uav_R"
    weaponID=5010
    bAmbientGlow=true
    PickupMessage="You got UAV Pack"
    CullDistance=6500.0000000
    Physics=5
    Mesh=SkeletalMesh'WP_ETC_itembox.ItemBox_UAV'
    Style=9
    RotationRate=(Pitch=0,Yaw=20000,Roll=0)
    MessageClass=Class'UnrealGame.PickupMessagePlus'
}