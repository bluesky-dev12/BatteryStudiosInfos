/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\AdminBase.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:27
 *	Functions:23
 *
 *******************************************************************************/
class AdminBase extends Object within PlayerController
    native
    abstract;

var bool bAdmin;
var AccessControl Manager;
var localized string Msg_PlayerList;
var localized string Msg_AllGameMaps;
var localized string Msg_AllMapLists;
var localized string Msg_MapRotationList;
var localized string Msg_NoMapsAdded;
var localized string Msg_AddedMapToList;
var localized string Msg_NoMapsRemoved;
var localized string Msg_RemovedFromList;
var localized string Msg_PlayerBanned;
var localized string Msg_SessionBanned;
var localized string Msg_PlayerKicked;
var localized string Msg_NextMapNotFound;
var localized string Msg_ChangingMapTo;
var localized string Msg_NoMapInRotation;
var localized string Msg_NoMapsFound;
var localized string Msg_MapIsInRotation;
var localized string Msg_MapNotInRotation;
var localized string Msg_UnknownParam;
var localized string Msg_NoParamsFound;
var localized string Msg_ParamModified;
var localized string Msg_ParamNotModified;
var localized string Msg_MapListAdded;
var localized string Msg_MapListRemoved;
var localized string Msg_MapIsNotInRotation;
var localized string Msg_EditingMapList;

function Created()
{
    // End:0x4c
    if(Outer.Level.Game.AccessControl != none)
    {
        Manager = Outer.Level.Game.AccessControl;
    }
}

function DoLogin(string UserName, string Password);
function DoLogout();
function DoSwitch(string URL)
{
    Outer.Level.ServerTravel(URL, false);
}

function GoToNextMap()
{
    // End:0x70
    if(bAdmin)
    {
        Outer.Level.Game.bChangeLevels = true;
        Outer.Level.Game.bAlreadyChanged = false;
        Outer.Level.Game.RestartGame();
    }
}

function ShowCurrentMapList()
{
    local int i, C;
    local array<string> AR;

    i = Outer.MapHandler.GetGameIndex(string(Outer.Level.Game.Class));
    C = Outer.MapHandler.GetActiveList(i);
    AR = Outer.MapHandler.GetCacheMapList(Outer.Level.Game.Acronym);
    SendComplexMsg(AR, Msg_AllGameMaps @ Outer.MapHandler.GetMapListTitle(i, C));
}

function array<string> GetMapListNames(string GameType)
{
    local int i;
    local array<string> AR;

    i = Outer.MapHandler.GetGameIndex(GameType);
    AR = Outer.MapHandler.GetMapListNames(i);
    return AR;
}

