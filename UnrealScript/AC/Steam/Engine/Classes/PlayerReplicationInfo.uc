/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\PlayerReplicationInfo.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:93
 *	Functions:31
 *
 *******************************************************************************/
class PlayerReplicationInfo extends ReplicationInfo
    dependson(ReplicationInfo)
    dependson(wMatchMaker)
    dependson(wMatchUserInfo)
    dependson(GameInfo)
    dependson(VoiceChatRoom)
    dependson(TeamInfo)
    dependson(Volume)
    dependson(Vehicle)
    dependson(ZoneInfo)
    dependson(wGameManager)
    dependson(GameReplicationInfo)
    dependson(VoiceChatReplicationInfo)
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    native
    nativereplication
    notplaceable;

var float Score;
var float fExp;
var float Point;
var int iBodyItemID_0;
var int iBodyItemID_1;
var int iHeadItemID;
var int iHelmetItemID;
var int iAccessoryItemID;
var bool bPickupWeaponDOA;
var bool bCanSeeEnemiesOnMinimap;
var float Deaths;
var Decoration HasFlag;
var int Ping;
var Volume PlayerVolume;
var ZoneInfo PlayerZone;
var int NumLives;
var bool bCannotChangeQS;
var string PlayerName;
var string CharacterName;
var string OldCharacterName;
var string OldName;
var string PreviousName;
var int PlayerID;
var int NPCID;
var int UID;
var TeamInfo Team;
var int TeamID;
var int SideID;
var bool bAdmin;
var bool bIsFemale;
var bool bIsSpectator;
var bool bOnlySpectator;
var bool bWaitingPlayer;
var bool bReadyToPlay;
var bool bOutOfLives;
var bool bBot;
var bool bWelcomed;
var bool bReceivedPing;
var bool bNoTeam;
var bool bTeamNotified;
var byte PacketLoss;
var bool IsDead;
var int StartTime;
var localized string StringDead;
var localized string StringSpectating;
var localized string StringUnknown;
var int GoalsScored;
var int Kills;
var int Assists;
var byte AssistType;
var Vehicle CurrentVehicle;
var LinkedReplicationInfo CustomReplicationInfo;
var VoiceChatReplicationInfo VoiceInfo;
var bool bRegisteredChatRoom;
var VoiceChatRoom PrivateChatRoom;
var int ActiveChannel;
var int VoiceMemberMask;
var byte VoiceID;
var float UAVScanBeginTime;
var float UAVScanEndTime;
var byte bySupply_Helipack;
var byte bySupply_UAV;
var byte bySupply_AirStrike;
var bool EndPCBang;
var Material ClassMark;
var int ClassLevel;
var int ClassLevelMark;
var FloatBox ClassMarkBox;
var Material ClanMark;
var int ClanID;
var IntBox ClanMarkBox;
var int iCurrentWeaponID;
var int NumMedals;
var bool IsIntervented;
var int ElapsedTimeWhenIntervented;
var int TimePlayed;
var int RoundWhenIntervented;
var int RoundPlayed;
var bool bPrecached;
var int KillSuccession;
var float fSpawnedTime;
var string PopMessage;
var float PopMessageEnd;
var bool IsSendGameStartTime;
var bool IsSendRoundStartTime;
var bool IsInvulnerable;
var int nQuickSlotIdx;
var bool IsConnected;
var bool bAdminSpecator;
var int IsFriendOrClanMember;
var bool IsWaitingForStart;
var int iWaitingForStartCountDown;
var int PlayerHealth;

