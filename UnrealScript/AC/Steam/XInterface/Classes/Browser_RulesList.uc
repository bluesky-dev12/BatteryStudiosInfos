/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\Browser_RulesList.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:22
 *	Functions:4
 *
 *******************************************************************************/
class Browser_RulesList extends GUIMultiColumnList
    editinlinenew
    instanced;

var export editinline Browser_ServerListPageBase MyPage;
var export editinline Browser_ServersList MyServersList;
var int listitem;
var localized string TrueString;
var localized string FalseString;
var localized string ServerModeString;
var localized string DedicatedString;
var localized string NonDedicatedString;
var localized string AdminNameString;
var localized string AdminEmailString;
var localized string PasswordString;
var localized string GameStatsString;
var localized string GameSpeedString;
var localized string MutatorString;
var localized string BalanceTeamsString;
var localized string PlayersBalanceTeamsString;
var localized string FriendlyFireString;
var localized string GoalScoreString;
var localized string TimeLimitString;
var localized string MinPlayersString;
var localized string TranslocatorString;
var localized string WeaponStayString;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    __OnDrawItem__Delegate = MyOnDrawItem;
    __OnKeyEvent__Delegate = InternalOnKeyEvent;
    super(GUIListBase).InitComponent(MyController, myOwner);
}

function MyOnDrawItem(Canvas Canvas, int i, float X, float Y, float W, float H, bool bSelected, bool bPending)
{
    local float CellLeft, CellWidth;

    GetCellLeftWidth(0, CellLeft, CellWidth);
    Style.DrawText(Canvas, MenuState, CellLeft, Y, CellWidth, H, 0, LocalizeRules(MyServersList.Servers[listitem].ServerInfo[i].key), FontScale);
    GetCellLeftWidth(1, CellLeft, CellWidth);
    Style.DrawText(Canvas, MenuState, CellLeft, Y, CellWidth, H, 0, LocalizeRules(MyServersList.Servers[listitem].ServerInfo[i].Value), FontScale);
}

function bool InternalOnKeyEvent(out byte key, out byte State, float Delta)
{
    // End:0x1a
    if(super(GUIListBase).InternalOnKeyEvent(key, State, Delta))
    {
        return true;
    }
    // End:0x64
    if(State == 1)
    {
        switch(key)
        {
            // End:0x48
            case 13:
                MyServersList.Connect(false);
                return true;
                // End:0x64
                break;
            // End:0x61
            case 116:
                MyPage.RefreshList();
                return true;
                // End:0x64
                break;
            // End:0xffff
            default:
            }
            return false;
}

function string LocalizeRules(string Code)
{
    switch(Caps(Code))
    {
        // End:0x18
        case "TRUE":
            return TrueString;
        // End:0x28
        case "FALSE":
            return FalseString;
        // End:0x3d
        case "SERVERMODE":
            return ServerModeString;
        // End:0x51
        case "DEDICATED":
            return DedicatedString;
        // End:0x69
        case "NON-DEDICATED":
            return NonDedicatedString;
        // End:0x7d
        case "ADMINNAME":
            return AdminNameString;
        // End:0x92
        case "ADMINEMAIL":
            return AdminEmailString;
        // End:0xa5
        case "PASSWORD":
            return PasswordString;
        // End:0xb9
        case "GAMESTATS":
            return GameStatsString;
        // End:0xcd
        case "GAMESPEED":
            return GameSpeedString;
        // End:0xdf
        case "MUTATOR":
            return MutatorString;
        // End:0xf6
        case "BALANCETEAMS":
            return BalanceTeamsString;
        // End:0x114
        case "PLAYERSBALANCETEAMS":
            return PlayersBalanceTeamsString;
        // End:0x12b
        case "FRIENDLYFIRE":
            return FriendlyFireString;
        // End:0x13f
        case "GOALSCORE":
            return GoalScoreString;
        // End:0x153
        case "TIMELIMIT":
            return TimeLimitString;
        // End:0x168
        case "MINPLAYERS":
            return MinPlayersString;
        // End:0x17f
        case "TRANSLOCATOR":
            return TranslocatorString;
        // End:0x194
        case "WEAPONSTAY":
            return WeaponStayString;
        // End:0xffff
        default:
            return Code;
    }
}

defaultproperties
{
    TrueString="Enabled"
    FalseString="Disabled"
    ServerModeString="Server Mode"
    DedicatedString="Private Server"
    NonDedicatedString="Public Server"
    AdminNameString="Server Admin"
    AdminEmailString="Admin E-Mail"
    PasswordString="Password required"
    GameStatsString="UT2004 Stats"
    GameSpeedString="Game Speed"
    MutatorString="Mutator"
    BalanceTeamsString="Balance Teams with Bots"
    PlayersBalanceTeamsString="Balance Teams"
    FriendlyFireString="Friendly Fire"
    GoalScoreString="Goal Score"
    TimeLimitString="Time Limit"
    MinPlayersString="Min Players (Bots)"
    TranslocatorString="Translocator"
    WeaponStayString="Weapons Stay"
    ColumnHeadings=// Object reference not set to an instance of an object.
    
    InitColumnPerc=// Object reference not set to an instance of an object.
    
    ExpandLastColumn=true
}