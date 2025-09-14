/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wFPWeaponAttachment.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Properties:107
 *	Functions:33
 *
 *******************************************************************************/
class wFPWeaponAttachment extends Actor
    notplaceable;

enum EFPAimState
{
    FPAS_None,
    FPAS_Up,
    FPAS_Idle,
    FPAS_Down
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
var class<wWeaponRes_Base> ResParams;
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
var class<wEmitter> ShellCaseEmitterClass;
var wEmitter ShellCaseEmitter;
var class<wEmitter> ClipEmitterClass;
var wEmitter ClipEmitter;
var class<wEmitter> FlashEmitterClass;
var wEmitter FlashEmitter;
var class<Emitter> FlashFirstPersonEmitterClass;
var class<wEmitter> SmokeEmitterClass;
var wEmitter SmokeEmitter;
var class<Emitter> SmokeFirstPersonEmitterClass;
var class<wEmitter> SilencerSmokeEmitterClass;
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

simulated event Destroyed()
{
    local int i;

    // End:0x17
    if(ShellCaseEmitter != none)
    {
        ShellCaseEmitter.Destroy();
    }
    // End:0x2e
    if(ClipEmitter != none)
    {
        ClipEmitter.Destroy();
    }
    // End:0x45
    if(FlashEmitter != none)
    {
        FlashEmitter.Destroy();
    }
    // End:0x5c
    if(SmokeEmitter != none)
    {
        SmokeEmitter.Destroy();
    }
    // End:0x73
    if(SilencerSmokeEmitter != none)
    {
        SilencerSmokeEmitter.Destroy();
    }
    // End:0x9c
    if(wWarhead != none)
    {
        DetachFromBone(wWarhead);
        wWarhead.Destroy();
        wWarhead = none;
    }
    bUseWarhead = false;
    i = 0;
    J0xab:
    // End:0xe4 [While If]
    if(i < Parts.Length)
    {
        Parts[i].Destroy();
        Parts[i] = none;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xab;
    }
    Parts.Length = 0;
    // End:0x10a
    if(Hands != none)
    {
        Hands.Destroy();
        Hands = none;
    }
    super.Destroyed();
}

simulated function ResetBase()
{
    // End:0x17
    if(ShellCaseEmitter != none)
    {
        ShellCaseEmitter.Destroy();
    }
    // End:0x2e
    if(ClipEmitter != none)
    {
        ClipEmitter.Destroy();
    }
    // End:0x45
    if(FlashEmitter != none)
    {
        FlashEmitter.Destroy();
    }
    // End:0x5c
    if(SmokeEmitter != none)
    {
        SmokeEmitter.Destroy();
    }
    // End:0x73
    if(SilencerSmokeEmitter != none)
    {
        SilencerSmokeEmitter.Destroy();
    }
    // End:0x9c
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
}

simulated function wLoadOut(int iID, int iAddPartsID, int iPaintID, Pawn Pawn)
{
    local wWeaponManager wMani;
    local wWeaponBaseParams wBase;
    local class<wWeaponRes_Base> wRes;
    local int iBodyItemID;
    local Mesh meshHands;

    OwnerPawn = Pawn;
    OwnerPlayer = Level.GetLocalPlayerController();
    // End:0x3e0
    if(iSavedWID != iID)
    {
        wMani = Level.WeaponMgr;
        wBase = wMani.GetBaseParam(iID);
        // End:0x6a
        if(wBase == none)
        {
            return;
        }
        BaseParams = wBase;
        fZoomFOV = BaseParams.fZoomFOV;
        wRes = wMani.GetRes(wBase.szClass_Resource);
        // End:0xb9
        if(wRes == none)
        {
            return;
        }
        ResetBase();
        // End:0x1d6
        if(BaseParams.eType == 0 || BaseParams.eType == 5 || BaseParams.eType == 10 || BaseParams.eType == 11 || BaseParams.eType == 12 || BaseParams.eType == 17 || BaseParams.eType == 13 || BaseParams.eType == 15 || BaseParams.eType == 14 || BaseParams.eType == 16)
        {
            bUseFlashEffect = false;
        }
        // End:0x1de
        else
        {
            bUseFlashEffect = true;
        }
        // End:0x1f5
        if(iID == 7002)
        {
            bDemopack = true;
        }
        // End:0x20b
        if(Hands != none)
        {
            DetachFromBone(Hands);
        }
        LinkMesh(Level.GameMgr.GetItemResourceMesh(iID, false));
        // End:0x24d
        if(Hands != none)
        {
            AttachToBone(Hands, 'XXXX_Dummy');
        }
        // End:0x3d5
        else
        {
            // End:0x34f
            if(OwnerPawn != none && OwnerPawn.PlayerReplicationInfo != none && OwnerPawn.PlayerReplicationInfo.Team != none)
            {
                // End:0x2d3
                if(OwnerPawn.PlayerReplicationInfo.Team.TeamIndex == 0)
                {
                    iBodyItemID = OwnerPawn.PlayerReplicationInfo.iBodyItemID_0;
                }
                // End:0x2f0
                else
                {
                    iBodyItemID = OwnerPawn.PlayerReplicationInfo.iBodyItemID_1;
                }
                // End:0x306
                if(iBodyItemID <= 0)
                {
                    iBodyItemID = 15000;
                }
                meshHands = Level.GameMgr.GetItemResourceMesh(iBodyItemID, false, byte(OwnerPawn.PlayerReplicationInfo.Team.TeamIndex));
            }
            // End:0x375
            else
            {
                meshHands = Level.GameMgr.GetItemResourceMesh(15000, false, 0);
            }
            Hands = Spawn(class'wSkinShell', self,,);
            Hands.SetDrawType(2);
            Hands.LinkMesh(meshHands);
            Hands.SetBase(self);
            Hands.SetOwner(self);
            AttachToBone(Hands, 'XXXX_Dummy');
        }
        iSavedWID = iID;
    }
    bInstantFOV = false;
    // End:0x41a
    if(iSavedPartsID != iAddPartsID)
    {
        bSilencer = false;
        AddPartsGroup(iID, iAddPartsID);
        iSavedPartsID = iAddPartsID;
    }
    SetWeaponPaint(iPaintID);
    SetQuickFOV(OwnerPawn.bIsAiming);
    OwnerPlayer.fDeltaFOVAngle = 0.0;
    OwnerPlayer.fAnimRate_AdsOn = wBase.fAnimRate_AdsOn;
    OwnerPlayer.fAnimRate_AdsOff = wBase.fAnimRate_AdsOff;
    // End:0x4ac
    if(iID == 9000)
    {
        PlayAnim(Melee_FireAnim, 1.0, 0.0);
    }
    // End:0x536
    else
    {
        // End:0x524
        if(bDemopack)
        {
            // End:0x50f
            if(OwnerPawn.PlayerReplicationInfo.HasFlag != none && OwnerPawn.PlayerReplicationInfo.HasFlag.IsA('wGameObject_Bomb'))
            {
                PlayAnim(PlantAni, 1.0, 0.0);
            }
            // End:0x521
            else
            {
                PlayAnim(DefuseAni, 1.0, 0.0);
            }
        }
        // End:0x536
        else
        {
            PlayAnim(SelectAnim, SelectAnimRate, 0.0);
        }
    }
    SetBaseParams(wBase);
    SetResParams(wRes);
    FPCalcSpread();
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
    if(wcip.iItemID <= 0 || wcip.iItemID != iWeaponID)
    {
        return;
    }
    i = 0;
    J0x5a:
    // End:0x93 [While If]
    if(i < Parts.Length)
    {
        Parts[i].Destroy();
        Parts[i] = none;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x5a;
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
        // End:0x32d
        if(wcpp.iItemID > 0 && wcpp.iPartID == iSightPartID)
        {
            iSubSightPartItemID = wcip.iSightOnAddItemID;
            ItemResParam = Level.GameMgr.GetItemResourceParam(wcpp.iItemID);
            // End:0x32d
            if(ItemResParam.iItemResourceID != -1)
            {
                ItemParam = Level.GameMgr.GetItemParam(wcpp.iItemID);
                AimDiff.X = wcip.vAimDiff.X + wcpp.vAddAimDiff.X;
                AimDiff.Y = wcip.vAimDiff.Y + wcpp.vAddAimDiff.Y;
                AimDiff.Z = wcip.vAimDiff.Z + wcpp.vAddAimDiff.Z;
                // End:0x2c2
                if(ItemParam.eType == 20)
                {
                    AddParts(1, ItemResParam.strRes_1st, ItemResParam.strRes_3rd_AF_Backpack, ItemResParam.strHaveDotName, AimDiff, wcpp.iItemID, iAddPartsID);
                }
                // End:0x32d
                else
                {
                    // End:0x32d
                    if(ItemParam.eType == 26)
                    {
                        AddParts(3, ItemResParam.strRes_1st, ItemResParam.strRes_3rd_AF_Backpack, ItemResParam.strHaveDotName, AimDiff, wcpp.iItemID, iAddPartsID);
                        bInstantFOV = true;
                    }
                }
            }
        }
    }
    // End:0x344
    else
    {
        iSubSightPartItemID = wcip.iSightOffAddItemID;
    }
    // End:0x49e
    if(iSubSightPartItemID > 0)
    {
        ItemResParam = Level.GameMgr.GetItemResourceParam(iSubSightPartItemID);
        // End:0x49e
        if(ItemResParam.iItemResourceID != -1)
        {
            ItemParam = Level.GameMgr.GetItemParam(iSubSightPartItemID);
            AimDiff.X = 0.0;
            AimDiff.Y = 0.0;
            AimDiff.Z = 0.0;
            // End:0x43b
            if(ItemParam.eType == 20)
            {
                AddParts(1, ItemResParam.strRes_1st, ItemResParam.strRes_3rd_AF_Backpack, ItemResParam.strHaveDotName, AimDiff, iSubSightPartItemID, iAddPartsID, true);
            }
            // End:0x49e
            else
            {
                // End:0x49e
                if(ItemParam.eType == 26)
                {
                    AddParts(3, ItemResParam.strRes_1st, ItemResParam.strRes_3rd_AF_Backpack, ItemResParam.strHaveDotName, AimDiff, iSubSightPartItemID, iAddPartsID, true);
                    bInstantFOV = true;
                }
            }
        }
    }
    // End:0x590
    if(iSilencerPartID > 1 << 17)
    {
        wcpp = Level.GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iSilencerPartID);
        // End:0x590
        if(wcpp.iItemID > 0 && wcpp.iPartID == iSilencerPartID)
        {
            ItemResParam = Level.GameMgr.GetItemResourceParam(wcpp.iItemID);
            // End:0x590
            if(ItemResParam.iItemResourceID != -1)
            {
                AddParts(5, ItemResParam.strRes_1st, ItemResParam.strRes_3rd_AF_Backpack, "", vect(0.0, 0.0, 0.0), wcpp.iItemID, iAddPartsID);
                bSilencer = true;
            }
        }
    }
}

