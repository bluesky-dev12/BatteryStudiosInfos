class UnrealPlayer extends PlayerController
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
    // Pos:0x000
    reliable if(int(Role) == int(ROLE_Authority))
        ClientDelayedAnnouncement, ClientDelayedAnnouncementNamed, 
        NewClientPlayTakeHit;

    // Pos:0x00D
    reliable if(int(Role) == int(ROLE_Authority))
        ClientReceiveBotDebugString, ClientReceiveLoginMenu, 
        ClientSendCombos, ClientSendMultiKills, 
        ClientSendSprees, ClientSendStats, 
        ClientSendVehicle, ClientSendWeapon, 
        PlayStartupMessage, PlayWinMessage;

    // Pos:0x01A
    reliable if(int(Role) < int(ROLE_Authority))
        ServerDropFlag, ServerGetNextVehicleStats, 
        ServerGetNextWeaponStats, ServerPlayVehicleHorn, 
        ServerSendBotDebugString, ServerSetReadyToStart, 
        ServerShowPathToBase, ServerTaunt, 
        ServerUpdateStatArrays, ServerUpdateStats;
}

function ServerUpdateStats(TeamPlayerReplicationInfo PRI)
{
    ClientSendStats(PRI, PRI.GoalsScored, PRI.bFirstBlood, PRI.Kills, PRI.Suicides, PRI.FlagTouches, PRI.FlagReturns, PRI.flakcount, PRI.combocount, PRI.headcount, PRI.ranovercount, PRI.DaredevilPoints);
    //return;    
}

function ServerUpdateStatArrays(TeamPlayerReplicationInfo PRI)
{
    ClientSendSprees(PRI, PRI.Spree[0], PRI.Spree[1], PRI.Spree[2], PRI.Spree[3], PRI.Spree[4], PRI.Spree[5]);
    ClientSendMultiKills(PRI, PRI.MultiKills[0], PRI.MultiKills[1], PRI.MultiKills[2], PRI.MultiKills[3], PRI.MultiKills[4], PRI.MultiKills[5], PRI.MultiKills[6]);
    ClientSendCombos(PRI, PRI.Combos[0], PRI.Combos[1], PRI.Combos[2], PRI.Combos[3], PRI.Combos[4]);
    //return;    
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
    //return;    
}

function ServerGetNextVehicleStats(TeamPlayerReplicationInfo PRI, int i)
{
    // End:0x1B
    if(i >= PRI.VehicleStatsArray.Length)
    {
        return;
    }
    ClientSendVehicle(PRI, PRI.VehicleStatsArray[i].VehicleClass, PRI.VehicleStatsArray[i].Kills, PRI.VehicleStatsArray[i].Deaths, PRI.VehicleStatsArray[i].DeathsDriving, i);
    //return;    
}

simulated function ClientSendWeapon(TeamPlayerReplicationInfo PRI, Class<wWeapon> W, int Kills, int Deaths, int deathsholding, int i)
{
    PRI.UpdateWeaponStats(PRI, W, Kills, Deaths, deathsholding);
    ServerGetNextWeaponStats(PRI, i + 1);
    //return;    
}

simulated function ClientSendVehicle(TeamPlayerReplicationInfo PRI, Class<Vehicle> V, int Kills, int Deaths, int DeathsDriving, int i)
{
    PRI.UpdateVehicleStats(PRI, V, Kills, Deaths, DeathsDriving);
    ServerGetNextVehicleStats(PRI, i + 1);
    //return;    
}

simulated function ClientSendSprees(TeamPlayerReplicationInfo PRI, byte Spree0, byte Spree1, byte Spree2, byte Spree3, byte Spree4, byte Spree5)
{
    PRI.Spree[0] = Spree0;
    PRI.Spree[1] = Spree1;
    PRI.Spree[2] = Spree2;
    PRI.Spree[3] = Spree3;
    PRI.Spree[4] = Spree4;
    PRI.Spree[5] = Spree5;
    //return;    
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
    //return;    
}

simulated function ClientSendCombos(TeamPlayerReplicationInfo PRI, byte Combos0, byte Combos1, byte Combos2, byte Combos3, byte Combos4)
{
    PRI.Combos[0] = Combos0;
    PRI.Combos[1] = Combos1;
    PRI.Combos[2] = Combos2;
    PRI.Combos[3] = Combos3;
    PRI.Combos[4] = Combos4;
    ServerGetNextWeaponStats(PRI, 0);
    //return;    
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
    //return;    
}

simulated event PostBeginPlay()
{
    local Class<AnnouncerVoice> VoiceClass;

    super.PostBeginPlay();
    // End:0x95
    if(int(Level.NetMode) != int(NM_DedicatedServer))
    {
        VoiceClass = Class<AnnouncerVoice>(DynamicLoadObject(CustomStatusAnnouncerPack, Class'Core.Class'));
        StatusAnnouncer = Spawn(VoiceClass);
        VoiceClass = Class<AnnouncerVoice>(DynamicLoadObject(CustomRewardAnnouncerPack, Class'Core.Class'));
        RewardAnnouncer = Spawn(VoiceClass);
        PrecacheAnnouncements();
        Level.static.GetGameClass().Precache(Level);
    }
    //return;    
}

function AwardAdrenaline(float Amount)
{
    // End:0x6B
    if(bAdrenalineEnabled)
    {
        // End:0x60
        if(((Adrenaline < AdrenalineMax) && (Adrenaline + Amount) >= AdrenalineMax) && (Pawn == none) || !Pawn.InCurrentCombo())
        {
            ClientDelayedAnnouncementNamed('Adrenalin', 15);
        }
        super(Controller).AwardAdrenaline(Amount);
    }
    //return;    
}

