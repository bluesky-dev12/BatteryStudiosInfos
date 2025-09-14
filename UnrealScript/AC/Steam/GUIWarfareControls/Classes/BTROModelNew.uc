/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTROModelNew.uc
 * Package Imports:
 *	GUIWarfareControls
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:61
 *	Functions:25
 *
 *******************************************************************************/
class BTROModelNew extends Actor
    notplaceable;

var Vector cameraDir;
var int CurrentModifyLight;
var bool bModifyLight;
var wSkinShell wLightModel;
var array<name> AnimNames;
var int BodyID[2];
var int FaceID[2];
var int HelmetID[2];
var int AccessoryID[2];
var int CurBodyID;
var int CurFaceID;
var int CurHelmetID;
var int CurAccessoryID;
var int TeamIndex;
var int weaponID;
var int WeaponPartsID;
var int WeaponPaintID;
var int WeaponType;
var wSkinShell wParts[3];
var wSkinShell wWeapon;
var wSkinShell wWeaponParts[3];
var FloatBox AWinPos;
var Vector dir_light0;
var Vector dir_light1;
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
var Rotator PawnRot;
var Vector pawnPos;
var Rotator cameraRot;
var Vector cameraPos;
var Vector lightAngle;
var Color LightColor[3];
var byte LightOnOff[5];
var float LightPosToCenter[5];
var float Roll[5];
var float lightDist[5];
var float lightHeight[5];
var Color LightColor_AF[5];
var Color LightColor_RSA[5];
var name NoHaveWeaponIdle;

function Init()
{
    LoadSetModelData();
    BeginModel();
    ForceChangeEquipItems();
    ForceChangeWeapon();
    SetRotation(rot(0, 39784, 0));
    ChangeWeapon(2000, 0);
    PlayAnimByParams(2000);
    wLightModel = Spawn(class'wSkinShell',,,);
    wLightModel.SetDrawType(8);
    wLightModel.SetStaticMesh(Level.GameMgr.GetItemResourceStaticMesh(20016, true));
    wLightModel.SetBase(none);
    wLightModel.SetOwner(none);
    wLightModel.bAnimByOwner = false;
}

simulated function Destroyed()
{
    EndModel();
}

function LoadSetModelData()
{
    PawnRot.Yaw = int(RotY);
}

function SaveModelData();
function BeginModel();
function ChangeTeam(int iIndex)
{
    // End:0x26
    if(TeamIndex != iIndex)
    {
        TeamIndex = iIndex;
        ForceChangeEquipItems();
        ForceChangeWeapon();
    }
    PlayAnimByParams();
}

