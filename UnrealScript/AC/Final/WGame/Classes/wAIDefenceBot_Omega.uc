class wAIDefenceBot_Omega extends wAIDefenceBot;

var float fExplRad_Outer;

function NotifyAddInventory(Inventory NewItem)
{
    local wWeaponBaseParams WBP;

    // End:0x6A
    if(NewItem.InventoryClassName ~= "WWeapons.wAirStrike")
    {
        WBP = Level.WeaponMgr.GetBaseParam(90025);
        // End:0x6A
        if(WBP != none)
        {
            fExplRad_Outer = WBP.fExplRad_Outer;
        }
    }
    //return;    
}

function NotifyAddDefaultInventory()
{
    Pawn.SwitchWeapon(5);
    //return;    
}

function CallAirStrike(optional Controller Caller)
{
    local Vector HitLocation;
    local PlayerController P;

    // End:0x12
    if(Caller == none)
    {
        Caller = self;
    }
    HitLocation = CalcAirStrikeLocation(fExplRad_Outer);
    // End:0x7A
    foreach DynamicActors(Class'Engine.PlayerController', P)
    {
        P.fAirStrikeCenterX = HitLocation.X;
        P.fAirStrikeCenterY = HitLocation.Y;
        P.fAirStrikeRadius = fExplRad_Outer;        
    }    
    DoAirStrikeFire(HitLocation);
    //return;    
}

function DoAirStrikeFire(Vector HitLocation)
{
    local Actor A;

    Pawn.MakeNoise(1.0000000);
    A = Spawn(Class<wProjectile>(DynamicLoadObject("WWeapons.wAirStrikeProj_Alien", Class'Core.Class')),,, HitLocation);
    wProjectile(A).Instigator = Pawn;
    wProjectile(A).PostBeginPlay();
    wProjectile(A).wLoadOut(90029);
    Level.Game.AnnounceArtillery(Pawn.Controller);
    //return;    
}

defaultproperties
{
    PawnClass=Class'WGame_Decompressed.wAIDefencePawn_Omega'
}