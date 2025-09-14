/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WMission\Classes\wGameObject_SBTBomb.uc
 * Package Imports:
 *	WMission
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:6
 *	States:1
 *
 *******************************************************************************/
class wGameObject_SBTBomb extends wGameObject_Bomb
    dependson(wSBTSetObjective)
    dependson(wSBTGameInfo);

var Vector LastPosition;
var float LastPositionUpdateInterval;

replication
{
    // Pos:0x00
    reliable if(Role == 4)
        LastPosition;

}

function bool CanBePickedUpBy(Pawn P)
{
    return !P.IsA('Vehicle');
}

function OnSetHolder(Controller C)
{
    local wSBTSetObjective Set;
    local byte Team;

    Log("[wGameObject_SBTBomb::OnSetHolder]");
    super.OnSetHolder(C);
    SetAttackingTeam(C.GetTeamNum());
    Team = byte(float(byte(C.GetTeamNum() + wSBTGameInfo(Level.Game).PrimaryTeam)) % float(2));
    // End:0xbe
    foreach DynamicActors(class'wSBTSetObjective', Set)
    {
        Set.SetActive(Set.DefenderTeamIndex != Team);                
    }
}

function SetAttackingTeam(int Team)
{
    Log("[wGameObject_SBTBomb::SetAttackingTeam] " $ string(Team));
    wSBTGameInfo(Level.Game).CurrentAttackingTeam = byte(Team);
    wMSGameReplicationInfo(Level.GRI).CurrentAttackingTeam = Team;
}

function ProcessSetHolderMessage(Controller C)
{
    local Controller Ctrl;

    Ctrl = Level.ControllerList;
    J0x14:
    // End:0x11d [While If]
    if(Ctrl != none)
    {
        // End:0x106
        if(PlayerController(Ctrl) != none)
        {
            // End:0x76
            if(Ctrl == C)
            {
                PlayerController(Ctrl).ReceiveLocalizedMessage(class'wMessage_Game_ImpSystem', class'wMessage_Game_ImpSystem'.default.Code_SBTIGotTheBomb, C.PlayerReplicationInfo);
            }
            // End:0x106
            else
            {
                // End:0xd1
                if(C.GetTeamNum() == Ctrl.GetTeamNum())
                {
                    PlayerController(Ctrl).ReceiveLocalizedMessage(class'wMessage_Game_ImpSystem', class'wMessage_Game_ImpSystem'.default.Code_SBTAllyGotTheBomb, C.PlayerReplicationInfo);
                }
                // End:0x106
                else
                {
                    PlayerController(Ctrl).ReceiveLocalizedMessage(class'wMessage_Game_ImpSystem', class'wMessage_Game_ImpSystem'.default.Code_SBTEnemyGotTheBomb, C.PlayerReplicationInfo);
                }
            }
        }
        Ctrl = Ctrl.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
}

function ProcessDropMessage()
{
    local Controller Ctrl;

    Ctrl = Level.ControllerList;
    J0x14:
    // End:0x9d [While If]
    if(Ctrl != none)
    {
        // End:0x86
        if(PlayerController(Ctrl) != none)
        {
            // End:0x86
            if(Ctrl.GetTeamNum() == HolderPRI.Team.TeamIndex)
            {
                PlayerController(Ctrl).ReceiveLocalizedMessage(class'wMessage_Game_ImpSystem', class'wMessage_Game_ImpSystem'.default.Code_SBTAllyLostTheBomb, HolderPRI);
            }
        }
        Ctrl = Ctrl.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
}

function Drop(Vector NewVel, optional string sReason)
{
    local wSBTSetObjective Set;

    Log("[wGameObject_SBTBomb::Drop] / Reason :" $ sReason);
    super.Drop(NewVel, sReason);
    SetAttackingTeam(-1);
    bHidden = false;
    // End:0x75
    foreach DynamicActors(class'wSBTSetObjective', Set)
    {
        Set.SetActive(false);                
    }
}

state Held
{
    function BeginState()
    {
        super.BeginState();
        LastPosition = Holder.Location;
        SetTimer(LastPositionUpdateInterval, true);
    }

    function Timer()
    {
        LastPosition = Holder.Location;
    }

}

defaultproperties
{
    LastPositionUpdateInterval=8.0
}