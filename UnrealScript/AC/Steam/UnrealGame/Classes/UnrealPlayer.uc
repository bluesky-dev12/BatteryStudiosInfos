/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\UnrealPlayer.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:27
 *	Functions:64
 *	States:3
 *
 *******************************************************************************/
class UnrealPlayer extends PlayerController
    dependson(UnrealChatHandler)
    dependson(DeathMatch)
    dependson(AnnounceAdrenaline)
    config(User);

var bool bRising;
var bool bLatecomer;
var bool bDisplayLoser;
var bool bDisplayWinner;
var int LastTaunt;
var float LastWhispTime;
var() float LastKillTime;
var float LastTauntAnimTime;
var float LastAutoTauntTime;
var string CustomizedAnnouncerPack;
var string CustomStatusAnnouncerPack;
var string CustomRewardAnnouncerPack;
var globalconfig transient array<string> RejoinChannels;
var array<string> RecentServers;
var int MaxRecentServers;
var bool bDontShowLoginMenu;
var bool bReadyToStart;
var string LoginMenuClass;
var bool bForceLoginMenu;
var float LastKickWarningTime;
var string NetBotDebugString;
var name DirName;
var Rotator rAttackedZoomCameraS;
var float fAttackedCamera3DZoomRatioS;
var float fAttackedWeapon3DZoomRatioS;
var float fAttacked3DZoomSpeed;
var float fAttacked3DZoomDecayAcc;

replication
{
    // Pos:0x00
    reliable if(Role == 4)
        ClientDelayedAnnouncement, NewClientPlayTakeHit,
        ClientDelayedAnnouncementNamed;

    // Pos:0x0d
    reliable if(Role == 4)
        PlayWinMessage, ClientReceiveLoginMenu,
        PlayStartupMessage, ClientSendStats,
        ClientSendCombos, ClientReceiveBotDebugString,
        ClientSendSprees, ClientSendVehicle,
        ClientSendWeapon, ClientSendMultiKills;

    // Pos:0x1a
    reliable if(Role < 4)
        ServerSendBotDebugString, ServerShowPathToBase,
        ServerTaunt, ServerPlayVehicleHorn,
        ServerSetReadyToStart, ServerGetNextVehicleStats,
        ServerGetNextWeaponStats, ServerUpdateStatArrays,
        ServerDropFlag, ServerUpdateStats;

}

function ServerUpdateStats(TeamPlayerReplicationInfo PRI)
{
    ClientSendStats(PRI, PRI.GoalsScored, PRI.bFirstBlood, PRI.Kills, PRI.Suicides, PRI.FlagTouches, PRI.FlagReturns, PRI.flakcount, PRI.combocount, PRI.headcount, PRI.ranovercount, PRI.DaredevilPoints);
}

function ServerUpdateStatArrays(TeamPlayerReplicationInfo PRI)
{
    ClientSendSprees(PRI, PRI.Spree[0], PRI.Spree[1], PRI.Spree[2], PRI.Spree[3], PRI.Spree[4], PRI.Spree[5]);
    ClientSendMultiKills(PRI, PRI.MultiKills[0], PRI.MultiKills[1], PRI.MultiKills[2], PRI.MultiKills[3], PRI.MultiKills[4], PRI.MultiKills[5], PRI.MultiKills[6]);
    ClientSendCombos(PRI, PRI.Combos[0], PRI.Combos[1], PRI.Combos[2], PRI.Combos[3], PRI.Combos[4]);
}

function ServerGetNextWeaponStats(TeamPlayerReplicationInfo PRI, int i)
{
    // End:0x27
    if(i >= PRI.WeaponStatsArray.Length)
    {
        ServerGetNextVehicleStats(PRI, 0);
        return;
    }
    ClientSendWeapon(PRI, PRI.WeaponStatsArray[i].WeaponClass, PRI.WeaponStatsArray[i].Kills, PRI.WeaponStatsArray[i].Deaths, PRI.WeaponStatsArray[i].deathsholding, i);
}

function ServerGetNextVehicleStats(TeamPlayerReplicationInfo PRI, int i)
{
    // End:0x1b
    if(i >= PRI.VehicleStatsArray.Length)
    {
        return;
    }
    ClientSendVehicle(PRI, PRI.VehicleStatsArray[i].VehicleClass, PRI.VehicleStatsArray[i].Kills, PRI.VehicleStatsArray[i].Deaths, PRI.VehicleStatsArray[i].DeathsDriving, i);
}

simulated function ClientSendWeapon(TeamPlayerReplicationInfo PRI, class<wWeapon> W, int Kills, int Deaths, int deathsholding, int i)
{
    PRI.UpdateWeaponStats(PRI, W, Kills, Deaths, deathsholding);
    ServerGetNextWeaponStats(PRI, i + 1);
}

simulated function ClientSendVehicle(TeamPlayerReplicationInfo PRI, class<Vehicle> V, int Kills, int Deaths, int DeathsDriving, int i)
{
    PRI.UpdateVehicleStats(PRI, V, Kills, Deaths, DeathsDriving);
    ServerGetNextVehicleStats(PRI, i + 1);
}

simulated function ClientSendSprees(TeamPlayerReplicationInfo PRI, byte Spree0, byte Spree1, byte Spree2, byte Spree3, byte Spree4, byte Spree5)
{
    PRI.Spree[0] = Spree0;
    PRI.Spree[1] = Spree1;
    PRI.Spree[2] = Spree2;
    PRI.Spree[3] = Spree3;
    PRI.Spree[4] = Spree4;
    PRI.Spree[5] = Spree5;
}

simulated function ClientSendMultiKills(TeamPlayerReplicationInfo PRI, byte MultiKills0, byte MultiKills1, byte MultiKills2, byte MultiKills3, byte MultiKills4, byte MultiKills5, byte MultiKills6)
{
    PRI.MultiKills[0] = MultiKills0;
    PRI.MultiKills[1] = MultiKills1;
    PRI.MultiKills[2] = MultiKills2;
    PRI.MultiKills[3] = MultiKills3;
    PRI.MultiKills[4] = MultiKills4;
    PRI.MultiKills[5] = MultiKills5;
    PRI.MultiKills[6] = MultiKills6;
}

