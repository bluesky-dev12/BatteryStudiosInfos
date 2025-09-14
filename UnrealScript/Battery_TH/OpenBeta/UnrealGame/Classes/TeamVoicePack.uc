class TeamVoicePack extends VoicePack
    abstract
    config
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

const MAXACK = 16;
const MAXFIRE = 16;
const MAXTAUNT = 48;
const MAXORDER = 16;
const MAXOTHER = 48;
const MAXPHRASE = 8;

enum EVoiceGender
{
    VG_None,                        // 0
    VG_Male,                        // 1
    VG_Female                       // 2
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
    // End:0x0E
    if(P == none)
    {
        return "";
    }
    // End:0x5E
    if((int(Level.NetMode) == int(NM_Standalone)) && P.TeamID == 0)
    {
        return LeaderSign[P.Team.TeamIndex];        
    }
    else
    {
        return P.PlayerName;
    }
    //return;    
}

static function bool PlayDeathPhrase(Pawn P)
{
    local int pdNum, tryCount;
    local bool foundPhrase;

    // End:0x0D
    if(default.NumDeathPhrases == 0)
    {
        return false;
    }
    tryCount = 0;
    J0x14:

    // End:0x78 [Loop If]
    if(!foundPhrase && tryCount < 100)
    {
        pdNum = Rand(default.NumDeathPhrases);
        // End:0x66
        if(!P.IsHumanControlled() && int(default.HumanOnlyDeathPhrase[pdNum]) == 1)
        {
            // [Explicit Continue]
            goto J0x6E;
        }
        foundPhrase = true;
        J0x6E:

        tryCount++;
        // [Loop Continue]
        goto J0x14;
    }
    // End:0xB9
    if(!foundPhrase)
    {
        Log("PlayDeathPhrase: Could Not Find Suitable Phrase.");
        return false;
    }
    P.PlaySound(default.DeathPhrases[pdNum], 2, 2.5000000 * P.TransientSoundVolume, true, 500.0000000);
    return true;
    //return;    
}

static function int PickCustomTauntFor(Controller C, bool bNoMature, bool bNoHumanOnly, int Start)
{
    local int Result, tryCount;

    bNoMature = bNoMature || Class'Engine.PlayerController'.default.bNoMatureLanguage;
    // End:0x3A
    if(Start >= (default.numTaunts - 1))
    {
        Start = 0;
    }
    tryCount = 0;
    J0x41:

    // End:0xF8 [Loop If]
    if(tryCount < 8)
    {
        Result = Start + Rand(default.numTaunts - Start);
        // End:0x82
        if(C.DontReuseTaunt(Result))
        {
            // [Explicit Continue]
            goto J0xEE;
        }
        // End:0xA3
        if(bNoMature && int(default.MatureTaunt[Result]) == 1)
        {
            // [Explicit Continue]
            goto J0xEE;
        }
        // End:0xC4
        if(bNoHumanOnly && int(default.HumanOnlyTaunt[Result]) == 1)
        {
            // [Explicit Continue]
            goto J0xEE;
        }
        // End:0xE8
        if((int(default.MatureTaunt[Result]) == 1) && FRand() < 0.5000000)
        {
            // [Explicit Continue]
            goto J0xEE;
        }
        return Result;
        J0xEE:

        tryCount++;
        // [Loop Continue]
        goto J0x41;
    }
    // End:0x11B
    if(bNoMature && int(default.MatureTaunt[Result]) == 1)
    {
        return Rand(3);
    }
    return Result;
    //return;    
}

static function int PickRandomTauntFor(Controller C, bool bNoMature, bool bNoHumanOnly)
{
    return PickCustomTauntFor(C, bNoMature, bNoHumanOnly, 0);
    //return;    
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
        if(int(messageIndex) == 255)
        {
            SetTimer(0.3000000, false);
        }        
    }
    else
    {
        SetTimer(0.1000000, false);
        // End:0x85
        if(MessageType == 'FRIENDLYFIRE')
        {
            SetFFireMessage(Rand(numFFires), Recipient, MessageSound);            
        }
        else
        {
            // End:0xBF
            if((MessageType == 'AutoTaunt') || MessageType == 'TAUNT')
            {
                SetTauntMessage(int(messageIndex), Recipient, MessageSound);                
            }
            else
            {
                // End:0xE8
                if(MessageType == 'Order')
                {
                    SetOrderMessage(int(messageIndex), Recipient, MessageSound);                    
                }
                else
                {
                    SetOtherMessage(int(messageIndex), Recipient, MessageSound);
                }
            }
        }
        Phrase[0] = MessageSound;
        PhraseString[0] = MessageString;
        DisplayMessage[0] = DisplayString;
    }
    //return;    
}

