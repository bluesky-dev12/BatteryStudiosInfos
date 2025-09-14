class MatchSetupMain extends MatchSetupPanelBase
    editinlinenew
    instanced;

var() automated moComboBox co_GameType;
var() automated moEditBox ed_Params;
var() automated moEditBox ed_DemoRec;
var() automated moCheckBox ch_DemoRec;
var() automated moCheckBox ch_Tournament;
var bool bDemoRec;
var bool bTournament;
var string GameClass;
var string DemoFilename;
var string Params;

function InitPanel()
{
    super.InitPanel();
    Group = Class'xVoting_Decompressed.VotingReplicationInfo'.default.GeneralID;
    //return;    
}

function bool HandleResponse(string Type, string Info, string Data)
{
    local string InfoStr, SubType;

    // End:0x37D
    if(Type ~= Group)
    {
        Log(((("MAIN HandleResponse Info '" $ Info) $ "'  Data '") $ Data) $ "'", 'MapVoteDebug');
        // End:0x90
        if(!Divide(Info, Chr(27), InfoStr, SubType))
        {
            Log("received unknown general token");
            return true;
        }
        // End:0x207
        if(InfoStr ~= Class'xVoting_Decompressed.VotingReplicationInfo'.default.AddID)
        {
            switch(SubType)
            {
                // End:0xE9
                case Class'xVoting_Decompressed.VotingReplicationInfo'.default.TournamentID:
                    bTournament = bool(Data);
                    ch_Tournament.SetComponentValue(string(bTournament), true);
                    // End:0x204
                    break;
                // End:0x145
                case Class'xVoting_Decompressed.VotingReplicationInfo'.default.DemoRecID:
                    bDemoRec = bool(Data);
                    ch_DemoRec.SetComponentValue(string(bDemoRec), true);
                    // End:0x137
                    if(bDemoRec)
                    {
                        EnableComponent(ed_DemoRec);                        
                    }
                    else
                    {
                        DisableComponent(ed_DemoRec);
                    }
                    // End:0x204
                    break;
                // End:0x1CD
                case Class'xVoting_Decompressed.VotingReplicationInfo'.default.GameTypeID:
                    GameClass = Data;
                    // End:0x1CA
                    if(GameClass != "")
                    {
                        co_GameType.MyComboBox.List.bNotify = false;
                        co_GameType.Find(Data,, true);
                        co_GameType.MyComboBox.List.bNotify = true;
                    }
                    // End:0x204
                    break;
                // End:0x201
                case Class'xVoting_Decompressed.VotingReplicationInfo'.default.URLID:
                    Params = Data;
                    ed_Params.SetComponentValue(Params, true);
                    // End:0x204
                    break;
                // End:0xFFFF
                default:
                    break;
            }            
        }
        else
        {
            // End:0x37B
            if(InfoStr ~= Class'xVoting_Decompressed.VotingReplicationInfo'.default.UpdateID)
            {
                switch(SubType)
                {
                    // End:0x260
                    case Class'xVoting_Decompressed.VotingReplicationInfo'.default.TournamentID:
                        bTournament = bool(Data);
                        ch_Tournament.SetComponentValue(string(bTournament), true);
                        // End:0x37B
                        break;
                    // End:0x2BC
                    case Class'xVoting_Decompressed.VotingReplicationInfo'.default.DemoRecID:
                        bDemoRec = bool(Data);
                        ch_DemoRec.SetComponentValue(string(bDemoRec), true);
                        // End:0x2AE
                        if(bDemoRec)
                        {
                            EnableComponent(ed_DemoRec);                            
                        }
                        else
                        {
                            DisableComponent(ed_DemoRec);
                        }
                        // End:0x37B
                        break;
                    // End:0x344
                    case Class'xVoting_Decompressed.VotingReplicationInfo'.default.GameTypeID:
                        GameClass = Data;
                        // End:0x341
                        if(GameClass != "")
                        {
                            co_GameType.MyComboBox.List.bNotify = false;
                            co_GameType.Find(Data,, true);
                            co_GameType.MyComboBox.List.bNotify = true;
                        }
                        // End:0x37B
                        break;
                    // End:0x378
                    case Class'xVoting_Decompressed.VotingReplicationInfo'.default.URLID:
                        Params = Data;
                        ed_Params.SetComponentValue(Params, true);
                        // End:0x37B
                        break;
                    // End:0xFFFF
                    default:
                        break;
                }
            }
            else
            {
            }
            return true;
        }/* !MISMATCHING REMOVE, tried If got Type:Else Position:0x207! */
        return false;
        //return;        
    }/* !MISMATCHING REMOVE, tried Else got Type:If Position:0x000! */
}

function InternalOnChange(GUIComponent Sender)
{
    // End:0x3A
    if(Sender == ch_DemoRec)
    {
        // End:0x2F
        if(ch_DemoRec.IsChecked())
        {
            EnableComponent(ed_DemoRec);            
        }
        else
        {
            DisableComponent(ed_DemoRec);
        }
    }
    super.InternalOnChange(Sender);
    //return;    
}

