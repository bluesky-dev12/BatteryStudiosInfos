class xWebQueryDefaults extends xWebQueryHandler within UTServerAdmin
    config;

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
    J0x2D:

    // End:0xEB [Loop If]
    if(i < Outer.GamePI.Settings.Length)
    {
        // End:0xE1
        if((Outer.GamePI.Settings[i].ExtraPriv != "") && InStr(NeededPrivs, Outer.GamePI.Settings[i].ExtraPriv) == -1)
        {
            NeededPrivs = (NeededPrivs $ "|") $ Outer.GamePI.Settings[i].ExtraPriv;
        }
        i++;
        // [Loop Continue]
        goto J0x2D;
    }
    return true;
    //return;    
}

function bool Query(WebRequest Request, WebResponse Response)
{
    // End:0x1B
    if(!Outer.CanPerform(NeededPrivs))
    {
        return false;
    }
    Outer.MapTitle(Response);
    switch(Mid(Request.URI, 1))
    {
        // End:0x5C
        case DefaultPage:
            QueryDefaults(Request, Response);
            return true;
        // End:0x76
        case DefaultsIndexPage:
            QueryDefaultsMenu(Request, Response);
            return true;
        // End:0xA4
        case DefaultsMapsPage:
            // End:0xA2
            if(!Outer.MapIsChanging())
            {
                QueryDefaultsMaps(Request, Response);
            }
            return true;
        // End:0xD2
        case DefaultsRulesPage:
            // End:0xD0
            if(!Outer.MapIsChanging())
            {
                QueryDefaultsRules(Request, Response);
            }
            return true;
        // End:0x100
        case DefaultsIPPolicyPage:
            // End:0xFE
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
        // End:0xFFFF
        default:
            return false;
            break;
    }
    //return;    
}

function QueryDefaults(WebRequest Request, WebResponse Response)
{
    local string GameType, PageStr, filter;

    GameType = Request.GetVariable("GameType", string(Outer.Level.Game.Class));
    PageStr = Request.GetVariable("Page", DefaultsMapsPage);
    filter = Eval(Request.GetVariable("Filter") != "", "&Filter=" $ Request.GetVariable("Filter"), "");
    Response.Subst("IndexURI", ((((DefaultsIndexPage $ "?GameType=") $ GameType) $ "&Page=") $ PageStr) $ filter);
    Response.Subst("MainURI", ((PageStr $ "?GameType=") $ GameType) $ filter);
    Outer.ShowFrame(Response, DefaultPage);
    //return;    
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
        // End:0xEC
        if(Request.GetVariable("GameTypeSet", "") != "")
        {
            TempStr = Request.GetVariable("GameTypeSelect", GameType);
            // End:0xEC
            if(!TempStr ~= GameType)
            {
                GameType = TempStr;
            }
        }
        Response.Subst("GameTypeButton", Outer.SubmitButton("GameTypeSet", Outer.Update));
        Response.Subst("GameTypeSelect", Outer.Select("GameType", Outer.GenerateGameTypeOptions(GameType)));        
    }
    else
    {
        Response.Subst("GameTypeSelect", Outer.Level.Game.default.GameName);
    }
    Response.Subst("DefaultBG", Outer.DefaultBG);
    Content = MakeMenuRow(Response, (GameType $ "&Page=") $ DefaultsMapsPage, DefaultsMapsLink);
    i = 0;
    J0x21E:

    // End:0x2C0 [Loop If]
    if(i < Outer.GamePI.Groups.Length)
    {
        Content = Content $ (MakeMenuRow(Response, (((GameType $ "&Page=") $ DefaultsRulesPage) $ "&Filter=") $ Outer.GamePI.Groups[i], Outer.GamePI.Groups[i]));
        i++;
        // [Loop Continue]
        goto J0x21E;
    }
    Content $= (MakeMenuRow(Response, (GameType $ "&Page=") $ DefaultsIPPolicyPage, DefaultsIPPolicyLink));
    Content $= (MakeMenuRow(Response, (GameType $ "&Page=") $ DefaultsVotingGameConfigPage, DefaultsVotingGameConfigLink));
    Content $= ("<br>" $ (MakeMenuRow(Response, (GameType $ "&Page=") $ DefaultsRestartPage, DefaultsRestartLink)));
    Response.Subst("Content", Content);
    Response.Subst("Filter", Request.GetVariable("Filter", ""));
    Response.Subst("Page", Page);
    Response.Subst("PostAction", DefaultPage);
    Outer.ShowPage(Response, DefaultsIndexPage);
    //return;    
}