simulated function ClientSendCombos(TeamPlayerReplicationInfo PRI, byte Combos0, byte Combos1, byte Combos2, byte Combos3, byte Combos4)
{
    PRI.Combos[0] = Combos0;
    PRI.Combos[1] = Combos1;
    PRI.Combos[2] = Combos2;
    PRI.Combos[3] = Combos3;
    PRI.Combos[4] = Combos4;
    ServerGetNextWeaponStats(PRI, 0);
}

simulated function ClientSendStats(TeamPlayerReplicationInfo PRI, int newgoals, bool bNewFirstBlood, int newKills, int newsuicides, int newFlagTouches, int newFlagReturns, int newFlakCount, int newComboCount, int newHeadCount, int newRanOverCount, int newDaredevilPoints)
{
    PRI.GoalsScored = newgoals;
    PRI.bFirstBlood = bNewFirstBlood;
    PRI.Kills = newKills;
    PRI.Suicides = newsuicides;
    PRI.FlagTouches = newFlagTouches;
    PRI.FlagReturns = newFlagReturns;
    PRI.flakcount = newFlakCount;
    PRI.combocount = newComboCount;
    PRI.headcount = newHeadCount;
    PRI.ranovercount = newRanOverCount;
    PRI.DaredevilPoints = newDaredevilPoints;
    ServerUpdateStatArrays(PRI);
}

simulated event PostBeginPlay()
{
    local class<AnnouncerVoice> VoiceClass;

    super.PostBeginPlay();
    // End:0x95
    if(Level.NetMode != 1)
    {
        VoiceClass = class<AnnouncerVoice>(DynamicLoadObject(CustomStatusAnnouncerPack, class'Class'));
        StatusAnnouncer = Spawn(VoiceClass);
        VoiceClass = class<AnnouncerVoice>(DynamicLoadObject(CustomRewardAnnouncerPack, class'Class'));
        RewardAnnouncer = Spawn(VoiceClass);
        PrecacheAnnouncements();
        Level.static.GetGameClass().Precache(Level);
    }
}

function AwardAdrenaline(float Amount)
{
    // End:0x6b
    if(bAdrenalineEnabled)
    {
        // End:0x60
        if(Adrenaline < AdrenalineMax && Adrenaline + Amount >= AdrenalineMax && Pawn == none || !Pawn.InCurrentCombo())
        {
            ClientDelayedAnnouncementNamed('Adrenalin', 15);
        }
        super(Controller).AwardAdrenaline(Amount);
    }
}

function ClientDelayedAnnouncementNamed(name Announcement, byte Delay)
{
    local AnnounceAdrenaline A;

    A = Spawn(class'AnnounceAdrenaline', self);
    A.Announcement = Announcement;
    A.SetTimer(0.10 * float(Delay), false);
}

function ClientDelayedAnnouncement(Sound AnnouncementSound, byte Delay)
{
    local AnnounceAdrenaline A;

    A = Spawn(class'AnnounceAdrenaline', self);
    A.AnnounceSound = AnnouncementSound;
    A.SetTimer(0.10 * float(Delay), false);
}

function LogMultiKills(float Reward, bool bEnemyKill)
{
    // End:0x1e
    if(bEnemyKill)
    {
        MultiKillLevel = Min(5, MultiKillLevel + 1);
    }
    // End:0x25
    else
    {
        MultiKillLevel = 0;
    }
    // End:0x42
    if(bEnemyKill)
    {
        LastKillTime = Level.TimeSeconds;
    }
}

exec function ShowAI()
{
    myHUD.ShowDebug();
    // End:0x43
    if(UnrealPawn(ViewTarget) != none)
    {
        UnrealPawn(ViewTarget).bSoakDebug = myHUD.bShowDebugInfo;
    }
}

function Possess(Pawn aPawn)
{
    super.Possess(aPawn);
}

function bool AutoTaunt()
{
    // End:0x2d
    if(!bAutoTaunt || LastAutoTauntTime > Level.TimeSeconds - float(2))
    {
        return false;
    }
    LastAutoTauntTime = Level.TimeSeconds;
    return true;
}

function bool DontReuseTaunt(int t)
{
    // End:0x11
    if(t == LastTaunt)
    {
        return true;
    }
    // End:0x49
    if(t == Level.LastTaunt[0] || t == Level.LastTaunt[1])
    {
        return true;
    }
    LastTaunt = t;
    Level.LastTaunt[1] = Level.LastTaunt[0];
    Level.LastTaunt[0] = t;
    return false;
}

exec function SoakBots()
{
    local Bot B;

    Log("Start Soaking");
    UnrealMPGameInfo(Level.Game).bSoaking = true;
    // End:0x52
    foreach DynamicActors(class'Bot', B)
    {
        B.bSoaking = true;                
    }
}

function SoakPause(Pawn P)
{
    Log("Soak pause by " $ string(P));
    SetViewTarget(P);
    SetPause(true);
    bBehindView = true;
    myHUD.bShowDebugInfo = true;
    // End:0x6c
    if(UnrealPawn(P) != none)
    {
        UnrealPawn(P).bSoakDebug = true;
    }
}

exec function BasePath(byte Num)
{
    // End:0x16
    if(PlayerReplicationInfo.Team == none)
    {
        return;
    }
    ServerShowPathToBase(Num);
}

function ServerShowPathToBase(int TeamNum)
{
    // End:0x3c
    if(Level.NetMode != 0 && Level.TimeSeconds - LastWhispTime < 0.50)
    {
        return;
    }
    LastWhispTime = Level.TimeSeconds;
    // End:0xa6
    if(Pawn == none || !Level.Game.bTeamGame || !UnrealMPGameInfo(Level.Game).CanShowPathTo(self, TeamNum))
    {
        return;
    }
    UnrealMPGameInfo(Level.Game).ShowPathTo(self, TeamNum);
}

function byte GetMessageIndex(name PhraseName)
{
    return 0;
}

exec function RandomTaunt()
{
    local int tauntNum;

    // End:0x0d
    if(Pawn == none)
    {
        return;
    }
    tauntNum = Rand(Pawn.TauntAnims.Length - 4);
    TAUNT(Pawn.TauntAnims[4 + tauntNum]);
}

