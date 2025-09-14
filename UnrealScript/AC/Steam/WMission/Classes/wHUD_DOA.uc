/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WMission\Classes\wHUD_DOA.uc
 * Package Imports:
 *	WMission
 *	XInterface
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:6
 *
 *******************************************************************************/
class wHUD_DOA extends wHUD_Mission
    config(User)
    transient;

var float StartItemFadeOutTime;
var bool CheckedFadeOutTime;

function InitHudPart_SelQuickSlot()
{
    HudPart_SelQuickSlot = Spawn(class'wHudPart_SelectQSlot_DOAMode', self);
    HudPart_SelQuickSlot.Initialize(self, Level);
}

function DrawAmmo(Canvas C)
{
    super(HudCDeathmatch).DrawAmmo(C);
}

simulated function DrawHudPassA(Canvas C)
{
    super.DrawHudPassA(C);
    // End:0x41
    if(Level.GRI.RoundState == 2)
    {
        HudPart_DisplayMain.DrawSurvivedUsers(C);
    }
}

function CheckAndDrawProgress(GameObjective Go, Canvas C);
function CacheSpecialPositions()
{
    local int lp1;
    local Actor act;
    local Vector loc;

    CachedSpecialPositions.Length = 0;
    CachedSpecialPositionSprites.Length = 0;
    CachedSpecialPositionActors.Length = 0;
    lp1 = 0;
    J0x1f:
    // End:0xa2 [While If]
    if(lp1 < SpecialPositions_Class.Length)
    {
        // End:0x97
        foreach DynamicActors(SpecialPositions_Class[lp1], act)
        {
            loc = act.Location;
            loc.Z += float(SpecialPositions_OffsetZ[lp1]);
            CachedSpecialPositions[CachedSpecialPositions.Length] = loc;
            CachedSpecialPositionActors[CachedSpecialPositionActors.Length] = act;                        
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x1f;
    }
}

function DrawSpecialPositions(Canvas C)
{
    local int lp1;
    local Actor act;
    local Vector loc;
    local string strName;
    local float fDistance, fFadeOut, fDeltaTime;
    local int iAlpha;

    fDeltaTime = 0.0;
    // End:0xd7
    if(MSGRI != none && float(MSGRI.RoundStartTime - MSGRI.RemainingTime) > 5.0)
    {
        // End:0x6c
        if(!CheckedFadeOutTime)
        {
            StartItemFadeOutTime = Level.TimeSeconds;
            CheckedFadeOutTime = true;
        }
        // End:0xd4
        else
        {
            fDeltaTime = Level.TimeSeconds - StartItemFadeOutTime;
            fFadeOut = 1.0 - fDeltaTime / float(2);
            iAlpha = int(float(255) * fFadeOut);
            C.SetDrawColor(byte(255), byte(255), byte(255), byte(iAlpha));
        }
    }
    // End:0xe7
    else
    {
        iAlpha = 255;
        CheckedFadeOutTime = false;
    }
    // End:0x104
    if(fDeltaTime > float(2) || iAlpha <= 0)
    {
        return;
    }
    // End:0x11d
    if(!bCachedSpecialPostions)
    {
        CacheSpecialPositions();
        bCachedSpecialPostions = true;
    }
    lp1 = 0;
    J0x124:
    // End:0x28b [While If]
    if(lp1 < CachedSpecialPositions.Length)
    {
        // End:0x148
        if(CachedSpecialPositionActors[lp1] == none)
        {
        }
        // End:0x281
        else
        {
            act = CachedSpecialPositionActors[lp1];
            // End:0x17b
            if(act.IsA('wAmmoSupplyObjective'))
            {
                strName = lsPlaceAmmoSupply;
            }
            // End:0x207
            else
            {
                // End:0x190
                if(act.bHidden)
                {
                }
                // End:0x281
                else
                {
                    // End:0x1b2
                    if(act.IsA('wWeaponPickup_M2B'))
                    {
                        strName = lsPlaceM2B;
                    }
                    // End:0x207
                    else
                    {
                        // End:0x1d4
                        if(act.IsA('wWeaponPickup_RPG7'))
                        {
                            strName = lsPlaceRPG7;
                        }
                        // End:0x207
                        else
                        {
                            // End:0x204
                            if(act.IsA('wWeaponPickup_DOA'))
                            {
                                strName = wWeaponPickup_DOA(act).strWeaponName;
                            }
                            // End:0x207
                            else
                            {
                                // This is an implied JumpToken;
                                goto J0x281;
                            }
                        }
                    }
                }
                loc = act.Location;
                fDistance = VSize(PlayerOwner.CalcViewLocation - loc) * 0.018750;
                // End:0x251
                if(fDistance > VisibleDistance)
                {
                }
                // End:0x281
                else
                {
                    DrawObjectSprite2(C, CachedSpecialPositionActors[lp1], PlaceMark, CachedSpecialPositions[lp1], strName, iAlpha);
                }
            }
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x124;
    }
    C.SetDrawColor(byte(255), byte(255), byte(255));
}

defaultproperties
{
    VisibleDistance=100.0
    SpecialPositions_Class=// Object reference not set to an instance of an object.
    
}