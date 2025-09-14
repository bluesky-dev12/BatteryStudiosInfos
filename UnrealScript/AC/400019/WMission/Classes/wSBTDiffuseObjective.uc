class wSBTDiffuseObjective extends wDiffuseObjective
    hidecategories(Lighting,LightColor,Karma,Force);

simulated event PreBeginPlay()
{
    super.PreBeginPlay();
    //return;    
}

function SetTeam(byte TeamIndex)
{
    super(GameObjective).SetTeam(TeamIndex);
    //return;    
}

function SetActive(bool bActiveStatus)
{
    // End:0x11
    if(bActiveStatus)
    {
        bDisabled = false;
    }
    super(ProximityObjective).SetActive(bActiveStatus);
    //return;    
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
    //return;    
}

function SetBombHolder(Pawn P)
{
    local wGameObject_SBTBomb Bomb;

    // End:0x50
    foreach DynamicActors(Class'WMission_Decompressed.wGameObject_SBTBomb', Bomb)
    {
        Bomb.bHidden = true;
        Bomb.bDisabled = false;
        Bomb.SetHolder(P.Controller);        
    }    
    //return;    
}

function OnBombDiffused(Pawn P)
{
    local wSBTDiffuseObjective dif;
    local byte TeamNum;

    Log("[wSBTDiffuseObjective::OnBombDiffused]");
    wPawn(P).ClientSwitchToLastWeapon();
    ResetGameInfoOnBombDiffused();
    // End:0x65
    foreach DynamicActors(Class'WMission_Decompressed.wSBTDiffuseObjective', dif)
    {
        dif.SetActive(false);        
    }    
    TeamNum = byte(P.GetTeamNum());
    Level.Game.TeamReceiveLocalizedMessage(TeamNum, Class'Engine.wMessage_Game_ImpSystem', Class'Engine.wMessage_Game_ImpSystem'.default.Code_SDAllyBombDefused, TP.PlayerReplicationInfo);
    Level.Game.TeamReceiveLocalizedMessage(byte(int(1) - int(TeamNum)), Class'Engine.wMessage_Game_ImpSystem', Class'Engine.wMessage_Game_ImpSystem'.default.Code_SDEnemyBombDefused);
    SetBombHolder(P);
    wSDGameInfo(Level.Game).OnBombDiffused(P, Tag, Location);
    P.Controller.PlayerReplicationInfo.Score += wSBTGameInfo(Level.Game).AddScore_Defuse;
    P.Controller.PlayerReplicationInfo.fExp += wSBTGameInfo(Level.Game).AddExp_Defuse;
    P.Controller.PlayerReplicationInfo.Point += wSBTGameInfo(Level.Game).AddPoint_Defuse;
    PlayerController(P.Controller).ReceiveLocalizedMessage(Class'Engine.wMessage_Score', Class'Engine.wMessage_Score'.default.Code_MessageScore_BombDiffused);
    // End:0x301
    if(Level.Game.GameReplicationInfo.bStopCountDown)
    {
        // End:0x301
        if(!Level.Game.IsAnyAllyAlive(byte(int(1) - int(TeamNum))))
        {
            Log("[wSBTDiffuseObjective::OnBombDiffused] sudden death, defused the bomb, no enemy alive");
            wSBTGameInfo(Level.Game).EndRound(2, P, "sudden death, no enemy alive");
        }
    }
    //return;    
}

defaultproperties
{
    ObjectivePriority=1
    ApplyGameInfo="wMission.wSBTGameInfo"
    Tag="'"
}