exec function TAUNT(name Sequence)
{
    // End:0x2a
    if(Vehicle(Pawn) != none && Sequence == 'gesture_point')
    {
        PlayVehicleHorn(0);
        return;
    }
    // End:0xa4
    if(Pawn != none && Pawn.Health > 0 && Level.TimeSeconds - LastTauntAnimTime > 0.50 && Pawn.FindValidTaunt(Sequence))
    {
        ServerTaunt(Sequence);
        LastTauntAnimTime = Level.TimeSeconds;
    }
}

function ServerTaunt(name AnimName)
{
    // End:0x83
    if(Pawn != none && Pawn.Health > 0 && Level.TimeSeconds - LastTauntAnimTime > 0.30 && Pawn.FindValidTaunt(AnimName))
    {
        Pawn.SetAnimAction(AnimName);
        LastTauntAnimTime = Level.TimeSeconds;
    }
}

exec function PlayVehicleHorn(int HornIndex)
{
    local Vehicle V;

    V = Vehicle(Pawn);
    // End:0x71
    if(V != none && V.Health > 0 && Level.TimeSeconds - LastTauntAnimTime > 0.30)
    {
        ServerPlayVehicleHorn(HornIndex);
        LastTauntAnimTime = Level.TimeSeconds;
    }
}

function ServerPlayVehicleHorn(int HornIndex)
{
    local Vehicle V;

    V = Vehicle(Pawn);
    // End:0x7a
    if(V != none && V.Health > 0 && Level.TimeSeconds - LastTauntAnimTime > 0.30)
    {
        V.ServerPlayHorn(HornIndex);
        LastTauntAnimTime = Level.TimeSeconds;
    }
}

simulated function PlayStatusAnnouncement(string AName, byte AnnouncementLevel, optional bool bForce)
{
    // End:0x39
    if(AnnouncementLevel > AnnouncerLevel)
    {
        // End:0x24
        if(AnnouncementLevel == 2)
        {
        }
        // End:0x37
        else
        {
            // End:0x37
            if(AnnouncementLevel == 1)
            {
                PlayBeepSound();
            }
        }
        return;
    }
    super.PlayStatusAnnouncement(AName, AnnouncementLevel, bForce);
}

simulated function PlayRewardAnnouncement(name AName, byte AnnouncementLevel, optional bool bForce, optional Engine.Actor.ESoundSlot Slot)
{
    // End:0x39
    if(AnnouncementLevel > AnnouncerLevel)
    {
        // End:0x24
        if(AnnouncementLevel == 2)
        {
        }
        // End:0x37
        else
        {
            // End:0x37
            if(AnnouncementLevel == 1)
            {
                PlayBeepSound();
            }
        }
        return;
    }
    super.PlayRewardAnnouncement(AName, AnnouncementLevel, bForce, Slot);
}

simulated function PlayAnnouncement(Sound ASound, byte AnnouncementLevel, optional bool bForce)
{
    // End:0x39
    if(AnnouncementLevel > AnnouncerLevel)
    {
        // End:0x24
        if(AnnouncementLevel == 2)
        {
        }
        // End:0x37
        else
        {
            // End:0x37
            if(AnnouncementLevel == 1)
            {
                PlayBeepSound();
            }
        }
        return;
    }
    super.PlayAnnouncement(ASound, AnnouncementLevel, bForce);
}

event KickWarning()
{
    // End:0x42
    if(Level.TimeSeconds - LastKickWarningTime > 0.50)
    {
        ReceiveLocalizedMessage(class'IdleKickWarningMessage', 0, none, none, self);
        LastKickWarningTime = Level.TimeSeconds;
    }
}

function PlayStartupMessage(byte StartupStage)
{
    ReceiveLocalizedMessage(class'StartupMessage', StartupStage, PlayerReplicationInfo);
}

simulated event PostNetReceive()
{
    super(Actor).PostNetReceive();
    // End:0x21
    if(ChatManager != none)
    {
        ChatManager.PlayerOwner = self;
    }
}

simulated function InitInputSystem()
{
    super.InitInputSystem();
    // End:0x18
    if(LoginMenuClass != "")
    {
        ShowLoginMenu();
    }
    bReadyToStart = true;
    ServerSetReadyToStart();
}

function ServerSetReadyToStart()
{
    bReadyToStart = true;
}

simulated function ClientReceiveLoginMenu(string MenuClass, bool bForce)
{
    LoginMenuClass = MenuClass;
    bForceLoginMenu = bForce;
}

simulated function ShowLoginMenu()
{
    local int X;
    local string NetworkAddress;

    // End:0x56
    if(Level.NetMode != 3 || Pawn != none && Pawn.Health > 0 || bDontShowLoginMenu && !bForceLoginMenu)
    {
        return;
    }
    // End:0x10e
    if(!bForceLoginMenu)
    {
        NetworkAddress = GetServerNetworkAddress();
        // End:0x7b
        if(NetworkAddress == "")
        {
            return;
        }
        X = 0;
        J0x82:
        // End:0xda [While If]
        if(X < RecentServers.Length)
        {
            // End:0xd0
            if(NetworkAddress ~= RecentServers[X])
            {
                RecentServers.Insert(0, 1);
                RecentServers[0] = NetworkAddress;
                RecentServers.Remove(X + 1, 1);
                SaveConfig();
                return;
            }
            ++ X;
            // This is an implied JumpToken; Continue!
            goto J0x82;
        }
        RecentServers.Insert(0, 1);
        RecentServers[0] = NetworkAddress;
        // End:0x10b
        if(RecentServers.Length > MaxRecentServers)
        {
            RecentServers.Length = MaxRecentServers;
        }
        SaveConfig();
    }
    ClientReplaceMenu(LoginMenuClass);
}

