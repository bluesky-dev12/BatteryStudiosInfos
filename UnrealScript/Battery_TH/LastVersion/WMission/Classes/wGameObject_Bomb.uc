class wGameObject_Bomb extends GameObject;

var localized string PlayerDroppedMessage;
var localized string DroppedMessage;
var localized string EnergyCorePickedUp;
var localized string PlayerPickedUpEnergyCore;
var localized string PlayerCoreReset;
var localized string EnemyPickedUpBomb;
var localized string EnemyDroppedBomb;
var bool bSoundsPrecached;
var wBombObjective MySpawnObjective;
var string strPlayerName;

replication
{
    // Pos:0x000
    reliable if(int(Role) == int(ROLE_Authority))
        strPlayerName;
}

function bool CanBePickedUpBy(Pawn P)
{
    return (P.GetTeamNum() != Level.Game.GetDefenderNum()) && !P.IsA('Vehicle');
    //return;    
}

function PostBeginPlay()
{
    super.PostBeginPlay();
    // End:0x3E
    if(Level.GRI.bMultiBomb)
    {
        bHidden = true;
        bDisabled = true;
        SetCollisionSize(15.0000000, 20.0000000);
    }
    //return;    
}

function bool ValidHolder(Actor Other)
{
    // End:0x35
    if(super.ValidHolder(Other) && Other.IsA('Pawn'))
    {
        return CanBePickedUpBy(Pawn(Other));
    }
    return false;
    //return;    
}

function OnSetHolder(Controller C)
{
    //return;    
}

function ProcessSetHolderMessage(Controller C)
{
    local Controller Ctrl;

    Ctrl = Level.ControllerList;
    J0x14:

    // End:0xF8 [Loop If]
    if(Ctrl != none)
    {
        // End:0xE1
        if((PlayerController(Ctrl) != none) && wMSGameInfo(Level.Game).IsAttackingTeam(PlayerController(Ctrl).GetTeamNum()))
        {
            // End:0xAC
            if(Ctrl == C)
            {
                PlayerController(Ctrl).ReceiveLocalizedMessage(Class'Engine.wMessage_Game_ImpSystem', Class'Engine.wMessage_Game_ImpSystem'.default.Code_SDIGotTheBomb, C.PlayerReplicationInfo);                
            }
            else
            {
                PlayerController(Ctrl).ReceiveLocalizedMessage(Class'Engine.wMessage_Game_ImpSystem', Class'Engine.wMessage_Game_ImpSystem'.default.Code_SDAllyGotTheBomb, C.PlayerReplicationInfo);
            }
        }
        Ctrl = Ctrl.nextController;
        // [Loop Continue]
        goto J0x14;
    }
    //return;    
}

function SetHolder(Controller C)
{
    // End:0x23
    if((C == none) || C.Pawn == none)
    {
        return;
    }
    // End:0x65
    if(Level.Game.IsA('wSDGameInfo'))
    {
        // End:0x65
        if(wMSGameInfo(Level.Game).bObjectivePlanted == true)
        {
            return;
        }
    }
    ProcessSetHolderMessage(C);
    PlayerController(C).ClientHoldFlag();
    super.SetHolder(C);
    HomeBase.DisableObjective(C.Pawn);
    strPlayerName = C.PlayerReplicationInfo.PlayerName;
    OnSetHolder(C);
    //return;    
}

function ClearHolder()
{
    super.ClearHolder();
    //return;    
}

function ProcessDropMessage()
{
    local bool allyLeft;
    local Controller C;

    allyLeft = false;
    C = Level.ControllerList;
    J0x1C:

    // End:0xB0 [Loop If]
    if(C != none)
    {
        // End:0x99
        if((wMSGameInfo(Level.Game).IsAttackingTeam(C.GetTeamNum()) && C.Pawn != none) && Level.Game.IsPawnAlive(C))
        {
            allyLeft = true;
            // [Explicit Break]
            goto J0xB0;
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x1C;
    }
    J0xB0:

    // End:0x114
    if(allyLeft)
    {
        Level.Game.TeamReceiveLocalizedMessage(byte(Level.Game.GameReplicationInfo.CurrentAttackingTeam), Class'Engine.wMessage_Game_ImpSystem', Class'Engine.wMessage_Game_ImpSystem'.default.Code_SDAllyLostTheBomb, Holder.PlayerReplicationInfo);
    }
    //return;    
}

function ProcessThrowMessage()
{
    local bool allyLeft;
    local Controller C;

    allyLeft = false;
    C = Level.ControllerList;
    J0x1C:

    // End:0xB0 [Loop If]
    if(C != none)
    {
        // End:0x99
        if((wMSGameInfo(Level.Game).IsAttackingTeam(C.GetTeamNum()) && C.Pawn != none) && Level.Game.IsPawnAlive(C))
        {
            allyLeft = true;
            // [Explicit Break]
            goto J0xB0;
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x1C;
    }
    J0xB0:

    // End:0x114
    if(allyLeft)
    {
        Level.Game.TeamReceiveLocalizedMessage(byte(Level.Game.GameReplicationInfo.CurrentAttackingTeam), Class'Engine.wMessage_Game_ImpSystem', Class'Engine.wMessage_Game_ImpSystem'.default.Code_SDAllyThrowTheBomb, Holder.PlayerReplicationInfo);
    }
    //return;    
}

function Drop(Vector NewVel, optional string sReason)
{
    // End:0x24
    if(sReason ~= "ThrowsTheWeapon")
    {
        ProcessThrowMessage();        
    }
    else
    {
        ProcessDropMessage();
    }
    super.Drop(NewVel);
    SetCollisionSize(default.CollisionRadius, default.CollisionHeight);
    //return;    
}

function Landed(Vector HitNormal)
{
    super.Landed(HitNormal);
    SetCollisionSize(default.CollisionRadius, default.CollisionHeight);
    //return;    
}

function HolderDied()
{
    Drop(vect(0.0000000, 0.0000000, 0.0000000));
    //return;    
}

function LogReturned()
{
    //return;    
}

simulated function PrecacheAnnouncer(AnnouncerVoice V, bool bRewardSounds)
{
    //return;    
}

state DroppedBomb extends dropped
{
    function BeginState()
    {
        Log(((string(self) $ " DroppedBomb::BeginState() ") $ " / bCollideWorld :") $ string(bCollideWorld));
        SetCollisionSize(15.0000000, 20.0000000);
        super.BeginState();
        //return;        
    }
    stop;    
}

defaultproperties
{
    PlayerDroppedMessage=" is Droped Bomb !! "
    DroppedMessage="Bomb dropped!"
    EnergyCorePickedUp="Bomb picked up!"
    PlayerPickedUpEnergyCore=" picked up Bomb!"
    PlayerCoreReset="Bomb reset!"
    EnemyPickedUpBomb="???????????????"
    EnemyDroppedBomb="???????????????"
    bHome=true
    GameObjBone="spine"
    GameObjOffset=(X=25.0000000,Y=50.0000000,Z=0.0000000)
    GameObjRot=(Pitch=0,Yaw=0,Roll=16384)
    DrawType=8
    StaticMesh=StaticMesh'WPS_GR.Demolition Pack.DemolitionPack'
    bStatic=false
    bStasis=false
    bAlwaysRelevant=true
    NetUpdateFrequency=100.0000000
    NetPriority=3.0000000
    DrawScale=2.0000000
    PrePivot=(X=2.0000000,Y=0.0000000,Z=0.5000000)
    CollisionRadius=80.0000000
    CollisionHeight=25.0000000
    bCollideActors=true
    bCollideWorld=true
    Buoyancy=20.0000000
}