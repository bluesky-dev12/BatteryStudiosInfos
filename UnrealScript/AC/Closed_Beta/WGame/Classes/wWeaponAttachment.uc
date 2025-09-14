class wWeaponAttachment extends WeaponAttachment;

var() bool bHeavy;
var() bool bRapidFire;
var() bool bAltRapidFire;
var wWeapon LitWeapon;
var byte OldSpawnHitCount;

simulated function MakeSpawnShell(optional bool bRechamber)
{
    //return;    
}

simulated function GetHitInfo(int i)
{
    local Vector HitLocation, offset;

    // End:0x1B
    if(int(Level.NetMode) == int(NM_Standalone))
    {
        return;
    }
    offset = float(20) * Normal(Instigator.Location - arrEffLocation[i]);
    arrEffData[i].HitActor = Trace(HitLocation, arrEffData[i].HitNormal, arrEffLocation[i] - offset, arrEffLocation[i] + offset, false,, arrEffData[i].HitMaterial);
    NetUpdateTime = Level.TimeSeconds - float(1);
    //return;    
}

simulated function Hide(bool NewbHidden)
{
    bHidden = NewbHidden;
    //return;    
}

function UpdatePenetrateHit(EffectData EffData[6], Vector HitLocation[6], int mLastHitIdx)
{
    SpawnHitCount++;
    //return;    
}

function UpdateHit(Actor HitActor, Vector HitLocation, Vector HitNormal, Material HitMaterial)
{
    SpawnHitCount++;
    //return;    
}

simulated event ThirdPersonEffects()
{
    // End:0x185
    if(int(Level.NetMode) != int(NM_DedicatedServer))
    {
        // End:0x53
        if(int(FiringMode) == 0)
        {
            // End:0x53
            if(int(OldSpawnHitCount) != int(SpawnHitCount))
            {
                OldSpawnHitCount = SpawnHitCount;
                Instigator.MakeFireNoise();
            }
        }
        // End:0xE5
        if(wPawn(Instigator) != none)
        {
            // End:0x87
            if(int(FlashCount) == 0)
            {
                wPawn(Instigator).StopFiring();                
            }
            else
            {
                // End:0xB7
                if(int(FiringMode) == 0)
                {
                    wPawn(Instigator).StartFiring(bHeavy, bRapidFire);                    
                }
                else
                {
                    // End:0xE2
                    if(int(FiringMode) == 2)
                    {
                        wPawn(Instigator).PlayMelee(bMeleeKnifeOrButt);                        
                    }
                }
            }            
        }
        else
        {
            // End:0x183
            if((Vehicle(Instigator) != none) && Vehicle(Instigator).Driver != none)
            {
                // End:0x142
                if(int(FlashCount) == 0)
                {
                    wPawn(Vehicle(Instigator).Driver).StopFiring();                    
                }
                else
                {
                    // End:0x180
                    if(int(FiringMode) == 0)
                    {
                        wPawn(Vehicle(Instigator).Driver).StartFiring(bHeavy, bRapidFire);                        
                    }
                }                
            }
            else
            {
                return;
            }
        }
    }
    //return;    
}

simulated function PostNetBeginPlay()
{
    // End:0x32
    if((Instigator != none) && wPawn(Instigator) != none)
    {
        wPawn(Instigator).SetWeaponAttachment(self);
    }
    //return;    
}

simulated function Vector GetTipLocation()
{
    local Coords C;

    C = GetBoneCoords('tip');
    return C.Origin;
    //return;    
}

simulated function WeaponLight()
{
    // End:0xBA
    if((((int(FlashCount) > 0) && !Level.bDropDetail) && Instigator != none) && ((Level.TimeSeconds - LastRenderTime) < 0.2000000) || PlayerController(Instigator.Controller) != none)
    {
        // End:0xA6
        if(Instigator.IsFirstPerson())
        {
            LitWeapon = Instigator.Weapon;
            LitWeapon.bDynamicLight = true;            
        }
        else
        {
            bDynamicLight = true;
        }
        SetTimer(0.1500000, false);        
    }
    else
    {
        Timer();
    }
    //return;    
}

function InitFor(Inventory i)
{
    super(InventoryAttachment).InitFor(i);
    // End:0x26
    if(wPawn(i.Instigator) == none)
    {
        return;
    }
    // End:0x59
    if(wPawn(i.Instigator).bClearWeaponOffsets)
    {
        SetRelativeLocation(vect(0.0000000, 0.0000000, 0.0000000));
    }
    //return;    
}

simulated function Timer()
{
    // End:0x23
    if(LitWeapon != none)
    {
        LitWeapon.bDynamicLight = false;
        LitWeapon = none;
    }
    bDynamicLight = false;
    //return;    
}

defaultproperties
{
    RelativeRotation=(Pitch=-16384,Yaw=0,Roll=16384)
}