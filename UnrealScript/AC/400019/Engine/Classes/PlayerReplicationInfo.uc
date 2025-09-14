class PlayerReplicationInfo extends ReplicationInfo
    native
    nativereplication
    notplaceable
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var float Score;
var float fExp;
var float Point;
var float PointIns;
var int aiBodyItemID[2];
var int iHeadItemID;
var int iHelmetItemID;
var int iAccessoryItemID;
var int iBackPackItemID;
var int iPouchItemID;
var int iCamouflageItemID;
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
var byte abySupplyItemFlag[5];
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
var bool IsCriticalState;
var int nQuickSlotIdx;
var bool IsConnected;
var bool bAdminSpecator;
var int IsFriendOrClanMember;
var bool IsWaitingForStart;
var int iWaitingForStartCountDown;
var int PlayerHealth;

replication
{
    // Pos:0x000
    reliable if(bNetDirty && int(Role) == int(ROLE_Authority))
        ActiveChannel, Assists, 
        CharacterName, ClanID, 
        ClassLevel, ClassLevelMark, 
        Deaths, ElapsedTimeWhenIntervented, 
        IsConnected, IsCriticalState, 
        IsDead, IsIntervented, 
        IsInvulnerable, IsWaitingForStart, 
        KillSuccession, Kills, 
        NumLives, NumMedals, 
        PlayerName, PlayerVolume, 
        PlayerZone, Point, 
        PointIns, RoundWhenIntervented, 
        Score, SideID, 
        StartTime, Team, 
        TeamID, UAVScanBeginTime, 
        UAVScanEndTime, VoiceID, 
        VoiceMemberMask, abySupplyItemFlag, 
        aiBodyItemID, bAdmin, 
        bAdminSpecator, bCanSeeEnemiesOnMinimap, 
        bCannotChangeQS, bIsFemale, 
        bIsSpectator, bOnlySpectator, 
        bOutOfLives, bPrecached, 
        bReadyToPlay, bWaitingPlayer, 
        fExp, fSpawnedTime, 
        iAccessoryItemID, iBackPackItemID, 
        iCamouflageItemID, iCurrentWeaponID, 
        iHeadItemID, iHelmetItemID, 
        iPouchItemID, iWaitingForStartCountDown, 
        nQuickSlotIdx;

    // Pos:0x018
    reliable if(((bNetDirty && int(Role) == int(ROLE_Authority)) && bNetOwner) && HasFlag == none)
        HasFlag;

    // Pos:0x048
    reliable if((bNetDirty && int(Role) == int(ROLE_Authority)) && !bNetOwner || bDemoRecording)
        PacketLoss, Ping;

    // Pos:0x078
    reliable if((bNetDirty && int(Role) == int(ROLE_Authority)) && bNetInitial)
        CustomReplicationInfo, PlayerID, 
        bBot, bNoTeam;

    // Pos:0x09B
    reliable if(int(Role) < int(ROLE_Authority))
        ServerSetUAV;
}

event PostBeginPlay()
{
    local int i;

    // End:0x12
    if(int(Role) < int(ROLE_Authority))
    {
        return;
    }
    // End:0x2A
    if(AIController(Owner) != none)
    {
        bBot = true;
    }
    StartTime = Level.Game.GameReplicationInfo.ElapsedTime;
    Timer();
    SetTimer(1.5000000 + FRand(), true);
    IsConnected = true;
    i = 0;
    J0x72:

    // End:0x98 [Loop If]
    if(i < int(5))
    {
        abySupplyItemFlag[i] = 0;
        ++i;
        // [Loop Continue]
        goto J0x72;
    }
    //return;    
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
    else
    {
        // End:0x54
        foreach DynamicActors(Class'Engine.GameReplicationInfo', GRI)
        {
            GRI.AddPRI(self);
            // End:0x54
            break;            
        }        
    }
    // End:0x74
    foreach DynamicActors(Class'Engine.VoiceChatReplicationInfo', VRI)
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
    //return;    
}

simulated function bool NeedNetNotify()
{
    return !bRegisteredChatRoom || !bNoTeam && Team == none;
    //return;    
}

