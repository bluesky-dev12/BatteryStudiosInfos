/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path xVoting\Classes\MatchSetupRules.uc
 * Package Imports:
 *	xVoting
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:6
 *
 *******************************************************************************/
class MatchSetupRules extends MatchSetupPanelBase
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify RemotePlayInfoPanel p_Rules;

function InitPanel()
{
    super.InitPanel();
    Group = class'VotingReplicationInfo'.default.OptionID;
}

function bool HandleResponse(string Type, string Info, string Data)
{
    local array<string> Parts;
    local string str1, str2;

    // End:0xfe
    if(Type ~= Group)
    {
        Log("RULES HandleResponse Info '" $ Info $ "'  Data '" $ Data $ "'", 'MapVoteDebug');
        // End:0xba
        if(Info == class'VotingReplicationInfo'.default.AddID)
        {
            Split(Data, Chr(27), Parts);
            Parts.Length = 3;
            p_Rules.ReceivedRule(Parts[0], Parts[1], Parts[2]);
            p_Rules.bUpdate = true;
        }
        // End:0xfc
        if(Info == class'VotingReplicationInfo'.default.UpdateID && Divide(Data, Chr(27), str1, str2))
        {
            ReceiveValue(str1, str2);
        }
        return true;
    }
    return false;
}

function ReceiveValue(string SettingName, string NewValue)
{
    p_Rules.ReceivedValue(SettingName, NewValue);
}

function SendValue(string SettingName, string NewValue)
{
    SendCommand(Group $ ":" $ SettingName $ ";" $ NewValue);
}

function LoggedIn()
{
    super.LoggedIn();
    p_Rules.ClearRules();
    p_Rules.bRefresh = true;
}

function ReceiveComplete()
{
    p_Rules.bUpdate = true;
    p_Rules.Refresh();
}

defaultproperties
{
    begin object name=PIPanel class=RemotePlayInfoPanel
        SettingChanged=SendValue
        OnActivate=InternalOnActivate
    object end
    // Reference: RemotePlayInfoPanel'MatchSetupRules.PIPanel'
    p_Rules=PIPanel
    PanelCaption="????"
}