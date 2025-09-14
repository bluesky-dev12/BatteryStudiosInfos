class wFPWeaponAttachment extends Actor
    notplaceable;

enum EFPAimState
{
    FPAS_None,                      // 0
    FPAS_Up,                        // 1
    FPAS_Idle,                      // 2
    FPAS_Down                       // 3
};

var array<wWeaponAcce> Parts;
var wSkinShell Hands;
var wSkinShell wWarhead;
var Pawn OwnerPawn;
var PlayerController OwnerPlayer;
var bool bSilencer;
var int iSavedWID;
var int iSavedPartsID;
var bool bOldAiming;
var byte byOldFlashCount;
var bool bDemopack;
var bool bUseFlashEffect;
var bool bUseWarhead;
var wWeaponBaseParams BaseParams;
var Class<wWeaponRes_Base> ResParams;
var Vector vPartsOffset;
var Vector vFPOffset;
var Vector vStanceOffset;
var float fStancePivot;
var bool bWeaponBob;
var float Bob;
var float LandBob;
var float AppliedBob;
var float bobtime;
var Vector WalkBob;
var Vector WalkBobCamera;
var float WalkZDamp;
var float LastFootStepTime;
var Vector dbgWalkBob;
var float fZoomFOV;
var bool bInstantFOV;
var bool bNoAiming;
var float Spread;
var float fSpread_Min;
var float fSpread_Max;
var float fSpreadReduce;
var float fSpreadReduce_Normal;
var float fLastRecoilReduceTime;
var int mCurrentWeaponID;
var wWeaponBaseParams mWBP;
var Pawn mViewTarget;
var wFPWeaponAttachment.EFPAimState FPAimState;
var Class<wEmitter> ShellCaseEmitterClass;
var wEmitter ShellCaseEmitter;
var Class<wEmitter> ClipEmitterClass;
var wEmitter ClipEmitter;
var Class<wEmitter> FlashEmitterClass;
var wEmitter FlashEmitter;
var Class<Emitter> FlashFirstPersonEmitterClass;
var Class<wEmitter> SmokeEmitterClass;
var wEmitter SmokeEmitter;
var Class<Emitter> SmokeFirstPersonEmitterClass;
var Class<wEmitter> SilencerSmokeEmitterClass;
var wEmitter SilencerSmokeEmitter;
var name IdleAnim;
var name RestAnim;
var name RunAnim;
var name SprintAnim;
var name SelectAnim;
var name SelectNewAnim;
var name PutDownAnim;
var name PutdownQuickAnim;
var name ProneMoveAnim;
var name SprintUpAnim;
var name ReloadBeginAnim;
var name ReloadEndAnim;
var name ReloadAnim;
var name ReloadEmptyAnim;
var name RechamberAnim;
var name Aim_RechamberAnim;
var name Aim_UpAnim;
var name Aim_DownAnim;
var name Aim_IdleAnim;
var name Aim_FireAnim;
var name Aim_FireLoopAnim;
var name FireAnim;
var name FireLoopAnim;
var name FireEndAnim;
var name Melee_FireAnim;
var name PlantAni;
var name DefuseAni;
var name BombThrow;
var name Anim_Plant_PutDown;
var name Anim_Defuse_PutDown;
var name Anim_Throw;
var name Anim_Defence;
var float IdleAnimRate;
var float RestAnimRate;
var float RunAnimRate;
var float SprintAnimRate;
var float SelectAnimRate;
var float SelectNewAnimRate;
var float PutDownAnimRate;
var float PutDownQuickAnimRate;
var float ReloadBeginAnimRate;
var float ReloadEndAnimRate;
var float ReloadAnimRate;
var float ReloadEmptyAnimRate;
var float RechamberAnimRate;
var float Aim_RechamberAnimRate;
var float Aim_UpAnimRate;
var float Aim_DownAnimRate;
var float Aim_IdleAnimRate;
var float Aim_FireAnimRate;
var float Aim_FireLoopAnimRate;
var float FireAnimRate;
var float FireLoopAnimRate;
var float FireEndAnimRate;
var float Anim_DefenceRate;

simulated event Destroyed()
{
    local int i;

    // End:0x17
    if(ShellCaseEmitter != none)
    {
        ShellCaseEmitter.Destroy();
    }
    // End:0x2E
    if(ClipEmitter != none)
    {
        ClipEmitter.Destroy();
    }
    // End:0x45
    if(FlashEmitter != none)
    {
        FlashEmitter.Destroy();
    }
    // End:0x5C
    if(SmokeEmitter != none)
    {
        SmokeEmitter.Destroy();
    }
    // End:0x73
    if(SilencerSmokeEmitter != none)
    {
        SilencerSmokeEmitter.Destroy();
    }
    // End:0x9C
    if(wWarhead != none)
    {
        DetachFromBone(wWarhead);
        wWarhead.Destroy();
        wWarhead = none;
    }
    bUseWarhead = false;
    i = 0;
    J0xAB:

    // End:0xE4 [Loop If]
    if(i < Parts.Length)
    {
        Parts[i].Destroy();
        Parts[i] = none;
        i++;
        // [Loop Continue]
        goto J0xAB;
    }
    Parts.Length = 0;
    // End:0x10A
    if(Hands != none)
    {
        Hands.Destroy();
        Hands = none;
    }
    super.Destroyed();
    //return;    
}

simulated function ResetBase()
{
    // End:0x17
    if(ShellCaseEmitter != none)
    {
        ShellCaseEmitter.Destroy();
    }
    // End:0x2E
    if(ClipEmitter != none)
    {
        ClipEmitter.Destroy();
    }
    // End:0x45
    if(FlashEmitter != none)
    {
        FlashEmitter.Destroy();
    }
    // End:0x5C
    if(SmokeEmitter != none)
    {
        SmokeEmitter.Destroy();
    }
    // End:0x73
    if(SilencerSmokeEmitter != none)
    {
        SilencerSmokeEmitter.Destroy();
    }
    // End:0x9C
    if(wWarhead != none)
    {
        DetachFromBone(wWarhead);
        wWarhead.Destroy();
        wWarhead = none;
    }
    Skins.Length = 0;
    bDemopack = false;
    bUseWarhead = false;
    bUseFlashEffect = false;
    FPAimState = 0;
    //return;    
}

