/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path xVoting\Classes\MatchSetupMain.uc
 * Package Imports:
 *	xVoting
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:10
 *	Functions:5
 *
 *******************************************************************************/
class MatchSetupMain extends MatchSetupPanelBase
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moComboBox co_GameType;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moEditBox ed_Params;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moEditBox ed_DemoRec;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_DemoRec;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_Tournament;
var bool bDemoRec;
var bool bTournament;
var string GameClass;
var string DemoFilename;
var string params;

function InitPanel()
{
    super.InitPanel();
    Group = class'VotingReplicationInfo'.default.GeneralID;
}

function bool HandleResponse(string Type, string Info, string Data)
{
    local string InfoStr, SubType;

    // End:0x37d
    if(Type ~= Group)
    {
        Log("MAIN HandleResponse Info '" $ Info $ "'  Data '" $ Data $ "'", 'MapVoteDebug');
        // End:0x90
        if(!Divide(Info, Chr(27), InfoStr, SubType))
        {
            Log("received unknown general token");
            return true;
        }
        // End:0x207
        if(InfoStr ~= class'VotingReplicationInfo'.default.AddID)
        {
            switch(SubType)
            {
                // End:0xe9
                case class'VotingReplicationInfo'.default.TournamentID:
                    bTournament = bool(Data);
                    ch_Tournament.SetComponentValue(string(bTournament), true);
                    // End:0x204
                    break;
                // End:0x145
                case class'VotingReplicationInfo'.default.DemoRecID:
                    bDemoRec = bool(Data);
                    ch_DemoRec.SetComponentValue(string(bDemoRec), true);
                    // End:0x137
                    if(bDemoRec)
                    {
                        EnableComponent(ed_DemoRec);
                    }
                    // End:0x142
                    else
                    {
                        DisableComponent(ed_DemoRec);
                    }
                    // End:0x204
                    break;
                // End:0x1cd
                case class'VotingReplicationInfo'.default.GameTypeID:
                    GameClass = Data;
                    // End:0x1ca
                    if(GameClass != "")
                    {
                        co_GameType.MyComboBox.List.bNotify = false;
                        co_GameType.Find(Data,, true);
                        co_GameType.MyComboBox.List.bNotify = true;
                    }
                    // End:0x204
                    break;
                // End:0x201
                case class'VotingReplicationInfo'.default.URLID:
                    params = Data;
                    ed_Params.SetComponentValue(params, true);
                    // End:0x204
                    break;
                // End:0xffff
                default:
                    // End:0x37b Break;
                    break;
                }
        }
        // End:0x37b
        if(InfoStr ~= class'VotingReplicationInfo'.default.UpdateID)
        {
            switch(SubType)
            {
                // End:0x260
                case class'VotingReplicationInfo'.default.TournamentID:
                    bTournament = bool(Data);
                    ch_Tournament.SetComponentValue(string(bTournament), true);
                    // End:0x37b
                    break;
                // End:0x2bc
                case class'VotingReplicationInfo'.default.DemoRecID:
                    bDemoRec = bool(Data);
                    ch_DemoRec.SetComponentValue(string(bDemoRec), true);
                    // End:0x2ae
                    if(bDemoRec)
                    {
                        EnableComponent(ed_DemoRec);
                    }
                    // End:0x2b9
                    else
                    {
                        DisableComponent(ed_DemoRec);
                    }
                    // End:0x37b
                    break;
                // End:0x344
                case class'VotingReplicationInfo'.default.GameTypeID:
                    GameClass = Data;
                    // End:0x341
                    if(GameClass != "")
                    {
                        co_GameType.MyComboBox.List.bNotify = false;
                        co_GameType.Find(Data,, true);
                        co_GameType.MyComboBox.List.bNotify = true;
                    }
                    // End:0x37b
                    break;
                // End:0x378
                case class'VotingReplicationInfo'.default.URLID:
                    params = Data;
                    ed_Params.SetComponentValue(params, true);
                    // End:0x37b
                    break;
                // End:0xffff
                default:
                }
                return true;
            }
            return false;
}

function InternalOnChange(GUIComponent Sender)
{
    // End:0x3a
    if(Sender == ch_DemoRec)
    {
        // End:0x2f
        if(ch_DemoRec.IsChecked())
        {
            EnableComponent(ed_DemoRec);
        }
        // End:0x3a
        else
        {
            DisableComponent(ed_DemoRec);
        }
    }
    super.InternalOnChange(Sender);
}

function SubmitChanges()
{
    // End:0x2e
    if(GameClass != co_GameType.GetExtra())
    {
        SendCommand(GetCommandString(co_GameType));
    }
    // End:0x5d
    if(bTournament != ch_Tournament.IsChecked())
    {
        SendCommand(GetCommandString(ch_Tournament));
    }
    // End:0x8c
    if(bDemoRec != ch_DemoRec.IsChecked())
    {
        SendCommand(GetCommandString(ch_DemoRec));
    }
    // End:0xba
    if(params != ed_Params.GetText())
    {
        SendCommand(GetCommandString(ed_Params));
    }
    super.SubmitChanges();
}

function string GetCommandString(GUIComponent Comp)
{
    local string str;

    // End:0x0e
    if(Comp == none)
    {
        return "";
    }
    str = Group;
    switch(Comp)
    {
        // End:0x5d
        case co_GameType:
            str $= ":" $ class'VotingReplicationInfo'.default.GameTypeID $ ";" $ co_GameType.GetExtra();
            // End:0x14f
            break;
        // End:0x9c
        case ch_Tournament:
            str $= ":" $ class'VotingReplicationInfo'.default.TournamentID $ ";" $ string(ch_Tournament.IsChecked());
            // End:0x14f
            break;
        // End:0xf2
        case ch_DemoRec:
            str $= ":" $ class'VotingReplicationInfo'.default.DemoRecID;
            // End:0xef
            if(ch_DemoRec.IsChecked())
            {
                str $= ";" $ ed_DemoRec.GetText();
            }
            // End:0x14f
            break;
        // End:0x14c
        case ed_Params:
            str $= ":" $ class'VotingReplicationInfo'.default.URLID;
            // End:0x149
            if(ed_Params.GetText() != "")
            {
                str $= ";" $ ed_Params.GetText();
            }
            // End:0x14f
            break;
        // End:0xffff
        default:
            return str;
    }
}

defaultproperties
{
    begin object name=GameTypeCombo class=moComboBox
        Caption="????"
        OnCreateComponent=InternalOnCreateComponent
        Hint="? ??? ??? ????? ??????."
        WinTop=0.1328390
        WinLeft=0.0142820
        WinWidth=0.6225880
        WinHeight=0.10
        TabOrder=0
    object end
    // Reference: moComboBox'MatchSetupMain.GameTypeCombo'
    co_GameType=GameTypeCombo
    begin object name=CommandLineParamsBox class=moEditBox
        bVerticalLayout=true
        LabelJustification=1
        Caption="??? ?? ?? ??"
        OnCreateComponent=InternalOnCreateComponent
        Hint="??? ??? ?? ??? ???(??)"
        WinTop=0.7343490
        WinLeft=0.0082520
        WinWidth=0.9860840
        WinHeight=0.20
        TabOrder=2
    object end
    // Reference: moEditBox'MatchSetupMain.CommandLineParamsBox'
    ed_Params=CommandLineParamsBox
    begin object name=DemoRecBox class=moEditBox
        CaptionWidth=0.10
        Caption="???"
        OnCreateComponent=InternalOnCreateComponent
        MenuState=4
        Hint="? ????? ??? ??? ?????."
        WinTop=0.457450
        WinLeft=0.3918450
        WinWidth=0.5919430
        WinHeight=0.10
        TabOrder=4
    object end
    // Reference: moEditBox'MatchSetupMain.DemoRecBox'
    ed_DemoRec=DemoRecBox
    begin object name=DemoRecCheckbox class=moCheckBox
        Caption="?? ??"
        OnCreateComponent=InternalOnCreateComponent
        Hint="????? ??? ?????."
        WinTop=0.4596990
        WinLeft=0.0112670
        WinWidth=0.3530460
        WinHeight=0.10
        TabOrder=3
        OnChange=InternalOnChange
    object end
    // Reference: moCheckBox'MatchSetupMain.DemoRecCheckbox'
    ch_DemoRec=DemoRecCheckbox
    begin object name=TournamentCheckbox class=moCheckBox
        Caption="???? ??"
        OnCreateComponent=InternalOnCreateComponent
        Hint="??? ???? ?? ?? ????? ???? ??????."
        WinTop=0.2959340
        WinLeft=0.0122720
        WinWidth=0.3532960
        WinHeight=0.10
        TabOrder=1
    object end
    // Reference: moCheckBox'MatchSetupMain.TournamentCheckbox'
    ch_Tournament=TournamentCheckbox
    PanelCaption="??"
}