simulated function SetWeaponPaint(int iPaintID)
{
    local wWeaponCustomInfoParam wcip;

    wcip = Level.GameMgr.GetWeaponCustomInfoParam(iSavedWID);
    // End:0x53
    if(wcip.iItemID <= 0 || wcip.iItemID != iSavedWID)
    {
        return;
    }
    // End:0x91
    if(iPaintID > 0)
    {
        Skins[0] = Level.GameMgr.GetPartsGroupPainting(iSavedWID, iSavedPartsID,, iPaintID);
    }
    // End:0xe9
    else
    {
        // End:0xe1
        if(wcip.iDefaultPaintingID > 0)
        {
            Skins[0] = Level.GameMgr.GetPartsGroupPainting(iSavedWID, iSavedPartsID,, wcip.iDefaultPaintingID);
        }
        // End:0xe9
        else
        {
            Skins.Length = 0;
        }
    }
}

simulated function AddParts(wWeaponAcce.EAcceType Type, string szName, string szSkinName, string strHaveDotName, Vector AimDiff, int iItemID, int iPartsGroupID, optional bool bSecondSight)
{
    local int i;

    // End:0x16e
    if(Parts.Length == 0 || Type == 2 || Type == 5 || bSecondSight)
    {
        i = Parts.Length;
        Parts.Length = Parts.Length + 1;
        Parts[i] = Spawn(class'wWeaponAcce', self);
        // End:0xbe
        if(iItemID == -1 && iPartsGroupID == -1)
        {
            Parts[i].Set(Type, szName, AimDiff, iItemID, iPartsGroupID, true);
        }
        // End:0xec
        else
        {
            Parts[i].Set(Type, szName, AimDiff, iItemID, iPartsGroupID);
        }
        // End:0x125
        if(Len(szSkinName) > 1)
        {
            Parts[i].Skins[0] = Material(DynamicLoadObject(szSkinName, class'Material'));
        }
        // End:0x16e
        if(Len(strHaveDotName) > 1 && strHaveDotName != szName)
        {
            AddParts(2, strHaveDotName, "", strHaveDotName, vect(0.0, 0.0, 0.0), -1, -1);
        }
    }
}

