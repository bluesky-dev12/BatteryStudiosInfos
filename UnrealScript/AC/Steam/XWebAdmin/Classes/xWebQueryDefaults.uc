/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XWebAdmin\Classes\xWebQueryDefaults.uc
 * Package Imports:
 *	XWebAdmin
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:19
 *	Functions:12
 *
 *******************************************************************************/
class xWebQueryDefaults extends xWebQueryHandler within UTServerAdmin
    config();

var config string DefaultsIndexPage;
var config string DefaultsMapsPage;
var config string DefaultsRulesPage;
var config string DefaultsIPPolicyPage;
var config string DefaultsRestartPage;
var config string DefaultsVotingGameConfigPage;
var config string DefaultsRowPage;
var localized string DefaultsMapsLink;
var localized string DefaultsIPPolicyLink;
var localized string DefaultsRestartLink;
var localized string IDBan;
var localized string DefaultsVotingGameConfigLink;
var localized string ActiveMapNotFound;
var localized string InactiveMapNotFound;
var localized string CannotModify;
var localized string NoteMapsPage;
var localized string NoteRulesPage;
var localized string NotePolicyPage;
var localized string NoteVotingGameConfigPage;

function bool Init()
{
    local int i;

    // End:0x26
    if(Outer.GamePI == none)
    {
        Outer.SetGamePI("");
    }
    i = 0;
    J0x2d:
    // End:0xeb [While If]
    if(i < Outer.GamePI.Settings.Length)
    {
        // End:0xe1
        if(Outer.GamePI.Settings[i].ExtraPriv != "" && InStr(NeededPrivs, Outer.GamePI.Settings[i].ExtraPriv) == -1)
        {
            NeededPrivs = NeededPrivs $ "|" $ Outer.GamePI.Settings[i].ExtraPriv;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x2d;
    }
    return true;
}

function bool Query(WebRequest Request, WebResponse Response)
{
    // End:0x1b
    if(!Outer.CanPerform(NeededPrivs))
    {
        return false;
    }
    Outer.MapTitle(Response);
    switch(Mid(Request.URI, 1))
    {
        // End:0x5c
        case DefaultPage:
            QueryDefaults(Request, Response);
            return true;
        // End:0x76
        case DefaultsIndexPage:
            QueryDefaultsMenu(Request, Response);
            return true;
        // End:0xa4
        case DefaultsMapsPage:
            // End:0xa2
            if(!Outer.MapIsChanging())
            {
                QueryDefaultsMaps(Request, Response);
            }
            return true;
        // End:0xd2
        case DefaultsRulesPage:
            // End:0xd0
            if(!Outer.MapIsChanging())
            {
                QueryDefaultsRules(Request, Response);
            }
            return true;
        // End:0x100
        case DefaultsIPPolicyPage:
            // End:0xfe
            if(!Outer.MapIsChanging())
            {
                QueryDefaultsIPPolicy(Request, Response);
            }
            return true;
        // End:0x137
        case DefaultsRestartPage:
            // End:0x135
            if(!Outer.MapIsChanging())
            {
                Outer.QueryRestartPage(Request, Response);
            }
            return true;
        // End:0x165
        case DefaultsVotingGameConfigPage:
            // End:0x163
            if(!Outer.MapIsChanging())
            {
                QueryVotingGameConfig(Request, Response);
            }
            return true;
        // End:0xffff
        default:
            return false;
    }
}

function QueryDefaults(WebRequest Request, WebResponse Response)
{
    local string GameType, PageStr, filter;

    GameType = Request.GetVariable("GameType", string(Outer.Level.Game.Class));
    PageStr = Request.GetVariable("Page", DefaultsMapsPage);
    filter = Eval(Request.GetVariable("Filter") != "", "&Filter=" $ Request.GetVariable("Filter"), "");
    Response.Subst("IndexURI", DefaultsIndexPage $ "?GameType=" $ GameType $ "&Page=" $ PageStr $ filter);
    Response.Subst("MainURI", PageStr $ "?GameType=" $ GameType $ filter);
    Outer.ShowFrame(Response, DefaultPage);
}

function QueryDefaultsMenu(WebRequest Request, WebResponse Response)
{
    local string GameType, Page, TempStr, Content;
    local int i;

    GameType = Outer.SetGamePI(Request.GetVariable("GameType", string(Outer.Level.Game.Class)));
    Page = Request.GetVariable("Page");
    // End:0x184
    if(Outer.CanPerform("Mt"))
    {
        // End:0xec
        if(Request.GetVariable("GameTypeSet", "") != "")
        {
            TempStr = Request.GetVariable("GameTypeSelect", GameType);
            // End:0xec
            if(!TempStr ~= GameType)
            {
                GameType = TempStr;
            }
        }
        Response.Subst("GameTypeButton", Outer.SubmitButton("GameTypeSet", Outer.Update));
        Response.Subst("GameTypeSelect", Outer.Select("GameType", Outer.GenerateGameTypeOptions(GameType)));
    }
    // End:0x1c3
    else
    {
        Response.Subst("GameTypeSelect", Outer.Level.Game.default.GameName);
    }
    Response.Subst("DefaultBG", Outer.DefaultBG);
    Content = MakeMenuRow(Response, GameType $ "&Page=" $ DefaultsMapsPage, DefaultsMapsLink);
    i = 0;
    J0x21e:
    // End:0x2c0 [While If]
    if(i < Outer.GamePI.Groups.Length)
    {
        Content = Content $ MakeMenuRow(Response, GameType $ "&Page=" $ DefaultsRulesPage $ "&Filter=" $ Outer.GamePI.Groups[i], Outer.GamePI.Groups[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x21e;
    }
    Content $= MakeMenuRow(Response, GameType $ "&Page=" $ DefaultsIPPolicyPage, DefaultsIPPolicyLink);
    Content $= MakeMenuRow(Response, GameType $ "&Page=" $ DefaultsVotingGameConfigPage, DefaultsVotingGameConfigLink);
    Content $= "<br>" $ MakeMenuRow(Response, GameType $ "&Page=" $ DefaultsRestartPage, DefaultsRestartLink);
    Response.Subst("Content", Content);
    Response.Subst("Filter", Request.GetVariable("Filter", ""));
    Response.Subst("Page", Page);
    Response.Subst("PostAction", DefaultPage);
    Outer.ShowPage(Response, DefaultsIndexPage);
}

function string MakeMenuRow(WebResponse Response, string URI, string Title)
{
    Response.Subst("URI", DefaultPage $ "?GameType=" $ URI);
    Response.Subst("URIText", Title);
    return Outer.WebInclude("defaults_menu_row");
}

function QueryDefaultsMaps(WebRequest Request, WebResponse Response)
{
    local string GameType, ListName, tmp, MapName, MapURL, CustomMapSelect;

    local StringArray ExcludeMaps, IncludeMaps, MovedMaps;
    local int i, Count, moveCount, id, CurrentList, Index;

    local array<string> Arr;

    // End:0xdcb
    if(Outer.CanPerform("Ml"))
    {
        Request.Dump();
        GameType = Request.GetVariable("GameType");
        Index = Outer.Level.Game.MaplistHandler.GetGameIndex(GameType);
        tmp = Request.GetVariable("MapListNum");
        // End:0xb6
        if(tmp != "")
        {
            CurrentList = int(tmp);
        }
        // End:0xeb
        else
        {
            CurrentList = Outer.Level.Game.MaplistHandler.GetActiveList(Index);
        }
        ListName = Outer.Level.Game.MaplistHandler.GetMapListTitle(Index, CurrentList);
        ExcludeMaps = Outer.ReloadExcludeMaps(GameType);
        IncludeMaps = Outer.ReloadIncludeMaps(ExcludeMaps, Index, CurrentList);
        MovedMaps = new (none) class'SortedStringArray';
        tmp = Request.GetVariable("MoveMap", "");
        // End:0x92a
        if(tmp != "")
        {
            ListName = Request.GetVariable("ListName", ListName);
            switch(tmp)
            {
                // End:0x1d1
                case " > ":
                // End:0x33c
                case ">":
                    Count = Request.GetVariableCount("ExcludeMapsSelect");
                    i = Count - 1;
                    J0x20d:
                    // End:0x339 [While If]
                    if(i >= 0)
                    {
                        // End:0x32f
                        if(ExcludeMaps.Count() > 0)
                        {
                            MapURL = Request.GetVariableNumber("ExcludeMapsSelect", i);
                            MapName = class'MaplistRecord'.static.GetBaseMapName(MapURL);
                            id = IncludeMaps.MoveFrom(ExcludeMaps, MapName);
                            // End:0x2fa
                            if(id >= 0)
                            {
                                MovedMaps.CopyFromId(IncludeMaps, id);
                                Outer.Level.Game.MaplistHandler.AddMap(Index, CurrentList, MapName $ MapURL);
                            }
                            // End:0x32f
                            else
                            {
                                Log(InactiveMapNotFound $ Request.GetVariableNumber("ExcludeMapsSelect", i), 'WebAdmin');
                            }
                        }
                        -- i;
                        // This is an implied JumpToken; Continue!
                        goto J0x20d;
                    }
                    // End:0x92a
                    break;
                // End:0x344
                case " < ":
                // End:0x4d7
                case "<":
                    // End:0x4d4
                    if(Request.GetVariableCount("IncludeMapsSelect") > 0)
                    {
                        Count = Request.GetVariableCount("IncludeMapsSelect");
                        i = Count - 1;
                        J0x3a8:
                        // End:0x4d4 [While If]
                        if(i >= 0)
                        {
                            MapURL = Request.GetVariableNumber("IncludeMapsSelect", i);
                            MapName = class'MaplistRecord'.static.GetBaseMapName(MapURL);
                            // End:0x4ca
                            if(IncludeMaps.Count() > 0)
                            {
                                id = ExcludeMaps.MoveFrom(IncludeMaps, MapName);
                                // End:0x495
                                if(id >= 0)
                                {
                                    MovedMaps.CopyFromId(ExcludeMaps, id);
                                    Outer.Level.Game.MaplistHandler.RemoveMap(Index, CurrentList, MapName $ MapURL);
                                }
                                // End:0x4ca
                                else
                                {
                                    Log(ActiveMapNotFound $ Request.GetVariableNumber("IncludeMapsSelect", i), 'WebAdmin');
                                }
                            }
                            -- i;
                            // This is an implied JumpToken; Continue!
                            goto J0x3a8;
                        }
                    }
                    // End:0x92a
                    break;
                // End:0x591
                case ">>":
                    J0x4de:
                    // End:0x58e [While If]
                    if(ExcludeMaps.Count() > 0)
                    {
                        id = IncludeMaps.MoveFromId(ExcludeMaps, ExcludeMaps.Count() - 1);
                        // End:0x58b
                        if(id >= 0)
                        {
                            MovedMaps.CopyFromId(IncludeMaps, id);
                            Outer.Level.Game.MaplistHandler.AddMap(Index, CurrentList, IncludeMaps.GetItem(id));
                        }
                        // This is an implied JumpToken; Continue!
                        goto J0x4de;
                    }
                    // End:0x92a
                    break;
                // End:0x637
                case "<<":
                    J0x598:
                    // End:0x634 [While If]
                    if(IncludeMaps.Count() > 0)
                    {
                        id = ExcludeMaps.MoveFromId(IncludeMaps, IncludeMaps.Count() - 1);
                        // End:0x631
                        if(id >= 0)
                        {
                            MovedMaps.CopyFromId(ExcludeMaps, id);
                            Outer.Level.Game.MaplistHandler.ClearList(Index, CurrentList);
                        }
                        // This is an implied JumpToken; Continue!
                        goto J0x598;
                    }
                    // End:0x92a
                    break;
                // End:0x7b3
                case "Up":
                    moveCount = int(Abs(float(Request.GetVariable("MoveMapCount"))));
                    Count = Request.GetVariableCount("IncludeMapsSelect");
                    i = 0;
                    J0x696:
                    // End:0x6ea [While If]
                    if(i < Count)
                    {
                        MovedMaps.CopyFrom(IncludeMaps, Request.GetVariableNumber("IncludeMapsSelect", i));
                        ++ i;
                        // This is an implied JumpToken; Continue!
                        goto J0x696;
                    }
                    moveCount = -moveCount;
                    i = 0;
                    J0x6fe:
                    // End:0x7b0 [While If]
                    if(i < IncludeMaps.Count())
                    {
                        // End:0x7a6
                        if(MovedMaps.FindItemId(IncludeMaps.GetItem(i)) >= 0)
                        {
                            Outer.Level.Game.MaplistHandler.ShiftMap(Index, CurrentList, IncludeMaps.GetItem(i), moveCount);
                            IncludeMaps.ShiftStrict(i, moveCount);
                        }
                        ++ i;
                        // This is an implied JumpToken; Continue!
                        goto J0x6fe;
                    }
                    // End:0x92a
                    break;
                // End:0x927
                case "Down":
                    moveCount = int(Abs(float(Request.GetVariable("MoveMapCount"))));
                    Count = Request.GetVariableCount("IncludeMapsSelect");
                    i = 0;
                    J0x814:
                    // End:0x868 [While If]
                    if(i < Count)
                    {
                        MovedMaps.CopyFrom(IncludeMaps, Request.GetVariableNumber("IncludeMapsSelect", i));
                        ++ i;
                        // This is an implied JumpToken; Continue!
                        goto J0x814;
                    }
                    i = IncludeMaps.Count() - 1;
                    J0x880:
                    // End:0x924 [While If]
                    if(i >= 0)
                    {
                        // End:0x91a
                        if(MovedMaps.FindItemId(IncludeMaps.GetItem(i)) >= 0)
                        {
                            Outer.Level.Game.MaplistHandler.ShiftMap(Index, CurrentList, IncludeMaps.GetItem(i), moveCount);
                            IncludeMaps.ShiftStrict(i, moveCount);
                        }
                        -- i;
                        // This is an implied JumpToken; Continue!
                        goto J0x880;
                    }
                    // End:0x92a
                    break;
                // End:0xffff
                default:
                }
                // End:0x98b
                if(Request.GetVariable("Save") != "")
                {
                    ListName = Request.GetVariable("ListName", ListName);
                    Outer.UpdateCustomMapList(Index, CurrentList, ListName);
                }
                // End:0xc2a
                else
                {
                    // End:0xac6
                    if(Request.GetVariable("New") != "")
                    {
                        Arr.Length = 0;
                        i = 0;
                        J0x9b5:
                        // End:0x9f9 [While If]
                        if(i < IncludeMaps.Count())
                        {
                            Arr[Arr.Length] = IncludeMaps.GetTag(i);
                            ++ i;
                            // This is an implied JumpToken; Continue!
                            goto J0x9b5;
                        }
                        Outer.Level.Game.MaplistHandler.ResetList(Index, CurrentList);
                        CurrentList = Outer.Level.Game.MaplistHandler.AddList(GameType, Request.GetVariable("ListName", ListName), Arr);
                        ExcludeMaps = Outer.ReloadExcludeMaps(GameType);
                        IncludeMaps = Outer.ReloadIncludeMaps(ExcludeMaps, Index, CurrentList);
                    }
                    // End:0xc2a
                    else
                    {
                        // End:0xb5a
                        if(Request.GetVariable("Use") != "")
                        {
                            ListName = Request.GetVariable("ListName", ListName);
                            Outer.UpdateCustomMapList(Index, CurrentList, ListName);
                            Outer.Level.Game.MaplistHandler.ApplyMapList(Index, CurrentList);
                        }
                        // End:0xc2a
                        else
                        {
                            // End:0xc2a
                            if(Request.GetVariable("Delete") != "")
                            {
                                CurrentList = Outer.Level.Game.MaplistHandler.RemoveList(Index, CurrentList);
                                ListName = Outer.Level.Game.MaplistHandler.GetMapListTitle(Index, CurrentList);
                                ExcludeMaps = Outer.ReloadExcludeMaps(GameType);
                                IncludeMaps = Outer.ReloadIncludeMaps(ExcludeMaps, Index, CurrentList);
                            }
                        }
                    }
                }
                CustomMapSelect = Outer.GenerateMapListOptions(GameType, CurrentList);
                Response.Subst("GameType", GameType);
                Response.Subst("Session", "Session");
                Response.Subst("MapListName", ListName);
                Response.Subst("MapListOptions", CustomMapSelect);
                Response.Subst("ExcludeMapsOptions", Outer.GenerateMapListSelect(ExcludeMaps, MovedMaps));
                Response.Subst("IncludeMapsOptions", Outer.GenerateMapListSelect(IncludeMaps, MovedMaps));
                Response.Subst("Section", DefaultsMapsLink);
                Response.Subst("PostAction", DefaultsMapsPage);
                Response.Subst("PageHelp", NoteMapsPage);
                Response.Dump();
                Outer.ShowPage(Response, DefaultsMapsPage);
                // This is an implied JumpToken;
                goto J0xddf;
            }
            Outer.AccessDenied(Response);
            J0xddf:
}

function QueryDefaultsRules(WebRequest Request, WebResponse Response)
{
    local int i, j;
    local bool bMarked, bSave;
    local string GameType, Content, Data, Op, Mark, filter,
	    SecLevel, TempStr;

    local array<string> Options;

    // End:0x2e
    if(!Outer.CanPerform("Ms"))
    {
        Outer.AccessDenied(Response);
        return;
    }
    GameType = Outer.SetGamePI(Request.GetVariable("GameType"));
    filter = Request.GetVariable("Filter");
    bSave = Request.GetVariable("Save", "") != "";
    Content = "";
    Mark = Outer.WebInclude("defaults_mark");
    Response.Subst("Section", filter);
    Response.Subst("Filter", filter);
    i = 0;
    J0x107:
    // End:0x988 [While If]
    if(i < Outer.GamePI.Settings.Length)
    {
        // End:0x97e
        if(Outer.GamePI.Settings[i].Grouping == filter && Outer.GamePI.Settings[i].SecLevel <= Outer.CurAdmin.MaxSecLevel() && Outer.GamePI.Settings[i].ExtraPriv == "" || Outer.CanPerform(Outer.GamePI.Settings[i].ExtraPriv))
        {
            // End:0x283
            if(Outer.GamePI.Settings[i].ArrayDim != -1 || Outer.GamePI.Settings[i].bStruct || Outer.GamePI.Settings[i].ThisProp.IsA('UArrayProperty'))
            {
            }
            // End:0x97e
            else
            {
                Options.Length = 0;
                TempStr = Outer.HtmlDecode(Request.GetVariable(Outer.GamePI.Settings[i].SettingName, ""));
                // End:0x31d
                if(bSave)
                {
                    Outer.GamePI.StoreSetting(i, TempStr, Outer.GamePI.Settings[i].Data);
                }
                bMarked = bMarked || Outer.GamePI.Settings[i].bGlobal;
                Response.Subst("Mark", Eval(bMarked, Mark, ""));
                Response.Subst("HintText", Outer.HtmlEncode(Outer.GamePI.Settings[i].Description));
                Response.Subst("DisplayText", Outer.HtmlEncode(Outer.GamePI.Settings[i].DisplayName));
                SecLevel = Eval(Outer.CurAdmin.bMasterAdmin, string(Outer.GamePI.Settings[i].SecLevel), "");
                Response.Subst("SecLevel", "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" $ SecLevel);
                switch(Outer.GamePI.Settings[i].RenderType)
                {
                    // End:0x4bc
                    case 3:
                    // End:0x690
                    case 2:
                        Data = "8";
                        // End:0x577
                        if(Outer.GamePI.Settings[i].Data != "")
                        {
                            // End:0x54f
                            if(Divide(Outer.GamePI.Settings[i].Data, ";", Data, Op))
                            {
                                Outer.GamePI.SplitStringToArray(Options, Op, ":");
                            }
                            // End:0x577
                            else
                            {
                                Data = Outer.GamePI.Settings[i].Data;
                            }
                        }
                        j = Min(int(Data), 40);
                        Op = "";
                        // End:0x5c4
                        if(Options.Length > 1)
                        {
                            Op = " (" $ Options[0] $ " - " $ Options[1] $ ")";
                        }
                        Response.Subst("Content", Outer.TextBox(Outer.GamePI.Settings[i].SettingName, string(j), string(int(Data)), Outer.HtmlEncode(Outer.GamePI.Settings[i].Value)) $ Op);
                        Response.Subst("FormObject", Outer.WebInclude(Outer.NowrapLeft));
                        // End:0x961
                        break;
                    // End:0x7b7
                    case 0:
                        // End:0x6e6
                        if(bSave && Outer.GamePI.Settings[i].Value == "")
                        {
                            Outer.GamePI.StoreSetting(i, string(false));
                        }
                        Response.Subst("Content", Outer.Checkbox(Outer.GamePI.Settings[i].SettingName, Outer.GamePI.Settings[i].Value ~= string(true), Outer.GamePI.Settings[i].Data != ""));
                        Response.Subst("FormObject", Outer.WebInclude(Outer.NowrapLeft));
                        // End:0x961
                        break;
                    // End:0x95e
                    case 1:
                        Data = "";
                        Outer.GamePI.SplitStringToArray(Options, Outer.GamePI.Settings[i].Data, ";");
                        j = 0;
                        J0x80d:
                        // End:0x8d5 [While If]
                        if(j + 1 < Options.Length)
                        {
                            Data $= "<option value='" $ Options[j] $ "'";
                            // End:0x891
                            if(Outer.GamePI.Settings[i].Value == Options[j])
                            {
                                Data @= "selected";
                            }
                            Data $= ">" $ Outer.HtmlEncode(Options[j + 1]) $ "</option>";
                            j += 2;
                            // This is an implied JumpToken; Continue!
                            goto J0x80d;
                        }
                        Response.Subst("Content", Outer.Select(Outer.GamePI.Settings[i].SettingName, Data));
                        Response.Subst("FormObject", Outer.WebInclude(Outer.NowrapLeft));
                        // End:0x961
                        break;
                    // End:0xffff
                    default:
                        Content $= Outer.WebInclude(DefaultsRowPage);
                    }
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x107;
            }
            Outer.GamePI.SaveSettings();
            // End:0x9b4
            if(Content == "")
            {
                Content = CannotModify;
            }
            Response.Subst("TableContent", Content);
            Response.Subst("PostAction", DefaultsRulesPage);
            Response.Subst("GameType", GameType);
            Response.Subst("SubmitValue", Outer.Accept);
            Response.Subst("PageHelp", NoteRulesPage);
            Outer.ShowPage(Response, DefaultsRulesPage);
}

function QueryDefaultsIPPolicy(WebRequest Request, WebResponse Response)
{
    local int i, j;
    local bool bIpBan;
    local string policies, tmpN, tmpV, PolicyType;

    // End:0x83a
    if(Outer.CanPerform("Xi"))
    {
        Response.Subst("Section", DefaultsIPPolicyLink);
        // End:0x1ca
        if(Request.GetVariable("Update") != "")
        {
            i = int(Request.GetVariable("IpNo", "-1"));
            // End:0x1ca
            if(i > -1 && ValidMask(Request.GetVariable("IPMask")))
            {
                // End:0x13a
                if(i >= Outer.Level.Game.AccessControl.IPPolicies.Length)
                {
                    i = Outer.Level.Game.AccessControl.IPPolicies.Length;
                    Outer.Level.Game.AccessControl.IPPolicies.Length = i + 1;
                }
                Outer.Level.Game.AccessControl.IPPolicies[i] = Request.GetVariable("AcceptDeny") $ ";" $ Request.GetVariable("IPMask");
                Outer.Level.Game.AccessControl.SaveConfig();
            }
        }
        // End:0x37e
        if(Request.GetVariable("Delete") != "")
        {
            i = int(Request.GetVariable("IdNo", "-1"));
            // End:0x241
            if(i == -1)
            {
                bIpBan = true;
                i = int(Request.GetVariable("IpNo", "-1"));
            }
            // End:0x37e
            if(i > -1)
            {
                // End:0x2e6
                if(bIpBan && i < Outer.Level.Game.AccessControl.IPPolicies.Length)
                {
                    Outer.Level.Game.AccessControl.IPPolicies.Remove(i, 1);
                    Outer.Level.Game.AccessControl.SaveConfig();
                }
                // End:0x37e
                if(!bIpBan && i < Outer.Level.Game.AccessControl.BannedIDs.Length)
                {
                    Outer.Level.Game.AccessControl.BannedIDs.Remove(i, 1);
                    Outer.Level.Game.AccessControl.SaveConfig();
                }
            }
        }
        policies = "";
        // End:0x584
        if(Outer.Level.Game.AccessControl.bBanByID)
        {
            i = 0;
            J0x3ba:
            // End:0x584 [While If]
            if(i < Outer.Level.Game.AccessControl.BannedIDs.Length)
            {
                j = InStr(Outer.Level.Game.AccessControl.BannedIDs[i], " ");
                tmpN = Mid(Outer.Level.Game.AccessControl.BannedIDs[i], j + 1);
                tmpV = Left(Outer.Level.Game.AccessControl.BannedIDs[i], j);
                Response.Subst("PolicyType", IDBan);
                Response.Subst("PolicyCell", tmpN $ ":" @ tmpV $ "&nbsp;&nbsp;");
                Response.Subst("PostAction", DefaultsIPPolicyPage $ "?IDNo=" $ string(i));
                Response.Subst("UpdateButton", "");
                policies = policies $ Outer.WebInclude(DefaultsIPPolicyPage $ "_row");
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x3ba;
            }
        }
        i = 0;
        J0x58b:
        // End:0x7af [While If]
        if(i < Outer.Level.Game.AccessControl.IPPolicies.Length)
        {
            Divide(Outer.Level.Game.AccessControl.IPPolicies[i], ";", tmpN, tmpV);
            PolicyType = Outer.RadioButton("AcceptDeny", "ACCEPT", tmpN ~= "ACCEPT") @ Outer.Accept $ "<br>";
            PolicyType = PolicyType $ Outer.RadioButton("AcceptDeny", "DENY", tmpN ~= "DENY") @ Outer.Deny;
            Response.Subst("PolicyType", PolicyType);
            Response.Subst("PolicyCell", Outer.TextBox("IPMask", string(15), string(25), tmpV) $ "&nbsp;&nbsp;");
            Response.Subst("PostAction", DefaultsIPPolicyPage $ "?IpNo=" $ string(i));
            Response.Subst("UpdateButton", Outer.SubmitButton("Update", Outer.Update));
            policies = policies $ Outer.WebInclude(DefaultsIPPolicyPage $ "_row");
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x58b;
        }
        Response.Subst("Policies", policies);
        Response.Subst("PostAction", DefaultsIPPolicyPage $ "?IpNo=" $ string(i));
        Response.Subst("PageHelp", NotePolicyPage);
        Outer.ShowPage(Response, DefaultsIPPolicyPage);
    }
    // End:0x84e
    else
    {
        Outer.AccessDenied(Response);
    }
}

function QueryVotingGameConfig(WebRequest Request, WebResponse Response)
{
    local int i, j, k, X, columns, Count,
	    GameConfigIndex;

    local string PageText, GameConfigData, ColumnTitle, Value;
    local array<string> Parts, MutatorList;

    // End:0xa9e
    if(Outer.CanPerform("Ms"))
    {
        Response.Subst("Section", DefaultsVotingGameConfigLink);
        PageText = "";
        i = 0;
        J0x42:
        // End:0xee [While If]
        if(Outer.Level.Game.VotingHandler.GetConfigArrayColumnTitle("GameConfig", i) != "")
        {
            PageText = PageText $ "<th nowrap>" $ Outer.Level.Game.VotingHandler.GetConfigArrayColumnTitle("GameConfig", i) $ "</th>";
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x42;
        }
        columns = i;
        Response.Subst("ColumnTitles", PageText);
        GameConfigIndex = int(Request.GetVariable("GameConfigIndex", "-1"));
        // End:0x324
        if(Request.GetVariable("Update") != "")
        {
            // End:0x324
            if(GameConfigIndex > -1)
            {
                j = 0;
                J0x17b:
                // End:0x2f2 [While If]
                if(j < columns)
                {
                    ColumnTitle = Outer.Level.Game.VotingHandler.GetConfigArrayColumnTitle("GameConfig", j);
                    Value = "";
                    // End:0x289
                    if(j == 4)
                    {
                        Count = Request.GetVariableCount(ColumnTitle);
                        k = 0;
                        J0x200:
                        // End:0x286 [While If]
                        if(k < Count)
                        {
                            // End:0x242
                            if(Request.GetVariableNumber(ColumnTitle, k) ~= "NONE")
                            {
                                Value = "NONE";
                            }
                            // End:0x286
                            else
                            {
                                // End:0x25a
                                if(Value != "")
                                {
                                    Value $= ",";
                                }
                                Value $= Request.GetVariableNumber(ColumnTitle, k);
                                ++ k;
                                // This is an implied JumpToken; Continue!
                                goto J0x200;
                            }
                        }
                    }
                    // End:0x2a3
                    else
                    {
                        Value = Request.GetVariable(ColumnTitle);
                    }
                    Outer.Level.Game.VotingHandler.UpdateConfigArrayItem("GameConfig", GameConfigIndex, j, Value);
                    ++ j;
                    // This is an implied JumpToken; Continue!
                    goto J0x17b;
                }
                Outer.Level.Game.VotingHandler.SaveConfig();
                GameConfigIndex = -1;
            }
        }
        // End:0x3be
        if(Request.GetVariable("Delete") != "")
        {
            // End:0x3be
            if(GameConfigIndex > -1)
            {
                Outer.Level.Game.VotingHandler.DeleteConfigArrayItem("GameConfig", GameConfigIndex);
                Outer.Level.Game.VotingHandler.SaveConfig();
                GameConfigIndex = -1;
            }
        }
        // End:0x436
        if(Request.GetVariable("New") != "")
        {
            Outer.Level.Game.VotingHandler.AddConfigArrayItem("GameConfig");
            Outer.Level.Game.VotingHandler.SaveConfig();
        }
        PageText = "";
        i = 0;
        J0x445:
        // End:0x987 [While If]
        if(i < Outer.Level.Game.VotingHandler.GetConfigArrayItemCount("GameConfig"))
        {
            PageText $= "<tr><form method=\\"post\\" action=\\"" $ DefaultsVotingGameConfigPage $ "?GameConfigIndex=" $ string(i) $ "\\">";
            j = 0;
            J0x4e2:
            // End:0x8b8 [While If]
            if(j < columns)
            {
                PageText $= "<td valign=\\"top\\">";
                GameConfigData = Outer.Level.Game.VotingHandler.GetConfigArrayData("GameConfig", i, j);
                Split(GameConfigData, ";", Parts);
                // End:0x714
                if(i == GameConfigIndex)
                {
                    switch(Caps(Parts[0]))
                    {
                        // End:0x5f2
                        case "TEXT":
                            PageText $= Outer.TextBox(Outer.Level.Game.VotingHandler.GetConfigArrayColumnTitle("GameConfig", j), string(15), string(int(Parts[1])), Parts[2]);
                            // End:0x711
                            break;
                        // End:0x66c
                        case "GAMETYPE":
                            PageText $= Outer.Select(Outer.Level.Game.VotingHandler.GetConfigArrayColumnTitle("GameConfig", j), Outer.GenerateGameTypeOptions(Parts[2]));
                            // End:0x711
                            break;
                        // End:0x70e
                        case "MUTATORS":
                            PageText $= "<select name=\\"" $ Outer.Level.Game.VotingHandler.GetConfigArrayColumnTitle("GameConfig", j) $ "\\" size=5 multiple>" $ Outer.GenerateMutatorOptions(Parts[2]) $ "</select>";
                            // End:0x711
                            break;
                        // End:0xffff
                        default:
                            // End:0x89e Break;
                            break;
                        }
                }
                switch(Caps(Parts[0]))
                {
                    // End:0x73c
                    case "TEXT":
                        PageText $= Parts[2];
                        // End:0x89e
                        break;
                    // End:0x7c1
                    case "GAMETYPE":
                        k = 0;
                        J0x750:
                        // End:0x7be [While If]
                        if(k < Outer.AllGames.Length)
                        {
                            // End:0x7b4
                            if(Parts[2] ~= Outer.AllGames[k].ClassName)
                            {
                                PageText $= Outer.AllGames[k].GameName;
                            }
                            // End:0x7be
                            else
                            {
                                ++ k;
                                // This is an implied JumpToken; Continue!
                                goto J0x750;
                            }
                        }
                        // End:0x89e
                        break;
                    // End:0x89b
                    case "MUTATORS":
                        Split(Parts[2], ",", MutatorList);
                        X = 0;
                        J0x7e7:
                        // End:0x898 [While If]
                        if(X < MutatorList.Length)
                        {
                            k = 0;
                            J0x7fe:
                            // End:0x88e [While If]
                            if(k < Outer.AllMutators.Length)
                            {
                                // End:0x884
                                if(MutatorList[X] ~= Outer.AllMutators[k].ClassName)
                                {
                                    PageText $= Outer.AllMutators[k].FriendlyName;
                                    // End:0x881
                                    if(X < MutatorList.Length - 1)
                                    {
                                        PageText $= ",";
                                    }
                                }
                                // End:0x88e
                                else
                                {
                                    ++ k;
                                    // This is an implied JumpToken; Continue!
                                    goto J0x7fe;
                                }
                            }
                            ++ X;
                            // This is an implied JumpToken; Continue!
                            goto J0x7e7;
                        }
                        // End:0x89e
                        break;
                    // End:0xffff
                    default:
                        PageText $= "</td>";
                        ++ j;
                        // This is an implied JumpToken; Continue!
                        goto J0x4e2;
                    }
                    PageText $= "<td>";
                    // End:0x935
                    if(i == GameConfigIndex)
                    {
                        PageText $= Outer.SubmitButton("Update", Outer.Update);
                        PageText $= Outer.SubmitButton("Delete", Outer.DeleteText);
                    }
                    // End:0x961
                    else
                    {
                        PageText $= Outer.SubmitButton("Edit", Outer.Edit);
                    }
                    PageText $= "</td></form></tr>";
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0x445;
                }
                PageText $= "<tr><td colspan=" $ string(columns + 1) $ "><form method=\\"post\\" action=\\"" $ DefaultsVotingGameConfigPage $ "?GameConfigIndex=-1" $ string(i) $ "\\">";
                PageText $= Outer.SubmitButton("New", Outer.NewText);
                PageText $= "</form></td></tr>";
                Response.Subst("GameConfigs", PageText);
                Response.Subst("PageHelp", NoteVotingGameConfigPage);
                Outer.ShowPage(Response, DefaultsVotingGameConfigPage);
                JumpToken-JumpToken(System.InvalidCastException: Unable to cast object of type 'EndFunctionParmsToken' to type 'JumpToken'.
   at UELib.Core.UStruct.UByteCodeDecompiler.JumpToken.Decompile()
   at UELib.Core.UStruct.UByteCodeDecompiler.Decompile())
            }
            Outer.AccessDenied(Response);
            J0xab2:
}

function bool ValidMask(string Mask)
{
    local int i;
    local string Octets[4], tmp;

    // End:0x6b [While If]
    if(Mask != "")
    {
        J0x00:
        // End:0x57
        if(Left(Mask, 1) == ".")
        {
            // End:0x2e
            if(!ValidOctet(tmp))
            {
                return false;
            }
            Octets[++ i] = tmp;
            Mask = Mid(Mask, 1);
            tmp = "";
        }
        EatStr(tmp, Mask, 1);
        // This is an implied JumpToken; Continue!
        goto J0x00;
    }
    // End:0x7d
    if(!ValidOctet(tmp))
    {
        return false;
    }
    Octets[++ i] = tmp;
    // End:0x9e
    if(i > 4)
    {
        return false;
    }
    return true;
}

function bool ValidOctet(string tmp)
{
    local int i;

    // End:0x0e
    if(tmp == "")
    {
        return false;
    }
    // End:0x1e
    if(ValidMaskOctet(tmp))
    {
        return true;
    }
    i = int(tmp);
    // End:0x47
    if(i == 0 && tmp != "0")
    {
        return false;
    }
    // End:0x62
    if(i < 0 || i > 255)
    {
        return false;
    }
    return true;
}

function bool ValidMaskOctet(string tmp)
{
    local string S;

    // End:0x30
    if(tmp == "" || Len(tmp) > 3 || Right(tmp, 1) != "*")
    {
        return false;
    }
    J0x30:
    // End:0x89 [While If]
    if(tmp != "")
    {
        S = Left(tmp, 1);
        // End:0x5a
        if(S == "*")
        {
        }
        // End:0x89
        else
        {
            // End:0x78
            if(S < "0" || S > "9")
            {
                return false;
            }
            tmp = Mid(tmp, 1);
            // This is an implied JumpToken; Continue!
            goto J0x30;
        }
    }
    return true;
}

defaultproperties
{
    DefaultsIndexPage="defaults_menu"
    DefaultsMapsPage="defaults_maps"
    DefaultsRulesPage="defaults_rules"
    DefaultsIPPolicyPage="defaults_ippolicy"
    DefaultsRestartPage="defaults_restart"
    DefaultsVotingGameConfigPage="defaults_votinggameconfig"
    DefaultsRowPage="defaults_row"
    DefaultsMapsLink="Maps"
    DefaultsIPPolicyLink="??? ??"
    DefaultsRestartLink="??? ??"
    IDBan="(?? ??)"
    DefaultsVotingGameConfigLink="?? ????"
    ActiveMapNotFound="???? ?? ????.: "
    InactiveMapNotFound="????? ?? ????.: "
    CannotModify="** ????? ??? ???? ????. **"
    NoteMapsPage="??? ???? ?? ???? ? ?? ???? ??????. ?? ??? ?????? ??? ? ????."
    NoteRulesPage="??? ?? ??? ??? ???? ??? ? ????. ?? ????? 1? ??? ??? ?????."
    NotePolicyPage="IP??? IP?? ??? ???? ? ??? ???? ??? ? ? ????. ??? ?? ????? ??? ?? ???? ?? ?????."
    NoteVotingGameConfigPage="? ?????? ? ??? ?? ?? ??? ? ? ????."
    DefaultPage="defaultsframe"
    Title="Defaults"
    NeededPrivs="G|M|X|Gt|Ml|Ms|Xi|Xb"
}