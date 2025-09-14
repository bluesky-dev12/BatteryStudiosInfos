/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wWeaponPickup.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:14
 *	Functions:21
 *	States:4
 *
 *******************************************************************************/
class wWeaponPickup extends Pickup
    native
    nativereplication
    notplaceable;

var bool bWeaponStay;
var() bool bThrown;
var bool bSleeping;
var() int AmmoAmount[2];
var() int AmmoAmount_Loaded;
var int iLocalWeaponID;
var int iLocalAddPartsID;
var int iRepWeaponID;
var int iRepAddPartsID;
var int iPainting_Item_ID;
var wWeaponBaseParams BaseParams;
var class<wWeaponRes_Base> ResParams;
var array<Pawn> TouchingPawns;
var bool bUsed;

replication
{
    // Pos:0x00
    reliable if(Role == 4)
        bSleeping, AmmoAmount,
        AmmoAmount_Loaded, iRepWeaponID,
        iRepAddPartsID, iPainting_Item_ID;

}

function PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    SetWeaponStay();
    // End:0x37
    if(InventoryType != none)
    {
        MaxDesireability = 1.20 * class<wWeapon>(InventoryType).default.AIRating;
    }
}

event PostNetBeginPlay()
{
    super(Actor).PostNetBeginPlay();
}

function SetWeaponStay()
{
    bWeaponStay = bWeaponStay && Level.Game.bWeaponStay;
}

static simulated function UpdateHUD(HUD H)
{
    H.LastPickupTime = H.Level.TimeSeconds;
    H.LastWeaponPickupTime = H.LastPickupTime;
}

function StartSleeping()
{
    // End:0x0f
    if(bDropped)
    {
        Destroy();
    }
    // End:0x21
    else
    {
        // End:0x21
        if(!bWeaponStay)
        {
            GotoState('Sleeping');
        }
    }
}

function bool AllowRepeatPickup()
{
    return !bWeaponStay || bDropped && !bThrown;
}

function ForceBegin()
{
    super(Actor).ForceBegin();
    // End:0x18
    if(bSleeping == true)
    {
        StartSleeping();
    }
}

function float DetourWeight(Pawn Other, float PathWeight)
{
    local wWeapon AlreadyHas;

    AlreadyHas = wWeapon(Other.FindInventoryType(InventoryType));
    // End:0x53
    if(AlreadyHas != none && bWeaponStay || AlreadyHas.AmmoAmount(0) > 0)
    {
        return 0.0;
    }
    // End:0xb6
    if(AIController(Other.Controller).PriorityObjective() && Other.Weapon.AIRating > 0.50 || PathWeight > float(400))
    {
        return 0.20 / PathWeight;
    }
    return class<wWeapon>(InventoryType).default.AIRating / PathWeight;
}

function float BotDesireability(Pawn Bot)
{
    local wWeapon AlreadyHas;
    local class<Pickup> AmmoPickupClass;
    local float desire;

    desire = MaxDesireability + Bot.Controller.AdjustDesireFor(self);
    AlreadyHas = wWeapon(Bot.FindInventoryType(InventoryType));
    // End:0x172
    if(AlreadyHas != none)
    {
        // End:0x71
        if(Bot.Controller.bHuntPlayer)
        {
            return 0.0;
        }
        // End:0x82
        if(!AllowRepeatPickup())
        {
            return 0.0;
        }
        // End:0xb6
        if(RespawnTime < float(10) && bHidden || AlreadyHas.AmmoMaxed(0))
        {
            return 0.0;
        }
        // End:0xd6
        if(AlreadyHas.AmmoMaxed(0))
        {
            return 0.250 * desire;
        }
        // End:0x16c
        if(AlreadyHas.AmmoAmount(0) > 0)
        {
            AmmoPickupClass = AlreadyHas.AmmoPickupClass(0);
            // End:0x116
            if(AmmoPickupClass == none)
            {
                return 0.050;
            }
            // End:0x169
            else
            {
                return FMax(0.250 * desire, AmmoPickupClass.default.MaxDesireability * FMin(1.0, 0.150 * float(AlreadyHas.MaxAmmo(0)) / float(AlreadyHas.AmmoAmount(0))));
            }
        }
        // End:0x172
        else
        {
            return 0.050;
        }
    }
    // End:0x1c4
    if(Bot.Controller.bHuntPlayer && MaxDesireability * 0.8330 < Bot.Weapon.AIRating - 0.10)
    {
        return 0.0;
    }
    // End:0x208
    if(Bot.Weapon == none || Bot.Weapon.AIRating < 0.50)
    {
        return 2.0 * desire;
    }
    return desire;
}