simulated function AttWarhead(bool bAttOrDtt)
{
    // End:0x24
    if(ResParams.default.UseWarhead == false || wWarhead == none)
    {
        return;
    }
    // End:0x51
    if(bAttOrDtt)
    {
        AttachToBone(wWarhead, 'Warhead');
        wWarhead.bHidden = false;
    }
    // End:0x6d
    else
    {
        DetachFromBone(wWarhead);
        wWarhead.bHidden = true;
    }
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
}

simulated function SetResParams(class<wWeaponRes_Base> wRes)
{
    ResParams = wRes;
    ShellCaseEmitterClass = class<wEmitter>(DynamicLoadObject(ResParams.default.szClass_Shell, class'Class'));
    // End:0x68
    if(ResParams.default.szClass_Clip != "")
    {
        ClipEmitterClass = class<wEmitter>(DynamicLoadObject(ResParams.default.szClass_Clip, class'Class'));
    }
    // End:0x92
    if(ShellCaseEmitterClass != none)
    {
        ShellCaseEmitter = Spawn(ShellCaseEmitterClass, self);
        AttachToBone(ShellCaseEmitter, 'shell');
    }
    // End:0xbc
    if(ClipEmitterClass != none)
    {
        ClipEmitter = Spawn(ClipEmitterClass, self);
        AttachToBone(ClipEmitter, 'shell');
    }
    // End:0x124
    if(ResParams.default.szClass_Muzz_1st != "")
    {
        FlashEmitterClass = class<wEmitter>(DynamicLoadObject(ResParams.default.szClass_Muzz_1st, class'Class'));
        // End:0x124
        if(FlashEmitterClass == none)
        {
            FlashFirstPersonEmitterClass = class<EmitterFirstPerson>(DynamicLoadObject(ResParams.default.szClass_Muzz_1st, class'Class'));
        }
    }
    // End:0x16e
    if(FlashEmitterClass != none && FlashEmitter == none || FlashEmitter.bDeleteMe)
    {
        FlashEmitter = Spawn(FlashEmitterClass);
        AttachToBone(FlashEmitter, 'tip');
    }
    // End:0x1ed
    if(bSilencer)
    {
        // End:0x1b0
        if(ResParams.default.szClass_Smoke_Silencer_1st != "")
        {
            SilencerSmokeEmitterClass = class<wEmitter>(DynamicLoadObject(ResParams.default.szClass_Smoke_Silencer_1st, class'Class'));
        }
        // End:0x1ea
        if(SilencerSmokeEmitterClass != none && SilencerSmokeEmitter == none || SmokeEmitter.bDeleteMe)
        {
            SilencerSmokeEmitter = Spawn(SilencerSmokeEmitterClass);
        }
    }
    // End:0x28f
    else
    {
        // End:0x255
        if(ResParams.default.szClass_Smoke_1st != "")
        {
            SmokeEmitterClass = class<wEmitter>(DynamicLoadObject(ResParams.default.szClass_Smoke_1st, class'Class'));
            // End:0x255
            if(SmokeEmitterClass == none)
            {
                SmokeFirstPersonEmitterClass = class<EmitterFirstPerson>(DynamicLoadObject(ResParams.default.szClass_Smoke_1st, class'Class'));
            }
        }
        // End:0x28f
        if(SmokeEmitterClass != none && SmokeEmitter == none || SmokeEmitter.bDeleteMe)
        {
            SmokeEmitter = Spawn(SmokeEmitterClass);
        }
    }
    // End:0x2bf
    if(ResParams.default.UseWarhead == true)
    {
        LoadWarhead(wRes.default.stProj);
        AttWarhead(true);
    }
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
    wWarhead = Spawn(class'wSkinShell', self,,);
    wWarhead.SetDrawType(8);
    wWarhead.SetStaticMesh(stProj);
    wWarhead.SetBase(self);
    wWarhead.SetOwner(self);
    wWarhead.bHidden = true;
    bUseWarhead = true;
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
}

