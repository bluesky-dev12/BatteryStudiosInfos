class wCharacterManager extends Object
    native;

struct native init PlayerPartsInfo
{
    var int iIndex;
    var int iID;
    var int iType;
    var string strName;
    var string strMeshName;
    var string strTexName;
    var float fSpHp;
    var float fSpDp;
    var float fSpStm;
    var float fSpSpeed;
    var float fSpEtc;
};

struct PlayerSet
{
    var string strBodyName;
    var string strHeadName;
    var string strHelmetName;
    var string strBackpackName;
};

struct native init PlayerProperty
{
    var string Name;
    var int Level;
    var float Exp;
    var wInventory Inven;
    var wSkills Skills;
};

var int iTest;
var editinline wMyPlayerStatus MyPlayer;
var array<PlayerProperty> BasePlayers;
var array<PlayerPartsInfo> PartsInfoRecords;

// Export UwCharacterManager::execGet(FFrame&, void* const)
native static final function Get(Actor P)
{
    //native.P;        
}

// Export UwCharacterManager::execInitNative(FFrame&, void* const)
native static final function InitNative();

event InitScript()
{
    LoadPartsData();
    LoadCacheMoveParam();
    //return;    
}

event DestroyScript()
{
    //return;    
}

final function wMyPlayerStatus GetMyStatus()
{
    return MyPlayer;
    //return;    
}

final function PlayerSet GetPlayerSetTest(string TestName)
{
    local PlayerSet Result;
    local PlayerPartsInfo BodyParts, HeadParts, HelmetParts, BackpackParts;

    // End:0x12
    if(PartsInfoRecords.Length == 0)
    {
        LoadPartsData();
    }
    switch(TestName)
    {
        // End:0x6B
        case "B-Camo":
            BodyParts = GetPartsById(10002);
            HeadParts = GetPartsById(20002);
            HelmetParts = GetPartsById(30002);
            BackpackParts = GetPartsById(40002);
            // End:0x259
            break;
        // End:0xBF
        case "B-Normal":
            BodyParts = GetPartsById(10001);
            HeadParts = GetPartsById(20001);
            HelmetParts = GetPartsById(30001);
            BackpackParts = GetPartsById(40001);
            // End:0x259
            break;
        // End:0x113
        case "B-Camo02":
            BodyParts = GetPartsById(10003);
            HeadParts = GetPartsById(20003);
            HelmetParts = GetPartsById(30003);
            BackpackParts = GetPartsById(40003);
            // End:0x259
            break;
        // End:0x120
        case "A-Normal":
        // End:0x176
        case "A-Normal02":
            BodyParts = GetPartsById(10004);
            HeadParts = GetPartsById(20004);
            HelmetParts = GetPartsById(30004);
            BackpackParts = GetPartsById(40004);
            // End:0x259
            break;
        // End:0x183
        case "B-Normal":
        // End:0x1D9
        case "B-Normal02":
            BodyParts = GetPartsById(10005);
            HeadParts = GetPartsById(20005);
            HelmetParts = GetPartsById(30005);
            BackpackParts = GetPartsById(40005);
            // End:0x259
            break;
        // End:0x1E4
        case "A-Camo":
        // End:0x1F1
        case "A-Camo02":
        // End:0x1FF
        case "B-Camo_NH":
        // End:0x20F
        case "B-Normal_NH":
        // End:0xFFFF
        default:
            BodyParts = GetPartsById(10000);
            HeadParts = GetPartsById(20000);
            HelmetParts = GetPartsById(30000);
            BackpackParts = GetPartsById(40000);
            // End:0x259
            break;
            break;
    }
    Result.strBodyName = BodyParts.strMeshName;
    Result.strHeadName = HeadParts.strMeshName;
    Result.strHelmetName = HelmetParts.strMeshName;
    Result.strBackpackName = BackpackParts.strMeshName;
    return Result;
    //return;    
}

