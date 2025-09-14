/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\ChatRoomMessage.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:2
 *
 *******************************************************************************/
class ChatRoomMessage extends LocalMessage
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    notplaceable;

var localized string AnonText;
var localized string ChatRoomString[16];

static function string AssembleMessage(int Index, string ChannelTitle, optional PlayerReplicationInfo RelatedPRI)
{
    local string Text;

    // End:0x36
    if(RelatedPRI != none)
    {
        Text = Repl(default.ChatRoomString[Index], "%pri%", RelatedPRI.PlayerName);
    }
    // End:0x87
    else
    {
        // End:0x76
        if(InStr(default.ChatRoomString[Index], "%pri%") != -1)
        {
            Text = Repl(default.ChatRoomString[Index], "%pri%", default.AnonText);
        }
        // End:0x87
        else
        {
            Text = default.ChatRoomString[Index];
        }
    }
    // End:0xac
    if(ChannelTitle != "")
    {
        return Repl(Text, "%title%", ChannelTitle);
    }
    // End:0xb2
    else
    {
        return Text;
    }
}

static function bool IsConsoleMessage(int Index)
{
    switch(Index)
    {
        // End:0x0b
        case 1:
        // End:0x10
        case 7:
        // End:0x15
        case 8:
        // End:0x1a
        case 9:
        // End:0x1f
        case 10:
        // End:0x24
        case 11:
        // End:0x2b
        case 12:
            return false;
        // End:0xffff
        default:
            return super.IsConsoleMessage(Index);
    }
}

defaultproperties
{
    AnonText="Someone"
    ChatRoomString[0]="The following channel could not be used or be found: %title%"
    ChatRoomString[1]="You are already a member of the %title% channel!"
    ChatRoomString[2]="The %title% channel requires a password!"
    ChatRoomString[3]="The password to enter %title% was wrong!"
    ChatRoomString[4]="You were banned from the %title% channel!"
    ChatRoomString[5]="You may not enter, the %title% channel is full!"
    ChatRoomString[6]="The %title% channel requires special permission!"
    ChatRoomString[7]="You entered the %title% channel!"
    ChatRoomString[8]="You left the %title% channel."
    ChatRoomString[9]="A conversation in the %title% channel has started."
    ChatRoomString[10]="A conversation in the %title% channel has ended."
    ChatRoomString[11]="%pri% joined the %title% channel."
    ChatRoomString[12]="%pri% left the %title% channel."
    ChatRoomString[13]="%pri% was added to the banlist for your private chat channel."
    ChatRoomString[14]="Player ID not found. Unable to modify voice chat banlist."
    ChatRoomString[15]="This server does not support voice chat."
}