static function int OrderToIndex(int Order, Class<GameInfo> GameClass)
{
    return GameClass.static.OrderToIndex(Order);
    //return;    
}

function ClientInitialize(PlayerReplicationInfo Sender, PlayerReplicationInfo Recipient, name MessageType, byte messageIndex)
{
    local Sound MessageSound;

    DelayedSender = Sender;
    DisplayString = 0;
    bDisplayPortrait = false;
    bDisplayNextMessage = (bShowMessageText && MessageType != 'TAUNT') && MessageType != 'AutoTaunt';
    // End:0x8E
    if((PlayerController(Owner).PlayerReplicationInfo == Recipient) || MessageType == 'Other')
    {
        PortraitPRI = Sender;
        bDisplayPortrait = true;        
    }
    else
    {
        // End:0xC0
        if((Recipient == none) && MessageType == 'Order')
        {
            PortraitPRI = Sender;
            bDisplayPortrait = true;            
        }
        else
        {
            // End:0x111
            if(((PlayerController(Owner).PlayerReplicationInfo != Sender) && (MessageType == 'Order') || MessageType == 'ACK') && Recipient != none)
            {
                Destroy();
                return;
            }
        }
    }
    // End:0x192
    if((PlayerController(Owner).bNoVoiceMessages || PlayerController(Owner).bNoVoiceTaunts && (MessageType == 'TAUNT') || MessageType == 'AutoTaunt') || PlayerController(Owner).bNoAutoTaunts && MessageType == 'AutoTaunt')
    {
        Destroy();
        return;
    }
    // End:0x1C0
    if(Sender.bBot)
    {
        BotInitialize(Sender, Recipient, MessageType, messageIndex);
        return;
    }
    SetTimer(0.6000000, false);
    // End:0x1F2
    if(MessageType == 'ACK')
    {
        SetClientAckMessage(int(messageIndex), Recipient, MessageSound);        
    }
    else
    {
        // End:0x21B
        if(MessageType == 'FRIENDLYFIRE')
        {
            SetClientFFireMessage(int(messageIndex), Recipient, MessageSound);            
        }
        else
        {
            // End:0x244
            if(MessageType == 'TAUNT')
            {
                SetClientTauntMessage(int(messageIndex), Recipient, MessageSound);                
            }
            else
            {
                // End:0x276
                if(MessageType == 'AutoTaunt')
                {
                    SetClientTauntMessage(int(messageIndex), Recipient, MessageSound);
                    SetTimer(1.0000000, false);                    
                }
                else
                {
                    // End:0x29F
                    if(MessageType == 'Order')
                    {
                        SetClientOrderMessage(int(messageIndex), Recipient, MessageSound);                        
                    }
                    else
                    {
                        // End:0x2C8
                        if(MessageType == 'Hidden')
                        {
                            SetClientHiddenMessage(int(messageIndex), Recipient, MessageSound);                            
                        }
                        else
                        {
                            SetClientOtherMessage(int(messageIndex), Recipient, MessageSound);
                        }
                    }
                }
            }
        }
    }
    Phrase[0] = MessageSound;
    PhraseString[0] = MessageString;
    DisplayMessage[0] = DisplayString;
    // End:0x32E
    if(PlayerController(Owner).PlayerReplicationInfo == Sender)
    {
        bForceMessageSound = true;        
    }
    else
    {
        // End:0x375
        if(((PlayerController(Owner).PlayerReplicationInfo == Recipient) && MessageType != 'TAUNT') && MessageType != 'AutoTaunt')
        {
            bForceMessageSound = true;
        }
    }
    //return;    
}

