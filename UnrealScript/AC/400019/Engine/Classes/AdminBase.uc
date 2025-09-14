class AdminBase extends Object within PlayerController
    abstract
    native;

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
    // End:0x4C
    if(Outer.Level.Game.AccessControl != none)
    {
        Manager = Outer.Level.Game.AccessControl;
    }
    //return;    
}

function DoLogin(string UserName, string Password)
{
    //return;    
}

function DoLogout()
{
    //return;    
}

function DoSwitch(string URL)
{
    Outer.Level.ServerTravel(URL, false);
    //return;    
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
    //return;    
}

function ShowCurrentMapList()
{
    local int i, C;
    local array<string> AR;

    i = Outer.MapHandler.GetGameIndex(string(Outer.Level.Game.Class));
    C = Outer.MapHandler.GetActiveList(i);
    AR = Outer.MapHandler.GetCacheMapList(Outer.Level.Game.Acronym);
    SendComplexMsg(AR, Msg_AllGameMaps @ Outer.MapHandler.GetMapListTitle(i, C));
    //return;    
}

function array<string> GetMapListNames(string GameType)
{
    local int i;
    local array<string> AR;

    i = Outer.MapHandler.GetGameIndex(GameType);
    AR = Outer.MapHandler.GetMapListNames(i);
    return AR;
    //return;    
}

function MaplistCommand(string Cmd, string Extra)
{
    local array<string> Values;
    local string str;
    local int i, C;

    // End:0x44C
    if(CanPerform("Ml"))
    {
        Cmd = Caps(Cmd);
        i = Outer.MapHandler.GetGameIndex(string(Outer.Level.Game.Class));
        switch(Cmd)
        {
            // End:0xD0
            case "LIST":
                Values = Outer.MapHandler.GetMapListNames(i);
                SendComplexMsg(Values, Repl(Msg_AllMapLists, "%gametype%", string(Outer.Level.Game.Class)));
                // End:0x44C
                break;
            // End:0x18D
            case "USED":
                // End:0x10B
                if(Extra == "")
                {
                    C = Outer.MapHandler.GetActiveList(i);                    
                }
                else
                {
                    C = int(Extra);
                }
                str = Outer.MapHandler.GetMapListTitle(i, C);
                Values = Outer.MapHandler.GetMapList(i, C);
                SendComplexMsg(Values, Repl(Msg_MapRotationList, "%maplist%", str));
                // End:0x44C
                break;
            // End:0x1FF
            case "SWITCH":
                // End:0x1CA
                if(Extra == "")
                {
                    C = Outer.MapHandler.GetActiveList(i);                    
                }
                else
                {
                    C = int(Extra);
                }
                str = Outer.MapHandler.GetMapListTitle(i, C);
            // End:0x324
            case "ADD":
                C = Outer.MapHandler.GetActiveList(i);
                Split(Extra, ",", Values);
                // End:0x28B
                if(Values.Length == 0)
                {
                    Outer.ClientMessage(Repl(Msg_NoMapsAdded, "%maplist%", Outer.MapHandler.GetMapListTitle(i, C)));                    
                }
                else
                {
                    i = Values.Length - 1;
                    J0x29A:

                    // End:0x2ED [Loop If]
                    if(i >= 0)
                    {
                        // End:0x2E3
                        if(!Outer.MapHandler.AddMap(i, C, Values[i]))
                        {
                            Values.Remove(i, 1);
                        }
                        i--;
                        // [Loop Continue]
                        goto J0x29A;
                    }
                    SendComplexMsg(Values, Msg_AddedMapToList @ Outer.MapHandler.GetMapListTitle(i, C));
                }
                // End:0x44C
                break;
            // End:0x449
            case "DEL":
                C = Outer.MapHandler.GetActiveList(i);
                Split(Extra, ",", Values);
                // End:0x3B0
                if(Values.Length == 0)
                {
                    Outer.ClientMessage(Repl(Msg_NoMapsRemoved, "%maplist%", Outer.MapHandler.GetMapListTitle(i, C)));                    
                }
                else
                {
                    i = Values.Length - 1;
                    J0x3BF:

                    // End:0x412 [Loop If]
                    if(i >= 0)
                    {
                        // End:0x408
                        if(!Outer.MapHandler.RemoveMap(i, C, Values[i]))
                        {
                            Values.Remove(i, 1);
                        }
                        i--;
                        // [Loop Continue]
                        goto J0x3BF;
                    }
                    SendComplexMsg(Values, Msg_RemovedFromList @ Outer.MapHandler.GetMapListTitle(i, C));
                }
                // End:0x44C
                break;
            // End:0xFFFF
            default:
                break;
        }
    }
    else
    {
        //return;        
    }
}

function RestartCurrentMap()
{
    Outer.Level.ServerTravel("?restart", false);
    //return;    
}

