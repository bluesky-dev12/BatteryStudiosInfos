class AdminIni extends AdminBase within PlayerController;

var AccessControlIni xManager;
var wAdminUser AdminUser;
var GameConfigSet ConfigSet;
var protected string NextMutators;
var protected string NextGameType;
var localized string Msg_FinishGameEditFirst;
var localized string Msg_FinishGameRestart;
var localized string Msg_MutNeedGameEdit;
var localized string Msg_NoMutatorInUse;
var localized string Msg_NoUnusedMuts;
var localized string Msg_AddedMutator;
var localized string Msg_ErrAddingMutator;
var localized string Msg_RemovedMutator;
var localized string Msg_ErrRemovingMutator;
var localized string Msg_MapListNeedGameEdit;
var localized string Msg_MustEndGameEdit;
var localized string Msg_EditingClass;
var localized string Msg_EditFailed;
var localized string Msg_AlreadyEdited;
var localized string Msg_NotEditing;
var localized string Msg_EditingCompleted;
var localized string Msg_EditingCancelled;
var localized string Msg_NoBotGameFull;
var localized string Msg_NoAddNamedBot;
var localized string Msg_NoBotsPlaying;
var localized string Msg_GameNoSupportBots;
var localized string Msg_StatsNoBots;
var localized string Msg_SetBotNeedVal;

event Created()
{
    super.Created();
    xManager = AccessControlIni(Manager);
    //return;    
}

function DoLogin(string UserName, string Password)
{
    // End:0x69
    if((AdminUser == none) && xManager.AdminLogin(Outer, UserName, Password))
    {
        bAdmin = true;
        AdminUser = xManager.GetLoggedAdmin(Outer);
        xManager.AdminEntered(Outer, UserName);
    }
    //return;    
}

function DoLogout()
{
    // End:0x48
    if(xManager.AdminLogout(Outer))
    {
        xManager.ReleaseConfigSet(ConfigSet, self);
        xManager.AdminExited(Outer);
        bAdmin = false;
    }
    //return;    
}

function RestartCurrentMap()
{
    // End:0x4E
    if((CanPerform("Mr")) || CanPerform("Mc"))
    {
        // End:0x3A
        if(ConfigSet == none)
        {
            DoSwitch("?restart");            
        }
        else
        {
            Outer.ClientMessage(Msg_FinishGameEditFirst);
        }
    }
    //return;    
}

function DoSwitch(string URL)
{
    // End:0x10D
    if(CanPerform("Mc"))
    {
        // End:0xF9
        if(ConfigSet == none)
        {
            // End:0x75
            if((NextGameType != "") && Outer.Level.Game.ParseOption(URL, "Game") == "")
            {
                URL = (URL $ "?Game=") $ NextGameType;
            }
            // End:0xD8
            if((NextMutators != "") && Outer.Level.Game.ParseOption(URL, "Mutator") == "")
            {
                URL = (URL $ "?Mutator=") $ NextMutators;
            }
            Outer.Level.ServerTravel(URL, false);            
        }
        else
        {
            Outer.ClientMessage(Msg_FinishGameRestart);
        }
    }
    //return;    
}

function GoToNextMap()
{
    local string NextMap;
    local MapList MyList;
    local GameInfo G;

    // End:0x193
    if(CanPerform("Mc"))
    {
        // End:0x17F
        if(ConfigSet == none)
        {
            G = Outer.Level.Game;
            // End:0x145
            if((G.bChangeLevels && !G.bAlreadyChanged) && G.MapListType != "")
            {
                G.bAlreadyChanged = true;
                MyList = G.GetMapList(G.MapListType);
                // End:0xD4
                if(MyList != none)
                {
                    NextMap = MyList.GetNextMap();
                    MyList.Destroy();
                }
                // End:0x106
                if(NextMap == "")
                {
                    NextMap = Outer.GetMapName(G.MapPrefix, NextMap, 1);
                }
                // End:0x145
                if(NextMap != "")
                {
                    DoSwitch(NextMap);
                    Outer.ClientMessage(Repl(Msg_ChangingMapTo, "%NextMap%", NextMap));
                    return;
                }
            }
            Outer.ClientMessage(Msg_NextMapNotFound);
            Outer.Level.ServerTravel("?Restart", false);            
        }
        else
        {
            Outer.ClientMessage(Msg_FinishGameEditFirst);
        }
    }
    //return;    
}

