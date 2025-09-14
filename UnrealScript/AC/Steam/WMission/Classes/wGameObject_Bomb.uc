/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WMission\Classes\wGameObject_Bomb.uc
 * Package Imports:
 *	WMission
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:13
 *	Functions:14
 *	States:1
 *
 *******************************************************************************/
class wGameObject_Bomb extends GameObject
    dependson(wMSGameInfo);

var localized string PlayerDroppedMessage;
var localized string DroppedMessage;
var localized string EnergyCorePickedUp;
var localized string PlayerPickedUpEnergyCore;
var localized string PlayerCoreReset;
var localized string EnemyPickedUpBomb;
var localized string EnemyDroppedBomb;
var string Announcer_EnergyCore_Dropped;
var string Announcer_EnergyCore_PickedUp;
var string Announcer_EnergyCore_Reset;
var bool bSoundsPrecached;
var wBombObjective MySpawnObjective;
var string strPlayerName;

replication
{
    // Pos:0x00
    reliable if(Role == 4)
        strPlayerName;

}

function bool CanBePickedUpBy(Pawn P)
{
    return P.GetTeamNum() != Level.Game.GetDefenderNum() && !P.IsA('Vehicle');
}

function PostBeginPlay()
{
    super.PostBeginPlay();
    // End:0x3e
    if(Level.GRI.bMultiBomb)
    {
        bHidden = true;
        bDisabled = true;
        SetCollisionSize(15.0, 20.0);
    }
}

function bool ValidHolder(Actor Other)
{
    // End:0x35
    if(super.ValidHolder(Other) && Other.IsA('Pawn'))
    {
        return CanBePickedUpBy(Pawn(Other));
    }
    return false;
}

function OnSetHolder(Controller C);
function ProcessSetHolderMessage(Controller C)
{
    local Controller Ctrl;

    Ctrl = Level.ControllerList;
    J0x14:
    // End:0xf8 [While If]
    if(Ctrl != none)
    {
        // End:0xe1
        if(PlayerController(Ctrl) != none && wMSGameInfo(Level.Game).IsAttackingTeam(PlayerController(Ctrl).GetTeamNum()))
        {
            // End:0xac
            if(Ctrl == C)
            {
                PlayerController(Ctrl).ReceiveLocalizedMessage(class'wMessage_Game_ImpSystem', class'wMessage_Game_ImpSystem'.default.Code_SDIGotTheBomb, C.PlayerReplicationInfo);
            }
            // End:0xe1
            else
            {
                PlayerController(Ctrl).ReceiveLocalizedMessage(class'wMessage_Game_ImpSystem', class'wMessage_Game_ImpSystem'.default.Code_SDAllyGotTheBomb, C.PlayerReplicationInfo);
            }
        }
        Ctrl = Ctrl.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
}

function SetHolder(Controller C)
{
    // End:0x23
    if(C == none || C.Pawn == none)
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
}

function ClearHolder()
{
    super.ClearHolder();
}

function ProcessDropMessage()
{
    local bool allyLeft;
    local Controller C;

    allyLeft = false;
    C = Level.ControllerList;
    J0x1c:
    // End:0xb0 [While If]
    if(C != none)
    {
        // End:0x99
        if(wMSGameInfo(Level.Game).IsAttackingTeam(C.GetTeamNum()) && C.Pawn != none && Level.Game.IsPawnAlive(C))
        {
            allyLeft = true;
        }
        // End:0xb0
        else
        {
            C = C.nextController;
            // This is an implied JumpToken; Continue!
            goto J0x1c;
        }
    }
    // End:0x114
    if(allyLeft)
    {
        Level.Game.TeamReceiveLocalizedMessage(byte(Level.Game.GameReplicationInfo.CurrentAttackingTeam), class'wMessage_Game_ImpSystem', class'wMessage_Game_ImpSystem'.default.Code_SDAllyLostTheBomb, Holder.PlayerReplicationInfo);
    }
}

function ProcessThrowMessage()
{
    local bool allyLeft;
    local Controller C;

    allyLeft = false;
    C = Level.ControllerList;
    J0x1c:
    // End:0xb0 [While If]
    if(C != none)
    {
        // End:0x99
        if(wMSGameInfo(Level.Game).IsAttackingTeam(C.GetTeamNum()) && C.Pawn != none && Level.Game.IsPawnAlive(C))
        {
            allyLeft = true;
        }
        // End:0xb0
        else
        {
            C = C.nextController;
            // This is an implied JumpToken; Continue!
            goto J0x1c;
        }
    }
    // End:0x114
    if(allyLeft)
    {
        Level.Game.TeamReceiveLocalizedMessage(byte(Level.Game.GameReplicationInfo.CurrentAttackingTeam), class'wMessage_Game_ImpSystem', class'wMessage_Game_ImpSystem'.default.Code_SDAllyThrowTheBomb, Holder.PlayerReplicationInfo);
    }
}

function Drop(Vector NewVel, optional string sReason)
{
    // End:0x24
    if(sReason ~= "ThrowsTheWeapon")
    {
        ProcessThrowMessage();
    }
    // End:0x2a
    else
    {
        ProcessDropMessage();
    }
    super.Drop(NewVel);
    SetCollisionSize(default.CollisionRadius, default.CollisionHeight);
}

function Landed(Vector HitNormal)
{
    super.Landed(HitNormal);
    SetCollisionSize(default.CollisionRadius, default.CollisionHeight);
}

function HolderDied()
{
    Drop(vect(0.0, 0.0, 0.0));
}

function LogReturned();
simulated function PrecacheAnnouncer(AnnouncerVoice V, bool bRewardSounds)
{
    // End:0x48
    if(!bRewardSounds && !bSoundsPrecached)
    {
        bSoundsPrecached = true;
        V.PrecacheSound(Announcer_EnergyCore_Dropped);
        V.PrecacheSound(Announcer_EnergyCore_PickedUp);
    }
}

state DroppedBomb extends dropped
{
    function BeginState()
    {
        Log(string(self) $ " DroppedBomb::BeginState() " $ " / bCollideWorld :" $ string(bCollideWorld));
        SetCollisionSize(15.0, 20.0);
        super.BeginState();
    }

}

defaultproperties
{
    PlayerDroppedMessage=" is Droped Bomb !! "
    DroppedMessage="Bomb dropped!"
    EnergyCorePickedUp="Bomb picked up!"
    PlayerPickedUpEnergyCore=" picked up Bomb!"
    PlayerCoreReset="Bomb reset!"
    EnemyPickedUpBomb="The enemy picked up the bomb."
    EnemyDroppedBomb="The enemy dropped the bomb."
    Announcer_EnergyCore_PickedUp="Mode_SD.v_sd_bomb_get_team_R"
    bHome=true
    GameObjBone=spine
    GameObjOffset=(X=25.0,Y=50.0,Z=0.0)
    GameObjRot=(Pitch=0,Yaw=0,Roll=16384)
    DrawType=8
    StaticMesh=StaticMesh'WPS_GR.Demolition Pack.DemolitionPack'
    bStatic=true
    bStasis=true
    bAlwaysRelevant=true
    NetUpdateFrequency=100.0
    NetPriority=3.0
    DrawScale=2.0
    PrePivot=(X=2.0,Y=0.0,Z=0.50)
    CollisionRadius=80.0
    CollisionHeight=25.0
    bCollideActors=true
    bCollideWorld=true
    Buoyancy=20.0
}