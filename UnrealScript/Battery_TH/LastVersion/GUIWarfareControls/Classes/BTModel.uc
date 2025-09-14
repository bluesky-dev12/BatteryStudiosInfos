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
    //return;    
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
    //return;    
}

function SetModelHead(int HeadID)
{
    //return;    
}

function bool InternalOnDraw(Canvas C)
{
    local Vector CamPos, X, Y, Z;
    local Rotator camRot;

    // End:0x27
    if(PawnModel == none)
    {
        PlayerModel = PlayerOwner().Spawn(Class'WGame.wPlayer');
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
    C.SetScreenLight(0, CamPos + (MakeVector(300.0000000, 100.0000000, 300.0000000)), C.MakeColor(byte(255), byte(255), byte(255), byte(255)), 1000.0000000);
    C.SetScreenLight(1, CamPos + (MakeVector(-100.0000000, 300.0000000, 400.0000000)), C.MakeColor(192, byte(145.6000061), 140, byte(255)), 1000.0000000);
    C.SetScreenLight(2, CamPos + (MakeVector(-150.0000000, -500.0000000, -200.0000000)), C.MakeColor(140, byte(189.6250000), 192, byte(255)), 1000.0000000);
    C.DrawScreenActor(PawnModel);
    PawnModel.LoopAnim('UI_AR_AK47');
    return false;
    //return;    
}

function SetModelTeam(int idx)
{
    local bool hasOldR;
    local Rotator OldRotation;

    TeamClassIndex = idx;
    // End:0x3E
    if(PawnModel != none)
    {
        hasOldR = true;
        OldRotation = PawnModel.Rotation;
        PawnModel.Destroy();
    }
    PawnModel = PlayerModel.Spawn(Class'WGame.wPawn');
    PlayerModel.SetPawnClass("WGame.wPawn", TeamClass[TeamClassIndex]);
    PlayerModel.PlayerReplicationInfo.Team.TeamIndex = TeamClassIndex;
    PlayerModel.Possess(PawnModel);
    // End:0xD3
    if(hasOldR)
    {
        PawnModel.SetRotation(OldRotation);        
    }
    else
    {
        PawnModel.SetRotation(ModelDefaultRotation);
    }
    PawnModel.SetPhysics(0);
    SetModelWeapon(ModelWeaponID);
    //return;    
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
    wModelWeapon = PlayerModel.Spawn(Class'Engine.wGun');
    wModelWeapon.wLoadOut(id, 0);
    wModelWeapon.AttachToPawn(PawnModel);
    //return;    
}

function UpdateRotation()
{
    local Rotator R;

    R = PawnModel.Rotation;
    // End:0x4E
    if(ModelDeltaRotation.Yaw != 0)
    {
        R.Yaw += int(float(ModelDeltaRotation.Yaw) * Controller.RenderDelta);
    }
    // End:0x88
    if(ModelDeltaRotation.Pitch != 0)
    {
        R.Pitch += int(float(ModelDeltaRotation.Pitch) * Controller.RenderDelta);
    }
    // End:0xC2
    if(ModelDeltaRotation.Roll != 0)
    {
        R.Roll += int(float(ModelDeltaRotation.Roll) * Controller.RenderDelta);
    }
    // End:0x13D
    if(((ModelDeltaRotation.Yaw != 0) || ModelDeltaRotation.Pitch != 0) || ModelDeltaRotation.Roll != 0)
    {
        Log((((("Roll=" $ string(R.Roll)) $ " Pitch=") $ string(R.Pitch)) $ " Yaw=") $ string(R.Yaw));
    }
    ModelDeltaRotation.Roll = 0;
    ModelDeltaRotation.Pitch = 0;
    ModelDeltaRotation.Yaw = 0;
    PawnModel.SetRotation(R);
    //return;    
}

function bool HandleKeyEvent(out byte key, out byte Action, float Delta)
{
    return false;
    //return;    
}

defaultproperties
{
    ModelLightOffset=(X=193.0000000,Y=-50.5000000,Z=67.0000000)
    ModelWeapon=SkeletalMesh'WP_AR_AK47.AK47_3rd'
    ModelDefaultRotation=(Pitch=1179,Yaw=30487,Roll=0)
    ModelWeaponID=2501
    TeamClassIndex=1
    TeamClass[0]="B-Normal02"
    TeamClass[1]="B-Normal02"
    ModelDefaultOffset=(X=326.0000000,Y=-125.5000000,Z=11.0000000)
    CamLocation=(X=-515.0000000,Y=-350.0000000,Z=0.0000000)
    OnDraw=BTModel.InternalOnDraw
}