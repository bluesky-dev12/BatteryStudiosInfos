/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path xVoting\Classes\VotingPage.uc
 * Package Imports:
 *	xVoting
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:2
 *
 *******************************************************************************/
class VotingPage extends LargeWindow
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify MapVoteFooter f_Chat;
var() editconst noexport VotingReplicationInfo MVRI;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local PlayerController PC;

    super(FloatingWindow).InitComponent(MyController, myOwner);
    PC = PlayerOwner();
    MVRI = VotingReplicationInfo(PC.VoteReplicationInfo);
    // End:0x66
    if(PlayerOwner() != none && PlayerOwner().Level.Pauser != none)
    {
        PlayerOwner().SetPause(false);
    }
}

function free()
{
    MVRI = none;
    super(GUIPage).free();
}

defaultproperties
{
    begin object name=MatchSetupFooter class=MapVoteFooter
        WinTop=0.6864570
        WinLeft=0.0199210
        WinWidth=0.9621090
        WinHeight=0.2914060
        TabOrder=10
    object end
    // Reference: MapVoteFooter'VotingPage.MatchSetupFooter'
    f_Chat=MatchSetupFooter
    bRequire640x480=true
    bAllowedAsLast=true
    WinTop=0.10
    WinLeft=0.10
    WinWidth=0.80
    WinHeight=0.80
    bAcceptsInput=true
}