replication
{
    // Pos:0x00
    reliable if(bNetDirty && Role == 4)
        Score, nQuickSlotIdx,
        iWaitingForStartCountDown, IsDead,
        StartTime, Kills,
        Assists, IsInvulnerable,
        ActiveChannel, VoiceMemberMask,
        VoiceID, UAVScanBeginTime,
        IsConnected, UAVScanEndTime,
        bySupply_UAV, bySupply_AirStrike,
        ClassLevel, ClassLevelMark,
        ClanID, iCurrentWeaponID,
        NumMedals, IsIntervented,
        ElapsedTimeWhenIntervented, RoundWhenIntervented,
        bPrecached, bySupply_Helipack,
        bOutOfLives, bReadyToPlay,
        bWaitingPlayer, fExp,
        Point, iBodyItemID_0,
        iBodyItemID_1, iHeadItemID,
        iHelmetItemID, iAccessoryItemID,
        bCanSeeEnemiesOnMinimap, Deaths,
        IsWaitingForStart, PlayerVolume,
        KillSuccession, PlayerZone,
        bCannotChangeQS, PlayerName,
        CharacterName, bAdminSpecator,
        Team, TeamID,
        SideID, bAdmin,
        bIsFemale, bIsSpectator,
        bOnlySpectator, NumLives,
        fSpawnedTime;

    // Pos:0x18
    reliable if(bNetDirty && Role == 4 && bNetOwner && HasFlag == none)
        HasFlag;

    // Pos:0x48
    reliable if(bNetDirty && Role == 4 && !bNetOwner || bDemoRecording)
        PacketLoss, Ping;

    // Pos:0x78
    reliable if(bNetDirty && Role == 4 && bNetInitial)
        bNoTeam, bBot,
        PlayerID, CustomReplicationInfo;

    // Pos:0x9b
    reliable if(Role < 4)
        ServerSetUAV;

}

event PostBeginPlay()
{
    // End:0x12
    if(Role < 4)
    {
        return;
    }
    // End:0x2a
    if(AIController(Owner) != none)
    {
        bBot = true;
    }
    StartTime = Level.Game.GameReplicationInfo.ElapsedTime;
    Timer();
    SetTimer(1.50 + FRand(), true);
    IsConnected = true;
}

simulated event PostNetBeginPlay()
{
    local GameReplicationInfo GRI;
    local VoiceChatReplicationInfo VRI;

    // End:0x30
    if(Level.GRI != none)
    {
        Level.GRI.AddPRI(self);
    }
    // End:0x55
    else
    {
        // End:0x54
        foreach DynamicActors(class'GameReplicationInfo', GRI)
        {
            GRI.AddPRI(self);
            // End:0x54
            break;                        
        }
    }
    // End:0x74
    foreach DynamicActors(class'VoiceChatReplicationInfo', VRI)
    {
        VoiceInfo = VRI;
        // End:0x74
        break;                
    }
    // End:0x88
    if(Team != none)
    {
        bTeamNotified = true;
    }
}

simulated function bool NeedNetNotify()
{
    return !bRegisteredChatRoom || !bNoTeam && Team == none;
}

simulated event PostNetReceive()
{
    local Actor A;
    local PlayerController PC;

    // End:0xd7
    if(!bTeamNotified && Team != none)
    {
        bTeamNotified = true;
        PC = Level.GetLocalPlayerController();
        // End:0xd6
        foreach DynamicActors(class'Actor', A)
        {
            // End:0x9e
            if(Pawn(A) != none && Pawn(A).PlayerReplicationInfo == self)
            {
                Pawn(A).NotifyTeamChanged();
                // End:0x9b
                if(PC.PlayerReplicationInfo != self)
                {
                }
                // End:0xd6
                else
                {
                    // This is an implied JumpToken;
                    goto J0xd5;
                }
                // End:0xd5
                if(A.bNotifyLocalPlayerTeamReceived && PC.PlayerReplicationInfo == self)
                {
                    A.NotifyLocalPlayerTeamReceived();
                }
                J0xd5:
                continue;
            }            
        }
    }
    // End:0x12d
    if(!bRegisteredChatRoom && VoiceInfo != none && PlayerID != default.PlayerID && VoiceID != default.VoiceID)
    {
        bRegisteredChatRoom = true;
        VoiceInfo.AddVoiceChatter(self);
    }
    bNetNotify = NeedNetNotify();
}