simulated function wLoadOut(int iID, int iAddPartsID, int iPaintID, Pawn Pawn)
{
    local wWeaponManager wMani;
    local wWeaponBaseParams wBase;
    local Class<wWeaponRes_Base> wRes;
    local int iBodyItemID;
    local Mesh meshHands;
    local Material mt;
    local wItemBoxHK ItemInfo;

    OwnerPawn = Pawn;
    OwnerPlayer = Level.GetLocalPlayerController();
    // End:0x3FF
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
            // End:0x36E
            if(((OwnerPawn != none) && OwnerPawn.PlayerReplicationInfo != none) && OwnerPawn.PlayerReplicationInfo.Team != none)
            {
                // End:0x2F0
                if(OwnerPawn.PlayerReplicationInfo.Team.TeamIndex == 0)
                {
                    iBodyItemID = OwnerPawn.PlayerReplicationInfo.aiBodyItemID[0];                    
                }
                else
                {
                    iBodyItemID = OwnerPawn.PlayerReplicationInfo.aiBodyItemID[1];
                }
                // End:0x325
                if(iBodyItemID <= 0)
                {
                    iBodyItemID = 15000;
                }
                meshHands = Level.GameMgr.GetItemResourceMesh(iBodyItemID, false, byte(OwnerPawn.PlayerReplicationInfo.Team.TeamIndex));                
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
        }
        iSavedWID = iID;
    }
    bInstantFOV = false;
    // End:0x439
    if(iSavedPartsID != iAddPartsID)
    {
        bSilencer = false;
        AddPartsGroup(iID, iAddPartsID);
        iSavedPartsID = iAddPartsID;
    }
    SetWeaponPaint(iPaintID);
    ItemInfo = Level.GameMgr.FindUIItem(iBodyItemID);
    // End:0x501
    if((ItemInfo != none) && ItemInfo.ItemType != 11)
    {
        // End:0x501
        if(OwnerPawn.PlayerReplicationInfo.iCamouflageItemID > 0)
        {
            mt = Get1stCamouflageMt(OwnerPawn.PlayerReplicationInfo.iCamouflageItemID, byte(OwnerPawn.PlayerReplicationInfo.Team.TeamIndex));
            Hands.Skins[0] = mt;
        }
    }
    SetQuickFOV(OwnerPawn.bIsAiming);
    OwnerPlayer.fDeltaFOVAngle = 0.0000000;
    OwnerPlayer.fAnimRate_AdsOn = wBase.fAnimRate_AdsOn;
    OwnerPlayer.fAnimRate_AdsOff = wBase.fAnimRate_AdsOff;
    // End:0x588
    if(iID == 9000)
    {
        PlayAnim(Melee_FireAnim, 1.0000000, 0.0000000);        
    }
    else
    {
        // End:0x600
        if(bDemopack)
        {
            // End:0x5EB
            if((OwnerPawn.PlayerReplicationInfo.HasFlag != none) && OwnerPawn.PlayerReplicationInfo.HasFlag.IsA('wGameObject_Bomb'))
            {
                PlayAnim(PlantAni, 1.0000000, 0.0000000);                
            }
            else
            {
                PlayAnim(DefuseAni, 1.0000000, 0.0000000);
            }            
        }
        else
        {
            PlayAnim(SelectAnim, SelectAnimRate, 0.0000000);
        }
    }
    SetBaseParams(wBase);
    SetResParams(wRes);
    FPCalcSpread();
    //return;    
}

function Material Get1stCamouflageMt(int iItemID, byte byTeam)
{
    local Material mt;
    local wItemResourceParam cResParam;
    local wGameManager GM;
    local int iBodyItemID;
    local string str1stCamouflage;

    GM = Level.GameMgr;
    // End:0x103
    if(int(byTeam) == 0)
    {
        iBodyItemID = Instigator.PlayerReplicationInfo.aiBodyItemID[0];
        // End:0x56
        if(iBodyItemID <= 0)
        {
            iBodyItemID = 15000;
        }
        cResParam = GM.GetItemResourceParam(iBodyItemID);
        str1stCamouflage = cResParam.strRes_1st_AF_Camouflage;
        cResParam = GM.GetItemResourceParam(iItemID);
        str1stCamouflage = str1stCamouflage $ cResParam.strRes_1st_AF_Camouflage;
        // End:0x100
        if((cResParam.mesh_Base_1st == none) && Len(str1stCamouflage) > 1)
        {
            mt = Material(GM.DynamicLoadObject(str1stCamouflage, Class'Engine.Material'));
        }        
    }
    else
    {
        iBodyItemID = Instigator.PlayerReplicationInfo.aiBodyItemID[1];
        // End:0x138
        if(iBodyItemID <= 0)
        {
            iBodyItemID = 15000;
        }
        cResParam = GM.GetItemResourceParam(iBodyItemID);
        str1stCamouflage = cResParam.strRes_1st_RSA_Camouflage;
        cResParam = GM.GetItemResourceParam(iItemID);
        str1stCamouflage = str1stCamouflage $ cResParam.strRes_1st_RSA_Camouflage;
        // End:0x1E2
        if((cResParam.mesh_Base_1st_RSA == none) && Len(str1stCamouflage) > 1)
        {
            mt = Material(GM.DynamicLoadObject(str1stCamouflage, Class'Engine.Material'));
        }
    }
    return mt;
    //return;    
}

simulated function AddPartsGroup(int iWeaponID, int iAddPartsID)
{
    local wItemBaseParam ItemParam;
    local wItemResourceParam ItemResParam;
    local Vector AimDiff;
    local int i;
    local wWeaponCustomInfoParam wcip;
    local wWeaponCustomPartsParam wcpp;
    local int iSightPartID, iSilencerPartID, iBarrelPartID, iGunstockPartID, iSubSightPartItemID;

    wcip = Level.GameMgr.GetWeaponCustomInfoParam(iWeaponID);
    // End:0x53
    if((wcip.iItemID <= 0) || wcip.iItemID != iWeaponID)
    {
        return;
    }
    i = 0;
    J0x5A:

    // End:0x93 [Loop If]
    if(i < Parts.Length)
    {
        Parts[i].Destroy();
        Parts[i] = none;
        i++;
        // [Loop Continue]
        goto J0x5A;
    }
    Parts.Length = 0;
    iSightPartID = iAddPartsID & 1023;
    iBarrelPartID = iAddPartsID & 130048;
    iSilencerPartID = iAddPartsID & 16646144;
    iGunstockPartID = iAddPartsID & 2130706432;
    // End:0x330
    if(iSightPartID > 1)
    {
        wcpp = Level.GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iSightPartID);
        // End:0x32D
        if((wcpp.iItemID > 0) && wcpp.iPartID == iSightPartID)
        {
            iSubSightPartItemID = wcip.iSightOnAddItemID;
            ItemResParam = Level.GameMgr.GetItemResourceParam(wcpp.iItemID);
            // End:0x32D
            if(ItemResParam.iItemResourceID != -1)
            {
                ItemParam = Level.GameMgr.GetItemParam(wcpp.iItemID);
                AimDiff.X = wcip.vAimDiff.X + wcpp.vAddAimDiff.X;
                AimDiff.Y = wcip.vAimDiff.Y + wcpp.vAddAimDiff.Y;
                AimDiff.Z = wcip.vAimDiff.Z + wcpp.vAddAimDiff.Z;
                // End:0x2C2
                if(int(ItemParam.eType) == int(20))
                {
                    AddParts(1, ItemResParam.strRes_1st, ItemResParam.strRes_3rd_AF_Backpack, ItemResParam.strHaveDotName, AimDiff, wcpp.iItemID, iAddPartsID);                    
                }
                else
                {
                    // End:0x32D
                    if(int(ItemParam.eType) == int(26))
                    {
                        AddParts(3, ItemResParam.strRes_1st, ItemResParam.strRes_3rd_AF_Backpack, ItemResParam.strHaveDotName, AimDiff, wcpp.iItemID, iAddPartsID);
                        bInstantFOV = true;
                    }
                }
            }
        }        
    }
    else
    {
        iSubSightPartItemID = wcip.iSightOffAddItemID;
    }
    // End:0x49E
    if(iSubSightPartItemID > 0)
    {
        ItemResParam = Level.GameMgr.GetItemResourceParam(iSubSightPartItemID);
        // End:0x49E
        if(ItemResParam.iItemResourceID != -1)
        {
            ItemParam = Level.GameMgr.GetItemParam(iSubSightPartItemID);
            AimDiff.X = 0.0000000;
            AimDiff.Y = 0.0000000;
            AimDiff.Z = 0.0000000;
            // End:0x43B
            if(int(ItemParam.eType) == int(20))
            {
                AddParts(1, ItemResParam.strRes_1st, ItemResParam.strRes_3rd_AF_Backpack, ItemResParam.strHaveDotName, AimDiff, iSubSightPartItemID, iAddPartsID, true);                
            }
            else
            {
                // End:0x49E
                if(int(ItemParam.eType) == int(26))
                {
                    AddParts(3, ItemResParam.strRes_1st, ItemResParam.strRes_3rd_AF_Backpack, ItemResParam.strHaveDotName, AimDiff, iSubSightPartItemID, iAddPartsID, true);
                    bInstantFOV = true;
                }
            }
        }
    }
    // End:0x590
    if(iSilencerPartID > (1 << 17))
    {
        wcpp = Level.GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iSilencerPartID);
        // End:0x590
        if((wcpp.iItemID > 0) && wcpp.iPartID == iSilencerPartID)
        {
            ItemResParam = Level.GameMgr.GetItemResourceParam(wcpp.iItemID);
            // End:0x590
            if(ItemResParam.iItemResourceID != -1)
            {
                AddParts(5, ItemResParam.strRes_1st, ItemResParam.strRes_3rd_AF_Backpack, "", vect(0.0000000, 0.0000000, 0.0000000), wcpp.iItemID, iAddPartsID);
                bSilencer = true;
            }
        }
    }
    // End:0x604
    if(iBarrelPartID > (1 << 10))
    {
        wcpp = Level.GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iBarrelPartID);
        // End:0x604
        if(wcpp.iItemID > 0)
        {
            AddParts(6, "", "", "", vect(0.0000000, 0.0000000, 0.0000000), wcpp.iItemID, iAddPartsID);
        }
    }
    // End:0x678
    if(iGunstockPartID > (1 << 24))
    {
        wcpp = Level.GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iGunstockPartID);
        // End:0x678
        if(wcpp.iItemID > 0)
        {
            AddParts(4, "", "", "", vect(0.0000000, 0.0000000, 0.0000000), wcpp.iItemID, iAddPartsID);
        }
    }
    //return;    
}

