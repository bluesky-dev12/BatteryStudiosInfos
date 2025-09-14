/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\CTFMessage.uc
 * Package Imports:
 *	UnrealGame
 *	Gameplay
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:17
 *	Functions:2
 *
 *******************************************************************************/
class CTFMessage extends CriticalEventPlus
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
    super(LocalMessage).ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
    // End:0x31
    if(TeamInfo(OptionalObject) == none)
    {
        return;
    }
    switch(Switch)
    {
        // End:0x58
        case 0:
            P.ClientPlaySound(default.Riffs[Rand(3)]);
            // End:0x108
            break;
        // End:0x5c
        case 1:
        // End:0x61
        case 3:
        // End:0x96
        case 5:
            P.PlayStatusAnnouncement(string(default.ReturnSoundNames[TeamInfo(OptionalObject).TeamIndex]), 2, true);
            // End:0x108
            break;
        // End:0xcb
        case 2:
            P.PlayStatusAnnouncement(string(default.DroppedSoundNames[TeamInfo(OptionalObject).TeamIndex]), 2, true);
            // End:0x108
            break;
        // End:0xd0
        case 4:
        // End:0x105
        case 6:
            P.PlayStatusAnnouncement(string(default.TakenSoundNames[TeamInfo(OptionalObject).TeamIndex]), 2, true);
            // End:0x108
            break;
        // End:0xffff
        default:
}

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    // End:0x13
    if(TeamInfo(OptionalObject) == none)
    {
        return "";
    }
    switch(Switch)
    {
        // End:0x77
        case 0:
            // End:0x2c
            if(RelatedPRI_1 == none)
            {
                return "";
            }
            // End:0x5e
            if(TeamInfo(OptionalObject).TeamIndex == 0)
            {
                return RelatedPRI_1.PlayerName @ default.CaptureRed;
            }
            // End:0x74
            else
            {
                return RelatedPRI_1.PlayerName @ default.CaptureBlue;
            }
            // End:0x276
            break;
        // End:0xf9
        case 1:
            // End:0xae
            if(RelatedPRI_1 == none)
            {
                // End:0xa8
                if(TeamInfo(OptionalObject).TeamIndex == 0)
                {
                    return default.ReturnedRed;
                }
                // End:0xae
                else
                {
                    return default.ReturnedBlue;
                }
            }
            // End:0xe0
            if(TeamInfo(OptionalObject).TeamIndex == 0)
            {
                return RelatedPRI_1.PlayerName @ default.ReturnRed;
            }
            // End:0xf6
            else
            {
                return RelatedPRI_1.PlayerName @ default.ReturnBlue;
            }
            // End:0x276
            break;
        // End:0x157
        case 2:
            // End:0x10c
            if(RelatedPRI_1 == none)
            {
                return "";
            }
            // End:0x13e
            if(TeamInfo(OptionalObject).TeamIndex == 0)
            {
                return RelatedPRI_1.PlayerName @ default.DroppedRed;
            }
            // End:0x154
            else
            {
                return RelatedPRI_1.PlayerName @ default.DroppedBlue;
            }
            // End:0x276
            break;
        // End:0x187
        case 3:
            // End:0x17e
            if(TeamInfo(OptionalObject).TeamIndex == 0)
            {
                return default.ReturnedRed;
            }
            // End:0x184
            else
            {
                return default.ReturnedBlue;
            }
            // End:0x276
            break;
        // End:0x1e5
        case 4:
            // End:0x19a
            if(RelatedPRI_1 == none)
            {
                return "";
            }
            // End:0x1cc
            if(TeamInfo(OptionalObject).TeamIndex == 0)
            {
                return RelatedPRI_1.PlayerName @ default.HasRed;
            }
            // End:0x1e2
            else
            {
                return RelatedPRI_1.PlayerName @ default.HasBlue;
            }
            // End:0x276
            break;
        // End:0x215
        case 5:
            // End:0x20c
            if(TeamInfo(OptionalObject).TeamIndex == 0)
            {
                return default.ReturnedRed;
            }
            // End:0x212
            else
            {
                return default.ReturnedBlue;
            }
            // End:0x276
            break;
        // End:0x273
        case 6:
            // End:0x228
            if(RelatedPRI_1 == none)
            {
                return "";
            }
            // End:0x25a
            if(TeamInfo(OptionalObject).TeamIndex == 0)
            {
                return RelatedPRI_1.PlayerName @ default.HasRed;
            }
            // End:0x270
            else
            {
                return RelatedPRI_1.PlayerName @ default.HasBlue;
            }
            // End:0x276
            break;
        // End:0xffff
        default:
            return "";
    }
}

defaultproperties
{
    ReturnBlue="?? ?? ??!"
    ReturnRed="?? ?? ??!"
    ReturnedBlue="?? ?? ?? ??!"
    ReturnedRed="?? ?? ?? ??!"
    CaptureBlue="?? ??? ?????!"
    CaptureRed="?? ??? ?????!"
    DroppedBlue="?? ??? ???????!"
    DroppedRed="?? ??? ???????!"
    HasBlue="?? ??? ?????!"
    HasRed="?? ??? ?????!"
    ReturnSoundNames[0]=Red_Flag_Returned
    ReturnSoundNames[1]=Blue_Flag_Returned
    DroppedSoundNames[0]=Red_Flag_Dropped
    DroppedSoundNames[1]=Blue_Flag_Dropped
    TakenSoundNames[0]=Red_Flag_Taken
    TakenSoundNames[1]=Blue_Flag_Taken
    StackMode=2
    PosY=0.10
}