simulated function Destroyed()
{
    local GameReplicationInfo GRI;

    Log("PlayerReplicationInfo::Destroyed() Name:" $ PlayerName);
    // End:0x63
    if(Level.GRI != none)
    {
        Level.GRI.RemovePRI(self);
    }
    // End:0x88
    else
    {
        // End:0x87
        foreach DynamicActors(class'GameReplicationInfo', GRI)
        {
            GRI.RemovePRI(self);
            // End:0x87
            break;                        
        }
    }
    // End:0xa8
    if(VoiceInfo == none)
    {
        // End:0xa7
        foreach DynamicActors(class'VoiceChatReplicationInfo', VoiceInfo)
        {
            // End:0xa7
            break;                        
        }
    }
    // End:0xc3
    if(VoiceInfo != none)
    {
        VoiceInfo.RemoveVoiceChatter(self);
    }
    super(Actor).Destroyed();
}

simulated function ServerSetUAV(float Begin, float End)
{
    UAVScanBeginTime = Begin;
    UAVScanEndTime = End;
}

simulated event LoadLevelMark()
{
    // End:0xed
    if(ClassMark == none)
    {
        // End:0x3a
        if(bBot)
        {
            // End:0x37
            if(ClassLevel == 0)
            {
                ClassLevel = int(RandRange(1.0, 75.0));
            }
        }
        // End:0x82
        else
        {
            ClassLevel = Level.GetMatchMaker().GetUserGradeByUserName(PlayerName);
            ClassLevelMark = Level.GetMatchMaker().GetUserLevelMarkIDByUserName(PlayerName);
        }
        // End:0xed
        if(ClassLevel >= 0)
        {
            ClassMark = Material(DynamicLoadObject(Level.GameMgr.GetLevelImageString(ClassLevel, ClassLevelMark), class'Material'));
            ClassMarkBox = Level.GameMgr.GetLevelImageCoordi(ClassLevel, ClassLevelMark);
        }
    }
}

function SetCharacterVoice(string S);
function SetCharacterName(string S)
{
    CharacterName = S;
}

function SetCharacterEquipItem(int iBodyID_AF, int iBodyID_RSA, int iHeadID, int iHelmetID, int iAccessoryID)
{
    iBodyItemID_0 = iBodyID_AF;
    iBodyItemID_1 = iBodyID_RSA;
    iHeadItemID = iHeadID;
    iHelmetItemID = iHelmetID;
    iAccessoryItemID = iAccessoryID;
}

function Reset()
{
    Log("[PlayerReplicationInfo::Reset] " $ PlayerName);
    super(Actor).Reset();
    Score = 0.0;
    fExp = 0.0;
    Point = 0.0;
    Deaths = 0.0;
    HasFlag = none;
    bReadyToPlay = false;
    Log("[PlayerReplicationInfo::Reset] " $ PlayerName $ " NumLives=0");
    NumLives = 0;
    bOutOfLives = false;
    KillSuccession = 0;
    IsSendGameStartTime = false;
    IsSendRoundStartTime = false;
    Assists = 0;
    AssistType = 0;
}

simulated function string GetHumanReadableName()
{
    return PlayerName;
}