simulated event PostNetReceive()
{
    local Actor A;
    local PlayerController PC;

    // End:0xD7
    if(!bTeamNotified && Team != none)
    {
        bTeamNotified = true;
        PC = Level.GetLocalPlayerController();
        // End:0xD6
        foreach DynamicActors(Class'Engine.Actor', A)
        {
            // End:0x9E
            if((Pawn(A) != none) && Pawn(A).PlayerReplicationInfo == self)
            {
                Pawn(A).NotifyTeamChanged();
                // End:0x9B
                if(PC.PlayerReplicationInfo != self)
                {
                    // End:0xD6
                    break;
                }
                // End:0xD5
                continue;
            }
            // End:0xD5
            if(A.bNotifyLocalPlayerTeamReceived && PC.PlayerReplicationInfo == self)
            {
                A.NotifyLocalPlayerTeamReceived();
            }            
        }        
    }
    // End:0x12D
    if(((!bRegisteredChatRoom && VoiceInfo != none) && PlayerID != default.PlayerID) && int(VoiceID) != int(default.VoiceID))
    {
        bRegisteredChatRoom = true;
        VoiceInfo.AddVoiceChatter(self);
    }
    bNetNotify = NeedNetNotify();
    //return;    
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
    else
    {
        // End:0x87
        foreach DynamicActors(Class'Engine.GameReplicationInfo', GRI)
        {
            GRI.RemovePRI(self);
            // End:0x87
            break;            
        }        
    }
    // End:0xA8
    if(VoiceInfo == none)
    {
        // End:0xA7
        foreach DynamicActors(Class'Engine.VoiceChatReplicationInfo', VoiceInfo)
        {
            // End:0xA7
            break;            
        }        
    }
    // End:0xC3
    if(VoiceInfo != none)
    {
        VoiceInfo.RemoveVoiceChatter(self);
    }
    super(Actor).Destroyed();
    //return;    
}

simulated function ServerSetUAV(float Begin, float End)
{
    UAVScanBeginTime = Begin;
    UAVScanEndTime = End;
    //return;    
}

simulated event LoadLevelMark()
{
    // End:0xED
    if(ClassMark == none)
    {
        // End:0x3A
        if(bBot)
        {
            // End:0x37
            if(ClassLevel == 0)
            {
                ClassLevel = int(RandRange(1.0000000, 75.0000000));
            }            
        }
        else
        {
            ClassLevel = Level.GetMatchMaker().GetUserGradeByUserName(PlayerName);
            ClassLevelMark = Level.GetMatchMaker().GetUserLevelMarkIDByUserName(PlayerName);
        }
        // End:0xED
        if(ClassLevel >= 0)
        {
            ClassMark = Material(DynamicLoadObject(Level.GameMgr.GetLevelImageString(ClassLevel, ClassLevelMark), Class'Engine.Material'));
            ClassMarkBox = Level.GameMgr.GetLevelImageCoordi(ClassLevel, ClassLevelMark);
        }
    }
    //return;    
}

function SetCharacterVoice(string S)
{
    //return;    
}

function SetCharacterName(string S)
{
    CharacterName = S;
    //return;    
}

simulated function NewSetCharacterEquipItem(int iBodyID_AF, int iBodyID_RSA, int iHelmetID, int iAccessoryID, int iBackPackID, int iPouchID, int iCamouflageID)
{
    aiBodyItemID[0] = iBodyID_AF;
    aiBodyItemID[1] = iBodyID_RSA;
    iHelmetItemID = iHelmetID;
    iAccessoryItemID = iAccessoryID;
    iBackPackItemID = iBackPackID;
    iPouchItemID = iPouchID;
    iCamouflageItemID = iCamouflageID;
    //return;    
}

simulated function SetCharacterEquipItem(int iBodyID_AF, int iBodyID_RSA, int iHeadID, int iHelmetID, int iAccessoryID)
{
    aiBodyItemID[0] = iBodyID_AF;
    aiBodyItemID[1] = iBodyID_RSA;
    iHeadItemID = iHeadID;
    iHelmetItemID = iHelmetID;
    iAccessoryItemID = iAccessoryID;
    //return;    
}

function Reset()
{
    Log("[PlayerReplicationInfo::Reset] " $ PlayerName);
    super(Actor).Reset();
    Score = 0.0000000;
    fExp = 0.0000000;
    Point = 0.0000000;
    Deaths = 0.0000000;
    HasFlag = none;
    bReadyToPlay = false;
    Log(("[PlayerReplicationInfo::Reset] " $ PlayerName) $ " NumLives=0");
    NumLives = 0;
    bOutOfLives = false;
    KillSuccession = 0;
    IsSendGameStartTime = false;
    IsSendRoundStartTime = false;
    IsCriticalState = false;
    Assists = 0;
    AssistType = 0;
    //return;    
}

