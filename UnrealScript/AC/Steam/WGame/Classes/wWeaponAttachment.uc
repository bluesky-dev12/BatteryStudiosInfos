/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wWeaponAttachment.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:5
 *	Functions:11
 *
 *******************************************************************************/
class wWeaponAttachment extends WeaponAttachment;

var() bool bHeavy;
var() bool bRapidFire;
var() bool bAltRapidFire;
var wWeapon LitWeapon;
var byte OldSpawnHitCount;

simulated function MakeSpawnShell(optional bool bRechamber);
simulated function GetHitInfo(int nIndex, int i)
{
    local Vector HitLocation, offset;

    // End:0x1b
    if(Level.NetMode == 0)
    {
        return;
    }
    offset = float(20) * Normal(Instigator.Location - stMBPF[nIndex].mvEffLocation[i]);
    stMBPF[nIndex].mHitActor[i] = Trace(HitLocation, stMBPF[nIndex].mHitNormal[i], stMBPF[nIndex].mvEffLocation[i] - offset, stMBPF[nIndex].mvEffLocation[i] + offset, false,, stMBPF[nIndex].mHitMaterial[i]);
    NetUpdateTime = Level.TimeSeconds - float(1);
}

simulated function Hide(bool NewbHidden)
{
    bHidden = NewbHidden;
}

function UpdatePenetrateHit(Actor mHitActor[6], Vector mHitLocation[6], Vector mHitNormal[6], Material mHitMaterial[6], int mLastHitIdx)
{
    super.UpdatePenetrateHit(mHitActor, mHitLocation, mHitNormal, mHitMaterial, 0);
}

function UpdateHit(Actor HitActor, Vector HitLocation, Vector HitNormal, Material HitMaterial)
{
    Log("UpdateHit = " @ string(SpawnHitCount));
}

simulated event ThirdPersonEffects()
{
    // End:0x185
    if(Level.NetMode != 1)
    {
        // End:0x53
        if(FiringMode == 0)
        {
            // End:0x53
            if(OldSpawnHitCount != SpawnHitCount)
            {
                OldSpawnHitCount = SpawnHitCount;
                Instigator.MakeFireNoise();
            }
        }
        // End:0xe5
        if(wPawn(Instigator) != none)
        {
            // End:0x87
            if(FlashCount == 0)
            {
                wPawn(Instigator).StopFiring();
            }
            // End:0xe2
            else
            {
                // End:0xb7
                if(FiringMode == 0)
                {
                    wPawn(Instigator).StartFiring(bHeavy, bRapidFire);
                }
                // End:0xe2
                else
                {
                    // End:0xe2
                    if(FiringMode == 2)
                    {
                        wPawn(Instigator).PlayMelee(bMeleeKnifeOrButt);
                    }
                    // End:0xe2
                    else
                    {
                    }
                }
            }
        }
        // End:0x185
        else
        {
            // End:0x183
            if(Vehicle(Instigator) != none && Vehicle(Instigator).Driver != none)
            {
                // End:0x142
                if(FlashCount == 0)
                {
                    wPawn(Vehicle(Instigator).Driver).StopFiring();
                }
                // End:0x180
                else
                {
                    // End:0x180
                    if(FiringMode == 0)
                    {
                        wPawn(Vehicle(Instigator).Driver).StartFiring(bHeavy, bRapidFire);
                    }
                    // End:0x180
                    else
                    {
                    }
                }
            }
            // End:0x185
            else
            {
                return;
            }
        }
    }
}

simulated function PostNetBeginPlay()
{
    // End:0x32
    if(Instigator != none && wPawn(Instigator) != none)
    {
        wPawn(Instigator).SetWeaponAttachment(self);
    }
}

simulated function Vector GetTipLocation()
{
    local Coords C;

    C = GetBoneCoords('tip');
    return C.Origin;
}

simulated function WeaponLight()
{
    // End:0xba
    if(FlashCount > 0 && !Level.bDropDetail && Instigator != none && Level.TimeSeconds - LastRenderTime < 0.20 || PlayerController(Instigator.Controller) != none)
    {
        // End:0xa6
        if(Instigator.IsFirstPerson())
        {
            LitWeapon = Instigator.Weapon;
            LitWeapon.bDynamicLight = true;
        }
        // End:0xae
        else
        {
            bDynamicLight = true;
        }
        SetTimer(0.150, false);
    }
    // End:0xc0
    else
    {
        Timer();
    }
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
        SetRelativeLocation(vect(0.0, 0.0, 0.0));
    }
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
}

defaultproperties
{
    RelativeRotation=(Pitch=-16384,Yaw=0,Roll=16384)
}