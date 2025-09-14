class MatchSetupRules extends MatchSetupPanelBase
    editinlinenew
    instanced;

var() automated RemotePlayInfoPanel p_Rules;

function InitPanel()
{
    super.InitPanel();
    Group = Class'xVoting_Decompressed.VotingReplicationInfo'.default.OptionID;
    //return;    
}

function bool HandleResponse(string Type, string Info, string Data)
{
    local array<string> Parts;
    local string str1, str2;

    // End:0xFE
    if(Type ~= Group)
    {
        Log(((("RULES HandleResponse Info '" $ Info) $ "'  Data '") $ Data) $ "'", 'MapVoteDebug');
        // End:0xBA
        if(Info == Class'xVoting_Decompressed.VotingReplicationInfo'.default.AddID)
        {
            Split(Data, Chr(27), Parts);
            Parts.Length = 3;
            p_Rules.ReceivedRule(Parts[0], Parts[1], Parts[2]);
            p_Rules.bUpdate = true;
        }
        // End:0xFC
        if((Info == Class'xVoting_Decompressed.VotingReplicationInfo'.default.UpdateID) && Divide(Data, Chr(27), str1, str2))
        {
            ReceiveValue(str1, str2);
        }
        return true;
    }
    return false;
    //return;    
}

function ReceiveValue(string SettingName, string NewValue)
{
    p_Rules.ReceivedValue(SettingName, NewValue);
    //return;    
}

function SendValue(string SettingName, string NewValue)
{
    SendCommand((((Group $ ":") $ SettingName) $ ";") $ NewValue);
    //return;    
}

function LoggedIn()
{
    super.LoggedIn();
    p_Rules.ClearRules();
    p_Rules.bRefresh = true;
    //return;    
}

function ReceiveComplete()
{
    p_Rules.bUpdate = true;
    p_Rules.Refresh();
    //return;    
}

defaultproperties
{
    // Reference: RemotePlayInfoPanel'xVoting_Decompressed.MatchSetupRules.PIPanel'
    begin object name="PIPanel" class=GUI2K4.RemotePlayInfoPanel
        SettingChanged=MatchSetupRules.SendValue
        OnActivate=PIPanel.InternalOnActivate
    end object
    p_Rules=PIPanel
    PanelCaption="????"
}