final function PlayerPartsInfo GetPartsById(int iID)
{
    local PlayerPartsInfo Result;
    local int i;

    i = 0;
    J0x07:

    // End:0x4F [Loop If]
    if(i < PartsInfoRecords.Length)
    {
        // End:0x45
        if(PartsInfoRecords[i].iID == iID)
        {
            Result = PartsInfoRecords[i];
            // [Explicit Break]
            goto J0x4F;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    J0x4F:

    return Result;
    //return;    
}

function LoadPartsData()
{
    local BTNetPlayerData PlayerData;
    local bool bResult;
    local float fValue;
    local int iIndex, ilength;
    local PlayerPartsInfo Info;

    // End:0x0E
    if(PartsInfoRecords.Length > 0)
    {
        return;
    }
    PlayerData = new Class'BTData.BTNetPlayerData';
    bResult = PlayerData.LoadPlayerPartsData();
    // End:0x41
    if(bResult == false)
    {
        return;
    }
    fValue = 0.0000000;
    iIndex = 0;
    J0x53:

    // End:0x318 [Loop If]
    if(fValue != float(99999))
    {
        Info.iIndex = iIndex;
        Info.iID = int(PlayerData.getData("PartsTest", "id", iIndex));
        Info.iType = int(PlayerData.getData("PartsTest", "type", iIndex));
        Info.strName = PlayerData.getData("PartsTest", "name", iIndex);
        Info.strMeshName = PlayerData.getData("PartsTest", "mesh name", iIndex);
        Info.strTexName = PlayerData.getData("PartsTest", "texture name", iIndex);
        Info.fSpHp = float(PlayerData.getData("PartsTest", "add hp", iIndex));
        Info.fSpDp = float(PlayerData.getData("PartsTest", "add dp", iIndex));
        Info.fSpStm = float(PlayerData.getData("PartsTest", "add stm", iIndex));
        Info.fSpSpeed = float(PlayerData.getData("PartsTest", "add speed", iIndex));
        Info.fSpEtc = float(PlayerData.getData("PartsTest", "add etc", iIndex));
        Info.fSpEtc = float(PlayerData.getData("PartsTest", "add etc", iIndex));
        // End:0x2D3
        if(Info.iID == 99999)
        {
            fValue = 99999.0000000;
            // [Explicit Break]
            goto J0x318;
        }
        ilength = PartsInfoRecords.Length;
        // End:0x2F1
        if(ilength > 0)
        {
            ilength--;
        }
        PartsInfoRecords.Insert(ilength, 1);
        PartsInfoRecords[ilength] = Info;
        iIndex++;
        // [Loop Continue]
        goto J0x53;
    }
    J0x318:

    //return;    
}

function LoadCacheMoveParam()
{
    // End:0x0D
    if(MyPlayer == none)
    {
        return;
    }
    MyPlayer.SprintSpeed = 570.0000000;
    MyPlayer.RunSpeed = 370.0000000;
    MyPlayer.CrouchSpeed = 252.0000000;
    MyPlayer.PronedSpeed = 100.0000000;
    MyPlayer.AimRunSpeed = 180.0000000;
    MyPlayer.AimCrouchSpeed = 120.0000000;
    MyPlayer.F_DiagmoveRatio = 0.9800000;
    MyPlayer.SideMoveRatio = 0.8000000;
    MyPlayer.B_DiagmoveRatio = 0.8000000;
    MyPlayer.BackMoveRatio = 0.7000000;
    MyPlayer.AccelRate = 1500.0000000;
    MyPlayer.JumpMaxAcc = 560.0000000;
    MyPlayer.JumpMinAcc = 300.0000000;
    MyPlayer.JumpReduceRate = 0.0000000;
    MyPlayer.JumpRecoverRate = 200.0000000;
    MyPlayer.Land_Dropspeed_Rate = 0.0000000;
    MyPlayer.ProneCam_MaxPicth = 10000.0000000;
    MyPlayer.ProneCam_MaxYaw = 10000.0000000;
    MyPlayer.ProneCam_RotSpeed = 10.0000000;
    MyPlayer.Stm_MaxTime = 8.0000000;
    MyPlayer.Stm_Delay_Stand = 0.0000000;
    MyPlayer.Stm_Delay_Crouch = 0.0000000;
    MyPlayer.Stm_Delay_Hit = 0.0000000;
    MyPlayer.Lean_L_Stand_0.Yaw = -1000;
    MyPlayer.Lean_L_Stand_0.Roll = 500;
    MyPlayer.Lean_L_Stand_0.Pitch = -1000;
    MyPlayer.Lean_L_Stand_1.Yaw = -1000;
    MyPlayer.Lean_L_Stand_1.Roll = 500;
    MyPlayer.Lean_L_Stand_1.Pitch = -1000;
    MyPlayer.Lean_L_Stand_2.Yaw = -1000;
    MyPlayer.Lean_L_Stand_2.Roll = 500;
    MyPlayer.Lean_L_Stand_2.Pitch = -1000;
    MyPlayer.Lean_R_Stand_0.Yaw = 800;
    MyPlayer.Lean_R_Stand_0.Roll = -100;
    MyPlayer.Lean_R_Stand_0.Pitch = 800;
    MyPlayer.Lean_R_Stand_1.Yaw = 800;
    MyPlayer.Lean_R_Stand_1.Roll = -400;
    MyPlayer.Lean_R_Stand_1.Pitch = 800;
    MyPlayer.Lean_R_Stand_2.Yaw = 800;
    MyPlayer.Lean_R_Stand_2.Roll = -400;
    MyPlayer.Lean_R_Stand_2.Pitch = 800;
    MyPlayer.Lean_L_Crouch_0.Yaw = -1000;
    MyPlayer.Lean_L_Crouch_0.Roll = 300;
    MyPlayer.Lean_L_Crouch_0.Pitch = -1000;
    MyPlayer.Lean_L_Crouch_1.Yaw = -1000;
    MyPlayer.Lean_L_Crouch_1.Roll = 300;
    MyPlayer.Lean_L_Crouch_1.Pitch = -1000;
    MyPlayer.Lean_L_Crouch_2.Yaw = -1000;
    MyPlayer.Lean_L_Crouch_2.Roll = 300;
    MyPlayer.Lean_L_Crouch_2.Pitch = -1000;
    MyPlayer.Lean_R_Crouch_0.Yaw = 1000;
    MyPlayer.Lean_R_Crouch_0.Roll = -500;
    MyPlayer.Lean_R_Crouch_0.Pitch = 1000;
    MyPlayer.Lean_R_Crouch_1.Yaw = 1000;
    MyPlayer.Lean_R_Crouch_1.Roll = -500;
    MyPlayer.Lean_R_Crouch_1.Pitch = 1000;
    MyPlayer.Lean_R_Crouch_2.Yaw = 1000;
    MyPlayer.Lean_R_Crouch_2.Roll = -500;
    MyPlayer.Lean_R_Crouch_2.Pitch = 1000;
    MyPlayer.Lean_L_Prone_0.Yaw = 0;
    MyPlayer.Lean_L_Prone_0.Roll = 0;
    MyPlayer.Lean_L_Prone_0.Pitch = -3000;
    MyPlayer.Lean_L_Prone_1.Yaw = 0;
    MyPlayer.Lean_L_Prone_1.Roll = 0;
    MyPlayer.Lean_L_Prone_1.Pitch = -2000;
    MyPlayer.Lean_L_Prone_2.Yaw = 0;
    MyPlayer.Lean_L_Prone_2.Roll = 1500;
    MyPlayer.Lean_L_Prone_2.Pitch = 1000;
    MyPlayer.Lean_R_Prone_0.Yaw = 0;
    MyPlayer.Lean_R_Prone_0.Roll = 0;
    MyPlayer.Lean_R_Prone_0.Pitch = 2000;
    MyPlayer.Lean_R_Prone_1.Yaw = 0;
    MyPlayer.Lean_R_Prone_1.Roll = 0;
    MyPlayer.Lean_R_Prone_1.Pitch = 1000;
    MyPlayer.Lean_R_Prone_2.Yaw = 0;
    MyPlayer.Lean_R_Prone_2.Roll = -1500;
    MyPlayer.Lean_R_Prone_2.Pitch = 1000;
    //return;    
}

event InitMyPlayer()
{
    // End:0x1A
    if(MyPlayer == none)
    {
        MyPlayer = new Class'Engine_Decompressed.wMyPlayerStatus';
    }
    //return;    
}

event AddBasePlayers()
{
    local int i;

    i = BasePlayers.Length;
    BasePlayers.Insert(i, 1);
    BasePlayers[i].Inven = new Class'Engine_Decompressed.wInventory';
    BasePlayers[i].Skills = new Class'Engine_Decompressed.wSkills';
    //return;    
}

event RemoveBasePlayers()
{
    local int i;

    i = BasePlayers.Length;
    // End:0x4E
    if(i > 0)
    {
        i--;
        BasePlayers[i].Inven = none;
        BasePlayers[i].Skills = none;
        BasePlayers.Remove(i, 1);
    }
    //return;    
}
