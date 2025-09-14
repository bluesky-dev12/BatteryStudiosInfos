class wHealthPack extends wSupplyPack;

var int HealingAmount;
var float fStayTime;

replication
{
    // Pos:0x000
    reliable if(int(Role) == int(ROLE_Authority))
        DeleteSuppliesPositions;
}

static simulated function UpdateHUD(HUD H)
{
    local float fTime;

    super(Pickup).UpdateHUD(H);
    fTime = H.Level.TimeSeconds;
    H.LastPickupTime = fTime;
    H.LastHealthPickupTime = fTime;
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
    Level.SupplyList_Health[Level.SupplyList_Health.Length] = self;
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
    // End:0xD2
    if((P.Controller != none) && P.Controller.IsA('PlayerController'))
    {
        PlayerOwner = PlayerController(P.Controller);
        // End:0xD2
        if(PlayerOwner.myHUD != none)
        {
            fTime = PlayerOwner.Level.TimeSeconds;
            PlayerOwner.myHUD.LastPickupTime = fTime;
            PlayerOwner.myHUD.LastHealthPickupTime = fTime;
        }
    }
    //return;    
}

function Reset()
{
    DeleteSuppliesPositions();
    Destroy();
    //return;    
}

function int GetHealMax(Pawn P)
{
    return int(P.HealthMax);
    //return;    
}

auto state Pickup
{
    function Touch(Actor Other)
    {
        local Pawn P;
        local PlayerController PC;
        local int iHeal;

        // End:0xE5
        if(ValidTouch(Other))
        {
            P = Pawn(Other);
            PC = PlayerController(P.Controller);
            iHeal = HealingAmount;
            // End:0x73
            if((PC != none) && PC.SkillBase.bIncHealthPack)
            {
                iHeal += 10;
            }
            // End:0xE5
            if(P.GiveHealth(iHeal, GetHealMax(P)))
            {
                // End:0xC6
                if(PC != none)
                {
                    PC.ReceiveMessage_QuestType2(Class'Engine.wMessage_Quest', Class'Engine.wMessage_Quest'.default.Code_Quest_AcquireTrophy,,,, 1);
                }
                AnnouncePickup(P);
                DisplayEvent(P);
                DeleteSuppliesPositions();
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
    HealingAmount=25
    fStayTime=10.0000000
    bAmbientGlow=true
    PickupMessage="You got Health Pack"
    PickupSound=Sound'Warfare_Sound_Char.GetItem.char_getitem_healthpack'
    DrawType=8
    StaticMesh=StaticMesh'WPS_ETC.HealthPack.HealthPack'
    CullDistance=6500.0000000
    Style=9
    RotationRate=(Pitch=0,Yaw=0,Roll=0)
    MessageClass=Class'UnrealGame.PickupMessagePlus'
}