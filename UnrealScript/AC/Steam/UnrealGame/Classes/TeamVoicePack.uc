/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\TeamVoicePack.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Constants:6
 *	Enums:1
 *	Properties:50
 *	Functions:33
 *
 *******************************************************************************/
class TeamVoicePack extends VoicePack
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    config()
    abstract;

const MAXACK = 16;
const MAXFIRE = 16;
const MAXTAUNT = 48;
const MAXORDER = 16;
const MAXOTHER = 48;
const MAXPHRASE = 8;

enum EVoiceGender
{
    VG_None,
    VG_Male,
    VG_Female
};

var() Sound NameSound[4];
var() Sound AckSound[16];
var() localized string AckString[16];
var() localized string AckAbbrev[16];
var() name AckAnim[16];
var() int numAcks;
var() Sound FFireSound[16];
var() localized string FFireString[16];
var() localized string FFireAbbrev[16];
var() name FFireAnim[16];
var() int numFFires;
var() Sound TauntSound[48];
var() localized string TauntString[48];
var() localized string TauntAbbrev[48];
var() name TauntAnim[48];
var() int numTaunts;
var config bool bShowMessageText;
var() byte MatureTaunt[48];
var() byte HumanOnlyTaunt[48];
var float Pitch;
var string MessageString;
var name MessageAnim;
var byte DisplayString;
var string LeaderSign[4];
var() Sound OrderSound[16];
var() localized string OrderString[16];
var() localized string OrderAbbrev[16];
var() name OrderAnim[16];
var string CommaText;
var() Sound OtherSound[48];
var() localized string OtherString[48];
var() localized string OtherAbbrev[48];
var() name OtherAnim[48];
var() byte OtherDelayed[48];
var() byte DisplayOtherMessage[48];
var() name OtherMesgGroup[48];
var Sound Phrase[8];
var string PhraseString[8];
var int PhraseNum;
var() byte DisplayMessage[8];
var PlayerReplicationInfo DelayedSender;
var Sound DeathPhrases[8];
var byte HumanOnlyDeathPhrase[8];
var int NumDeathPhrases;
var array<Sound> HiddenPhrases;
var array<string> HiddenString;
var bool bForceMessageSound;
var bool bDisplayNextMessage;
var bool bDisplayPortrait;
var PlayerReplicationInfo PortraitPRI;

function string GetCallSign(PlayerReplicationInfo P)
{
    // End:0x0e
    if(P == none)
    {
        return "";
    }
    // End:0x5e
    if(Level.NetMode == 0 && P.TeamID == 0)
    {
        return LeaderSign[P.Team.TeamIndex];
    }
    // End:0x6d
    else
    {
        return P.PlayerName;
    }
}

