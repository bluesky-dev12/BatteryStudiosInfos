class wSentryGunPack extends wSupplyPack;

var string m_soundPickUP;
var string m_strSoundStandby;

static simulated function UpdateHUD(HUD H)
{
    local float fTime;

    super(Pickup).UpdateHUD(H);
    fTime = H.Level.TimeSeconds;
    H.LastPickupTime = fTime;
    H.LastSentryGunPickupTime = fTime;
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
            PlayerOwner.myHUD.LastSentryGunPickupTime = fTime;
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
    Level.SupplyList_SentryGun[Level.SupplyList_SentryGun.Length] = self;
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

function bool CanPickUp(Pawn Pawn)
{
    // End:0x26
    if(1 == int(Pawn.PlayerReplicationInfo.abySupplyItemFlag[int(4)]))
    {
        return false;
    }
    // End:0x3F
    if(none != Pawn.GetWeaponByInvenGroup(6))
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

        // End:0x148
        if(ValidTouch(Other))
        {
            P = Pawn(Other);
            // End:0x148
            if(CanPickUp(P))
            {
                P.PlayerReplicationInfo.abySupplyItemFlag[int(4)] = 1;
                W = P.AddWeapon(EmptyBtrDouble(), 5018, 0, false);
                DisplayEvent(P);
                AnnouncePickup(P);
                // End:0x103
                if(none != P.Controller)
                {
                    PlayerController(P.Controller).FmodClientPlaySound(m_soundPickUP,,, 0);
                    PlayerController(P.Controller).QueueAnnouncement(m_strSoundStandby, 1);
                    PlayerController(P.Controller).ClientChangeSlot6(W);
                }
                DeleteSuppliesPositions();
                // End:0x145
                if(none != P.Controller)
                {
                    PlayerController(P.Controller).SkillBase.AddSupplyItem(4);
                }
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
    m_soundPickUP="Warfare_Sound_ATS/CB/ats_cb_ready_sentrygun"
    bAmbientGlow=true
    PickupMessage="You got sentrygun Pack"
    CullDistance=0.0000000
    Physics=5
    Mesh=SkeletalMesh'WP_ETC_itembox.ItemBox_SentryG'
    Style=9
    RotationRate=(Pitch=0,Yaw=20000,Roll=0)
    MessageClass=Class'UnrealGame.PickupMessagePlus'
}