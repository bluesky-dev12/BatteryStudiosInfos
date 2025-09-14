class wHUD_DOA extends wHUD_Mission
    transient
    config(User);

var float StartItemFadeOutTime;
var bool CheckedFadeOutTime;

function InitHudPart_SelQuickSlot()
{
    HudPart_SelQuickSlot = Spawn(Class'XInterface.wHudPart_SelectQSlot_DOAMode', self);
    HudPart_SelQuickSlot.Initialize(self, Level);
    //return;    
}

function DrawAmmo(Canvas C)
{
    super(HudCDeathmatch).DrawAmmo(C);
    //return;    
}

simulated function DrawHudPassA(Canvas C)
{
    super.DrawHudPassA(C);
    // End:0x41
    if(int(Level.GRI.RoundState) == int(2))
    {
        HudPart_DisplayMain.DrawSurvivedUsers(C);
    }
    //return;    
}

function CheckAndDrawProgress(GameObjective Go, Canvas C)
{
    //return;    
}

function CacheSpecialPositions()
{
    local int lp1;
    local Actor act;
    local Vector loc;

    CachedSpecialPositions.Length = 0;
    CachedSpecialPositionSprites.Length = 0;
    CachedSpecialPositionActors.Length = 0;
    lp1 = 0;
    J0x1F:

    // End:0xA2 [Loop If]
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
        lp1++;
        // [Loop Continue]
        goto J0x1F;
    }
    //return;    
}

function DrawSpecialPositions(Canvas C)
{
    local int lp1;
    local Actor act;
    local Vector loc;
    local string strName;
    local float fDistance, fFadeOut, fDeltaTime;
    local int iAlpha;

    fDeltaTime = 0.0000000;
    // End:0xD7
    if((MSGRI != none) && float(MSGRI.RoundStartTime - MSGRI.RemainingTime) > 5.0000000)
    {
        // End:0x6C
        if(!CheckedFadeOutTime)
        {
            StartItemFadeOutTime = Level.TimeSeconds;
            CheckedFadeOutTime = true;            
        }
        else
        {
            fDeltaTime = Level.TimeSeconds - StartItemFadeOutTime;
            fFadeOut = 1.0000000 - (fDeltaTime / float(2));
            iAlpha = int(float(255) * fFadeOut);
            C.SetDrawColor(byte(255), byte(255), byte(255), byte(iAlpha));
        }        
    }
    else
    {
        iAlpha = 255;
        CheckedFadeOutTime = false;
    }
    // End:0x104
    if((fDeltaTime > float(2)) || iAlpha <= 0)
    {
        return;
    }
    // End:0x11D
    if(!bCachedSpecialPostions)
    {
        CacheSpecialPositions();
        bCachedSpecialPostions = true;
    }
    lp1 = 0;
    J0x124:

    // End:0x28B [Loop If]
    if(lp1 < CachedSpecialPositions.Length)
    {
        // End:0x148
        if(CachedSpecialPositionActors[lp1] == none)
        {
            // [Explicit Continue]
            goto J0x281;
        }
        act = CachedSpecialPositionActors[lp1];
        // End:0x17B
        if(act.IsA('wAmmoSupplyObjective'))
        {
            strName = lsPlaceAmmoSupply;            
        }
        else
        {
            // End:0x190
            if(act.bHidden)
            {
                // [Explicit Continue]
                goto J0x281;
            }
            // End:0x1B2
            if(act.IsA('wWeaponPickup_M2B'))
            {
                strName = lsPlaceM2B;                
            }
            else
            {
                // End:0x1D4
                if(act.IsA('wWeaponPickup_RPG7'))
                {
                    strName = lsPlaceRPG7;                    
                }
                else
                {
                    // End:0x204
                    if(act.IsA('wWeaponPickup_DOA'))
                    {
                        strName = wWeaponPickup_DOA(act).strWeaponName;                        
                    }
                    else
                    {
                        // [Explicit Continue]
                        goto J0x281;
                    }
                }
            }
        }
        loc = act.Location;
        fDistance = VSize(PlayerOwner.CalcViewLocation - loc) * 0.0187500;
        // End:0x251
        if(fDistance > VisibleDistance)
        {
            // [Explicit Continue]
            goto J0x281;
        }
        DrawObjectSprite2(C, CachedSpecialPositionActors[lp1], PlaceMark, CachedSpecialPositions[lp1], strName, iAlpha);
        J0x281:

        lp1++;
        // [Loop Continue]
        goto J0x124;
    }
    C.SetDrawColor(byte(255), byte(255), byte(255));
    //return;    
}

defaultproperties
{
    VisibleDistance=100.0000000
    SpecialPositions_Class=/* Array type was not detected. */
}