function string MakeMenuRow(WebResponse Response, string URI, string Title)
{
    Response.Subst("URI", (DefaultPage $ "?GameType=") $ URI);
    Response.Subst("URIText", Title);
    return Outer.WebInclude("defaults_menu_row");
    //return;    
}

function QueryDefaultsMaps(WebRequest Request, WebResponse Response)
{
    local string GameType, ListName, tmp, MapName, MapURL, CustomMapSelect;

    local StringArray ExcludeMaps, IncludeMaps, MovedMaps;
    local int i, Count, moveCount, id, CurrentList, Index;

    local array<string> Arr;

    // End:0xDCB
    if(Outer.CanPerform("Ml"))
    {
        Request.Dump();
        GameType = Request.GetVariable("GameType");
        Index = Outer.Level.Game.MaplistHandler.GetGameIndex(GameType);
        tmp = Request.GetVariable("MapListNum");
        // End:0xB6
        if(tmp != "")
        {
            CurrentList = int(tmp);            
        }
        else
        {
            CurrentList = Outer.Level.Game.MaplistHandler.GetActiveList(Index);
        }
        ListName = Outer.Level.Game.MaplistHandler.GetMapListTitle(Index, CurrentList);
        ExcludeMaps = Outer.ReloadExcludeMaps(GameType);
        IncludeMaps = Outer.ReloadIncludeMaps(ExcludeMaps, Index, CurrentList);
        MovedMaps = new (none) Class'XWebAdmin_Decompressed.SortedStringArray';
        tmp = Request.GetVariable("MoveMap", "");
        // End:0x92A
        if(tmp != "")
        {
            ListName = Request.GetVariable("ListName", ListName);
            switch(tmp)
            {
                // End:0x1D1
                case " > ":
                // End:0x33C
                case ">":
                    Count = Request.GetVariableCount("ExcludeMapsSelect");
                    i = Count - 1;
                    J0x20D:

                    // End:0x339 [Loop If]
                    if(i >= 0)
                    {
                        // End:0x32F
                        if(ExcludeMaps.Count() > 0)
                        {
                            MapURL = Request.GetVariableNumber("ExcludeMapsSelect", i);
                            MapName = Class'Engine.MaplistRecord'.static.GetBaseMapName(MapURL);
                            id = IncludeMaps.MoveFrom(ExcludeMaps, MapName);
                            // End:0x2FA
                            if(id >= 0)
                            {
                                MovedMaps.CopyFromId(IncludeMaps, id);
                                Outer.Level.Game.MaplistHandler.AddMap(Index, CurrentList, MapName $ MapURL);
                                // [Explicit Continue]
                                goto J0x32F;
                            }
                            Log(InactiveMapNotFound $ Request.GetVariableNumber("ExcludeMapsSelect", i), 'WebAdmin');
                        }
                        J0x32F:

                        i--;
                        // [Loop Continue]
                        goto J0x20D;
                    }
                    // End:0x92A
                    break;
                // End:0x344
                case " < ":
                // End:0x4D7
                case "<":
                    // End:0x4D4
                    if(Request.GetVariableCount("IncludeMapsSelect") > 0)
                    {
                        Count = Request.GetVariableCount("IncludeMapsSelect");
                        i = Count - 1;
                        J0x3A8:

                        // End:0x4D4 [Loop If]
                        if(i >= 0)
                        {
                            MapURL = Request.GetVariableNumber("IncludeMapsSelect", i);
                            MapName = Class'Engine.MaplistRecord'.static.GetBaseMapName(MapURL);
                            // End:0x4CA
                            if(IncludeMaps.Count() > 0)
                            {
                                id = ExcludeMaps.MoveFrom(IncludeMaps, MapName);
                                // End:0x495
                                if(id >= 0)
                                {
                                    MovedMaps.CopyFromId(ExcludeMaps, id);
                                    Outer.Level.Game.MaplistHandler.RemoveMap(Index, CurrentList, MapName $ MapURL);
                                    // [Explicit Continue]
                                    goto J0x4CA;
                                }
                                Log(ActiveMapNotFound $ Request.GetVariableNumber("IncludeMapsSelect", i), 'WebAdmin');
                            }
                            J0x4CA:

                            i--;
                            // [Loop Continue]
                            goto J0x3A8;
                        }
                    }
                    // End:0x92A
                    break;
                // End:0x591
                case ">>":
                    J0x4DE:

                    // End:0x58E [Loop If]
                    if(ExcludeMaps.Count() > 0)
                    {
                        id = IncludeMaps.MoveFromId(ExcludeMaps, ExcludeMaps.Count() - 1);
                        // End:0x58B
                        if(id >= 0)
                        {
                            MovedMaps.CopyFromId(IncludeMaps, id);
                            Outer.Level.Game.MaplistHandler.AddMap(Index, CurrentList, IncludeMaps.GetItem(id));
                        }
                        // [Loop Continue]
                        goto J0x4DE;
                    }
                    // End:0x92A
                    break;
                // End:0x637
                case "<<":
                    J0x598:

                    // End:0x634 [Loop If]
                    if(IncludeMaps.Count() > 0)
                    {
                        id = ExcludeMaps.MoveFromId(IncludeMaps, IncludeMaps.Count() - 1);
                        // End:0x631
                        if(id >= 0)
                        {
                            MovedMaps.CopyFromId(ExcludeMaps, id);
                            Outer.Level.Game.MaplistHandler.ClearList(Index, CurrentList);
                        }
                        // [Loop Continue]
                        goto J0x598;
                    }
                    // End:0x92A
                    break;
                // End:0x7B3
                case "Up":
                    moveCount = int(Abs(float(Request.GetVariable("MoveMapCount"))));
                    Count = Request.GetVariableCount("IncludeMapsSelect");
                    i = 0;
                    J0x696:

                    // End:0x6EA [Loop If]
                    if(i < Count)
                    {
                        MovedMaps.CopyFrom(IncludeMaps, Request.GetVariableNumber("IncludeMapsSelect", i));
                        i++;
                        // [Loop Continue]
                        goto J0x696;
                    }
                    moveCount = -moveCount;
                    i = 0;
                    J0x6FE:

                    // End:0x7B0 [Loop If]
                    if(i < IncludeMaps.Count())
                    {
                        // End:0x7A6
                        if(MovedMaps.FindItemId(IncludeMaps.GetItem(i)) >= 0)
                        {
                            Outer.Level.Game.MaplistHandler.ShiftMap(Index, CurrentList, IncludeMaps.GetItem(i), moveCount);
                            IncludeMaps.ShiftStrict(i, moveCount);
                        }
                        i++;
                        // [Loop Continue]
                        goto J0x6FE;
                    }
                    // End:0x92A
                    break;
                // End:0x927
                case "Down":
                    moveCount = int(Abs(float(Request.GetVariable("MoveMapCount"))));
                    Count = Request.GetVariableCount("IncludeMapsSelect");
                    i = 0;
                    J0x814:

                    // End:0x868 [Loop If]
                    if(i < Count)
                    {
                        MovedMaps.CopyFrom(IncludeMaps, Request.GetVariableNumber("IncludeMapsSelect", i));
                        i++;
                        // [Loop Continue]
                        goto J0x814;
                    }
                    i = IncludeMaps.Count() - 1;
                    J0x880:

                    // End:0x924 [Loop If]
                    if(i >= 0)
                    {
                        // End:0x91A
                        if(MovedMaps.FindItemId(IncludeMaps.GetItem(i)) >= 0)
                        {
                            Outer.Level.Game.MaplistHandler.ShiftMap(Index, CurrentList, IncludeMaps.GetItem(i), moveCount);
                            IncludeMaps.ShiftStrict(i, moveCount);
                        }
                        i--;
                        // [Loop Continue]
                        goto J0x880;
                    }
                    // End:0x92A
                    break;
                // End:0xFFFF
                default:
                    break;
            }
        }
        else
        {
            // End:0x98B
            if(Request.GetVariable("Save") != "")
            {
                ListName = Request.GetVariable("ListName", ListName);
                Outer.UpdateCustomMapList(Index, CurrentList, ListName);                
            }
            else
            {
                // End:0xAC6
                if(Request.GetVariable("New") != "")
                {
                    Arr.Length = 0;
                    i = 0;
                    J0x9B5:

                    // End:0x9F9 [Loop If]
                    if(i < IncludeMaps.Count())
                    {
                        Arr[Arr.Length] = IncludeMaps.GetTag(i);
                        i++;
                        // [Loop Continue]
                        goto J0x9B5;
                    }
                    Outer.Level.Game.MaplistHandler.ResetList(Index, CurrentList);
                    CurrentList = Outer.Level.Game.MaplistHandler.AddList(GameType, Request.GetVariable("ListName", ListName), Arr);
                    ExcludeMaps = Outer.ReloadExcludeMaps(GameType);
                    IncludeMaps = Outer.ReloadIncludeMaps(ExcludeMaps, Index, CurrentList);                    
                }
                else
                {
                    // End:0xB5A
                    if(Request.GetVariable("Use") != "")
                    {
                        ListName = Request.GetVariable("ListName", ListName);
                        Outer.UpdateCustomMapList(Index, CurrentList, ListName);
                        Outer.Level.Game.MaplistHandler.ApplyMapList(Index, CurrentList);                        
                    }
                    else
                    {
                        // End:0xC2A
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
        }/* !MISMATCHING REMOVE, tried If got Type:Else Position:0x92A! */
        else
        {
            Outer.AccessDenied(Response);
        }
        //return;        
    }/* !MISMATCHING REMOVE, tried Else got Type:If Position:0x000! */
}

function QueryDefaultsRules(WebRequest Request, WebResponse Response)
{
    local int i, j;
    local bool bMarked, bSave;
    local string GameType, Content, Data, Op, Mark, filter,
	    SecLevel, TempStr;

    local array<string> Options;

    // End:0x2E
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

    // End:0x988 [Loop If]
    if(i < Outer.GamePI.Settings.Length)
    {
        // End:0x97E
        if(((Outer.GamePI.Settings[i].Grouping == filter) && int(Outer.GamePI.Settings[i].SecLevel) <= Outer.CurAdmin.MaxSecLevel()) && (Outer.GamePI.Settings[i].ExtraPriv == "") || Outer.CanPerform(Outer.GamePI.Settings[i].ExtraPriv))
        {
            // End:0x283
            if(((Outer.GamePI.Settings[i].ArrayDim != -1) || Outer.GamePI.Settings[i].bStruct) || Outer.GamePI.Settings[i].ThisProp.IsA('UArrayProperty'))
            {
                // [Explicit Continue]
                goto J0x97E;
            }
            Options.Length = 0;
            TempStr = Outer.HtmlDecode(Request.GetVariable(Outer.GamePI.Settings[i].SettingName, ""));
            // End:0x31D
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
                // End:0x4BC
                case 3:
                // End:0x690
                case 2:
                    Data = "8";
                    // End:0x577
                    if(Outer.GamePI.Settings[i].Data != "")
                    {
                        // End:0x54F
                        if(Divide(Outer.GamePI.Settings[i].Data, ";", Data, Op))
                        {
                            Outer.GamePI.SplitStringToArray(Options, Op, ":");                            
                        }
                        else
                        {
                            Data = Outer.GamePI.Settings[i].Data;
                        }
                    }
                    j = Min(int(Data), 40);
                    Op = "";
                    // End:0x5C4
                    if(Options.Length > 1)
                    {
                        Op = (((" (" $ Options[0]) $ " - ") $ Options[1]) $ ")";
                    }
                    Response.Subst("Content", Outer.TextBox(Outer.GamePI.Settings[i].SettingName, string(j), string(int(Data)), Outer.HtmlEncode(Outer.GamePI.Settings[i].Value)) $ Op);
                    Response.Subst("FormObject", Outer.WebInclude(Outer.NowrapLeft));
                    // End:0x961
                    break;
                // End:0x7B7
                case 0:
                    // End:0x6E6
                    if(bSave && Outer.GamePI.Settings[i].Value == "")
                    {
                        Outer.GamePI.StoreSetting(i, string(false));
                    }
                    Response.Subst("Content", Outer.Checkbox(Outer.GamePI.Settings[i].SettingName, Outer.GamePI.Settings[i].Value ~= string(true), Outer.GamePI.Settings[i].Data != ""));
                    Response.Subst("FormObject", Outer.WebInclude(Outer.NowrapLeft));
                    // End:0x961
                    break;
                // End:0x95E
                case 1:
                    Data = "";
                    Outer.GamePI.SplitStringToArray(Options, Outer.GamePI.Settings[i].Data, ";");
                    j = 0;
                    J0x80D:

                    // End:0x8D5 [Loop If]
                    if((j + 1) < Options.Length)
                    {
                        Data $= (("<option value='" $ Options[j]) $ "'");
                        // End:0x891
                        if(Outer.GamePI.Settings[i].Value == Options[j])
                        {
                            Data @= "selected";
                        }
                        Data $= ((">" $ Outer.HtmlEncode(Options[j + 1])) $ "</option>");
                        j += 2;
                        // [Loop Continue]
                        goto J0x80D;
                    }
                    Response.Subst("Content", Outer.Select(Outer.GamePI.Settings[i].SettingName, Data));
                    Response.Subst("FormObject", Outer.WebInclude(Outer.NowrapLeft));
                    // End:0x961
                    break;
                // End:0xFFFF
                default:
                    break;
            }
            Content $= Outer.WebInclude(DefaultsRowPage);
        }
        J0x97E:

        i++;
        // [Loop Continue]
        goto J0x107;
    }
    Outer.GamePI.SaveSettings();
    // End:0x9B4
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
    //return;    
}

function QueryDefaultsIPPolicy(WebRequest Request, WebResponse Response)
{
    local int i, j;
    local bool bIpBan;
    local string policies, tmpN, tmpV, PolicyType;

    // End:0x83A
    if(Outer.CanPerform("Xi"))
    {
        Response.Subst("Section", DefaultsIPPolicyLink);
        // End:0x1CA
        if(Request.GetVariable("Update") != "")
        {
            i = int(Request.GetVariable("IpNo", "-1"));
            // End:0x1CA
            if((i > -1) && ValidMask(Request.GetVariable("IPMask")))
            {
                // End:0x13A
                if(i >= Outer.Level.Game.AccessControl.IPPolicies.Length)
                {
                    i = Outer.Level.Game.AccessControl.IPPolicies.Length;
                    Outer.Level.Game.AccessControl.IPPolicies.Length = i + 1;
                }
                Outer.Level.Game.AccessControl.IPPolicies[i] = (Request.GetVariable("AcceptDeny") $ ";") $ Request.GetVariable("IPMask");
                Outer.Level.Game.AccessControl.SaveConfig();
            }
        }
        // End:0x37E
        if(Request.GetVariable("Delete") != "")
        {
            i = int(Request.GetVariable("IdNo", "-1"));
            // End:0x241
            if(i == -1)
            {
                bIpBan = true;
                i = int(Request.GetVariable("IpNo", "-1"));
            }
            // End:0x37E
            if(i > -1)
            {
                // End:0x2E6
                if(bIpBan && i < Outer.Level.Game.AccessControl.IPPolicies.Length)
                {
                    Outer.Level.Game.AccessControl.IPPolicies.Remove(i, 1);
                    Outer.Level.Game.AccessControl.SaveConfig();
                }
                // End:0x37E
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
            J0x3BA:

            // End:0x584 [Loop If]
            if(i < Outer.Level.Game.AccessControl.BannedIDs.Length)
            {
                j = InStr(Outer.Level.Game.AccessControl.BannedIDs[i], " ");
                tmpN = Mid(Outer.Level.Game.AccessControl.BannedIDs[i], j + 1);
                tmpV = Left(Outer.Level.Game.AccessControl.BannedIDs[i], j);
                Response.Subst("PolicyType", IDBan);
                Response.Subst("PolicyCell", ((tmpN $ ":") @ tmpV) $ "&nbsp;&nbsp;");
                Response.Subst("PostAction", (DefaultsIPPolicyPage $ "?IDNo=") $ string(i));
                Response.Subst("UpdateButton", "");
                policies = policies $ Outer.WebInclude(DefaultsIPPolicyPage $ "_row");
                i++;
                // [Loop Continue]
                goto J0x3BA;
            }
        }
        i = 0;
        J0x58B:

        // End:0x7AF [Loop If]
        if(i < Outer.Level.Game.AccessControl.IPPolicies.Length)
        {
            Divide(Outer.Level.Game.AccessControl.IPPolicies[i], ";", tmpN, tmpV);
            PolicyType = (Outer.RadioButton("AcceptDeny", "ACCEPT", tmpN ~= "ACCEPT") @ Outer.Accept) $ "<br>";
            PolicyType = (PolicyType $ Outer.RadioButton("AcceptDeny", "DENY", tmpN ~= "DENY")) @ Outer.Deny;
            Response.Subst("PolicyType", PolicyType);
            Response.Subst("PolicyCell", Outer.TextBox("IPMask", string(15), string(25), tmpV) $ "&nbsp;&nbsp;");
            Response.Subst("PostAction", (DefaultsIPPolicyPage $ "?IpNo=") $ string(i));
            Response.Subst("UpdateButton", Outer.SubmitButton("Update", Outer.Update));
            policies = policies $ Outer.WebInclude(DefaultsIPPolicyPage $ "_row");
            i++;
            // [Loop Continue]
            goto J0x58B;
        }
        Response.Subst("Policies", policies);
        Response.Subst("PostAction", (DefaultsIPPolicyPage $ "?IpNo=") $ string(i));
        Response.Subst("PageHelp", NotePolicyPage);
        Outer.ShowPage(Response, DefaultsIPPolicyPage);        
    }
    else
    {
        Outer.AccessDenied(Response);
    }
    //return;    
}

function QueryVotingGameConfig(WebRequest Request, WebResponse Response)
{
    local int i, j, k, X, columns, Count,
	    GameConfigIndex;

    local string PageText, GameConfigData, ColumnTitle, Value;
    local array<string> Parts, MutatorList;

    // End:0xA9E
    if(Outer.CanPerform("Ms"))
    {
        Response.Subst("Section", DefaultsVotingGameConfigLink);
        PageText = "";
        i = 0;
        J0x42:

        // End:0xEE [Loop If]
        if(Outer.Level.Game.VotingHandler.GetConfigArrayColumnTitle("GameConfig", i) != "")
        {
            PageText = ((PageText $ "<th nowrap>") $ Outer.Level.Game.VotingHandler.GetConfigArrayColumnTitle("GameConfig", i)) $ "</th>";
            i++;
            // [Loop Continue]
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
                J0x17B:

                // End:0x2F2 [Loop If]
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

                        // End:0x286 [Loop If]
                        if(k < Count)
                        {
                            // End:0x242
                            if(Request.GetVariableNumber(ColumnTitle, k) ~= "NONE")
                            {
                                Value = "NONE";
                                // [Explicit Break]
                                goto J0x286;
                            }
                            // End:0x25A
                            if(Value != "")
                            {
                                Value $= ",";
                            }
                            Value $= Request.GetVariableNumber(ColumnTitle, k);
                            k++;
                            // [Loop Continue]
                            goto J0x200;
                        }
                        J0x286:
                        
                    }
                    else
                    {
                        Value = Request.GetVariable(ColumnTitle);
                    }
                    Outer.Level.Game.VotingHandler.UpdateConfigArrayItem("GameConfig", GameConfigIndex, j, Value);
                    j++;
                    // [Loop Continue]
                    goto J0x17B;
                }
                Outer.Level.Game.VotingHandler.SaveConfig();
                GameConfigIndex = -1;
            }
        }
        // End:0x3BE
        if(Request.GetVariable("Delete") != "")
        {
            // End:0x3BE
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

        // End:0x987 [Loop If]
        if(i < Outer.Level.Game.VotingHandler.GetConfigArrayItemCount("GameConfig"))
        {
            PageText $= (((("<tr><form method=\"post\" action=\"" $ DefaultsVotingGameConfigPage) $ "?GameConfigIndex=") $ string(i)) $ "\">");
            j = 0;
            J0x4E2:

            // End:0x8B8 [Loop If]
            if(j < columns)
            {
                PageText $= "<td valign=\"top\">";
                GameConfigData = Outer.Level.Game.VotingHandler.GetConfigArrayData("GameConfig", i, j);
                Split(GameConfigData, ";", Parts);
                // End:0x714
                if(i == GameConfigIndex)
                {
                    switch(Caps(Parts[0]))
                    {
                        // End:0x5F2
                        case "TEXT":
                            PageText $= Outer.TextBox(Outer.Level.Game.VotingHandler.GetConfigArrayColumnTitle("GameConfig", j), string(15), string(int(Parts[1])), Parts[2]);
                            // End:0x711
                            break;
                        // End:0x66C
                        case "GAMETYPE":
                            PageText $= Outer.Select(Outer.Level.Game.VotingHandler.GetConfigArrayColumnTitle("GameConfig", j), Outer.GenerateGameTypeOptions(Parts[2]));
                            // End:0x711
                            break;
                        // End:0x70E
                        case "MUTATORS":
                            PageText $= (((("<select name=\"" $ Outer.Level.Game.VotingHandler.GetConfigArrayColumnTitle("GameConfig", j)) $ "\" size=5 multiple>") $ Outer.GenerateMutatorOptions(Parts[2])) $ "</select>");
                            // End:0x711
                            break;
                        // End:0xFFFF
                        default:
                            break;
                    }                    
                }
                else
                {
                    switch(Caps(Parts[0]))
                    {
                        // End:0x73C
                        case "TEXT":
                            PageText $= Parts[2];
                            // End:0x89E
                            break;
                        // End:0x7C1
                        case "GAMETYPE":
                            k = 0;
                            J0x750:

                            // End:0x7BE [Loop If]
                            if(k < Outer.AllGames.Length)
                            {
                                // End:0x7B4
                                if(Parts[2] ~= Outer.AllGames[k].ClassName)
                                {
                                    PageText $= Outer.AllGames[k].GameName;
                                    // [Explicit Break]
                                    goto J0x7BE;
                                }
                                k++;
                                // [Loop Continue]
                                goto J0x750;
                            }
                            J0x7BE:

                            // End:0x89E
                            break;
                        // End:0x89B
                        case "MUTATORS":
                            Split(Parts[2], ",", MutatorList);
                            X = 0;
                            J0x7E7:

                            // End:0x898 [Loop If]
                            if(X < MutatorList.Length)
                            {
                                k = 0;
                                J0x7FE:

                                // End:0x88E [Loop If]
                                if(k < Outer.AllMutators.Length)
                                {
                                    // End:0x884
                                    if(MutatorList[X] ~= Outer.AllMutators[k].ClassName)
                                    {
                                        PageText $= Outer.AllMutators[k].FriendlyName;
                                        // End:0x881
                                        if(X < (MutatorList.Length - 1))
                                        {
                                            PageText $= ",";
                                        }
                                        // [Explicit Break]
                                        goto J0x88E;
                                    }
                                    k++;
                                    // [Loop Continue]
                                    goto J0x7FE;
                                }
                                J0x88E:

                                X++;
                                // [Loop Continue]
                                goto J0x7E7;
                            }
                            // End:0x89E
                            break;
                        // End:0xFFFF
                        default:
                            break;
                    }
                }
                PageText $= "</td>";
                j++;
                // [Loop Continue]
                goto J0x4E2;
            }
            PageText $= "<td>";
            // End:0x935
            if(i == GameConfigIndex)
            {
                PageText $= Outer.SubmitButton("Update", Outer.Update);
                PageText $= Outer.SubmitButton("Delete", Outer.DeleteText);                
            }
            else
            {
                PageText $= Outer.SubmitButton("Edit", Outer.Edit);
            }
            PageText $= "</td></form></tr>";
            i++;
            // [Loop Continue]
            goto J0x445;
        }
        PageText $= (((((("<tr><td colspan=" $ string(columns + 1)) $ "><form method=\"post\" action=\"") $ DefaultsVotingGameConfigPage) $ "?GameConfigIndex=-1") $ string(i)) $ "\">");
        PageText $= Outer.SubmitButton("New", Outer.NewText);
        PageText $= "</form></td></tr>";
        Response.Subst("GameConfigs", PageText);
        Response.Subst("PageHelp", NoteVotingGameConfigPage);
        Outer.ShowPage(Response, DefaultsVotingGameConfigPage);        
    }
    else
    {
        Outer.AccessDenied(Response);
    }
    //return;    
}

function bool ValidMask(string Mask)
{
    local int i;
    local string Octets[4], tmp;

    J0x00:
    // End:0x6B [Loop If]
    if(Mask != "")
    {
        // End:0x57
        if(Left(Mask, 1) == ".")
        {
            // End:0x2E
            if(!ValidOctet(tmp))
            {
                return false;
            }
            Octets[i++] = tmp;
            Mask = Mid(Mask, 1);
            tmp = "";
        }
        EatStr(tmp, Mask, 1);
        // [Loop Continue]
        goto J0x00;
    }
    // End:0x7D
    if(!ValidOctet(tmp))
    {
        return false;
    }
    Octets[i++] = tmp;
    // End:0x9E
    if(i > 4)
    {
        return false;
    }
    return true;
    //return;    
}

function bool ValidOctet(string tmp)
{
    local int i;

    // End:0x0E
    if(tmp == "")
    {
        return false;
    }
    // End:0x1E
    if(ValidMaskOctet(tmp))
    {
        return true;
    }
    i = int(tmp);
    // End:0x47
    if((i == 0) && tmp != "0")
    {
        return false;
    }
    // End:0x62
    if((i < 0) || i > 255)
    {
        return false;
    }
    return true;
    //return;    
}

function bool ValidMaskOctet(string tmp)
{
    local string S;

    // End:0x30
    if(((tmp == "") || Len(tmp) > 3) || Right(tmp, 1) != "*")
    {
        return false;
    }
    J0x30:

    // End:0x89 [Loop If]
    if(tmp != "")
    {
        S = Left(tmp, 1);
        // End:0x5A
        if(S == "*")
        {
            // [Explicit Break]
            goto J0x89;
        }
        // End:0x78
        if((S < "0") || S > "9")
        {
            return false;
        }
        tmp = Mid(tmp, 1);
        // [Loop Continue]
        goto J0x30;
    }
    J0x89:

    return true;
    //return;    
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