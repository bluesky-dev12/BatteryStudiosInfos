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
var int BackPackID[2];
var int PouChID[2];
var int CamouflageID[2];
var int CurBodyID;
var int CurFaceID;
var int CurHelmetID;
var int CurAccessoryID;
var int CurBackPackID;
var int CurPouchID;
var int CurCamouflageID;
var int TeamIndex;
var int weaponID;
var int WeaponPartsID;
var int WeaponPaintID;
var int WeaponType;
var wSkinShell wParts[4];
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
    wLightModel = Spawn(Class'Engine.wSkinShell');
    wLightModel.SetDrawType(8);
    wLightModel.SetStaticMesh(Level.GameMgr.GetItemResourceStaticMesh(20016, true));
    wLightModel.SetBase(none);
    wLightModel.SetOwner(none);
    wLightModel.bAnimByOwner = false;
    //return;    
}

simulated function Destroyed()
{
    EndModel();
    //return;    
}

function LoadSetModelData()
{
    PawnRot.Yaw = int(RotY);
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
    //return;    
}

function ChangeEquipItem(wGameManager GameMgr)
{
    local int iBodyID[2], iFaceID, iHelmetID, iAccessoryID, iBackPackID, iPouchID,
	    iCamouflageID;

    local wPartsGroupParam tmPParam;

    iBodyID[0] = GameMgr.FindInstanceItemIDBySlotPos(int(21));
    // End:0x37
    if(iBodyID[0] <= 0)
    {
        iBodyID[0] = default.BodyID[0];
    }
    iBodyID[1] = GameMgr.FindInstanceItemIDBySlotPos(int(22));
    // End:0x6E
    if(iBodyID[1] <= 0)
    {
        iBodyID[1] = default.BodyID[1];
    }
    // End:0xF7
    if(iBodyID[0] != default.BodyID[0])
    {
        tmPParam = Level.GameMgr.GetDefaultAddPartsGroupParam(iBodyID[0]);
        iFaceID[0] = -1;
        iHelmetID[0] = -1;
        iAccessoryID[0] = -1;
        iBackPackID[0] = -1;
        iPouchID[0] = -1;
        iCamouflageID[0] = -1;        
    }
    else
    {
        iHelmetID[0] = GameMgr.FindInstanceItemIDBySlotPos(int(18));
        // End:0x12E
        if(iHelmetID[0] <= 0)
        {
            iHelmetID[0] = default.HelmetID[0];
        }
        iAccessoryID[0] = GameMgr.FindInstanceItemIDBySlotPos(int(19));
        // End:0x165
        if(iAccessoryID[0] <= 0)
        {
            iAccessoryID[0] = default.FaceID[0];
        }
        iBackPackID[0] = GameMgr.FindInstanceItemIDBySlotPos(int(20));
        // End:0x19C
        if(iBackPackID[0] <= 0)
        {
            iBackPackID[0] = default.AccessoryID[0];
        }
        iPouchID[0] = GameMgr.FindInstanceItemIDBySlotPos(int(24));
        // End:0x1D3
        if(iPouchID[0] <= 0)
        {
            iPouchID[0] = default.PouChID[0];
        }
        iCamouflageID[0] = GameMgr.FindInstanceItemIDBySlotPos(int(25));
        // End:0x20A
        if(iCamouflageID[0] <= 0)
        {
            iCamouflageID[0] = default.CamouflageID[0];
        }
    }
    // End:0x293
    if(iBodyID[1] != default.BodyID[1])
    {
        tmPParam = Level.GameMgr.GetDefaultAddPartsGroupParam(iBodyID[1]);
        iFaceID[1] = -1;
        iHelmetID[1] = -1;
        iAccessoryID[1] = -1;
        iBackPackID[1] = -1;
        iPouchID[1] = -1;
        iCamouflageID[1] = -1;        
    }
    else
    {
        iHelmetID[1] = GameMgr.FindInstanceItemIDBySlotPos(int(18));
        // End:0x2CA
        if(iHelmetID[1] <= 0)
        {
            iHelmetID[1] = default.HelmetID[0];
        }
        iAccessoryID[1] = GameMgr.FindInstanceItemIDBySlotPos(int(19));
        // End:0x301
        if(iAccessoryID[1] <= 0)
        {
            iAccessoryID[1] = default.FaceID[0];
        }
        iBackPackID[1] = GameMgr.FindInstanceItemIDBySlotPos(int(20));
        // End:0x338
        if(iBackPackID[1] <= 0)
        {
            iBackPackID[1] = default.AccessoryID[0];
        }
        iPouchID[1] = GameMgr.FindInstanceItemIDBySlotPos(int(24));
        // End:0x36F
        if(iPouchID[1] <= 0)
        {
            iPouchID[1] = default.PouChID[1];
        }
        iCamouflageID[1] = GameMgr.FindInstanceItemIDBySlotPos(int(25));
        // End:0x3A6
        if(iCamouflageID[1] <= 0)
        {
            iCamouflageID[1] = default.CamouflageID[1];
        }
    }
    ChangeEquipItemByID(iBodyID[0], iBodyID[1], iHelmetID[0], iHelmetID[1], iAccessoryID[0], iAccessoryID[1], iBackPackID[0], iBackPackID[1], iPouchID[0], iPouchID[1], iCamouflageID[0], iCamouflageID[1]);
    PlayAnimByParams();
    //return;    
}

