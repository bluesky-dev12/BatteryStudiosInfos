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
    //return;    
}

simulated function Destroyed()
{
    EndModel();
    //return;    
}

function Set1st(bool b1st)
{
    self.b1st = b1st;
    //return;    
}

function LoadSetModelData()
{
    cameraPos = MakeVector(PosX, PosY, posZ);
    PawnRot.Yaw = int(RotY);
    lightDist = MakeVector(LightDistance0, LightDistance1, LightDistance2);
    lightAngle = MakeVector(LightAngle0, LightAngle1, LightAngle2);
    lightHeight = MakeVector(LightHeight0, LightHeight1, LightHeight2);
    LightColor[0] = Class'Engine.Canvas'.static.MakeColor(byte(LightColor0_R), byte(LightColor0_G), byte(LightColor0_B), byte(255));
    LightColor[1] = Class'Engine.Canvas'.static.MakeColor(byte(LightColor1_R), byte(LightColor1_G), byte(LightColor1_B), byte(255));
    LightColor[2] = Class'Engine.Canvas'.static.MakeColor(byte(LightColor2_R), byte(LightColor2_G), byte(LightColor2_B), byte(255));
    //return;    
}

function SaveModelData()
{
    //return;    
}

function BeginModel()
{
    //return;    
}

function ForceChangeWeapon()
{
    local int W[2];

    W[0] = weaponID;
    W[1] = WeaponPartsID;
    weaponID = -1;
    WeaponPartsID = -1;
    ChangeWeapon(W[0], W[1]);
    //return;    
}

function ChangeWeapon(int iWeaponID, optional int iPartsID, optional int iPaintingID)
{
    local wWeaponBaseParams tmParam;

    // End:0x83
    if((iWeaponID > 0) && weaponID != iWeaponID)
    {
        weaponID = iWeaponID;
        SetWeapon(weaponID, iPartsID);
        WeaponPartsID = iPartsID;
        SetWeaponParts(WeaponPartsID, iPaintingID);
        tmParam = Level.WeaponMgr.GetBaseParam(weaponID);
        BaseParams = tmParam;        
    }
    else
    {
        // End:0x9D
        if(WeaponPartsID != iPartsID)
        {
            WeaponPartsID = iPartsID;
        }
        SetWeaponParts(WeaponPartsID, iPaintingID);
    }
    StopAnimating(true);
    // End:0xD1
    if(b1st)
    {
        PlayAnim(AnimNames[0], 1.0000000, 0.2000000);
    }
    //return;    
}

function ChangeWeaponsParts(int iPartsID)
{
    // End:0x25
    if(WeaponPartsID != iPartsID)
    {
        WeaponPartsID = iPartsID;
        SetWeaponParts(WeaponPartsID);
    }
    //return;    
}