function SetClientAckMessage(int messageIndex, PlayerReplicationInfo Recipient, out Sound MessageSound)
{
    messageIndex = Clamp(messageIndex, 0, numAcks - 1);
    MessageSound = AckSound[messageIndex];
    MessageString = AckString[messageIndex];
    // End:0xBB
    if((((Recipient != none) && int(Level.NetMode) == int(NM_Standalone)) && Recipient.TeamID == 0) && PlayerController(Owner).GameReplicationInfo.bTeamGame)
    {
        Phrase[1] = NameSound[Recipient.Team.TeamIndex];
    }
    MessageAnim = AckAnim[messageIndex];
    //return;    
}

function SetAckMessage(int messageIndex, PlayerReplicationInfo Recipient, out Sound MessageSound)
{
    SetTimer(3.0000000 + FRand(), false);
    Phrase[0] = AckSound[messageIndex];
    PhraseString[0] = AckString[messageIndex];
    // End:0xD7
    if(((int(Level.NetMode) == int(NM_Standalone)) && Recipient.TeamID == 0) && PlayerController(Owner).GameReplicationInfo.bTeamGame)
    {
        Phrase[1] = NameSound[Recipient.Team.TeamIndex];
        PhraseString[0] = PhraseString[0] @ LeaderSign[Recipient.Team.TeamIndex];
    }
    MessageAnim = AckAnim[messageIndex];
    //return;    
}

function SetClientFFireMessage(int messageIndex, PlayerReplicationInfo Recipient, out Sound MessageSound)
{
    messageIndex = Clamp(messageIndex, 0, numFFires - 1);
    MessageSound = FFireSound[messageIndex];
    MessageString = FFireString[messageIndex];
    MessageAnim = FFireAnim[messageIndex];
    //return;    
}

function SetFFireMessage(int messageIndex, PlayerReplicationInfo Recipient, out Sound MessageSound)
{
    MessageSound = FFireSound[messageIndex];
    MessageString = FFireString[messageIndex];
    MessageAnim = FFireAnim[messageIndex];
    //return;    
}

function SetClientTauntMessage(int messageIndex, PlayerReplicationInfo Recipient, out Sound MessageSound)
{
    messageIndex = Clamp(messageIndex, 0, numTaunts - 1);
    // End:0x5A
    if((int(MatureTaunt[messageIndex]) == 1) && PlayerController(Owner).bNoMatureLanguage)
    {
        messageIndex = PickRandomTauntFor(PlayerController(Owner), true, false);
    }
    MessageSound = TauntSound[messageIndex];
    MessageString = TauntString[messageIndex];
    MessageAnim = TauntAnim[messageIndex];
    //return;    
}

function SetTauntMessage(int messageIndex, PlayerReplicationInfo Recipient, out Sound MessageSound)
{
    messageIndex = Clamp(messageIndex, 0, numTaunts - 1);
    // End:0x5A
    if((int(MatureTaunt[messageIndex]) == 1) && PlayerController(Owner).bNoMatureLanguage)
    {
        messageIndex = PickRandomTauntFor(PlayerController(Owner), true, true);
    }
    MessageSound = TauntSound[messageIndex];
    MessageString = TauntString[messageIndex];
    MessageAnim = TauntAnim[messageIndex];
    SetTimer(1.0000000, false);
    //return;    
}

function SetClientOrderMessage(int messageIndex, PlayerReplicationInfo Recipient, out Sound MessageSound)
{
    MessageSound = OrderSound[messageIndex];
    MessageString = OrderString[messageIndex];
    MessageAnim = OrderAnim[messageIndex];
    //return;    
}

function SetClientHiddenMessage(int messageIndex, PlayerReplicationInfo Recipient, out Sound MessageSound)
{
    messageIndex = Clamp(messageIndex, 0, HiddenPhrases.Length - 1);
    MessageSound = HiddenPhrases[messageIndex];
    MessageString = HiddenString[messageIndex];
    MessageAnim = 'None';
    //return;    
}

