/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTROModelWeapon.uc
 * Package Imports:
 *	GUIWarfareControls
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:65
 *	Functions:20
 *
 *******************************************************************************/
class BTROModelWeapon extends Inventory;

var float FOV;
var bool b1st;
var int CurrentAni;
var array<name> AnimNames;
var int weaponID;
var int WeaponPartsID;
var int PaintingID;
var int WeaponType;
var wSkinShell wWeaponParts[3];
var wSkinShell wHands;
var FloatBox AWinPos;
var float PosX;
var float PosY;
var float posZ;
var float RotY;
var float LightDistance0;
var float LightDistance1;
var float LightDistance2;
var float LightAngle0;
var float LightAngle1;
var float LightAngle2;
var float LightHeight0;
var float LightHeight1;
var float LightHeight2;
var int LightColor0_R;
var int LightColor0_G;
var int LightColor0_B;
var int LightColor1_R;
var int LightColor1_G;
var int LightColor1_B;
var int LightColor2_R;
var int LightColor2_G;
var int LightColor2_B;
var float AspectRatio;
var Vector cameraPosAdd;
var Rotator pawnRotAdd;
var Rotator PawnRot;
var Vector pawnPos;
var Rotator cameraRot;
var Vector cameraPos;
var Vector lightDist;
var Vector lightHeight;
var Vector lightAngle;
var Color LightColor[3];
var Color LightColor_AF[2];
var Color LightColor_RSA[2];
var wWeaponBaseParams BaseParams;
var float fStancePivot;
var bool bLanding;
var transient Vector vStanceOffset;
var transient Vector vPartsOffset;
var transient Vector vBreathOffset;
var transient bool bBreathOffsetXLeft;
var transient bool bBreathOffsetYUp;
var transient float fBreathOffsetReflecTime_X;
var transient float fBreathOffsetReflecTime_Y;
var transient float fBreathSeconds;
var float fBreathRatio;
var transient Vector vAttackedOffset;
var transient Rotator rAttackedRot;
var transient Rotator rSwayDestRot;
var transient Rotator rSwayRot;
var transient Rotator rSway_LastCameraRot;
var transient float fSwayAccumTime_Pitch;
var transient float fSwayAccumTime_Yaw;

function Init()
{
    LoadSetModelData();
    BeginModel();
    ForceChangeWeapon();
    SetRotation(rot(0, 39784, 0));
    ChangeWeapon(2000, 0);
}

simulated function Destroyed()
{
    EndModel();
}

function Set1st(bool b1st)
{
    self.b1st = b1st;
}

function LoadSetModelData()
{
    cameraPos = MakeVector(PosX, PosY, posZ);
    PawnRot.Yaw = int(RotY);
    lightDist = MakeVector(LightDistance0, LightDistance1, LightDistance2);
    lightAngle = MakeVector(LightAngle0, LightAngle1, LightAngle2);
    lightHeight = MakeVector(LightHeight0, LightHeight1, LightHeight2);
    LightColor[0] = class'Canvas'.static.MakeColor(byte(LightColor0_R), byte(LightColor0_G), byte(LightColor0_B), byte(255));
    LightColor[1] = class'Canvas'.static.MakeColor(byte(LightColor1_R), byte(LightColor1_G), byte(LightColor1_B), byte(255));
    LightColor[2] = class'Canvas'.static.MakeColor(byte(LightColor2_R), byte(LightColor2_G), byte(LightColor2_B), byte(255));
}

function SaveModelData();
function BeginModel();
function ForceChangeWeapon()
{
    local int W[2];

    W[0] = weaponID;
    W[1] = WeaponPartsID;
    weaponID = -1;
    WeaponPartsID = -1;
    ChangeWeapon(W[0], W[1]);
}

function ChangeWeapon(int iWeaponID, optional int iPartsID, optional int iPaintingID)
{
    local wWeaponBaseParams tmParam;

    // End:0x83
    if(iWeaponID > 0 && weaponID != iWeaponID)
    {
        weaponID = iWeaponID;
        SetWeapon(weaponID, iPartsID);
        WeaponPartsID = iPartsID;
        SetWeaponParts(WeaponPartsID, iPaintingID);
        tmParam = Level.WeaponMgr.GetBaseParam(weaponID);
        BaseParams = tmParam;
    }
    // End:0xad
    else
    {
        // End:0x9d
        if(WeaponPartsID != iPartsID)
        {
            WeaponPartsID = iPartsID;
        }
        SetWeaponParts(WeaponPartsID, iPaintingID);
    }
    StopAnimating(true);
    // End:0xd1
    if(b1st)
    {
        PlayAnim(AnimNames[0], 1.0, 0.20);
    }
}

