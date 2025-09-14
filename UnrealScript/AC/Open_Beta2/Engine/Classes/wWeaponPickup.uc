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
var Class<wWeaponRes_Base> ResParams;
var array<Pawn> TouchingPawns;
var bool bUsed;

replication
{
    // Pos:0x000
    reliable if(int(Role) == int(ROLE_Authority))
        AmmoAmount, AmmoAmount_Loaded, 
        bSleeping, iPainting_Item_ID, 
        iRepAddPartsID, iRepWeaponID;
}

function PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    SetWeaponStay();
    // End:0x37
    if(InventoryType != none)
    {
        MaxDesireability = 1.2000000 * Class<wWeapon>(InventoryType).default.AIRating;
    }
    //return;    
}

event PostNetBeginPlay()
{
    super(Actor).PostNetBeginPlay();
    //return;    
}

function SetWeaponStay()
{
    bWeaponStay = bWeaponStay && Level.Game.bWeaponStay;
    //return;    
}

static simulated function UpdateHUD(HUD H)
{
    H.LastPickupTime = H.Level.TimeSeconds;
    H.LastWeaponPickupTime = H.LastPickupTime;
    //return;    
}

function StartSleeping()
{
    // End:0x0F
    if(bDropped)
    {
        Destroy();        
    }
    else
    {
        // End:0x21
        if(!bWeaponStay)
        {
            GotoState('Sleeping');
        }
    }
    //return;    
}

function bool AllowRepeatPickup()
{
    return !bWeaponStay || bDropped && !bThrown;
    //return;    
}

function ForceBegin()
{
    super(Actor).ForceBegin();
    // End:0x18
    if(bSleeping == true)
    {
        StartSleeping();
    }
    //return;    
}

function float DetourWeight(Pawn Other, float PathWeight)
{
    local wWeapon AlreadyHas;

    AlreadyHas = wWeapon(Other.FindInventoryType(InventoryType));
    // End:0x53
    if((AlreadyHas != none) && bWeaponStay || AlreadyHas.AmmoAmount(0) > 0)
    {
        return 0.0000000;
    }
    // End:0xB6
    if(AIController(Other.Controller).PriorityObjective() && (Other.Weapon.AIRating > 0.5000000) || PathWeight > float(400))
    {
        return 0.2000000 / PathWeight;
    }
    return Class<wWeapon>(InventoryType).default.AIRating / PathWeight;
    //return;    
}

function float BotDesireability(Pawn Bot)
{
    local wWeapon AlreadyHas;
    local Class<Pickup> AmmoPickupClass;
    local float desire;

    desire = MaxDesireability + Bot.Controller.AdjustDesireFor(self);
    AlreadyHas = wWeapon(Bot.FindInventoryType(InventoryType));
    // End:0x172
    if(AlreadyHas != none)
    {
        // End:0x71
        if(Bot.Controller.bHuntPlayer)
        {
            return 0.0000000;
        }
        // End:0x82
        if(!AllowRepeatPickup())
        {
            return 0.0000000;
        }
        // End:0xB6
        if((RespawnTime < float(10)) && bHidden || AlreadyHas.AmmoMaxed(0))
        {
            return 0.0000000;
        }
        // End:0xD6
        if(AlreadyHas.AmmoMaxed(0))
        {
            return 0.2500000 * desire;
        }
        // End:0x16C
        if(AlreadyHas.AmmoAmount(0) > 0)
        {
            AmmoPickupClass = AlreadyHas.AmmoPickupClass(0);
            // End:0x116
            if(AmmoPickupClass == none)
            {
                return 0.0500000;                
            }
            else
            {
                return FMax(0.2500000 * desire, AmmoPickupClass.default.MaxDesireability * FMin(1.0000000, (0.1500000 * float(AlreadyHas.MaxAmmo(0))) / float(AlreadyHas.AmmoAmount(0))));
            }            
        }
        else
        {
            return 0.0500000;
        }
    }
    // End:0x1C4
    if(Bot.Controller.bHuntPlayer && (MaxDesireability * 0.8330000) < (Bot.Weapon.AIRating - 0.1000000))
    {
        return 0.0000000;
    }
    // End:0x208
    if((Bot.Weapon == none) || Bot.Weapon.AIRating < 0.5000000)
    {
        return 2.0000000 * desire;
    }
    return desire;
    //return;    
}

function float GetRespawnTime()
{
    return RespawnTime;
    //return;    
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
    //return;    
}

simulated event wLoadOut(int iID, int iAddPartsID)
{
    local wWeaponManager wMani;
    local wWeaponBaseParams wBase;
    local Class<wWeaponRes_Base> wRes;

    wMani = Level.WeaponMgr;
    wBase = wMani.GetBaseParam(iID);
    // End:0x3B
    if(wBase == none)
    {
        return;
    }
    wRes = wMani.GetRes(wBase.szClass_Resource);
    // End:0x6B
    if(wRes == none)
    {
        return;
    }
    BaseParams = wBase;
    ResParams = wRes;
    LinkMesh(Level.GameMgr.GetItemResourceMesh(iID, true, 1));
    SetSkin(iID, iAddPartsID);
    //return;    
}

simulated function SetSkin(int iWeaponID, int iAddPartsID)
{
    local wWeaponCustomInfoParam wcip;

    wcip = Level.GameMgr.GetWeaponCustomInfoParam(iWeaponID);
    // End:0x53
    if((wcip.iItemID <= 0) || wcip.iItemID != iWeaponID)
    {
        return;
    }
    // End:0x91
    if(iPainting_Item_ID > 0)
    {
        Skins[0] = Level.GameMgr.GetPartsGroupPainting(iWeaponID, iAddPartsID, true, iPainting_Item_ID);        
    }
    else
    {
        // End:0xE1
        if(wcip.iDefaultPaintingID > 0)
        {
            Skins[0] = Level.GameMgr.GetPartsGroupPainting(iWeaponID, iAddPartsID, true, wcip.iDefaultPaintingID);            
        }
        else
        {
            Skins.Length = 0;
        }
    }
    //return;    
}

