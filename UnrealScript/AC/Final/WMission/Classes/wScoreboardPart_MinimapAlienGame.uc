class wScoreboardPart_MinimapAlienGame extends wScoreboardPart_Minimap
    transient;

var Material MinimapMatHero;

function DrawMinimap_Allies(Canvas C)
{
    local wPawn P, wPawnOwner, PawnHero;
    local float minimapX, minimapY;
    local int lp1;
    local HudCDeathmatch HUD;
    local Rotator R;
    local float W, w2, H, H2, UL, VL;

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

    // End:0x561 [Loop If]
    if(lp1 < Level.PawnList.Length)
    {
        P = wPawn(Level.PawnList[lp1]);
        // End:0x557
        if((((P != none) && P.PlayerReplicationInfo != none) && HudOwner.PlayerOwner.PlayerReplicationInfo.Team != none) && P.OwnerName != HudOwner.PlayerOwner.PlayerReplicationInfo.PlayerName)
        {
            // End:0x557
            if((P != wPawnOwner) && IsSameTeamByPRI(HudOwner.PlayerOwner.PlayerReplicationInfo, P.PlayerReplicationInfo))
            {
                CalculateMinimapPositionPawnCentering(HudOwner.PawnOwner, P.Location, minimapX, minimapY);
                ClampMinimapPosition(minimapX, minimapY);
                // End:0x557
                if(!P.IsInState('Dying'))
                {
                    // End:0x25E
                    if(int(wAlienPlayerReplicationInfo(P.PlayerReplicationInfo).eObjType) == int(1))
                    {
                        PawnHero = P;
                        // [Explicit Continue]
                        goto J0x557;
                    }
                    CalcMinimapRotation(P.Rotation, R);
                    // End:0x3BB
                    if(P.fLastFireNoiseTime >= (Level.TimeSeconds - MinimapAllyFireNotificationDuration))
                    {
                        // End:0x33D
                        if((P.PlayerReplicationInfo.bBot == true) || P.PlayerReplicationInfo.GetCheckFriendOrClanMember() == 0)
                        {
                            C.DrawTileExactWithRotation(MinimapMatAttackingAlly, (minimapX * _rX) - w2, (minimapY * _rY) - H2, W, H, 0.0000000, 0.0000000, UL, VL, R);                            
                        }
                        else
                        {
                            // End:0x3B8
                            if(P.PlayerReplicationInfo.GetCheckFriendOrClanMember() == 1)
                            {
                                C.DrawTileExactWithRotation(MinimapFCMatAttackingAlly, (minimapX * _rX) - w2, (minimapY * _rY) - H2, W, H, 0.0000000, 0.0000000, UL, VL, R);
                            }
                        }
                        // [Explicit Continue]
                        goto J0x557;
                    }
                    // End:0x43E
                    if(P.fLastRadioMessageTime >= (Level.TimeSeconds - MinimapAllyRadioMessageDuration))
                    {
                        C.DrawTileExact(MinimapMatRadioMessage, (minimapX * _rX) - w2, (minimapY * _rY) - H2, W, H, 0.0000000, 0.0000000, UL, VL);
                        // [Explicit Continue]
                        goto J0x557;
                    }
                    // End:0x4DC
                    if((P.PlayerReplicationInfo.bBot == true) || P.PlayerReplicationInfo.GetCheckFriendOrClanMember() == 0)
                    {
                        C.DrawTileExactWithRotation(MinimapMatAlly, (minimapX * _rX) - w2, (minimapY * _rY) - H2, W, H, 0.0000000, 0.0000000, UL, VL, R);
                        // [Explicit Continue]
                        goto J0x557;
                    }
                    // End:0x557
                    if(P.PlayerReplicationInfo.GetCheckFriendOrClanMember() == 1)
                    {
                        C.DrawTileExactWithRotation(MinimapFCMatAlly, (minimapX * _rX) - w2, (minimapY * _rY) - H2, W, H, 0.0000000, 0.0000000, UL, VL, R);
                    }
                }
            }
        }
        J0x557:

        lp1++;
        // [Loop Continue]
        goto J0xE2;
    }
    // End:0x6B8
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

function DrawMinimap_SpecialPositions(Canvas C)
{
    local int lp1;
    local float minimapX, minimapY;
    local Vector loc;
    local Material mat;
    local float W, H;

    lp1 = 0;
    J0x07:

    // End:0x16F [Loop If]
    if(lp1 < CachedSpecialPositions.Length)
    {
        // End:0x31
        if(CachedSpecialPositions[lp1].IsDraw == false)
        {
            // [Explicit Continue]
            goto J0x165;
        }
        loc = CachedSpecialPositions[lp1].pos;
        mat = CachedSpecialPositions[lp1].Image;
        CalculateMinimapPositionPawnCentering(HudOwner.PawnOwner, loc, minimapX, minimapY);
        ClampMinimapPosition(minimapX, minimapY);
        W = float(mat.MaterialUSize()) * IconSizeF;
        H = float(mat.MaterialVSize()) * IconSizeF;
        C.SetPos((minimapX - (W / float(2))) * _rX, (minimapY - (H / float(2))) * _rY);
        C.DrawTile(mat, W * _rX, H * _rY, 0.0000000, 0.0000000, float(mat.MaterialUSize()), float(mat.MaterialVSize()));
        J0x165:

        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

defaultproperties
{
    MinimapMatHero=Texture'Warfare_GP_UI_HUD_ETC.minimapicon.minimap_hero_alien'
    SpecialPositions_Class=/* Array type was not detected. */
    SpecialPositions_Image=/* Array type was not detected. */
}