simulated function string GetHumanReadableName()
{
    return PlayerName;
    //return;    
}

simulated function string GetLocationName()
{
    local string VehicleString;
    local Vehicle V;

    // End:0x4D
    if((PlayerVolume == none) && PlayerZone == none)
    {
        // End:0x47
        if((Owner != none) && Controller(Owner).IsInState('Dead'))
        {
            return StringDead;            
        }
        else
        {
            return StringSpectating;
        }
    }
    // End:0xA1
    if(Owner != none)
    {
        // End:0x9E
        if(Vehicle(Controller(Owner).Pawn) != none)
        {
            VehicleString = Vehicle(Controller(Owner).Pawn).GetVehiclePositionString();
        }        
    }
    else
    {
        // End:0x18A
        if(int(Level.NetMode) == int(NM_Client))
        {
            // End:0xF3
            if((CurrentVehicle != none) && CurrentVehicle.PlayerReplicationInfo == self)
            {
                VehicleString = CurrentVehicle.GetVehiclePositionString();                
            }
            else
            {
                // End:0x18A
                if((Level.TimeSeconds - Level.LastVehicleCheck) > float(1))
                {
                    // End:0x161
                    foreach DynamicActors(Class'Engine.Vehicle', V)
                    {
                        // End:0x160
                        if(V.PlayerReplicationInfo == self)
                        {
                            VehicleString = V.GetVehiclePositionString();
                            CurrentVehicle = V;
                            // End:0x161
                            break;
                        }                        
                    }                    
                    // End:0x18A
                    if(V == none)
                    {
                        Level.LastVehicleCheck = Level.TimeSeconds;
                    }
                }
            }
        }
    }
    // End:0x1FE
    if((PlayerVolume != none) && PlayerVolume.LocationName != Class'Engine.Volume'.default.LocationName)
    {
        // End:0x1E5
        if(Len(PlayerVolume.LocationName @ VehicleString) > 32)
        {
            return PlayerVolume.LocationName;
        }
        return PlayerVolume.LocationName @ VehicleString;        
    }
    else
    {
        // End:0x266
        if((PlayerZone != none) && PlayerZone.LocationName != "")
        {
            // End:0x24D
            if(Len(PlayerZone.LocationName @ VehicleString) > 32)
            {
                return PlayerZone.LocationName;
            }
            return PlayerZone.LocationName @ VehicleString;            
        }
        else
        {
            // End:0x27B
            if(VehicleString != "")
            {
                return VehicleString;                
            }
            else
            {
                // End:0x2AE
                if(Level.Title != Level.default.Title)
                {
                    return Level.Title;                    
                }
                else
                {
                    return StringUnknown;
                }
            }
        }
    }
    //return;    
}

simulated function Material GetPortrait()
{
    //return;    
}

event UpdateCharacter()
{
    //return;    
}

function UpdatePlayerState()
{
    local Controller C;

    // End:0x77
    if((Owner != none) && PlayerController(Owner) != none)
    {
        C = Controller(Owner);
        // End:0x6A
        if(C.IsInState('Dead') || PlayerController(Owner).IsSpectating())
        {
            self.IsDead = true;            
        }
        else
        {
            self.IsDead = false;
        }
    }
    //return;    
}

function UpdatePlayerLocation()
{
    local Volume V, Best;
    local Pawn P;
    local Controller C;

    // End:0x1F
    if(C != none)
    {
        P = C.Pawn;
    }
    // End:0x3A
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
    // End:0xF7
    foreach P.TouchingActors(Class'Engine.Volume', V)
    {
        // End:0xA2
        if(V.LocationName == "")
        {
            continue;            
        }
        // End:0xD4
        if((Best != none) && V.LocationPriority <= Best.LocationPriority)
        {
            continue;            
        }
        // End:0xF6
        if(V.Encompasses(P))
        {
            Best = V;
        }        
    }    
    // End:0x112
    if(PlayerVolume != Best)
    {
        PlayerVolume = Best;
    }
    //return;    
}

