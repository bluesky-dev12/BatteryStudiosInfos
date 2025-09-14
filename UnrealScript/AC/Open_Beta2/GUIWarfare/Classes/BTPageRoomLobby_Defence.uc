class BTPageRoomLobby_Defence extends BTPageRoomLobby
    editinlinenew
    instanced;

var() automated FloatBox fbRewardInfo;
var export editinline BTDefenceRewardInfo RewardInfo;
var bool bShowRewardWindow;
var bool bAfterStartGame;

function InitializeTeamList()
{
    LabelTeamTopLine = NewLabelComponent(fbLabelTeamTopLine, Class'GUIWarfareControls.BTUIResourcePoolHK'.default.empty);
    LabelTeamTopLine.SetFontSizeAll(11);
    ButtonTeam[0] = NewButtonComponent(fbButtonTeam[0]);
    ButtonTeam[0].buttonImage[0] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.WaitRoom_Defence_Team;
    ButtonTeam[0].bActiveCursor = false;
    ButtonTeam[1] = NewButtonComponent(fbButtonTeam[1]);
    TPTeamList[0] = BTTPTeamMemberList(NewComponent(new Class'GUIWarfareControls.BTTPTeamMemberList', fbTPTeamList[0]));
    TPTeamList[0].__OnPopupCheck__Delegate = TPTeamList_OnPopupCheck;
    TPTeamList[0].__OnPopup__Delegate = TPTeamList_OnPopup;
    RewardInfo = BTDefenceRewardInfo(NewComponent(new Class'GUIWarfareControls.BTDefenceRewardInfo', fbRewardInfo));
    RewardInfo.ApplyAWinPos();
    //return;    
}

function bool ChangeButtonTeam(int Team)
{
    // End:0xED
    if(Team == 0)
    {
        ButtonTeam[0].buttonImage[0] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.WaitRoom_Defence_Team;
        ButtonTeam[0].buttonImage[0] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.WaitRoom_Defence_Team;
        ButtonTeam[0].buttonImage[1] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.WaitRoom_Defence_Team;
        ButtonTeam[0].buttonImage[2] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.WaitRoom_Defence_Team;
        ButtonTeam[0].buttonImage[3] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.WaitRoom_Defence_Team;
        ButtonTeam[0].buttonImage[4] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.WaitRoom_Defence_Team;
        ButtonTeam[0].__OnClick__Delegate = None;        
    }
    else
    {
        ButtonTeam[0].buttonImage[0] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.WaitRoom_Defence_Team;
    }
    return true;
    //return;    
}

function UpdateGameRoomInfo(wMatchMaker MM)
{
    Log("[BTPageRoomLobby_Defence::UpdateGameRoomInfo]");
    super.UpdateGameRoomInfo(MM);
    RewardInfo.SetDefenceRewardInfo();
    // End:0x95
    if(bShowRewardWindow)
    {
        bShowRewardWindow = false;
        Controller.OpenMenu("GUIWarfareControls.BTWindowDefenceReward");
    }
    //return;    
}

function bool rfAckUseItemDuringGame(int ErrorCode, string CharName, int ItemID, BtrDouble ItemUniqueID, int RemainCount)
{
    local int lp1;
    local Controller C;
    local wDefenceController dPC;
    local wMatchMaker wMM;

    Log((((((((((string(self) $ "[rfAckUseItemDuringGame] ErrorCode:") $ string(ErrorCode)) $ " / CharName :") $ CharName) $ " /ItemID:") $ string(ItemID)) $ "/ItemUniqueID:") $ __NFUN_918__(ItemUniqueID)) $ " / RemainCount:") $ string(RemainCount));
    // End:0xA8
    if(ErrorCode != 0)
    {
        return false;
    }
    // End:0x24A
    if((MM.playingLevelInfo != none) && int(MM.playingLevelInfo.NetMode) == int(NM_ListenServer))
    {
        Log((string(self) $ "[rfAckUseItemDuringGame] ") $ string(MM.playingLevelInfo.NetMode));
        C = MM.playingLevelInfo.ControllerList;
        J0x13A:

        // End:0x24A [Loop If]
        if(C != none)
        {
            dPC = wDefenceController(C);
            // End:0x163
            if(dPC == none)
            {                
            }
            else
            {
                Log((string(self) $ "[rfAckUseItemDuringGame] PlayerName:") $ dPC.PlayerReplicationInfo.PlayerName);
                // End:0x233
                if(((dPC != none) && dPC.PlayerReplicationInfo != none) && dPC.PlayerReplicationInfo.PlayerName == CharName)
                {
                    switch(ItemID)
                    {
                        // End:0x20E
                        case 92005:
                            dPC.SetRepairNuclear();
                            // End:0x230
                            break;
                        // End:0x22A
                        case 92006:
                            dPC.bActiveNowRespawn = true;
                            // End:0x230
                            break;
                        // End:0xFFFF
                        default:
                            // End:0x230
                            break;
                            break;
                    }
                    // [Explicit Break]
                    goto J0x24A;
                }
            }
            C = C.nextController;
            // [Loop Continue]
            goto J0x13A;
        }
    }
    J0x24A:

    // End:0x38E
    if((PlayerOwner() != none) && PlayerOwner().PlayerReplicationInfo != none)
    {
        // End:0x38E
        if((PlayerOwner().PlayerReplicationInfo.PlayerName == CharName) && PlayerOwner().myHUD != none)
        {
            PlayerOwner().myHUD.CallUsingItem(ItemID, RemainCount);
            dPC = wDefenceController(PlayerOwner());
            // End:0x38E
            if(dPC != none)
            {
                switch(ItemID)
                {
                    // End:0x30F
                    case 92005:
                        dPC.bReqActiveRepair = false;
                        dPC.SetItemCount(ItemID, RemainCount);
                        // End:0x34A
                        break;
                    // End:0x344
                    case 92006:
                        dPC.bReqAcitveRespawn = false;
                        dPC.SetItemCount(ItemID, RemainCount);
                        // End:0x34A
                        break;
                    // End:0xFFFF
                    default:
                        // End:0x34A
                        break;
                        break;
                }
                MM.kNeedUpdateItemList = true;
                // End:0x38E
                if(RemainCount == 0)
                {
                    GameMgr.RemoveInstanceItem(ItemUniqueID);
                    GameMgr.RemoveQuickSlotItem(ItemUniqueID);
                }
            }
        }
    }
    return true;
    //return;    
}

function UpdateItemList(wGameManager GameMgr)
{
    Log("[BTPageRoomLobby_Defence::UpdateItemList]");
    // End:0x6B
    if((page_Main != none) && page_Main.page_Inventory != none)
    {
        page_Main.page_Inventory.UpdateItemList(GameMgr);
    }
    //return;    
}

function InternalOnOpen()
{
    super.InternalOnOpen();
    // End:0x19
    if(!bAfterStartGame)
    {
        bShowRewardWindow = true;
    }
    bAfterStartGame = false;
    //return;    
}

function bool rfAckStartGame(int GameNumber, int ClientsCount, int StartSeed, int Result, string ErrMsg)
{
    // End:0x13
    if(Result == 0)
    {
        bAfterStartGame = true;
    }
    return super.rfAckStartGame(GameNumber, ClientsCount, StartSeed, Result, ErrMsg);
    //return;    
}

defaultproperties
{
    fbRewardInfo=(X1=385.0000000,Y1=137.0000000,X2=745.0000000,Y2=508.0000000)
}