function SubmitChanges()
{
    // End:0x2E
    if(GameClass != co_GameType.GetExtra())
    {
        SendCommand(GetCommandString(co_GameType));
    }
    // End:0x5D
    if(bTournament != ch_Tournament.IsChecked())
    {
        SendCommand(GetCommandString(ch_Tournament));
    }
    // End:0x8C
    if(bDemoRec != ch_DemoRec.IsChecked())
    {
        SendCommand(GetCommandString(ch_DemoRec));
    }
    // End:0xBA
    if(Params != ed_Params.GetText())
    {
        SendCommand(GetCommandString(ed_Params));
    }
    super.SubmitChanges();
    //return;    
}

function string GetCommandString(GUIComponent Comp)
{
    local string str;

    // End:0x0E
    if(Comp == none)
    {
        return "";
    }
    str = Group;
    switch(Comp)
    {
        // End:0x5D
        case co_GameType:
            str $= (((":" $ Class'xVoting_Decompressed.VotingReplicationInfo'.default.GameTypeID) $ ";") $ co_GameType.GetExtra());
            // End:0x14F
            break;
        // End:0x9C
        case ch_Tournament:
            str $= (((":" $ Class'xVoting_Decompressed.VotingReplicationInfo'.default.TournamentID) $ ";") $ string(ch_Tournament.IsChecked()));
            // End:0x14F
            break;
        // End:0xF2
        case ch_DemoRec:
            str $= (":" $ Class'xVoting_Decompressed.VotingReplicationInfo'.default.DemoRecID);
            // End:0xEF
            if(ch_DemoRec.IsChecked())
            {
                str $= (";" $ ed_DemoRec.GetText());
            }
            // End:0x14F
            break;
        // End:0x14C
        case ed_Params:
            str $= (":" $ Class'xVoting_Decompressed.VotingReplicationInfo'.default.URLID);
            // End:0x149
            if(ed_Params.GetText() != "")
            {
                str $= (";" $ ed_Params.GetText());
            }
            // End:0x14F
            break;
        // End:0xFFFF
        default:
            break;
    }
    return str;
    //return;    
}

defaultproperties
{
    // Reference: moComboBox'xVoting_Decompressed.MatchSetupMain.GameTypeCombo'
    begin object name="GameTypeCombo" class=XInterface.moComboBox
        Caption="????"
        OnCreateComponent=GameTypeCombo.InternalOnCreateComponent
        Hint="? ??? ??? ????? ??????."
        WinTop=0.1328390
        WinLeft=0.0142820
        WinWidth=0.6225880
        WinHeight=0.1000000
        TabOrder=0
    end object
    co_GameType=GameTypeCombo
    // Reference: moEditBox'xVoting_Decompressed.MatchSetupMain.CommandLineParamsBox'
    begin object name="CommandLineParamsBox" class=XInterface.moEditBox
        bVerticalLayout=true
        LabelJustification=1
        Caption="??? ?? ?? ??"
        OnCreateComponent=CommandLineParamsBox.InternalOnCreateComponent
        Hint="??? ??? ?? ??? ???(??)"
        WinTop=0.7343490
        WinLeft=0.0082520
        WinWidth=0.9860840
        WinHeight=0.2000000
        TabOrder=2
    end object
    ed_Params=CommandLineParamsBox
    // Reference: moEditBox'xVoting_Decompressed.MatchSetupMain.DemoRecBox'
    begin object name="DemoRecBox" class=XInterface.moEditBox
        CaptionWidth=0.1000000
        Caption="???"
        OnCreateComponent=DemoRecBox.InternalOnCreateComponent
        MenuState=4
        Hint="? ????? ??? ??? ?????."
        WinTop=0.4574500
        WinLeft=0.3918450
        WinWidth=0.5919430
        WinHeight=0.1000000
        TabOrder=4
    end object
    ed_DemoRec=DemoRecBox
    // Reference: moCheckBox'xVoting_Decompressed.MatchSetupMain.DemoRecCheckbox'
    begin object name="DemoRecCheckbox" class=XInterface.moCheckBox
        Caption="?? ??"
        OnCreateComponent=DemoRecCheckbox.InternalOnCreateComponent
        Hint="????? ??? ?????."
        WinTop=0.4596990
        WinLeft=0.0112670
        WinWidth=0.3530460
        WinHeight=0.1000000
        TabOrder=3
        OnChange=MatchSetupMain.InternalOnChange
    end object
    ch_DemoRec=DemoRecCheckbox
    // Reference: moCheckBox'xVoting_Decompressed.MatchSetupMain.TournamentCheckbox'
    begin object name="TournamentCheckbox" class=XInterface.moCheckBox
        Caption="???? ??"
        OnCreateComponent=TournamentCheckbox.InternalOnCreateComponent
        Hint="??? ???? ?? ?? ????? ???? ??????."
        WinTop=0.2959340
        WinLeft=0.0122720
        WinWidth=0.3532960
        WinHeight=0.1000000
        TabOrder=1
    end object
    ch_Tournament=TournamentCheckbox
    PanelCaption="??"
}