function ChangeEquipItemByItemID(int HelmetItemID, int AcceItemID, int BackpackItemID, int PouchItemID, int CamouflageItemID, int AF_ItemID, int RSA_ItemID)
{
    local int iBodyID[2], iFaceID, iHelmetID, iAccessoryID, iBackPackID, iPouchID,
	    iCamouflageID;

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
    // End:0xB4
    if(iBodyID[0] != default.BodyID[0])
    {
        tmPParam = Level.GameMgr.GetDefaultAddPartsGroupParam(iBodyID[0]);
        iFaceID[0] = -1;
        iHelmetID[0] = -1;
        iAccessoryID[0] = -1;        
    }
    else
    {
        iHelmetID[0] = HelmetItemID;
        // End:0xDD
        if(iHelmetID[0] <= 0)
        {
            iHelmetID[0] = default.HelmetID[0];
        }
        iAccessoryID[0] = AcceItemID;
        // End:0x106
        if(iAccessoryID[0] <= 0)
        {
            iAccessoryID[0] = default.AccessoryID[0];
        }
        iBackPackID[0] = BackpackItemID;
        // End:0x12F
        if(iBackPackID[0] <= 0)
        {
            iBackPackID[0] = default.BackPackID[0];
        }
        iPouchID[0] = PouchItemID;
        // End:0x158
        if(iPouchID[0] <= 0)
        {
            iPouchID[0] = default.PouChID[0];
        }
        iCamouflageID[0] = CamouflageItemID;
        // End:0x181
        if(iCamouflageID[0] <= 0)
        {
            iCamouflageID[0] = default.CamouflageID[0];
        }
    }
    // End:0x1E3
    if(iBodyID[1] != default.BodyID[1])
    {
        tmPParam = Level.GameMgr.GetDefaultAddPartsGroupParam(iBodyID[1]);
        iFaceID[1] = -1;
        iHelmetID[1] = -1;
        iAccessoryID[1] = -1;        
    }
    else
    {
        iHelmetID[1] = HelmetItemID;
        // End:0x20C
        if(iHelmetID[1] <= 0)
        {
            iHelmetID[1] = default.HelmetID[0];
        }
        iAccessoryID[1] = AcceItemID;
        // End:0x235
        if(iAccessoryID[1] <= 0)
        {
            iAccessoryID[1] = default.AccessoryID[0];
        }
        iBackPackID[1] = BackpackItemID;
        // End:0x25E
        if(iBackPackID[1] <= 0)
        {
            iBackPackID[1] = default.BackPackID[0];
        }
        iPouchID[1] = PouchItemID;
        // End:0x287
        if(iPouchID[1] <= 0)
        {
            iPouchID[1] = default.PouChID[0];
        }
        iCamouflageID[1] = CamouflageItemID;
        // End:0x2B0
        if(iCamouflageID[1] <= 0)
        {
            iCamouflageID[1] = default.CamouflageID[0];
        }
    }
    ChangeEquipItemByID(iBodyID[0], iBodyID[1], iHelmetID[0], iHelmetID[1], iAccessoryID[0], iAccessoryID[1], iBackPackID[0], iBackPackID[1], iPouchID[0], iPouchID[1], iCamouflageID[0], iCamouflageID[1]);
    PlayAnimByParams();
    //return;    
}

function ForceChangeWeapon()
{
    local int W[2];

    W[0] = weaponID;
    W[1] = WeaponPartsID;
    weaponID = -1;
    WeaponPartsID = -1;
    ChangeWeapon(W[0], W[1], WeaponPaintID);
    //return;    
}