function ChangeWeaponsParts(int iPartsID)
{
    // End:0x25
    if(WeaponPartsID != iPartsID)
    {
        WeaponPartsID = iPartsID;
        SetWeaponParts(WeaponPartsID);
    }
}

function SetWeapon(int iWeaponID, int iPartsID)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x65 [While If]
    if(i < 2)
    {
        WeaponPartsID = 0;
        // End:0x5b
        if(wWeaponParts[i] != none)
        {
            DetachFromBone(wWeaponParts[i]);
            wWeaponParts[i].Destroy();
            wWeaponParts[i] = none;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    // End:0x8e
    if(wHands != none)
    {
        DetachFromBone(wHands);
        wHands.Destroy();
        wHands = none;
    }
    LinkMesh(Level.GameMgr.GetItemResourceMesh(weaponID, false));
    SetDrawType(2);
    // End:0x13e
    if(b1st)
    {
        wHands = Spawn(class'wSkinShell', self,,);
        wHands.SetDrawType(2);
        wHands.LinkMesh(Level.GameMgr.GetItemResourceMesh(15000, false, 0));
        wHands.SetBase(self);
        wHands.SetOwner(self);
        AttachToBone(wHands, 'XXXX_Dummy');
    }
    WeaponPartsID = iPartsID;
    SetWeaponParts(WeaponPartsID);
}

function SetWeaponParts(int iPartsID, optional int iPaintingID)
{
    local wItemResourceParam ItemResParam;
    local int i;
    local wWeaponCustomInfoParam wcip;
    local wWeaponCustomPartsParam wcpp;
    local int iSightPartID, iSilencerPartID, iBarrelPartID, iGunstockPartID, iSubSightPartItemID;

    i = 0;
    J0x07:
    // End:0x5e [While If]
    if(i < 3)
    {
        // End:0x54
        if(wWeaponParts[i] != none)
        {
            DetachFromBone(wWeaponParts[i]);
            wWeaponParts[i].Destroy();
            wWeaponParts[i] = none;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    iSightPartID = iPartsID & 1023;
    iBarrelPartID = iPartsID & 130048;
    iSilencerPartID = iPartsID & 16646144;
    iGunstockPartID = iPartsID & 2130706432;
    wcip = Level.GameMgr.GetWeaponCustomInfoParam(weaponID);
    // End:0xf9
    if(wcip.iItemID <= 0 || wcip.iItemID != weaponID)
    {
        return;
    }
    // End:0x295
    if(iSightPartID > 1)
    {
        wcpp = Level.GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iSightPartID);
        // End:0x292
        if(wcpp.iItemID > 0 && wcpp.iPartID == iSightPartID)
        {
            iSubSightPartItemID = wcip.iSightOnAddItemID;
            ItemResParam = Level.GameMgr.GetItemResourceParam(wcpp.iItemID);
            // End:0x292
            if(ItemResParam.iItemResourceID != -1)
            {
                wWeaponParts[0] = Spawn(class'wSkinShell');
                wWeaponParts[0].SetDrawType(8);
                wWeaponParts[0].SetStaticMesh(Level.GameMgr.GetItemResourceStaticMesh(wcpp.iItemID, false));
                wWeaponParts[0].SetBase(self);
                wWeaponParts[0].SetOwner(self);
                wWeaponParts[0].bAnimByOwner = false;
                // End:0x280
                if(Len(ItemResParam.strRes_3rd_AF_Backpack) > 1)
                {
                    wWeaponParts[0].Skins[0] = Material(DynamicLoadObject(ItemResParam.strRes_3rd_AF_Backpack, class'Material'));
                }
                AttachToBone(wWeaponParts[0], 'Sight');
            }
        }
    }
    // End:0x2a9
    else
    {
        iSubSightPartItemID = wcip.iSightOffAddItemID;
    }
    // End:0x3d3
    if(iSubSightPartItemID > 0)
    {
        ItemResParam = Level.GameMgr.GetItemResourceParam(iSubSightPartItemID);
        // End:0x3d3
        if(ItemResParam.iItemResourceID != -1)
        {
            wWeaponParts[2] = Spawn(class'wSkinShell');
            wWeaponParts[2].SetDrawType(8);
            wWeaponParts[2].SetStaticMesh(Level.GameMgr.GetItemResourceStaticMesh(iSubSightPartItemID, false));
            wWeaponParts[2].SetBase(self);
            wWeaponParts[2].SetOwner(self);
            wWeaponParts[2].bAnimByOwner = false;
            // End:0x3c0
            if(Len(ItemResParam.strRes_3rd_AF_Backpack) > 1)
            {
                wWeaponParts[2].Skins[0] = Material(DynamicLoadObject(ItemResParam.strRes_3rd_AF_Backpack, class'Material'));
            }
            AttachToBone(wWeaponParts[2], 'Sight');
        }
    }
    // End:0x5a3
    if(iSilencerPartID > 1 << 17)
    {
        wcpp = Level.GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iSilencerPartID);
        // End:0x5a3
        if(wcpp.iItemID > 0 && wcpp.iPartID == iSilencerPartID)
        {
            ItemResParam = Level.GameMgr.GetItemResourceParam(wcpp.iItemID);
            // End:0x5a3
            if(ItemResParam.iItemResourceID != -1)
            {
                wWeaponParts[1] = Spawn(class'wSkinShell');
                wWeaponParts[1].SetDrawType(8);
                wWeaponParts[1].SetStaticMesh(Level.GameMgr.GetItemResourceStaticMesh(wcpp.iItemID, false));
                wWeaponParts[1].SetBase(self);
                wWeaponParts[1].SetOwner(self);
                wWeaponParts[1].bAnimByOwner = false;
                // End:0x54a
                if(Len(ItemResParam.strRes_3rd_AF_Backpack) > 1)
                {
                    wWeaponParts[1].Skins[0] = Material(DynamicLoadObject(ItemResParam.strRes_3rd_AF_Backpack, class'Material'));
                }
                // End:0x591
                if(Len(ItemResParam.strRes_3rd_AF_Backpack) > 1)
                {
                    wWeaponParts[1].Skins[0] = Material(DynamicLoadObject(ItemResParam.strRes_3rd_AF_Backpack, class'Material'));
                }
                AttachToBone(wWeaponParts[1], 'Silencer');
            }
        }
    }
    // End:0x5ec
    if(iPaintingID > 0)
    {
        PaintingID = iPaintingID;
        Skins[0] = Level.GameMgr.GetPartsGroupPainting(weaponID, iPartsID, false, iPaintingID);
    }
    // End:0x5f4
    else
    {
        Skins.Length = 0;
    }
}

function SetWeaponPainting(int iPaintingID)
{
    // End:0x60
    if(PaintingID != iPaintingID)
    {
        PaintingID = iPaintingID;
        // End:0x30
        if(PaintingID == 0)
        {
            Skins.Length = 0;
        }
        // End:0x60
        else
        {
            Skins[0] = Level.GameMgr.GetPartsGroupPainting(weaponID, WeaponPartsID, false, PaintingID);
        }
    }
}

function EndModel()
{
    local int i;

    StopAnimating();
    i = 0;
    J0x0d:
    // End:0x64 [While If]
    if(i < 3)
    {
        // End:0x5a
        if(wWeaponParts[i] != none)
        {
            DetachFromBone(wWeaponParts[i]);
            wWeaponParts[i].Destroy();
            wWeaponParts[i] = none;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0d;
    }
    // End:0x8d
    if(wHands != none)
    {
        DetachFromBone(wHands);
        wHands.Destroy();
        wHands = none;
    }
}

function bool Render(Canvas C, optional float Delta)
{
    local Vector PartOffset, saveLoc, dir_light0, dir_light1, cameraDir;

    local Rotator saveRot;
    local Color color_light0, color_light1;

    // End:0x0d
    if(Mesh == none)
    {
        return false;
    }
    C.GetCameraLocation(saveLoc, saveRot);
    SetRotation(PawnRot + pawnRotAdd);
    SetLocation(pawnPos);
    C.SetCameraLocation(cameraPos + cameraPosAdd);
    cameraDir = vect(225.0, 0.0, 10.0);
    cameraDir = Normal(cameraDir);
    C.SetCameraRotation(rotator(cameraDir));
    dir_light0.X = -100.0;
    dir_light0.Y = -100.0;
    dir_light0.Z = 100.0;
    dir_light1.X = 10.0;
    dir_light1.Y = 100.0;
    dir_light1.Z = 0.0;
    color_light0 = LightColor_AF[0];
    color_light1 = LightColor_AF[1];
    C.SetScreenLight(0, dir_light0, color_light0, LightDistance0);
    C.SetScreenLight(1, dir_light1, color_light1, LightDistance1);
    // End:0x18d
    if(b1st)
    {
        SetRotation(Instigator.GetViewRotation());
        CalcPartsOffset();
        PartOffset = Instigator.CalcDrawOffset(self);
        SetLocation(PartOffset + vPartsOffset);
    }
    AspectRatio = 1.0;
    C.DrawScreenActorWithViewport(self, int(AWinPos.X1), int(AWinPos.Y1), int(AWinPos.X2), int(AWinPos.Y2), AspectRatio, FOV, false, true);
    C.SetCameraLocation(saveLoc);
    C.SetCameraRotation(saveRot);
    return false;
}

function SetRotationLeft()
{
    PawnRot.Yaw -= 200;
}

function SetRotationRight()
{
    PawnRot.Yaw += 200;
}

event AnimEnd(int Channel);
simulated function CalcPartsOffset()
{
    local Vector vCurrAimDiff;
    local name szAnim;
    local float fFrame, fRate;
    local Vector vDiff;
    local float fLerp;

    vCurrAimDiff = wWeaponParts[0].vAimDiff;
    GetAnimParams(0, szAnim, fFrame, fRate);
    // End:0x68
    if(szAnim == 'Ads_Up')
    {
        fLerp = FMin(1.0, fFrame * float(2));
        vDiff = fLerp * vCurrAimDiff;
    }
    // End:0xfd
    else
    {
        // End:0xab
        if(szAnim == 'Ads_Down')
        {
            fLerp = 1.0 - FMin(1.0, fFrame * float(2));
            vDiff = fLerp * vCurrAimDiff;
        }
        // End:0xfd
        else
        {
            // End:0xea
            if(szAnim == 'Ads_Idle' || szAnim == 'Ads_Fire' || szAnim == 'Ads_Rechamber')
            {
                vDiff = vCurrAimDiff;
            }
            // End:0xfd
            else
            {
                vDiff = vect(0.0, 0.0, 0.0);
            }
        }
    }
    vPartsOffset = vDiff;
}

function SetPositionUI(float X, float Y, float Z)
{
    PosX = X;
    PosY = Y;
    posZ = Z;
    cameraPos = MakeVector(PosX, PosY, posZ);
}

function SetRotationUI(float rY)
{
    RotY = rY;
    PawnRot.Yaw = int(RotY);
}

defaultproperties
{
    FOV=60.0
    AnimNames=// Object reference not set to an instance of an object.
    
    PosX=-85.0
    PosY=-54.0
    posZ=-9.0
    RotY=-148732.0
    LightDistance0=1000.0
    LightDistance1=1000.0
    LightDistance2=1000.0
    LightAngle0=23.149930
    LightAngle1=10.150020
    LightAngle2=19.599990
    LightHeight0=350.0
    LightHeight1=70.0
    LightHeight2=-70.0
    LightColor0_R=200
    LightColor0_G=200
    LightColor0_B=200
    LightColor1_R=150
    LightColor1_G=150
    LightColor1_B=150
    LightColor_AF[0]=(R=255,G=255,B=255,A=0)
    LightColor_AF[1]=(R=255,G=255,B=255,A=0)
    LightColor_RSA[0]=(R=220,G=200,B=200,A=0)
    LightColor_RSA[1]=(R=203,G=105,B=58,A=0)
    DrawType=2
    RemoteRole=0
    bForceSkelUpdate=true
}