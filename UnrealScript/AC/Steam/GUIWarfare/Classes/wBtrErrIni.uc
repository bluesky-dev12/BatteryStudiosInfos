/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfare\Classes\wBtrErrIni.uc
 * Package Imports:
 *	GUIWarfare
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:111
 *	Functions:1
 *
 *******************************************************************************/
class wBtrErrIni extends wBtrIni;

var localized string C_ERR_LOADING_FAILED_MyNetworkChecking_0_5000;
var localized string C_ERR_LOADING_FAILED_MyNetworkChecking_1_5001;
var localized string C_ERR_LOADING_FAILED_MyNetworkChecking_2_5002;
var localized string C_ERR_LOADING_FAILED_MyNetworkChecking_3_5003;
var localized string C_ERR_LOADING_FAILED_MyNetworkChecking_4_5004;
var localized string C_ERR_LOADING_FAILED_MyNetworkChecking_5_5005;
var localized string C_ERR_LOADING_FAILED_MyNetworkChecking_6_5006;
var localized string C_ERR_LOADING_FAILED_HostNetworkChecking_0_5007;
var localized string C_ERR_LOADING_FAILED_HostNetworkChecking_1_5008;
var localized string C_ERR_LOADING_FAILED_HostNetworkChecking_2_5009;
var localized string C_ERR_LOADING_FAILED_HostNetworkChecking_3_5010;
var localized string C_ERR_LOADING_FAILED_HostNetworkChecking_4_5011;
var localized string C_ERR_LOADING_FAILED_HostNetworkChecking_5_5012;
var localized string C_ERR_LOADING_FAILED_HostNetworkChecking_6_5013;
var localized string C_ERR_LOADING_FAILED_WrongStep_0_5014;
var localized string C_ERR_LOADING_FAILED_WrongStep_1_5015;
var localized string C_ERR_LOADING_FAILED_WrongStep_2_5016;
var localized string C_ERR_LOADING_FAILED_WrongStep_3_5017;
var localized string C_ERR_LOADING_FAILED_WrongStep_4_5018;
var localized string C_ERR_LOADING_FAILED_WrongStep_5_5019;
var localized string C_ERR_LOADING_FAILED_WrongStep_6_5020;
var localized string C_ERR_LOADING_FAILED_HostPreCachingFailed_5021;
var localized string C_ERR_LOADING_FAILED_ClientLvNegoFailed_5022;
var localized string C_ERR_LOADING_FAILED_ClientPreCachingFailed_5023;
var localized string C_ERR_LOADING_FAILED_HostRequestTimeIsZero_5024;
var localized string C_ERR_LOADING_FAILED_ClientRequestTimeIsZero_5025;
var localized string C_ERR_GBtrConfig_is_NULL_5026;
var localized string C_ERR_GameEngine_is_NULL_5027;
var localized string C_ERR_NetDriver_is_NULL_5028;
var localized string C_ERR_LoadingAdvancer_is_NULL_5029;
var localized string C_ERR_LoadingStater_is_NULL_5030;
var localized string C_ERR_LOADING_FAILED_StartHostLoading_Failed_5031;
var localized string C_ERR_LOADING_FAILED_StartClientLoading_Failed_5032;
var localized string C_ERR_LOADING_FAILED_StartChangeHost_Failed_5033;
var localized string C_ERR_LOADING_FAILED_StartChangeClient_Failed_5034;
var localized string C_ERR_LOADING_FAILED_CreateNetDriver_Failed_5035;
var localized string C_ERR_LOADING_FAILED_InitHostNatChecker_Failed_5036;
var localized string C_ERR_LOADING_FAILED_InitClientNatChecker_Failed_5037;
var localized string C_ERR_GMapLoader_is_NULL_5038;
var localized string C_ERR_GBtrConfig_cant_find_errMsg_5039;
var localized string C_ERR_LOADING_FAILED_HostSendTimeIsZero_5040;
var localized string C_ERR_LOADING_FAILED_ClientSendTimeIsZero_5041;
var localized string C_ERR_MatchMaker_is_NULL_5042;
var localized string C_ERR_NetDrvier_is_already_exist_5043;
var localized string C_ERR_NetDrvier_InitListen_Failed_5044;
var localized string C_ERR_Engine_Client_is_NULL_5045;
var localized string C_ERR_Viewport_is_NULL_5046;
var localized string C_ERR_PlayerController_is_NULL_5047;
var localized string C_ERR_NetDriver_InitConnect_Failed_5048;
var localized string C_ERR_GLevel_is_NULL_5049;
var localized string C_ERR_CHANGE_HOST_FAILED_Step_0_5050;
var localized string C_ERR_CHANGE_HOST_FAILED_Step_1_5051;
var localized string C_ERR_CHANGE_HOST_FAILED_Step_2_5052;
var localized string C_ERR_CHANGE_HOST_FAILED_Step_3_5053;
var localized string C_ERR_CHANGE_HOST_FAILED_Step_4_5054;
var localized string C_ERR_ServerConnection_is_NULL_5055;
var localized string C_ERR_LOADING_FAILED_Different_Package_5056;
var localized string C_ERR_LOADING_FAILED_Different_Package_Number_5057;
var localized string C_ERR_LOADING_FAILED_StartMatch_Failed_5058;
var localized string C_ERR_LOADING_FAILED_LoadMap_Failed_5059;
var localized string C_ERR_Host_UDP_time_out_5060;
var localized string C_ERR_Client_UDP_time_out_5061;
var localized string C_ERR_LOADING_FAILED_Changed_Host_5062;
var localized string C_ERR_LOADING_FAILED_Start_Dummy_Time_Is_Zero_5063;
var localized string C_ERR_LOADING_FAILED_Dummy_Check_Failed_5064;
var localized string C_ERR_LOADING_FAILED_WrongStep_7_5065;
var localized string C_ERR_LOADING_FAILED_Dummy_Phrase_Invalid_5066;
var localized string C_ERR_LOADING_FAILED_Dummy_Check_From_Server_5067;
var localized string C_ERR_LOADING_FAILED_Dummy_Check_Exception_5068;
var localized string C_ERR_LOADING_FAILED_Dummy_Check_Failed_User_List_Emtpy_5069;
var localized string C_ERR_LOADING_FAILED_Host_Blocking_Time_Out_5070;
var localized string C_ERR_LOADING_FAILED_GameOver_While_HolePunching_5071;
var localized string C_ERR_LOADING_FAILED_May_Be_Host_Crash_In_Loading_5072;
var localized string C_ERR_LOADING_FAILED_OnClose_From_Server_5073;
var localized string C_ERR_CHANGE_HOST_FAILED_New_Host_Step_0_5074;
var localized string C_ERR_CHANGE_HOST_FAILED_New_Host_Step_1_5075;
var localized string C_ERR_CHANGE_HOST_FAILED_New_Host_Step_2_5076;
var localized string C_ERR_CHANGE_HOST_FAILED_New_Host_Step_3_5077;
var localized string C_ERR_CHANGE_HOST_FAILED_New_Host_Step_4_5078;
var localized string C_ERR_LOADING_FAILED_Dummy_Check_From_Server_5079;
var localized string C_ERR_LOADING_FAILED_May_Be_Host_Crash_In_Loading_5080;
var localized string C_ERR_LOADING_FAILED_Inervention_Failed_By_ChangeRoomOwner_5081;
var localized string C_ERR_LOADING_FAILED_Inervention_MapLoading_Failed_5082;
var localized string C_ERR_LOADING_FAILED_Already_Started_HolePunching_5083;
var localized string C_ERR_LOADING_FAILED_Failed_Register_OutSide_Addr_5084;
var localized string C_ERR_LOADING_FAILED_More_Received_OutSide_Addr_5085;
var localized string C_ERR_LOADING_FAILED_Set_Allow_Start_HolePunching_Failed_5086;
var localized string C_ERR_LOADING_FAILED_Recv_Client_OSA_In_Wrong_Step_5087;
var localized string C_ERR_LOADING_FAILED_Wait_AckStartHolePunching_Failed_C_5088;
var localized string C_ERR_LOADING_FAILED_WrongStep_8_5089;
var localized string C_ERR_LOADING_FAILED_IntUser_Allow_HolePunching_Failed_5090;
var localized string C_ERR_LOADING_FAILED_IntUser_Allow_HolePunching_Failed_5091;
var localized string C_ERR_LOADING_FAILED_Allow_HolePunching_Failed_5092;
var localized string C_ERR_LOADING_FAILED_More_Received_OutSide_Addr_CH_5093;
var localized string C_ERR_LOADING_FAILED_Wrong_GameType_CH_5094;
var localized string C_ERR_LOADING_FAILED_Dummy_Packet_Time_Out_CH_5095;
var localized string C_ERR_LOADING_FAILED_ClientRequestTimeIsZero_CC_5096;
var localized string C_ERR_LOADING_FAILED_Wait_AckStartHolePunching_Failed_CC_5097;
var localized string C_ERR_LOADING_FAILED_Allow_Start_HolePunching_Failed_CH_5098;
var localized string C_ERR_LOADING_FAILED_Allow_Start_HolePunching_Failed_CC_5099;
var localized string C_ERR_LOADING_FAILED_Wrong_Game_Type_CC_5100;
var localized string C_ERR_LOADING_FAILED_Hole_Punching_Failed_CC_5101;
var localized string C_ERR_LOADING_FAILED_Hole_Punching_Failed_CH_5102;
var localized string C_ERR_LOADING_FAILED_Hole_Punching_Failed_H_5103;
var localized string C_ERR_LOADING_FAILED_Hole_Punching_Failed_All_5104;
var localized string C_ERR_LOADING_FAILED_Allow_NatChecker_Tick_Failed_H_5105;
var localized string C_ERR_LOADING_FAILED_Allow_NatChecker_Tick_Failed_CH_5106;
var localized string C_ERR_LOADING_FAILED_Allow_NatChecker_Tick_Failed_C_5107;
var localized string C_ERR_LOADING_FAILED_Allow_NatChecker_Tick_Failed_CC_5108;
var localized string C_ERR_LOADING_FAILED_Allow_NatChecker_Tick_Failed_IC_5109;
var localized string C_ERR_LOADING_FAILED_Found_Overlap_User_Name_5110;

