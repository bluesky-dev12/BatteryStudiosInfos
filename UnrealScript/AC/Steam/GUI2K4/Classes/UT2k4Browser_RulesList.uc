/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2k4Browser_RulesList.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:22
 *	Functions:6
 *
 *******************************************************************************/
class UT2k4Browser_RulesList extends ServerBrowserMCList
    editinlinenew
    instanced;

var array<KeyValuePair> Rules;
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
var localized string MapVotingString;
var localized string KickVotingString;

function MyOnDrawItem(Canvas Canvas, int i, float X, float Y, float W, float H, bool bSelected, bool bPending)
{
    local float CellLeft, CellWidth;
    local export editinline GUIStyles DrawStyle;

    // End:0x4d
    if(bSelected)
    {
        SelectedStyle.Draw(Canvas, 3, X, Y - float(2), W, H + float(2));
        DrawStyle = SelectedStyle;
    }
    // End:0x58
    else
    {
        DrawStyle = Style;
    }
    GetCellLeftWidth(0, CellLeft, CellWidth);
    DrawStyle.DrawText(Canvas, MenuState, CellLeft, Y, CellWidth, H, 0, LocalizeRules(Rules[SortData[i].SortItem].key), FontScale);
    GetCellLeftWidth(1, CellLeft, CellWidth);
    DrawStyle.DrawText(Canvas, MenuState, CellLeft, Y, CellWidth, H, 0, LocalizeRules(Rules[SortData[i].SortItem].Value), FontScale);
}

function bool InternalOnKeyEvent(out byte key, out byte State, float Delta)
{
    // End:0x1a
    if(super(GUIListBase).InternalOnKeyEvent(key, State, Delta))
    {
        return true;
    }
    // End:0x68
    if(State == 3)
    {
        switch(key)
        {
            // End:0x4f
            case 13:
                tp_MyPage.li_Server.Connect(false);
                return true;
            // End:0x65
            case 116:
                tp_MyPage.RefreshList();
                return true;
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
        // End:0x1a8
        case "MAPVOTING":
            return MapVotingString;
        // End:0x1bd
        case "KICKVOTING":
            return KickVotingString;
        // End:0xffff
        default:
            return Code;
    }
}

function AddNewRule(KeyValuePair NewRule)
{
    Rules[Rules.Length] = NewRule;
    AddedItem();
}

function Clear()
{
    ItemCount = 0;
    Rules.Remove(0, Rules.Length);
    super(GUIMultiColumnList).Clear();
}

function string GetSortString(int i)
{
    local string S;

    // End:0x39
    if(SortColumn == 1)
    {
        S = LocalizeRules(Rules[i].Value);
        S = Left(S, 10);
    }
    // End:0x64
    else
    {
        S = LocalizeRules(Rules[i].key);
        S = Left(S, 10);
    }
    return S;
}

defaultproperties
{
    TrueString="??"
    FalseString="?? ??"
    ServerModeString="?? ??"
    DedicatedString="????"
    NonDedicatedString="???? ??"
    AdminNameString="?? ???"
    AdminEmailString="??? ???"
    PasswordString="???? ??"
    GameStatsString="UT2004 ??"
    GameSpeedString="?? ??"
    MutatorString="????"
    BalanceTeamsString="?? ? ???? ???"
    PlayersBalanceTeamsString="? ???"
    FriendlyFireString="?? ??"
    GoalScoreString="?? ??"
    TimeLimitString="?? ??"
    MinPlayersString="?? ????(?)"
    TranslocatorString="???????"
    WeaponStayString="?? ???"
    MapVotingString="? ??"
    KickVotingString="?? ??"
    ColumnHeadings=// Object reference not set to an instance of an object.
    
    InitColumnPerc=// Object reference not set to an instance of an object.
    
    ExpandLastColumn=true
}