function SetOrderMessage(int messageIndex, PlayerReplicationInfo Recipient, out Sound MessageSound)
{
    messageIndex = OrderToIndex(messageIndex, Level.Game.Class);
    MessageSound = OrderSound[messageIndex];
    MessageString = OrderString[messageIndex];
    MessageAnim = OrderAnim[messageIndex];
    //return;    
}

static function string GetOrderString(int i, Class<GameInfo> GameClass)
{
    // End:0x0F
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
    //return;    
}

function SetClientOtherMessage(int messageIndex, PlayerReplicationInfo Recipient, out Sound MessageSound)
{
    MessageSound = OtherSound[messageIndex];
    MessageString = OtherString[messageIndex];
    DisplayString = DisplayOtherMessage[messageIndex];
    MessageAnim = OtherAnim[messageIndex];
    //return;    
}

function SetOtherMessage(int messageIndex, PlayerReplicationInfo Recipient, out Sound MessageSound)
{
    // End:0x27
    if(int(OtherDelayed[messageIndex]) != 0)
    {
        SetTimer(2.5000000 + (0.5000000 * FRand()), false);
    }
    MessageSound = OtherSound[messageIndex];
    MessageString = OtherString[messageIndex];
    DisplayString = DisplayOtherMessage[messageIndex];
    MessageAnim = OtherAnim[messageIndex];
    //return;    
}

static function string ClientParseChatPercVar(PlayerReplicationInfo PRI, string Cmd)
{
    // End:0x28
    if(Cmd ~= "%L")
    {
        return ("(" $ PRI.GetLocationName()) $ ")";
    }
    //return;    
}

static function string ClientParseMessageString(PlayerReplicationInfo PRI, string Message)
{
    local string OutMsg, Cmd;
    local int pos, i;

    OutMsg = "";
    pos = InStr(Message, "%");
    J0x18:

    // End:0xE5 [Loop If]
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
        // End:0xAD
        if((i - 2) > 0)
        {
            Message = Right(Message, i - 2);            
        }
        else
        {
            Message = "";
        }
        OutMsg = OutMsg $ (ClientParseChatPercVar(PRI, Cmd));
        pos = InStr(Message, "%");
        // [Loop Continue]
        goto J0x18;
    }
    // End:0x103
    if(Message != "")
    {
        OutMsg = OutMsg $ Message;
    }
    return OutMsg;
    //return;    
}

function Timer()
{
    local PlayerController PlayerOwner;
    local string Mesg;

    PlayerOwner = PlayerController(Owner);
    // End:0x55
    if((bDisplayPortrait && PhraseNum == 0) && PortraitPRI != none)
    {
        PlayerController(Owner).myHUD.DisplayPortrait(PortraitPRI);
    }
    // End:0xCC
    if((Phrase[PhraseNum] != none) && bDisplayNextMessage || int(DisplayMessage[PhraseNum]) != 0)
    {
        Mesg = ClientParseMessageString(DelayedSender, PhraseString[PhraseNum]);
        // End:0xCC
        if(Mesg != "")
        {
            PlayerOwner.TeamMessage(DelayedSender, Mesg, 'TeamSayQuiet');
        }
    }
    // End:0x216
    if((Phrase[PhraseNum] != none) && (((Level.TimeSeconds - PlayerOwner.LastPlaySpeech) > float(2)) || PhraseNum > 0) || bForceMessageSound)
    {
        PlayerOwner.LastPlaySpeech = Level.TimeSeconds;
        // End:0x188
        if(PlayerOwner.ViewTarget != none)
        {
            PlayerOwner.ViewTarget.PlaySound(Phrase[PhraseNum], 6, 1.5000000 * TransientSoundVolume,,, Pitch, false);            
        }
        else
        {
            PlayerOwner.PlaySound(Phrase[PhraseNum], 6, 1.5000000 * TransientSoundVolume,,, Pitch, false);
        }
        // End:0x1DD
        if(MessageAnim != 'None')
        {
            UnrealPlayer(PlayerOwner).TAUNT(MessageAnim);
        }
        // End:0x1F7
        if(Phrase[PhraseNum + 1] == none)
        {
            Destroy();            
        }
        else
        {
            SetTimer(GetSoundDuration(Phrase[PhraseNum]), false);
            PhraseNum++;
        }        
    }
    else
    {
        Destroy();
    }
    //return;    
}

