class wArtilleryPack extends wSupplyPack;

var float fStayTime;
var int iAddWeaponID;
var string SoundPickUP;
var string strSoundStandby;

static simulated function UpdateHUD(HUD H)
{
    local float fTime;

    super(Pickup).UpdateHUD(H);
    fTime = H.Level.TimeSeconds;
    H.LastPickupTime = fTime;
    H.LastAirStirkePickupTime = fTime;
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
    Level.SupplyList_Artillery[Level.SupplyList_Artillery.Length] = self;
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

static function bool CanPickUpPack(Pawn Pawn)
{
    local Inventory Inv;
    local wWeapon Wpn;

    Inv = Pawn.Inventory;
    J0x14:

    // End:0xAD [Loop If]
    if(Inv != none)
    {
        Wpn = wWeapon(Inv);
        // End:0x53
        if((Wpn == none) || Wpn.BaseParams == none)
        {            
        }
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
        // [Loop Continue]
        goto J0x14;
    }
    return true;
    //return;    
}

auto state Pickup
{
    function Touch(Actor Other)
    {
        local wWeapon W;
        local Pawn P;
        local Sound sndStandby;

        sndStandby = Sound(DynamicLoadObject(Class'Engine.wGameManager'.default.VoicePackageName $ strSoundStandby, Class'Engine.Sound'));
        // End:0x175
        if(ValidTouch(Other))
        {
            P = Pawn(Other);
            // End:0x175
            if(CanPickUpPack(P))
            {
                W = P.AddWeapon(EmptyBtrDouble(), iAddWeaponID, 0, false);
                P.PlayerReplicationInfo.abySupplyItemFlag[int(3)] = 1;
                AnnouncePickup(P);
                PlayerController(P.Controller).ClientChangeSlot6(W);
                PlayerController(P.Controller).FmodClientPlaySound(SoundPickUP,,, 0);
                PlayerController(P.Controller).QueueAnnouncement(strSoundStandby, 1);
                DeleteSuppliesPositions();
                PlayerController(P.Controller).SkillBase.AddSupplyItem(3);
                PlayerController(P.Controller).ReceiveMessage_QuestType2(Class'Engine.wMessage_Quest', Class'Engine.wMessage_Quest'.default.Code_Quest_AcquireTrophy,,,, 3);
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
    iAddWeaponID=5006
    SoundPickUP="Warfare_Sound_ATS/cb/ats_cb_ready_artillery"
    strSoundStandby="/Combat_self/v_cb_ready_artillery_R"
    bAmbientGlow=true
    PickupMessage="You got Artillery Pack"
    CullDistance=0.0000000
    Physics=5
    Mesh=SkeletalMesh'WP_ETC_itembox.ItemBox_Artil'
    Style=9
    RotationRate=(Pitch=0,Yaw=20000,Roll=0)
    MessageClass=Class'UnrealGame.PickupMessagePlus'
}