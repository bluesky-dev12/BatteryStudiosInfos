class wPlayerInfo extends Object
    native;

static function bool SetupPawn(wPawn P, int iBodyItemID, int iHeadItemID, int iHelmetItemID, int iAcceItemID, int iTeamIndex)
{
    local wGameManager gm;
    local wItemResourceParam resParam;
    local Mesh NewMesh;

    Log("[wPlayerInfo] SetupPawn -- Start");
    gm = P.Level.GameMgr;
    // End:0x57
    if(iBodyItemID <= 0)
    {
        iBodyItemID = 15000;
    }
    resParam = gm.GetItemResourceParam(iBodyItemID);
    // End:0xC5
    if(resParam.iItemResourceID < 0)
    {
        Log("[wPlayerInfo] SetupPawn [Error] BodyItemID < 0 : " $ string(iBodyItemID));
        return false;
    }
    NewMesh = gm.GetItemResourceMesh(iBodyItemID, true, byte(iTeamIndex));
    // End:0x112
    if(iTeamIndex > 0)
    {
        P.strGoreMeshName = resParam.strRes_3rd_RSA_Gore;        
    }
    else
    {
        P.strGoreMeshName = resParam.strRes_3rd_AF_Gore;
    }
    // End:0x171
    if(NewMesh == none)
    {
        Log("[wPlayerInfo] SetupPawn [Error] Body mesh is NONE");
        return false;
    }
    P.bAlreadySetup = true;
    P.LinkMesh(NewMesh);
    P.AssignInitialPose();
    // End:0x20D
    if(((iHeadItemID == -1) && iHelmetItemID == -1) && iAcceItemID == -1)
    {
        Log("[wPlayerInfo] SetupPawn [SpecialCharacter] -- End");
        return true;
    }
    P.SetParts(P.0, gm.GetItemResourceMesh(iHeadItemID, true, byte(iTeamIndex)), none);
    // End:0x25A
    if(iHelmetItemID <= 0)
    {
        iHelmetItemID = 11000;
    }
    P.SetParts(P.1, gm.GetItemResourceMesh(iHelmetItemID, true, byte(iTeamIndex)), none);
    P.SetParts(P.2, none, gm.GetItemResourceStaticMesh(iAcceItemID, true, byte(iTeamIndex)));
    Log("[wPlayerInfo] SetupPawn -- End");
    return true;
    //return;    
}

static function bool Setup(wPawn P, PlayerRecord Rec)
{
    local Mesh NewMesh;
    local PlayerSet NewPlayerSet;

    Log("[wPlayerInfo] Setup Start");
    // End:0x70
    if(P.PlayerReplicationInfo.Team == none)
    {
        NewPlayerSet = P.Level.CharMgr.GetPlayerSetTest("B-Normal02");        
    }
    else
    {
        // End:0xCC
        if(P.PlayerReplicationInfo.Team.TeamIndex == 0)
        {
            NewPlayerSet = P.Level.CharMgr.GetPlayerSetTest("A-Normal02");            
        }
        else
        {
            NewPlayerSet = P.Level.CharMgr.GetPlayerSetTest("B-Normal02");
        }
    }
    NewMesh = Mesh(DynamicLoadObject(NewPlayerSet.strBodyName, Class'Engine.Mesh'));
    // End:0x157
    if(NewMesh == none)
    {
        Log("Failed to load player mesh " $ NewPlayerSet.strBodyName);
        return false;
    }
    P.bAlreadySetup = true;
    P.LinkMesh(NewMesh);
    P.AssignInitialPose();
    Log("[wPlayerInfo] Setup End");
    return true;
    //return;    
}
