class wGameObject_SBTBomb extends wGameObject_Bomb;

var Vector LastPosition;
var float LastPositionUpdateInterval;

replication
{
    // Pos:0x000
    reliable if(int(Role) == int(ROLE_Authority))
        LastPosition;
}

function bool CanBePickedUpBy(Pawn P)
{
    return !P.IsA('Vehicle');
    //return;    
}

function OnSetHolder(Controller C)
{
    local wSBTSetObjective Set;
    local byte Team;

    Log("[wGameObject_SBTBomb::OnSetHolder]");
    super.OnSetHolder(C);
    SetAttackingTeam(C.GetTeamNum());
    Team = byte(float(byte(C.GetTeamNum() + wSBTGameInfo(Level.Game).PrimaryTeam)) % float(2));
    // End:0xBE
    foreach DynamicActors(Class'WMission_Decompressed.wSBTSetObjective', Set)
    {
        Set.SetActive(int(Set.DefenderTeamIndex) != int(Team));        
    }    
    //return;    
}

function SetAttackingTeam(int Team)
{
    Log("[wGameObject_SBTBomb::SetAttackingTeam] " $ string(Team));
    wSBTGameInfo(Level.Game).CurrentAttackingTeam = byte(Team);
    wMSGameReplicationInfo(Level.GRI).CurrentAttackingTeam = Team;
    //return;    
}

function ProcessSetHolderMessage(Controller C)
{
    local Controller Ctrl;

    Ctrl = Level.ControllerList;
    J0x14:

    // End:0x11D [Loop If]
    if(Ctrl != none)
    {
        // End:0x106
        if(PlayerController(Ctrl) != none)
        {
            // End:0x76
            if(Ctrl == C)
            {
                PlayerController(Ctrl).ReceiveLocalizedMessage(Class'Engine.wMessage_Game_ImpSystem', Class'Engine.wMessage_Game_ImpSystem'.default.Code_SBTIGotTheBomb, C.PlayerReplicationInfo);                
            }
            else
            {
                // End:0xD1
                if(C.GetTeamNum() == Ctrl.GetTeamNum())
                {
                    PlayerController(Ctrl).ReceiveLocalizedMessage(Class'Engine.wMessage_Game_ImpSystem', Class'Engine.wMessage_Game_ImpSystem'.default.Code_SBTAllyGotTheBomb, C.PlayerReplicationInfo);                    
                }
                else
                {
                    PlayerController(Ctrl).ReceiveLocalizedMessage(Class'Engine.wMessage_Game_ImpSystem', Class'Engine.wMessage_Game_ImpSystem'.default.Code_SBTEnemyGotTheBomb, C.PlayerReplicationInfo);
                }
            }
        }
        Ctrl = Ctrl.nextController;
        // [Loop Continue]
        goto J0x14;
    }
    //return;    
}

function ProcessDropMessage()
{
    local Controller Ctrl;

    Ctrl = Level.ControllerList;
    J0x14:

    // End:0x9D [Loop If]
    if(Ctrl != none)
    {
        // End:0x86
        if(PlayerController(Ctrl) != none)
        {
            // End:0x86
            if(Ctrl.GetTeamNum() == HolderPRI.Team.TeamIndex)
            {
                PlayerController(Ctrl).ReceiveLocalizedMessage(Class'Engine.wMessage_Game_ImpSystem', Class'Engine.wMessage_Game_ImpSystem'.default.Code_SBTAllyLostTheBomb, HolderPRI);
            }
        }
        Ctrl = Ctrl.nextController;
        // [Loop Continue]
        goto J0x14;
    }
    //return;    
}

function Drop(Vector NewVel, optional string sReason)
{
    local wSBTSetObjective Set;

    Log("[wGameObject_SBTBomb::Drop] / Reason :" $ sReason);
    super.Drop(NewVel, sReason);
    SetAttackingTeam(-1);
    bHidden = false;
    // End:0x75
    foreach DynamicActors(Class'WMission_Decompressed.wSBTSetObjective', Set)
    {
        Set.SetActive(false);        
    }    
    //return;    
}

state Held
{
    function BeginState()
    {
        super.BeginState();
        LastPosition = Holder.Location;
        SetTimer(LastPositionUpdateInterval, true);
        //return;        
    }

    function Timer()
    {
        LastPosition = Holder.Location;
        //return;        
    }
    stop;    
}

defaultproperties
{
    LastPositionUpdateInterval=8.0000000
}