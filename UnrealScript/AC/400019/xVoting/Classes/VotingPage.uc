class VotingPage extends LargeWindow
    editinlinenew
    instanced;

var() automated MapVoteFooter f_Chat;
var() editconst noexport VotingReplicationInfo MVRI;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local PlayerController PC;

    super(FloatingWindow).InitComponent(MyController, myOwner);
    PC = PlayerOwner();
    MVRI = VotingReplicationInfo(PC.VoteReplicationInfo);
    // End:0x66
    if((PlayerOwner() != none) && PlayerOwner().Level.Pauser != none)
    {
        PlayerOwner().SetPause(false);
    }
    //return;    
}

function free()
{
    MVRI = none;
    super(GUIPage).free();
    //return;    
}

defaultproperties
{
    // Reference: MapVoteFooter'xVoting_Decompressed.VotingPage.MatchSetupFooter'
    begin object name="MatchSetupFooter" class=xVoting_Decompressed.MapVoteFooter
        WinTop=0.6864570
        WinLeft=0.0199210
        WinWidth=0.9621090
        WinHeight=0.2914060
        TabOrder=10
    end object
    f_Chat=MatchSetupFooter
    bRequire640x480=false
    bAllowedAsLast=true
    WinTop=0.1000000
    WinLeft=0.1000000
    WinWidth=0.8000000
    WinHeight=0.8000000
    bAcceptsInput=false
}