function bool ValidTouch(Actor Other)
{
    return false;
    //return;    
}

function PickWeapon(Actor Other)
{
    local Inventory Copy;

    // End:0xE6
    if(ValidTouch(Other))
    {
        clog((("[wWeaponPickup::PickWeapon] Pawn Name=" $ Pawn(Other).PlayerReplicationInfo.PlayerName) $ " / Character Name=") $ Pawn(Other).PlayerReplicationInfo.CharacterName);
        Copy = SpawnCopy(Pawn(Other));
        AnnouncePickup(Pawn(Other));
        SetRespawn();
        // End:0xDE
        if(Copy != none)
        {
            Copy.PickupFunction(Pawn(Other));
        }
        bUsed = true;
    }
    //return;    
}

function Destroyed()
{
    local int i;

    bUsed = true;
    super.Destroyed();
    i = 0;
    J0x15:

    // End:0x93 [Loop If]
    if(i < TouchingPawns.Length)
    {
        // End:0x89
        if((TouchingPawns[i] != none) && TouchingPawns[i].kPendingWPick == self)
        {
            TouchingPawns[i].kPendingWPick = none;
            TouchingPawns[i].CheckTouchWeaponPickup();
            TouchingPawns.Remove(i, 1);
        }
        i++;
        // [Loop Continue]
        goto J0x15;
    }
    //return;    
}

function Pawn AddTouchingPawn(Pawn P)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x42 [Loop If]
    if(i < TouchingPawns.Length)
    {
        // End:0x38
        if(TouchingPawns[i] == P)
        {
            return TouchingPawns[i];
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    TouchingPawns[TouchingPawns.Length] = P;
    return P;
    //return;    
}

function bool CheckIsTouchingPawn(Pawn P)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x38 [Loop If]
    if(i < TouchingPawns.Length)
    {
        // End:0x2E
        if(TouchingPawns[i] == P)
        {
            return true;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return false;
    //return;    
}

function UnTouch(Actor Other)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x8A [Loop If]
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
            // [Explicit Break]
            goto J0x8A;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    J0x8A:

    //return;    
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
    // End:0xCC
    if(Level.GetMatchMaker().kGame_GameMode != Class'Engine_Decompressed.wGameSettings'.static.GetModeIndex_DOA())
    {
        LifeSpan = 15.0000000;
        LifeSpanReplicated = 15.0000000;        
    }
    else
    {
        LifeSpan = 0.0000000;
        LifeSpanReplicated = 0.0000000;
    }
    //return;    
}

simulated function Tick(float dt)
{
    CheckLifeSpanReplicated();
    //return;    
}

state FallingPickup
{    stop;    
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
        //return;        
    }

    function bool ValidTouch(Actor Other)
    {
        // End:0x0E
        if(bUsed == true)
        {
            return false;
        }
        // End:0xA7
        if(((((Pawn(Other) == none) || !Pawn(Other).bCanPickupInventory) || (Pawn(Other).DrivenVehicle == none) && Pawn(Other).Controller == none) || Pawn(Other).Health <= 0) || Pawn(Other).DrivenVehicle != none)
        {
            return false;
        }
        // End:0xF2
        if(!FastTrace(Other.Location + (MakeVector(0.0000000, 0.0000000, CollisionHeightBuffer)), Location + (MakeVector(0.0000000, 0.0000000, CollisionHeightBuffer))))
        {
            return false;
        }
        // End:0x1AD
        if((Pawn(Other).Weapon != none) && int(Pawn(Other).Weapon.InventoryGroup) == 6)
        {
            // End:0x1AD
            if(((int(Pawn(Other).Weapon.WeaponType) == int(14)) || int(Pawn(Other).Weapon.WeaponType) == int(15)) || int(Pawn(Other).Weapon.WeaponType) == int(16))
            {
                return false;
            }
        }
        // End:0x1E3
        if((Pawn(Other).kPendingWPick == none) || Pawn(Other).kPendingWPick == self)
        {
            return true;
        }
        return false;
        //return;        
    }

    function CheckTouching()
    {
        local Pawn P;

        // End:0x1C
        foreach TouchingActors(Class'Engine_Decompressed.Pawn', P)
        {
            Touch(P);            
        }        
        //return;        
    }
    stop;    
}

state Sleeping
{
    simulated function EndState()
    {
        super.EndState();
        bSleeping = false;
        //return;        
    }

    simulated function BeginState()
    {
        super.BeginState();
        bSleeping = true;
        //return;        
    }
    stop;    
}

state FadeOut
{
    function BeginState()
    {
        bUsed = true;
        super.BeginState();
        //return;        
    }
    stop;    
}

defaultproperties
{
    MaxDesireability=0.5000000
    bAmbientGlow=true
    bPredictRespawns=true
    PickupMessage="You got a weapon"
    bPostLandingCollision=true
    PostLandingCollisionRadius=200.0000000
    PostLandingCollisionHeight=15.0000000
    CullDistance=6500.0000000
    bOrientOnSlope=false
    bSkipLifeSpanInChangedHost=true
    Texture=Texture'Engine_Decompressed.S_Weapon'
    AmbientGlow=128
    CollisionRadius=10.0000000
    CollisionHeight=3.0000000
    bFixedRotationDir=false
    RotationRate=(Pitch=0,Yaw=0,Roll=0)
    DesiredRotation=(Pitch=0,Yaw=0,Roll=0)
}