static function PlayerSpeech(name Type, int Index, string Callsign, Actor PackOwner)
{
    local name SendMode;
    local PlayerReplicationInfo Recipient;
    local int i;
    local GameReplicationInfo GRI;

    switch(Type)
    {
        // End:0x0F
        case 'ACK':
        // End:0x17
        case 'FRIENDLYFIRE':
        // End:0x34
        case 'Other':
            SendMode = 'Team';
            Recipient = none;
            // End:0x1C0
            break;
        // End:0x186
        case 'Order':
            SendMode = 'Team';
            Index = OrderToIndex(Index, PackOwner.Level.Game.Class);
            GRI = PlayerController(PackOwner).GameReplicationInfo;
            // End:0x183
            if(GRI.bTeamGame)
            {
                // End:0xB9
                if(Callsign == "")
                {
                    Recipient = none;                    
                }
                else
                {
                    i = 0;
                    J0xC0:

                    // End:0x183 [Loop If]
                    if(i < GRI.PRIArray.Length)
                    {
                        // End:0x179
                        if(((GRI.PRIArray[i] != none) && GRI.PRIArray[i].PlayerName == Callsign) && GRI.PRIArray[i].Team == PlayerController(PackOwner).PlayerReplicationInfo.Team)
                        {
                            Recipient = GRI.PRIArray[i];
                            // [Explicit Break]
                            goto J0x183;
                        }
                        i++;
                        // [Loop Continue]
                        goto J0xC0;
                    }
                }
            }
            J0x183:

            // End:0x1C0
            break;
        // End:0x18E
        case 'TAUNT':
        // End:0x1AB
        case 'Hidden':
            SendMode = 'Global';
            Recipient = none;
            // End:0x1C0
            break;
        // End:0xFFFF
        default:
            SendMode = 'Global';
            Recipient = none;
            break;
    }
    // End:0x1ED
    if(!PlayerController(PackOwner).GameReplicationInfo.bTeamGame)
    {
        SendMode = 'Global';
    }
    Controller(PackOwner).SendVoiceMessage(Controller(PackOwner).PlayerReplicationInfo, Recipient, Type, byte(Index), SendMode);
    //return;    
}

static function string GetAckString(int i)
{
    // End:0x1E
    if(default.AckAbbrev[i] != "")
    {
        return default.AckAbbrev[i];
    }
    return default.AckString[i];
    //return;    
}

static function string GetFFireString(int i)
{
    // End:0x1E
    if(default.FFireAbbrev[i] != "")
    {
        return default.FFireAbbrev[i];
    }
    return default.FFireString[i];
    //return;    
}

static function string GetTauntString(int i)
{
    // End:0x1E
    if(default.TauntAbbrev[i] != "")
    {
        return default.TauntAbbrev[i];
    }
    return default.TauntString[i];
    //return;    
}

static function string GetOtherString(int i)
{
    // End:0x1E
    if(default.OtherAbbrev[i] != "")
    {
        return default.OtherAbbrev[i];
    }
    return default.OtherString[i];
    //return;    
}

static function GetAllAcks(out array<string> AckArray)
{
    local int i;

    AckArray.Length = 0;
    i = 0;
    J0x0F:

    // End:0x82 [Loop If]
    if(i < 16)
    {
        // End:0x48
        if(default.AckAbbrev[i] != "")
        {
            AckArray[AckArray.Length] = default.AckAbbrev[i];
            // [Explicit Continue]
            goto J0x78;
        }
        // End:0x75
        if(default.AckString[i] != "")
        {
            AckArray[AckArray.Length] = default.AckString[i];
            // [Explicit Continue]
            goto J0x78;
        }
        // [Explicit Break]
        goto J0x82;
        J0x78:

        i++;
        // [Loop Continue]
        goto J0x0F;
    }
    J0x82:

    //return;    
}