simulated function SetWeaponPaint(int iPaintID)
{
    local wWeaponCustomInfoParam wcip;

    wcip = Level.GameMgr.GetWeaponCustomInfoParam(iSavedWID);
    // End:0x53
    if((wcip.iItemID <= 0) || wcip.iItemID != iSavedWID)
    {
        return;
    }
    // End:0x91
    if(iPaintID > 0)
    {
        Skins[0] = Level.GameMgr.GetPartsGroupPainting(iSavedWID, iSavedPartsID,, iPaintID);        
    }
    else
    {
        // End:0xE1
        if(wcip.iDefaultPaintingID > 0)
        {
            Skins[0] = Level.GameMgr.GetPartsGroupPainting(iSavedWID, iSavedPartsID,, wcip.iDefaultPaintingID);            
        }
        else
        {
            Skins.Length = 0;
        }
    }
    //return;    
}

simulated function AddParts(wWeaponAcce.EAcceType Type, string szName, string szSkinName, string strHaveDotName, Vector AimDiff, int iItemID, int iPartsGroupID, optional bool bSecondSight)
{
    local int i;

    // End:0x16E
    if((((Parts.Length == 0) || int(Type) == int(2)) || int(Type) == int(5)) || bSecondSight)
    {
        i = Parts.Length;
        Parts.Length = Parts.Length + 1;
        Parts[i] = Spawn(Class'Engine.wWeaponAcce', self);
        // End:0xBE
        if((iItemID == -1) && iPartsGroupID == -1)
        {
            Parts[i].Set(Type, szName, AimDiff, iItemID, iPartsGroupID, true);            
        }
        else
        {
            Parts[i].Set(Type, szName, AimDiff, iItemID, iPartsGroupID);
        }
        // End:0x125
        if(Len(szSkinName) > 1)
        {
            Parts[i].Skins[0] = Material(DynamicLoadObject(szSkinName, Class'Engine.Material'));
        }
        // End:0x16E
        if((Len(strHaveDotName) > 1) && strHaveDotName != szName)
        {
            AddParts(2, strHaveDotName, "", strHaveDotName, vect(0.0000000, 0.0000000, 0.0000000), -1, -1);
        }
    }
    //return;    
}

simulated function AttWarhead(bool bAttOrDtt)
{
    // End:0x24
    if((ResParams.default.UseWarhead == false) || wWarhead == none)
    {
        return;
    }
    // End:0x51
    if(bAttOrDtt)
    {
        AttachToBone(wWarhead, 'Warhead');
        wWarhead.bHidden = false;        
    }
    else
    {
        DetachFromBone(wWarhead);
        wWarhead.bHidden = true;
    }
    //return;    
}

simulated function SetBaseParams(wWeaponBaseParams wBase)
{
    RechamberAnimRate = BaseParams.fRechamberRate;
    Aim_RechamberAnimRate = BaseParams.fRechamberRate;
    ReloadAnimRate = BaseParams.fReloadRate;
    ReloadEmptyAnimRate = BaseParams.fReloadEmptyRate;
    ReloadBeginAnimRate = BaseParams.fReloadBeginRate;
    ReloadEndAnimRate = BaseParams.fReloadEndRate;
    Aim_UpAnimRate = BaseParams.fAnimRate_AdsOn;
    Aim_DownAnimRate = BaseParams.fAnimRate_AdsOff;
    //return;    
}

