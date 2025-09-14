class wFPWeaponAttachmentAlien extends wFPWeaponAttachment
    notplaceable;

var int iSavedBodyItemID;

simulated function wLoadOut(int iID, int iAddPartsID, int iPaintID, Pawn Pawn)
{
    local wWeaponManager wMani;
    local wWeaponBaseParams wBase;
    local Class<wWeaponRes_Base> wRes;
    local int iBodyItemID;
    local Mesh meshHands;

    OwnerPawn = Pawn;
    OwnerPlayer = Level.GetLocalPlayerController();
    // End:0x3D9
    if(iSavedWID != iID)
    {
        wMani = Level.WeaponMgr;
        wBase = wMani.GetBaseParam(iID);
        // End:0x6A
        if(wBase == none)
        {
            return;
        }
        BaseParams = wBase;
        fZoomFOV = BaseParams.fZoomFOV;
        wRes = wMani.GetRes(wBase.szClass_Resource);
        // End:0xB9
        if(wRes == none)
        {
            return;
        }
        ResetBase();
        // End:0x1F1
        if(((((((((((int(BaseParams.eType) == int(0)) || int(BaseParams.eType) == int(5)) || int(BaseParams.eType) == int(10)) || int(BaseParams.eType) == int(11)) || int(BaseParams.eType) == int(20)) || int(BaseParams.eType) == int(12)) || int(BaseParams.eType) == int(17)) || int(BaseParams.eType) == int(13)) || int(BaseParams.eType) == int(15)) || int(BaseParams.eType) == int(14)) || int(BaseParams.eType) == int(16))
        {
            bUseFlashEffect = false;            
        }
        else
        {
            bUseFlashEffect = true;
        }
        // End:0x210
        if(iID == 7002)
        {
            bDemopack = true;
        }
        // End:0x226
        if(Hands != none)
        {
            DetachFromBone(Hands);
        }
        LinkMesh(Level.GameMgr.GetItemResourceMesh(iID, false));
        // End:0x268
        if(Hands != none)
        {
            AttachToBone(Hands, 'XXXX_Dummy');            
        }
        else
        {
            // End:0x33D
            if((OwnerPawn != none) && OwnerPawn.PlayerReplicationInfo != none)
            {
                // End:0x2C8
                if(OwnerPawn.PlayerReplicationInfo.SideID == 0)
                {
                    iBodyItemID = OwnerPawn.PlayerReplicationInfo.aiBodyItemID[0];                    
                }
                else
                {
                    iBodyItemID = OwnerPawn.PlayerReplicationInfo.aiBodyItemID[1];
                }
                // End:0x2FD
                if(iBodyItemID <= 0)
                {
                    iBodyItemID = 15000;
                }
                meshHands = Level.GameMgr.GetItemResourceMesh(iBodyItemID, false, byte(OwnerPawn.PlayerReplicationInfo.TeamID));                
            }
            else
            {
                meshHands = Level.GameMgr.GetItemResourceMesh(15000, false, 0);
            }
            Hands = Spawn(Class'Engine.wSkinShell', self);
            Hands.SetDrawType(2);
            Hands.LinkMesh(meshHands);
            Hands.SetBase(self);
            Hands.SetOwner(self);
            AttachToBone(Hands, 'XXXX_Dummy');
            iSavedBodyItemID = iBodyItemID;
        }
        iSavedWID = iID;
    }
    bInstantFOV = false;
    // End:0x413
    if(iSavedPartsID != iAddPartsID)
    {
        bSilencer = false;
        AddPartsGroup(iID, iAddPartsID);
        iSavedPartsID = iAddPartsID;
    }
    SetWeaponPaint(iPaintID);
    SetQuickFOV(OwnerPawn.bIsAiming);
    OwnerPlayer.fDeltaFOVAngle = 0.0000000;
    OwnerPlayer.fAnimRate_AdsOn = wBase.fAnimRate_AdsOn;
    OwnerPlayer.fAnimRate_AdsOff = wBase.fAnimRate_AdsOff;
    // End:0x4A5
    if(iID == 9000)
    {
        PlayAnim(Melee_FireAnim, 1.0000000, 0.0000000);        
    }
    else
    {
        PlayAnim(SelectAnim, SelectAnimRate, 0.0000000);
    }
    SetBaseParams(wBase);
    SetResParams(wRes);
    FPCalcSpread();
    //return;    
}

function ChangeHands(int iBodyItemID)
{
    local Mesh meshHands;

    // End:0x15E
    if(iSavedBodyItemID != iBodyItemID)
    {
        // End:0x32
        if((OwnerPawn == none) && OwnerPawn.PlayerReplicationInfo == none)
        {
            return;
        }
        meshHands = Level.GameMgr.GetItemResourceMesh(iBodyItemID, false, byte(OwnerPawn.PlayerReplicationInfo.TeamID));
        // End:0x111
        if(meshHands != none)
        {
            // End:0xA3
            if(Hands != none)
            {
                DetachFromBone(Hands);
                Hands.Destroy();
                Hands = none;
            }
            Hands = Spawn(Class'Engine.wSkinShell', self);
            Hands.SetDrawType(2);
            Hands.LinkMesh(meshHands);
            Hands.SetBase(self);
            Hands.SetOwner(self);
            AttachToBone(Hands, 'XXXX_Dummy');
            iSavedBodyItemID = iBodyItemID;            
        }
        else
        {
            Log(("[wFPWeaponAttachmentAlien::ChangeHands] iBodyItemID : " $ string(iBodyItemID)) $ " Fail!");
        }
    }
    //return;    
}

function SetBodyItemID(int iBodyItemID)
{
    iSavedBodyItemID = iBodyItemID;
    //return;    
}

simulated function PlayIdle()
{
    // End:0x0D
    if(!IsActive())
    {
        return;
    }
    // End:0x34
    if(OwnerPawn.bIsDefencing)
    {
        LoopAnim(Anim_Defence, Anim_DefenceRate, 0.2000000);        
    }
    else
    {
        super.PlayIdle();
    }
    //return;    
}

defaultproperties
{
    iSavedBodyItemID=-1
}