function ChangeEquipItem(wGameManager GameMgr)
{
    local int iBodyID[2], iFaceID, iHelmetID, iAccessoryID;
    local wPartsGroupParam tmPParam;

    iBodyID[0] = GameMgr.FindInstanceItemIDBySlotPos(21);
    // End:0x35
    if(iBodyID[0] <= 0)
    {
        iBodyID[0] = default.BodyID[0];
    }
    iBodyID[1] = GameMgr.FindInstanceItemIDBySlotPos(22);
    // End:0x6a
    if(iBodyID[1] <= 0)
    {
        iBodyID[1] = default.BodyID[1];
    }
    // End:0xcc
    if(iBodyID[0] != default.BodyID[0])
    {
        tmPParam = Level.GameMgr.GetDefaultAddPartsGroupParam(iBodyID[0]);
        iFaceID[0] = -1;
        iHelmetID[0] = -1;
        iAccessoryID[0] = -1;
    }
    // End:0x16b
    else
    {
        iFaceID[0] = GameMgr.FindInstanceItemIDBySlotPos(19);
        // End:0x101
        if(iFaceID[0] <= 0)
        {
            iFaceID[0] = default.FaceID[0];
        }
        iHelmetID[0] = GameMgr.FindInstanceItemIDBySlotPos(18);
        // End:0x136
        if(iHelmetID[0] <= 0)
        {
            iHelmetID[0] = default.HelmetID[0];
        }
        iAccessoryID[0] = GameMgr.FindInstanceItemIDBySlotPos(20);
        // End:0x16b
        if(iAccessoryID[0] <= 0)
        {
            iAccessoryID[0] = default.AccessoryID[0];
        }
    }
    // End:0x1cd
    if(iBodyID[1] != default.BodyID[1])
    {
        tmPParam = Level.GameMgr.GetDefaultAddPartsGroupParam(iBodyID[1]);
        iFaceID[1] = -1;
        iHelmetID[1] = -1;
        iAccessoryID[1] = -1;
    }
    // End:0x26c
    else
    {
        iFaceID[1] = GameMgr.FindInstanceItemIDBySlotPos(19);
        // End:0x202
        if(iFaceID[1] <= 0)
        {
            iFaceID[1] = default.FaceID[0];
        }
        iHelmetID[1] = GameMgr.FindInstanceItemIDBySlotPos(18);
        // End:0x237
        if(iHelmetID[1] <= 0)
        {
            iHelmetID[1] = default.HelmetID[0];
        }
        iAccessoryID[1] = GameMgr.FindInstanceItemIDBySlotPos(20);
        // End:0x26c
        if(iAccessoryID[1] <= 0)
        {
            iAccessoryID[1] = default.AccessoryID[0];
        }
    }
    ChangeEquipItemByID(iBodyID[0], iBodyID[1], iFaceID[0], iFaceID[1], iHelmetID[0], iHelmetID[1], iAccessoryID[0], iAccessoryID[1]);
    PlayAnimByParams();
}

function ChangeEquipItemByItemID(int HelmetItemID, int FaceItemID, int AcceItemID, int AF_ItemID, int RSA_ItemID)
{
    local int iBodyID[2], iFaceID, iHelmetID, iAccessoryID;
    local wPartsGroupParam tmPParam;

    iBodyID[0] = AF_ItemID;
    // End:0x29
    if(iBodyID[0] <= 0)
    {
        iBodyID[0] = default.BodyID[0];
    }
    iBodyID[1] = RSA_ItemID;
    // End:0x52
    if(iBodyID[1] <= 0)
    {
        iBodyID[1] = default.BodyID[1];
    }
    // End:0xb4
    if(iBodyID[0] != default.BodyID[0])
    {
        tmPParam = Level.GameMgr.GetDefaultAddPartsGroupParam(iBodyID[0]);
        iFaceID[0] = -1;
        iHelmetID[0] = -1;
        iAccessoryID[0] = -1;
    }
    // End:0x12f
    else
    {
        iFaceID[0] = FaceItemID;
        // End:0xdd
        if(iFaceID[0] <= 0)
        {
            iFaceID[0] = default.FaceID[0];
        }
        iHelmetID[0] = HelmetItemID;
        // End:0x106
        if(iHelmetID[0] <= 0)
        {
            iHelmetID[0] = default.HelmetID[0];
        }
        iAccessoryID[0] = AcceItemID;
        // End:0x12f
        if(iAccessoryID[0] <= 0)
        {
            iAccessoryID[0] = default.AccessoryID[0];
        }
    }
    // End:0x191
    if(iBodyID[1] != default.BodyID[1])
    {
        tmPParam = Level.GameMgr.GetDefaultAddPartsGroupParam(iBodyID[1]);
        iFaceID[1] = -1;
        iHelmetID[1] = -1;
        iAccessoryID[1] = -1;
    }
    // End:0x20c
    else
    {
        iFaceID[1] = FaceItemID;
        // End:0x1ba
        if(iFaceID[1] <= 0)
        {
            iFaceID[1] = default.FaceID[0];
        }
        iHelmetID[1] = HelmetItemID;
        // End:0x1e3
        if(iHelmetID[1] <= 0)
        {
            iHelmetID[1] = default.HelmetID[0];
        }
        iAccessoryID[1] = AcceItemID;
        // End:0x20c
        if(iAccessoryID[1] <= 0)
        {
            iAccessoryID[1] = default.AccessoryID[0];
        }
    }
    ChangeEquipItemByID(iBodyID[0], iBodyID[1], iFaceID[0], iFaceID[1], iHelmetID[0], iHelmetID[1], iAccessoryID[0], iAccessoryID[1]);
    PlayAnimByParams();
}