simulated function SetResParams(Class<wWeaponRes_Base> wRes)
{
    ResParams = wRes;
    ShellCaseEmitterClass = Class<wEmitter>(DynamicLoadObject(ResParams.default.szClass_Shell, Class'Core.Class'));
    // End:0x68
    if(ResParams.default.szClass_Clip != "")
    {
        ClipEmitterClass = Class<wEmitter>(DynamicLoadObject(ResParams.default.szClass_Clip, Class'Core.Class'));
    }
    // End:0x92
    if(ShellCaseEmitterClass != none)
    {
        ShellCaseEmitter = Spawn(ShellCaseEmitterClass, self);
        AttachToBone(ShellCaseEmitter, 'shell');
    }
    // End:0xBC
    if(ClipEmitterClass != none)
    {
        ClipEmitter = Spawn(ClipEmitterClass, self);
        AttachToBone(ClipEmitter, 'shell');
    }
    // End:0x124
    if(ResParams.default.szClass_Muzz_1st != "")
    {
        FlashEmitterClass = Class<wEmitter>(DynamicLoadObject(ResParams.default.szClass_Muzz_1st, Class'Core.Class'));
        // End:0x124
        if(FlashEmitterClass == none)
        {
            FlashFirstPersonEmitterClass = Class<EmitterFirstPerson>(DynamicLoadObject(ResParams.default.szClass_Muzz_1st, Class'Core.Class'));
        }
    }
    // End:0x16E
    if((FlashEmitterClass != none) && (FlashEmitter == none) || FlashEmitter.bDeleteMe)
    {
        FlashEmitter = Spawn(FlashEmitterClass);
        AttachToBone(FlashEmitter, 'tip');
    }
    // End:0x1ED
    if(bSilencer)
    {
        // End:0x1B0
        if(ResParams.default.szClass_Smoke_Silencer_1st != "")
        {
            SilencerSmokeEmitterClass = Class<wEmitter>(DynamicLoadObject(ResParams.default.szClass_Smoke_Silencer_1st, Class'Core.Class'));
        }
        // End:0x1EA
        if((SilencerSmokeEmitterClass != none) && (SilencerSmokeEmitter == none) || SmokeEmitter.bDeleteMe)
        {
            SilencerSmokeEmitter = Spawn(SilencerSmokeEmitterClass);
        }        
    }
    else
    {
        // End:0x255
        if(ResParams.default.szClass_Smoke_1st != "")
        {
            SmokeEmitterClass = Class<wEmitter>(DynamicLoadObject(ResParams.default.szClass_Smoke_1st, Class'Core.Class'));
            // End:0x255
            if(SmokeEmitterClass == none)
            {
                SmokeFirstPersonEmitterClass = Class<EmitterFirstPerson>(DynamicLoadObject(ResParams.default.szClass_Smoke_1st, Class'Core.Class'));
            }
        }
        // End:0x28F
        if((SmokeEmitterClass != none) && (SmokeEmitter == none) || SmokeEmitter.bDeleteMe)
        {
            SmokeEmitter = Spawn(SmokeEmitterClass);
        }
    }
    // End:0x2BF
    if(ResParams.default.UseWarhead == true)
    {
        LoadWarhead(wRes.default.stProj);
        AttWarhead(true);
    }
    //return;    
}

simulated function LoadWarhead(StaticMesh stProj)
{
    // End:0x29
    if(wWarhead != none)
    {
        DetachFromBone(wWarhead);
        wWarhead.Destroy();
        wWarhead = none;
    }
    wWarhead = Spawn(Class'Engine.wSkinShell', self);
    wWarhead.SetDrawType(8);
    wWarhead.SetStaticMesh(stProj);
    wWarhead.SetBase(self);
    wWarhead.SetOwner(self);
    wWarhead.bHidden = true;
    bUseWarhead = true;
    //return;    
}

simulated function SpawnShell()
{
    // End:0x20
    if(ShellCaseEmitter != none)
    {
        ShellCaseEmitter.Trigger(self, OwnerPawn);
    }
    // End:0x40
    if(ClipEmitter != none)
    {
        ClipEmitter.Trigger(self, OwnerPawn);
    }
    //return;    
}

simulated function DrawMuzzleFlash(Canvas Canvas)
{
    // End:0x40
    if(SmokeEmitter != none)
    {
        SmokeEmitter.SetLocation(FlashEmitter.Location);
        Canvas.DrawActor(SmokeEmitter, false, false, 60.0000000);        
    }
    else
    {
        // End:0x7D
        if(SilencerSmokeEmitter != none)
        {
            SilencerSmokeEmitter.SetLocation(FlashEmitter.Location);
            Canvas.DrawActor(SilencerSmokeEmitter, false, false, 60.0000000);
        }
    }
    // End:0xA0
    if(FlashEmitter != none)
    {
        Canvas.DrawActor(FlashEmitter, false, false, 60.0000000);
    }
    //return;    
}

simulated function FlashMuzzleFlash()
{
    // End:0x0B
    if(bSilencer)
    {
        return;
    }
    // End:0x2B
    if(FlashEmitter != none)
    {
        FlashEmitter.Trigger(self, OwnerPawn);
    }
    //return;    
}

simulated function StartMuzzleSmoke()
{
    // End:0x57
    if(!Level.bDropDetail)
    {
        // End:0x37
        if(SmokeEmitter != none)
        {
            SmokeEmitter.Trigger(self, OwnerPawn);            
        }
        else
        {
            // End:0x57
            if(SilencerSmokeEmitter != none)
            {
                SilencerSmokeEmitter.Trigger(self, OwnerPawn);
            }
        }
    }
    //return;    
}