function ChangeEquipItemByID(int iBodyID_0, int iBodyID_1, int iHelmetID_0, int iHelmetID_1, int iAccessoryID_0, int iAccessoryID_1, int iBackPackID_0, int iBackPackID_1, int iPouchID_0, int iPouchID_1, int iCamouflageID_0, int iCamouflageID_1)
{
    local wItemBoxHK ItemInfo;

    // End:0x42
    if((iBodyID_0 > 0) && BodyID[0] != iBodyID_0)
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
    if((iBodyID_1 > 0) && BodyID[1] != iBodyID_1)
    {
        BodyID[1] = iBodyID_1;
        // End:0x84
        if(TeamIndex == 1)
        {
            ForceChangeEquipItems();
            ForceChangeWeapon();
        }
    }
    // End:0xA2
    if(HelmetID[0] != iHelmetID_0)
    {
        HelmetID[0] = iHelmetID_0;
    }
    // End:0xC0
    if(HelmetID[1] != iHelmetID_1)
    {
        HelmetID[1] = iHelmetID_1;
    }
    // End:0xDC
    if(HelmetID[TeamIndex] != CurHelmetID)
    {
        SetParts(1);
    }
    // End:0xFA
    if(AccessoryID[0] != iAccessoryID_0)
    {
        AccessoryID[0] = iAccessoryID_0;
    }
    // End:0x118
    if(AccessoryID[1] != iAccessoryID_1)
    {
        AccessoryID[1] = iAccessoryID_1;
    }
    // End:0x135
    if(AccessoryID[TeamIndex] != CurAccessoryID)
    {
        SetParts(2);
    }
    // End:0x153
    if(BackPackID[0] != iBackPackID_0)
    {
        BackPackID[0] = iBackPackID_0;
    }
    // End:0x171
    if(BackPackID[1] != iBackPackID_1)
    {
        BackPackID[1] = iBackPackID_1;
    }
    // End:0x18E
    if(BackPackID[TeamIndex] != CurBackPackID)
    {
        SetParts(3);
    }
    // End:0x1AC
    if(PouChID[0] != iPouchID_0)
    {
        PouChID[0] = iPouchID_0;
    }
    // End:0x1CA
    if(PouChID[1] != iPouchID_1)
    {
        PouChID[1] = iPouchID_1;
    }
    // End:0x1E7
    if(PouChID[TeamIndex] != CurPouchID)
    {
        SetParts(4);
    }
    // End:0x205
    if(CamouflageID[0] != iCamouflageID_0)
    {
        CamouflageID[0] = iCamouflageID_0;
    }
    // End:0x223
    if(CamouflageID[1] != iCamouflageID_1)
    {
        CamouflageID[1] = iCamouflageID_1;
    }
    // End:0x250
    if(CamouflageID[TeamIndex] != CurCamouflageID)
    {
        SetCamouflage(CamouflageID[TeamIndex], byte(TeamIndex));
    }
    //return;    
}

function ForceChangeEquipItems()
{
    local int i;

    SetCamouflage(CamouflageID[TeamIndex], byte(TeamIndex));
    i = 0;
    J0x1F:

    // End:0x43 [Loop If]
    if(i < (4 + 1))
    {
        SetParts(i);
        i++;
        // [Loop Continue]
        goto J0x1F;
    }
    //return;    
}

function SetCamouflage(int iItemID, byte byTeam)
{
    local Material mt;
    local wItemResourceParam cResParam;
    local wGameManager GM;
    local wItemBoxHK ItemInfo;
    local string strName;

    ItemInfo = Level.GameMgr.FindUIItem(BodyID[TeamIndex]);
    // End:0x55
    if((ItemInfo != none) && ItemInfo.ItemType == 11)
    {
        Skins.Length = 0;
        return;
    }
    // End:0x75
    if(iItemID <= 0)
    {
        Skins.Length = 0;
        CurCamouflageID = iItemID;
        return;
    }
    GM = Level.GameMgr;
    cResParam = GM.GetItemResourceParam(BodyID[TeamIndex]);
    // End:0xCD
    if(int(byTeam) == 0)
    {
        strName = cResParam.strRes_3rd_AF_Backpack;        
    }
    else
    {
        strName = cResParam.strRes_3rd_RSA_Backpack;
    }
    cResParam = GM.GetItemResourceParam(iItemID);
    // End:0x121
    if(cResParam != none)
    {
        strName = strName $ cResParam.strRes_3rd_AF_Backpack;
    }
    // End:0x178
    if(int(byTeam) == 0)
    {
        // End:0x175
        if((cResParam.mesh_Base_3rd == none) && Len(strName) > 1)
        {
            mt = Material(GM.DynamicLoadObject(strName, Class'Engine.Material'));
        }        
    }
    else
    {
        // End:0x1BF
        if((cResParam.mesh_Base_3rd_RSA == none) && Len(strName) > 1)
        {
            mt = Material(GM.DynamicLoadObject(strName, Class'Engine.Material'));
        }
    }
    Skins[0] = mt;
    CurCamouflageID = CamouflageID[int(byTeam)];
    //return;    
}