event RegistMap()
{
    AddStringToMap("5000", C_ERR_LOADING_FAILED_MyNetworkChecking_0_5000);
    AddStringToMap("5001", C_ERR_LOADING_FAILED_MyNetworkChecking_1_5001);
    AddStringToMap("5002", C_ERR_LOADING_FAILED_MyNetworkChecking_2_5002);
    AddStringToMap("5003", C_ERR_LOADING_FAILED_MyNetworkChecking_3_5003);
    AddStringToMap("5004", C_ERR_LOADING_FAILED_MyNetworkChecking_4_5004);
    AddStringToMap("5005", C_ERR_LOADING_FAILED_MyNetworkChecking_5_5005);
    AddStringToMap("5006", C_ERR_LOADING_FAILED_MyNetworkChecking_6_5006);
    AddStringToMap("5007", C_ERR_LOADING_FAILED_HostNetworkChecking_0_5007);
    AddStringToMap("5008", C_ERR_LOADING_FAILED_HostNetworkChecking_1_5008);
    AddStringToMap("5009", C_ERR_LOADING_FAILED_HostNetworkChecking_2_5009);
    AddStringToMap("5010", C_ERR_LOADING_FAILED_HostNetworkChecking_3_5010);
    AddStringToMap("5011", C_ERR_LOADING_FAILED_HostNetworkChecking_4_5011);
    AddStringToMap("5012", C_ERR_LOADING_FAILED_HostNetworkChecking_5_5012);
    AddStringToMap("5013", C_ERR_LOADING_FAILED_HostNetworkChecking_6_5013);
    AddStringToMap("5014", C_ERR_LOADING_FAILED_WrongStep_0_5014);
    AddStringToMap("5015", C_ERR_LOADING_FAILED_WrongStep_1_5015);
    AddStringToMap("5016", C_ERR_LOADING_FAILED_WrongStep_2_5016);
    AddStringToMap("5017", C_ERR_LOADING_FAILED_WrongStep_3_5017);
    AddStringToMap("5018", C_ERR_LOADING_FAILED_WrongStep_4_5018);
    AddStringToMap("5019", C_ERR_LOADING_FAILED_WrongStep_5_5019);
    AddStringToMap("5020", C_ERR_LOADING_FAILED_WrongStep_6_5020);
    AddStringToMap("5021", C_ERR_LOADING_FAILED_HostPreCachingFailed_5021);
    AddStringToMap("5022", C_ERR_LOADING_FAILED_ClientLvNegoFailed_5022);
    AddStringToMap("5023", C_ERR_LOADING_FAILED_ClientPreCachingFailed_5023);
    AddStringToMap("5024", C_ERR_LOADING_FAILED_HostRequestTimeIsZero_5024);
    AddStringToMap("5025", C_ERR_LOADING_FAILED_ClientRequestTimeIsZero_5025);
    AddStringToMap("5026", C_ERR_GBtrConfig_is_NULL_5026);
    AddStringToMap("5027", C_ERR_GameEngine_is_NULL_5027);
    AddStringToMap("5028", C_ERR_NetDriver_is_NULL_5028);
    AddStringToMap("5029", C_ERR_LoadingAdvancer_is_NULL_5029);
    AddStringToMap("5030", C_ERR_LoadingStater_is_NULL_5030);
    AddStringToMap("5031", C_ERR_LOADING_FAILED_StartHostLoading_Failed_5031);
    AddStringToMap("5032", C_ERR_LOADING_FAILED_StartClientLoading_Failed_5032);
    AddStringToMap("5033", C_ERR_LOADING_FAILED_StartChangeHost_Failed_5033);
    AddStringToMap("5034", C_ERR_LOADING_FAILED_StartChangeClient_Failed_5034);
    AddStringToMap("5035", C_ERR_LOADING_FAILED_CreateNetDriver_Failed_5035);
    AddStringToMap("5036", C_ERR_LOADING_FAILED_InitHostNatChecker_Failed_5036);
    AddStringToMap("5037", C_ERR_LOADING_FAILED_InitClientNatChecker_Failed_5037);
    AddStringToMap("5038", C_ERR_GMapLoader_is_NULL_5038);
    AddStringToMap("5039", C_ERR_GBtrConfig_cant_find_errMsg_5039);
    AddStringToMap("5040", C_ERR_LOADING_FAILED_HostSendTimeIsZero_5040);
    AddStringToMap("5041", C_ERR_LOADING_FAILED_ClientSendTimeIsZero_5041);
    AddStringToMap("5042", C_ERR_MatchMaker_is_NULL_5042);
    AddStringToMap("5043", C_ERR_NetDrvier_is_already_exist_5043);
    AddStringToMap("5044", C_ERR_NetDrvier_InitListen_Failed_5044);
    AddStringToMap("5045", C_ERR_Engine_Client_is_NULL_5045);
    AddStringToMap("5046", C_ERR_Viewport_is_NULL_5046);
    AddStringToMap("5047", C_ERR_PlayerController_is_NULL_5047);
    AddStringToMap("5048", C_ERR_NetDriver_InitConnect_Failed_5048);
    AddStringToMap("5049", C_ERR_GLevel_is_NULL_5049);
    AddStringToMap("5050", C_ERR_CHANGE_HOST_FAILED_Step_0_5050);
    AddStringToMap("5051", C_ERR_CHANGE_HOST_FAILED_Step_1_5051);
    AddStringToMap("5052", C_ERR_CHANGE_HOST_FAILED_Step_2_5052);
    AddStringToMap("5053", C_ERR_CHANGE_HOST_FAILED_Step_3_5053);
    AddStringToMap("5054", C_ERR_CHANGE_HOST_FAILED_Step_4_5054);
    AddStringToMap("5055", C_ERR_ServerConnection_is_NULL_5055);
    AddStringToMap("5056", C_ERR_LOADING_FAILED_Different_Package_5056);
    AddStringToMap("5057", C_ERR_LOADING_FAILED_Different_Package_Number_5057);
    AddStringToMap("5058", C_ERR_LOADING_FAILED_StartMatch_Failed_5058);
    AddStringToMap("5059", C_ERR_LOADING_FAILED_LoadMap_Failed_5059);
    AddStringToMap("5060", C_ERR_Host_UDP_time_out_5060);
    AddStringToMap("5061", C_ERR_Client_UDP_time_out_5061);
    AddStringToMap("5062", C_ERR_LOADING_FAILED_Changed_Host_5062);
    AddStringToMap("5063", C_ERR_LOADING_FAILED_Start_Dummy_Time_Is_Zero_5063);
    AddStringToMap("5064", C_ERR_LOADING_FAILED_Dummy_Check_Failed_5064);
    AddStringToMap("5065", C_ERR_LOADING_FAILED_WrongStep_7_5065);
    AddStringToMap("5066", C_ERR_LOADING_FAILED_Dummy_Phrase_Invalid_5066);
    AddStringToMap("5067", C_ERR_LOADING_FAILED_Dummy_Check_From_Server_5067);
    AddStringToMap("5068", C_ERR_LOADING_FAILED_Dummy_Check_Exception_5068);
    AddStringToMap("5069", C_ERR_LOADING_FAILED_Dummy_Check_Failed_User_List_Emtpy_5069);
    AddStringToMap("5070", C_ERR_LOADING_FAILED_Host_Blocking_Time_Out_5070);
    AddStringToMap("5071", C_ERR_LOADING_FAILED_GameOver_While_HolePunching_5071);
    AddStringToMap("5072", C_ERR_LOADING_FAILED_May_Be_Host_Crash_In_Loading_5072);
    AddStringToMap("5073", C_ERR_LOADING_FAILED_OnClose_From_Server_5073);
    AddStringToMap("5074", C_ERR_CHANGE_HOST_FAILED_New_Host_Step_0_5074);
    AddStringToMap("5075", C_ERR_CHANGE_HOST_FAILED_New_Host_Step_1_5075);
    AddStringToMap("5076", C_ERR_CHANGE_HOST_FAILED_New_Host_Step_2_5076);
    AddStringToMap("5077", C_ERR_CHANGE_HOST_FAILED_New_Host_Step_3_5077);
    AddStringToMap("5078", C_ERR_CHANGE_HOST_FAILED_New_Host_Step_4_5078);
    AddStringToMap("5079", C_ERR_LOADING_FAILED_Dummy_Check_From_Server_5079);
    AddStringToMap("5080", C_ERR_LOADING_FAILED_May_Be_Host_Crash_In_Loading_5080);
    AddStringToMap("5081", C_ERR_LOADING_FAILED_Inervention_Failed_By_ChangeRoomOwner_5081);
    AddStringToMap("5082", C_ERR_LOADING_FAILED_Inervention_MapLoading_Failed_5082);
    AddStringToMap("5083", C_ERR_LOADING_FAILED_Already_Started_HolePunching_5083);
    AddStringToMap("5084", C_ERR_LOADING_FAILED_Failed_Register_OutSide_Addr_5084);
    AddStringToMap("5085", C_ERR_LOADING_FAILED_More_Received_OutSide_Addr_5085);
    AddStringToMap("5086", C_ERR_LOADING_FAILED_Set_Allow_Start_HolePunching_Failed_5086);
    AddStringToMap("5087", C_ERR_LOADING_FAILED_Recv_Client_OSA_In_Wrong_Step_5087);
    AddStringToMap("5088", C_ERR_LOADING_FAILED_Wait_AckStartHolePunching_Failed_C_5088);
    AddStringToMap("5089", C_ERR_LOADING_FAILED_WrongStep_8_5089);
    AddStringToMap("5090", C_ERR_LOADING_FAILED_IntUser_Allow_HolePunching_Failed_5090);
    AddStringToMap("5091", C_ERR_LOADING_FAILED_IntUser_Allow_HolePunching_Failed_5091);
    AddStringToMap("5092", C_ERR_LOADING_FAILED_Allow_HolePunching_Failed_5092);
    AddStringToMap("5093", C_ERR_LOADING_FAILED_More_Received_OutSide_Addr_CH_5093);
    AddStringToMap("5094", C_ERR_LOADING_FAILED_Wrong_GameType_CH_5094);
    AddStringToMap("5095", C_ERR_LOADING_FAILED_Dummy_Packet_Time_Out_CH_5095);
    AddStringToMap("5096", C_ERR_LOADING_FAILED_ClientRequestTimeIsZero_CC_5096);
    AddStringToMap("5097", C_ERR_LOADING_FAILED_Wait_AckStartHolePunching_Failed_CC_5097);
    AddStringToMap("5098", C_ERR_LOADING_FAILED_Allow_Start_HolePunching_Failed_CH_5098);
    AddStringToMap("5099", C_ERR_LOADING_FAILED_Allow_Start_HolePunching_Failed_CC_5099);
    AddStringToMap("5100", C_ERR_LOADING_FAILED_Wrong_Game_Type_CC_5100);
    AddStringToMap("5101", C_ERR_LOADING_FAILED_Hole_Punching_Failed_CC_5101);
    AddStringToMap("5102", C_ERR_LOADING_FAILED_Hole_Punching_Failed_CH_5102);
    AddStringToMap("5103", C_ERR_LOADING_FAILED_Hole_Punching_Failed_H_5103);
    AddStringToMap("5104", C_ERR_LOADING_FAILED_Hole_Punching_Failed_All_5104);
    AddStringToMap("5105", C_ERR_LOADING_FAILED_Allow_NatChecker_Tick_Failed_H_5105);
    AddStringToMap("5106", C_ERR_LOADING_FAILED_Allow_NatChecker_Tick_Failed_CH_5106);
    AddStringToMap("5107", C_ERR_LOADING_FAILED_Allow_NatChecker_Tick_Failed_C_5107);
    AddStringToMap("5108", C_ERR_LOADING_FAILED_Allow_NatChecker_Tick_Failed_CC_5108);
    AddStringToMap("5109", C_ERR_LOADING_FAILED_Allow_NatChecker_Tick_Failed_IC_5109);
    AddStringToMap("5110", C_ERR_LOADING_FAILED_Found_Overlap_User_Name_5110);
}

