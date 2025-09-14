class wHudPart_MinimapAlienGame extends wHudPart_Minimap
    transient;

var Material MinimapMatHero;

function DrawMinimap_SpecialPositions(Canvas C)
{
    local int lp1;
    local float minimapX, minimapY;
    local Vector loc;
    local Material mat;
    local float W, H;
    local bool bDraw;
    local Actor actorloc;
    local int actCount;

    // End:0xD5
    if((Level.TimeSeconds - UpdateTime_SpecialPositions) > 0.5000000)
    {
        UpdateTime_SpecialPositions = Level.TimeSeconds;
        lp1 = 0;
        J0x3A:

        // End:0xD5 [Loop If]
        if(lp1 < CachedSpecialPositions.Length)
        {
            actorloc = none;
            actCount = 0;
            // End:0x96
            foreach DynamicActors(SpecialPositions_Class[CachedSpecialPositions[lp1].Index], actorloc)
            {
                // End:0x95
                if(actorloc.bHidden == false)
                {
                    actCount++;
                }                
            }            
            // End:0xB8
            if(actCount == 0)
            {
                CachedSpecialPositions[lp1].IsDraw = false;
                // [Explicit Continue]
                goto J0xCB;
            }
            CachedSpecialPositions[lp1].IsDraw = true;
            J0xCB:

            lp1++;
            // [Loop Continue]
            goto J0x3A;
        }
    }
    lp1 = 0;
    J0xDC:

    // End:0x29B [Loop If]
    if(lp1 < CachedSpecialPositions.Length)
    {
        // End:0x106
        if(CachedSpecialPositions[lp1].IsDraw == false)
        {
            // [Explicit Continue]
            goto J0x291;
        }
        loc = CachedSpecialPositions[lp1].pos;
        mat = CachedSpecialPositions[lp1].Image;
        CalculateMinimapPositionPawnCentering(HudOwner.PawnOwner, loc, minimapX, minimapY);
        bDraw = false;
        // End:0x19B
        if(IsClampDistance_SpecialPositions)
        {
            // End:0x198
            if(VSize(HudOwner.PawnOwner.Location - loc) < ClampDistance_SpecialPositions)
            {
                bDraw = true;
            }            
        }
        else
        {
            bDraw = true;
        }
        // End:0x291
        if(bDraw)
        {
            ClampMinimapPosition(minimapX, minimapY);
            W = float(mat.MaterialUSize()) * IconSizeF;
            H = float(mat.MaterialVSize()) * IconSizeF;
            C.SetPos((minimapX - (W / float(2))) * _rX, (minimapY - (H / float(2))) * _rY);
            C.DrawTile(mat, W * _rX, H * _rY, 0.0000000, 0.0000000, float(mat.MaterialUSize()), float(mat.MaterialVSize()));
        }
        J0x291:

        lp1++;
        // [Loop Continue]
        goto J0xDC;
    }
    //return;    
}