function SetWeapon(int iWeaponID, int iPartsID)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x65 [Loop If]
    if(i < 2)
    {
        WeaponPartsID = 0;
        // End:0x5B
        if(wWeaponParts[i] != none)
        {
            DetachFromBone(wWeaponParts[i]);
            wWeaponParts[i].Destroy();
            wWeaponParts[i] = none;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    // End:0x8E
    if(wHands != none)
    {
        DetachFromBone(wHands);
        wHands.Destroy();
        wHands = none;
    }
    LinkMesh(Level.GameMgr.GetItemResourceMesh(weaponID, false));
    SetDrawType(2);
    // End:0x13E
    if(b1st)
    {
        wHands = Spawn(Class'Engine.wSkinShell', self);
        wHands.SetDrawType(2);
        wHands.LinkMesh(Level.GameMgr.GetItemResourceMesh(15000, false, 0));
        wHands.SetBase(self);
        wHands.SetOwner(self);
        AttachToBone(wHands, 'XXXX_Dummy');
    }
    WeaponPartsID = iPartsID;
    SetWeaponParts(WeaponPartsID);
    //return;    
}

function SetWeaponParts(int iPartsID, optional int iPaintingID)
{
    local wPartsGroupParam PartsParam;
    local wItemResourceParam ItemResParam;
    local int i;

    i = 0;
    J0x07:

    // End:0x5E [Loop If]
    if(i < 3)
    {
        // End:0x54
        if(wWeaponParts[i] != none)
        {
            DetachFromBone(wWeaponParts[i]);
            wWeaponParts[i].Destroy();
            wWeaponParts[i] = none;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    PartsParam = Level.GameMgr.GetAddPartsGroupParam(iPartsID);
    // End:0xB8
    if(PartsParam.iAddPartID <= 0)
    {
        PartsParam = Level.GameMgr.GetDefaultAddPartsGroupParam(weaponID);
    }
    // End:0xD2
    if(PartsParam.iAddPartID == -1)
    {
        return;
    }
    // End:0x234
    if(PartsParam.iSightID != 0)
    {
        ItemResParam = Level.GameMgr.GetItemResourceParam(PartsParam.iSightID);
        // End:0x234
        if(ItemResParam.iItemResourceID != -1)
        {
            wWeaponParts[0] = Spawn(Class'Engine.wSkinShell');
            wWeaponParts[0].SetDrawType(8);
            wWeaponParts[0].SetStaticMesh(Level.GameMgr.GetItemResourceStaticMesh(PartsParam.iSightID, false));
            wWeaponParts[0].SetBase(self);
            wWeaponParts[0].SetOwner(self);
            wWeaponParts[0].vAimDiff.X = PartsParam.fAimDiffX;
            wWeaponParts[0].vAimDiff.Y = PartsParam.fAimDiffY;
            wWeaponParts[0].vAimDiff.Z = PartsParam.fAimDiffZ;
            wWeaponParts[0].bAnimByOwner = false;
            AttachToBone(wWeaponParts[0], 'Sight');
        }
    }
    // End:0x32A
    if(PartsParam.iSilencerID != 0)
    {
        ItemResParam = Level.GameMgr.GetItemResourceParam(PartsParam.iSilencerID);
        // End:0x32A
        if(ItemResParam.iItemResourceID != -1)
        {
            wWeaponParts[1] = Spawn(Class'Engine.wSkinShell');
            wWeaponParts[1].SetDrawType(8);
            wWeaponParts[1].SetStaticMesh(Level.GameMgr.GetItemResourceStaticMesh(PartsParam.iSilencerID, false));
            wWeaponParts[1].SetBase(self);
            wWeaponParts[1].SetOwner(self);
            wWeaponParts[1].bAnimByOwner = false;
            AttachToBone(wWeaponParts[1], 'Silencer');
        }
    }
    // End:0x496
    if(PartsParam.iSightID_Sub != 0)
    {
        ItemResParam = Level.GameMgr.GetItemResourceParam(PartsParam.iSightID_Sub);
        // End:0x496
        if(ItemResParam.iItemResourceID != -1)
        {
            wWeaponParts[2] = Spawn(Class'Engine.wSkinShell');
            wWeaponParts[2].SetDrawType(8);
            wWeaponParts[2].SetStaticMesh(Level.GameMgr.GetItemResourceStaticMesh(PartsParam.iSightID_Sub, false));
            wWeaponParts[2].SetBase(self);
            wWeaponParts[2].SetOwner(self);
            wWeaponParts[2].vAimDiff.X = PartsParam.fAimDiffX;
            wWeaponParts[2].vAimDiff.Y = PartsParam.fAimDiffY;
            wWeaponParts[2].vAimDiff.Z = PartsParam.fAimDiffZ;
            wWeaponParts[2].bAnimByOwner = false;
            AttachToBone(wWeaponParts[2], 'Sight');
        }
    }
    // End:0x4B5
    if(iPaintingID <= 0)
    {
        iPaintingID = PartsParam.iPaintingID;
    }
    // End:0x507
    if(iPaintingID > 0)
    {
        PaintingID = iPaintingID;
        Skins[0] = Level.GameMgr.GetPartsGroupPainting(weaponID, PartsParam.iAddPartID, false, iPaintingID);        
    }
    else
    {
        Skins.Length = 0;
    }
    //return;    
}

function SetWeaponPainting(int iPaintingID)
{
    local wPartsGroupParam PartsParam;

    // End:0x60
    if(PaintingID != iPaintingID)
    {
        PaintingID = iPaintingID;
        // End:0x30
        if(PaintingID == 0)
        {
            Skins.Length = 0;            
        }
        else
        {
            Skins[0] = Level.GameMgr.GetPartsGroupPainting(weaponID, WeaponPartsID, false, PaintingID);
        }
    }
    //return;    
}

function EndModel()
{
    local int i;

    StopAnimating();
    i = 0;
    J0x0D:

    // End:0x64 [Loop If]
    if(i < 3)
    {
        // End:0x5A
        if(wWeaponParts[i] != none)
        {
            DetachFromBone(wWeaponParts[i]);
            wWeaponParts[i].Destroy();
            wWeaponParts[i] = none;
        }
        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    // End:0x8D
    if(wHands != none)
    {
        DetachFromBone(wHands);
        wHands.Destroy();
        wHands = none;
    }
    //return;    
}

function bool Render(Canvas C, optional float Delta)
{
    local Vector PartOffset, saveLoc, dir_light0, dir_light1, cameraDir;

    local Rotator saveRot;
    local Color color_light0, color_light1;

    // End:0x0D
    if(Mesh == none)
    {
        return false;
    }
    C.GetCameraLocation(saveLoc, saveRot);
    SetRotation(PawnRot + pawnRotAdd);
    SetLocation(pawnPos);
    C.SetCameraLocation(cameraPos + cameraPosAdd);
    cameraDir = vect(225.0000000, 0.0000000, 10.0000000);
    cameraDir = Normal(cameraDir);
    C.SetCameraRotation(Rotator(cameraDir));
    dir_light0.X = -100.0000000;
    dir_light0.Y = -100.0000000;
    dir_light0.Z = 100.0000000;
    dir_light1.X = 10.0000000;
    dir_light1.Y = 100.0000000;
    dir_light1.Z = 0.0000000;
    color_light0 = LightColor_AF[0];
    color_light1 = LightColor_AF[1];
    C.SetScreenLight(0, dir_light0, color_light0, LightDistance0);
    C.SetScreenLight(1, dir_light1, color_light1, LightDistance1);
    // End:0x18D
    if(b1st)
    {
        SetRotation(Instigator.GetViewRotation());
        CalcPartsOffset();
        PartOffset = Instigator.CalcDrawOffset(self);
        SetLocation(PartOffset + vPartsOffset);
    }
    AspectRatio = 1.0000000;
    C.DrawScreenActorWithViewport(self, int(AWinPos.X1), int(AWinPos.Y1), int(AWinPos.X2), int(AWinPos.Y2), AspectRatio, FOV, false, true);
    C.SetCameraLocation(saveLoc);
    C.SetCameraRotation(saveRot);
    return false;
    //return;    
}

function SetRotationLeft()
{
    PawnRot.Yaw -= 200;
    //return;    
}

function SetRotationRight()
{
    PawnRot.Yaw += 200;
    //return;    
}

event AnimEnd(int Channel)
{
    //return;    
}

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
        fLerp = FMin(1.0000000, fFrame * float(2));
        vDiff = fLerp * vCurrAimDiff;        
    }
    else
    {
        // End:0xAB
        if(szAnim == 'Ads_Down')
        {
            fLerp = 1.0000000 - FMin(1.0000000, fFrame * float(2));
            vDiff = fLerp * vCurrAimDiff;            
        }
        else
        {
            // End:0xEA
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

function SetPositionUI(float X, float Y, float Z)
{
    PosX = X;
    PosY = Y;
    posZ = Z;
    cameraPos = MakeVector(PosX, PosY, posZ);
    //return;    
}

function SetRotationUI(float rY)
{
    RotY = rY;
    PawnRot.Yaw = int(RotY);
    //return;    
}

defaultproperties
{
    FOV=60.0000000
    AnimNames[0]="Ads_Up"
    AnimNames[1]="Ads_Down"
    PosX=-85.0000000
    PosY=-54.0000000
    posZ=-9.0000000
    RotY=-148732.0000000
    LightDistance0=1000.0000000
    LightDistance1=1000.0000000
    LightDistance2=1000.0000000
    LightAngle0=23.1499329
    LightAngle1=10.1500206
    LightAngle2=19.5999870
    LightHeight0=350.0000000
    LightHeight1=70.0000000
    LightHeight2=-70.0000000
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