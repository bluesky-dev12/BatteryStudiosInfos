/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wHealthPack.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:6
 *	States:1
 *
 *******************************************************************************/
class wHealthPack extends wSupplyPack;

var int HealingAmount;
var float fStayTime;

replication
{
    // Pos:0x00
    reliable if(Role == 4)
        DeleteSuppliesPositions;

}

static simulated function UpdateHUD(HUD H)
{
    local float fTime;

    super(Pickup).UpdateHUD(H);
    fTime = H.Level.TimeSeconds;
    H.LastPickupTime = fTime;
    H.LastHealthPickupTime = fTime;
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
    Level.SupplyList_Health[Level.SupplyList_Health.Length] = self;
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
            PlayerOwner.myHUD.LastHealthPickupTime = fTime;
        }
    }
}

function Reset()
{
    DeleteSuppliesPositions();
    Destroy();
}

function int GetHealMax(Pawn P)
{
    return int(P.HealthMax);
}

auto state Pickup
{
    function Touch(Actor Other)
    {
        local Pawn P;
        local PlayerController PC;
        local int iHeal;

        // End:0xe5
        if(ValidTouch(Other))
        {
            P = Pawn(Other);
            PC = PlayerController(P.Controller);
            iHeal = HealingAmount;
            // End:0x73
            if(PC != none && PC.SkillBase.bIncHealthPack)
            {
                iHeal += 10;
            }
            // End:0xe5
            if(P.GiveHealth(iHeal, GetHealMax(P)))
            {
                // End:0xc6
                if(PC != none)
                {
                    PC.ReceiveMessage_QuestType2(class'wMessage_Quest', class'wMessage_Quest'.default.Code_Quest_AcquireTrophy,,,, 1);
                }
                AnnouncePickup(P);
                DisplayEvent(P);
                DeleteSuppliesPositions();
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
    HealingAmount=25
    fStayTime=10.0
    bAmbientGlow=true
    PickupMessage="You got Health Pack"
    PickupSound=Sound'Warfare_Sound_Char.GetItem.char_getitem_healthpack'
    DrawType=8
    StaticMesh=StaticMesh'WPS_ETC.HealthPack.HealthPack'
    CullDistance=6500.0
    Style=9
    RotationRate=(Pitch=0,Yaw=0,Roll=0)
    MessageClass=Class'UnrealGame.PickupMessagePlus'
}