simulated function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
    // End:0x7D
    if(Team != none)
    {
        Canvas.DrawText((((((("     PlayerName " $ PlayerName) $ " Team ") $ Team.GetHumanReadableName()) $ "(") $ string(Team.TeamIndex)) $ ") has flag ") $ string(HasFlag));        
    }
    else
    {
        Canvas.DrawText(("     PlayerName " $ PlayerName) $ " NO Team");
    }
    // End:0x167
    if(!bBot)
    {
        YPos += YL;
        Canvas.SetPos(4.0000000, YL);
        Canvas.DrawText((((((((("               bIsSpec:" $ string(bIsSpectator)) @ "OnlySpec:") $ string(bOnlySpectator)) @ "Waiting:") $ string(bWaitingPlayer)) @ "Ready:") $ string(bReadyToPlay)) @ "OutOfLives:") $ string(bOutOfLives));
    }
    //return;    
}

event ClientNameChange()
{
    local PlayerController PC;

    // End:0x28
    foreach DynamicActors(Class'Engine.PlayerController', PC)
    {
        PC.ReceiveLocalizedMessage(Class'Engine.GameMessage', 2, self);        
    }    
    //return;    
}

function Timer()
{
    local Controller C;

    UpdatePlayerState();
    UpdatePlayerLocation();
    SetTimer(1.5000000 + FRand(), true);
    // End:0x27
    if(FRand() < 0.6500000)
    {
        return;
    }
    // End:0x7A
    if(!bBot)
    {
        C = Controller(Owner);
        // End:0x7A
        if(!bReceivedPing)
        {
            Ping = Min(int(0.2500000 * float(C.ConsoleCommand("GETPING"))), 255);
        }
    }
    //return;    
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
    //return;    
}

function SetWaitingPlayer(bool B)
{
    bIsSpectator = B;
    bWaitingPlayer = B;
    //return;    
}

function SetChatPassword(string InPassword)
{
    // End:0x1F
    if(PrivateChatRoom != none)
    {
        PrivateChatRoom.SetChannelPassword(InPassword);
    }
    //return;    
}

function SetVoiceMemberMask(int NewMask)
{
    VoiceMemberMask = NewMask;
    //return;    
}

simulated function string GetCallSign()
{
    // End:0x0F
    if(TeamID > 14)
    {
        return "";
    }
    return Class'Engine.GameInfo'.default.CallSigns[TeamID];
    //return;    
}

simulated event string GetNameCallSign()
{
    // End:0x12
    if(TeamID > 14)
    {
        return PlayerName;
    }
    return ((PlayerName $ " [") $ Class'Engine.GameInfo'.default.CallSigns[TeamID]) $ "]";
    //return;    
}

function SetIsSendGameStartTime(bool bSend)
{
    IsSendGameStartTime = bSend;
    //return;    
}

function bool GetIsSendGameStartTime()
{
    return IsSendGameStartTime;
    //return;    
}

simulated function int GetUID()
{
    // End:0x33
    if(UID == -1)
    {
        UID = Level.GetMatchMaker().GetUIDByUserName(PlayerName);
    }
    return UID;
    //return;    
}

function SetQuickSlotIdx(int nIdx)
{
    nQuickSlotIdx = nIdx;
    //return;    
}

simulated function int GetCheckFriendOrClanMember()
{
    local int fl1, nUID, nUID2;

    // End:0xF9
    if(IsFriendOrClanMember == -1)
    {
        nUID = Level.GetMatchMaker().GetUIDByUserName(PlayerName);
        fl1 = 0;
        J0x3A:

        // End:0xF9 [Loop If]
        if(fl1 < Level.GetMatchMaker().UserInfos.Length)
        {
            nUID2 = Level.GetMatchMaker().UserInfos[fl1].UID;
            // End:0xEF
            if(nUID == nUID2)
            {
                // End:0xE5
                if(Level.GetMatchMaker().IsFriendlyUser(PlayerName, Level.GetMatchMaker().GetUserClanNameByUserName(PlayerName)))
                {
                    IsFriendOrClanMember = 1;
                    // [Explicit Break]
                    goto J0xF9;
                    // [Explicit Continue]
                    goto J0xEF;
                }
                IsFriendOrClanMember = 0;
                // [Explicit Break]
                goto J0xF9;
            }
            J0xEF:

            fl1++;
            // [Loop Continue]
            goto J0x3A;
        }
    }
    J0xF9:

    return IsFriendOrClanMember;
    //return;    
}

defaultproperties
{
    UID=-1
    StringDead="Dead"
    StringSpectating="Spectating"
    StringUnknown="Unknown"
    VoiceID=255
    UAVScanBeginTime=-999.0000000
    UAVScanEndTime=-999.0000000
    ClassLevel=-1
    IsInvulnerable=true
    IsFriendOrClanMember=-1
    NetUpdateFrequency=1.0000000
    bNetNotify=true
}