function ClientDelayedAnnouncementNamed(name Announcement, byte Delay)
{
    local AnnounceAdrenaline A;

    A = Spawn(Class'UnrealGame_Decompressed.AnnounceAdrenaline', self);
    A.Announcement = Announcement;
    A.SetTimer(0.1000000 * float(Delay), false);
    //return;    
}

function ClientDelayedAnnouncement(Sound AnnouncementSound, byte Delay)
{
    local AnnounceAdrenaline A;

    A = Spawn(Class'UnrealGame_Decompressed.AnnounceAdrenaline', self);
    A.AnnounceSound = AnnouncementSound;
    A.SetTimer(0.1000000 * float(Delay), false);
    //return;    
}

function LogMultiKills(float Reward, bool bEnemyKill)
{
    // End:0x1E
    if(bEnemyKill)
    {
        MultiKillLevel = Min(5, MultiKillLevel + 1);        
    }
    else
    {
        MultiKillLevel = 0;
    }
    // End:0x42
    if(bEnemyKill)
    {
        LastKillTime = Level.TimeSeconds;
    }
    //return;    
}

exec function ShowAI()
{
    myHUD.ShowDebug();
    // End:0x43
    if(UnrealPawn(ViewTarget) != none)
    {
        UnrealPawn(ViewTarget).bSoakDebug = myHUD.bShowDebugInfo;
    }
    //return;    
}

function Possess(Pawn aPawn)
{
    super.Possess(aPawn);
    //return;    
}

function bool AutoTaunt()
{
    // End:0x2D
    if(!bAutoTaunt || LastAutoTauntTime > (Level.TimeSeconds - float(2)))
    {
        return false;
    }
    LastAutoTauntTime = Level.TimeSeconds;
    return true;
    //return;    
}

function bool DontReuseTaunt(int t)
{
    // End:0x11
    if(t == LastTaunt)
    {
        return true;
    }
    // End:0x49
    if((t == Level.LastTaunt[0]) || t == Level.LastTaunt[1])
    {
        return true;
    }
    LastTaunt = t;
    Level.LastTaunt[1] = Level.LastTaunt[0];
    Level.LastTaunt[0] = t;
    return false;
    //return;    
}

exec function SoakBots()
{
    local Bot B;

    Log("Start Soaking");
    UnrealMPGameInfo(Level.Game).bSoaking = true;
    // End:0x52
    foreach DynamicActors(Class'UnrealGame_Decompressed.Bot', B)
    {
        B.bSoaking = true;        
    }    
    //return;    
}

function SoakPause(Pawn P)
{
    Log("Soak pause by " $ string(P));
    SetViewTarget(P);
    SetPause(true);
    bBehindView = true;
    myHUD.bShowDebugInfo = true;
    // End:0x6C
    if(UnrealPawn(P) != none)
    {
        UnrealPawn(P).bSoakDebug = true;
    }
    //return;    
}

exec function BasePath(byte Num)
{
    // End:0x16
    if(PlayerReplicationInfo.Team == none)
    {
        return;
    }
    ServerShowPathToBase(int(Num));
    //return;    
}

function ServerShowPathToBase(int TeamNum)
{
    // End:0x3C
    if((int(Level.NetMode) != int(NM_Standalone)) && (Level.TimeSeconds - LastWhispTime) < 0.5000000)
    {
        return;
    }
    LastWhispTime = Level.TimeSeconds;
    // End:0xA6
    if(((Pawn == none) || !Level.Game.bTeamGame) || !UnrealMPGameInfo(Level.Game).CanShowPathTo(self, TeamNum))
    {
        return;
    }
    UnrealMPGameInfo(Level.Game).ShowPathTo(self, TeamNum);
    //return;    
}

function byte GetMessageIndex(name PhraseName)
{
    return 0;
    //return;    
}

exec function RandomTaunt()
{
    local int tauntNum;

    // End:0x0D
    if(Pawn == none)
    {
        return;
    }
    tauntNum = Rand(Pawn.TauntAnims.Length - 4);
    TAUNT(Pawn.TauntAnims[4 + tauntNum]);
    //return;    
}

exec function TAUNT(name Sequence)
{
    // End:0x2A
    if((Vehicle(Pawn) != none) && Sequence == 'gesture_point')
    {
        PlayVehicleHorn(0);
        return;
    }
    // End:0xA4
    if((((Pawn != none) && Pawn.Health > 0) && (Level.TimeSeconds - LastTauntAnimTime) > 0.5000000) && Pawn.FindValidTaunt(Sequence))
    {
        ServerTaunt(Sequence);
        LastTauntAnimTime = Level.TimeSeconds;
    }
    //return;    
}

function ServerTaunt(name AnimName)
{
    // End:0x83
    if((((Pawn != none) && Pawn.Health > 0) && (Level.TimeSeconds - LastTauntAnimTime) > 0.3000000) && Pawn.FindValidTaunt(AnimName))
    {
        Pawn.SetAnimAction(AnimName);
        LastTauntAnimTime = Level.TimeSeconds;
    }
    //return;    
}

exec function PlayVehicleHorn(int HornIndex)
{
    local Vehicle V;

    V = Vehicle(Pawn);
    // End:0x71
    if(((V != none) && V.Health > 0) && (Level.TimeSeconds - LastTauntAnimTime) > 0.3000000)
    {
        ServerPlayVehicleHorn(HornIndex);
        LastTauntAnimTime = Level.TimeSeconds;
    }
    //return;    
}