static function bool PlayDeathPhrase(Pawn P)
{
    local int pdNum, tryCount;
    local bool foundPhrase;

    // End:0x0d
    if(default.NumDeathPhrases == 0)
    {
        return false;
    }
    tryCount = 0;
    J0x14:
    // End:0x78 [While If]
    if(!foundPhrase && tryCount < 100)
    {
        pdNum = Rand(default.NumDeathPhrases);
        // End:0x66
        if(!P.IsHumanControlled() && default.HumanOnlyDeathPhrase[pdNum] == 1)
        {
        }
        // End:0x6e
        else
        {
            foundPhrase = true;
        }
        ++ tryCount;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
    // End:0xb9
    if(!foundPhrase)
    {
        Log("PlayDeathPhrase: Could Not Find Suitable Phrase.");
        return false;
    }
    P.PlaySound(default.DeathPhrases[pdNum], 2, 2.50 * P.TransientSoundVolume, true, 500.0);
    return true;
}

static function int PickCustomTauntFor(Controller C, bool bNoMature, bool bNoHumanOnly, int Start)
{
    local int Result, tryCount;

    bNoMature = bNoMature || class'PlayerController'.default.bNoMatureLanguage;
    // End:0x3a
    if(Start >= default.numTaunts - 1)
    {
        Start = 0;
    }
    tryCount = 0;
    J0x41:
    // End:0xf8 [While If]
    if(tryCount < 8)
    {
        Result = Start + Rand(default.numTaunts - Start);
        // End:0x82
        if(C.DontReuseTaunt(Result))
        {
        }
        // End:0xee
        else
        {
            // End:0xa3
            if(bNoMature && default.MatureTaunt[Result] == 1)
            {
            }
            // End:0xee
            else
            {
                // End:0xc4
                if(bNoHumanOnly && default.HumanOnlyTaunt[Result] == 1)
                {
                }
                // End:0xee
                else
                {
                    // End:0xe8
                    if(default.MatureTaunt[Result] == 1 && FRand() < 0.50)
                    {
                    }
                    // End:0xee
                    else
                    {
                        return Result;
                    }
                }
            }
        }
        ++ tryCount;
        // This is an implied JumpToken; Continue!
        goto J0x41;
    }
    // End:0x11b
    if(bNoMature && default.MatureTaunt[Result] == 1)
    {
        return Rand(3);
    }
    return Result;
}

static function int PickRandomTauntFor(Controller C, bool bNoMature, bool bNoHumanOnly)
{
    return PickCustomTauntFor(C, bNoMature, bNoHumanOnly, 0);
}

function BotInitialize(PlayerReplicationInfo Sender, PlayerReplicationInfo Recipient, name MessageType, byte messageIndex)
{
    local Sound MessageSound;

    DelayedSender = Sender;
    DisplayString = 0;
    // End:0x53
    if(MessageType == 'ACK')
    {
        SetAckMessage(Rand(numAcks), Recipient, MessageSound);
        // End:0x50
        if(messageIndex == 255)
        {
            SetTimer(0.30, false);
        }
    }
    // End:0x126
    else
    {
        SetTimer(0.10, false);
        // End:0x85
        if(MessageType == 'FRIENDLYFIRE')
        {
            SetFFireMessage(Rand(numFFires), Recipient, MessageSound);
        }
        // End:0xff
        else
        {
            // End:0xbf
            if(MessageType == 'AutoTaunt' || MessageType == 'TAUNT')
            {
                SetTauntMessage(messageIndex, Recipient, MessageSound);
            }
            // End:0xff
            else
            {
                // End:0xe8
                if(MessageType == 'Order')
                {
                    SetOrderMessage(messageIndex, Recipient, MessageSound);
                }
                // End:0xff
                else
                {
                    SetOtherMessage(messageIndex, Recipient, MessageSound);
                }
            }
        }
        Phrase[0] = MessageSound;
        PhraseString[0] = MessageString;
        DisplayMessage[0] = DisplayString;
    }
}

static function int OrderToIndex(int Order, class<GameInfo> GameClass)
{
    return GameClass.static.OrderToIndex(Order);
}

function ClientInitialize(PlayerReplicationInfo Sender, PlayerReplicationInfo Recipient, name MessageType, byte messageIndex)
{
    local Sound MessageSound;

    DelayedSender = Sender;
    DisplayString = 0;
    bDisplayPortrait = false;
    bDisplayNextMessage = bShowMessageText && MessageType != 'TAUNT' && MessageType != 'AutoTaunt';
    // End:0x8e
    if(PlayerController(Owner).PlayerReplicationInfo == Recipient || MessageType == 'Other')
    {
        PortraitPRI = Sender;
        bDisplayPortrait = true;
    }
    // End:0x111
    else
    {
        // End:0xc0
        if(Recipient == none && MessageType == 'Order')
        {
            PortraitPRI = Sender;
            bDisplayPortrait = true;
        }
        // End:0x111
        else
        {
            // End:0x111
            if(PlayerController(Owner).PlayerReplicationInfo != Sender && MessageType == 'Order' || MessageType == 'ACK' && Recipient != none)
            {
                Destroy();
                return;
            }
        }
    }
    // End:0x192
    if(PlayerController(Owner).bNoVoiceMessages || PlayerController(Owner).bNoVoiceTaunts && MessageType == 'TAUNT' || MessageType == 'AutoTaunt' || PlayerController(Owner).bNoAutoTaunts && MessageType == 'AutoTaunt')
    {
        Destroy();
        return;
    }
    // End:0x1c0
    if(Sender.bBot)
    {
        BotInitialize(Sender, Recipient, MessageType, messageIndex);
        return;
    }
    SetTimer(0.60, false);
    // End:0x1f2
    if(MessageType == 'ACK')
    {
        SetClientAckMessage(messageIndex, Recipient, MessageSound);
    }
    // End:0x2df
    else
    {
        // End:0x21b
        if(MessageType == 'FRIENDLYFIRE')
        {
            SetClientFFireMessage(messageIndex, Recipient, MessageSound);
        }
        // End:0x2df
        else
        {
            // End:0x244
            if(MessageType == 'TAUNT')
            {
                SetClientTauntMessage(messageIndex, Recipient, MessageSound);
            }
            // End:0x2df
            else
            {
                // End:0x276
                if(MessageType == 'AutoTaunt')
                {
                    SetClientTauntMessage(messageIndex, Recipient, MessageSound);
                    SetTimer(1.0, false);
                }
                // End:0x2df
                else
                {
                    // End:0x29f
                    if(MessageType == 'Order')
                    {
                        SetClientOrderMessage(messageIndex, Recipient, MessageSound);
                    }
                    // End:0x2df
                    else
                    {
                        // End:0x2c8
                        if(MessageType == 'Hidden')
                        {
                            SetClientHiddenMessage(messageIndex, Recipient, MessageSound);
                        }
                        // End:0x2df
                        else
                        {
                            SetClientOtherMessage(messageIndex, Recipient, MessageSound);
                        }
                    }
                }
            }
        }
    }
    Phrase[0] = MessageSound;
    PhraseString[0] = MessageString;
    DisplayMessage[0] = DisplayString;
    // End:0x32e
    if(PlayerController(Owner).PlayerReplicationInfo == Sender)
    {
        bForceMessageSound = true;
    }
    // End:0x375
    else
    {
        // End:0x375
        if(PlayerController(Owner).PlayerReplicationInfo == Recipient && MessageType != 'TAUNT' && MessageType != 'AutoTaunt')
        {
            bForceMessageSound = true;
        }
    }
}

function SetClientAckMessage(int messageIndex, PlayerReplicationInfo Recipient, out Sound MessageSound)
{
    messageIndex = Clamp(messageIndex, 0, numAcks - 1);
    MessageSound = AckSound[messageIndex];
    MessageString = AckString[messageIndex];
    // End:0xbb
    if(Recipient != none && Level.NetMode == 0 && Recipient.TeamID == 0 && PlayerController(Owner).GameReplicationInfo.bTeamGame)
    {
        Phrase[1] = NameSound[Recipient.Team.TeamIndex];
    }
    MessageAnim = AckAnim[messageIndex];
}

function SetAckMessage(int messageIndex, PlayerReplicationInfo Recipient, out Sound MessageSound)
{
    SetTimer(3.0 + FRand(), false);
    Phrase[0] = AckSound[messageIndex];
    PhraseString[0] = AckString[messageIndex];
    // End:0xd7
    if(Level.NetMode == 0 && Recipient.TeamID == 0 && PlayerController(Owner).GameReplicationInfo.bTeamGame)
    {
        Phrase[1] = NameSound[Recipient.Team.TeamIndex];
        PhraseString[0] = PhraseString[0] @ LeaderSign[Recipient.Team.TeamIndex];
    }
    MessageAnim = AckAnim[messageIndex];
}

function SetClientFFireMessage(int messageIndex, PlayerReplicationInfo Recipient, out Sound MessageSound)
{
    messageIndex = Clamp(messageIndex, 0, numFFires - 1);
    MessageSound = FFireSound[messageIndex];
    MessageString = FFireString[messageIndex];
    MessageAnim = FFireAnim[messageIndex];
}

function SetFFireMessage(int messageIndex, PlayerReplicationInfo Recipient, out Sound MessageSound)
{
    MessageSound = FFireSound[messageIndex];
    MessageString = FFireString[messageIndex];
    MessageAnim = FFireAnim[messageIndex];
}

function SetClientTauntMessage(int messageIndex, PlayerReplicationInfo Recipient, out Sound MessageSound)
{
    messageIndex = Clamp(messageIndex, 0, numTaunts - 1);
    // End:0x5a
    if(MatureTaunt[messageIndex] == 1 && PlayerController(Owner).bNoMatureLanguage)
    {
        messageIndex = PickRandomTauntFor(PlayerController(Owner), true, false);
    }
    MessageSound = TauntSound[messageIndex];
    MessageString = TauntString[messageIndex];
    MessageAnim = TauntAnim[messageIndex];
}

function SetTauntMessage(int messageIndex, PlayerReplicationInfo Recipient, out Sound MessageSound)
{
    messageIndex = Clamp(messageIndex, 0, numTaunts - 1);
    // End:0x5a
    if(MatureTaunt[messageIndex] == 1 && PlayerController(Owner).bNoMatureLanguage)
    {
        messageIndex = PickRandomTauntFor(PlayerController(Owner), true, true);
    }
    MessageSound = TauntSound[messageIndex];
    MessageString = TauntString[messageIndex];
    MessageAnim = TauntAnim[messageIndex];
    SetTimer(1.0, false);
}

function SetClientOrderMessage(int messageIndex, PlayerReplicationInfo Recipient, out Sound MessageSound)
{
    MessageSound = OrderSound[messageIndex];
    MessageString = OrderString[messageIndex];
    MessageAnim = OrderAnim[messageIndex];
}

function SetClientHiddenMessage(int messageIndex, PlayerReplicationInfo Recipient, out Sound MessageSound)
{
    messageIndex = Clamp(messageIndex, 0, HiddenPhrases.Length - 1);
    MessageSound = HiddenPhrases[messageIndex];
    MessageString = HiddenString[messageIndex];
    MessageAnim = 'None';
}

function SetOrderMessage(int messageIndex, PlayerReplicationInfo Recipient, out Sound MessageSound)
{
    messageIndex = OrderToIndex(messageIndex, Level.Game.Class);
    MessageSound = OrderSound[messageIndex];
    MessageString = OrderString[messageIndex];
    MessageAnim = OrderAnim[messageIndex];
}

static function string GetOrderString(int i, class<GameInfo> GameClass)
{
    // End:0x0f
    if(i > 9)
    {
        return "";
    }
    i = OrderToIndex(i, GameClass);
    // End:0x43
    if(default.OrderAbbrev[i] != "")
    {
        return default.OrderAbbrev[i];
    }
    return default.OrderString[i];
}

function SetClientOtherMessage(int messageIndex, PlayerReplicationInfo Recipient, out Sound MessageSound)
{
    MessageSound = OtherSound[messageIndex];
    MessageString = OtherString[messageIndex];
    DisplayString = DisplayOtherMessage[messageIndex];
    MessageAnim = OtherAnim[messageIndex];
}

function SetOtherMessage(int messageIndex, PlayerReplicationInfo Recipient, out Sound MessageSound)
{
    // End:0x27
    if(OtherDelayed[messageIndex] != 0)
    {
        SetTimer(2.50 + 0.50 * FRand(), false);
    }
    MessageSound = OtherSound[messageIndex];
    MessageString = OtherString[messageIndex];
    DisplayString = DisplayOtherMessage[messageIndex];
    MessageAnim = OtherAnim[messageIndex];
}

static function string ClientParseChatPercVar(PlayerReplicationInfo PRI, string Cmd)
{
    // End:0x28
    if(Cmd ~= "%L")
    {
        return "(" $ PRI.GetLocationName() $ ")";
    }
}

static function string ClientParseMessageString(PlayerReplicationInfo PRI, string Message)
{
    local string OutMsg, Cmd;
    local int pos, i;

    OutMsg = "";
    pos = InStr(Message, "%");
    J0x18:
    // End:0xe5 [While If]
    if(pos > -1)
    {
        // End:0x64
        if(pos > 0)
        {
            OutMsg = OutMsg $ Left(Message, pos);
            Message = Mid(Message, pos);
            pos = 0;
        }
        i = Len(Message);
        Cmd = Mid(Message, pos, 2);
        // End:0xad
        if(i - 2 > 0)
        {
            Message = Right(Message, i - 2);
        }
        // End:0xb5
        else
        {
            Message = "";
        }
        OutMsg = OutMsg $ ClientParseChatPercVar(PRI, Cmd);
        pos = InStr(Message, "%");
        // This is an implied JumpToken; Continue!
        goto J0x18;
    }
    // End:0x103
    if(Message != "")
    {
        OutMsg = OutMsg $ Message;
    }
    return OutMsg;
}

function Timer()
{
    local PlayerController PlayerOwner;
    local string Mesg;

    PlayerOwner = PlayerController(Owner);
    // End:0x55
    if(bDisplayPortrait && PhraseNum == 0 && PortraitPRI != none)
    {
        PlayerController(Owner).myHUD.DisplayPortrait(PortraitPRI);
    }
    // End:0xcc
    if(Phrase[PhraseNum] != none && bDisplayNextMessage || DisplayMessage[PhraseNum] != 0)
    {
        Mesg = ClientParseMessageString(DelayedSender, PhraseString[PhraseNum]);
        // End:0xcc
        if(Mesg != "")
        {
            PlayerOwner.TeamMessage(DelayedSender, Mesg, 'TeamSayQuiet');
        }
    }
    // End:0x216
    if(Phrase[PhraseNum] != none && Level.TimeSeconds - PlayerOwner.LastPlaySpeech > float(2) || PhraseNum > 0 || bForceMessageSound)
    {
        PlayerOwner.LastPlaySpeech = Level.TimeSeconds;
        // End:0x188
        if(PlayerOwner.ViewTarget != none)
        {
            PlayerOwner.ViewTarget.PlaySound(Phrase[PhraseNum], 6, 1.50 * TransientSoundVolume,,, Pitch, false);
        }
        // End:0x1b5
        else
        {
            PlayerOwner.PlaySound(Phrase[PhraseNum], 6, 1.50 * TransientSoundVolume,,, Pitch, false);
        }
        // End:0x1dd
        if(MessageAnim != 'None')
        {
            UnrealPlayer(PlayerOwner).TAUNT(MessageAnim);
        }
        // End:0x1f7
        if(Phrase[PhraseNum + 1] == none)
        {
            Destroy();
        }
        // End:0x213
        else
        {
            SetTimer(GetSoundDuration(Phrase[PhraseNum]), false);
            ++ PhraseNum;
        }
    }
    // End:0x219
    else
    {
        Destroy();
    }
}

static function PlayerSpeech(name Type, int Index, string Callsign, Actor PackOwner)
{
    local name SendMode;
    local PlayerReplicationInfo Recipient;
    local int i;
    local GameReplicationInfo GRI;

    switch(Type)
    {
        // End:0x0f
        case 'ACK':
        // End:0x17
        case 'FRIENDLYFIRE':
        // End:0x34
        case 'Other':
            SendMode = 'Team';
            Recipient = none;
            // End:0x1c0
            break;
        // End:0x186
        case 'Order':
            SendMode = 'Team';
            Index = OrderToIndex(Index, PackOwner.Level.Game.Class);
            GRI = PlayerController(PackOwner).GameReplicationInfo;
            // End:0x183
            if(GRI.bTeamGame)
            {
                // End:0xb9
                if(Callsign == "")
                {
                    Recipient = none;
                }
                // End:0x183
                else
                {
                    i = 0;
                    J0xc0:
                    // End:0x183 [While If]
                    if(i < GRI.PRIArray.Length)
                    {
                        // End:0x179
                        if(GRI.PRIArray[i] != none && GRI.PRIArray[i].PlayerName == Callsign && GRI.PRIArray[i].Team == PlayerController(PackOwner).PlayerReplicationInfo.Team)
                        {
                            Recipient = GRI.PRIArray[i];
                        }
                        // End:0x183
                        else
                        {
                            ++ i;
                            // This is an implied JumpToken; Continue!
                            goto J0xc0;
                        }
                    }
                }
            }
            // End:0x1c0
            break;
        // End:0x18e
        case 'TAUNT':
        // End:0x1ab
        case 'Hidden':
            SendMode = 'Global';
            Recipient = none;
            // End:0x1c0
            break;
        // End:0xffff
        default:
            SendMode = 'Global';
            Recipient = none;
            // End:0x1ed
            if(!PlayerController(PackOwner).GameReplicationInfo.bTeamGame)
            {
                SendMode = 'Global';
            }
            Controller(PackOwner).SendVoiceMessage(Controller(PackOwner).PlayerReplicationInfo, Recipient, Type, byte(Index), SendMode);
}

static function string GetAckString(int i)
{
    // End:0x1e
    if(default.AckAbbrev[i] != "")
    {
        return default.AckAbbrev[i];
    }
    return default.AckString[i];
}

static function string GetFFireString(int i)
{
    // End:0x1e
    if(default.FFireAbbrev[i] != "")
    {
        return default.FFireAbbrev[i];
    }
    return default.FFireString[i];
}

static function string GetTauntString(int i)
{
    // End:0x1e
    if(default.TauntAbbrev[i] != "")
    {
        return default.TauntAbbrev[i];
    }
    return default.TauntString[i];
}

static function string GetOtherString(int i)
{
    // End:0x1e
    if(default.OtherAbbrev[i] != "")
    {
        return default.OtherAbbrev[i];
    }
    return default.OtherString[i];
}

static function GetAllAcks(out array<string> AckArray)
{
    local int i;

    AckArray.Length = 0;
    i = 0;
    J0x0f:
    // End:0x82 [While If]
    if(i < 16)
    {
        // End:0x48
        if(default.AckAbbrev[i] != "")
        {
            AckArray[AckArray.Length] = default.AckAbbrev[i];
        }
        // End:0x78
        else
        {
            // End:0x75
            if(default.AckString[i] != "")
            {
                AckArray[AckArray.Length] = default.AckString[i];
            }
            // End:0x78
            else
            {
                // This is an implied JumpToken;
                goto J0x82;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0f;
    }
    J0x82:
}

static function GetAllFFire(out array<string> FFireArray)
{
    local int i;

    FFireArray.Length = 0;
    i = 0;
    J0x0f:
    // End:0x82 [While If]
    if(i < 16)
    {
        // End:0x48
        if(default.FFireAbbrev[i] != "")
        {
            FFireArray[FFireArray.Length] = default.FFireAbbrev[i];
        }
        // End:0x78
        else
        {
            // End:0x75
            if(default.FFireString[i] != "")
            {
                FFireArray[FFireArray.Length] = default.FFireString[i];
            }
            // End:0x78
            else
            {
                // This is an implied JumpToken;
                goto J0x82;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0f;
    }
    J0x82:
}

static function GetAllOrder(out array<string> OrderArray)
{
    local int i;

    OrderArray.Length = 0;
    i = 0;
    J0x0f:
    // End:0x82 [While If]
    if(i < 16)
    {
        // End:0x48
        if(default.OrderAbbrev[i] != "")
        {
            OrderArray[OrderArray.Length] = default.OrderAbbrev[i];
        }
        // End:0x78
        else
        {
            // End:0x75
            if(default.OrderString[i] != "")
            {
                OrderArray[OrderArray.Length] = default.OrderString[i];
            }
            // End:0x78
            else
            {
                // This is an implied JumpToken;
                goto J0x82;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0f;
    }
    J0x82:
}

static function GetAllTaunt(out array<string> TauntArray, optional bool bNoMature)
{
    local int i;

    TauntArray.Length = 0;
    i = 0;
    J0x0f:
    // End:0xa3 [While If]
    if(i < 48)
    {
        // End:0x3c
        if(bNoMature && default.MatureTaunt[i] > 0)
        {
        }
        // End:0x99
        else
        {
            // End:0x69
            if(default.TauntAbbrev[i] != "")
            {
                TauntArray[TauntArray.Length] = default.TauntAbbrev[i];
            }
            // End:0x99
            else
            {
                // End:0x96
                if(default.TauntString[i] != "")
                {
                    TauntArray[TauntArray.Length] = default.TauntString[i];
                }
                // End:0x99
                else
                {
                    // This is an implied JumpToken;
                    goto J0xa3;
                }
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0f;
    }
    J0xa3:
}

static function GetAllOther(out array<string> OtherArray)
{
    local int i;

    OtherArray.Length = 0;
    i = 0;
    J0x0f:
    // End:0x82 [While If]
    if(i < 48)
    {
        // End:0x48
        if(default.OtherAbbrev[i] != "")
        {
            OtherArray[OtherArray.Length] = default.OtherAbbrev[i];
        }
        // End:0x78
        else
        {
            // End:0x75
            if(default.OtherString[i] != "")
            {
                OtherArray[OtherArray.Length] = default.OtherString[i];
            }
            // End:0x78
            else
            {
                // This is an implied JumpToken;
                goto J0x82;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0f;
    }
    J0x82:
}

static final simulated function bool VoiceMatchesGender(TeamVoicePack.EVoiceGender GenderType, string PlayerGender)
{
    // End:0x12
    if(GenderType == 0)
    {
        return true;
    }
    // End:0x36
    if(GenderType == 1 && PlayerGender ~= "Male")
    {
        return true;
    }
    // End:0x5c
    if(GenderType == 2 && PlayerGender ~= "Female")
    {
        return true;
    }
    return false;
}

defaultproperties
{
    bShowMessageText=true
    Pitch=1.0
    LeaderSign[0]="Red Leader"
    LeaderSign[1]="Blue Leader"
    LeaderSign[2]="Green Leader"
    LeaderSign[3]="Gold Leader"
    CommaText=", "
}