exec function User(string Cmd, string Extra)
{
    // End:0x1E
    if(Cmd ~= "List")
    {
        SendUserList(Extra);        
    }
    else
    {
        // End:0x30
        if(Cmd ~= "Del")
        {            
        }
        else
        {
            // End:0x48
            if(Cmd ~= "Logged")
            {
                SendLoggedList();
            }
        }
    }
    //return;    
}

exec function Mutators(string Cmd, string Extra)
{
    local array<string> Values;
    local int i;

    // End:0x2C1
    if(CanPerform("Mu"))
    {
        // End:0x2E
        if(ConfigSet == none)
        {
            Outer.ClientMessage(Msg_MutNeedGameEdit);
            return;
        }
        // End:0xBE
        if(Cmd ~= "Used")
        {
            Values = ConfigSet.GetUsedMutators();
            i = 0;
            J0x5A:

            // End:0x9C [Loop If]
            if(i < Values.Length)
            {
                Outer.ClientMessage((string(i) $ ")") @ Values[i]);
                i++;
                // [Loop Continue]
                goto J0x5A;
            }
            // End:0xBB
            if(i == 0)
            {
                Outer.ClientMessage(Msg_NoMutatorInUse);
            }            
        }
        else
        {
            // End:0x150
            if(Cmd ~= "Unused")
            {
                Values = ConfigSet.GetUnusedMutators();
                i = 0;
                J0xEC:

                // End:0x12E [Loop If]
                if(i < Values.Length)
                {
                    Outer.ClientMessage((string(i) $ ")") @ Values[i]);
                    i++;
                    // [Loop Continue]
                    goto J0xEC;
                }
                // End:0x14D
                if(i == 0)
                {
                    Outer.ClientMessage(Msg_NoUnusedMuts);
                }                
            }
            else
            {
                // End:0x20A
                if(Cmd ~= "Add")
                {
                    Split(Extra, " ", Values);
                    i = 0;
                    J0x175:

                    // End:0x207 [Loop If]
                    if(i < Values.Length)
                    {
                        // End:0x1D1
                        if(ConfigSet.AddMutator(Values[i]))
                        {
                            Outer.ClientMessage(Repl(Msg_AddedMutator, "%Mutator%", Values[i]));
                            // [Explicit Continue]
                            goto J0x1FD;
                        }
                        Outer.ClientMessage(Repl(Msg_ErrAddingMutator, "%Mutator%", Values[i]));
                        J0x1FD:

                        i++;
                        // [Loop Continue]
                        goto J0x175;
                    }                    
                }
                else
                {
                    // End:0x2C1
                    if(Cmd ~= "Del")
                    {
                        Split(Extra, " ", Values);
                        i = 0;
                        J0x22F:

                        // End:0x2C1 [Loop If]
                        if(i < Values.Length)
                        {
                            // End:0x28B
                            if(ConfigSet.DelMutator(Values[i]))
                            {
                                Outer.ClientMessage(Repl(Msg_RemovedMutator, "%Mutator%", Values[i]));
                                // [Explicit Continue]
                                goto J0x2B7;
                            }
                            Outer.ClientMessage(Repl(Msg_ErrRemovingMutator, "%Mutator%", Values[i]));
                            J0x2B7:

                            i++;
                            // [Loop Continue]
                            goto J0x22F;
                        }
                    }
                }
            }
        }
    }
    //return;    
}

