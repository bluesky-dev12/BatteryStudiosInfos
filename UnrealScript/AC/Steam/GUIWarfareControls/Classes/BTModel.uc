/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTModel.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:15
 *	Functions:8
 *
 *******************************************************************************/
class BTModel extends GUITabPanel
    editinlinenew
    instanced;

var wPawn PawnModel;
var wPlayer PlayerModel;
var Vector ModelOffset;
var Light ModelLight;
var Vector ModelLightOffset;
var Mesh ModelWeapon;
var Actor ModelWeaponActor;
var Rotator ModelDefaultRotation;
var Rotator ModelDeltaRotation;
var int ModelWeaponID;
var wWeapon wModelWeapon;
var int TeamClassIndex;
var array<string> TeamClass;
var Vector ModelDefaultOffset;
var Vector CamLocation;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    Log("[BTModel::InitComponent]");
    super(GUIPanel).InitComponent(MyController, myOwner);
    ModelOffset = ModelDefaultOffset;
}

event Opened(GUIComponent Sender)
{
    Log("[BTModel::Opened]");
    super(GUIMultiComponent).Opened(Sender);
    // End:0x58
    if(PawnModel != none)
    {
        PawnModel.SetLocation(ModelDefaultOffset);
        PawnModel.SetRotation(ModelDefaultRotation);
        ModelOffset = ModelDefaultOffset;
    }
}

function SetModelHead(int HeadID);
function bool InternalOnDraw(Canvas C)
{
    local Vector CamPos, X, Y, Z;
    local Rotator camRot;

    // End:0x27
    if(PawnModel == none)
    {
        PlayerModel = PlayerOwner().Spawn(class'wPlayer');
        SetModelTeam(0);
    }
    UpdateRotation();
    PawnModel.SetPhysics(0);
    PlayerOwner().RendMap = 5;
    C.SetCameraLocation(CamLocation);
    CamPos = CamLocation;
    camRot.Pitch = 0;
    camRot.Roll = 0;
    camRot.Yaw = 0;
    GetAxes(camRot, X, Y, Z);
    PawnModel.SetLocation(CamPos + ModelOffset);
    C.SetScreenLight(0, CamPos + MakeVector(300.0, 100.0, 300.0), C.MakeColor(byte(255), byte(255), byte(255), byte(255)), 1000.0);
    C.SetScreenLight(1, CamPos + MakeVector(-100.0, 300.0, 400.0), C.MakeColor(192, byte(145.60), 140, byte(255)), 1000.0);
    C.SetScreenLight(2, CamPos + MakeVector(-150.0, -500.0, -200.0), C.MakeColor(140, byte(189.6250), 192, byte(255)), 1000.0);
    C.DrawScreenActor(PawnModel);
    PawnModel.LoopAnim('UI_AR_AK47');
    return false;
}

function SetModelTeam(int idx)
{
    local bool hasOldR;
    local Rotator OldRotation;

    TeamClassIndex = idx;
    // End:0x3e
    if(PawnModel != none)
    {
        hasOldR = true;
        OldRotation = PawnModel.Rotation;
        PawnModel.Destroy();
    }
    PawnModel = PlayerModel.Spawn(class'wPawn');
    PlayerModel.SetPawnClass("WGame.wPawn", TeamClass[TeamClassIndex]);
    PlayerModel.PlayerReplicationInfo.Team.TeamIndex = TeamClassIndex;
    PlayerModel.Possess(PawnModel);
    // End:0xd3
    if(hasOldR)
    {
        PawnModel.SetRotation(OldRotation);
    }
    // End:0xe4
    else
    {
        PawnModel.SetRotation(ModelDefaultRotation);
    }
    PawnModel.SetPhysics(0);
    SetModelWeapon(ModelWeaponID);
}

function SetModelWeapon(int id)
{
    ModelWeaponID = id;
    // End:0x36
    if(wModelWeapon != none)
    {
        wModelWeapon.DetachFromPawn(PawnModel);
        wModelWeapon.Destroy();
    }
    wModelWeapon = PlayerModel.Spawn(class'wGun');
    wModelWeapon.wLoadOut(id, 0);
    wModelWeapon.AttachToPawn(PawnModel);
}

function UpdateRotation()
{
    local Rotator R;

    R = PawnModel.Rotation;
    // End:0x4e
    if(ModelDeltaRotation.Yaw != 0)
    {
        R.Yaw += int(float(ModelDeltaRotation.Yaw) * Controller.RenderDelta);
    }
    // End:0x88
    if(ModelDeltaRotation.Pitch != 0)
    {
        R.Pitch += int(float(ModelDeltaRotation.Pitch) * Controller.RenderDelta);
    }
    // End:0xc2
    if(ModelDeltaRotation.Roll != 0)
    {
        R.Roll += int(float(ModelDeltaRotation.Roll) * Controller.RenderDelta);
    }
    // End:0x13d
    if(ModelDeltaRotation.Yaw != 0 || ModelDeltaRotation.Pitch != 0 || ModelDeltaRotation.Roll != 0)
    {
        Log("Roll=" $ string(R.Roll) $ " Pitch=" $ string(R.Pitch) $ " Yaw=" $ string(R.Yaw));
    }
    ModelDeltaRotation.Roll = 0;
    ModelDeltaRotation.Pitch = 0;
    ModelDeltaRotation.Yaw = 0;
    PawnModel.SetRotation(R);
}

function bool HandleKeyEvent(out byte key, out byte Action, float Delta)
{
    return false;
}

defaultproperties
{
    ModelLightOffset=(X=193.0,Y=-50.50,Z=67.0)
    ModelWeapon=SkeletalMesh'WP_AR_AK47.AK47_3rd'
    ModelDefaultRotation=(Pitch=1179,Yaw=30487,Roll=0)
    ModelWeaponID=2501
    TeamClassIndex=1
    TeamClass=// Object reference not set to an instance of an object.
    
    ModelDefaultOffset=(X=326.0,Y=-125.50,Z=11.0)
    CamLocation=(X=-515.0,Y=-350.0,Z=0.0)
    OnDraw=InternalOnDraw
}