function SetParts(int iType)
{
    local wGameManager GM;
    local int iTemp;
    local wItemBoxHK ItemInfo;

    // End:0x1B
    if((iType < 0) || iType > 4)
    {
        return;
    }
    GM = Level.GameMgr;
    // End:0x91
    if(iType == 0)
    {
        LinkMesh(GM.GetItemResourceMesh(BodyID[TeamIndex], true, byte(TeamIndex)));
        SetBoneRotation('righthand', rot(32768, 16384, 16384), 0, 1.0000000);
        CurBodyID = BodyID[TeamIndex];
    }
    // End:0x231
    if(iType == 1)
    {
        iTemp = iType - 1;
        // End:0xEB
        if(wParts[iTemp] != none)
        {
            DetachFromBone(wParts[iTemp]);
            wParts[iTemp].Destroy();
            wParts[iTemp] = none;
        }
        // End:0x113
        if(HelmetID[TeamIndex] == -1)
        {
            CurHelmetID = HelmetID[TeamIndex];
            return;
        }
        CurHelmetID = HelmetID[TeamIndex];
        ItemInfo = Level.GameMgr.FindUIItem(BodyID[TeamIndex]);
        // End:0x171
        if((ItemInfo != none) && ItemInfo.ItemType == 11)
        {
            return;
        }
        wParts[iTemp] = Spawn(Class'Engine.wSkinShell', self);
        wParts[iTemp].SetDrawType(2);
        wParts[iTemp].LinkMesh(GM.GetItemResourceMesh(HelmetID[TeamIndex], true, byte(TeamIndex)));
        wParts[iTemp].SetBase(self);
        wParts[iTemp].SetOwner(self);
        // End:0x22E
        if(AttachToBone(wParts[iTemp], 'Main_Dummy') == false)
        {
            AttachToBone(wParts[iTemp], 'XXXX_Dummy');
        }        
    }
    else
    {
        // End:0x3CD
        if(iType == 2)
        {
            iTemp = iType - 1;
            // End:0x28C
            if(wParts[iTemp] != none)
            {
                DetachFromBone(wParts[iTemp]);
                wParts[iTemp].Destroy();
                wParts[iTemp] = none;
            }
            // End:0x2B4
            if(AccessoryID[TeamIndex] == -1)
            {
                CurAccessoryID = AccessoryID[TeamIndex];
                return;
            }
            CurAccessoryID = AccessoryID[TeamIndex];
            ItemInfo = Level.GameMgr.FindUIItem(BodyID[TeamIndex]);
            // End:0x312
            if((ItemInfo != none) && ItemInfo.ItemType == 11)
            {
                return;
            }
            wParts[iTemp] = Spawn(Class'Engine.wSkinShell', self);
            wParts[iTemp].SetDrawType(8);
            wParts[iTemp].SetStaticMesh(GM.GetItemResourceStaticMesh(AccessoryID[TeamIndex], true, byte(TeamIndex)));
            wParts[iTemp].SetBase(self);
            wParts[iTemp].SetOwner(self);
            wParts[iTemp].bAnimByOwner = false;
            AttachToBone(wParts[iTemp], 'Acce');            
        }
        else
        {
            // End:0x56E
            if(iType == 3)
            {
                iTemp = iType - 1;
                // End:0x428
                if(wParts[iTemp] != none)
                {
                    DetachFromBone(wParts[iTemp]);
                    wParts[iTemp].Destroy();
                    wParts[iTemp] = none;
                }
                // End:0x450
                if(BackPackID[TeamIndex] == -1)
                {
                    CurBackPackID = BackPackID[TeamIndex];
                    return;
                }
                CurBackPackID = BackPackID[TeamIndex];
                ItemInfo = Level.GameMgr.FindUIItem(BodyID[TeamIndex]);
                // End:0x4AE
                if((ItemInfo != none) && ItemInfo.ItemType == 11)
                {
                    return;
                }
                wParts[iTemp] = Spawn(Class'Engine.wSkinShell', self);
                wParts[iTemp].SetDrawType(2);
                wParts[iTemp].LinkMesh(GM.GetItemResourceMesh(BackPackID[TeamIndex], true, byte(TeamIndex)));
                wParts[iTemp].SetBase(self);
                wParts[iTemp].SetOwner(self);
                // End:0x56B
                if(AttachToBone(wParts[iTemp], 'Main_Dummy') == false)
                {
                    AttachToBone(wParts[iTemp], 'XXXX_Dummy');
                }                
            }
            else
            {
                // End:0x70C
                if(iType == 4)
                {
                    iTemp = iType - 1;
                    // End:0x5C9
                    if(wParts[iTemp] != none)
                    {
                        DetachFromBone(wParts[iTemp]);
                        wParts[iTemp].Destroy();
                        wParts[iTemp] = none;
                    }
                    // End:0x5F1
                    if(PouChID[TeamIndex] == -1)
                    {
                        CurPouchID = PouChID[TeamIndex];
                        return;
                    }
                    CurPouchID = PouChID[TeamIndex];
                    ItemInfo = Level.GameMgr.FindUIItem(BodyID[TeamIndex]);
                    // End:0x64F
                    if((ItemInfo != none) && ItemInfo.ItemType == 11)
                    {
                        return;
                    }
                    wParts[iTemp] = Spawn(Class'Engine.wSkinShell', self);
                    wParts[iTemp].SetDrawType(2);
                    wParts[iTemp].LinkMesh(GM.GetItemResourceMesh(PouChID[TeamIndex], true, byte(TeamIndex)));
                    wParts[iTemp].SetBase(self);
                    wParts[iTemp].SetOwner(self);
                    // End:0x70C
                    if(AttachToBone(wParts[iTemp], 'Main_Dummy') == false)
                    {
                        AttachToBone(wParts[iTemp], 'XXXX_Dummy');
                    }
                }
            }
        }
    }
    //return;    
}