function MaplistCommand(string Cmd, string Extra)
{
    local array<string> Values, tmp;
    local string str;
    local int i, C;

    // End:0x80D
    if(CanPerform("Ml"))
    {
        Cmd = Caps(Cmd);
        // End:0x1E5
        if(ConfigSet == none)
        {
            i = Outer.MapHandler.GetGameIndex(string(Outer.Level.Game.Class));
            // End:0x97
            if(Extra == "")
            {
                C = Outer.MapHandler.GetActiveList(i);                
            }
            else
            {
                C = int(Extra);
            }
            str = Outer.MapHandler.GetMapListTitle(i, C);
            switch(Cmd)
            {
                // End:0x142
                case "LIST":
                    Values = Outer.MapHandler.GetMapListNames(i);
                    SendComplexMsg(Values, Repl(Msg_AllMapLists, "%gametype%", string(Outer.Level.Game.Class)));
                    // End:0x1E2
                    break;
                // End:0x198
                case "USED":
                    Values = Outer.MapHandler.GetMapList(i, C);
                    SendComplexMsg(Values, Repl(Msg_MapRotationList, "%maplist%", str));
                    // End:0x1E2
                    break;
                // End:0x1C8
                case "SWITCH":
                    Outer.MapHandler.ApplyMapList(i, C);
                    // End:0x1E2
                    break;
                // End:0xFFFF
                default:
                    Outer.ClientMessage(Msg_MapListNeedGameEdit);
                    // End:0x1E2
                    break;
                    break;
            }            
        }
        else
        {
            i = Outer.MapHandler.GetGameIndex(ConfigSet.GetEditedClass());
            switch(Cmd)
            {
                // End:0x2D4
                case "LIST":
                    // End:0x270
                    if(Extra == "")
                    {
                        Values = ConfigSet.GetLists();
                        SendComplexMsg(Values, "MapLists for" @ ConfigSet.GetEditedClass());                        
                    }
                    else
                    {
                        Values = ConfigSet.GetMaps();
                        str = Outer.MapHandler.GetMapListTitle(i, int(Extra));
                        SendComplexMsg(Values, Repl(Msg_MapRotationList, "%maplist%", str));
                    }
                    // End:0x80D
                    break;
                // End:0x36B
                case "USED":
                    str = Repl(Msg_MapRotationList, "%maplist%", Outer.MapHandler.GetMapListTitle(i, ConfigSet.CurrentMapList));
                    Values = ConfigSet.GetMaps();
                    // End:0x354
                    if(Values.Length > 0)
                    {
                        SendComplexMsg(Values, str);                        
                    }
                    else
                    {
                        Outer.ClientMessage(Msg_NoMapInRotation);
                    }
                    // End:0x80D
                    break;
                // End:0x38D
                case "SWITCH":
                    Outer.ClientMessage(Msg_MustEndGameEdit);
                    // End:0x80D
                    break;
                // End:0x41B
                case "EDIT":
                    // End:0x3B9
                    if(Extra == "")
                    {
                        Extra = string(ConfigSet.GetActiveList());
                    }
                    ConfigSet.CurrentMapList = int(Extra);
                    Outer.ClientMessage(Repl(Msg_EditingMapList, "%List%", Outer.MapHandler.GetMapListTitle(i, ConfigSet.CurrentMapList)));
                    // End:0x80D
                    break;
                // End:0x440
                case "ENDEDIT":
                    ConfigSet.EndEdit(bool(Extra));
                    // End:0x80D
                    break;
                // End:0x4BA
                case "NEW":
                    str = ConfigSet.GetEditedClass();
                    Outer.MapHandler.AddList(str, Extra, Values);
                    Outer.ClientMessage((Repl(Msg_MapListAdded, "%listname%", Extra) @ str) $ ".");
                    // End:0x80D
                    break;
                // End:0x561
                case "REMOVE":
                    str = Outer.MapHandler.GetMapListTitle(i, ConfigSet.CurrentMapList);
                    Outer.MapHandler.RemoveList(i, ConfigSet.CurrentMapList);
                    Outer.ClientMessage((Repl(Msg_MapListRemoved, "%listname%", str) @ ConfigSet.GetEditedClass()) $ ".");
                    // End:0x80D
                    break;
                // End:0x5F2
                case "ADD":
                    Values = ConfigSet.AddMaps(Extra);
                    // End:0x5B2
                    if(Values.Length == 0)
                    {
                        Outer.ClientMessage((Msg_NoMapsAdded @ str) $ ".");                        
                    }
                    else
                    {
                        SendComplexMsg(Values, Msg_AddedMapToList @ Outer.MapHandler.GetMapListTitle(i, ConfigSet.CurrentMapList));
                    }
                    // End:0x80D
                    break;
                // End:0x6B4
                case "DEL":
                    str = Outer.MapHandler.GetMapListTitle(i, ConfigSet.CurrentMapList);
                    Values = ConfigSet.RemoveMaps(Extra);
                    // End:0x674
                    if(Values.Length == 0)
                    {
                        Outer.ClientMessage((Msg_NoMapsRemoved @ str) $ ".");                        
                    }
                    else
                    {
                        SendComplexMsg(Values, Msg_RemovedFromList @ Outer.MapHandler.GetMapListTitle(i, ConfigSet.CurrentMapList));
                    }
                    // End:0x80D
                    break;
                // End:0x80A
                case "FIND":
                    str = Outer.MapHandler.GetMapListTitle(i, ConfigSet.CurrentMapList);
                    Values = ConfigSet.FindMaps(Extra);
                    i = 0;
                    J0x70F:

                    // End:0x782 [Loop If]
                    if(i < Values.Length)
                    {
                        // End:0x75E
                        if(Left(Values[i], 1) != "+")
                        {
                            tmp[tmp.Length] = Values[i];
                            Values.Remove(i--, 1);
                            // [Explicit Continue]
                            goto J0x778;
                        }
                        Values[i] = Mid(Values[i], 1);
                        J0x778:

                        i++;
                        // [Loop Continue]
                        goto J0x70F;
                    }
                    // End:0x7B3
                    if(Values.Length > 0)
                    {
                        SendComplexMsg(Values, Repl(Msg_MapIsInRotation, "%maplist%", str));                        
                    }
                    else
                    {
                        Outer.ClientMessage(Repl(Msg_NoMapsFound, "%maplist%", str));
                    }
                    // End:0x807
                    if(tmp.Length > 0)
                    {
                        SendComplexMsg(tmp, Repl(Msg_MapIsNotInRotation, "%maplist%", str));
                    }
                    // End:0x80D
                    break;
                // End:0xFFFF
                default:
                    break;
            }
        }
    }
    else
    {
        //return;        
    }
}