function ForceChangeWeapon()
{
    local int W[2];

    W[0] = weaponID;
    W[1] = WeaponPartsID;
    weaponID = -1;
    WeaponPartsID = -1;
    ChangeWeapon(W[0], W[1], WeaponPaintID);
}

function ChangeEquipItemByID(int iBodyID_0, int iBodyID_1, int iFaceID_0, int iFaceID_1, int iHelmetID_0, int iHelmetID_1, int iAccessoryID_0, int iAccessoryID_1)
{
    // End:0x42
    if(iBodyID_0 > 0 && BodyID[0] != iBodyID_0)
    {
        BodyID[0] = iBodyID_0;
        // End:0x42
        if(TeamIndex == 0)
        {
            ForceChangeEquipItems();
            ForceChangeWeapon();
        }
    }
    // End:0x84
    if(iBodyID_1 > 0 && BodyID[1] != iBodyID_1)
    {
        BodyID[1] = iBodyID_1;
        // End:0x84
        if(TeamIndex == 1)
        {
            ForceChangeEquipItems();
            ForceChangeWeapon();
        }
    }
    // End:0xa2
    if(FaceID[0] != iFaceID_0)
    {
        FaceID[0] = iFaceID_0;
    }
    // End:0xc0
    if(FaceID[1] != iFaceID_1)
    {
        FaceID[1] = iFaceID_1;
    }
    // End:0xe4
    if(FaceID[TeamIndex] != CurFaceID)
    {
        SetParts(1);
        SetParts(3);
    }
    // End:0x102
    if(HelmetID[0] != iHelmetID_0)
    {
        HelmetID[0] = iHelmetID_0;
    }
    // End:0x120
    if(HelmetID[1] != iHelmetID_1)
    {
        HelmetID[1] = iHelmetID_1;
    }
    // End:0x14c
    if(HelmetID[TeamIndex] != CurHelmetID)
    {
        SetParts(1);
        SetParts(2);
        SetParts(3);
    }
    // End:0x16a
    if(AccessoryID[0] != iAccessoryID_0)
    {
        AccessoryID[0] = iAccessoryID_0;
    }
    // End:0x188
    if(AccessoryID[1] != iAccessoryID_1)
    {
        AccessoryID[1] = iAccessoryID_1;
    }
    // End:0x1a5
    if(AccessoryID[TeamIndex] != CurAccessoryID)
    {
        SetParts(3);
    }
}