function NotifyTakeHit(Pawn instigatedBy, Vector HitLocation, int Damage, class<DamageType> DamageType, Vector Momentum, optional int CollisionPart)
{
    local int iDam;
    local Vector AttackLoc;
    local float fHitGunKick, iWeaponID;
    local PlayerInput pInput;

    super(Controller).NotifyTakeHit(instigatedBy, HitLocation, Damage, DamageType, Momentum, CollisionPart);
    DamageShake(Damage);
    iDam = Clamp(Damage, 0, 250);
    // End:0x5e
    if(instigatedBy != none)
    {
        AttackLoc = instigatedBy.Location;
    }
    // End:0xc0
    if(instigatedBy.Weapon != none)
    {
        fHitGunKick = instigatedBy.Weapon.BaseParams.fHitGunKick;
        iWeaponID = float(instigatedBy.Weapon.BaseParams.iWeaponID);
    }
    // End:0x19d
    if(bHit == false)
    {
        bHitRun = bRun;
        pInput = GetPlayerInput();
        // End:0x10f
        if(bRun > 0 && pInput.bWasForward != true)
        {
            bHitRun = 0;
        }
        // End:0x18d
        if(bSet == false)
        {
            hit_gun_move_speed = instigatedBy.Weapon.BaseParams.fHitMoveSpeed;
            hit_gun_move_time = instigatedBy.Weapon.BaseParams.fHitMoveTime;
            hit_gun_move_delay = instigatedBy.Weapon.BaseParams.fHitMoveDelay;
        }
        bHit = true;
        bRun = 0;
    }
    NewClientPlayTakeHit(AttackLoc, HitLocation - Pawn.Location, byte(iDam), DamageType, int(iWeaponID), fHitGunKick, CollisionPart);
}

function NewClientPlayTakeHit(Vector AttackLoc, Vector HitLoc, byte Damage, class<DamageType> DamageType, optional int iWeaponID, optional float fHitGunKick, optional int CollisionPart)
{
    local Vector HitDir;
    local wWeaponBaseParams WBP;
    local PlayerInput pInput;

    // End:0x17f
    if(myHUD != none && Damage > 0 || bGodMode)
    {
        // End:0x5c
        if(AttackLoc != vect(0.0, 0.0, 0.0))
        {
            HitDir = Normal(AttackLoc - Pawn.Location);
        }
        // End:0x69
        else
        {
            HitDir = Normal(HitLoc);
        }
        myHUD.NotifyTakeHit(AttackLoc, Damage, DamageType, HitLoc, CollisionPart);
        AttackedView(iWeaponID, fHitGunKick, HitDir);
        // End:0x17f
        if(bHit == false)
        {
            bHitRun = bRun;
            pInput = GetPlayerInput();
            // End:0xf7
            if(bRun > 0 && pInput.bWasForward != true)
            {
                bHitRun = 0;
            }
            ServerSetOldRun(0, bHitRun);
            WBP = Level.WeaponMgr.GetBaseParam(iWeaponID);
            // End:0x16f
            if(bSet == false)
            {
                hit_gun_move_speed = WBP.fHitMoveSpeed;
                hit_gun_move_time = WBP.fHitMoveTime;
                hit_gun_move_delay = WBP.fHitMoveDelay;
            }
            bHit = true;
            bRun = 0;
        }
    }
    HitLoc += Pawn.Location;
    // End:0x1ab
    if(bEnableDamageForceFeedback)
    {
        ClientPlayForceFeedback("Damage");
    }
    // End:0x1e4
    if(Level.NetMode == 3)
    {
        Pawn.PlayTakeHit(HitLoc, Damage, DamageType);
    }
}

function HitSound();
function ClientPlayTakeHit(Vector HitLoc, byte Damage, class<DamageType> DamageType, optional int CollisionPart)
{
    NewClientPlayTakeHit(Location, HitLoc, Damage, DamageType,,, CollisionPart);
}

function PlayWinMessage(bool bWinner)
{
    // End:0x1c
    if(bWinner)
    {
        bDisplayWinner = true;
        bDisplayLoser = false;
    }
    // End:0x2c
    else
    {
        bDisplayWinner = false;
        bDisplayLoser = true;
    }
}

exec function DropFlag()
{
    ServerDropFlag();
}

function ServerDropFlag()
{
    // End:0x23
    if(PlayerReplicationInfo == none || PlayerReplicationInfo.HasFlag == none)
    {
        return;
    }
    PlayerReplicationInfo.HasFlag.Drop(Pawn.Velocity * 0.50);
}

function ShowMidGameMenu(bool bPause)
{
    // End:0x1f
    if(Level.NetMode != 1)
    {
        StopForceFeedback();
    }
    // End:0x36
    if(bDemoOwner)
    {
        ClientOpenMenu(DemoMenuClass);
    }
    // End:0x5b
    else
    {
        // End:0x50
        if(LoginMenuClass != "")
        {
            ClientOpenMenu(LoginMenuClass);
        }
        // End:0x5b
        else
        {
            ClientOpenMenu(MidGameMenuClass);
        }
    }
}

simulated function string GetCustomStatusAnnouncerClass()
{
    return CustomStatusAnnouncerPack;
}

simulated function SetCustomStatusAnnouncerClass(string NewAnnouncerClass)
{
    CustomStatusAnnouncerPack = NewAnnouncerClass;
}

simulated function string GetCustomRewardAnnouncerClass()
{
    return CustomRewardAnnouncerPack;
}

simulated function SetCustomRewardAnnouncerClass(string NewAnnouncerClass)
{
    CustomRewardAnnouncerPack = NewAnnouncerClass;
}

simulated function bool NeedNetNotify()
{
    return super.NeedNetNotify() || ChatManager == none;
}

simulated event PostNetBeginPlay()
{
    super(Actor).PostNetBeginPlay();
    // End:0x74
    if(Level.NetMode == 3 || Level.NetMode == 2)
    {
        bVoiceChatEnabled = bool(ConsoleCommand("get ini:Engine.Engine.AudioDevice UseVoIP"));
    }
}