function ServerPlayVehicleHorn(int HornIndex)
{
    local Vehicle V;

    V = Vehicle(Pawn);
    // End:0x7A
    if(((V != none) && V.Health > 0) && (Level.TimeSeconds - LastTauntAnimTime) > 0.3000000)
    {
        V.ServerPlayHorn(HornIndex);
        LastTauntAnimTime = Level.TimeSeconds;
    }
    //return;    
}

simulated function PlayStatusAnnouncement(string AName, byte AnnouncementLevel, optional bool bForce)
{
    // End:0x39
    if(int(AnnouncementLevel) > int(AnnouncerLevel))
    {
        // End:0x24
        if(int(AnnouncementLevel) == 2)
        {            
        }
        else
        {
            // End:0x37
            if(int(AnnouncementLevel) == 1)
            {
                PlayBeepSound();
            }
        }
        return;
    }
    super.PlayStatusAnnouncement(AName, AnnouncementLevel, bForce);
    //return;    
}

simulated function PlayRewardAnnouncement(name AName, byte AnnouncementLevel, optional bool bForce, optional Actor.ESoundSlot Slot)
{
    // End:0x39
    if(int(AnnouncementLevel) > int(AnnouncerLevel))
    {
        // End:0x24
        if(int(AnnouncementLevel) == 2)
        {            
        }
        else
        {
            // End:0x37
            if(int(AnnouncementLevel) == 1)
            {
                PlayBeepSound();
            }
        }
        return;
    }
    super.PlayRewardAnnouncement(AName, AnnouncementLevel, bForce, Slot);
    //return;    
}

simulated function PlayAnnouncement(Sound ASound, byte AnnouncementLevel, optional bool bForce)
{
    // End:0x39
    if(int(AnnouncementLevel) > int(AnnouncerLevel))
    {
        // End:0x24
        if(int(AnnouncementLevel) == 2)
        {            
        }
        else
        {
            // End:0x37
            if(int(AnnouncementLevel) == 1)
            {
                PlayBeepSound();
            }
        }
        return;
    }
    super.PlayAnnouncement(ASound, AnnouncementLevel, bForce);
    //return;    
}

event KickWarning()
{
    // End:0x42
    if((Level.TimeSeconds - LastKickWarningTime) > 0.5000000)
    {
        ReceiveLocalizedMessage(Class'UnrealGame_Decompressed.IdleKickWarningMessage', 0, none, none, self);
        LastKickWarningTime = Level.TimeSeconds;
    }
    //return;    
}

function PlayStartupMessage(byte StartupStage)
{
    ReceiveLocalizedMessage(Class'UnrealGame_Decompressed.StartupMessage', int(StartupStage), PlayerReplicationInfo);
    //return;    
}

simulated event PostNetReceive()
{
    super(Actor).PostNetReceive();
    // End:0x21
    if(ChatManager != none)
    {
        ChatManager.PlayerOwner = self;
    }
    //return;    
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
    //return;    
}

function ServerSetReadyToStart()
{
    bReadyToStart = true;
    //return;    
}

simulated function ClientReceiveLoginMenu(string MenuClass, bool bForce)
{
    LoginMenuClass = MenuClass;
    bForceLoginMenu = bForce;
    //return;    
}

simulated function ShowLoginMenu()
{
    local int X;
    local string NetworkAddress;

    // End:0x56
    if(((int(Level.NetMode) != int(NM_Client)) || (Pawn != none) && Pawn.Health > 0) || bDontShowLoginMenu && !bForceLoginMenu)
    {
        return;
    }
    // End:0x10E
    if(!bForceLoginMenu)
    {
        NetworkAddress = GetServerNetworkAddress();
        // End:0x7B
        if(NetworkAddress == "")
        {
            return;
        }
        X = 0;
        J0x82:

        // End:0xDA [Loop If]
        if(X < RecentServers.Length)
        {
            // End:0xD0
            if(NetworkAddress ~= RecentServers[X])
            {
                RecentServers.Insert(0, 1);
                RecentServers[0] = NetworkAddress;
                RecentServers.Remove(X + 1, 1);
                SaveConfig();
                return;
            }
            X++;
            // [Loop Continue]
            goto J0x82;
        }
        RecentServers.Insert(0, 1);
        RecentServers[0] = NetworkAddress;
        // End:0x10B
        if(RecentServers.Length > MaxRecentServers)
        {
            RecentServers.Length = MaxRecentServers;
        }
        SaveConfig();
    }
    ClientReplaceMenu(LoginMenuClass);
    //return;    
}