defaultproperties
{
    C_ERR_LOADING_FAILED_MyNetworkChecking_0_5000="Network setup failed. Try restarting the game. (5000)"
    C_ERR_LOADING_FAILED_MyNetworkChecking_1_5001="Network setup failed. Try restarting the game. This problem may occur if your antivirus software turns on the personal firewall. Disable the personal firewall and try again. (5001)"
    C_ERR_LOADING_FAILED_MyNetworkChecking_2_5002="Network setup failed. Try restarting the game. (5002)"
    C_ERR_LOADING_FAILED_MyNetworkChecking_3_5003="Network setup failed. Try restarting the game. (5003)"
    C_ERR_LOADING_FAILED_MyNetworkChecking_4_5004="Network setup failed. Try restarting the game. (5004)"
    C_ERR_LOADING_FAILED_MyNetworkChecking_5_5005="Network setup failed. Try restarting the game. (5005)"
    C_ERR_LOADING_FAILED_MyNetworkChecking_6_5006="Network setup failed. Try restarting the game. (5006)"
    C_ERR_LOADING_FAILED_HostNetworkChecking_0_5007="The host's network setup failed. Try restarting the game. (5007)"
    C_ERR_LOADING_FAILED_HostNetworkChecking_1_5008="The host's network setup failed. Try restarting the game. (5008)"
    C_ERR_LOADING_FAILED_HostNetworkChecking_2_5009="The host's network setup failed. Try restarting the game. (5009)"
    C_ERR_LOADING_FAILED_HostNetworkChecking_3_5010="The host's network setup failed. Try restarting the game. (5010)"
    C_ERR_LOADING_FAILED_HostNetworkChecking_4_5011="The host's network setup failed. Try restarting the game. (5011)"
    C_ERR_LOADING_FAILED_HostNetworkChecking_5_5012="The host's network setup failed. Try restarting the game. (5012)"
    C_ERR_LOADING_FAILED_HostNetworkChecking_6_5013="The host's network setup failed. Try restarting the game. (5013)"
    C_ERR_LOADING_FAILED_WrongStep_0_5014="An error occurred while loading. Try restarting the game from the Lobby. (5014)"
    C_ERR_LOADING_FAILED_WrongStep_1_5015="An error occurred while loading. Try restarting the game from the Lobby. (5015)"
    C_ERR_LOADING_FAILED_WrongStep_2_5016="An error occurred while loading. Try restarting the game from the Lobby. (5016)"
    C_ERR_LOADING_FAILED_WrongStep_3_5017="An error occurred while loading. Try restarting the game from the Lobby. (5017)"
    C_ERR_LOADING_FAILED_WrongStep_4_5018="An error occurred while loading. Try restarting the game from the Lobby. (5018)"
    C_ERR_LOADING_FAILED_WrongStep_5_5019="An error occurred while loading. Try restarting the game from the Lobby. (5019)"
    C_ERR_LOADING_FAILED_WrongStep_6_5020="An error occurred while loading. Try restarting the game from the Lobby. This problem may occur if your antivirus software turns on the personal firewall. Disable the personal firewall and try again. (5020)"
    C_ERR_LOADING_FAILED_HostPreCachingFailed_5021="Data test failed. Return to the Lobby. (5021)"
    C_ERR_LOADING_FAILED_ClientLvNegoFailed_5022="The connection with the host is poor. Return to the Lobby and restart the game. (5022)"
    C_ERR_LOADING_FAILED_ClientPreCachingFailed_5023="Data test failed. Return to the Lobby. (5023)"
    C_ERR_LOADING_FAILED_HostRequestTimeIsZero_5024="The connection with the server is poor. Return to the Lobby and restart the game. (5024)"
    C_ERR_LOADING_FAILED_ClientRequestTimeIsZero_5025="The connection with the server is poor. Return to the Lobby and restart the game. (5025)"
    C_ERR_GBtrConfig_is_NULL_5026="An error has occurred during internal processing. Restart the program. If the problem persists, contact an administrator. (5026)"
    C_ERR_GameEngine_is_NULL_5027="An error has occurred during internal processing. Restart the program. If the problem persists, contact an administrator. (5027)"
    C_ERR_NetDriver_is_NULL_5028="An error has occurred during internal processing. Restart the program. If the problem persists, contact an administrator. (5028)"
    C_ERR_LoadingAdvancer_is_NULL_5029="An error has occurred during internal processing. Restart the program. If the problem persists, contact an administrator. (5029)"
    C_ERR_LoadingStater_is_NULL_5030="An error has occurred during internal processing. Restart the program. If the problem persists, contact an administrator. (5030)"
    C_ERR_LOADING_FAILED_StartHostLoading_Failed_5031="An error has occurred during internal processing. Restart the program. If the problem persists, contact an administrator. (5031)"
    C_ERR_LOADING_FAILED_StartClientLoading_Failed_5032="An error has occurred during internal processing. Restart the program. If the problem persists, contact an administrator. (5032)"
    C_ERR_LOADING_FAILED_StartChangeHost_Failed_5033="An error has occurred during internal processing. Restart the program. If the problem persists, contact an administrator. (5033)"
    C_ERR_LOADING_FAILED_StartChangeClient_Failed_5034="An error has occurred during internal processing. Restart the program. If the problem persists, contact an administrator. (5034)"
    C_ERR_LOADING_FAILED_CreateNetDriver_Failed_5035="An error has occurred during internal processing. Restart the program. If the problem persists, contact an administrator. (5035)"
    C_ERR_LOADING_FAILED_InitHostNatChecker_Failed_5036="An error has occurred during internal processing. Restart the program. If the problem persists, contact an administrator. (5036)"
    C_ERR_LOADING_FAILED_InitClientNatChecker_Failed_5037="An error has occurred during internal processing. Restart the program. If the problem persists, contact an administrator. (5037)"
    C_ERR_GMapLoader_is_NULL_5038="An error has occurred during internal processing. Restart the program. If the problem persists, contact an administrator. (5038)"
    C_ERR_GBtrConfig_cant_find_errMsg_5039="An error has occurred during internal processing. Restart the program. If the problem persists, contact an administrator. (5039)"
    C_ERR_LOADING_FAILED_HostSendTimeIsZero_5040="The connection with the server is poor. Return to the Lobby and restart the game. (5040)"
    C_ERR_LOADING_FAILED_ClientSendTimeIsZero_5041="The connection with the server is poor. Return to the Lobby and restart the game. (5041)"
    C_ERR_MatchMaker_is_NULL_5042="An error has occurred during internal processing. Restart the program. If the problem persists, contact an administrator. (5042)"
    C_ERR_NetDrvier_is_already_exist_5043="An error has occurred during internal processing. Restart the program. If the problem persists, contact an administrator. (5043)"
    C_ERR_NetDrvier_InitListen_Failed_5044="An error has occurred during internal processing. Restart the program. If the problem persists, contact an administrator. (5044)"
    C_ERR_Engine_Client_is_NULL_5045="An error has occurred during internal processing. Restart the program. If the problem persists, contact an administrator. (5045)"
    C_ERR_Viewport_is_NULL_5046="An error has occurred during internal processing. Restart the program. If the problem persists, contact an administrator. (5046)"
    C_ERR_PlayerController_is_NULL_5047="An error has occurred during internal processing. Restart the program. If the problem persists, contact an administrator. (5047)"
    C_ERR_NetDriver_InitConnect_Failed_5048="An error has occurred during internal processing. Restart the program. If the problem persists, contact an administrator. (5048)"
    C_ERR_GLevel_is_NULL_5049="An error has occurred during internal processing. Restart the program. If the problem persists, contact an administrator. (5049)"
    C_ERR_CHANGE_HOST_FAILED_Step_0_5050="Failed to change the host. Return to the Lobby and restart the game. (5050)"
    C_ERR_CHANGE_HOST_FAILED_Step_1_5051="Failed to change the host. Return to the Lobby and restart the game. (5051)"
    C_ERR_CHANGE_HOST_FAILED_Step_2_5052="Failed to change the host. Return to the Lobby and restart the game. (5052)"
    C_ERR_CHANGE_HOST_FAILED_Step_3_5053="Failed to change the host. Return to the Lobby and restart the game. (5053)"
    C_ERR_CHANGE_HOST_FAILED_Step_4_5054="Failed to change the host. Return to the Lobby and restart the game. (5054)"
    C_ERR_ServerConnection_is_NULL_5055="An error has occurred during internal processing. Restart the program. If the problem persists, contact an administrator. (5055)"
    C_ERR_LOADING_FAILED_Different_Package_5056="Your package is different from the host's. Please update. (5056)"
    C_ERR_LOADING_FAILED_Different_Package_Number_5057="Your package is different from the host's. Please update. (5057)"
    C_ERR_LOADING_FAILED_StartMatch_Failed_5058="An error has occurred during internal processing. Restart the program. If the problem persists, contact an administrator. (5058)"
    C_ERR_LOADING_FAILED_LoadMap_Failed_5059="An error has occurred during internal processing. Restart the program. If the problem persists, contact an administrator. (5059)"
    C_ERR_Host_UDP_time_out_5060="The connection with the host is poor. Return to the Lobby and restart the game. (5060)"
    C_ERR_Client_UDP_time_out_5061="The connection with the host is poor. Return to the Lobby and restart the game. (5061)"
    C_ERR_LOADING_FAILED_Changed_Host_5062="Unable to continue loading due to a host change. Return to the Lobby and restart the game. (5062)"
    C_ERR_LOADING_FAILED_Start_Dummy_Time_Is_Zero_5063="Network setup failed. Try restarting the game. (5063)"
    C_ERR_LOADING_FAILED_Dummy_Check_Failed_5064="Network setup failed. Try restarting the game. (5064)"
    C_ERR_LOADING_FAILED_WrongStep_7_5065="An error occurred while loading. Try restarting the game from the Lobby. (5065)"
    C_ERR_LOADING_FAILED_Dummy_Phrase_Invalid_5066="Network setup failed. Try restarting the game. (5066)"
    C_ERR_LOADING_FAILED_Dummy_Check_From_Server_5067="Network setup failed. Try restarting the game. (5067)"
    C_ERR_LOADING_FAILED_Dummy_Check_Exception_5068="Network setup failed. Try restarting the game. (5068)"
    C_ERR_LOADING_FAILED_Dummy_Check_Failed_User_List_Emtpy_5069="Network setup failed. Try restarting the game. (5069)"
    C_ERR_LOADING_FAILED_Host_Blocking_Time_Out_5070="Network setup failed. Try restarting the game. (5070)"
    C_ERR_LOADING_FAILED_GameOver_While_HolePunching_5071="The game was closed while loading was in progress. Try restarting the game. (5071)"
    C_ERR_LOADING_FAILED_May_Be_Host_Crash_In_Loading_5072="The host failed to load. Unable to continue loading. Return to the Lobby and restart the game. (5072)"
    C_ERR_LOADING_FAILED_OnClose_From_Server_5073="The host has been disconnected from the server. Return to the Lobby and restart the game. (5073)"
    C_ERR_CHANGE_HOST_FAILED_New_Host_Step_0_5074="Failed to change the host. Return to the Lobby and restart the game. (5074)"
    C_ERR_CHANGE_HOST_FAILED_New_Host_Step_1_5075="Failed to change the host. Return to the Lobby and restart the game. (5075)"
    C_ERR_CHANGE_HOST_FAILED_New_Host_Step_2_5076="Failed to change the host. Return to the Lobby and restart the game. (5076)"
    C_ERR_CHANGE_HOST_FAILED_New_Host_Step_3_5077="Failed to change the host. Return to the Lobby and restart the game. (5077)"
    C_ERR_CHANGE_HOST_FAILED_New_Host_Step_4_5078="Failed to change the host. Return to the Lobby and restart the game. (5078)"
    C_ERR_LOADING_FAILED_Dummy_Check_From_Server_5079="Network setup failed. Try restarting the game. (5079)"
    C_ERR_LOADING_FAILED_May_Be_Host_Crash_In_Loading_5080="The host failed to load. Unable to continue loading. Return to the Lobby and restart the game. (5080)"
    C_ERR_LOADING_FAILED_Inervention_Failed_By_ChangeRoomOwner_5081="Failed to intervene due to the change of host. Return to the Lobby and restart the game. (5081)"
    C_ERR_LOADING_FAILED_Inervention_MapLoading_Failed_5082="Failed to intervene due to the change of host. Return to the Lobby and restart the game. (5082)"
    C_ERR_LOADING_FAILED_Already_Started_HolePunching_5083="Network setup failed. Try restarting the game. (5083)"
    C_ERR_LOADING_FAILED_Failed_Register_OutSide_Addr_5084="Network setup failed. Try restarting the game. (5084)"
    C_ERR_LOADING_FAILED_More_Received_OutSide_Addr_5085="Network setup failed. Try restarting the game. (5085)"
    C_ERR_LOADING_FAILED_Set_Allow_Start_HolePunching_Failed_5086="Network setup failed. Try restarting the game. (5086)"
    C_ERR_LOADING_FAILED_Recv_Client_OSA_In_Wrong_Step_5087="Network setup failed. Try restarting the game. (5087)"
    C_ERR_LOADING_FAILED_Wait_AckStartHolePunching_Failed_C_5088="Network setup failed. Try restarting the game. (5088)"
    C_ERR_LOADING_FAILED_WrongStep_8_5089="An error occurred while loading. Try restarting the game from the Lobby. (5089)"
    C_ERR_LOADING_FAILED_IntUser_Allow_HolePunching_Failed_5090="Network setup failed. Try restarting the game. (5090)"
    C_ERR_LOADING_FAILED_IntUser_Allow_HolePunching_Failed_5091="Network setup failed. Try restarting the game. (5091)"
    C_ERR_LOADING_FAILED_Allow_HolePunching_Failed_5092="Network setup failed. Try restarting the game. (5092)"
    C_ERR_LOADING_FAILED_More_Received_OutSide_Addr_CH_5093="Network setup failed. Try restarting the game. (5093)"
    C_ERR_LOADING_FAILED_Wrong_GameType_CH_5094="Network setup failed. Try restarting the game. (5094)"
    C_ERR_LOADING_FAILED_Dummy_Packet_Time_Out_CH_5095="Network setup failed. Try restarting the game. (5095)"
    C_ERR_LOADING_FAILED_ClientRequestTimeIsZero_CC_5096="Network setup failed. Try restarting the game. (5096)"
    C_ERR_LOADING_FAILED_Wait_AckStartHolePunching_Failed_CC_5097="Network setup failed. Try restarting the game. (5097)"
    C_ERR_LOADING_FAILED_Allow_Start_HolePunching_Failed_CH_5098="Network setup failed. Try restarting the game. (5098)"
    C_ERR_LOADING_FAILED_Allow_Start_HolePunching_Failed_CC_5099="Network setup failed. Try restarting the game. (5099)"
    C_ERR_LOADING_FAILED_Wrong_Game_Type_CC_5100="Network setup failed. Try restarting the game. (5100)"
    C_ERR_LOADING_FAILED_Hole_Punching_Failed_CC_5101="Network setup failed. Try restarting the game. (5101)"
    C_ERR_LOADING_FAILED_Hole_Punching_Failed_CH_5102="Network setup failed. Try restarting the game. (5102)"
    C_ERR_LOADING_FAILED_Hole_Punching_Failed_H_5103="Network setup failed. Try restarting the game. (5103)"
    C_ERR_LOADING_FAILED_Hole_Punching_Failed_All_5104="Network setup failed. Try restarting the game. (5104)"
    C_ERR_LOADING_FAILED_Allow_NatChecker_Tick_Failed_H_5105="Network setup failed. Try restarting the game. (5105)"
    C_ERR_LOADING_FAILED_Allow_NatChecker_Tick_Failed_CH_5106="Network setup failed. Try restarting the game. (5106)"
    C_ERR_LOADING_FAILED_Allow_NatChecker_Tick_Failed_C_5107="Network setup failed. Try restarting the game. (5107)"
    C_ERR_LOADING_FAILED_Allow_NatChecker_Tick_Failed_CC_5108="Network setup failed. Try restarting the game. (5108)"
    C_ERR_LOADING_FAILED_Allow_NatChecker_Tick_Failed_IC_5109="Network setup failed. Try restarting the game. (5109)"
    C_ERR_LOADING_FAILED_Found_Overlap_User_Name_5110="The username already exists. Try restarting the game later. (5110)"
    m_IniSection="wBtrErrIni"
}