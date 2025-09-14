class wMessage_BGM extends LocalMessage
    notplaceable
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var int Code_Start;
var int Code_Combat;
var int Code_WinAF;
var int Code_WinRSA;
var int Code_LoseAF;
var int Code_LoseRSA;
var int Code_AlmostOverLead;
var int Code_AlmostOverFallBehind;
var int BGMDuration;
var int BGMInterval;

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    return "";
    //return;    
}

static function ClientReceive(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    local array<string> M;
    local string Map;
    local wMapInfo mapInfo;
    local array<IntArray> bgmInitSeeks;
    local IntArray aIntArray, tempSeeks;
    local wMatchMaker MM;

    MM = P.Level.GetMatchMaker();
    Log("[wMessage_BGM::ClientReceive]" @ string(Switch));
    switch(Switch)
    {
        // End:0x9E
        case default.Code_Start:
            // End:0x84
            if(MM.kTeamID == 0)
            {
                M[0] = "bgm_af_start";                
            }
            else
            {
                M[0] = "bgm_rsa_start";
            }
            // End:0x3CC
            break;
        // End:0x300
        case default.Code_Combat:
            // End:0x2FE
            if(!P.Player.Console.IsBGMPlaying())
            {
                Map = P.Level.GetMatchMaker().szMapName;
                mapInfo = P.Level.GetMatchMaker().MapSettings.GetMapInfo(Map);
                // End:0x1CE
                if(MM.kTeamID == 0)
                {
                    M[0] = mapInfo.BGM1;
                    tempSeeks.Values[0] = mapInfo.BGM1_Times[0];
                    tempSeeks.Values[1] = mapInfo.BGM1_Times[1];
                    tempSeeks.Values[2] = mapInfo.BGM1_Times[2];
                    tempSeeks.Values[3] = mapInfo.BGM1_Times[3];                    
                }
                else
                {
                    M[0] = mapInfo.BGM2;
                    tempSeeks.Values[0] = mapInfo.BGM2_Times[0];
                    tempSeeks.Values[1] = mapInfo.BGM2_Times[1];
                    tempSeeks.Values[2] = mapInfo.BGM2_Times[2];
                    tempSeeks.Values[3] = mapInfo.BGM2_Times[3];
                }
                aIntArray.Values[0] = tempSeeks.Values[P.BGMLastInitialSeekIdx];
                bgmInitSeeks[0] = aIntArray;
                P.BGMLastInitialSeekIdx++;
                // End:0x2CD
                if(P.BGMLastInitialSeekIdx >= tempSeeks.Values.Length)
                {
                    P.BGMLastInitialSeekIdx = 0;
                }
                P.Player.Console.SetBGMAdvanced(M, true, default.BGMDuration, bgmInitSeeks);
            }
            return;
        // End:0x31F
        case default.Code_WinAF:
            M[0] = "bgm_af_win";
            // End:0x3CC
            break;
        // End:0x33F
        case default.Code_WinRSA:
            M[0] = "bgm_rsa_win";
            // End:0x3CC
            break;
        // End:0x35F
        case default.Code_LoseAF:
            M[0] = "bgm_af_lose";
            // End:0x3CC
            break;
        // End:0x380
        case default.Code_LoseRSA:
            M[0] = "bgm_rsa_lose";
            // End:0x3CC
            break;
        // End:0x3A5
        case default.Code_AlmostOverLead:
            M[0] = "bgm_last_winning";
            // End:0x3CC
            break;
        // End:0x3C9
        case default.Code_AlmostOverFallBehind:
            M[0] = "bgm_last_losing";
            // End:0x3CC
            break;
        // End:0xFFFF
        default:
            break;
    }
    P.Player.Console.SetBGM(M);
    //return;    
}

defaultproperties
{
    Code_Combat=2
    Code_WinAF=3
    Code_WinRSA=4
    Code_LoseAF=5
    Code_LoseRSA=6
    Code_AlmostOverLead=7
    Code_AlmostOverFallBehind=8
    BGMDuration=53
    BGMInterval=100
}