simulated function string GetLocationName()
{
    local string VehicleString;
    local Vehicle V;

    // End:0x4d
    if(PlayerVolume == none && PlayerZone == none)
    {
        // End:0x47
        if(Owner != none && Controller(Owner).IsInState('Dead'))
        {
            return StringDead;
        }
        // End:0x4d
        else
        {
            return StringSpectating;
        }
    }
    // End:0xa1
    if(Owner != none)
    {
        // End:0x9e
        if(Vehicle(Controller(Owner).Pawn) != none)
        {
            VehicleString = Vehicle(Controller(Owner).Pawn).GetVehiclePositionString();
        }
    }
    // End:0x18a
    else
    {
        // End:0x18a
        if(Level.NetMode == 3)
        {
            // End:0xf3
            if(CurrentVehicle != none && CurrentVehicle.PlayerReplicationInfo == self)
            {
                VehicleString = CurrentVehicle.GetVehiclePositionString();
            }
            // End:0x18a
            else
            {
                // End:0x18a
                if(Level.TimeSeconds - Level.LastVehicleCheck > float(1))
                {
                    // End:0x161
                    foreach DynamicActors(class'Vehicle', V)
                    {
                        // End:0x160
                        if(V.PlayerReplicationInfo == self)
                        {
                            VehicleString = V.GetVehiclePositionString();
                            CurrentVehicle = V;
                        }
                        // End:0x161
                        else
                        {
                            continue;
                        }                        
                    }
                    // End:0x18a
                    if(V == none)
                    {
                        Level.LastVehicleCheck = Level.TimeSeconds;
                    }
                }
            }
        }
    }
    // End:0x1fe
    if(PlayerVolume != none && PlayerVolume.LocationName != class'Volume'.default.LocationName)
    {
        // End:0x1e5
        if(Len(PlayerVolume.LocationName @ VehicleString) > 32)
        {
            return PlayerVolume.LocationName;
        }
        return PlayerVolume.LocationName @ VehicleString;
    }
    // End:0x2b4
    else
    {
        // End:0x266
        if(PlayerZone != none && PlayerZone.LocationName != "")
        {
            // End:0x24d
            if(Len(PlayerZone.LocationName @ VehicleString) > 32)
            {
                return PlayerZone.LocationName;
            }
            return PlayerZone.LocationName @ VehicleString;
        }
        // End:0x2b4
        else
        {
            // End:0x27b
            if(VehicleString != "")
            {
                return VehicleString;
            }
            // End:0x2b4
            else
            {
                // End:0x2ae
                if(Level.Title != Level.default.Title)
                {
                    return Level.Title;
                }
                // End:0x2b4
                else
                {
                    return StringUnknown;
                }
            }
        }
    }
}

simulated function Material GetPortrait();
event UpdateCharacter();
function UpdatePlayerState()
{
    local Controller C;

    // End:0x77
    if(Owner != none && PlayerController(Owner) != none)
    {
        C = Controller(Owner);
        // End:0x6a
        if(C.IsInState('Dead') || PlayerController(Owner).IsSpectating())
        {
            self.IsDead = true;
        }
        // End:0x77
        else
        {
            self.IsDead = false;
        }
    }
}

function UpdatePlayerLocation()
{
    local Volume V, Best;
    local Pawn P;
    local Controller C;

    // End:0x1f
    if(C != none)
    {
        P = C.Pawn;
    }
    // End:0x3a
    if(P == none)
    {
        PlayerVolume = none;
        PlayerZone = none;
        return;
    }
    // End:0x70
    if(PlayerZone != P.Region.Zone)
    {
        PlayerZone = P.Region.Zone;
    }
    // End:0xf7
    foreach P.TouchingActors(class'Volume', V)
    {
        // End:0xa2
        if(V.LocationName == "")
        {
            continue;
        }
        // End:0xf7
        else
        {
            // End:0xd4
            if(Best != none && V.LocationPriority <= Best.LocationPriority)
            {
                continue;
            }
            // End:0xf7
            else
            {
                // End:0xf6
                if(V.Encompasses(P))
                {
                    Best = V;
                }
                continue;
            }
        }        
    }
    // End:0x112
    if(PlayerVolume != Best)
    {
        PlayerVolume = Best;
    }
}

simulated function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
    // End:0x7d
    if(Team != none)
    {
        Canvas.DrawText("     PlayerName " $ PlayerName $ " Team " $ Team.GetHumanReadableName() $ "(" $ string(Team.TeamIndex) $ ") has flag " $ string(HasFlag));
    }
    // End:0xae
    else
    {
        Canvas.DrawText("     PlayerName " $ PlayerName $ " NO Team");
    }
    // End:0x167
    if(!bBot)
    {
        YPos += YL;
        Canvas.SetPos(4.0, YL);
        Canvas.DrawText("               bIsSpec:" $ string(bIsSpectator) @ "OnlySpec:" $ string(bOnlySpectator) @ "Waiting:" $ string(bWaitingPlayer) @ "Ready:" $ string(bReadyToPlay) @ "OutOfLives:" $ string(bOutOfLives));
    }
}