simulated function DrawMuzzleFlash(Canvas Canvas)
{
    // End:0x40
    if(SmokeEmitter != none)
    {
        SmokeEmitter.SetLocation(FlashEmitter.Location);
        Canvas.DrawActor(SmokeEmitter, false, false, 60.0);
    }
    // End:0x7d
    else
    {
        // End:0x7d
        if(SilencerSmokeEmitter != none)
        {
            SilencerSmokeEmitter.SetLocation(FlashEmitter.Location);
            Canvas.DrawActor(SilencerSmokeEmitter, false, false, 60.0);
        }
    }
    // End:0xa0
    if(FlashEmitter != none)
    {
        Canvas.DrawActor(FlashEmitter, false, false, 60.0);
    }
}

simulated function FlashMuzzleFlash()
{
    // End:0x0b
    if(bSilencer)
    {
        return;
    }
    // End:0x2b
    if(FlashEmitter != none)
    {
        FlashEmitter.Trigger(self, OwnerPawn);
    }
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
        // End:0x57
        else
        {
            // End:0x57
            if(SilencerSmokeEmitter != none)
            {
                SilencerSmokeEmitter.Trigger(self, OwnerPawn);
            }
        }
    }
}

simulated function Change3DScopeMesh(bool bAiming)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x7d [While If]
    if(i < Parts.Length)
    {
        // End:0x73
        if(Parts[i].AcceType == 3)
        {
            // End:0x71
            if(Parts[i].IsAiming() != bAiming)
            {
                Parts[i].Switch3DScope(bAiming);
            }
            return;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

simulated function SetFOV(bool bFOV, optional bool bQuick)
{
    // End:0x4e
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
    // End:0x96
    else
    {
        OwnerPlayer.ZoomFOV(0.0, bInstantFOV);
        FPAimState = 0;
    }
}

simulated function SetQuickFOV(bool bFOV)
{
    // End:0x21
    if(bFOV)
    {
        OwnerPlayer.ZoomFOV(fZoomFOV, true);
    }
    // End:0x3e
    else
    {
        OwnerPlayer.ZoomFOV(0.0, true);
        FPAimState = 0;
    }
}

simulated function AnimEnd(int Channel)
{
    local name Anim;
    local float frame, Rate;
    local string strAction;

    // End:0x1a
    if(!IsActive() && Channel > 0)
    {
        return;
    }
    GetAnimParams(0, Anim, frame, Rate);
    strAction = string(Anim);
    // End:0x66
    if(InStr(strAction, "MeleeAttack") != -1)
    {
        Rate = 1.0;
    }
    // End:0xa8
    if(InStr(strAction, "_Select") != -1 && iSavedWID == 9000)
    {
        PlayAnim(Melee_FireAnim, 1.0, 0.0);
        return;
    }
    // End:0x19d
    else
    {
        // End:0xc8
        if(InStr(strAction, "_Putdown") != -1)
        {
            return;
        }
        // End:0x19d
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
                    // End:0x110
                    else
                    {
                        Change3DScopeMesh(false);
                    }
                }
            }
            // End:0x19d
            else
            {
                // End:0x125
                if(Anim == Melee_FireAnim)
                {
                }
                // End:0x19d
                else
                {
                    // End:0x167
                    if(Anim == Aim_UpAnim)
                    {
                        // End:0x164
                        if(FPAimState != 0)
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
                    // End:0x19d
                    else
                    {
                        // End:0x19d
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
}

simulated function PlayIdle()
{
    // End:0x0d
    if(!IsActive())
    {
        return;
    }
    // End:0x67
    if(OwnerPawn.bIsSprinting && VSize(OwnerPawn.Velocity) > 50.0)
    {
        LoopAnim(SprintAnim, SprintAnimRate, 0.30);
        // End:0x5d
        if(bInstantFOV)
        {
            Change3DScopeMesh(false);
        }
        SetFOV(false);
    }
    // End:0xf8
    else
    {
        // End:0xa5
        if(OwnerPawn.bIsAiming)
        {
            LoopAnim(Aim_IdleAnim, Aim_IdleAnimRate, 0.20);
            FPAimState = 2;
            bOldAiming = true;
            SetFOV(true);
        }
        // End:0xf8
        else
        {
            LoopAnim(IdleAnim, IdleAnimRate, 0.20);
            // End:0xf8
            if(FPAimState == 0)
            {
                bOldAiming = false;
                // End:0xf1
                if(bInstantFOV && FPAimState == 0)
                {
                    Change3DScopeMesh(false);
                }
                SetFOV(false);
            }
        }
    }
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
                fTemp = 1.50;
            }
            // End:0x2e
            else
            {
                fTemp = 1.0;
            }
            PlayAnim(ReloadAnim, ReloadAnimRate * fTemp, 0.0);
            // End:0x57
            if(bInstantFOV)
            {
                Change3DScopeMesh(false);
            }
            SetFOV(false);
            // End:0x6e
            if(bUseWarhead)
            {
                AttWarhead(true);
            }
            // End:0x1a2
            break;
        // End:0xc0
        case 1:
            // End:0x94
            if(Opt1)
            {
                PlayAnim(PutdownQuickAnim, PutDownQuickAnimRate, 0.0);
            }
            // End:0xa6
            else
            {
                PlayAnim(PutDownAnim, PutDownAnimRate, 0.0);
            }
            // End:0xb6
            if(bInstantFOV)
            {
                Change3DScopeMesh(false);
            }
            SetFOV(false);
            // End:0x1a2
            break;
        // End:0x150
        case 2:
            fTemp = 1.0;
            // End:0x114
            if(FPAimState == 0)
            {
                PlayAnim(RechamberAnim, RechamberAnimRate * fTemp, 0.0);
                // End:0x109
                if(bInstantFOV)
                {
                    Change3DScopeMesh(false);
                }
                bOldAiming = false;
            }
            // End:0x14d
            else
            {
                PlayAnim(Aim_RechamberAnim, Aim_RechamberAnimRate * fTemp, 0.0);
                // End:0x13d
                if(bInstantFOV)
                {
                    Change3DScopeMesh(true);
                }
                bOldAiming = true;
                FPAimState = 2;
            }
            // End:0x1a2
            break;
        // End:0x19f
        case 3:
            // End:0x173
            if(Opt1)
            {
                PlayAnim(Anim_Plant_PutDown, 1.0, 0.0);
            }
            // End:0x185
            else
            {
                PlayAnim(Anim_Defuse_PutDown, 1.0, 0.0);
            }
            // End:0x195
            if(bInstantFOV)
            {
                Change3DScopeMesh(false);
            }
            SetFOV(false);
            // End:0x1a2
            break;
        // End:0xffff
        default:
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
    // End:0x9e [While If]
    if(i < Parts.Length)
    {
        vCurrAimDiff += Parts[i].vAimDiff;
        // End:0x7d
        if(Parts[i].AcceType == 2 && FPAimState != 2)
        {
            Parts[i].bHidden = true;
        }
        // End:0x94
        else
        {
            Parts[i].bHidden = false;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    GetAnimParams(0, szAnim, fFrame, fRate);
    // End:0xf0
    if(szAnim == 'Ads_Up')
    {
        fLerp = FMin(1.0, fFrame * float(2));
        vDiff = fLerp * vCurrAimDiff;
    }
    // End:0x185
    else
    {
        // End:0x133
        if(szAnim == 'Ads_Down')
        {
            fLerp = 1.0 - FMin(1.0, fFrame * float(2));
            vDiff = fLerp * vCurrAimDiff;
        }
        // End:0x185
        else
        {
            // End:0x172
            if(szAnim == 'Ads_Idle' || szAnim == 'Ads_Fire' || szAnim == 'Ads_Rechamber')
            {
                vDiff = vCurrAimDiff;
            }
            // End:0x185
            else
            {
                vDiff = vect(0.0, 0.0, 0.0);
            }
        }
    }
    vPartsOffset = vDiff;
}

simulated function float CalcDestPivot()
{
    local float fDestPivot;

    // End:0x20
    if(OwnerPawn.bIsAiming)
    {
        fDestPivot = 0.0;
    }
    // End:0x6b
    else
    {
        // End:0x40
        if(OwnerPawn.bIsProned)
        {
            fDestPivot = -1.60;
        }
        // End:0x6b
        else
        {
            // End:0x60
            if(OwnerPawn.bIsCrouched)
            {
                fDestPivot = -1.0;
            }
            // End:0x6b
            else
            {
                fDestPivot = 0.0;
            }
        }
    }
    return fDestPivot;
}

simulated function CalcStanceOffset(float fDelta)
{
    local float fDestPivot, fDeltaPivot, fDMax, fDMin;

    fDMin = 2.0 * fDelta;
    fDMax = 6.0 * fDelta;
    fDestPivot = CalcDestPivot();
    // End:0xe9
    if(fDestPivot != fStancePivot)
    {
        fDeltaPivot = fDestPivot - fStancePivot * float(6) * fDelta;
        // End:0x96
        if(fDeltaPivot < float(0))
        {
            fDeltaPivot = FMax(fDeltaPivot, -fDMax);
            fDeltaPivot = FMin(fDeltaPivot, -fDMin);
        }
        // End:0xba
        else
        {
            fDeltaPivot = FMin(fDeltaPivot, fDMax);
            fDeltaPivot = FMax(fDeltaPivot, fDMin);
        }
        fStancePivot += fDeltaPivot;
        // End:0xe9
        if(Abs(fDestPivot - fStancePivot) < fDMin)
        {
            fStancePivot = fDestPivot;
        }
    }
    vStanceOffset.Z = fStancePivot;
}

simulated function Vector WeaponBob(float BobDamping)
{
    local Vector WBob;

    WBob = BobDamping * WalkBob;
    WBob.Z = 0.450 + 0.550 * BobDamping * WalkBob.Z;
    WBob.Z += LandBob;
    return WBob;
}

simulated function CheckBob(float DeltaTime)
{
    local float Speed2D, BobCamera, MaxSpeed, fStaminaRatio;
    local Vector X, Y, Z;
    local float OldBobTime;
    local int M, N;

    OldBobTime = bobtime;
    GetAxes(OwnerPlayer.CalcViewRotation, X, Y, Z);
    // End:0x4d
    if(float(0) < VSize(OwnerPawn.Velocity))
    {
        bWeaponBob = true;
    }
    // End:0x55
    else
    {
        bWeaponBob = false;
    }
    // End:0x93
    if(!bWeaponBob)
    {
        bobtime = 0.0;
        WalkBob = vect(0.0, 0.0, 0.0);
        WalkBobCamera = vect(0.0, 0.0, 0.0);
        return;
    }
    // End:0x193
    if(!OwnerPawn.bIsSprinting)
    {
        // End:0xe4
        if(OwnerPawn.bIsCrouched)
        {
            Bob = BaseParams.fBobWeapon_Ducked_Move;
            BobCamera = BaseParams.fBobScreen_Ducked_Move;
        }
        // End:0x140
        else
        {
            // End:0x118
            if(OwnerPawn.bIsProned)
            {
                Bob = 0.0;
                BobCamera = BaseParams.fBobScreen_Prone_Move;
            }
            // End:0x140
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
    // End:0x1bb
    else
    {
        Bob = BaseParams.fBobWeapon_Sprint_Move;
        BobCamera = BaseParams.fBobScreen_Sprint_Move;
    }
    // End:0x21e
    if(!OwnerPawn.bIsProned && !OwnerPawn.bIsAiming && Bob == float(0))
    {
        Bob = default.Bob;
        // End:0x21e
        if(!OwnerPawn.bIsSprinting)
        {
            Bob = 0.00050;
        }
    }
    Bob = FClamp(Bob, -0.010, 0.010);
    BobCamera = FClamp(BobCamera, -0.040, 0.040);
    // End:0x4a7
    if(OwnerPawn.Physics == 1)
    {
        Speed2D = VSize(OwnerPawn.Velocity);
        // End:0x29f
        if(Speed2D < float(10))
        {
            bobtime += 0.20 * DeltaTime;
        }
        // End:0x38b
        else
        {
            // End:0x2f7
            if(OwnerPawn.bIsCrouched == true)
            {
                // End:0x2e0
                if(OwnerPawn.bIsAiming == true)
                {
                    MaxSpeed = BaseParams.fAimCrouchSpeed;
                }
                // End:0x2f4
                else
                {
                    MaxSpeed = BaseParams.fCrouchSpeed;
                }
            }
            // End:0x363
            else
            {
                // End:0x323
                if(OwnerPawn.bIsProned == true)
                {
                    MaxSpeed = BaseParams.fPronedSpeed;
                }
                // End:0x363
                else
                {
                    // End:0x34f
                    if(OwnerPawn.bIsAiming == true)
                    {
                        MaxSpeed = BaseParams.fAimRunSpeed;
                    }
                    // End:0x363
                    else
                    {
                        MaxSpeed = BaseParams.fRunSpeed;
                    }
                }
            }
            bobtime += DeltaTime * 0.30 + 0.70 * Speed2D / MaxSpeed;
        }
        WalkBob = Y * Bob * Speed2D * Sin(8.0 * bobtime);
        WalkBobCamera = Y * BobCamera * Speed2D * Sin(8.0 * bobtime);
        AppliedBob = AppliedBob * float(1) - FMin(1.0, 16.0 * DeltaTime);
        WalkBob.Z = AppliedBob;
        WalkBobCamera.Z = AppliedBob;
        // End:0x4a4
        if(Speed2D > float(10))
        {
            WalkBob.Z = WalkBob.Z + WalkZDamp * Bob * Speed2D * Sin(16.0 * bobtime);
            WalkBobCamera.Z = WalkBobCamera.Z + WalkZDamp * BobCamera * Speed2D * Sin(16.0 * bobtime);
        }
    }
    // End:0x5d3
    else
    {
        // End:0x57e
        if(Physics == 3)
        {
            bobtime += DeltaTime;
            Speed2D = Sqrt(OwnerPawn.Velocity.X * OwnerPawn.Velocity.X + OwnerPawn.Velocity.Y * OwnerPawn.Velocity.Y);
            WalkBob = Y * Bob * 0.50 * Speed2D * Sin(4.0 * bobtime);
            WalkBob.Z = Bob * 1.50 * Speed2D * Sin(8.0 * bobtime);
        }
        // End:0x5d3
        else
        {
            bobtime = 0.0;
            WalkBob = WalkBob * float(1) - FMin(1.0, 8.0 * DeltaTime);
            WalkBobCamera = WalkBobCamera * float(1) - FMin(1.0, 8.0 * DeltaTime);
        }
    }
    // End:0x609
    if(OwnerPawn.Physics != 1 || VSize(OwnerPawn.Velocity) < float(10))
    {
        return;
    }
    M = int(0.50 * 3.1415930 + 8.0 * OldBobTime / 3.1415930);
    N = int(0.50 * 3.1415930 + 8.0 * bobtime / 3.1415930);
    fStaminaRatio = OwnerPlayer.fSprintTime / OwnerPawn.wMyParam.Stm_MaxTime;
    // End:0x70a
    if(M != N && !OwnerPawn.bIsCrouched && !OwnerPawn.bIsProned && !OwnerPawn.bIsAiming)
    {
        OwnerPawn.FootStepping(0);
        // End:0x707
        if(fStaminaRatio < 0.250)
        {
            OwnerPawn.PlayBreathSounds();
        }
    }
    // End:0x7ba
    else
    {
        // End:0x7ba
        if(!bWeaponBob && !OwnerPawn.bIsCrouched && !OwnerPawn.bIsProned && !OwnerPawn.bIsAiming && Level.TimeSeconds - LastFootStepTime > 0.350)
        {
            LastFootStepTime = Level.TimeSeconds;
            OwnerPawn.FootStepping(0);
            // End:0x7ba
            if(fStaminaRatio < 0.250)
            {
                OwnerPawn.PlayBreathSounds();
            }
        }
    }
}

simulated function ShakeView()
{
    local PlayerController P;
    local Rotator rMin, rMax;
    local int iPitch, iYaw;
    local float fDecayFastBeginTime;

    P = OwnerPlayer;
    // End:0x27d
    if(P != none)
    {
        // End:0x153
        if(FPAimState == 2)
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
        // End:0x27d
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
}

simulated function bool IsActive()
{
    // End:0x1d
    if(OwnerPlayer.ViewTarget == OwnerPawn)
    {
        return true;
    }
    // End:0x1f
    else
    {
        return false;
    }
}

simulated function RefreshState()
{
    // End:0x22
    if(OwnerPawn.bIsAiming)
    {
        FPAimState = 2;
        bOldAiming = true;
    }
    // End:0x4c
    if(FPAimState == 0)
    {
        // End:0x42
        if(bInstantFOV)
        {
            Change3DScopeMesh(false);
        }
        SetQuickFOV(false);
    }
    // End:0x73
    else
    {
        // End:0x73
        if(FPAimState == 2)
        {
            // End:0x6c
            if(bInstantFOV)
            {
                Change3DScopeMesh(true);
            }
            SetQuickFOV(true);
        }
    }
    PlayIdle();
}

simulated function TickFPWeapon(float DeltaTime)
{
    local float fAimAniRate;
    local byte FlashCount, FiringMode;

    // End:0x1e
    if(OwnerPawn == none || iSavedWID == -1)
    {
        return;
    }
    // End:0x54
    if(OwnerPawn.PlayerReplicationInfo == none || OwnerPawn.PlayerReplicationInfo.IsDead == true)
    {
        return;
    }
    CalcStanceOffset(DeltaTime);
    CalcPartsOffset();
    CheckBob(DeltaTime);
    OwnerPlayer.AdjustView(DeltaTime);
    OwnerPawn.GetWeaponAttachmentInfo(FlashCount, FiringMode);
    // End:0x111
    if(FlashCount != byOldFlashCount)
    {
        // End:0x111
        if(FiringMode == 2)
        {
            byOldFlashCount = FlashCount;
            // End:0x111
            if(byOldFlashCount != 0)
            {
                PlayAnim(Melee_FireAnim, 1.0, 0.0);
                // End:0xf8
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
    // End:0x1d1
    if(bOldAiming != OwnerPawn.bIsAiming && !bNoAiming)
    {
        // End:0x183
        if(bOldAiming == false)
        {
            // End:0x180
            if(FPAimState == 0)
            {
                FPAimState = 1;
                fAimAniRate = Aim_UpAnimRate;
                PlayAnim(Aim_UpAnim, fAimAniRate, 0.0);
                SetFOV(true);
            }
        }
        // End:0x1cf
        else
        {
            // End:0x1cf
            if(FPAimState == 2)
            {
                FPAimState = 3;
                fAimAniRate = Aim_DownAnimRate;
                PlayAnim(Aim_DownAnim, fAimAniRate, 0.0);
                // End:0x1c8
                if(bInstantFOV)
                {
                    Change3DScopeMesh(false);
                }
                SetFOV(false);
            }
        }
        return;
    }
    // End:0x2a3
    if(FlashCount != byOldFlashCount)
    {
        byOldFlashCount = FlashCount;
        // End:0x2a3
        if(byOldFlashCount != 0)
        {
            // End:0x208
            if(bDemopack)
            {
            }
            // End:0x272
            else
            {
                // End:0x249
                if(OwnerPawn.bIsAiming == false)
                {
                    PlayAnim(FireAnim, FireAnimRate, 0.0);
                    // End:0x23f
                    if(bInstantFOV)
                    {
                        Change3DScopeMesh(false);
                    }
                    SetFOV(false);
                }
                // End:0x272
                else
                {
                    PlayAnim(Aim_FireAnim, Aim_FireAnimRate, 0.0);
                    // End:0x26b
                    if(bInstantFOV)
                    {
                        Change3DScopeMesh(true);
                    }
                    SetFOV(true);
                }
            }
            // End:0x29d
            if(bUseFlashEffect)
            {
                ShakeView();
                FlashMuzzleFlash();
                StartMuzzleSmoke();
                // End:0x29d
                if(bUseWarhead)
                {
                    AttWarhead(false);
                }
            }
            FPModeDoFire();
        }
    }
    Spread = Spread - fSpreadReduce * Level.TimeSeconds - fLastRecoilReduceTime;
    FPCalcSpread();
    fLastRecoilReduceTime = Level.TimeSeconds;
}

simulated function FPModeDoFire()
{
    local int iCurrentWeaponID;
    local wWeaponBaseParams WBP;

    iCurrentWeaponID = OwnerPawn.PlayerReplicationInfo.iCurrentWeaponID;
    WBP = Level.WeaponMgr.GetBaseParam(iCurrentWeaponID);
    Spread = Spread + WBP.fSpread_Fire_Add;
    FPCalcSpread();
}

simulated function FPCalcSpread()
{
    local float fSpreadMin, fSpreadMax;
    local int iCurrentWeaponID;

    mViewTarget = Pawn(OwnerPlayer.ViewTarget);
    // End:0x3c
    if(mViewTarget == none || mViewTarget.PlayerReplicationInfo == none)
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
    // End:0xa3
    if(mWBP == none)
    {
        return;
    }
    // End:0xf4
    if(mViewTarget.bIsCrouched)
    {
        fSpread_Min = mWBP.fSpread_Ducked_Min;
        fSpread_Max = mWBP.fSpread_Ducked_Max;
        fSpreadReduce_Normal = mWBP.fSpread_Ducked_Reduce;
    }
    // End:0x196
    else
    {
        // End:0x145
        if(mViewTarget.bIsProned)
        {
            fSpread_Min = mWBP.fSpread_Prone_Min;
            fSpread_Max = mWBP.fSpread_Prone_Max;
            fSpreadReduce_Normal = mWBP.fSpread_Prone_Reduce;
        }
        // End:0x196
        else
        {
            // End:0x15a
            if(mViewTarget.bIsSprinting)
            {
            }
            // End:0x196
            else
            {
                fSpread_Min = mWBP.fSpread_Stand_Min;
                fSpread_Max = mWBP.fSpread_Stand_Max;
                fSpreadReduce_Normal = mWBP.fSpread_Stand_Reduce;
            }
        }
    }
    // End:0x209
    if(mViewTarget.Physics == 2 || mViewTarget.Physics == 11)
    {
        fSpreadMin = mWBP.fSpread_Jump;
        fSpreadMax = mWBP.fSpread_Jump;
        fSpreadReduce = mWBP.fSpread_Stand_Reduce;
    }
    // End:0x22a
    else
    {
        fSpreadMin = fSpread_Min;
        fSpreadMax = fSpread_Max;
        fSpreadReduce = fSpreadReduce_Normal;
    }
    // End:0x29c
    if(mViewTarget.Acceleration.X != float(0) && mViewTarget.Acceleration.Y != float(0))
    {
        // End:0x29c
        if(Spread < fSpreadMin + mWBP.fSpread_Move_Add)
        {
            Spread = fSpreadMin + mWBP.fSpread_Move_Add;
        }
    }
    Spread = FClamp(Spread, fSpreadMin, fSpreadMax);
    mViewTarget.fWeaponSpread = Spread;
}

simulated event RenderOverlays(Canvas Canvas)
{
    local Pawn P;
    local Vector TmOffSet;
    local PlayerController PC;
    local Rotator rRotation;

    P = OwnerPawn;
    // End:0x2b
    if(P.PlayerReplicationInfo.IsDead == true)
    {
        return;
    }
    PC = OwnerPlayer;
    DrawMuzzleFlash(Canvas);
    rRotation = PC.CalcViewRotation;
    SetRotation(rRotation);
    TmOffSet = vPartsOffset + vStanceOffset + vFPOffset;
    // End:0x93
    if(bWeaponBob)
    {
        dbgWalkBob = WeaponBob(0.960);
    }
    // End:0xa6
    else
    {
        dbgWalkBob = vect(0.0, 0.0, 0.0);
    }
    SetLocation(P.Location + P.CalcFPSpectatorDrawOffset(TmOffSet, rRotation, dbgWalkBob));
    Canvas.DrawActor(self, false, false, 68.0);
}

simulated function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
    Canvas.SetDrawColor(0, byte(255), 120);
    Canvas.SetPos(4.0, YPos);
    Canvas.DrawText("@@@@ FPWeaponAttachment @@@@@ / " $ string(FPAimState), false);
    YPos += YL;
    Canvas.SetPos(4.0, YPos);
    Canvas.DrawText("Location: " $ string(Location) $ " Rotation " $ string(Rotation) $ " / vFPOffset : " $ string(vFPOffset), false);
    YPos += YL;
    Canvas.SetPos(4.0, YPos);
    Canvas.DrawText("### WalkBob : " $ string(WalkBob) $ " - WalkBobCamera : " $ string(WalkBobCamera) $ " / dbgWalkBob : " $ string(dbgWalkBob));
    YPos += YL;
    Canvas.SetPos(4.0, YPos);
}

defaultproperties
{
    iSavedWID=-1
    iSavedPartsID=-1
    Bob=0.00070
    WalkZDamp=0.250
    mCurrentWeaponID=-1
    IdleAnim=Idle
    RestAnim=rest
    RunAnim=Run
    SprintAnim=Sprint
    SelectAnim=Select
    SelectNewAnim=Select_New
    PutDownAnim=PutDown
    PutdownQuickAnim=PutDown_Quick
    ProneMoveAnim=ProneMove
    SprintUpAnim=Sprint_Up
    ReloadBeginAnim=ReloadBegin
    ReloadEndAnim=ReloadEnd
    ReloadAnim=Reload
    ReloadEmptyAnim=ReloadEmpty
    RechamberAnim=Rechamber
    Aim_RechamberAnim=Ads_Rechamber
    Aim_UpAnim=Ads_Up
    Aim_DownAnim=Ads_Down
    Aim_IdleAnim=Ads_Idle
    Aim_FireAnim=Ads_Fire
    Aim_FireLoopAnim=Ads_Fire
    FireAnim=Fire
    FireLoopAnim=FireLoop
    FireEndAnim=FireEnd
    Melee_FireAnim=MeleeAttack
    PlantAni=plant
    DefuseAni=Defuse
    BombThrow=Throw
    Anim_Plant_PutDown=Plant_Down
    Anim_Defuse_PutDown=Defuse_Down
    Anim_Throw=Throw
    IdleAnimRate=1.0
    RestAnimRate=1.0
    RunAnimRate=1.0
    SprintAnimRate=1.0
    SelectAnimRate=1.36360
    PutDownAnimRate=1.36360
    PutDownQuickAnimRate=1.0
    ReloadBeginAnimRate=1.0
    ReloadEndAnimRate=1.0
    ReloadAnimRate=1.0
    ReloadEmptyAnimRate=1.0
    RechamberAnimRate=1.0
    Aim_RechamberAnimRate=1.0
    Aim_UpAnimRate=1.0
    Aim_DownAnimRate=1.0
    Aim_IdleAnimRate=1.0
    Aim_FireAnimRate=1.0
    Aim_FireLoopAnimRate=1.0
    FireAnimRate=1.0
    FireLoopAnimRate=1.0
    FireEndAnimRate=1.0
    DrawType=2
    bHidden=true
    bOnlyOwnerSee=true
    bReplicateMovement=true
}