function ChangeWeapon(int iWeaponID, optional int iPartsID, optional int iPaintingID)
{
    // End:0x66
    if((iWeaponID > 0) && weaponID != iWeaponID)
    {
        weaponID = iWeaponID;
        SetWeapon(weaponID, iPartsID);
        WeaponPartsID = iPartsID;
        WeaponPaintID = iPaintingID;
        SetWeaponParts(WeaponPartsID, iPaintingID);
        PlayAnimByParams();        
    }
    else
    {
        WeaponPartsID = iPartsID;
        WeaponPaintID = iPaintingID;
        SetWeaponParts(WeaponPartsID, iPaintingID);
    }
    //return;    
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
        if(int(tmParam.eType) == int(1))
        {
            WeaponType = 0;            
        }
        else
        {
            // End:0x8B
            if(int(tmParam.eType) == int(3))
            {
                WeaponType = 2;                
            }
            else
            {
                WeaponType = 4;
            }
        }
    }
    irParam = Level.GameMgr.GetItemResourceParam(weaponID);
    // End:0x11E
    if((irParam != none) && (irParam.Resource_UI_Weapon_Ani != "") && irParam.Resource_UI_Weapon_Ani != "-")
    {
        GetNameFromStr(irParam.Resource_UI_Weapon_Ani, tmName);
        PlayAnim(tmName, 1.0000000, 0.2000000);        
    }
    else
    {
        Log(((("[BTROModelNew::PlayAnimByParams] Type = " $ string(WeaponType)) $ "(") $ string(AnimNames[WeaponType])) $ ")");
        PlayAnim(NoHaveWeaponIdle, 1.0000000, 0.2000000);
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

function ChangeWeaponsPaints(int iPaintID)
{
    // End:0x2A
    if(WeaponPaintID != iPaintID)
    {
        WeaponPaintID = iPaintID;
        SetWeaponParts(WeaponPartsID, iPaintID);
    }
    //return;    
}

function SetWeapon(int iWeaponID, int iPartsID)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x6E [Loop If]
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
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    // End:0x97
    if(wWeapon != none)
    {
        DetachFromBone(wWeapon);
        wWeapon.Destroy();
        wWeapon = none;
    }
    wWeapon = Spawn(Class'Engine.wSkinShell');
    wWeapon.SetDrawType(2);
    wWeapon.LinkMesh(Level.GameMgr.GetItemResourceMesh(weaponID, true));
    wWeapon.SetBase(self);
    wWeapon.SetOwner(self);
    wWeapon.bAnimByOwner = false;
    AttachToBone(wWeapon, 'righthand');
    WeaponPartsID = iPartsID;
    SetWeaponParts(WeaponPartsID);
    //return;    
}