function ForceChangeEquipItems()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x28 [While If]
    if(i < 4)
    {
        SetParts(i);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function SetParts(int iType)
{
    local wGameManager gm;
    local int iTemp;

    // End:0x1b
    if(iType < 0 || iType > 3)
    {
        return;
    }
    gm = Level.GameMgr;
    // End:0x94
    if(iType == 0)
    {
        LinkMesh(gm.GetItemResourceMesh(BodyID[TeamIndex], true, byte(TeamIndex)));
        SetBoneRotation('righthand', rot(32768, 16384, 16384), 0, 1.0);
        CurBodyID = BodyID[TeamIndex];
    }
    // End:0x3c8
    else
    {
        // End:0x288
        if(iType != 3)
        {
            iTemp = iType - 1;
            // End:0xef
            if(wParts[iTemp] != none)
            {
                DetachFromBone(wParts[iTemp]);
                wParts[iTemp].Destroy();
                wParts[iTemp] = none;
            }
            switch(iTemp)
            {
                // End:0x125
                case 0:
                    // End:0x122
                    if(FaceID[TeamIndex] == -1)
                    {
                        CurFaceID = FaceID[TeamIndex];
                        return;
                    }
                    // End:0x157
                    break;
                // End:0x154
                case 1:
                    // End:0x151
                    if(HelmetID[TeamIndex] == -1)
                    {
                        CurHelmetID = HelmetID[TeamIndex];
                        return;
                    }
                    // End:0x157
                    break;
                // End:0xffff
                default:
                    wParts[iTemp] = Spawn(class'wSkinShell', self,,);
                    wParts[iTemp].SetDrawType(2);
                    switch(iTemp)
                    {
                        // End:0x1db
                        case 0:
                            wParts[iTemp].LinkMesh(gm.GetItemResourceMesh(FaceID[TeamIndex], true, byte(TeamIndex)));
                            CurFaceID = FaceID[TeamIndex];
                            // End:0x22d
                            break;
                        // End:0x22a
                        case 1:
                            wParts[iTemp].LinkMesh(gm.GetItemResourceMesh(HelmetID[TeamIndex], true, byte(TeamIndex)));
                            CurHelmetID = HelmetID[TeamIndex];
                            // End:0x22d
                            break;
                        // End:0xffff
                        default:
                            wParts[iTemp].SetBase(self);
                            wParts[iTemp].SetOwner(self);
                            // End:0x285
                            if(AttachToBone(wParts[iTemp], 'Main_Dummy') == false)
                            {
                                AttachToBone(wParts[iTemp], 'XXXX_Dummy');
                            }
                            // End:0x3c8 Break;
                            break;
                        }
                }
                iTemp = iType - 1;
                // End:0x2d7
                if(wParts[iTemp] != none)
                {
                    DetachFromBone(wParts[iTemp]);
                    wParts[iTemp].Destroy();
                    wParts[iTemp] = none;
                }
                // End:0x2ff
                if(AccessoryID[TeamIndex] == -1)
                {
                    CurAccessoryID = AccessoryID[TeamIndex];
                    return;
                }
                wParts[iTemp] = Spawn(class'wSkinShell', self,,);
                wParts[iTemp].SetDrawType(8);
                wParts[iTemp].SetStaticMesh(gm.GetItemResourceStaticMesh(AccessoryID[TeamIndex], true, byte(TeamIndex)));
                wParts[iTemp].SetBase(self);
                wParts[iTemp].SetOwner(self);
                wParts[iTemp].bAnimByOwner = false;
                CurAccessoryID = AccessoryID[TeamIndex];
                AttachToBone(wParts[iTemp], 'Acce');
            }
}

function ChangeWeapon(int iWeaponID, optional int iPartsID, optional int iPaintingID)
{
    // End:0x66
    if(iWeaponID > 0 && weaponID != iWeaponID)
    {
        weaponID = iWeaponID;
        SetWeapon(weaponID, iPartsID);
        WeaponPartsID = iPartsID;
        WeaponPaintID = iPaintingID;
        SetWeaponParts(WeaponPartsID, iPaintingID);
        PlayAnimByParams();
    }
    // End:0x8c
    else
    {
        WeaponPartsID = iPartsID;
        WeaponPaintID = iPaintingID;
        SetWeaponParts(WeaponPartsID, iPaintingID);
    }
}

function PlayAnimByParams(optional int wID)
{
    local wWeaponBaseParams tmParam;
    local wItemResourceParam irParam;
    local name tmName;

    // End:0x16
    if(wID != 0)
    {
        weaponID = wID;
    }
    tmParam = Level.WeaponMgr.GetBaseParam(weaponID);
    // End:0x93
    if(tmParam != none)
    {
        // End:0x67
        if(tmParam.eType == 1)
        {
            WeaponType = 0;
        }
        // End:0x93
        else
        {
            // End:0x8b
            if(tmParam.eType == 3)
            {
                WeaponType = 2;
            }
            // End:0x93
            else
            {
                WeaponType = 4;
            }
        }
    }
    irParam = Level.GameMgr.GetItemResourceParam(weaponID);
    // End:0x158
    if(irParam != none && irParam.Resource_UI_Weapon_Ani != "" && irParam.Resource_UI_Weapon_Ani != "-")
    {
        Log("[BTROModelNew::PlayAnimByParams] ID = " $ irParam.Resource_UI_Weapon_Ani);
        GetNameFromStr(irParam.Resource_UI_Weapon_Ani, tmName);
        PlayAnim(tmName, 1.0, 0.20);
    }
    // End:0x1b8
    else
    {
        Log("[BTROModelNew::PlayAnimByParams] Type = " $ string(WeaponType) $ "(" $ string(AnimNames[WeaponType]) $ ")");
        PlayAnim(NoHaveWeaponIdle, 1.0, 0.20);
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

function ChangeWeaponsPaints(int iPaintID)
{
    // End:0x2a
    if(WeaponPaintID != iPaintID)
    {
        WeaponPaintID = iPaintID;
        SetWeaponParts(WeaponPartsID, iPaintID);
    }
}

function SetWeapon(int iWeaponID, int iPartsID)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x6e [While If]
    if(i < 3)
    {
        WeaponPartsID = 0;
        // End:0x64
        if(wWeaponParts[i] != none)
        {
            wWeapon.DetachFromBone(wWeaponParts[i]);
            wWeaponParts[i].Destroy();
            wWeaponParts[i] = none;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    // End:0x97
    if(wWeapon != none)
    {
        DetachFromBone(wWeapon);
        wWeapon.Destroy();
        wWeapon = none;
    }
    wWeapon = Spawn(class'wSkinShell');
    wWeapon.SetDrawType(2);
    wWeapon.LinkMesh(Level.GameMgr.GetItemResourceMesh(weaponID, true));
    wWeapon.SetBase(self);
    wWeapon.SetOwner(self);
    wWeapon.bAnimByOwner = false;
    AttachToBone(wWeapon, 'righthand');
    WeaponPartsID = iPartsID;
    SetWeaponParts(WeaponPartsID);
}

function DeleteWeapone()
{
    // End:0x1d
    if(wWeapon != none)
    {
        DetachFromBone(wWeapon);
        weaponID = 0;
    }
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
    // End:0x29e
    if(iSightPartID > 1)
    {
        wcpp = Level.GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iSightPartID);
        // End:0x29b
        if(wcpp.iItemID > 0 && wcpp.iPartID == iSightPartID)
        {
            iSubSightPartItemID = wcip.iSightOnAddItemID;
            ItemResParam = Level.GameMgr.GetItemResourceParam(wcpp.iItemID);
            // End:0x29b
            if(ItemResParam.iItemResourceID != -1)
            {
                wWeaponParts[0] = Spawn(class'wSkinShell');
                wWeaponParts[0].SetDrawType(8);
                wWeaponParts[0].SetStaticMesh(Level.GameMgr.GetItemResourceStaticMesh(wcpp.iItemID, true));
                wWeaponParts[0].SetBase(self);
                wWeaponParts[0].SetOwner(self);
                wWeaponParts[0].bAnimByOwner = false;
                // End:0x280
                if(Len(ItemResParam.strRes_3rd_AF_Gore) > 1)
                {
                    wWeaponParts[0].Skins[0] = Material(DynamicLoadObject(ItemResParam.strRes_3rd_AF_Gore, class'Material'));
                }
                wWeapon.AttachToBone(wWeaponParts[0], 'Sight');
            }
        }
    }
    // End:0x2b2
    else
    {
        iSubSightPartItemID = wcip.iSightOffAddItemID;
    }
    // End:0x3e5
    if(iSubSightPartItemID > 0)
    {
        ItemResParam = Level.GameMgr.GetItemResourceParam(iSubSightPartItemID);
        // End:0x3e5
        if(ItemResParam.iItemResourceID != -1)
        {
            wWeaponParts[2] = Spawn(class'wSkinShell');
            wWeaponParts[2].SetDrawType(8);
            wWeaponParts[2].SetStaticMesh(Level.GameMgr.GetItemResourceStaticMesh(iSubSightPartItemID, true));
            wWeaponParts[2].SetBase(self);
            wWeaponParts[2].SetOwner(self);
            wWeaponParts[2].bAnimByOwner = false;
            // End:0x3c9
            if(Len(ItemResParam.strRes_3rd_AF_Gore) > 1)
            {
                wWeaponParts[2].Skins[0] = Material(DynamicLoadObject(ItemResParam.strRes_3rd_AF_Gore, class'Material'));
            }
            wWeapon.AttachToBone(wWeaponParts[2], 'Sight');
        }
    }
    // End:0x577
    if(iSilencerPartID > 1 << 17)
    {
        wcpp = Level.GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iSilencerPartID);
        // End:0x577
        if(wcpp.iItemID > 0 && wcpp.iPartID == iSilencerPartID)
        {
            ItemResParam = Level.GameMgr.GetItemResourceParam(wcpp.iItemID);
            // End:0x577
            if(ItemResParam.iItemResourceID != -1)
            {
                wWeaponParts[1] = Spawn(class'wSkinShell');
                wWeaponParts[1].SetDrawType(8);
                wWeaponParts[1].SetStaticMesh(Level.GameMgr.GetItemResourceStaticMesh(wcpp.iItemID, true));
                wWeaponParts[1].SetBase(self);
                wWeaponParts[1].SetOwner(self);
                wWeaponParts[1].bAnimByOwner = false;
                // End:0x55c
                if(Len(ItemResParam.strRes_3rd_AF_Gore) > 1)
                {
                    wWeaponParts[1].Skins[0] = Material(DynamicLoadObject(ItemResParam.strRes_3rd_AF_Gore, class'Material'));
                }
                wWeapon.AttachToBone(wWeaponParts[1], 'Silencer');
            }
        }
    }
    // End:0x596
    if(iPaintingID <= 0)
    {
        iPaintingID = wcip.iDefaultPaintingID;
    }
    // End:0x5dd
    if(iPaintingID > 0)
    {
        wWeapon.Skins[0] = Level.GameMgr.GetPartsGroupPainting(weaponID, iPartsID, true, iPaintingID);
    }
    // End:0x5ee
    else
    {
        wWeapon.Skins.Length = 0;
    }
}

function EndModel()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x5e [While If]
    if(i < 3)
    {
        // End:0x54
        if(wParts[i] != none)
        {
            DetachFromBone(wParts[i]);
            wParts[i].Destroy();
            wParts[i] = none;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    i = 0;
    J0x65:
    // End:0xc5 [While If]
    if(i < 3)
    {
        // End:0xbb
        if(wWeaponParts[i] != none)
        {
            wWeapon.DetachFromBone(wWeaponParts[i]);
            wWeaponParts[i].Destroy();
            wWeaponParts[i] = none;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x65;
    }
    // End:0xe3
    if(wLightModel != none)
    {
        wLightModel.Destroy();
        wLightModel = none;
    }
    // End:0x10c
    if(wWeapon != none)
    {
        DetachFromBone(wWeapon);
        wWeapon.Destroy();
        wWeapon = none;
    }
}

function SetScaleModel(Vector scaleVector);
function bool Render(Canvas C, optional float Delta)
{
    local Vector saveLoc, LightPos;
    local Rotator saveRot;
    local Color color_light[5];
    local int i;
    local string strTemp;

    // End:0x0d
    if(Mesh == none)
    {
        return false;
    }
    C.GetCameraLocation(saveLoc, saveRot);
    SetRotation(PawnRot);
    SetLocation(pawnPos);
    C.SetCameraLocation(cameraPos);
    cameraDir = Normal(cameraDir);
    C.SetCameraRotation(rotator(cameraDir));
    // End:0xcc
    if(TeamIndex == 0)
    {
        color_light[0] = LightColor_AF[0];
        color_light[1] = LightColor_AF[1];
        color_light[2] = LightColor_AF[2];
        color_light[3] = LightColor_AF[3];
        color_light[4] = LightColor_AF[4];
    }
    // End:0x11d
    else
    {
        color_light[0] = LightColor_RSA[0];
        color_light[1] = LightColor_RSA[1];
        color_light[2] = LightColor_RSA[2];
        color_light[3] = LightColor_RSA[3];
        color_light[4] = LightColor_RSA[4];
    }
    i = 0;
    J0x124:
    // End:0x205 [While If]
    if(i < 5)
    {
        // End:0x1cc
        if(LightOnOff[i] > 0)
        {
            LightPos[i] = MakeVector(LightPosToCenter[i] * Sin(Roll[i]), LightPosToCenter[i] * Cos(Roll[i]), lightHeight[i]);
            C.SetScreenLight(i, LightPos[i], color_light[i], lightDist[i]);
        }
        // End:0x1fb
        else
        {
            C.SetScreenLight(i, LightPos[i], color_light[i], 0.0);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x124;
    }
    AspectRatio = 1.0;
    C.DrawScreenActorWithViewport(self, int(AWinPos.X1), int(AWinPos.Y1), int(AWinPos.X2), int(AWinPos.Y2), AspectRatio, 18.0, false, true);
    // End:0x71d
    if(bModifyLight)
    {
        C.DrawColor = class'Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255));
        class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.butt_n, 330.0, 90.0, 850.0, 250.0);
        class'BTCustomDrawHK'.static.DrawString(C, "LightDist[" $ string(CurrentModifyLight) $ "] = (" $ string(lightDist[CurrentModifyLight]) $ ")", 0, 9.0, 400.0, 110.0, 1000.0, 500.0);
        class'BTCustomDrawHK'.static.DrawString(C, "Radius[" $ string(CurrentModifyLight) $ "] = (" $ string(LightPosToCenter[CurrentModifyLight]) $ ")", 0, 9.0, 400.0, 125.0, 1000.0, 500.0);
        class'BTCustomDrawHK'.static.DrawString(C, "Roll[" $ string(CurrentModifyLight) $ "] = (" $ string(Roll[CurrentModifyLight]) $ ")", 0, 9.0, 400.0, 140.0, 1000.0, 500.0);
        class'BTCustomDrawHK'.static.DrawString(C, "LightHeight[" $ string(CurrentModifyLight) $ "] = (" $ string(lightHeight[CurrentModifyLight]) $ ")", 0, 9.0, 400.0, 155.0, 1000.0, 500.0);
        class'BTCustomDrawHK'.static.DrawString(C, "LightColorAF[" $ string(CurrentModifyLight) $ "] = (" $ string(LightColor_AF[CurrentModifyLight].R) $ ", " $ string(LightColor_AF[CurrentModifyLight].G) $ ", " $ string(LightColor_AF[CurrentModifyLight].B) $ ")", 0, 9.0, 400.0, 170.0, 1000.0, 500.0);
        class'BTCustomDrawHK'.static.DrawString(C, "LightColorRSA[" $ string(CurrentModifyLight) $ "] = (" $ string(LightColor_RSA[CurrentModifyLight].R) $ ", " $ string(LightColor_RSA[CurrentModifyLight].G) $ ", " $ string(LightColor_RSA[CurrentModifyLight].B) $ ")", 0, 9.0, 400.0, 185.0, 1000.0, 500.0);
        class'BTCustomDrawHK'.static.DrawString(C, "LightIndex = " $ string(CurrentModifyLight + 1), 0, 9.0, 400.0, 200.0, 1000.0, 500.0);
        strTemp = "LightOn/Off = ";
        i = 0;
        J0x5e9:
        // End:0x64b [While If]
        if(i < 5)
        {
            // End:0x629
            if(LightOnOff[i] > 0)
            {
                strTemp $= "(" $ string(i + 1) $ ") ";
            }
            // End:0x641
            else
            {
                strTemp $= string(i + 1) $ " ";
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x5e9;
        }
        class'BTCustomDrawHK'.static.DrawString(C, strTemp, 0, 9.0, 400.0, 215.0, 1000.0, 500.0);
        i = 0;
        J0x686:
        // End:0x71d [While If]
        if(i < 5)
        {
            // End:0x713
            if(LightOnOff[i] > 0)
            {
                wLightModel.SetLocation(LightPos[i] + pawnPos);
                C.DrawScreenActorWithViewport(wLightModel, int(AWinPos.X1), int(AWinPos.Y1), int(AWinPos.X2), int(AWinPos.Y2), AspectRatio, 18.0, false, false);
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x686;
        }
    }
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

event AnimEnd(int Channel)
{
    PlayAnimByParams();
}

defaultproperties
{
    cameraDir=(X=0.9990140,Y=0.0,Z=0.0444010)
    AnimNames=// Object reference not set to an instance of an object.
    
    BodyID[0]=15000
    BodyID[1]=15000
    FaceID[0]=12000
    FaceID[1]=12000
    HelmetID[0]=11000
    HelmetID[1]=11000
    AccessoryID[0]=13000
    AccessoryID[1]=13000
    dir_light0=(X=-100.0,Y=-100.0,Z=100.0)
    dir_light1=(X=10.0,Y=100.0,Z=0.0)
    PosX=-240.0
    posZ=2.50
    RotY=32768.0
    LightDistance0=1000.0
    LightDistance1=1000.0
    LightDistance2=1000.0
    LightAngle0=23.149930
    LightAngle1=10.150020
    LightAngle2=19.599990
    LightColor0_R=200
    LightColor0_G=200
    LightColor0_B=200
    LightColor1_R=150
    LightColor1_G=150
    LightColor1_B=150
    cameraPos=(X=-240.0,Y=0.0,Z=2.50)
    LightOnOff[0]=1
    LightOnOff[1]=1
    LightOnOff[2]=1
    LightOnOff[3]=1
    LightOnOff[4]=1
    LightPosToCenter[0]=200.0
    LightPosToCenter[1]=122.0
    LightPosToCenter[2]=29.0
    LightPosToCenter[3]=145.0
    LightPosToCenter[4]=54.0
    Roll[0]=54.79990
    Roll[1]=-3.0
    Roll[2]=19.90
    Roll[3]=-0.10
    Roll[4]=-5.70
    lightDist[0]=252.0
    lightDist[1]=210.0
    lightDist[2]=218.0
    lightDist[3]=200.0
    lightDist[4]=110.0
    lightHeight[0]=100.0
    lightHeight[1]=128.0
    lightHeight[2]=184.0
    lightHeight[3]=-43.0
    lightHeight[4]=18.0
    LightColor_AF[0]=(R=193,G=193,B=190,A=0)
    LightColor_AF[1]=(R=166,G=167,B=178,A=0)
    LightColor_AF[2]=(R=238,G=238,B=238,A=0)
    LightColor_AF[3]=(R=62,G=169,B=238,A=0)
    LightColor_AF[4]=(R=82,G=103,B=118,A=0)
    LightColor_RSA[0]=(R=194,G=194,B=194,A=0)
    LightColor_RSA[1]=(R=147,G=112,B=71,A=0)
    LightColor_RSA[2]=(R=131,G=140,B=127,A=0)
    LightColor_RSA[3]=(R=207,G=72,B=30,A=0)
    LightColor_RSA[4]=(R=146,G=75,B=30,A=0)
    NoHaveWeaponIdle=UI_HAND
    DrawType=2
    RemoteRole=0
    bForceSkelUpdate=true
}