exec function Game(string Cmd, string Extra)
{
    local array<string> params;
    local string LastParam, LastValue;
    local int P;

    // End:0x55
    if(Cmd ~= "ChangeTo")
    {
        // End:0x53
        if(CanPerform("Mt"))
        {
            // End:0x42
            if(ConfigSet != none)
            {
                Outer.ClientMessage(Msg_MustEndGameEdit);
                return;
            }
            NextGameType = FindGameType(Extra);
        }
        return;
    }
    // End:0x66
    if(!CanPerform("Ms"))
    {
        return;
    }
    // End:0x118
    if(Cmd ~= "Edit")
    {
        // End:0x102
        if(xManager.LockConfigSet(ConfigSet, self))
        {
            // End:0xD6
            if(ConfigSet.StartEdit(Extra))
            {
                Outer.ClientMessage(Repl(Msg_EditingClass, "%Class%", ConfigSet.GetEditedClass()));                
            }
            else
            {
                Outer.ClientMessage(Msg_EditFailed);
                xManager.ReleaseConfigSet(ConfigSet, self);
            }            
        }
        else
        {
            Outer.ClientMessage(Msg_AlreadyEdited);
        }
        return;
    }
    // End:0x139
    if(ConfigSet == none)
    {
        Outer.ClientMessage(Msg_NotEditing);
        return;
    }
    // End:0x19C
    if(Cmd ~= "EndEdit")
    {
        ConfigSet.EndEdit(true);
        NextMutators = ConfigSet.NextMutators;
        xManager.ReleaseConfigSet(ConfigSet, self);
        Outer.ClientMessage(Msg_EditingCompleted);        
    }
    else
    {
        // End:0x1EE
        if(Cmd ~= "CancelEdit")
        {
            ConfigSet.EndEdit(false);
            xManager.ReleaseConfigSet(ConfigSet, self);
            Outer.ClientMessage(Msg_EditingCancelled);            
        }
        else
        {
            // End:0x329
            if(Cmd ~= "Get")
            {
                // End:0x297
                if((InStr(Extra, "*") == -1) && InStr(Extra, " ") == -1)
                {
                    LastValue = ConfigSet.GetNamedParam(Extra);
                    // End:0x274
                    if(LastValue == "")
                    {
                        Outer.ClientMessage(Repl(Msg_UnknownParam, "%Value%", Extra));                        
                    }
                    else
                    {
                        Outer.ClientMessage((Extra @ "=") @ LastValue);
                    }                    
                }
                else
                {
                    params = ConfigSet.GetMaskedParams(Extra);
                    // End:0x2D4
                    if(params.Length == 0)
                    {
                        Outer.ClientMessage(Msg_NoParamsFound);                        
                    }
                    else
                    {
                        P = 0;
                        J0x2DB:

                        // End:0x326 [Loop If]
                        if(P < params.Length)
                        {
                            Outer.ClientMessage((params[P] @ "=") @ params[P + 1]);
                            P += 2;
                            // [Loop Continue]
                            goto J0x2DB;
                        }
                    }
                }                
            }
            else
            {
                // End:0x3C0
                if(Cmd ~= "Set")
                {
                    P = InStr(Extra, " ");
                    // End:0x3AC
                    if(P >= 0)
                    {
                        LastParam = Left(Extra, P);
                        LastValue = Mid(Extra, P + 1);
                        // End:0x3AC
                        if(ConfigSet.SetNamedParam(LastParam, LastValue))
                        {
                            Outer.ClientMessage(Msg_ParamModified);
                            return;
                        }
                    }
                    Outer.ClientMessage(Msg_ParamNotModified);
                }
            }
        }
    }
    //return;    
}