simulated function AutoJoinVoiceChat()
{
    local int i, j, cnt;
    local string DefaultChannel;

    // End:0x43
    if(!bVoiceChatEnabled || Level.NetMode != 3 && Level.NetMode != 2)
    {
        return;
    }
    // End:0x8a
    if(VoiceReplicationInfo == none)
    {
        Log(string(Name) @ "AutoJoinVoiceChat() do not have VRI yet!", 'VoiceChat');
        return;
    }
    cnt = VoiceReplicationInfo.GetPublicChannelCount(true);
    i = 0;
    J0xa7:
    // End:0x146 [While If]
    if(i < cnt)
    {
        // End:0x13c
        if(bool(AutoJoinMask & 1 << i))
        {
            Join(VoiceReplicationInfo.PublicChannelNames[i], "");
            j = RejoinChannels.Length - 1;
            J0xf7:
            // End:0x13c [While If]
            if(j >= 0)
            {
                // End:0x132
                if(RejoinChannels[j] == VoiceReplicationInfo.PublicChannelNames[i])
                {
                    RejoinChannels.Remove(j, 1);
                }
                -- j;
                // This is an implied JumpToken; Continue!
                goto J0xf7;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xa7;
    }
    i = 0;
    J0x14d:
    // End:0x17a [While If]
    if(i < RejoinChannels.Length)
    {
        Join(RejoinChannels[i], "");
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x14d;
    }
    // End:0x194
    if(LastActiveChannel != "")
    {
        Speak(LastActiveChannel);
    }
    // End:0x1cd
    else
    {
        // End:0x1cd
        if(ActiveRoom == none && bEnableInitialChatRoom)
        {
            DefaultChannel = GetDefaultActiveChannel();
            // End:0x1cd
            if(DefaultChannel != "")
            {
                Speak(DefaultChannel);
            }
        }
    }
    // End:0x1fa
    if(RejoinChannels.Length > 0 || LastActiveChannel != "")
    {
        RejoinChannels.Length = 0;
        LastActiveChannel = "";
        SaveConfig();
    }
}

function ClientGameEnded()
{
    local int i;
    local array<VoiceChatRoom> Channels;

    // End:0xff
    if(bVoiceChatEnabled && PlayerReplicationInfo != none && VoiceReplicationInfo != none)
    {
        Log(string(Name) @ PlayerReplicationInfo.PlayerName @ "ClientGameEnded()", 'VoiceChat');
        Channels = VoiceReplicationInfo.GetChannels();
        i = 0;
        J0x72:
        // End:0xdf [While If]
        if(i < Channels.Length)
        {
            // End:0xd5
            if(Channels[i] != none && Channels[i].IsMember(PlayerReplicationInfo, true))
            {
                RejoinChannels[RejoinChannels.Length] = Channels[i].GetTitle();
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x72;
        }
        // End:0xff
        if(ActiveRoom != none)
        {
            LastActiveChannel = ActiveRoom.GetTitle();
        }
    }
    // End:0x11c
    if(RejoinChannels.Length > 0 || LastActiveChannel != "")
    {
        SaveConfig();
    }
    super(Controller).ClientGameEnded();
}

function ServerChatDebug()
{
    local BroadcastHandler B;

    B = Level.Game.BroadcastHandler;
    J0x1d:
    // End:0x63 [While If]
    if(B != none)
    {
        // End:0x4c
        if(UnrealChatHandler(B) != none)
        {
            UnrealChatHandler(B).DoChatDebug();
        }
        B = B.NextBroadcastHandler;
        // This is an implied JumpToken; Continue!
        goto J0x1d;
    }
}

exec function NetDebugBot()
{
    // End:0x30
    if(Level.NetMode == 3 && ViewTarget != Pawn)
    {
        ServerSendBotDebugString();
    }
}

function ServerSendBotDebugString()
{
    // End:0x60
    if(Bot(RealViewTarget) != none)
    {
        ClientReceiveBotDebugString("(ORDERS: " $ string(Bot(RealViewTarget).Squad.GetOrders()) $ ") " $ Bot(RealViewTarget).GoalString);
    }
    // End:0x68
    else
    {
        ClientReceiveBotDebugString("");
    }
}

simulated function ClientReceiveBotDebugString(string DebugString)
{
    NetBotDebugString = DebugString;
    // End:0x1d
    if(NetBotDebugString != "")
    {
        ServerSendBotDebugString();
    }
}

simulated function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
    super.DisplayDebug(Canvas, YL, YPos);
    // End:0x8d
    if(NetBotDebugString != "")
    {
        Canvas.SetDrawColor(byte(255), byte(255), byte(255));
        Canvas.DrawText("Bot ViewTarget's Goal: " $ NetBotDebugString);
        YPos += YL;
        Canvas.SetPos(4.0, YPos);
    }
}

function RotateByAttacked(out Vector CameraLocation, out Rotator CameraRotation)
{
    local Rotator rTemp;
    local float f3DZoomRatio;

    // End:0x12
    if(wAttackedState == 0)
    {
        return;
    }
    rTemp.Pitch = wAttackedRot.Pitch;
    rTemp.Roll = wAttackedRot.Yaw;
    // End:0x256
    if(Pawn != none && Pawn.Weapon != none && Pawn.Weapon.IsA('wGun'))
    {
        // End:0xfb
        if(wGun(Pawn.Weapon).AimState == 0)
        {
            f3DZoomRatio = 1.0;
            // End:0xf8
            if(wADirState == 3 || wADirState == 4)
            {
                wGun(Pawn.Weapon).SetAttackedRot(Normalize(wAttackedRot));
            }
        }
        // End:0x18b
        else
        {
            wGun(Pawn.Weapon).SetAttackedRot(rot(0, 0, 0));
            // End:0x180
            if(Pawn.Weapon.GetFireMode(1).IsA('wZoomFire3D') && wADirState == 4 || wADirState == 3)
            {
                f3DZoomRatio = fAttackedCamera3DZoomRatioS;
            }
            // End:0x18b
            else
            {
                f3DZoomRatio = 1.0;
            }
        }
        // End:0x1fa
        if(wADirState == 4)
        {
            // End:0x1bb
            if(rTemp.Roll > 32768)
            {
                rTemp.Roll = 0;
            }
            rTemp.Roll = int(float(rTemp.Roll) + wAttackedCameraRatioS * f3DZoomRatio - 1.0 * float(rTemp.Roll));
        }
        // End:0x256
        else
        {
            // End:0x256
            if(wADirState == 3)
            {
                rTemp.Roll = int(float(rTemp.Roll) - wAttackedCameraRatioS * f3DZoomRatio - 1.0 * float(65535 - rTemp.Roll) / float(65535));
            }
        }
    }
    CameraRotation = Normalize(CameraRotation + rTemp);
}

function AttackedView(int iWeaponID, float fHitGunKick, Vector vAttacked)
{
    local int iPitch, iYaw, iRoll;
    local float fValue, fAimRatio;
    local Vector ViewDir, AxisX, AxisY, AxisZ, ApplyValue;

    // End:0x23
    if(Pawn != none && Pawn.IsA('Vehicle'))
    {
        return;
    }
    wAttackedRot = rot(0, 0, 0);
    wAttackedState = 0;
    ViewDir = vector(Pawn.Rotation);
    fValue = ViewDir Dot vAttacked;
    // End:0x123
    if(fValue > float(0))
    {
        // End:0xa3
        if(fValue > 0.7070)
        {
            DirName = 'Front';
            ApplyValue = wApplyFront;
            wADirState = 1;
        }
        // End:0x120
        else
        {
            GetAxes(Pawn.Rotation, AxisX, AxisY, AxisZ);
            fValue = AxisY Dot vAttacked;
            // End:0x102
            if(fValue > float(0))
            {
                DirName = 'Right';
                ApplyValue = wApplyRight;
                wADirState = 3;
            }
            // End:0x120
            else
            {
                DirName = 'Left';
                ApplyValue = wApplyLeft;
                wADirState = 4;
            }
        }
    }
    // End:0x1d0
    else
    {
        // End:0x153
        if(fValue < -0.7070)
        {
            DirName = 'back';
            ApplyValue = wApplyBack;
            wADirState = 2;
        }
        // End:0x1d0
        else
        {
            GetAxes(Pawn.Rotation, AxisX, AxisY, AxisZ);
            fValue = AxisY Dot vAttacked;
            // End:0x1b2
            if(fValue > float(0))
            {
                DirName = 'Right';
                ApplyValue = wApplyRight;
                wADirState = 3;
            }
            // End:0x1d0
            else
            {
                DirName = 'Left';
                ApplyValue = wApplyLeft;
                wADirState = 4;
            }
        }
    }
    // End:0x201
    if(iWeaponID != -1)
    {
        // End:0x201
        if(iWeaponID == 5003)
        {
            ApplyValue = wApplyFront;
            wADirState = 1;
        }
    }
    wAttackedSpeed = default.wAttackedSpeed;
    wAttackedDecayAcc = default.wAttackedDecayAcc;
    // End:0x2fa
    if(Pawn != none && Pawn.Weapon != none && Pawn.Weapon.IsA('wGun') && wGun(Pawn.Weapon).AimState == 2)
    {
        fAimRatio = wAttackedAimRatio;
        // End:0x2f7
        if(Pawn.Weapon.GetFireMode(1).IsA('wZoomFire3D'))
        {
            // End:0x2f7
            if(wADirState == 3 || wADirState == 4)
            {
                fAimRatio = fAttackedWeapon3DZoomRatioS;
                wAttackedSpeed = fAttacked3DZoomSpeed;
                wAttackedDecayAcc = fAttacked3DZoomDecayAcc;
            }
        }
    }
    // End:0x305
    else
    {
        fAimRatio = 1.0;
    }
    iPitch = int(ApplyValue.X * fAimRatio * fHitGunKick);
    iYaw = int(ApplyValue.Y * fAimRatio * fHitGunKick);
    iRoll = int(ApplyValue.Z * fAimRatio * fHitGunKick);
    wAttackedView(iPitch, iYaw, iRoll);
}

function wAttackedView(int iPitch, int iYaw, int iRoll)
{
    local int iDist1, iDist2;

    wAttackedState = 1;
    wAttackedDest.Pitch = wAttackedRot.Pitch - iPitch;
    wAttackedDest.Yaw = wAttackedRot.Yaw + iYaw;
    wAttackedDest.Roll = wAttackedRot.Roll + iRoll;
    J0x5c:
    // End:0x80 [While If]
    if(wAttackedDest.Pitch < 0)
    {
        wAttackedDest.Pitch += 65536;
        // This is an implied JumpToken; Continue!
        goto J0x5c;
    }
    wAttackedDest.Pitch = int(float(wAttackedDest.Pitch) % float(65536));
    J0xa2:
    // End:0xc6 [While If]
    if(wAttackedDest.Yaw < 0)
    {
        wAttackedDest.Yaw += 65536;
        // This is an implied JumpToken; Continue!
        goto J0xa2;
    }
    wAttackedDest.Yaw = int(float(wAttackedDest.Yaw) % float(65536));
    J0xe8:
    // End:0x10c [While If]
    if(wAttackedDest.Roll < 0)
    {
        wAttackedDest.Roll += 65536;
        // This is an implied JumpToken; Continue!
        goto J0xe8;
    }
    wAttackedDest.Roll = int(float(wAttackedDest.Roll) % float(65536));
    iDist1 = wAttackedDest.Pitch - wAttackedRot.Pitch;
    J0x14a:
    // End:0x164 [While If]
    if(iDist1 < 0)
    {
        iDist1 += 65536;
        // This is an implied JumpToken; Continue!
        goto J0x14a;
    }
    iDist1 = int(float(iDist1) % float(65536));
    iDist2 = wAttackedRot.Pitch - wAttackedDest.Pitch;
    J0x198:
    // End:0x1b2 [While If]
    if(iDist2 < 0)
    {
        iDist2 += 65536;
        // This is an implied JumpToken; Continue!
        goto J0x198;
    }
    iDist2 = int(float(iDist2) % float(65536));
    // End:0x1ee
    if(iDist1 <= iDist2)
    {
        wAttackedVelocity.X = float(iDist1);
    }
    // End:0x207
    else
    {
        wAttackedVelocity.X = -1.0 * float(iDist2);
    }
    iDist1 = wAttackedDest.Yaw - wAttackedRot.Yaw;
    J0x223:
    // End:0x23d [While If]
    if(iDist1 < 0)
    {
        iDist1 += 65536;
        // This is an implied JumpToken; Continue!
        goto J0x223;
    }
    iDist1 = int(float(iDist1) % float(65536));
    iDist2 = wAttackedRot.Yaw - wAttackedDest.Yaw;
    J0x271:
    // End:0x28b [While If]
    if(iDist2 < 0)
    {
        iDist2 += 65536;
        // This is an implied JumpToken; Continue!
        goto J0x271;
    }
    iDist2 = int(float(iDist2) % float(65536));
    // End:0x2c7
    if(iDist1 <= iDist2)
    {
        wAttackedVelocity.Y = float(iDist1);
    }
    // End:0x2e0
    else
    {
        wAttackedVelocity.Y = -1.0 * float(iDist2);
    }
    iDist1 = wAttackedDest.Roll - wAttackedRot.Roll;
    J0x2fc:
    // End:0x316 [While If]
    if(iDist1 < 0)
    {
        iDist1 += 65536;
        // This is an implied JumpToken; Continue!
        goto J0x2fc;
    }
    iDist1 = int(float(iDist1) % float(65536));
    iDist2 = wAttackedRot.Roll - wAttackedDest.Roll;
    J0x34a:
    // End:0x364 [While If]
    if(iDist2 < 0)
    {
        iDist2 += 65536;
        // This is an implied JumpToken; Continue!
        goto J0x34a;
    }
    iDist2 = int(float(iDist2) % float(65536));
    // End:0x3a0
    if(iDist1 <= iDist2)
    {
        wAttackedVelocity.Z = float(iDist1);
    }
    // End:0x3b9
    else
    {
        wAttackedVelocity.Z = -1.0 * float(iDist2);
    }
    wAttackedDist = VSize(wAttackedVelocity);
    wAttackedVelocity = Normal(wAttackedVelocity) * wAttackedSpeed;
}

function wViewAttacked(float DeltaTime)
{
    local Vector v1;
    local int i1, i2;
    local float fFixedTime;

    // End:0x13
    if(Pawn == none)
    {
        wAttackedState = 0;
    }
    // End:0x38
    if(wAttackedState == 0)
    {
        wAttackedRot = rot(0, 0, 0);
        return;
    }
    wAttackedDeltaTime += DeltaTime;
    fFixedTime = 0.0166670;
    DeltaTime = fFixedTime;
    J0x5a:
    // End:0x5dc [While If]
    if(wAttackedDeltaTime >= fFixedTime)
    {
        wAttackedDeltaTime -= fFixedTime;
        // End:0x88
        if(wAttackedState == 0)
        {
        }
        // End:0x5dc
        else
        {
            switch(wAttackedState)
            {
                // End:0xa2
                case 0:
                    wAttackedDeltaTime = 0.0;
                    // End:0x5d9
                    break;
                // End:0x27f
                case 1:
                    wAttackedRot.Pitch = int(float(wAttackedRot.Pitch) + wAttackedVelocity.X * DeltaTime);
                    wAttackedRot.Yaw = int(float(wAttackedRot.Yaw) + wAttackedVelocity.Y * DeltaTime);
                    wAttackedRot.Roll = int(float(wAttackedRot.Roll) + wAttackedVelocity.Z * DeltaTime);
                    J0x12b:
                    // End:0x14f [While If]
                    if(wAttackedRot.Pitch < 0)
                    {
                        wAttackedRot.Pitch += 65536;
                        // This is an implied JumpToken; Continue!
                        goto J0x12b;
                    }
                    wAttackedRot.Pitch = int(float(wAttackedRot.Pitch) % float(65536));
                    J0x171:
                    // End:0x195 [While If]
                    if(wAttackedRot.Yaw < 0)
                    {
                        wAttackedRot.Yaw += 65536;
                        // This is an implied JumpToken; Continue!
                        goto J0x171;
                    }
                    wAttackedRot.Yaw = int(float(wAttackedRot.Yaw) % float(65536));
                    J0x1b7:
                    // End:0x1db [While If]
                    if(wAttackedRot.Roll < 0)
                    {
                        wAttackedRot.Roll += 65536;
                        // This is an implied JumpToken; Continue!
                        goto J0x1b7;
                    }
                    wAttackedRot.Roll = int(float(wAttackedRot.Roll) % float(65536));
                    wAttackedDist -= wAttackedSpeed * DeltaTime;
                    wAttackedSpeed -= wAttackedDecel * DeltaTime;
                    // End:0x248
                    if(wAttackedSpeed <= 0.0)
                    {
                        wAttackedState = 2;
                        wAttackedDest = wAttackedRot;
                    }
                    // End:0x5d9
                    else
                    {
                        wAttackedVelocity = Normal(wAttackedVelocity) * wAttackedSpeed;
                        // End:0x27c
                        if(wAttackedDist <= float(0))
                        {
                            wAttackedState = 2;
                            wAttackedRot = wAttackedDest;
                        }
                        // This is an implied JumpToken;
                        goto J0x5d9;
                // End:0x404
                case 2:
                wAttackedStayingTime -= DeltaTime;
                // End:0x401
                if(wAttackedStayingTime <= 0.0)
                {
                    wAttackedState = 3;
                    i1 = wAttackedDest.Pitch;
                    i2 = 65536 - wAttackedDest.Pitch;
                    // End:0x2f2
                    if(i1 <= i2)
                    {
                        v1.X = float(i1);
                    }
                    // End:0x30b
                    else
                    {
                        v1.X = -1.0 * float(i2);
                    }
                    i1 = wAttackedDest.Yaw;
                    i2 = 65536 - wAttackedDest.Yaw;
                    // End:0x356
                    if(i1 <= i2)
                    {
                        v1.Y = float(i1);
                    }
                    // End:0x36f
                    else
                    {
                        v1.Y = -1.0 * float(i2);
                    }
                    i1 = wAttackedDest.Roll;
                    i2 = 65536 - wAttackedDest.Roll;
                    // End:0x3ba
                    if(i1 <= i2)
                    {
                        v1.Z = float(i1);
                    }
                    // End:0x3d3
                    else
                    {
                        v1.Z = -1.0 * float(i2);
                    }
                    wAttackedDist = VSize(v1);
                    wAttackedDecay = wAttackedDecayAcc;
                    wAttackedVelocity = -Normal(v1) * wAttackedDecay;
                }
                // End:0x5d9
                break;
            // End:0x5d6
            case 3:
                wAttackedRot.Pitch = int(float(wAttackedRot.Pitch) + wAttackedVelocity.X * DeltaTime);
                wAttackedRot.Yaw = int(float(wAttackedRot.Yaw) + wAttackedVelocity.Y * DeltaTime);
                wAttackedRot.Roll = int(float(wAttackedRot.Roll) + wAttackedVelocity.Z * DeltaTime);
                J0x48d:
                // End:0x4b1 [While If]
                if(wAttackedRot.Pitch < 0)
                {
                    wAttackedRot.Pitch += 65536;
                    // This is an implied JumpToken; Continue!
                    goto J0x48d;
                }
                wAttackedRot.Pitch = int(float(wAttackedRot.Pitch) % float(65536));
                J0x4d3:
                // End:0x4f7 [While If]
                if(wAttackedRot.Yaw < 0)
                {
                    wAttackedRot.Yaw += 65536;
                    // This is an implied JumpToken; Continue!
                    goto J0x4d3;
                }
                wAttackedRot.Yaw = int(float(wAttackedRot.Yaw) % float(65536));
                J0x519:
                // End:0x53d [While If]
                if(wAttackedRot.Roll < 0)
                {
                    wAttackedRot.Roll += 65536;
                    // This is an implied JumpToken; Continue!
                    goto J0x519;
                }
                wAttackedRot.Roll = int(float(wAttackedRot.Roll) % float(65536));
                wAttackedDist -= wAttackedDecay * DeltaTime;
                // End:0x5a8
                if(wAttackedDist <= float(0))
                {
                    wAttackedState = 0;
                    wAttackedRot = rot(0, 0, 0);
                    wAttackedDeltaTime = 0.0;
                }
                // End:0x5d3
                else
                {
                    wAttackedVelocity /= wAttackedDecay;
                    wAttackedDecay += wAttackedDecayAcc * DeltaTime;
                    wAttackedVelocity *= wAttackedDecay;
                }
                // End:0x5d9
                break;
            // End:0xffff
            default:
            }
            // This is an implied JumpToken; Continue!
            goto J0x5a;
        }
    }
}

auto state PlayerWaiting
{
    exec function Fire(optional float f)
    {
        LoadPlayers();
        // End:0x3c
        if(!bForcePrecache && Level.TimeSeconds > 0.20 && bReadyToStart)
        {
            ServerReStartPlayer();
        }
    }

    function bool CanRestartPlayer()
    {
        return bReadyToStart || DeathMatch(Level.Game) != none && DeathMatch(Level.Game).bForceRespawn && super(PlayerController).CanRestartPlayer();
    }

}

state PlayerWalking
{
    function bool NotifyLanded(Vector HitNormal)
    {
        // End:0x3f
        if(DoubleClickDir == 5)
        {
            DoubleClickDir = 6;
            ClearDoubleClick();
            Pawn.Velocity *= vect(0.10, 0.10, 1.0);
        }
        // End:0x47
        else
        {
            DoubleClickDir = 0;
        }
        // End:0x57
        if(global.NotifyLanded(HitNormal))
        {
            return true;
        }
        return false;
    }

    function ProcessMove(float DeltaTime, Vector NewAccel, Engine.Actor.EDoubleClickDir DoubleClickMove, Rotator DeltaRot)
    {
        // End:0x36
        if(DoubleClickMove == 5 && Pawn.Physics == 2)
        {
            DoubleClickDir = 5;
        }
        // End:0x7c
        else
        {
            // End:0x7c
            if(DoubleClickMove != 0 && DoubleClickMove < 5)
            {
                // End:0x7c
                if(UnrealPawn(Pawn).Dodge(DoubleClickMove))
                {
                    DoubleClickDir = 5;
                }
            }
        }
        super.ProcessMove(DeltaTime, NewAccel, DoubleClickMove, DeltaRot);
    }

}

state Dead
{
    ignores KilledBy, SwitchWeapon;

    exec function Fire(optional float f)
    {
        Log("[PlayerController::Dead::Fire]" $ PlayerReplicationInfo.PlayerName);
        // End:0x65
        if(bFrozen)
        {
            // End:0x63
            if(TimerRate <= 0.0 || TimerRate > 1.0)
            {
                bFrozen = false;
            }
            return;
        }
        // End:0x81
        if(PlayerReplicationInfo.bOutOfLives)
        {
            ServerSpectate(true);
        }
        // End:0x8c
        else
        {
            super.Fire(f);
        }
    }

Begin:
    Sleep(3.0);
    // End:0x47
    if(ViewTarget == none || ViewTarget == self || VSize(ViewTarget.Velocity) < 1.0)
    {
        Sleep(1.0);
    }
    // End:0x4d
    else
    {
        goto 'Begin';
    }
    stop;
}

defaultproperties
{
    CustomStatusAnnouncerPack="UnrealGame.FemaleAnnouncer"
    CustomRewardAnnouncerPack="UnrealGame.MaleAnnouncer"
    MaxRecentServers=1
    LastKickWarningTime=-1000.0
    fAttackedCamera3DZoomRatioS=1.0
    fAttackedWeapon3DZoomRatioS=0.30
    fAttacked3DZoomSpeed=3500.0
    fAttacked3DZoomDecayAcc=650.0
    wAttackedStayingTime=0.010
    wAttackedSpeed=11000.0
    wAttackedDecayAcc=2250.0
    wAttackedAimRatio=0.350
    wAttackedCameraRatioF=1.0
    wAttackedCameraRatioS=1.70
    wApplyFront=(X=-400.0,Y=0.0,Z=0.0)
    wApplyBack=(X=400.0,Y=0.0,Z=0.0)
    wApplyRight=(X=0.0,Y=-300.0,Z=0.0)
    wApplyLeft=(X=0.0,Y=300.0,Z=0.0)
    PlayerChatType="UnrealGame.UnrealPlayerChatManager"
    FovAngle=85.0
    PlayerReplicationInfoClass=class'TeamPlayerReplicationInfo'
}