function DrawMinimap_Allies(Canvas C)
{
    local wPawn P, wPawnOwner, PawnHero;
    local float minimapX, minimapY;
    local int lp1;
    local HudCDeathmatch HUD;
    local Rotator R;
    local float W, H, w2, H2, UL, VL;

    W = (float(MinimapMatAlly.MaterialUSize()) * _rX) * IconSizeF;
    H = (float(MinimapMatAlly.MaterialVSize()) * _rY) * IconSizeF;
    w2 = W / float(2);
    H2 = H / float(2);
    UL = float(MinimapMatAlly.MaterialUSize());
    VL = float(MinimapMatAlly.MaterialVSize());
    wPawnOwner = wPawn(HudOwner.PawnOwner);
    HUD = HudCDeathmatch(HudOwner);
    C.Style = 5;
    PawnHero = none;
    lp1 = 0;
    J0xE2:

    // End:0x5D5 [Loop If]
    if(lp1 < Level.PawnList.Length)
    {
        P = wPawn(Level.PawnList[lp1]);
        // End:0x5CB
        if((((P != none) && P.PlayerReplicationInfo != none) && HudOwner.PlayerOwner.PlayerReplicationInfo.Team != none) && P.OwnerName != HudOwner.PlayerOwner.PlayerReplicationInfo.PlayerName)
        {
            // End:0x5CB
            if((P != wPawnOwner) && IsSameTeamByPRI(HudOwner.PlayerOwner.PlayerReplicationInfo, P.PlayerReplicationInfo))
            {
                CalculateMinimapPositionPawnCentering(HudOwner.PawnOwner, P.Location, minimapX, minimapY);
                // End:0x24E
                if(int(wAlienPlayerReplicationInfo(P.PlayerReplicationInfo).eObjType) == int(1))
                {
                    // End:0x24E
                    if(!P.IsInState('Dying'))
                    {
                        PawnHero = P;
                        // [Explicit Continue]
                        goto J0x5CB;
                    }
                }
                // End:0x5CB
                if((IsWithinMinimapArea(minimapX, minimapY)) || (HudOwner.PawnOwner != none) && VSize(HudOwner.PawnOwner.Location - P.Location) < ClampDistance)
                {
                    ClampMinimapPosition(minimapX, minimapY);
                    // End:0x5CB
                    if(!P.IsInState('Dying'))
                    {
                        CalcMinimapRotation(P.Rotation, R);
                        // End:0x42F
                        if(P.fLastFireNoiseTime >= (Level.TimeSeconds - MinimapAllyFireNotificationDuration))
                        {
                            // End:0x3B1
                            if((P.PlayerReplicationInfo.bBot == true) || P.PlayerReplicationInfo.GetCheckFriendOrClanMember() == 0)
                            {
                                C.DrawTileExactWithRotation(MinimapMatAttackingAlly, (minimapX * _rX) - w2, (minimapY * _rY) - H2, W, H, 0.0000000, 0.0000000, UL, VL, R);                                
                            }
                            else
                            {
                                // End:0x42C
                                if(P.PlayerReplicationInfo.GetCheckFriendOrClanMember() == 1)
                                {
                                    C.DrawTileExactWithRotation(MinimapFCMatAttackingAlly, (minimapX * _rX) - w2, (minimapY * _rY) - H2, W, H, 0.0000000, 0.0000000, UL, VL, R);
                                }
                            }
                            // [Explicit Continue]
                            goto J0x5CB;
                        }
                        // End:0x4B2
                        if(P.fLastRadioMessageTime >= (Level.TimeSeconds - MinimapAllyRadioMessageDuration))
                        {
                            C.DrawTileExact(MinimapMatRadioMessage, (minimapX * _rX) - w2, (minimapY * _rY) - H2, W, H, 0.0000000, 0.0000000, UL, VL);
                            // [Explicit Continue]
                            goto J0x5CB;
                        }
                        // End:0x550
                        if((P.PlayerReplicationInfo.bBot == true) || P.PlayerReplicationInfo.GetCheckFriendOrClanMember() == 0)
                        {
                            C.DrawTileExactWithRotation(MinimapMatAlly, (minimapX * _rX) - w2, (minimapY * _rY) - H2, W, H, 0.0000000, 0.0000000, UL, VL, R);
                            // [Explicit Continue]
                            goto J0x5CB;
                        }
                        // End:0x5CB
                        if(P.PlayerReplicationInfo.GetCheckFriendOrClanMember() == 1)
                        {
                            C.DrawTileExactWithRotation(MinimapFCMatAlly, (minimapX * _rX) - w2, (minimapY * _rY) - H2, W, H, 0.0000000, 0.0000000, UL, VL, R);
                        }
                    }
                }
            }
        }
        J0x5CB:

        lp1++;
        // [Loop Continue]
        goto J0xE2;
    }
    // End:0x72C
    if(PawnHero != none)
    {
        W = (float(MinimapMatHero.MaterialUSize()) * _rX) * IconSizeF;
        H = (float(MinimapMatHero.MaterialVSize()) * _rY) * IconSizeF;
        w2 = W / float(2);
        H2 = H / float(2);
        UL = float(MinimapMatHero.MaterialUSize());
        VL = float(MinimapMatHero.MaterialVSize());
        CalculateMinimapPositionPawnCentering(HudOwner.PawnOwner, PawnHero.Location, minimapX, minimapY);
        ClampMinimapPosition(minimapX, minimapY);
        CalcMinimapRotation(PawnHero.Rotation, R);
        C.DrawTileExactWithRotation(MinimapMatHero, (minimapX * _rX) - w2, (minimapY * _rY) - H2, W, H, 0.0000000, 0.0000000, UL, VL, R);
    }
    C.Style = 1;
    //return;    
}

function bool IsSameTeamByPRI(PlayerReplicationInfo pri1, PlayerReplicationInfo pri2)
{
    // End:0x37
    if(!super(wHudPart_MinimapBase).IsSameTeamByPRI(pri1, pri2))
    {
        // End:0x35
        if(int(wAlienPlayerReplicationInfo(pri2).eObjType) == int(1))
        {
            return true;
        }
        return false;
    }
    return true;
    //return;    
}

defaultproperties
{
    MinimapMatHero=Texture'Warfare_GP_UI_HUD_ETC.minimapicon.minimap_suppliesbox_alien'
    SpecialPositions_Class=/* Array type was not detected. */
    SpecialPositions_Image=/* Array type was not detected. */
}