static function GetAllFFire(out array<string> FFireArray)
{
    local int i;

    FFireArray.Length = 0;
    i = 0;
    J0x0F:

    // End:0x82 [Loop If]
    if(i < 16)
    {
        // End:0x48
        if(default.FFireAbbrev[i] != "")
        {
            FFireArray[FFireArray.Length] = default.FFireAbbrev[i];
            // [Explicit Continue]
            goto J0x78;
        }
        // End:0x75
        if(default.FFireString[i] != "")
        {
            FFireArray[FFireArray.Length] = default.FFireString[i];
            // [Explicit Continue]
            goto J0x78;
        }
        // [Explicit Break]
        goto J0x82;
        J0x78:

        i++;
        // [Loop Continue]
        goto J0x0F;
    }
    J0x82:

    //return;    
}

static function GetAllOrder(out array<string> OrderArray)
{
    local int i;

    OrderArray.Length = 0;
    i = 0;
    J0x0F:

    // End:0x82 [Loop If]
    if(i < 16)
    {
        // End:0x48
        if(default.OrderAbbrev[i] != "")
        {
            OrderArray[OrderArray.Length] = default.OrderAbbrev[i];
            // [Explicit Continue]
            goto J0x78;
        }
        // End:0x75
        if(default.OrderString[i] != "")
        {
            OrderArray[OrderArray.Length] = default.OrderString[i];
            // [Explicit Continue]
            goto J0x78;
        }
        // [Explicit Break]
        goto J0x82;
        J0x78:

        i++;
        // [Loop Continue]
        goto J0x0F;
    }
    J0x82:

    //return;    
}

static function GetAllTaunt(out array<string> TauntArray, optional bool bNoMature)
{
    local int i;

    TauntArray.Length = 0;
    i = 0;
    J0x0F:

    // End:0xA3 [Loop If]
    if(i < 48)
    {
        // End:0x3C
        if(bNoMature && int(default.MatureTaunt[i]) > 0)
        {
            // [Explicit Continue]
            goto J0x99;
        }
        // End:0x69
        if(default.TauntAbbrev[i] != "")
        {
            TauntArray[TauntArray.Length] = default.TauntAbbrev[i];
            // [Explicit Continue]
            goto J0x99;
        }
        // End:0x96
        if(default.TauntString[i] != "")
        {
            TauntArray[TauntArray.Length] = default.TauntString[i];
            // [Explicit Continue]
            goto J0x99;
        }
        // [Explicit Break]
        goto J0xA3;
        J0x99:

        i++;
        // [Loop Continue]
        goto J0x0F;
    }
    J0xA3:

    //return;    
}

static function GetAllOther(out array<string> OtherArray)
{
    local int i;

    OtherArray.Length = 0;
    i = 0;
    J0x0F:

    // End:0x82 [Loop If]
    if(i < 48)
    {
        // End:0x48
        if(default.OtherAbbrev[i] != "")
        {
            OtherArray[OtherArray.Length] = default.OtherAbbrev[i];
            // [Explicit Continue]
            goto J0x78;
        }
        // End:0x75
        if(default.OtherString[i] != "")
        {
            OtherArray[OtherArray.Length] = default.OtherString[i];
            // [Explicit Continue]
            goto J0x78;
        }
        // [Explicit Break]
        goto J0x82;
        J0x78:

        i++;
        // [Loop Continue]
        goto J0x0F;
    }
    J0x82:

    //return;    
}

static final simulated function bool VoiceMatchesGender(TeamVoicePack.EVoiceGender GenderType, string PlayerGender)
{
    // End:0x12
    if(int(GenderType) == int(0))
    {
        return true;
    }
    // End:0x36
    if((int(GenderType) == int(1)) && PlayerGender ~= "Male")
    {
        return true;
    }
    // End:0x5C
    if((int(GenderType) == int(2)) && PlayerGender ~= "Female")
    {
        return true;
    }
    return false;
    //return;    
}

defaultproperties
{
    bShowMessageText=true
    Pitch=1.0000000
    LeaderSign[0]="Red Leader"
    LeaderSign[1]="Blue Leader"
    LeaderSign[2]="Green Leader"
    LeaderSign[3]="Gold Leader"
    CommaText=", "
}