function DeleteWeapone()
{
    // End:0x1D
    if(wWeapon != none)
    {
        DetachFromBone(wWeapon);
        weaponID = 0;
    }
    //return;    
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
    iSightPartID = iPartsID & 1023;
    iBarrelPartID = iPartsID & 130048;
    iSilencerPartID = iPartsID & 16646144;
    iGunstockPartID = iPartsID & 2130706432;
    wcip = Level.GameMgr.GetWeaponCustomInfoParam(weaponID);
    // End:0xF9
    if((wcip.iItemID <= 0) || wcip.iItemID != weaponID)
    {
        return;
    }
    // End:0x29E
    if(iSightPartID > 1)
    {
        wcpp = Level.GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iSightPartID);
        // End:0x29B
        if((wcpp.iItemID > 0) && wcpp.iPartID == iSightPartID)
        {
            iSubSightPartItemID = wcip.iSightOnAddItemID;
            ItemResParam = Level.GameMgr.GetItemResourceParam(wcpp.iItemID);
            // End:0x29B
            if(ItemResParam.iItemResourceID != -1)
            {
                wWeaponParts[0] = Spawn(Class'Engine.wSkinShell');
                wWeaponParts[0].SetDrawType(8);
                wWeaponParts[0].SetStaticMesh(Level.GameMgr.GetItemResourceStaticMesh(wcpp.iItemID, true));
                wWeaponParts[0].SetBase(self);
                wWeaponParts[0].SetOwner(self);
                wWeaponParts[0].bAnimByOwner = false;
                // End:0x280
                if(Len(ItemResParam.strRes_3rd_AF_Gore) > 1)
                {
                    wWeaponParts[0].Skins[0] = Material(DynamicLoadObject(ItemResParam.strRes_3rd_AF_Gore, Class'Engine.Material'));
                }
                wWeapon.AttachToBone(wWeaponParts[0], 'Sight');
            }
        }        
    }
    else
    {
        iSubSightPartItemID = wcip.iSightOffAddItemID;
    }
    // End:0x3E5
    if(iSubSightPartItemID > 0)
    {
        ItemResParam = Level.GameMgr.GetItemResourceParam(iSubSightPartItemID);
        // End:0x3E5
        if(ItemResParam.iItemResourceID != -1)
        {
            wWeaponParts[2] = Spawn(Class'Engine.wSkinShell');
            wWeaponParts[2].SetDrawType(8);
            wWeaponParts[2].SetStaticMesh(Level.GameMgr.GetItemResourceStaticMesh(iSubSightPartItemID, true));
            wWeaponParts[2].SetBase(self);
            wWeaponParts[2].SetOwner(self);
            wWeaponParts[2].bAnimByOwner = false;
            // End:0x3C9
            if(Len(ItemResParam.strRes_3rd_AF_Gore) > 1)
            {
                wWeaponParts[2].Skins[0] = Material(DynamicLoadObject(ItemResParam.strRes_3rd_AF_Gore, Class'Engine.Material'));
            }
            wWeapon.AttachToBone(wWeaponParts[2], 'Sight');
        }
    }
    // End:0x577
    if(iSilencerPartID > (1 << 17))
    {
        wcpp = Level.GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iSilencerPartID);
        // End:0x577
        if((wcpp.iItemID > 0) && wcpp.iPartID == iSilencerPartID)
        {
            ItemResParam = Level.GameMgr.GetItemResourceParam(wcpp.iItemID);
            // End:0x577
            if(ItemResParam.iItemResourceID != -1)
            {
                wWeaponParts[1] = Spawn(Class'Engine.wSkinShell');
                wWeaponParts[1].SetDrawType(8);
                wWeaponParts[1].SetStaticMesh(Level.GameMgr.GetItemResourceStaticMesh(wcpp.iItemID, true));
                wWeaponParts[1].SetBase(self);
                wWeaponParts[1].SetOwner(self);
                wWeaponParts[1].bAnimByOwner = false;
                // End:0x55C
                if(Len(ItemResParam.strRes_3rd_AF_Gore) > 1)
                {
                    wWeaponParts[1].Skins[0] = Material(DynamicLoadObject(ItemResParam.strRes_3rd_AF_Gore, Class'Engine.Material'));
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
    // End:0x5DD
    if(iPaintingID > 0)
    {
        wWeapon.Skins[0] = Level.GameMgr.GetPartsGroupPainting(weaponID, iPartsID, true, iPaintingID);        
    }
    else
    {
        wWeapon.Skins.Length = 0;
    }
    //return;    
}

function EndModel()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x5E [Loop If]
    if(i < 4)
    {
        // End:0x54
        if(wParts[i] != none)
        {
            DetachFromBone(wParts[i]);
            wParts[i].Destroy();
            wParts[i] = none;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    i = 0;
    J0x65:

    // End:0xC5 [Loop If]
    if(i < 3)
    {
        // End:0xBB
        if(wWeaponParts[i] != none)
        {
            wWeapon.DetachFromBone(wWeaponParts[i]);
            wWeaponParts[i].Destroy();
            wWeaponParts[i] = none;
        }
        i++;
        // [Loop Continue]
        goto J0x65;
    }
    // End:0xE3
    if(wLightModel != none)
    {
        wLightModel.Destroy();
        wLightModel = none;
    }
    // End:0x10C
    if(wWeapon != none)
    {
        DetachFromBone(wWeapon);
        wWeapon.Destroy();
        wWeapon = none;
    }
    //return;    
}

function SetScaleModel(Vector scaleVector)
{
    //return;    
}

function bool Render(Canvas C, optional float Delta)
{
    local Vector saveLoc, LightPos;
    local Rotator saveRot;
    local Color color_light[5];
    local int i;
    local string strTemp;

    // End:0x0D
    if(Mesh == none)
    {
        return false;
    }
    C.GetCameraLocation(saveLoc, saveRot);
    SetRotation(PawnRot);
    SetLocation(pawnPos);
    C.SetCameraLocation(cameraPos);
    cameraDir = Normal(cameraDir);
    C.SetCameraRotation(Rotator(cameraDir));
    // End:0xCC
    if(TeamIndex == 0)
    {
        color_light[0] = LightColor_AF[0];
        color_light[1] = LightColor_AF[1];
        color_light[2] = LightColor_AF[2];
        color_light[3] = LightColor_AF[3];
        color_light[4] = LightColor_AF[4];        
    }
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

    // End:0x205 [Loop If]
    if(i < 5)
    {
        // End:0x1CC
        if(int(LightOnOff[i]) > 0)
        {
            LightPos[i] = MakeVector(LightPosToCenter[i] * Sin(Roll[i]), LightPosToCenter[i] * Cos(Roll[i]), lightHeight[i]);
            C.SetScreenLight(i, LightPos[i], color_light[i], lightDist[i]);
            // [Explicit Continue]
            goto J0x1FB;
        }
        C.SetScreenLight(i, LightPos[i], color_light[i], 0.0000000);
        J0x1FB:

        i++;
        // [Loop Continue]
        goto J0x124;
    }
    AspectRatio = 1.0000000;
    C.DrawScreenActorWithViewport(self, int(AWinPos.X1), int(AWinPos.Y1), int(AWinPos.X2), int(AWinPos.Y2), AspectRatio, 18.0000000, false, true);
    // End:0x71D
    if(bModifyLight)
    {
        C.DrawColor = Class'Engine.Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255));
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_n, 330.0000000, 90.0000000, 850.0000000, 250.0000000);
        Class'Engine.BTCustomDrawHK'.static.DrawString(C, ((("LightDist[" $ string(CurrentModifyLight)) $ "] = (") $ string(lightDist[CurrentModifyLight])) $ ")", 0, 9.0000000, 400.0000000, 110.0000000, 1000.0000000, 500.0000000);
        Class'Engine.BTCustomDrawHK'.static.DrawString(C, ((("Radius[" $ string(CurrentModifyLight)) $ "] = (") $ string(LightPosToCenter[CurrentModifyLight])) $ ")", 0, 9.0000000, 400.0000000, 125.0000000, 1000.0000000, 500.0000000);
        Class'Engine.BTCustomDrawHK'.static.DrawString(C, ((("Roll[" $ string(CurrentModifyLight)) $ "] = (") $ string(Roll[CurrentModifyLight])) $ ")", 0, 9.0000000, 400.0000000, 140.0000000, 1000.0000000, 500.0000000);
        Class'Engine.BTCustomDrawHK'.static.DrawString(C, ((("LightHeight[" $ string(CurrentModifyLight)) $ "] = (") $ string(lightHeight[CurrentModifyLight])) $ ")", 0, 9.0000000, 400.0000000, 155.0000000, 1000.0000000, 500.0000000);
        Class'Engine.BTCustomDrawHK'.static.DrawString(C, ((((((("LightColorAF[" $ string(CurrentModifyLight)) $ "] = (") $ string(LightColor_AF[CurrentModifyLight].R)) $ ", ") $ string(LightColor_AF[CurrentModifyLight].G)) $ ", ") $ string(LightColor_AF[CurrentModifyLight].B)) $ ")", 0, 9.0000000, 400.0000000, 170.0000000, 1000.0000000, 500.0000000);
        Class'Engine.BTCustomDrawHK'.static.DrawString(C, ((((((("LightColorRSA[" $ string(CurrentModifyLight)) $ "] = (") $ string(LightColor_RSA[CurrentModifyLight].R)) $ ", ") $ string(LightColor_RSA[CurrentModifyLight].G)) $ ", ") $ string(LightColor_RSA[CurrentModifyLight].B)) $ ")", 0, 9.0000000, 400.0000000, 185.0000000, 1000.0000000, 500.0000000);
        Class'Engine.BTCustomDrawHK'.static.DrawString(C, "LightIndex = " $ string(CurrentModifyLight + 1), 0, 9.0000000, 400.0000000, 200.0000000, 1000.0000000, 500.0000000);
        strTemp = "LightOn/Off = ";
        i = 0;
        J0x5E9:

        // End:0x64B [Loop If]
        if(i < 5)
        {
            // End:0x629
            if(int(LightOnOff[i]) > 0)
            {
                strTemp $= (("(" $ string(i + 1)) $ ") ");
                // [Explicit Continue]
                goto J0x641;
            }
            strTemp $= (string(i + 1) $ " ");
            J0x641:

            i++;
            // [Loop Continue]
            goto J0x5E9;
        }
        Class'Engine.BTCustomDrawHK'.static.DrawString(C, strTemp, 0, 9.0000000, 400.0000000, 215.0000000, 1000.0000000, 500.0000000);
        i = 0;
        J0x686:

        // End:0x71D [Loop If]
        if(i < 5)
        {
            // End:0x713
            if(int(LightOnOff[i]) > 0)
            {
                wLightModel.SetLocation(LightPos[i] + pawnPos);
                C.DrawScreenActorWithViewport(wLightModel, int(AWinPos.X1), int(AWinPos.Y1), int(AWinPos.X2), int(AWinPos.Y2), AspectRatio, 18.0000000, false, false);
            }
            i++;
            // [Loop Continue]
            goto J0x686;
        }
    }
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
    PlayAnimByParams();
    //return;    
}

defaultproperties
{
    cameraDir=(X=0.9990140,Y=0.0000000,Z=0.0444010)
    AnimNames[0]="UI_AR_G3"
    AnimNames[1]="UI_AR_Rest"
    AnimNames[2]="UI_SMG_UZI"
    AnimNames[3]="UI_SMG_Rest"
    AnimNames[4]="UI_SR_M24"
    AnimNames[5]="UI_SR_Rest"
    BodyID[0]=15000
    BodyID[1]=15000
    FaceID[0]=-1
    FaceID[1]=-1
    HelmetID[0]=-1
    HelmetID[1]=-1
    AccessoryID[0]=-1
    AccessoryID[1]=-1
    BackPackID[0]=-1
    BackPackID[1]=-1
    PouChID[0]=-1
    PouChID[1]=-1
    CamouflageID[0]=-1
    CamouflageID[1]=-1
    dir_light0=(X=-100.0000000,Y=-100.0000000,Z=100.0000000)
    dir_light1=(X=10.0000000,Y=100.0000000,Z=0.0000000)
    PosX=-240.0000000
    posZ=2.5000000
    RotY=32768.0000000
    LightDistance0=1000.0000000
    LightDistance1=1000.0000000
    LightDistance2=1000.0000000
    LightAngle0=23.1499329
    LightAngle1=10.1500206
    LightAngle2=19.5999870
    LightColor0_R=200
    LightColor0_G=200
    LightColor0_B=200
    LightColor1_R=150
    LightColor1_G=150
    LightColor1_B=150
    cameraPos=(X=-240.0000000,Y=0.0000000,Z=2.5000000)
    LightOnOff[0]=1
    LightOnOff[1]=1
    LightOnOff[2]=1
    LightOnOff[3]=1
    LightOnOff[4]=1
    LightPosToCenter[0]=200.0000000
    LightPosToCenter[1]=122.0000000
    LightPosToCenter[2]=29.0000000
    LightPosToCenter[3]=145.0000000
    LightPosToCenter[4]=54.0000000
    Roll[0]=54.7999001
    Roll[1]=-3.0000000
    Roll[2]=19.8999996
    Roll[3]=-0.1000000
    Roll[4]=-5.6999998
    lightDist[0]=252.0000000
    lightDist[1]=210.0000000
    lightDist[2]=218.0000000
    lightDist[3]=200.0000000
    lightDist[4]=110.0000000
    lightHeight[0]=100.0000000
    lightHeight[1]=128.0000000
    lightHeight[2]=184.0000000
    lightHeight[3]=-43.0000000
    lightHeight[4]=18.0000000
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
    NoHaveWeaponIdle="UI_HAND"
    DrawType=2
    RemoteRole=0
    bForceSkelUpdate=true
}