class ChatRoomMessage extends LocalMessage
    notplaceable
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

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
    else
    {
        // End:0x76
        if(InStr(default.ChatRoomString[Index], "%pri%") != -1)
        {
            Text = Repl(default.ChatRoomString[Index], "%pri%", default.AnonText);            
        }
        else
        {
            Text = default.ChatRoomString[Index];
        }
    }
    // End:0xAC
    if(ChannelTitle != "")
    {
        return Repl(Text, "%title%", ChannelTitle);        
    }
    else
    {
        return Text;
    }
    //return;    
}

static function bool IsConsoleMessage(int Index)
{
    switch(Index)
    {
        // End:0x0B
        case 1:
        // End:0x10
        case 7:
        // End:0x15
        case 8:
        // End:0x1A
        case 9:
        // End:0x1F
        case 10:
        // End:0x24
        case 11:
        // End:0x2B
        case 12:
            return false;
        // End:0xFFFF
        default:
            return super.IsConsoleMessage(Index);
            break;
    }
    //return;    
}

defaultproperties
{
    AnonText="Someone"
    ChatRoomString[0]="Invalid channel or channel couldn't be found: '%title%'"
    ChatRoomString[1]="Already a member of channel '%title%'"
    ChatRoomString[2]="Channel '%title%' requires a password!"
    ChatRoomString[3]="Incorrect password specified for channel '%title%'"
    ChatRoomString[4]="You have been banned from channel '%title%'"
    ChatRoomString[5]="Couldn't join channel '%title%'.  Channel full!"
    ChatRoomString[6]="You are not allowed to join channel '%title%'"
    ChatRoomString[7]="Successfully joined channel '%title%'"
    ChatRoomString[8]="You left channel '%title%'"
    ChatRoomString[9]="Now speaking on channel '%title%'"
    ChatRoomString[10]="No longer speaking on channel '%title%'"
    ChatRoomString[11]="'%pri%' joined channel '%title%'"
    ChatRoomString[12]="'%pri%' left channel '%title%'"
    ChatRoomString[13]="Successfully banned '%pri%' from your personal chat channel"
    ChatRoomString[14]="Voice-chat ban action not successful.  No player with the specified ID was found"
    ChatRoomString[15]="Voice chat is not enabled on this server"
}