function MaplistCommand(string Cmd, string Extra)
{
    local array<string> Values;
    local string str;
    local int i, C;

    // End:0x44c
    if(CanPerform("Ml"))
    {
        Cmd = Caps(Cmd);
        i = Outer.MapHandler.GetGameIndex(string(Outer.Level.Game.Class));
        switch(Cmd)
        {
            // End:0xd0
            case "LIST":
                Values = Outer.MapHandler.GetMapListNames(i);
                SendComplexMsg(Values, Repl(Msg_AllMapLists, "%gametype%", string(Outer.Level.Game.Class)));
                // End:0x44c
                break;
            // End:0x18d
            case "USED":
                // End:0x10b
                if(Extra == "")
                {
                    C = Outer.MapHandler.GetActiveList(i);
                }
                // End:0x118
                else
                {
                    C = int(Extra);
                }
                str = Outer.MapHandler.GetMapListTitle(i, C);
                Values = Outer.MapHandler.GetMapList(i, C);
                SendComplexMsg(Values, Repl(Msg_MapRotationList, "%maplist%", str));
                // End:0x44c
                break;
            // End:0x1ff
            case "SWITCH":
                // End:0x1ca
                if(Extra == "")
                {
                    C = Outer.MapHandler.GetActiveList(i);
                }
                // End:0x1d7
                else
                {
                    C = int(Extra);
                }
                str = Outer.MapHandler.GetMapListTitle(i, C);
            // End:0x324
            case "ADD":
                C = Outer.MapHandler.GetActiveList(i);
                Split(Extra, ",", Values);
                // End:0x28b
                if(Values.Length == 0)
                {
                    Outer.ClientMessage(Repl(Msg_NoMapsAdded, "%maplist%", Outer.MapHandler.GetMapListTitle(i, C)));
                }
                // End:0x321
                else
                {
                    i = Values.Length - 1;
                    J0x29a:
                    // End:0x2ed [While If]
                    if(i >= 0)
                    {
                        // End:0x2e3
                        if(!Outer.MapHandler.AddMap(i, C, Values[i]))
                        {
                            Values.Remove(i, 1);
                        }
                        -- i;
                        // This is an implied JumpToken; Continue!
                        goto J0x29a;
                    }
                    SendComplexMsg(Values, Msg_AddedMapToList @ Outer.MapHandler.GetMapListTitle(i, C));
                }
                // End:0x44c
                break;
            // End:0x449
            case "DEL":
                C = Outer.MapHandler.GetActiveList(i);
                Split(Extra, ",", Values);
                // End:0x3b0
                if(Values.Length == 0)
                {
                    Outer.ClientMessage(Repl(Msg_NoMapsRemoved, "%maplist%", Outer.MapHandler.GetMapListTitle(i, C)));
                }
                // End:0x446
                else
                {
                    i = Values.Length - 1;
                    J0x3bf:
                    // End:0x412 [While If]
                    if(i >= 0)
                    {
                        // End:0x408
                        if(!Outer.MapHandler.RemoveMap(i, C, Values[i]))
                        {
                            Values.Remove(i, 1);
                        }
                        -- i;
                        // This is an implied JumpToken; Continue!
                        goto J0x3bf;
                    }
                    SendComplexMsg(Values, Msg_RemovedFromList @ Outer.MapHandler.GetMapListTitle(i, C));
                }
                // End:0x44c
                break;
            // End:0xffff
            default:
            }
}

function RestartCurrentMap()
{
    Outer.Level.ServerTravel("?restart", false);
}

exec function PlayerList()
{
    local PlayerReplicationInfo PRI;

    // End:0x60
    if(CanPerform("Xp"))
    {
        Log(Msg_PlayerList);
        // End:0x5f
        foreach Outer.DynamicActors(class'PlayerReplicationInfo', PRI)
        {
            Log(PRI.PlayerName @ "( ping" @ string(PRI.Ping) $ ")");                        
        }
    }
}

exec function Kick(string Cmd, string Extra)
{
    local array<string> params;
    local array<PlayerReplicationInfo> AllPRI;
    local Controller C, NextC;
    local int i;

    // End:0x36c
    if(CanPerform("Kp") || CanPerform("Kb"))
    {
        // End:0xc9
        if(Cmd ~= "List")
        {
            Outer.Level.Game.GameReplicationInfo.GetPRIArray(AllPRI);
            i = 0;
            J0x62:
            // End:0xc7 [While If]
            if(i < AllPRI.Length)
            {
                Outer.ClientMessage(Right("   " $ string(AllPRI[i].PlayerID), 3) $ ")" @ AllPRI[i].PlayerName);
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x62;
            }
            return;
        }
        // End:0x101
        if(Cmd ~= "Ban" || Cmd ~= "Session")
        {
            params = SplitParams(Extra);
        }
        // End:0x139
        else
        {
            // End:0x128
            if(Extra != "")
            {
                params = SplitParams(Cmd @ Extra);
            }
            // End:0x139
            else
            {
                params = SplitParams(Cmd);
            }
        }
        C = Outer.Level.ControllerList;
        J0x156:
        // End:0x36c [While If]
        if(C != none)
        {
            NextC = C.nextController;
            // End:0x35e
            if(C != Outer.Owner && PlayerController(C) != none && C.PlayerReplicationInfo != none)
            {
                i = 0;
                J0x1bc:
                // End:0x35e [While If]
                if(i < params.Length)
                {
                    // End:0x354
                    if(IsNumeric(params[i]) && C.PlayerReplicationInfo.PlayerID == int(params[i]) || MaskedCompare(C.PlayerReplicationInfo.PlayerName, params[i]))
                    {
                        // End:0x29a
                        if(Cmd ~= "Ban")
                        {
                            Outer.ClientMessage(Repl(Msg_PlayerBanned, "%Player%", C.PlayerReplicationInfo.PlayerName));
                            Manager.BanPlayer(PlayerController(C));
                        }
                        // End:0x351
                        else
                        {
                            // End:0x301
                            if(Cmd ~= "Session")
                            {
                                Outer.ClientMessage(Repl(Msg_SessionBanned, "%Player%", C.PlayerReplicationInfo.PlayerName));
                                Manager.BanPlayer(PlayerController(C), true);
                            }
                            // End:0x351
                            else
                            {
                                Manager.KickPlayer(PlayerController(C));
                                Outer.ClientMessage(Repl(Msg_PlayerKicked, "%Player%", C.PlayerReplicationInfo.PlayerName));
                            }
                        }
                    }
                    // End:0x35e
                    else
                    {
                        ++ i;
                        // This is an implied JumpToken; Continue!
                        goto J0x1bc;
                    }
                }
            }
            C = NextC;
            // This is an implied JumpToken; Continue!
            goto J0x156;
        }
    }
}

exec function KickBan(string S)
{
    Kick("ban", S);
}

exec function RestartMap()
{
    RestartCurrentMap();
}

exec function NextMap()
{
    GoToNextMap();
}

exec function Map(string Cmd)
{
    // End:0x32
    if(Cmd ~= "Restart")
    {
        Outer.ConsoleCommand("RestartMap");
    }
    // End:0x6f
    else
    {
        // End:0x4b
        if(Cmd ~= "Next")
        {
            GoToNextMap();
        }
        // End:0x6f
        else
        {
            // End:0x64
            if(Cmd ~= "List")
            {
                ShowCurrentMapList();
            }
            // End:0x6f
            else
            {
                DoSwitch(Cmd);
            }
        }
    }
}

exec function MapList(string Cmd, string Extra)
{
    MaplistCommand(Cmd, Extra);
}

exec function Switch(string URL)
{
    DoSwitch(URL);
}

protected function bool CanPerform(string priv)
{
    return Manager.CanPerform(Outer, priv);
}

protected function string FindGameType(string GameType)
{
    local int i;
    local array<GameRecord> Records;

    class'CacheManager'.static.GetGameTypeList(Records);
    i = 0;
    J0x18:
    // End:0xe5 [While If]
    if(i < Records.Length)
    {
        // End:0x45
        if(GameType ~= Records[i].ClassName)
        {
        }
        // End:0xe5
        else
        {
            // End:0x62
            if(GameType ~= Records[i].GameAcronym)
            {
            }
            // End:0xe5
            else
            {
                // End:0x7f
                if(GameType ~= Records[i].TextName)
                {
                }
                // End:0xe5
                else
                {
                    // End:0xad
                    if(Right(Records[i].ClassName, Len(GameType) + 1) ~= "." $ GameType)
                    {
                    }
                    // End:0xe5
                    else
                    {
                        // End:0xdb
                        if(Right(Records[i].TextName, Len(GameType) + 1) ~= "." $ GameType)
                        {
                        }
                        // End:0xe5
                        else
                        {
                            ++ i;
                            // This is an implied JumpToken; Continue!
                            goto J0x18;
                        }
                    }
                }
            }
        }
    }
    // End:0x106
    if(i < Records.Length)
    {
        return Records[i].ClassName;
    }
    return "";
}

protected function SendComplexMsg(array<string> Arr, string Title)
{
    local int i, Longest;
    local string Line, Border, Prefix, Suffix;

    i = 0;
    J0x07:
    // End:0x4b [While If]
    if(i < Arr.Length)
    {
        // End:0x41
        if(Len(Arr[i]) > Longest)
        {
            Longest = Len(Arr[i]);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    Longest += 8;
    Border = "";
    J0x5c:
    // End:0x80 [While If]
    if(Len(Border) < Longest)
    {
        Border = Border $ "-";
        // This is an implied JumpToken; Continue!
        goto J0x5c;
    }
    Outer.ClientMessage(Title);
    Outer.ClientMessage(Border);
    i = 0;
    J0xaf:
    // End:0x167 [While If]
    if(i < Arr.Length)
    {
        Prefix = Right("[] " $ string(i), 4) $ ")";
        Suffix = " []";
        Line = Prefix $ Arr[i] $ Suffix;
        J0x106:
        // End:0x149 [While If]
        if(Len(Line) < Longest)
        {
            Suffix = " " $ Suffix;
            Line = Prefix $ Arr[i] $ Suffix;
            // This is an implied JumpToken; Continue!
            goto J0x106;
        }
        Outer.ClientMessage(Line);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xaf;
    }
    Outer.ClientMessage(Border);
}

protected function bool MaskedCompare(string SettingName, string Mask)
{
    local bool bMaskLeft, bMaskRight;
    local int MaskLen;

    // End:0x1f
    if(Mask == "*" || Mask == "**")
    {
        return true;
    }
    MaskLen = Len(Mask);
    bMaskLeft = Left(Mask, 1) == "*";
    bMaskRight = Right(Mask, 1) == "*";
    // End:0x88
    if(bMaskLeft && bMaskRight)
    {
        return InStr(Caps(SettingName), Mid(Caps(Mask), 1, MaskLen - 2)) >= 0;
    }
    // End:0xb2
    if(bMaskLeft)
    {
        return Left(SettingName, MaskLen - 1) ~= Left(Mask, MaskLen - 1);
    }
    // End:0xdc
    if(bMaskRight)
    {
        return Right(SettingName, MaskLen - 1) ~= Right(Mask, MaskLen - 1);
    }
    return SettingName ~= Mask;
}

function bool IsNumeric(string Param, optional bool bPositiveOnly)
{
    local int P;

    P = 0;
    J0x07:
    // End:0x26 [While If]
    if(Mid(Param, P, 1) == " ")
    {
        ++ P;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    J0x26:
    // End:0x5c [While If]
    if(Mid(Param, P, 1) >= "0" && Mid(Param, P, 1) <= "9")
    {
        ++ P;
        // This is an implied JumpToken; Continue!
        goto J0x26;
    }
    J0x5c:
    // End:0x7b [While If]
    if(Mid(Param, P, 1) == " ")
    {
        ++ P;
        // This is an implied JumpToken; Continue!
        goto J0x5c;
    }
    // End:0x90
    if(Mid(Param, P) != "")
    {
        return false;
    }
    return true;
}

function array<string> SplitParams(string params)
{
    local array<string> Splitted;
    local string Delim;
    local int P, Start;

    // End:0x160 [While If]
    if(params != "")
    {
        J0x00:
        P = 0;
        J0x13:
        // End:0x32 [While If]
        if(Mid(params, P, 1) == " ")
        {
            ++ P;
            // This is an implied JumpToken; Continue!
            goto J0x13;
        }
        // End:0x48
        if(Mid(params, P) == "")
        {
        }
        // End:0x160
        else
        {
            Start = P;
            // End:0xef
            if(Mid(params, P, 1) == "\\"")
            {
                ++ P;
                ++ Start;
                J0x76:
                // End:0xab [While If]
                if(Mid(params, P, 1) != "" && Mid(params, P, 1) != "\\"")
                {
                    ++ P;
                    // This is an implied JumpToken; Continue!
                    goto J0x76;
                }
                // End:0xec
                if(Mid(params, P, 1) == "\\"")
                {
                    Splitted[Splitted.Length] = Mid(params, Start, P - Start);
                    ++ P;
                }
            }
            // End:0x14b
            else
            {
                J0xef:
                // End:0x126 [While If]
                if(Mid(params, P, 1) != "" && Mid(params, P, 1) != Delim)
                {
                    ++ P;
                    // This is an implied JumpToken; Continue!
                    goto J0xef;
                }
                Splitted[Splitted.Length] = Mid(params, Start, P - Start);
            }
            params = Mid(params, P);
            // This is an implied JumpToken; Continue!
            goto J0x00;
        }
    }
    return Splitted;
}

defaultproperties
{
    Msg_PlayerList="Player List:"
    Msg_AllGameMaps="Available maps (can add more)"
    Msg_AllMapLists="Available maps for %gametype% games"
    Msg_MapRotationList="Maps active in the %maplist% maplist."
    Msg_NoMapsAdded="No maps to add to the %maplist% maplist."
    Msg_AddedMapToList="Maps successfully added to the maplist."
    Msg_NoMapsRemoved="No maps to delete from the %maplist% maplist."
    Msg_RemovedFromList="Map(s) successfully removed from the maplist."
    Msg_PlayerBanned="%Player% was banned from the server."
    Msg_SessionBanned="%Player% was banned from this match."
    Msg_PlayerKicked="%Player% was kicked."
    Msg_NextMapNotFound="The next map in the list could not be found. The game will restart using the same map."
    Msg_ChangingMapTo="Changing map to %NextMap%."
    Msg_NoMapInRotation="No maps are listed in the %maplist% maplist."
    Msg_NoMapsFound="A matching map in the %maplist% maplist was not found."
    Msg_MapIsInRotation="Matching map on the %maplist% maplist found."
    Msg_MapNotInRotation="Matching map on the %maplist% maplist not found."
    Msg_UnknownParam="Unknown parameter: %Value%"
    Msg_NoParamsFound="Parameter not found."
    Msg_ParamModified="Change complete."
    Msg_ParamNotModified="Parameter could not be changed."
    Msg_MapListAdded="The %listname% maplist was successfully added to the game type."
    Msg_MapListRemoved="The %listname% maplist was successfully removed from the game type."
    Msg_EditingMapList="Maplist is currently being edited"
}