exec function PlayerList()
{
    local PlayerReplicationInfo PRI;

    // End:0x60
    if(CanPerform("Xp"))
    {
        Log(Msg_PlayerList);
        // End:0x5F
        foreach Outer.DynamicActors(Class'Engine.PlayerReplicationInfo', PRI)
        {
            Log(((PRI.PlayerName @ "( ping") @ string(PRI.Ping)) $ ")");            
        }        
    }
    //return;    
}

exec function Kick(string Cmd, string Extra)
{
    local array<string> params;
    local array<PlayerReplicationInfo> AllPRI;
    local Controller C, NextC;
    local int i;

    // End:0x36C
    if((CanPerform("Kp")) || CanPerform("Kb"))
    {
        // End:0xC9
        if(Cmd ~= "List")
        {
            Outer.Level.Game.GameReplicationInfo.GetPRIArray(AllPRI);
            i = 0;
            J0x62:

            // End:0xC7 [Loop If]
            if(i < AllPRI.Length)
            {
                Outer.ClientMessage((Right("   " $ string(AllPRI[i].PlayerID), 3) $ ")") @ AllPRI[i].PlayerName);
                i++;
                // [Loop Continue]
                goto J0x62;
            }
            return;
        }
        // End:0x101
        if((Cmd ~= "Ban") || Cmd ~= "Session")
        {
            params = SplitParams(Extra);            
        }
        else
        {
            // End:0x128
            if(Extra != "")
            {
                params = SplitParams(Cmd @ Extra);                
            }
            else
            {
                params = SplitParams(Cmd);
            }
        }
        C = Outer.Level.ControllerList;
        J0x156:

        // End:0x36C [Loop If]
        if(C != none)
        {
            NextC = C.nextController;
            // End:0x35E
            if(((C != Outer.Owner) && PlayerController(C) != none) && C.PlayerReplicationInfo != none)
            {
                i = 0;
                J0x1BC:

                // End:0x35E [Loop If]
                if(i < params.Length)
                {
                    // End:0x354
                    if(((IsNumeric(params[i])) && C.PlayerReplicationInfo.PlayerID == int(params[i])) || MaskedCompare(C.PlayerReplicationInfo.PlayerName, params[i]))
                    {
                        // End:0x29A
                        if(Cmd ~= "Ban")
                        {
                            Outer.ClientMessage(Repl(Msg_PlayerBanned, "%Player%", C.PlayerReplicationInfo.PlayerName));
                            Manager.BanPlayer(PlayerController(C));                            
                        }
                        else
                        {
                            // End:0x301
                            if(Cmd ~= "Session")
                            {
                                Outer.ClientMessage(Repl(Msg_SessionBanned, "%Player%", C.PlayerReplicationInfo.PlayerName));
                                Manager.BanPlayer(PlayerController(C), true);                                
                            }
                            else
                            {
                                Manager.KickPlayer(PlayerController(C));
                                Outer.ClientMessage(Repl(Msg_PlayerKicked, "%Player%", C.PlayerReplicationInfo.PlayerName));
                            }
                        }
                        // [Explicit Break]
                        goto J0x35E;
                    }
                    i++;
                    // [Loop Continue]
                    goto J0x1BC;
                }
            }
            J0x35E:

            C = NextC;
            // [Loop Continue]
            goto J0x156;
        }
    }
    //return;    
}

exec function KickBan(string S)
{
    Kick("ban", S);
    //return;    
}

exec function RestartMap()
{
    RestartCurrentMap();
    //return;    
}

exec function NextMap()
{
    GoToNextMap();
    //return;    
}

exec function Map(string Cmd)
{
    // End:0x32
    if(Cmd ~= "Restart")
    {
        Outer.ConsoleCommand("RestartMap");        
    }
    else
    {
        // End:0x4B
        if(Cmd ~= "Next")
        {
            GoToNextMap();            
        }
        else
        {
            // End:0x64
            if(Cmd ~= "List")
            {
                ShowCurrentMapList();                
            }
            else
            {
                DoSwitch(Cmd);
            }
        }
    }
    //return;    
}

exec function MapList(string Cmd, string Extra)
{
    MaplistCommand(Cmd, Extra);
    //return;    
}

exec function Switch(string URL)
{
    DoSwitch(URL);
    //return;    
}

protected function bool CanPerform(string priv)
{
    return Manager.CanPerform(Outer, priv);
    //return;    
}

protected function string FindGameType(string GameType)
{
    local int i;
    local array<GameRecord> Records;

    Class'Engine.CacheManager'.static.GetGameTypeList(Records);
    i = 0;
    J0x18:

    // End:0xE5 [Loop If]
    if(i < Records.Length)
    {
        // End:0x45
        if(GameType ~= Records[i].ClassName)
        {
            // [Explicit Break]
            goto J0xE5;
        }
        // End:0x62
        if(GameType ~= Records[i].GameAcronym)
        {
            // [Explicit Break]
            goto J0xE5;
        }
        // End:0x7F
        if(GameType ~= Records[i].TextName)
        {
            // [Explicit Break]
            goto J0xE5;
        }
        // End:0xAD
        if(Right(Records[i].ClassName, Len(GameType) + 1) ~= ("." $ GameType))
        {
            // [Explicit Break]
            goto J0xE5;
        }
        // End:0xDB
        if(Right(Records[i].TextName, Len(GameType) + 1) ~= ("." $ GameType))
        {
            // [Explicit Break]
            goto J0xE5;
        }
        i++;
        // [Loop Continue]
        goto J0x18;
    }
    J0xE5:

    // End:0x106
    if(i < Records.Length)
    {
        return Records[i].ClassName;
    }
    return "";
    //return;    
}