event ClientNameChange()
{
    local PlayerController PC;

    // End:0x28
    foreach DynamicActors(class'PlayerController', PC)
    {
        PC.ReceiveLocalizedMessage(class'GameMessage', 2, self);                
    }
}

function Timer()
{
    local Controller C;

    UpdatePlayerState();
    UpdatePlayerLocation();
    SetTimer(1.50 + FRand(), true);
    // End:0x27
    if(FRand() < 0.650)
    {
        return;
    }
    // End:0x7a
    if(!bBot)
    {
        C = Controller(Owner);
        // End:0x7a
        if(!bReceivedPing)
        {
            Ping = Min(int(0.250 * float(C.ConsoleCommand("GETPING"))), 255);
        }
    }
}

function SetPlayerName(string S)
{
    Log("[PlayerReplicationInfo::SetPlayerName] " $ S);
    OldName = PlayerName;
    PlayerName = S;
    // End:0x71
    if(PlayerController(Owner) != none)
    {
        PlayerController(Owner).PlayerOwnerName = S;
    }
}

function SetWaitingPlayer(bool B)
{
    bIsSpectator = B;
    bWaitingPlayer = B;
}

function SetChatPassword(string InPassword)
{
    // End:0x1f
    if(PrivateChatRoom != none)
    {
        PrivateChatRoom.SetChannelPassword(InPassword);
    }
}

function SetVoiceMemberMask(int NewMask)
{
    VoiceMemberMask = NewMask;
}

simulated function string GetCallSign()
{
    // End:0x0f
    if(TeamID > 14)
    {
        return "";
    }
    return class'GameInfo'.default.CallSigns[TeamID];
}

simulated event string GetNameCallSign()
{
    // End:0x12
    if(TeamID > 14)
    {
        return PlayerName;
    }
    return PlayerName $ " [" $ class'GameInfo'.default.CallSigns[TeamID] $ "]";
}

function SetIsSendGameStartTime(bool bSend)
{
    IsSendGameStartTime = bSend;
}

function bool GetIsSendGameStartTime()
{
    return IsSendGameStartTime;
}

simulated function int GetUID()
{
    // End:0x33
    if(UID == -1)
    {
        UID = Level.GetMatchMaker().GetUIDByUserName(PlayerName);
    }
    return UID;
}

function SetQuickSlotIdx(int nIdx)
{
    nQuickSlotIdx = nIdx;
}

simulated function int GetCheckFriendOrClanMember()
{
    local int fl1, nUID, nUID2;

    // End:0xf9
    if(IsFriendOrClanMember == -1)
    {
        nUID = Level.GetMatchMaker().GetUIDByUserName(PlayerName);
        fl1 = 0;
        J0x3a:
        // End:0xf9 [While If]
        if(fl1 < Level.GetMatchMaker().UserInfos.Length)
        {
            nUID2 = Level.GetMatchMaker().UserInfos[fl1].UID;
            // End:0xef
            if(nUID == nUID2)
            {
                // End:0xe5
                if(Level.GetMatchMaker().IsFriendlyUser(PlayerName, Level.GetMatchMaker().GetUserClanNameByUserName(PlayerName)))
                {
                    IsFriendOrClanMember = 1;
                    // This is an implied JumpToken;
                    goto J0xf9;
                }
                // End:0xef
                else
                {
                    IsFriendOrClanMember = 0;
                    // This is an implied JumpToken;
                    goto J0xf9;
                }
            }
            ++ fl1;
            // This is an implied JumpToken; Continue!
            goto J0x3a;
        }
    }
    J0xf9:
    return IsFriendOrClanMember;
}

defaultproperties
{
    UID=-1
    StringDead="Dead"
    StringSpectating="Spectating"
    StringUnknown="Unknown"
    VoiceID=255
    UAVScanBeginTime=-999.0
    UAVScanEndTime=-999.0
    ClassLevel=-1
    IsInvulnerable=true
    IsFriendOrClanMember=-1
    NetUpdateFrequency=1.0
    bNetNotify=true
}