simulated function Change3DScopeMesh(bool bAiming)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x7D [Loop If]
    if(i < Parts.Length)
    {
        // End:0x73
        if(int(Parts[i].AcceType) == int(3))
        {
            // End:0x71
            if(Parts[i].IsAiming() != bAiming)
            {
                Parts[i].Switch3DScope(bAiming);
            }
            return;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

simulated function SetFOV(bool bFOV, optional bool bQuick)
{
    // End:0x4E
    if(OwnerPlayer.bBehindView)
    {
        OwnerPlayer.FovAngle = OwnerPlayer.DefaultFOV;
        OwnerPlayer.DesiredFOV = OwnerPlayer.DefaultFOV;
        return;
    }
    // End:0x74
    if(bFOV)
    {
        OwnerPlayer.ZoomFOV(fZoomFOV, bInstantFOV);        
    }
    else
    {
        OwnerPlayer.ZoomFOV(0.0000000, bInstantFOV);
        FPAimState = 0;
    }
    //return;    
}

simulated function SetQuickFOV(bool bFOV)
{
    // End:0x21
    if(bFOV)
    {
        OwnerPlayer.ZoomFOV(fZoomFOV, true);        
    }
    else
    {
        OwnerPlayer.ZoomFOV(0.0000000, true);
        FPAimState = 0;
    }
    //return;    
}

simulated function AnimEnd(int Channel)
{
    local name Anim;
    local float frame, Rate;
    local string strAction;

    // End:0x1A
    if(!IsActive() && Channel > 0)
    {
        return;
    }
    GetAnimParams(0, Anim, frame, Rate);
    strAction = string(Anim);
    // End:0x66
    if(InStr(strAction, "MeleeAttack") != -1)
    {
        Rate = 1.0000000;
    }
    // End:0xA8
    if((InStr(strAction, "_Select") != -1) && iSavedWID == 9000)
    {
        PlayAnim(Melee_FireAnim, 1.0000000, 0.0000000);
        return;        
    }
    else
    {
        // End:0xC8
        if(InStr(strAction, "_Putdown") != -1)
        {
            return;            
        }
        else
        {
            // End:0x113
            if(InStr(strAction, "Rechamber") != -1)
            {
                // End:0x110
                if(bInstantFOV)
                {
                    // End:0x109
                    if(OwnerPawn.bIsAiming)
                    {
                        Change3DScopeMesh(true);                        
                    }
                    else
                    {
                        Change3DScopeMesh(false);
                    }
                }                
            }
            else
            {
                // End:0x125
                if(Anim == Melee_FireAnim)
                {                    
                }
                else
                {
                    // End:0x167
                    if(Anim == Aim_UpAnim)
                    {
                        // End:0x164
                        if(int(FPAimState) != int(0))
                        {
                            FPAimState = 2;
                            bOldAiming = true;
                            // End:0x164
                            if(bInstantFOV)
                            {
                                Change3DScopeMesh(true);
                            }
                        }                        
                    }
                    else
                    {
                        // End:0x19D
                        if(Anim == Aim_DownAnim)
                        {
                            FPAimState = 0;
                            bOldAiming = false;
                            // End:0x196
                            if(bInstantFOV)
                            {
                                Change3DScopeMesh(false);
                            }
                            SetFOV(false);
                        }
                    }
                }
            }
        }
    }
    bNoAiming = false;
    PlayIdle();
    //return;    
}

simulated function PlayIdle()
{
    // End:0x0D
    if(!IsActive())
    {
        return;
    }
    // End:0x67
    if(OwnerPawn.bIsSprinting && VSize(OwnerPawn.Velocity) > 50.0000000)
    {
        LoopAnim(SprintAnim, SprintAnimRate, 0.3000000);
        // End:0x5D
        if(bInstantFOV)
        {
            Change3DScopeMesh(false);
        }
        SetFOV(false);        
    }
    else
    {
        // End:0xA5
        if(OwnerPawn.bIsAiming)
        {
            LoopAnim(Aim_IdleAnim, Aim_IdleAnimRate, 0.2000000);
            FPAimState = 2;
            bOldAiming = true;
            SetFOV(true);            
        }
        else
        {
            LoopAnim(IdleAnim, IdleAnimRate, 0.2000000);
            // End:0xF8
            if(int(FPAimState) == int(0))
            {
                bOldAiming = false;
                // End:0xF1
                if(bInstantFOV && int(FPAimState) == int(0))
                {
                    Change3DScopeMesh(false);
                }
                SetFOV(false);
            }
        }
    }
    //return;    
}

simulated function PlayDefence()
{
    LoopAnim(Anim_Defence, 0.0000000, 0.5000000);
    //return;    
}

simulated function SetAnimAction(byte byType, optional bool Opt1)
{
    local float fTemp;

    switch(byType)
    {
        // End:0x71
        case 0:
            // End:0x23
            if(Opt1)
            {
                fTemp = 1.5000000;                
            }
            else
            {
                fTemp = 1.0000000;
            }
            PlayAnim(ReloadAnim, ReloadAnimRate * fTemp, 0.0000000);
            // End:0x57
            if(bInstantFOV)
            {
                Change3DScopeMesh(false);
            }
            SetFOV(false);
            // End:0x6E
            if(bUseWarhead)
            {
                AttWarhead(true);
            }
            // End:0x1A2
            break;
        // End:0xC0
        case 1:
            // End:0x94
            if(Opt1)
            {
                PlayAnim(PutdownQuickAnim, PutDownQuickAnimRate, 0.0000000);                
            }
            else
            {
                PlayAnim(PutDownAnim, PutDownAnimRate, 0.0000000);
            }
            // End:0xB6
            if(bInstantFOV)
            {
                Change3DScopeMesh(false);
            }
            SetFOV(false);
            // End:0x1A2
            break;
        // End:0x150
        case 2:
            fTemp = 1.0000000;
            // End:0x114
            if(int(FPAimState) == int(0))
            {
                PlayAnim(RechamberAnim, RechamberAnimRate * fTemp, 0.0000000);
                // End:0x109
                if(bInstantFOV)
                {
                    Change3DScopeMesh(false);
                }
                bOldAiming = false;                
            }
            else
            {
                PlayAnim(Aim_RechamberAnim, Aim_RechamberAnimRate * fTemp, 0.0000000);
                // End:0x13D
                if(bInstantFOV)
                {
                    Change3DScopeMesh(true);
                }
                bOldAiming = true;
                FPAimState = 2;
            }
            // End:0x1A2
            break;
        // End:0x19F
        case 3:
            // End:0x173
            if(Opt1)
            {
                PlayAnim(Anim_Plant_PutDown, 1.0000000, 0.0000000);                
            }
            else
            {
                PlayAnim(Anim_Defuse_PutDown, 1.0000000, 0.0000000);
            }
            // End:0x195
            if(bInstantFOV)
            {
                Change3DScopeMesh(false);
            }
            SetFOV(false);
            // End:0x1A2
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

simulated function CalcPartsOffset()
{
    local int i;
    local Vector vCurrAimDiff;
    local name szAnim;
    local float fFrame, fRate;
    local Vector vDiff;
    local float fLerp;

    i = 0;
    J0x07:

    // End:0x9E [Loop If]
    if(i < Parts.Length)
    {
        vCurrAimDiff += Parts[i].vAimDiff;
        // End:0x7D
        if((int(Parts[i].AcceType) == int(2)) && int(FPAimState) != int(2))
        {
            Parts[i].bHidden = true;
            // [Explicit Continue]
            goto J0x94;
        }
        Parts[i].bHidden = false;
        J0x94:

        i++;
        // [Loop Continue]
        goto J0x07;
    }
    GetAnimParams(0, szAnim, fFrame, fRate);
    // End:0xF0
    if(szAnim == 'Ads_Up')
    {
        fLerp = FMin(1.0000000, fFrame * float(2));
        vDiff = fLerp * vCurrAimDiff;        
    }
    else
    {
        // End:0x133
        if(szAnim == 'Ads_Down')
        {
            fLerp = 1.0000000 - FMin(1.0000000, fFrame * float(2));
            vDiff = fLerp * vCurrAimDiff;            
        }
        else
        {
            // End:0x172
            if(((szAnim == 'Ads_Idle') || szAnim == 'Ads_Fire') || szAnim == 'Ads_Rechamber')
            {
                vDiff = vCurrAimDiff;                
            }
            else
            {
                vDiff = vect(0.0000000, 0.0000000, 0.0000000);
            }
        }
    }
    vPartsOffset = vDiff;
    //return;    
}

simulated function float CalcDestPivot()
{
    local float fDestPivot;

    // End:0x20
    if(OwnerPawn.bIsAiming)
    {
        fDestPivot = 0.0000000;        
    }
    else
    {
        // End:0x40
        if(OwnerPawn.bIsProned)
        {
            fDestPivot = -1.6000000;            
        }
        else
        {
            // End:0x60
            if(OwnerPawn.bIsCrouched)
            {
                fDestPivot = -1.0000000;                
            }
            else
            {
                fDestPivot = 0.0000000;
            }
        }
    }
    return fDestPivot;
    //return;    
}

simulated function CalcStanceOffset(float fDelta)
{
    local float fDestPivot, fDeltaPivot, fDMax, fDMin;

    fDMin = 2.0000000 * fDelta;
    fDMax = 6.0000000 * fDelta;
    fDestPivot = CalcDestPivot();
    // End:0xE9
    if(fDestPivot != fStancePivot)
    {
        fDeltaPivot = ((fDestPivot - fStancePivot) * float(6)) * fDelta;
        // End:0x96
        if(fDeltaPivot < float(0))
        {
            fDeltaPivot = FMax(fDeltaPivot, -fDMax);
            fDeltaPivot = FMin(fDeltaPivot, -fDMin);            
        }
        else
        {
            fDeltaPivot = FMin(fDeltaPivot, fDMax);
            fDeltaPivot = FMax(fDeltaPivot, fDMin);
        }
        fStancePivot += fDeltaPivot;
        // End:0xE9
        if(Abs(fDestPivot - fStancePivot) < fDMin)
        {
            fStancePivot = fDestPivot;
        }
    }
    vStanceOffset.Z = fStancePivot;
    //return;    
}

simulated function Vector WeaponBob(float BobDamping)
{
    local Vector WBob;

    WBob = BobDamping * WalkBob;
    WBob.Z = (0.4500000 + (0.5500000 * BobDamping)) * WalkBob.Z;
    WBob.Z += LandBob;
    return WBob;
    //return;    
}

simulated function CheckBob(float DeltaTime)
{
    local float Speed2D, BobCamera, MaxSpeed, fStaminaRatio;
    local Vector X, Y, Z;
    local float OldBobTime;
    local int M, N;

    OldBobTime = bobtime;
    GetAxes(OwnerPlayer.CalcViewRotation, X, Y, Z);
    // End:0x4D
    if(float(0) < VSize(OwnerPawn.Velocity))
    {
        bWeaponBob = true;        
    }
    else
    {
        bWeaponBob = false;
    }
    // End:0x93
    if(!bWeaponBob)
    {
        bobtime = 0.0000000;
        WalkBob = vect(0.0000000, 0.0000000, 0.0000000);
        WalkBobCamera = vect(0.0000000, 0.0000000, 0.0000000);
        return;
    }
    // End:0x193
    if(!OwnerPawn.bIsSprinting)
    {
        // End:0xE4
        if(OwnerPawn.bIsCrouched)
        {
            Bob = BaseParams.fBobWeapon_Ducked_Move;
            BobCamera = BaseParams.fBobScreen_Ducked_Move;            
        }
        else
        {
            // End:0x118
            if(OwnerPawn.bIsProned)
            {
                Bob = 0.0000000;
                BobCamera = BaseParams.fBobScreen_Prone_Move;                
            }
            else
            {
                Bob = BaseParams.fBobWeapon_Move;
                BobCamera = BaseParams.fBobScreen_Move;
            }
        }
        // End:0x190
        if(OwnerPawn.bIsAiming && !OwnerPawn.bIsProned)
        {
            Bob = BaseParams.fBobWeapon_Ads_Move;
            BobCamera = BaseParams.fBobScreen_Ads_Move;
        }        
    }
    else
    {
        Bob = BaseParams.fBobWeapon_Sprint_Move;
        BobCamera = BaseParams.fBobScreen_Sprint_Move;
    }
    // End:0x21E
    if((!OwnerPawn.bIsProned && !OwnerPawn.bIsAiming) && Bob == float(0))
    {
        Bob = default.Bob;
        // End:0x21E
        if(!OwnerPawn.bIsSprinting)
        {
            Bob = 0.0005000;
        }
    }
    Bob = FClamp(Bob, -0.0100000, 0.0100000);
    BobCamera = FClamp(BobCamera, -0.0400000, 0.0400000);
    // End:0x4A7
    if(int(OwnerPawn.Physics) == int(1))
    {
        Speed2D = VSize(OwnerPawn.Velocity);
        // End:0x29F
        if(Speed2D < float(10))
        {
            bobtime += (0.2000000 * DeltaTime);            
        }
        else
        {
            // End:0x2F7
            if(OwnerPawn.bIsCrouched == true)
            {
                // End:0x2E0
                if(OwnerPawn.bIsAiming == true)
                {
                    MaxSpeed = BaseParams.fAimCrouchSpeed;                    
                }
                else
                {
                    MaxSpeed = BaseParams.fCrouchSpeed;
                }                
            }
            else
            {
                // End:0x323
                if(OwnerPawn.bIsProned == true)
                {
                    MaxSpeed = BaseParams.fPronedSpeed;                    
                }
                else
                {
                    // End:0x34F
                    if(OwnerPawn.bIsAiming == true)
                    {
                        MaxSpeed = BaseParams.fAimRunSpeed;                        
                    }
                    else
                    {
                        MaxSpeed = BaseParams.fRunSpeed;
                    }
                }
            }
            bobtime += (DeltaTime * (0.3000000 + ((0.7000000 * Speed2D) / MaxSpeed)));
        }
        WalkBob = ((Y * Bob) * Speed2D) * Sin(8.0000000 * bobtime);
        WalkBobCamera = ((Y * BobCamera) * Speed2D) * Sin(8.0000000 * bobtime);
        AppliedBob = AppliedBob * (float(1) - FMin(1.0000000, 16.0000000 * DeltaTime));
        WalkBob.Z = AppliedBob;
        WalkBobCamera.Z = AppliedBob;
        // End:0x4A4
        if(Speed2D > float(10))
        {
            WalkBob.Z = WalkBob.Z + (((WalkZDamp * Bob) * Speed2D) * Sin(16.0000000 * bobtime));
            WalkBobCamera.Z = WalkBobCamera.Z + (((WalkZDamp * BobCamera) * Speed2D) * Sin(16.0000000 * bobtime));
        }        
    }
    else
    {
        // End:0x57E
        if(int(Physics) == int(3))
        {
            bobtime += DeltaTime;
            Speed2D = Sqrt((OwnerPawn.Velocity.X * OwnerPawn.Velocity.X) + (OwnerPawn.Velocity.Y * OwnerPawn.Velocity.Y));
            WalkBob = (((Y * Bob) * 0.5000000) * Speed2D) * Sin(4.0000000 * bobtime);
            WalkBob.Z = ((Bob * 1.5000000) * Speed2D) * Sin(8.0000000 * bobtime);            
        }
        else
        {
            bobtime = 0.0000000;
            WalkBob = WalkBob * (float(1) - FMin(1.0000000, 8.0000000 * DeltaTime));
            WalkBobCamera = WalkBobCamera * (float(1) - FMin(1.0000000, 8.0000000 * DeltaTime));
        }
    }
    // End:0x609
    if((int(OwnerPawn.Physics) != int(1)) || VSize(OwnerPawn.Velocity) < float(10))
    {
        return;
    }
    M = int((0.5000000 * 3.1415927) + ((8.0000000 * OldBobTime) / 3.1415927));
    N = int((0.5000000 * 3.1415927) + ((8.0000000 * bobtime) / 3.1415927));
    fStaminaRatio = OwnerPlayer.fSprintTime / OwnerPawn.wMyParam.Stm_MaxTime;
    // End:0x713
    if((((M != N) && !OwnerPawn.bIsCrouched) && !OwnerPawn.bIsProned) && !OwnerPawn.bIsAiming)
    {
        OwnerPawn.FootStepping(0);
        // End:0x710
        if(fStaminaRatio < OwnerPawn.fMinStaminaRatio)
        {
            OwnerPawn.PlayBreathSounds();
        }        
    }
    else
    {
        // End:0x7CC
        if((((!bWeaponBob && !OwnerPawn.bIsCrouched) && !OwnerPawn.bIsProned) && !OwnerPawn.bIsAiming) && (Level.TimeSeconds - LastFootStepTime) > 0.3500000)
        {
            LastFootStepTime = Level.TimeSeconds;
            OwnerPawn.FootStepping(0);
            // End:0x7CC
            if(fStaminaRatio < OwnerPawn.fMinStaminaRatio)
            {
                OwnerPawn.PlayBreathSounds();
            }
        }
    }
    //return;    
}

simulated function ShakeView()
{
    local PlayerController P;
    local Rotator rMin, rMax;
    local int iPitch, iYaw;
    local float fDecayFastBeginTime;

    P = OwnerPlayer;
    // End:0x27D
    if(P != none)
    {
        // End:0x153
        if(int(FPAimState) == int(2))
        {
            rMin.Pitch = int(BaseParams.fViewKickAds_YMin);
            rMin.Yaw = int(BaseParams.fViewKickAds_XMin);
            rMax.Pitch = int(BaseParams.fViewKickAds_YMax);
            rMax.Yaw = int(BaseParams.fViewKickAds_XMax);
            iPitch = rMin.Pitch + Rand(rMax.Pitch - rMin.Pitch);
            iYaw = rMin.Yaw + Rand(rMax.Yaw - rMin.Yaw);
            fDecayFastBeginTime = BaseParams.fViewKickAds_DecayTimeFast;
            P.wShakeView(iPitch, iYaw, BaseParams.fViewKickAds_Accel, BaseParams.fViewKickAds_Decel, BaseParams.fViewKickAds_StayTime, BaseParams.fViewKickAds_DecaySpeed, fDecayFastBeginTime);            
        }
        else
        {
            rMin.Pitch = int(BaseParams.fViewKickHip_YMin);
            rMin.Yaw = int(BaseParams.fViewKickHip_XMin);
            rMax.Pitch = int(BaseParams.fViewKickHip_YMax);
            rMax.Yaw = int(BaseParams.fViewKickHip_XMax);
            iPitch = rMin.Pitch + Rand(rMax.Pitch - rMin.Pitch);
            iYaw = rMin.Yaw + Rand(rMax.Yaw - rMin.Yaw);
            fDecayFastBeginTime = BaseParams.fViewKickHip_DecayTimeFast;
            P.wShakeView(iPitch, iYaw, BaseParams.fViewKickHip_Accel, BaseParams.fViewKickHip_Decel, BaseParams.fViewKickHip_StayTime, BaseParams.fViewKickHip_DecaySpeed, fDecayFastBeginTime);
        }
    }
    //return;    
}

simulated function bool IsActive()
{
    // End:0x1D
    if(OwnerPlayer.ViewTarget == OwnerPawn)
    {
        return true;        
    }
    else
    {
        return false;
    }
    //return;    
}

simulated function RefreshState()
{
    // End:0x22
    if(OwnerPawn.bIsAiming)
    {
        FPAimState = 2;
        bOldAiming = true;
    }
    // End:0x4C
    if(int(FPAimState) == int(0))
    {
        // End:0x42
        if(bInstantFOV)
        {
            Change3DScopeMesh(false);
        }
        SetQuickFOV(false);        
    }
    else
    {
        // End:0x73
        if(int(FPAimState) == int(2))
        {
            // End:0x6C
            if(bInstantFOV)
            {
                Change3DScopeMesh(true);
            }
            SetQuickFOV(true);
        }
    }
    PlayIdle();
    //return;    
}

simulated function TickFPWeapon(float DeltaTime)
{
    local float fAimAniRate;
    local byte FlashCount, FiringMode;

    // End:0x1E
    if((OwnerPawn == none) || iSavedWID == -1)
    {
        return;
    }
    // End:0x54
    if((OwnerPawn.PlayerReplicationInfo == none) || OwnerPawn.PlayerReplicationInfo.IsDead == true)
    {
        return;
    }
    CalcStanceOffset(DeltaTime);
    CalcPartsOffset();
    CheckBob(DeltaTime);
    OwnerPlayer.AdjustView(DeltaTime);
    OwnerPawn.GetWeaponAttachmentInfo(FlashCount, FiringMode);
    // End:0x111
    if(int(FlashCount) != int(byOldFlashCount))
    {
        // End:0x111
        if(int(FiringMode) == 2)
        {
            byOldFlashCount = FlashCount;
            // End:0x111
            if(int(byOldFlashCount) != 0)
            {
                PlayAnim(Melee_FireAnim, 1.0000000, 0.0000000);
                // End:0xF8
                if(bInstantFOV)
                {
                    Change3DScopeMesh(false);
                }
                SetFOV(false);
                FPAimState = 0;
                bNoAiming = true;
                return;
            }
        }
    }
    // End:0x1D1
    if((bOldAiming != OwnerPawn.bIsAiming) && !bNoAiming)
    {
        // End:0x183
        if(bOldAiming == false)
        {
            // End:0x180
            if(int(FPAimState) == int(0))
            {
                FPAimState = 1;
                fAimAniRate = Aim_UpAnimRate;
                PlayAnim(Aim_UpAnim, fAimAniRate, 0.0000000);
                SetFOV(true);
            }            
        }
        else
        {
            // End:0x1CF
            if(int(FPAimState) == int(2))
            {
                FPAimState = 3;
                fAimAniRate = Aim_DownAnimRate;
                PlayAnim(Aim_DownAnim, fAimAniRate, 0.0000000);
                // End:0x1C8
                if(bInstantFOV)
                {
                    Change3DScopeMesh(false);
                }
                SetFOV(false);
            }
        }
        return;
    }
    // End:0x2A3
    if(int(FlashCount) != int(byOldFlashCount))
    {
        byOldFlashCount = FlashCount;
        // End:0x2A3
        if(int(byOldFlashCount) != 0)
        {
            // End:0x208
            if(bDemopack)
            {                
            }
            else
            {
                // End:0x249
                if(OwnerPawn.bIsAiming == false)
                {
                    PlayAnim(FireAnim, FireAnimRate, 0.0000000);
                    // End:0x23F
                    if(bInstantFOV)
                    {
                        Change3DScopeMesh(false);
                    }
                    SetFOV(false);                    
                }
                else
                {
                    PlayAnim(Aim_FireAnim, Aim_FireAnimRate, 0.0000000);
                    // End:0x26B
                    if(bInstantFOV)
                    {
                        Change3DScopeMesh(true);
                    }
                    SetFOV(true);
                }
            }
            // End:0x29D
            if(bUseFlashEffect)
            {
                ShakeView();
                FlashMuzzleFlash();
                StartMuzzleSmoke();
                // End:0x29D
                if(bUseWarhead)
                {
                    AttWarhead(false);
                }
            }
            FPModeDoFire();
        }
    }
    Spread = Spread - (fSpreadReduce * (Level.TimeSeconds - fLastRecoilReduceTime));
    FPCalcSpread();
    fLastRecoilReduceTime = Level.TimeSeconds;
    //return;    
}

simulated function FPModeDoFire()
{
    local int iCurrentWeaponID;
    local wWeaponBaseParams WBP;

    iCurrentWeaponID = OwnerPawn.PlayerReplicationInfo.iCurrentWeaponID;
    WBP = Level.WeaponMgr.GetBaseParam(iCurrentWeaponID);
    Spread = Spread + WBP.fSpread_Fire_Add;
    FPCalcSpread();
    //return;    
}

simulated function FPCalcSpread()
{
    local float fSpreadMin, fSpreadMax;
    local int iCurrentWeaponID;

    mViewTarget = Pawn(OwnerPlayer.ViewTarget);
    // End:0x3C
    if((mViewTarget == none) || mViewTarget.PlayerReplicationInfo == none)
    {
        return;
    }
    iCurrentWeaponID = mViewTarget.PlayerReplicationInfo.iCurrentWeaponID;
    // End:0x96
    if(mCurrentWeaponID != iCurrentWeaponID)
    {
        mCurrentWeaponID = iCurrentWeaponID;
        mWBP = Level.WeaponMgr.GetBaseParam(iCurrentWeaponID);
    }
    // End:0xA3
    if(mWBP == none)
    {
        return;
    }
    // End:0xF4
    if(mViewTarget.bIsCrouched)
    {
        fSpread_Min = mWBP.fSpread_Ducked_Min;
        fSpread_Max = mWBP.fSpread_Ducked_Max;
        fSpreadReduce_Normal = mWBP.fSpread_Ducked_Reduce;        
    }
    else
    {
        // End:0x145
        if(mViewTarget.bIsProned)
        {
            fSpread_Min = mWBP.fSpread_Prone_Min;
            fSpread_Max = mWBP.fSpread_Prone_Max;
            fSpreadReduce_Normal = mWBP.fSpread_Prone_Reduce;            
        }
        else
        {
            // End:0x15A
            if(mViewTarget.bIsSprinting)
            {                
            }
            else
            {
                fSpread_Min = mWBP.fSpread_Stand_Min;
                fSpread_Max = mWBP.fSpread_Stand_Max;
                fSpreadReduce_Normal = mWBP.fSpread_Stand_Reduce;
            }
        }
    }
    // End:0x209
    if((int(mViewTarget.Physics) == int(2)) || int(mViewTarget.Physics) == int(11))
    {
        fSpreadMin = mWBP.fSpread_Jump;
        fSpreadMax = mWBP.fSpread_Jump;
        fSpreadReduce = mWBP.fSpread_Stand_Reduce;        
    }
    else
    {
        fSpreadMin = fSpread_Min;
        fSpreadMax = fSpread_Max;
        fSpreadReduce = fSpreadReduce_Normal;
    }
    // End:0x29C
    if((mViewTarget.Acceleration.X != float(0)) && mViewTarget.Acceleration.Y != float(0))
    {
        // End:0x29C
        if(Spread < (fSpreadMin + mWBP.fSpread_Move_Add))
        {
            Spread = fSpreadMin + mWBP.fSpread_Move_Add;
        }
    }
    Spread = FClamp(Spread, fSpreadMin, fSpreadMax);
    mViewTarget.fWeaponSpread = Spread;
    //return;    
}

simulated event RenderOverlays(Canvas Canvas)
{
    local Pawn P;
    local Vector TmOffSet;
    local PlayerController PC;
    local Rotator rRotation;

    P = OwnerPawn;
    // End:0x2B
    if(P.PlayerReplicationInfo.IsDead == true)
    {
        return;
    }
    PC = OwnerPlayer;
    DrawMuzzleFlash(Canvas);
    rRotation = PC.CalcViewRotation;
    SetRotation(rRotation);
    TmOffSet = (vPartsOffset + vStanceOffset) + vFPOffset;
    // End:0x93
    if(bWeaponBob)
    {
        dbgWalkBob = WeaponBob(0.9600000);        
    }
    else
    {
        dbgWalkBob = vect(0.0000000, 0.0000000, 0.0000000);
    }
    SetLocation(P.Location + P.CalcFPSpectatorDrawOffset(TmOffSet, rRotation, dbgWalkBob));
    Canvas.DrawActor(self, false, false, 68.0000000);
    //return;    
}

simulated function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
    Canvas.SetDrawColor(0, byte(255), 120);
    Canvas.SetPos(4.0000000, YPos);
    Canvas.DrawText("@@@@ FPWeaponAttachment @@@@@ / " $ string(FPAimState), false);
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    Canvas.DrawText((((("Location: " $ string(Location)) $ " Rotation ") $ string(Rotation)) $ " / vFPOffset : ") $ string(vFPOffset), false);
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    Canvas.DrawText((((("### WalkBob : " $ string(WalkBob)) $ " - WalkBobCamera : ") $ string(WalkBobCamera)) $ " / dbgWalkBob : ") $ string(dbgWalkBob));
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    //return;    
}

defaultproperties
{
    iSavedWID=-1
    iSavedPartsID=-1
    Bob=0.0007000
    WalkZDamp=0.2500000
    mCurrentWeaponID=-1
    IdleAnim="Idle"
    RestAnim="rest"
    RunAnim="Run"
    SprintAnim="Sprint"
    SelectAnim="Select"
    SelectNewAnim="Select_New"
    PutDownAnim="PutDown"
    PutdownQuickAnim="PutDown_Quick"
    ProneMoveAnim="ProneMove"
    SprintUpAnim="Sprint_Up"
    ReloadBeginAnim="ReloadBegin"
    ReloadEndAnim="ReloadEnd"
    ReloadAnim="Reload"
    ReloadEmptyAnim="ReloadEmpty"
    RechamberAnim="Rechamber"
    Aim_RechamberAnim="Ads_Rechamber"
    Aim_UpAnim="Ads_Up"
    Aim_DownAnim="Ads_Down"
    Aim_IdleAnim="Ads_Idle"
    Aim_FireAnim="Ads_Fire"
    Aim_FireLoopAnim="Ads_Fire"
    FireAnim="Fire"
    FireLoopAnim="FireLoop"
    FireEndAnim="FireEnd"
    Melee_FireAnim="MeleeAttack"
    PlantAni="plant"
    DefuseAni="Defuse"
    BombThrow="Throw"
    Anim_Plant_PutDown="Plant_Down"
    Anim_Defuse_PutDown="Defuse_Down"
    Anim_Throw="Throw"
    Anim_Defence="Defence"
    IdleAnimRate=1.0000000
    RestAnimRate=1.0000000
    RunAnimRate=1.0000000
    SprintAnimRate=1.0000000
    SelectAnimRate=1.3636000
    PutDownAnimRate=1.3636000
    PutDownQuickAnimRate=1.0000000
    ReloadBeginAnimRate=1.0000000
    ReloadEndAnimRate=1.0000000
    ReloadAnimRate=1.0000000
    ReloadEmptyAnimRate=1.0000000
    RechamberAnimRate=1.0000000
    Aim_RechamberAnimRate=1.0000000
    Aim_UpAnimRate=1.0000000
    Aim_DownAnimRate=1.0000000
    Aim_IdleAnimRate=1.0000000
    Aim_FireAnimRate=1.0000000
    Aim_FireLoopAnimRate=1.0000000
    FireAnimRate=1.0000000
    FireLoopAnimRate=1.0000000
    FireEndAnimRate=1.0000000
    Anim_DefenceRate=1.0000000
    DrawType=2
    bHidden=true
    bOnlyOwnerSee=true
    bReplicateMovement=false
}