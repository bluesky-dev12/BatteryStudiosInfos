/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WMission\Classes\wSBTDiffuseObjective.uc
 * Package Imports:
 *	WMission
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:6
 *
 *******************************************************************************/
class wSBTDiffuseObjective extends wDiffuseObjective
    dependson(wSDGameInfo)
    hidecategories(Lighting,LightColor,Karma,Force);

simulated event PreBeginPlay()
{
    super.PreBeginPlay();
}

function SetTeam(byte TeamIndex)
{
    super(GameObjective).SetTeam(TeamIndex);
}

function SetActive(bool bActiveStatus)
{
    // End:0x11
    if(bActiveStatus)
    {
        bDisabled = false;
    }
    super(ProximityObjective).SetActive(bActiveStatus);
}

function ResetGameInfoOnBombDiffused()
{
    local int elapsedSinceObjectSet, newRemainingTime;
    local wSBTGameInfo sbt;

    sbt = wSBTGameInfo(Level.Game);
    sbt.bObjectivePlanted = false;
    sbt.nPlantedObjectiveName = 'None';
    wMSGameReplicationInfo(Level.GRI).bObjectivePlanted = false;
    elapsedSinceObjectSet = sbt.DefuseTimeLimit - sbt.GetRemainingTime();
    newRemainingTime = sbt.RemainingTimeWhenObjectIsSet - elapsedSinceObjectSet;
    sbt.SetRemainingTime(newRemainingTime);
}

function SetBombHolder(Pawn P)
{
    local wGameObject_SBTBomb Bomb;

    // End:0x50
    foreach DynamicActors(class'wGameObject_SBTBomb', Bomb)
    {
        Bomb.bHidden = true;
        Bomb.bDisabled = false;
        Bomb.SetHolder(P.Controller);                
    }
}

function OnBombDiffused(Pawn P)
{
    local wSBTDiffuseObjective dif;
    local byte TeamNum;

    Log("[wSBTDiffuseObjective::OnBombDiffused]");
    wPawn(P).ClientSwitchToLastWeapon();
    ResetGameInfoOnBombDiffused();
    // End:0x65
    foreach DynamicActors(class'wSBTDiffuseObjective', dif)
    {
        dif.SetActive(false);                
    }
    TeamNum = byte(P.GetTeamNum());
    Level.Game.TeamReceiveLocalizedMessage(TeamNum, class'wMessage_Game_ImpSystem', class'wMessage_Game_ImpSystem'.default.Code_SDAllyBombDefused, TP.PlayerReplicationInfo);
    Level.Game.TeamReceiveLocalizedMessage(byte(1 - TeamNum), class'wMessage_Game_ImpSystem', class'wMessage_Game_ImpSystem'.default.Code_SDEnemyBombDefused);
    SetBombHolder(P);
    wSDGameInfo(Level.Game).OnBombDiffused(P, Tag, Location);
    P.Controller.PlayerReplicationInfo.Score += wSBTGameInfo(Level.Game).AddScore_Defuse;
    P.Controller.PlayerReplicationInfo.fExp += wSBTGameInfo(Level.Game).AddExp_Defuse;
    P.Controller.PlayerReplicationInfo.Point += wSBTGameInfo(Level.Game).AddPoint_Defuse;
    PlayerController(P.Controller).ReceiveLocalizedMessage(class'wMessage_Score', class'wMessage_Score'.default.Code_MessageScore_BombDiffused);
    // End:0x301
    if(Level.Game.GameReplicationInfo.bStopCountDown)
    {
        // End:0x301
        if(!Level.Game.IsAnyAllyAlive(byte(1 - TeamNum)))
        {
            Log("[wSBTDiffuseObjective::OnBombDiffused] sudden death, defused the bomb, no enemy alive");
            wSBTGameInfo(Level.Game).EndRound(2, P, "sudden death, no enemy alive");
        }
    }
}

defaultproperties
{
    ObjectivePriority=1
    ApplyGameInfo="wMission.wSBTGameInfo"
    Tag='
}