protected function bool CanPerform(string priv)
{
    return (AdminUser != none) && AdminUser.HasPrivilege(priv);
    //return;    
}

protected function SendUserList(string Mask)
{
    local wAdminUserList uList;
    local int i;

    uList = AdminUser.GetManagedUsers(xManager.Groups);
    i = 0;
    J0x2A:

    // End:0x82 [Loop If]
    if(i < uList.Count())
    {
        Outer.ClientMessage(string(i) $ uList.Get(i).UserName);
        i++;
        // [Loop Continue]
        goto J0x2A;
    }
    //return;    
}

protected function SendLoggedList()
{
    local wAdminUserList uList;
    local int i;

    uList = AdminUser.GetManagedUsers(xManager.Groups);
    i = 0;
    J0x2A:

    // End:0xA8 [Loop If]
    if(i < uList.Count())
    {
        // End:0x9E
        if(xManager.IsLogged(uList.Get(i)))
        {
            Outer.ClientMessage(string(i) $ uList.Get(i).UserName);
        }
        i++;
        // [Loop Continue]
        goto J0x2A;
    }
    //return;    
}

exec function Bots(string Cmd, string Extra)
{
    local int MinV, i, j;
    local array<string> params;
    local array<PlayerRecord> BotList, BotsToAdd;
    local DeathMatch Game;
    local Controller C, NextC;
    local wBot Bot;

    // End:0x486
    if(CanPerform("Mb"))
    {
        Game = DeathMatch(Outer.Level.Game);
        // End:0x50
        if(Game == none)
        {
            Outer.ClientMessage(Msg_GameNoSupportBots);
            return;
        }
        // End:0x7A
        if(Game.GameStats != none)
        {
            Outer.ClientMessage(Msg_StatsNoBots);
            return;
        }
        params = SplitParams(Extra);
        // End:0x27B
        if(Cmd ~= "Add")
        {
            MinV = Game.MinPlayers;
            // End:0xD0
            if(MinV == 32)
            {
                Outer.ClientMessage(Msg_NoBotGameFull);
                return;
            }
            // End:0xEE
            if(params.Length == 0)
            {
                Game.ForceAddBot();                
            }
            else
            {
                // End:0x153
                if((params.Length == 1) && IsNumeric(params[0]))
                {
                    MinV = Min(32, MinV + int(params[0]));
                    J0x126:

                    // End:0x150 [Loop If]
                    if(Game.MinPlayers < MinV)
                    {
                        Game.ForceAddBot();
                        // [Loop Continue]
                        goto J0x126;
                    }                    
                }
                else
                {
                    // End:0x17F
                    if(!Game.IsInState('MatchInProgress'))
                    {
                        Outer.ClientMessage(Msg_NoAddNamedBot);
                        return;
                    }
                    MakeBotsList(BotList);
                    i = 0;
                    J0x191:

                    // End:0x21B [Loop If]
                    if(i < BotList.Length)
                    {
                        j = 0;
                        J0x1A8:

                        // End:0x211 [Loop If]
                        if(j < params.Length)
                        {
                            // End:0x207
                            if(MaskedCompare(BotList[i].DefaultName, params[j]))
                            {
                                BotsToAdd[BotsToAdd.Length] = BotList[i];
                                BotList.Remove(i, 1);
                                i--;
                            }
                            j++;
                            // [Loop Continue]
                            goto J0x1A8;
                        }
                        i++;
                        // [Loop Continue]
                        goto J0x191;
                    }
                    MinV = Min(32, MinV + BotsToAdd.Length);
                    J0x232:

                    // End:0x278 [Loop If]
                    if(Game.MinPlayers < MinV)
                    {
                        // End:0x26D
                        if(!Game.AddBot(BotsToAdd[0].DefaultName))
                        {
                            // [Explicit Break]
                            goto J0x278;
                        }
                        BotsToAdd.Remove(0, 1);
                        // [Loop Continue]
                        goto J0x232;
                    }
                }
            }
            J0x278:
            
        }
        else
        {
            // End:0x418
            if(Cmd ~= "Kill")
            {
                // End:0x2CB
                if((Game.MinPlayers == 0) || Game.NumBots == 0)
                {
                    Outer.ClientMessage(Msg_NoBotsPlaying);
                    return;
                }
                // End:0x2EA
                if(params.Length == 0)
                {
                    Game.KillBots(1);                    
                }
                else
                {
                    // End:0x323
                    if((params.Length == 1) && IsNumeric(params[0]))
                    {
                        Game.KillBots(int(params[0]));                        
                    }
                    else
                    {
                        C = Outer.Level.ControllerList;
                        J0x340:

                        // End:0x415 [Loop If]
                        if(C != none)
                        {
                            Bot = wBot(C);
                            NextC = C.nextController;
                            // End:0x407
                            if((Bot != none) && Bot.PlayerReplicationInfo != none)
                            {
                                i = 0;
                                J0x397:

                                // End:0x407 [Loop If]
                                if(i < params.Length)
                                {
                                    // End:0x3FD
                                    if(MaskedCompare(Bot.PlayerReplicationInfo.PlayerName, params[i]))
                                    {
                                        // End:0x3FA
                                        if(C.IsA('Bot'))
                                        {
                                            Game.Kill(C);
                                        }
                                        // [Explicit Break]
                                        goto J0x407;
                                    }
                                    i++;
                                    // [Loop Continue]
                                    goto J0x397;
                                }
                            }
                            J0x407:

                            C = NextC;
                            // [Loop Continue]
                            goto J0x340;
                        }
                    }
                }                
            }
            else
            {
                // End:0x486
                if(Cmd ~= "Set")
                {
                    // End:0x472
                    if(((params.Length == 1) && IsNumeric(params[0])) && int(params[0]) < 33)
                    {
                        Game.MinPlayers = int(params[0]);                        
                    }
                    else
                    {
                        Outer.ClientMessage(Msg_SetBotNeedVal);
                    }
                }
            }
        }
    }
    //return;    
}