function NotifyTakeHit(Pawn instigatedBy, Vector HitLocation, int Damage, Class<DamageType> DamageType, Vector Momentum, optional int CollisionPart)
{
    local int iDam;
    local Vector AttackLoc;
    local float fHitGunKick, iWeaponID, fNewVel, fOldVel;
    local PlayerInput pInput;

    super(Controller).NotifyTakeHit(instigatedBy, HitLocation, Damage, DamageType, Momentum, CollisionPart);
    DamageShake(Damage);
    iDam = Clamp(Damage, 0, 250);
    // End:0x5E
    if(instigatedBy != none)
    {
        AttackLoc = instigatedBy.Location;
    }
    // End:0xC0
    if(instigatedBy.Weapon != none)
    {
        fHitGunKick = instigatedBy.Weapon.BaseParams.fHitGunKick;
        iWeaponID = float(instigatedBy.Weapon.BaseParams.iWeaponID);
    }
    // End:0x19D
    if(bHit == false)
    {
        bHitRun = bRun;
        pInput = GetPlayerInput();
        // End:0x10F
        if((int(bRun) > 0) && pInput.bWasForward != true)
        {
            bHitRun = 0;
        }
        // End:0x18D
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
    //return;    
}

function NewClientPlayTakeHit(Vector AttackLoc, Vector HitLoc, byte Damage, Class<DamageType> DamageType, optional int iWeaponID, optional float fHitGunKick, optional int CollisionPart)
{
    local Vector HitDir;
    local wWeaponBaseParams WBP;
    local float fNewVel, fOldVel;
    local PlayerInput pInput;

    // End:0x17F
    if((myHUD != none) && (int(Damage) > 0) || bGodMode)
    {
        // End:0x5C
        if(AttackLoc != vect(0.0000000, 0.0000000, 0.0000000))
        {
            HitDir = Normal(AttackLoc - Pawn.Location);            
        }
        else
        {
            HitDir = Normal(HitLoc);
        }
        myHUD.NotifyTakeHit(AttackLoc, int(Damage), DamageType, HitLoc, CollisionPart);
        AttackedView(iWeaponID, fHitGunKick, HitDir);
        // End:0x17F
        if(bHit == false)
        {
            bHitRun = bRun;
            pInput = GetPlayerInput();
            // End:0xF7
            if((int(bRun) > 0) && pInput.bWasForward != true)
            {
                bHitRun = 0;
            }
            ServerSetOldRun(0, bHitRun);
            WBP = Level.WeaponMgr.GetBaseParam(iWeaponID);
            // End:0x16F
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
    // End:0x1AB
    if(bEnableDamageForceFeedback)
    {
        ClientPlayForceFeedback("Damage");
    }
    // End:0x1E4
    if(int(Level.NetMode) == int(NM_Client))
    {
        Pawn.PlayTakeHit(HitLoc, int(Damage), DamageType);
    }
    //return;    
}

function HitSound()
{
    //return;    
}

function ClientPlayTakeHit(Vector HitLoc, byte Damage, Class<DamageType> DamageType, optional int CollisionPart)
{
    NewClientPlayTakeHit(Location, HitLoc, Damage, DamageType,,, CollisionPart);
    //return;    
}

function PlayWinMessage(bool bWinner)
{
    // End:0x1C
    if(bWinner)
    {
        bDisplayWinner = true;
        bDisplayLoser = false;        
    }
    else
    {
        bDisplayWinner = false;
        bDisplayLoser = true;
    }
    //return;    
}

exec function DropFlag()
{
    ServerDropFlag();
    //return;    
}

function ServerDropFlag()
{
    // End:0x23
    if((PlayerReplicationInfo == none) || PlayerReplicationInfo.HasFlag == none)
    {
        return;
    }
    PlayerReplicationInfo.HasFlag.Drop(Pawn.Velocity * 0.5000000);
    //return;    
}

function ShowMidGameMenu(bool bPause)
{
    // End:0x1B
    if(Level.Pauser == none)
    {
        SetPause(true);
    }
    // End:0x3A
    if(int(Level.NetMode) != int(NM_DedicatedServer))
    {
        StopForceFeedback();
    }
    // End:0x51
    if(bDemoOwner)
    {
        ClientOpenMenu(DemoMenuClass);        
    }
    else
    {
        // End:0x6B
        if(LoginMenuClass != "")
        {
            ClientOpenMenu(LoginMenuClass);            
        }
        else
        {
            ClientOpenMenu(MidGameMenuClass);
        }
    }
    //return;    
}

simulated function string GetCustomStatusAnnouncerClass()
{
    return CustomStatusAnnouncerPack;
    //return;    
}

simulated function SetCustomStatusAnnouncerClass(string NewAnnouncerClass)
{
    CustomStatusAnnouncerPack = NewAnnouncerClass;
    //return;    
}

simulated function string GetCustomRewardAnnouncerClass()
{
    return CustomRewardAnnouncerPack;
    //return;    
}

simulated function SetCustomRewardAnnouncerClass(string NewAnnouncerClass)
{
    CustomRewardAnnouncerPack = NewAnnouncerClass;
    //return;    
}

simulated function bool NeedNetNotify()
{
    return super.NeedNetNotify() || ChatManager == none;
    //return;    
}

simulated event PostNetBeginPlay()
{
    super(Actor).PostNetBeginPlay();
    // End:0x74
    if((int(Level.NetMode) == int(NM_Client)) || int(Level.NetMode) == int(NM_ListenServer))
    {
        bVoiceChatEnabled = bool(ConsoleCommand("get ini:Engine.Engine.AudioDevice UseVoIP"));
    }
    //return;    
}

simulated function AutoJoinVoiceChat()
{
    local int i, j, cnt;
    local string DefaultChannel;

    // End:0x43
    if(!bVoiceChatEnabled || (int(Level.NetMode) != int(NM_Client)) && int(Level.NetMode) != int(NM_ListenServer))
    {
        return;
    }
    // End:0x8A
    if(VoiceReplicationInfo == none)
    {
        Log(string(Name) @ "AutoJoinVoiceChat() do not have VRI yet!", 'VoiceChat');
        return;
    }
    cnt = VoiceReplicationInfo.GetPublicChannelCount(true);
    i = 0;
    J0xA7:

    // End:0x146 [Loop If]
    if(i < cnt)
    {
        // End:0x13C
        if(bool(int(AutoJoinMask) & (1 << i)))
        {
            Join(VoiceReplicationInfo.PublicChannelNames[i], "");
            j = RejoinChannels.Length - 1;
            J0xF7:

            // End:0x13C [Loop If]
            if(j >= 0)
            {
                // End:0x132
                if(RejoinChannels[j] == VoiceReplicationInfo.PublicChannelNames[i])
                {
                    RejoinChannels.Remove(j, 1);
                }
                j--;
                // [Loop Continue]
                goto J0xF7;
            }
        }
        i++;
        // [Loop Continue]
        goto J0xA7;
    }
    i = 0;
    J0x14D:

    // End:0x17A [Loop If]
    if(i < RejoinChannels.Length)
    {
        Join(RejoinChannels[i], "");
        i++;
        // [Loop Continue]
        goto J0x14D;
    }
    // End:0x194
    if(LastActiveChannel != "")
    {
        Speak(LastActiveChannel);        
    }
    else
    {
        // End:0x1CD
        if((ActiveRoom == none) && bEnableInitialChatRoom)
        {
            DefaultChannel = GetDefaultActiveChannel();
            // End:0x1CD
            if(DefaultChannel != "")
            {
                Speak(DefaultChannel);
            }
        }
    }
    // End:0x1FA
    if((RejoinChannels.Length > 0) || LastActiveChannel != "")
    {
        RejoinChannels.Length = 0;
        LastActiveChannel = "";
        SaveConfig();
    }
    //return;    
}

function ClientGameEnded()
{
    local int i;
    local array<VoiceChatRoom> Channels;

    // End:0xFF
    if((bVoiceChatEnabled && PlayerReplicationInfo != none) && VoiceReplicationInfo != none)
    {
        Log((string(Name) @ PlayerReplicationInfo.PlayerName) @ "ClientGameEnded()", 'VoiceChat');
        Channels = VoiceReplicationInfo.GetChannels();
        i = 0;
        J0x72:

        // End:0xDF [Loop If]
        if(i < Channels.Length)
        {
            // End:0xD5
            if((Channels[i] != none) && Channels[i].IsMember(PlayerReplicationInfo, true))
            {
                RejoinChannels[RejoinChannels.Length] = Channels[i].GetTitle();
            }
            i++;
            // [Loop Continue]
            goto J0x72;
        }
        // End:0xFF
        if(ActiveRoom != none)
        {
            LastActiveChannel = ActiveRoom.GetTitle();
        }
    }
    // End:0x11C
    if((RejoinChannels.Length > 0) || LastActiveChannel != "")
    {
        SaveConfig();
    }
    super(Controller).ClientGameEnded();
    //return;    
}

function ServerChatDebug()
{
    local BroadcastHandler B;

    B = Level.Game.BroadcastHandler;
    J0x1D:

    // End:0x63 [Loop If]
    if(B != none)
    {
        // End:0x4C
        if(UnrealChatHandler(B) != none)
        {
            UnrealChatHandler(B).DoChatDebug();
        }
        B = B.NextBroadcastHandler;
        // [Loop Continue]
        goto J0x1D;
    }
    //return;    
}

exec function NetDebugBot()
{
    // End:0x30
    if((int(Level.NetMode) == int(NM_Client)) && ViewTarget != Pawn)
    {
        ServerSendBotDebugString();
    }
    //return;    
}

function ServerSendBotDebugString()
{
    // End:0x60
    if(Bot(RealViewTarget) != none)
    {
        ClientReceiveBotDebugString((("(ORDERS: " $ string(Bot(RealViewTarget).Squad.GetOrders())) $ ") ") $ Bot(RealViewTarget).GoalString);        
    }
    else
    {
        ClientReceiveBotDebugString("");
    }
    //return;    
}

simulated function ClientReceiveBotDebugString(string DebugString)
{
    NetBotDebugString = DebugString;
    // End:0x1D
    if(NetBotDebugString != "")
    {
        ServerSendBotDebugString();
    }
    //return;    
}

simulated function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
    super.DisplayDebug(Canvas, YL, YPos);
    // End:0x8D
    if(NetBotDebugString != "")
    {
        Canvas.SetDrawColor(byte(255), byte(255), byte(255));
        Canvas.DrawText("Bot ViewTarget's Goal: " $ NetBotDebugString);
        YPos += YL;
        Canvas.SetPos(4.0000000, YPos);
    }
    //return;    
}

function RotateByAttacked(out Vector CameraLocation, out Rotator CameraRotation)
{
    local Rotator rTemp;
    local float f3DZoomRatio;

    // End:0x12
    if(int(wAttackedState) == int(0))
    {
        return;
    }
    rTemp.Pitch = wAttackedRot.Pitch;
    rTemp.Roll = wAttackedRot.Yaw;
    // End:0x256
    if(((Pawn != none) && Pawn.Weapon != none) && Pawn.Weapon.IsA('wGun'))
    {
        // End:0xFB
        if(int(wGun(Pawn.Weapon).AimState) == int(0))
        {
            f3DZoomRatio = 1.0000000;
            // End:0xF8
            if((int(wADirState) == int(3)) || int(wADirState) == int(4))
            {
                wGun(Pawn.Weapon).SetAttackedRot(Normalize(wAttackedRot));
            }            
        }
        else
        {
            wGun(Pawn.Weapon).SetAttackedRot(rot(0, 0, 0));
            // End:0x180
            if(Pawn.Weapon.GetFireMode(1).IsA('wZoomFire3D') && (int(wADirState) == int(4)) || int(wADirState) == int(3))
            {
                f3DZoomRatio = fAttackedCamera3DZoomRatioS;                
            }
            else
            {
                f3DZoomRatio = 1.0000000;
            }
        }
        // End:0x1FA
        if(int(wADirState) == int(4))
        {
            // End:0x1BB
            if(rTemp.Roll > 32768)
            {
                rTemp.Roll = 0;
            }
            rTemp.Roll = int(float(rTemp.Roll) + (((wAttackedCameraRatioS * f3DZoomRatio) - 1.0000000) * float(rTemp.Roll)));            
        }
        else
        {
            // End:0x256
            if(int(wADirState) == int(3))
            {
                rTemp.Roll = int(float(rTemp.Roll) - ((((wAttackedCameraRatioS * f3DZoomRatio) - 1.0000000) * float(65535 - rTemp.Roll)) / float(65535)));
            }
        }
    }
    CameraRotation = Normalize(CameraRotation + rTemp);
    //return;    
}

function AttackedView(int iWeaponID, float fHitGunKick, Vector vAttacked)
{
    local int iPitch, iYaw, iRoll;
    local float fValue, fAimRatio;
    local Vector ViewDir, AxisX, AxisY, AxisZ, ApplyValue;

    // End:0x23
    if((Pawn != none) && Pawn.IsA('Vehicle'))
    {
        return;
    }
    wAttackedRot = rot(0, 0, 0);
    wAttackedState = 0;
    ViewDir = Vector(Pawn.Rotation);
    fValue = ViewDir Dot vAttacked;
    // End:0x123
    if(fValue > float(0))
    {
        // End:0xA3
        if(fValue > 0.7070000)
        {
            DirName = 'Front';
            ApplyValue = wApplyFront;
            wADirState = 1;            
        }
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
            else
            {
                DirName = 'Left';
                ApplyValue = wApplyLeft;
                wADirState = 4;
            }
        }        
    }
    else
    {
        // End:0x153
        if(fValue < -0.7070000)
        {
            DirName = 'back';
            ApplyValue = wApplyBack;
            wADirState = 2;            
        }
        else
        {
            GetAxes(Pawn.Rotation, AxisX, AxisY, AxisZ);
            fValue = AxisY Dot vAttacked;
            // End:0x1B2
            if(fValue > float(0))
            {
                DirName = 'Right';
                ApplyValue = wApplyRight;
                wADirState = 3;                
            }
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
    // End:0x2FA
    if((((Pawn != none) && Pawn.Weapon != none) && Pawn.Weapon.IsA('wGun')) && int(wGun(Pawn.Weapon).AimState) == int(2))
    {
        fAimRatio = wAttackedAimRatio;
        // End:0x2F7
        if(Pawn.Weapon.GetFireMode(1).IsA('wZoomFire3D'))
        {
            // End:0x2F7
            if((int(wADirState) == int(3)) || int(wADirState) == int(4))
            {
                fAimRatio = fAttackedWeapon3DZoomRatioS;
                wAttackedSpeed = fAttacked3DZoomSpeed;
                wAttackedDecayAcc = fAttacked3DZoomDecayAcc;
            }
        }        
    }
    else
    {
        fAimRatio = 1.0000000;
    }
    iPitch = int((ApplyValue.X * fAimRatio) * fHitGunKick);
    iYaw = int((ApplyValue.Y * fAimRatio) * fHitGunKick);
    iRoll = int((ApplyValue.Z * fAimRatio) * fHitGunKick);
    wAttackedView(iPitch, iYaw, iRoll);
    //return;    
}

function wAttackedView(int iPitch, int iYaw, int iRoll)
{
    local int iDist1, iDist2;

    wAttackedState = 1;
    wAttackedDest.Pitch = wAttackedRot.Pitch - iPitch;
    wAttackedDest.Yaw = wAttackedRot.Yaw + iYaw;
    wAttackedDest.Roll = wAttackedRot.Roll + iRoll;
    J0x5C:

    // End:0x80 [Loop If]
    if(wAttackedDest.Pitch < 0)
    {
        wAttackedDest.Pitch += 65536;
        // [Loop Continue]
        goto J0x5C;
    }
    wAttackedDest.Pitch = int(float(wAttackedDest.Pitch) % float(65536));
    J0xA2:

    // End:0xC6 [Loop If]
    if(wAttackedDest.Yaw < 0)
    {
        wAttackedDest.Yaw += 65536;
        // [Loop Continue]
        goto J0xA2;
    }
    wAttackedDest.Yaw = int(float(wAttackedDest.Yaw) % float(65536));
    J0xE8:

    // End:0x10C [Loop If]
    if(wAttackedDest.Roll < 0)
    {
        wAttackedDest.Roll += 65536;
        // [Loop Continue]
        goto J0xE8;
    }
    wAttackedDest.Roll = int(float(wAttackedDest.Roll) % float(65536));
    iDist1 = wAttackedDest.Pitch - wAttackedRot.Pitch;
    J0x14A:

    // End:0x164 [Loop If]
    if(iDist1 < 0)
    {
        iDist1 += 65536;
        // [Loop Continue]
        goto J0x14A;
    }
    iDist1 = int(float(iDist1) % float(65536));
    iDist2 = wAttackedRot.Pitch - wAttackedDest.Pitch;
    J0x198:

    // End:0x1B2 [Loop If]
    if(iDist2 < 0)
    {
        iDist2 += 65536;
        // [Loop Continue]
        goto J0x198;
    }
    iDist2 = int(float(iDist2) % float(65536));
    // End:0x1EE
    if(iDist1 <= iDist2)
    {
        wAttackedVelocity.X = float(iDist1);        
    }
    else
    {
        wAttackedVelocity.X = -1.0000000 * float(iDist2);
    }
    iDist1 = wAttackedDest.Yaw - wAttackedRot.Yaw;
    J0x223:

    // End:0x23D [Loop If]
    if(iDist1 < 0)
    {
        iDist1 += 65536;
        // [Loop Continue]
        goto J0x223;
    }
    iDist1 = int(float(iDist1) % float(65536));
    iDist2 = wAttackedRot.Yaw - wAttackedDest.Yaw;
    J0x271:

    // End:0x28B [Loop If]
    if(iDist2 < 0)
    {
        iDist2 += 65536;
        // [Loop Continue]
        goto J0x271;
    }
    iDist2 = int(float(iDist2) % float(65536));
    // End:0x2C7
    if(iDist1 <= iDist2)
    {
        wAttackedVelocity.Y = float(iDist1);        
    }
    else
    {
        wAttackedVelocity.Y = -1.0000000 * float(iDist2);
    }
    iDist1 = wAttackedDest.Roll - wAttackedRot.Roll;
    J0x2FC:

    // End:0x316 [Loop If]
    if(iDist1 < 0)
    {
        iDist1 += 65536;
        // [Loop Continue]
        goto J0x2FC;
    }
    iDist1 = int(float(iDist1) % float(65536));
    iDist2 = wAttackedRot.Roll - wAttackedDest.Roll;
    J0x34A:

    // End:0x364 [Loop If]
    if(iDist2 < 0)
    {
        iDist2 += 65536;
        // [Loop Continue]
        goto J0x34A;
    }
    iDist2 = int(float(iDist2) % float(65536));
    // End:0x3A0
    if(iDist1 <= iDist2)
    {
        wAttackedVelocity.Z = float(iDist1);        
    }
    else
    {
        wAttackedVelocity.Z = -1.0000000 * float(iDist2);
    }
    wAttackedDist = VSize(wAttackedVelocity);
    wAttackedVelocity = Normal(wAttackedVelocity) * wAttackedSpeed;
    //return;    
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
    if(int(wAttackedState) == int(0))
    {
        wAttackedRot = rot(0, 0, 0);
        return;
    }
    wAttackedDeltaTime += DeltaTime;
    fFixedTime = 0.0166667;
    DeltaTime = fFixedTime;
    J0x5A:

    // End:0x5DC [Loop If]
    if(wAttackedDeltaTime >= fFixedTime)
    {
        wAttackedDeltaTime -= fFixedTime;
        // End:0x88
        if(int(wAttackedState) == int(0))
        {
            // [Explicit Break]
            goto J0x5DC;
        }
        switch(wAttackedState)
        {
            // End:0xA2
            case 0:
                wAttackedDeltaTime = 0.0000000;
                // End:0x5D9
                break;
            // End:0x27F
            case 1:
                wAttackedRot.Pitch = int(float(wAttackedRot.Pitch) + (wAttackedVelocity.X * DeltaTime));
                wAttackedRot.Yaw = int(float(wAttackedRot.Yaw) + (wAttackedVelocity.Y * DeltaTime));
                wAttackedRot.Roll = int(float(wAttackedRot.Roll) + (wAttackedVelocity.Z * DeltaTime));
                J0x12B:

                // End:0x14F [Loop If]
                if(wAttackedRot.Pitch < 0)
                {
                    wAttackedRot.Pitch += 65536;
                    // [Loop Continue]
                    goto J0x12B;
                }
                wAttackedRot.Pitch = int(float(wAttackedRot.Pitch) % float(65536));
                J0x171:

                // End:0x195 [Loop If]
                if(wAttackedRot.Yaw < 0)
                {
                    wAttackedRot.Yaw += 65536;
                    // [Loop Continue]
                    goto J0x171;
                }
                wAttackedRot.Yaw = int(float(wAttackedRot.Yaw) % float(65536));
                J0x1B7:

                // End:0x1DB [Loop If]
                if(wAttackedRot.Roll < 0)
                {
                    wAttackedRot.Roll += 65536;
                    // [Loop Continue]
                    goto J0x1B7;
                }
                wAttackedRot.Roll = int(float(wAttackedRot.Roll) % float(65536));
                wAttackedDist -= (wAttackedSpeed * DeltaTime);
                wAttackedSpeed -= (wAttackedDecel * DeltaTime);
                // End:0x248
                if(wAttackedSpeed <= 0.0000000)
                {
                    wAttackedState = 2;
                    wAttackedDest = wAttackedRot;
                    // [Explicit Continue]
                    goto J0x5D9;
                }
                wAttackedVelocity = Normal(wAttackedVelocity) * wAttackedSpeed;
                // End:0x27C
                if(wAttackedDist <= float(0))
                {
                    wAttackedState = 2;
                    wAttackedRot = wAttackedDest;
                }
                // End:0x5D9
                break;
            // End:0x404
            case 2:
                wAttackedStayingTime -= DeltaTime;
                // End:0x401
                if(wAttackedStayingTime <= 0.0000000)
                {
                    wAttackedState = 3;
                    i1 = wAttackedDest.Pitch;
                    i2 = 65536 - wAttackedDest.Pitch;
                    // End:0x2F2
                    if(i1 <= i2)
                    {
                        v1.X = float(i1);                        
                    }
                    else
                    {
                        v1.X = -1.0000000 * float(i2);
                    }
                    i1 = wAttackedDest.Yaw;
                    i2 = 65536 - wAttackedDest.Yaw;
                    // End:0x356
                    if(i1 <= i2)
                    {
                        v1.Y = float(i1);                        
                    }
                    else
                    {
                        v1.Y = -1.0000000 * float(i2);
                    }
                    i1 = wAttackedDest.Roll;
                    i2 = 65536 - wAttackedDest.Roll;
                    // End:0x3BA
                    if(i1 <= i2)
                    {
                        v1.Z = float(i1);                        
                    }
                    else
                    {
                        v1.Z = -1.0000000 * float(i2);
                    }
                    wAttackedDist = VSize(v1);
                    wAttackedDecay = wAttackedDecayAcc;
                    wAttackedVelocity = -Normal(v1) * wAttackedDecay;
                }
                // End:0x5D9
                break;
            // End:0x5D6
            case 3:
                wAttackedRot.Pitch = int(float(wAttackedRot.Pitch) + (wAttackedVelocity.X * DeltaTime));
                wAttackedRot.Yaw = int(float(wAttackedRot.Yaw) + (wAttackedVelocity.Y * DeltaTime));
                wAttackedRot.Roll = int(float(wAttackedRot.Roll) + (wAttackedVelocity.Z * DeltaTime));
                J0x48D:

                // End:0x4B1 [Loop If]
                if(wAttackedRot.Pitch < 0)
                {
                    wAttackedRot.Pitch += 65536;
                    // [Loop Continue]
                    goto J0x48D;
                }
                wAttackedRot.Pitch = int(float(wAttackedRot.Pitch) % float(65536));
                J0x4D3:

                // End:0x4F7 [Loop If]
                if(wAttackedRot.Yaw < 0)
                {
                    wAttackedRot.Yaw += 65536;
                    // [Loop Continue]
                    goto J0x4D3;
                }
                wAttackedRot.Yaw = int(float(wAttackedRot.Yaw) % float(65536));
                J0x519:

                // End:0x53D [Loop If]
                if(wAttackedRot.Roll < 0)
                {
                    wAttackedRot.Roll += 65536;
                    // [Loop Continue]
                    goto J0x519;
                }
                wAttackedRot.Roll = int(float(wAttackedRot.Roll) % float(65536));
                wAttackedDist -= (wAttackedDecay * DeltaTime);
                // End:0x5A8
                if(wAttackedDist <= float(0))
                {
                    wAttackedState = 0;
                    wAttackedRot = rot(0, 0, 0);
                    wAttackedDeltaTime = 0.0000000;                    
                }
                else
                {
                    wAttackedVelocity /= wAttackedDecay;
                    wAttackedDecay += (wAttackedDecayAcc * DeltaTime);
                    wAttackedVelocity *= wAttackedDecay;
                }
                // End:0x5D9
                break;
            // End:0xFFFF
            default:
                break;
        }
        J0x5D9:

        // [Loop Continue]
        goto J0x5A;
    }
    J0x5DC:

    //return;    
}

auto state PlayerWaiting
{
    exec function Fire(optional float f)
    {
        LoadPlayers();
        // End:0x3C
        if((!bForcePrecache && Level.TimeSeconds > 0.2000000) && bReadyToStart)
        {
            ServerReStartPlayer();
        }
        //return;        
    }

    function bool CanRestartPlayer()
    {
        return (bReadyToStart || (DeathMatch(Level.Game) != none) && DeathMatch(Level.Game).bForceRespawn) && super(PlayerController).CanRestartPlayer();
        //return;        
    }
    stop;    
}

state PlayerWalking
{
    ignores ProcessMove, NotifyLanded;

    function bool NotifyLanded(Vector HitNormal)
    {
        // End:0x3F
        if(int(DoubleClickDir) == int(5))
        {
            DoubleClickDir = 6;
            ClearDoubleClick();
            Pawn.Velocity *= vect(0.1000000, 0.1000000, 1.0000000);            
        }
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
        //return;        
    }

    function ProcessMove(float DeltaTime, Vector NewAccel, Actor.EDoubleClickDir DoubleClickMove, Rotator DeltaRot)
    {
        // End:0x36
        if((int(DoubleClickMove) == int(5)) && int(Pawn.Physics) == int(2))
        {
            DoubleClickDir = 5;            
        }
        else
        {
            // End:0x7C
            if((int(DoubleClickMove) != int(0)) && int(DoubleClickMove) < int(5))
            {
                // End:0x7C
                if(UnrealPawn(Pawn).Dodge(DoubleClickMove))
                {
                    DoubleClickDir = 5;
                }
            }
        }
        super.ProcessMove(DeltaTime, NewAccel, DoubleClickMove, DeltaRot);
        //return;        
    }
    stop;    
}

state Dead
{
    ignores Fire;

    exec function Fire(optional float f)
    {
        Log("[PlayerController::Dead::Fire]" $ PlayerReplicationInfo.PlayerName);
        // End:0x65
        if(bFrozen)
        {
            // End:0x63
            if((TimerRate <= 0.0000000) || TimerRate > 1.0000000)
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
        else
        {
            super.Fire(f);
        }
        //return;        
    }
Begin:

    Sleep(3.0000000);
    // End:0x47
    if(((ViewTarget == none) || ViewTarget == self) || VSize(ViewTarget.Velocity) < 1.0000000)
    {
        Sleep(1.0000000);        
    }
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
    LastKickWarningTime=-1000.0000000
    fAttackedCamera3DZoomRatioS=1.0000000
    fAttackedWeapon3DZoomRatioS=0.3000000
    fAttacked3DZoomSpeed=3500.0000000
    fAttacked3DZoomDecayAcc=650.0000000
    wAttackedStayingTime=0.0100000
    wAttackedSpeed=11000.0000000
    wAttackedDecayAcc=2250.0000000
    wAttackedAimRatio=0.3500000
    wAttackedCameraRatioF=1.0000000
    wAttackedCameraRatioS=1.7000000
    wApplyFront=(X=-400.0000000,Y=0.0000000,Z=0.0000000)
    wApplyBack=(X=400.0000000,Y=0.0000000,Z=0.0000000)
    wApplyRight=(X=0.0000000,Y=-300.0000000,Z=0.0000000)
    wApplyLeft=(X=0.0000000,Y=300.0000000,Z=0.0000000)
    PlayerChatType="UnrealGame.UnrealPlayerChatManager"
    FovAngle=85.0000000
    PlayerReplicationInfoClass=Class'UnrealGame_Decompressed.TeamPlayerReplicationInfo'
}