function float GetRespawnTime()
{
    return RespawnTime;
}

function Reset()
{
    AmmoAmount[0] = 0;
    AmmoAmount[1] = 0;
    AmmoAmount_Loaded = 0;
    super.Reset();
    // End:0x36
    if(bDropped || bThrown)
    {
        Destroy();
    }
}

simulated event wLoadOut(int iID, int iAddPartsID)
{
    local wWeaponManager wMani;
    local wWeaponBaseParams wBase;
    local class<wWeaponRes_Base> wRes;

    wMani = Level.WeaponMgr;
    wBase = wMani.GetBaseParam(iID);
    // End:0x3b
    if(wBase == none)
    {
        return;
    }
    wRes = wMani.GetRes(wBase.szClass_Resource);
    // End:0x6b
    if(wRes == none)
    {
        return;
    }
    BaseParams = wBase;
    ResParams = wRes;
    LinkMesh(Level.GameMgr.GetItemResourceMesh(iID, true, 1));
    SetSkin(iID, iAddPartsID);
}

simulated function SetSkin(int iWeaponID, int iAddPartsID)
{
    local wWeaponCustomInfoParam wcip;

    wcip = Level.GameMgr.GetWeaponCustomInfoParam(iWeaponID);
    // End:0x53
    if(wcip.iItemID <= 0 || wcip.iItemID != iWeaponID)
    {
        return;
    }
    // End:0x91
    if(iPainting_Item_ID > 0)
    {
        Skins[0] = Level.GameMgr.GetPartsGroupPainting(iWeaponID, iAddPartsID, true, iPainting_Item_ID);
    }
    // End:0xe9
    else
    {
        // End:0xe1
        if(wcip.iDefaultPaintingID > 0)
        {
            Skins[0] = Level.GameMgr.GetPartsGroupPainting(iWeaponID, iAddPartsID, true, wcip.iDefaultPaintingID);
        }
        // End:0xe9
        else
        {
            Skins.Length = 0;
        }
    }
}

function bool ValidTouch(Actor Other)
{
    return false;
}

function PickWeapon(Actor Other)
{
    local Inventory Copy;

    // End:0xe6
    if(ValidTouch(Other))
    {
        clog("[wWeaponPickup::PickWeapon] Pawn Name=" $ Pawn(Other).PlayerReplicationInfo.PlayerName $ " / Character Name=" $ Pawn(Other).PlayerReplicationInfo.CharacterName);
        Copy = SpawnCopy(Pawn(Other));
        AnnouncePickup(Pawn(Other));
        SetRespawn();
        // End:0xde
        if(Copy != none)
        {
            Copy.PickupFunction(Pawn(Other));
        }
        bUsed = true;
    }
}