protected function SendComplexMsg(array<string> Arr, string Title)
{
    local int i, Longest;
    local string Line, Border, Prefix, Suffix;

    i = 0;
    J0x07:

    // End:0x4B [Loop If]
    if(i < Arr.Length)
    {
        // End:0x41
        if(Len(Arr[i]) > Longest)
        {
            Longest = Len(Arr[i]);
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    Longest += 8;
    Border = "";
    J0x5C:

    // End:0x80 [Loop If]
    if(Len(Border) < Longest)
    {
        Border = Border $ "-";
        // [Loop Continue]
        goto J0x5C;
    }
    Outer.ClientMessage(Title);
    Outer.ClientMessage(Border);
    i = 0;
    J0xAF:

    // End:0x167 [Loop If]
    if(i < Arr.Length)
    {
        Prefix = Right("[] " $ string(i), 4) $ ")";
        Suffix = " []";
        Line = (Prefix $ Arr[i]) $ Suffix;
        J0x106:

        // End:0x149 [Loop If]
        if(Len(Line) < Longest)
        {
            Suffix = " " $ Suffix;
            Line = (Prefix $ Arr[i]) $ Suffix;
            // [Loop Continue]
            goto J0x106;
        }
        Outer.ClientMessage(Line);
        i++;
        // [Loop Continue]
        goto J0xAF;
    }
    Outer.ClientMessage(Border);
    //return;    
}

protected function bool MaskedCompare(string SettingName, string Mask)
{
    local bool bMaskLeft, bMaskRight;
    local int MaskLen;

    // End:0x1F
    if((Mask == "*") || Mask == "**")
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
    // End:0xB2
    if(bMaskLeft)
    {
        return Left(SettingName, MaskLen - 1) ~= Left(Mask, MaskLen - 1);
    }
    // End:0xDC
    if(bMaskRight)
    {
        return Right(SettingName, MaskLen - 1) ~= Right(Mask, MaskLen - 1);
    }
    return SettingName ~= Mask;
    //return;    
}

function bool IsNumeric(string Param, optional bool bPositiveOnly)
{
    local int P;

    P = 0;
    J0x07:

    // End:0x26 [Loop If]
    if(Mid(Param, P, 1) == " ")
    {
        P++;
        // [Loop Continue]
        goto J0x07;
    }
    J0x26:

    // End:0x5C [Loop If]
    if((Mid(Param, P, 1) >= "0") && Mid(Param, P, 1) <= "9")
    {
        P++;
        // [Loop Continue]
        goto J0x26;
    }
    J0x5C:

    // End:0x7B [Loop If]
    if(Mid(Param, P, 1) == " ")
    {
        P++;
        // [Loop Continue]
        goto J0x5C;
    }
    // End:0x90
    if(Mid(Param, P) != "")
    {
        return false;
    }
    return true;
    //return;    
}

function array<string> SplitParams(string params)
{
    local array<string> Splitted;
    local string Delim;
    local int P, Start;

    J0x00:
    // End:0x160 [Loop If]
    if(params != "")
    {
        P = 0;
        J0x13:

        // End:0x32 [Loop If]
        if(Mid(params, P, 1) == " ")
        {
            P++;
            // [Loop Continue]
            goto J0x13;
        }
        // End:0x48
        if(Mid(params, P) == "")
        {
            // [Explicit Break]
            goto J0x160;
        }
        Start = P;
        // End:0xEF
        if(Mid(params, P, 1) == "\"")
        {
            P++;
            Start++;
            J0x76:

            // End:0xAB [Loop If]
            if((Mid(params, P, 1) != "") && Mid(params, P, 1) != "\"")
            {
                P++;
                // [Loop Continue]
                goto J0x76;
            }
            // End:0xEC
            if(Mid(params, P, 1) == "\"")
            {
                Splitted[Splitted.Length] = Mid(params, Start, P - Start);
                P++;
            }            
        }
        else
        {
            J0xEF:

            // End:0x126 [Loop If]
            if((Mid(params, P, 1) != "") && Mid(params, P, 1) != Delim)
            {
                P++;
                // [Loop Continue]
                goto J0xEF;
            }
            Splitted[Splitted.Length] = Mid(params, Start, P - Start);
        }
        params = Mid(params, P);
        // [Loop Continue]
        goto J0x00;
    }
    J0x160:

    return Splitted;
    //return;    
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