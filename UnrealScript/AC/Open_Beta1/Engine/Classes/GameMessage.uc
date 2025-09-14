class GameMessage extends LocalMessage
    notplaceable
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var(Message) localized string SwitchLevelMessage;
var(Message) localized string LeftMessage;
var(Message) localized string FailedTeamMessage;
var(Message) localized string FailedPlaceMessage;
var(Message) localized string FailedSpawnMessage;
var(Message) localized string EnteredMessage;
var(Message) localized string MaxedOutMessage;
var(Message) localized string OvertimeMessage;
var(Message) localized string GlobalNameChange;
var(Message) localized string NewTeamMessage;
var(Message) localized string NewTeamMessageTrailer;
var(Message) localized string NoNameChange;
var(Message) localized string VoteStarted;
var(Message) localized string VotePassed;
var(Message) localized string MustHaveStats;
var(Message) localized string CantBeSpectator;
var(Message) localized string CantBePlayer;
var(Message) localized string CantBePlayerWaitNextRound;
var(Message) localized string BecameSpectator;
var localized string NewPlayerMessage;
var localized string KickWarning;
var localized string NewSpecMessage;
var localized string SpecEnteredMessage;

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    switch(Switch)
    {
        // End:0x14
        case 0:
            return default.OvertimeMessage;
            // End:0x200
            break;
        // End:0x42
        case 1:
            // End:0x29
            if(RelatedPRI_1 == none)
            {
                return default.NewPlayerMessage;
            }
            return RelatedPRI_1.PlayerName $ default.EnteredMessage;
            // End:0x200
            break;
        // End:0x7E
        case 2:
            // End:0x55
            if(RelatedPRI_1 == none)
            {
                return "";
            }
            return (RelatedPRI_1.OldName @ default.GlobalNameChange) @ RelatedPRI_1.PlayerName;
            // End:0x200
            break;
        // End:0xD5
        case 3:
            // End:0x91
            if(RelatedPRI_1 == none)
            {
                return "";
            }
            // End:0x9F
            if(OptionalObject == none)
            {
                return "";
            }
            return ((RelatedPRI_1.PlayerName $ default.NewTeamMessage) @ TeamInfo(OptionalObject).GetHumanReadableName()) $ default.NewTeamMessageTrailer;
            // End:0x200
            break;
        // End:0x101
        case 4:
            // End:0xE8
            if(RelatedPRI_1 == none)
            {
                return "";
            }
            return RelatedPRI_1.PlayerName $ default.LeftMessage;
            // End:0x200
            break;
        // End:0x10F
        case 5:
            return default.SwitchLevelMessage;
            // End:0x200
            break;
        // End:0x11D
        case 6:
            return default.FailedTeamMessage;
            // End:0x200
            break;
        // End:0x12B
        case 7:
            return default.MaxedOutMessage;
            // End:0x200
            break;
        // End:0x139
        case 8:
            return default.NoNameChange;
            // End:0x200
            break;
        // End:0x157
        case 9:
            return RelatedPRI_1.PlayerName @ default.VoteStarted;
            // End:0x200
            break;
        // End:0x165
        case 10:
            return default.VotePassed;
            // End:0x200
            break;
        // End:0x173
        case 11:
            return default.MustHaveStats;
            // End:0x200
            break;
        // End:0x181
        case 12:
            return default.CantBeSpectator;
            // End:0x200
            break;
        // End:0x18F
        case 13:
            return default.CantBePlayer;
            // End:0x200
            break;
        // End:0x1AD
        case 14:
            return RelatedPRI_1.PlayerName @ default.BecameSpectator;
            // End:0x200
            break;
        // End:0x1BB
        case 15:
            return default.KickWarning;
            // End:0x200
            break;
        // End:0x1EA
        case 16:
            // End:0x1D1
            if(RelatedPRI_1 == none)
            {
                return default.NewSpecMessage;
            }
            return RelatedPRI_1.PlayerName $ default.SpecEnteredMessage;
            // End:0x200
            break;
        // End:0x1F5
        case 17:
            return default.CantBePlayerWaitNextRound;
        // End:0x1FD
        case 18:
            // End:0x200
            break;
        // End:0xFFFF
        default:
            break;
    }
    return "";
    //return;    
}

static simulated function ClientReceive(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    super.ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
    //return;    
}

defaultproperties
{
    SwitchLevelMessage="Change Level"
    LeftMessage=" left the game."
    FailedTeamMessage="Cannot find the player's team."
    FailedPlaceMessage="Cannot find the starting point."
    FailedSpawnMessage="Unable to revive the player."
    EnteredMessage=" entered the game."
    MaxedOutMessage="The player maximum for this server has been reached."
    OvertimeMessage="The game is a tie. Sudden death begins now!"
    GlobalNameChange="A player has changed names to: "
    NewTeamMessage=" joined as "
    NewTeamMessageTrailer="."
    NoNameChange="That name is already in use."
    VoteStarted="A vote has been initiated."
    VotePassed="Vote passed."
    MustHaveStats="You must activate stats to join this server."
    CantBeSpectator="Sorry, spectators are not allowed in this match."
    CantBePlayer="Sorry, you may not play in this match."
    CantBePlayerWaitNextRound="This round began 30 seconds or more ago. You can participate in the next round."
    BecameSpectator="Spectate"
    NewPlayerMessage="A new player joined the game."
    KickWarning="You have been idle for too long. You will be kicked from the server."
    NewSpecMessage="A spectator joined the game."
    SpecEnteredMessage="You joined as a spectator."
    bIsSpecial=false
}