function MakeBotsList(out array<PlayerRecord> BotList)
{
    local wBot Bot;
    local int i;
    local Controller C;

    Class'WGame.wUtil'.static.GetPlayerList(BotList);
    C = Outer.Level.ControllerList;
    J0x2E:

    // End:0xDD [Loop If]
    if(C != none)
    {
        Bot = wBot(C);
        // End:0xC6
        if((Bot != none) && Bot.PlayerReplicationInfo != none)
        {
            i = 0;
            J0x71:

            // End:0xC6 [Loop If]
            if(i < BotList.Length)
            {
                // End:0xBC
                if(Bot.PlayerReplicationInfo.CharacterName == BotList[i].DefaultName)
                {
                    BotList.Remove(i, 1);
                    // [Explicit Break]
                    goto J0xC6;
                }
                i++;
                // [Loop Continue]
                goto J0x71;
            }
        }
        J0xC6:

        C = C.nextController;
        // [Loop Continue]
        goto J0x2E;
    }
    //return;    
}

defaultproperties
{
    Msg_FinishGameEditFirst="?? ????? ?? ?? ??? ??? ???."
    Msg_FinishGameRestart="?? ????? ??? ?? ?? ??? ??? ???."
    Msg_MutNeedGameEdit="'???' ??? ?? '?? ??' ???? ?????."
    Msg_NoMutatorInUse="?? ?? ????? ????."
    Msg_NoUnusedMuts="?? ?? ????? ?????."
    Msg_AddedMutator="'%Mutator%'? ??? ???? ???? ?????."
    Msg_ErrAddingMutator="'%Mutator%'? ??? ???? ???? ???? ?? ??? ???????."
    Msg_RemovedMutator="'%Mutator%'? ???? ????? ?????."
    Msg_ErrRemovingMutator="'%Mutator%'? ???? ????? ???? ?? ??? ???????."
    Msg_MapListNeedGameEdit="'????' ??? ???? ?? '?? ??'??? ?????."
    Msg_MustEndGameEdit="?? ?? ??? ?????."
    Msg_EditingClass="%Class% ?? ?."
    Msg_EditFailed="?? ??."
    Msg_AlreadyEdited="?? ?? ??? ??? ???? ????."
    Msg_NotEditing="?? ??? ???? ?? ????. ?? '?? ??'? ?????."
    Msg_EditingCompleted="?? ??"
    Msg_EditingCancelled="?? ??"
    Msg_NoBotGameFull="????? ????? ??? ?? ??? ? ????."
    Msg_NoAddNamedBot="??? ???? ??? ??? ?? ??? ? ????"
    Msg_NoBotsPlaying="?? ??? ?? ?? ????"
    Msg_GameNoSupportBots="??? ?? ??? ?? ???? ????"
    Msg_StatsNoBots="??? ?? ????? ?? ???? ????"
    Msg_SetBotNeedVal="? ??? 0?? 32? ??? ????"
    Msg_PlayerList="???? ???:"
    Msg_AllGameMaps="??? ?(?? ??)"
    Msg_AllMapLists="%gametype%? ?? ????? ????."
    Msg_MapRotationList="???? %maplist%? ???."
    Msg_NoMapsAdded="???? %maplist%? ?? ???? ?????."
    Msg_AddedMapToList="?? ????? ????? ???????."
    Msg_NoMapsRemoved="???? %maplist%?? ?? ???? ?????."
    Msg_PlayerBanned="? ???? %Player%?? ??? ?????."
    Msg_SessionBanned="?? ???? %Player%?? ??? ?????."
    Msg_PlayerKicked="%Player%?? ???????."
    Msg_NextMapNotFound="??? ? ?? ? ????; ?? ??? ??????."
    Msg_ChangingMapTo="?? %Next Map%?? ?????."
    Msg_NoMapInRotation="%maplist%? ?? ???? ?????."
    Msg_NoMapsFound="???? %maplist%?? ?? ?? ???? ????."
    Msg_MapIsInRotation="?? %maplist% ?"
    Msg_MapNotInRotation="%maplist%? ??? ?? ?? ?."
    Msg_UnknownParam="???? ?? ????: %Value%"
    Msg_NoParamsFound="???? ?? ????!"
    Msg_ParamModified="????? ???????."
    Msg_ParamNotModified="????? ??? ? ????"
    Msg_MapListAdded="?? ??? %listname% ????? ????? ???????."
    Msg_MapListRemoved="?? ??? %listname% ????? ????? ???????."
    Msg_EditingMapList="???? ?? ?"
}