function Destroyed()
{
    local int i;

    bUsed = true;
    super.Destroyed();
    i = 0;
    J0x15:
    // End:0x93 [While If]
    if(i < TouchingPawns.Length)
    {
        // End:0x89
        if(TouchingPawns[i] != none && TouchingPawns[i].kPendingWPick == self)
        {
            TouchingPawns[i].kPendingWPick = none;
            TouchingPawns[i].CheckTouchWeaponPickup();
            TouchingPawns.Remove(i, 1);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x15;
    }
}

function Pawn AddTouchingPawn(Pawn P)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x42 [While If]
    if(i < TouchingPawns.Length)
    {
        // End:0x38
        if(TouchingPawns[i] == P)
        {
            return TouchingPawns[i];
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    TouchingPawns[TouchingPawns.Length] = P;
    return P;
}

function bool CheckIsTouchingPawn(Pawn P)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x38 [While If]
    if(i < TouchingPawns.Length)
    {
        // End:0x2e
        if(TouchingPawns[i] == P)
        {
            return true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return false;
}

function UnTouch(Actor Other)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x8a [While If]
    if(i < TouchingPawns.Length)
    {
        // End:0x80
        if(TouchingPawns[i] == Other)
        {
            // End:0x71
            if(TouchingPawns[i].kPendingWPick == self)
            {
                TouchingPawns[i].kPendingWPick = none;
                TouchingPawns[i].CheckTouchWeaponPickup();
            }
            TouchingPawns.Remove(i, 1);
        }
        // End:0x8a
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x07;
        }
    }
}

function InitDroppedPickupFor(Inventory Inv)
{
    local wWeapon W;

    W = wWeapon(Inv);
    // End:0x78
    if(W != none)
    {
        AmmoAmount[0] = W.AmmoCharge[0];
        AmmoAmount[1] = W.AmmoCharge[1];
        // End:0x78
        if(W.IsA('wGun'))
        {
            AmmoAmount_Loaded = wGun(W).AmmoCharge_CurLoaded;
        }
    }
    super.InitDroppedPickupFor(none);
    bAlwaysRelevant = true;
    // End:0xcc
    if(Level.GetMatchMaker().kGame_GameMode != class'wGameSettings'.static.GetModeIndex_DOA())
    {
        LifeSpan = 15.0;
        LifeSpanReplicated = 15.0;
    }
    // End:0xe2
    else
    {
        LifeSpan = 0.0;
        LifeSpanReplicated = 0.0;
    }
}

simulated function Tick(float dt)
{
    CheckLifeSpanReplicated();
}

state FallingPickup
{

}

auto state Pickup
{
    function Touch(Actor Other)
    {
        local Pawn P;

        // End:0x34
        if(ValidTouch(Other))
        {
            P = AddTouchingPawn(Pawn(Other));
            P.kPendingWPick = self;
        }
    }

    function bool ValidTouch(Actor Other)
    {
        // End:0x0e
        if(bUsed == true)
        {
            return false;
        }
        // End:0xa7
        if(Pawn(Other) == none || !Pawn(Other).bCanPickupInventory || Pawn(Other).DrivenVehicle == none && Pawn(Other).Controller == none || Pawn(Other).Health <= 0 || Pawn(Other).DrivenVehicle != none)
        {
            return false;
        }
        // End:0xf2
        if(!FastTrace(Other.Location + MakeVector(0.0, 0.0, CollisionHeightBuffer), Location + MakeVector(0.0, 0.0, CollisionHeightBuffer)))
        {
            return false;
        }
        // End:0x128
        if(Pawn(Other).kPendingWPick == none || Pawn(Other).kPendingWPick == self)
        {
            return true;
        }
        return false;
    }

    function CheckTouching()
    {
        local Pawn P;

        // End:0x1c
        foreach TouchingActors(class'Pawn', P)
        {
            Touch(P);                        
        }
    }

}

state Sleeping
{
    simulated function EndState()
    {
        super.EndState();
        bSleeping = false;
    }

    simulated function BeginState()
    {
        super.BeginState();
        bSleeping = true;
    }

}

state FadeOut
{
    function BeginState()
    {
        bUsed = true;
        super.BeginState();
    }

}

defaultproperties
{
    MaxDesireability=0.50
    bAmbientGlow=true
    bPredictRespawns=true
    PickupMessage="You got a weapon"
    bPostLandingCollision=true
    PostLandingCollisionRadius=200.0
    PostLandingCollisionHeight=15.0
    CullDistance=6500.0
    bOrientOnSlope=true
    bSkipLifeSpanInChangedHost=true
    Texture=Texture'S_Weapon'
    AmbientGlow=128
    CollisionRadius=10.0
    CollisionHeight=3.0
    bFixedRotationDir=true
    RotationRate=(Pitch=0,Yaw=0,Roll=0)
    DesiredRotation=(Pitch=0,Yaw=0,Roll=0)
}