/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wBombMessage.uc
 * Package Imports:
 *	WGame
 *	Gameplay
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:17
 *	Functions:2
 *
 *******************************************************************************/
class wBombMessage extends CriticalEventPlus
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var(Message) localized string ReturnBlue;
var(Message) localized string ReturnRed;
var(Message) localized string ReturnedBlue;
var(Message) localized string ReturnedRed;
var(Message) localized string CaptureBlue;
var(Message) localized string CaptureRed;
var(Message) localized string DroppedBlue;
var(Message) localized string DroppedRed;
var(Message) localized string HasBlue;
var(Message) localized string HasRed;
var Sound ReturnSounds[2];
var Sound DroppedSounds[2];
var Sound TakenSounds[2];
var Sound Riffs[3];
var name ReturnSoundNames[2];
var name DroppedSoundNames[2];
var name TakenSoundNames[2];

static simulated function ClientReceive(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    // End:0x27
    if(Switch == 3)
    {
        P.PlayStatusAnnouncement(string(default.ReturnSoundNames[0]), 1, true);
    }
    super(LocalMessage).ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
    // End:0x58
    if(TeamInfo(OptionalObject) == none)
    {
        return;
    }
    switch(Switch)
    {
        // End:0x7f
        case 0:
            P.ClientPlaySound(default.Riffs[Rand(3)]);
            // End:0x12f
            break;
        // End:0x83
        case 1:
        // End:0x88
        case 3:
        // End:0xbd
        case 5:
            P.PlayStatusAnnouncement(string(default.ReturnSoundNames[TeamInfo(OptionalObject).TeamIndex]), 1, true);
            // End:0x12f
            break;
        // End:0xf2
        case 2:
            P.PlayStatusAnnouncement(string(default.DroppedSoundNames[TeamInfo(OptionalObject).TeamIndex]), 2, true);
            // End:0x12f
            break;
        // End:0xf7
        case 4:
        // End:0x12c
        case 6:
            P.PlayStatusAnnouncement(string(default.TakenSoundNames[TeamInfo(OptionalObject).TeamIndex]), 2, true);
            // End:0x12f
            break;
        // End:0xffff
        default:
}

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    switch(Switch)
    {
        // End:0x32
        case 0:
            // End:0x19
            if(RelatedPRI_1 == none)
            {
                return "";
            }
            return RelatedPRI_1.PlayerName @ default.CaptureBlue;
            // End:0x103
            break;
        // End:0x60
        case 1:
            // End:0x47
            if(RelatedPRI_1 == none)
            {
                return default.ReturnedBlue;
            }
            return RelatedPRI_1.PlayerName @ default.ReturnBlue;
            // End:0x103
            break;
        // End:0x8c
        case 2:
            // End:0x73
            if(RelatedPRI_1 == none)
            {
                return "";
            }
            return RelatedPRI_1.PlayerName @ default.DroppedBlue;
            // End:0x103
            break;
        // End:0x9a
        case 3:
            return default.ReturnedBlue;
            // End:0x103
            break;
        // End:0xc6
        case 4:
            // End:0xad
            if(RelatedPRI_1 == none)
            {
                return "";
            }
            return RelatedPRI_1.PlayerName @ default.HasBlue;
            // End:0x103
            break;
        // End:0xd4
        case 5:
            return default.ReturnedBlue;
            // End:0x103
            break;
        // End:0x100
        case 6:
            // End:0xe7
            if(RelatedPRI_1 == none)
            {
                return "";
            }
            return RelatedPRI_1.PlayerName @ default.HasBlue;
            // End:0x103
            break;
        // End:0xffff
        default:
            return "";
    }
}

defaultproperties
{
    ReturnBlue="?? ?????!"
    ReturnRed="?? ?????!"
    ReturnedBlue="?? ???????!"
    ReturnedRed="?? ???????!"
    CaptureBlue="? ?!"
    CaptureRed="? ?!"
    DroppedBlue="?? ???????!"
    DroppedRed="?? ???????!"
    HasBlue="?? ??? ????!"
    HasRed="?? ??? ????!"
    ReturnSoundNames[0]=BallReset
    ReturnSoundNames[1]=BallReset
    DroppedSoundNames[0]=Red_Pass_Fumbled
    DroppedSoundNames[1]=Blue_Pass_Fumbled
    TakenSoundNames[0]=Red_Team_on_Offence
    TakenSoundNames[1]=Blue_Team_on_Offence
    StackMode=2
    PosY=0.10
}