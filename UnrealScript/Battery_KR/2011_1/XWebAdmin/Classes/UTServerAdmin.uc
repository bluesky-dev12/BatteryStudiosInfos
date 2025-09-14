class UTServerAdmin extends WebApplication
    config;

struct HtmlChar
{
    var string Plain;
    var string Coded;
};

var config string ActiveSkin;
var() config array<string> QueryHandlerClasses;
var array<xWebQueryHandler> QueryHandlers;
var() array< Class<WebSkin> > WebSkins;
var() Class<UTServerAdminSpectator> SpectatorType;
var() Class<WebSkin> DefaultWebSkinClass;
var WebSkin CurrentSkin;
var UTServerAdminSpectator Spectator;
var wAdminUser CurAdmin;
var PlayInfo GamePI;
var WebResponse Resp;
var array<GameRecord> AllGames;
var array<MapRecord> AllMaps;
var array<MutatorRecord> AllMutators;
var StringArray AGameType;
var StringArray AExcMutators;
var StringArray AIncMutators;
var StringArray Skins;
var array<HtmlChar> SpecialChars;
var config string DefaultBG;
var config string HighlightedBG;
var config string RootFrame;
var config string HeaderPage;
var config string MessagePage;
var config string FramedMessagePage;
var config string RestartPage;
var string htm;
var config string AdminRealm;
var string SkinPath;
var string SiteCSSFile;
var string SiteBG;
var string StatusOKColor;
var string StatusErrorColor;
var config string CellLeft;
var config string CellCenter;
var config string CellRight;
var config string CellColSpan;
var config string NowrapLeft;
var config string NowrapCenter;
var config string NowrapRight;
var config string RowLeft;
var config string RowCenter;
var config string CheckboxInclude;
var config string TextboxInclude;
var config string SubmitButtonInclude;
var config string RadioButtonInclude;
var config string SelectInclude;
var config string ResetButtonInclude;
var config string HiddenInclude;
var config string SkinSelectInclude;
var localized string Accept;
var localized string Deny;
var localized string Update;
var localized string Custom;
var localized string Error;
var localized string NoneText;
var localized string SwitchText;
var localized string DeleteText;
var localized string NewText;
var localized string Edit;
var localized string WaitTitle;
var localized string MapChanging;
var localized string MapChangingTo;
var localized string AccessDeniedText;
var localized string ErrorAuthenticating;
var localized string NoPrivs;
var localized string LoadingGames;
var localized string LoadingMaps;
var localized string Initialized;
var bool bDebug;

event Init()
{
    super.Init();
    // End:0x2B
    if(SpectatorType != none)
    {
        Spectator = Level.Spawn(SpectatorType);        
    }
    else
    {
        Spectator = Level.Spawn(Class'XWebAdmin_Decompressed.UTServerAdminSpectator');
    }
    // End:0x5D
    if(Spectator != none)
    {
        Spectator.Server = self;
    }
    LoadMaps();
    LoadGameTypes();
    LoadMutators();
    LoadQueryHandlers();
    ReplaceText(Initialized, "%class%", string(Class));
    ReplaceText(Initialized, "%port%", string(WebServer.ListenPort));
    Log(Initialized, 'WebAdmin');
    //return;    
}

function LoadMaps()
{
    Log(LoadingMaps, 'WebAdmin');
    Class'Engine.CacheManager'.static.GetMapList(AllMaps);
    //return;    
}

function LoadGameTypes()
{
    local int i;

    Log(LoadingGames, 'WebAdmin');
    AGameType = new (none) Class'XWebAdmin_Decompressed.SortedStringArray';
    Class'Engine.CacheManager'.static.GetGameTypeList(AllGames);
    i = 0;
    J0x33:

    // End:0x7C [Loop If]
    if(i < AllGames.Length)
    {
        AGameType.Add(AllGames[i].ClassName, AllGames[i].GameName);
        i++;
        // [Loop Continue]
        goto J0x33;
    }
    //return;    
}

function LoadMutators()
{
    local Mutator M;
    local int i, id;

    AExcMutators = new (none) Class'XWebAdmin_Decompressed.StringArray';
    AIncMutators = new (none) Class'XWebAdmin_Decompressed.SortedStringArray';
    // End:0x32
    if(Level.IsDemoBuild())
    {
        return;
    }
    Class'Engine.CacheManager'.static.GetMutatorList(AllMutators);
    i = 0;
    J0x4A:

    // End:0x8A [Loop If]
    if(i < AllMutators.Length)
    {
        AExcMutators.Add(string(i), AllMutators[i].ClassName);
        i++;
        // [Loop Continue]
        goto J0x4A;
    }
    M = Level.Game.BaseMutator;
    J0xA7:

    // End:0x174 [Loop If]
    if(M != none)
    {
        // End:0x15D
        if(M.bUserAdded)
        {
            id = AExcMutators.FindTagId(string(M.Class));
            // End:0x12A
            if(id >= 0)
            {
                AIncMutators.Add(AExcMutators.GetItem(id), AllMutators[id].FriendlyName);                
            }
            else
            {
                Log("Unknown Mutator in use: " @ string(M.Class), 'WebAdmin');
            }
        }
        M = M.NextMutator;
        // [Loop Continue]
        goto J0xA7;
    }
    //return;    
}

function LoadQueryHandlers()
{
    local int i, j;
    local xWebQueryHandler QH;
    local Class<xWebQueryHandler> QHC;

    LoadSkins();
    i = 0;
    J0x0D:

    // End:0x199 [Loop If]
    if(i < QueryHandlerClasses.Length)
    {
        QHC = Class<xWebQueryHandler>(DynamicLoadObject(QueryHandlerClasses[i], Class'Core.Class'));
        // End:0x132
        if(QHC != none)
        {
            j = 0;
            J0x50:

            // End:0x92 [Loop If]
            if(j < QueryHandlers.Length)
            {
                // End:0x88
                if(QueryHandlers[j].Class == QHC)
                {
                    QHC = none;
                    // [Explicit Break]
                    goto J0x92;
                }
                j++;
                // [Loop Continue]
                goto J0x50;
            }
            J0x92:

            // End:0x12F
            if(QHC != none)
            {
                QH = new (self) QHC;
                // End:0x12F
                if(QH != none)
                {
                    // End:0xF1
                    if(QH.Init())
                    {
                        QueryHandlers.Length = QueryHandlers.Length + 1;
                        QueryHandlers[QueryHandlers.Length - 1] = QH;                        
                    }
                    else
                    {
                        Log(("WebQueryHandler:" @ string(QHC)) @ "could not be initialized", 'WebAdmin');
                    }
                }
            }
            // [Explicit Continue]
            goto J0x18F;
        }
        Log(("Invalid QueryHandlerClass:" $ QueryHandlerClasses[i]) $ ".  Removing invalid entry.", 'WebAdmin');
        QueryHandlerClasses.Remove(i, 1);
        SaveConfig();
        J0x18F:

        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

function string SetGamePI(optional string GameType)
{
    local Class<Info> TmpClass;
    local array< Class<Info> > InfoClasses;
    local int i;

    // End:0x4D
    if(GameType == "")
    {
        InfoClasses[0] = Level.Game.Class;
        GameType = string(Level.Game.Class);        
    }
    else
    {
        TmpClass = Class<Info>(DynamicLoadObject(GameType, Class'Core.Class'));
        // End:0x9C
        if(TmpClass == none)
        {
            Log("Error loading gametype" @ GameType, 'WebAdmin');
            return "";
        }
        InfoClasses[0] = TmpClass;
    }
    // End:0xC3
    if(GamePI == none)
    {
        GamePI = new (none) Class'Engine.PlayInfo';
    }
    // End:0x108
    if(Level.Game.AccessControl != none)
    {
        InfoClasses[1] = Level.Game.AccessControl.Class;
    }
    J0x108:

    // End:0x17A [Loop If]
    if(i < AIncMutators.Count())
    {
        TmpClass = Class<Info>(DynamicLoadObject(AllMutators[int(AIncMutators.GetItem(i++))].ClassName, Class'Core.Class'));
        // End:0x177
        if(TmpClass != none)
        {
            InfoClasses[InfoClasses.Length] = TmpClass;
        }
        // [Loop Continue]
        goto J0x108;
    }
    GamePI.Init(InfoClasses);
    return GameType;
    //return;    
}

function StringArray ReloadExcludeMaps(string GameType)
{
    local int i, GameIndex;
    local string MapPrefix;
    local StringArray AMaps;
    local array<MapRecord> MapRecords;

    // End:0x2B
    if(GameType == "")
    {
        GameType = string(Level.Game.Class);
    }
    GameIndex = GetGameCacheIndex(GameType);
    // End:0x83
    if(GameIndex == -1)
    {
        Warn(("Could not load gametype" @ GameType) @ "for maplist.");
        return AMaps;
    }
    AMaps = new (none) Class'XWebAdmin_Decompressed.SortedStringArray';
    MapPrefix = AllGames[GameIndex].MapPrefix;
    Class'Engine.CacheManager'.static.GetMapList(MapRecords, MapPrefix);
    i = 0;
    J0xC5:

    // End:0x187 [Loop If]
    if(i < MapRecords.Length)
    {
        // End:0x17D
        if(ValidMap(MapRecords[i].MapName))
        {
            // End:0x14D
            if(bDebug)
            {
                Log(((("Adding entry to exclude maplist  Item '" $ string(i)) $ "' Tag '") $ MapRecords[i].MapName) $ "'");
            }
            AMaps.Add(MapRecords[i].MapName, MapRecords[i].MapName, true);
        }
        i++;
        // [Loop Continue]
        goto J0xC5;
    }
    return AMaps;
    //return;    
}

function StringArray ReloadIncludeMaps(StringArray ExMaps, int GameIndex, int MapListIndex)
{
    local int i, id;
    local string MapName;
    local array<string> Maps;
    local StringArray Arr;

    Arr = new (none) Class'XWebAdmin_Decompressed.StringArray';
    Maps = Level.Game.MaplistHandler.GetMapList(GameIndex, MapListIndex);
    i = 0;
    J0x47:

    // End:0x144 [Loop If]
    if(i < Maps.Length)
    {
        MapName = Class'Engine.MaplistRecord'.static.GetBaseMapName(Maps[i]);
        Arr.Add(MapName $ Maps[i], MapName, true);
        // End:0xFD
        if(bDebug)
        {
            Log((((("Adding map entry to include list Item '" $ MapName) $ Maps[i]) $ "' Tag '") $ MapName) $ "'");
        }
        id = ExMaps.FindTagId(MapName);
        // End:0x13A
        if(id != -1)
        {
            ExMaps.Remove(id);
        }
        i++;
        // [Loop Continue]
        goto J0x47;
    }
    return Arr;
    //return;    
}

function CreateFullMutatorList(out StringArray Mutators, out StringArray GroupsOnly)
{
    local StringArray Grouped;
    local int i, j, Z;
    local string GrpName, thisgroup, nextgroup;

    Grouped = new (none) Class'XWebAdmin_Decompressed.SortedStringArray';
    i = 0;
    J0x16:

    // End:0xDD [Loop If]
    if(i < Mutators.Count())
    {
        j = int(Mutators.GetItem(i));
        // End:0x79
        if(AllMutators[j].GroupName == "")
        {
            GrpName = "Z" $ string(Z++);            
        }
        else
        {
            GrpName = AllMutators[j].GroupName;
        }
        Grouped.Add(string(j), ((GrpName $ ".") $ AllMutators[j].FriendlyName) $ AllMutators[j].ClassName);
        i++;
        // [Loop Continue]
        goto J0x16;
    }
    i = 0;
    J0xE4:

    // End:0x2C0 [Loop If]
    if(i < Grouped.Count())
    {
        thisgroup = AllMutators[int(Grouped.GetItem(i))].GroupName;
        nextgroup = "";
        // End:0x13B
        if(thisgroup == "")
        {
            // [Explicit Continue]
            goto J0x2B6;
        }
        // End:0x181
        if((i + 1) < Grouped.Count())
        {
            nextgroup = AllMutators[int(Grouped.GetItem(i + 1))].GroupName;
        }
        // End:0x2B6
        if(thisgroup ~= nextgroup)
        {
            j = i;
            J0x19B:

            // End:0x25B [Loop If]
            if((nextgroup ~= thisgroup) && j < Grouped.Count())
            {
                GroupsOnly.MoveFromId(Grouped, Grouped.FindItemId(Grouped.GetItem(j)));
                thisgroup = nextgroup;
                // End:0x22E
                if((j + 1) == Grouped.Count())
                {
                    nextgroup = "";                    
                }
                else
                {
                    nextgroup = AllMutators[int(Grouped.GetItem(j + 1))].GroupName;
                }
                // [Loop Continue]
                goto J0x19B;
            }
            // End:0x2AB
            if(j < Grouped.Count())
            {
                GroupsOnly.MoveFromId(Grouped, Grouped.FindItemId(Grouped.GetItem(j)));
            }
            i = -1;
        }
        J0x2B6:

        i++;
        // [Loop Continue]
        goto J0xE4;
    }
    Mutators.Reset();
    i = 0;
    J0x2D6:

    // End:0x33B [Loop If]
    if(i < Grouped.Count())
    {
        j = int(Grouped.GetItem(i));
        Mutators.Add(string(j), AllMutators[j].FriendlyName);
        i++;
        // [Loop Continue]
        goto J0x2D6;
    }
    Grouped.Reset();
    //return;    
}

function LoadSkins()
{
    local int i;
    local string S;
    local Class<WebSkin> SkinClass;

    Skins = new (none) Class'XWebAdmin_Decompressed.StringArray';
    S = Level.GetNextInt("XWebAdmin.WebSkin", i++);
    J0x3E:

    // End:0xE7 [Loop If]
    if(S != "")
    {
        SkinClass = Class<WebSkin>(DynamicLoadObject(S, Class'Core.Class'));
        // End:0xB5
        if(SkinClass != none)
        {
            Skins.Add(Level.GetItemName(string(SkinClass)), SkinClass.default.DisplayName);
            WebSkins[WebSkins.Length] = SkinClass;
        }
        S = Level.GetNextInt("XWebAdmin.WebSkin", i++);
        // [Loop Continue]
        goto J0x3E;
    }
    ApplySkinSettings();
    //return;    
}

function ApplySkinSettings()
{
    local int i;

    // End:0x0D
    if(Skins == none)
    {
        return;
    }
    // End:0x45
    if((CurrentSkin != none) && Level.GetItemName(string(CurrentSkin.Class)) ~= ActiveSkin)
    {
        return;
    }
    i = Skins.FindItemId(ActiveSkin);
    // End:0x7C
    if(i < 0)
    {
        CurrentSkin = new (none) Class'XWebAdmin_Decompressed.UT2K3Skin';        
    }
    else
    {
        CurrentSkin = new (none) WebSkins[i];
    }
    // End:0xAC
    if(CurrentSkin != none)
    {
        CurrentSkin.Init(self);
    }
    //return;    
}

function ServerChangeMap(WebRequest Request, WebResponse Response, string MapName, string GameType)
{
    local int i;
    local bool bConflict;
    local string Conflicts, str, ShortName, Muts;

    // End:0x2A
    if(Level.NextURL != "")
    {
        ShowMessage(Response, WaitTitle, MapChanging);
    }
    // End:0xA3
    if(Request.GetVariable("Save", "") != "")
    {
        i = 0;
        J0x4F:

        // End:0xA0 [Loop If]
        if(i < GamePI.Settings.Length)
        {
            ShortName = Level.GetItemName(GamePI.Settings[i].SettingName);
            i++;
            // [Loop Continue]
            goto J0x4F;
        }        
    }
    else
    {
        bConflict = false;
        Conflicts = "";
        GameType = SetGamePI(GameType);
        i = 0;
        J0xCB:

        // End:0x294 [Loop If]
        if(i < GamePI.Settings.Length)
        {
            // End:0x28A
            if(((HasURLOption(GamePI.Settings[i].SettingName, str)) && !GamePI.Settings[i].Value ~= str) && GamePI.Settings[i].SettingName != "GameReplicationInfo.AdminName")
            {
                Response.Subst("SettingName", GamePI.Settings[i].SettingName);
                Response.Subst("SettingText", GamePI.Settings[i].DisplayName);
                Response.Subst("DefVal", GamePI.Settings[i].Value);
                Response.Subst("URLVal", str);
                Response.Subst("MapName", MapName);
                Response.Subst("GameType", GameType);
                Conflicts = Conflicts $ (WebInclude(RestartPage $ "_row"));
                bConflict = true;
            }
            i++;
            // [Loop Continue]
            goto J0xCB;
        }
        // End:0x33A
        if(bConflict)
        {
            Response.Subst("Conflicts", Conflicts);
            Response.Subst("PostAction", RestartPage);
            Response.Subst("Section", "Restart Conflicts");
            Response.Subst("SubmitValue", Accept);
            ShowPage(Response, RestartPage);
            return;
        }
    }
    Muts = UsedMutators();
    // End:0x36A
    if(Muts != "")
    {
        Muts = "?Mutator=" $ Muts;
    }
    Level.ServerTravel(((MapName $ "?Game=") $ GameType) $ Muts, false);
    ShowMessage(Response, WaitTitle, MapChanging);
    //return;    
}

function UpdateCustomMapList(int GameIndex, int Index, string NewName)
{
    // End:0x6D
    if(!Level.Game.MaplistHandler.GetMapListTitle(GameIndex, Index) == NewName)
    {
        Index = Level.Game.MaplistHandler.RenameList(GameIndex, Index, NewName);
    }
    // End:0xCB
    if(Level.Game.MaplistHandler.GetActiveList(GameIndex) == Index)
    {
        Level.Game.MaplistHandler.ApplyMapList(GameIndex, Index);        
    }
    else
    {
        Level.Game.MaplistHandler.SaveMapList(GameIndex, Index);
    }
    //return;    
}

function CleanupApp()
{
    local int i;

    // End:0x12
    if(Spectator != none)
    {
        Spectator = none;
    }
    i = 0;
    J0x19:

    // End:0x48 [Loop If]
    if(i < QueryHandlers.Length)
    {
        QueryHandlers[i].Cleanup();
        i++;
        // [Loop Continue]
        goto J0x19;
    }
    // End:0x59
    if(Resp != none)
    {
        CleanupQuery();
    }
    super.CleanupApp();
    //return;    
}

function bool PreQuery(WebRequest Request, WebResponse Response)
{
    local bool bResult;
    local int i;

    // End:0x57
    if(((Level == none) || Level.Game == none) || Level.Game.AccessControl == none)
    {
        ShowMessage(Response, Error, ErrorAuthenticating);
        return false;
    }
    // End:0x68
    if(Resp != none)
    {
        CleanupQuery();
    }
    // End:0xCA
    if(Spectator == none)
    {
        // End:0x98
        if(SpectatorType != none)
        {
            Spectator = Level.Spawn(SpectatorType);            
        }
        else
        {
            Spectator = Level.Spawn(Class'XWebAdmin_Decompressed.UTServerAdminSpectator');
        }
        // End:0xCA
        if(Spectator != none)
        {
            Spectator.Server = self;
        }
    }
    // End:0xEC
    if(Spectator == none)
    {
        ShowMessage(Response, Error, ErrorAuthenticating);
        return false;
    }
    // End:0x149
    if(!Level.Game.AccessControl.AdminLogin(Spectator, Request.UserName, Request.Password))
    {
        Response.FailAuthentication(AdminRealm);
        return false;
    }
    CurAdmin = Level.Game.AccessControl.GetLoggedAdmin(Spectator);
    // End:0x1BD
    if(CurAdmin == none)
    {
        ShowMessage(Response, Error, ErrorAuthenticating);
        Level.Game.AccessControl.AdminLogout(Spectator);
        return false;
    }
    Resp = Response;
    bResult = true;
    i = 0;
    J0x1D7:

    // End:0x21D [Loop If]
    if(i < QueryHandlers.Length)
    {
        // End:0x213
        if(!QueryHandlers[i].PreQuery(Request, Response))
        {
            bResult = false;
        }
        i++;
        // [Loop Continue]
        goto J0x1D7;
    }
    return bResult;
    //return;    
}

event Query(WebRequest Request, WebResponse Response)
{
    local int i;

    Response.Subst("BugAddress", ("webadminbugs" $ Level.EngineVersion) $ "@epicgames.com");
    Response.Subst("CSS", SiteCSSFile);
    Response.Subst("BODYBG", SiteBG);
    // End:0x117
    if((CurrentSkin != none) && CurrentSkin.SpecialQuery.Length > 0)
    {
        i = 0;
        J0xA9:

        // End:0x117 [Loop If]
        if(i < CurrentSkin.SpecialQuery.Length)
        {
            // End:0x10D
            if(CurrentSkin.SpecialQuery[i] ~= Mid(Request.URI, 1))
            {
                // End:0x10A
                if(CurrentSkin.HandleSpecialQuery(Request, Response))
                {
                    return;
                }
                // [Explicit Break]
                goto J0x117;
            }
            i++;
            // [Loop Continue]
            goto J0xA9;
        }
    }
    J0x117:

    switch(Mid(Request.URI, 1))
    {
        // End:0x12F
        case "":
        // End:0x149
        case RootFrame:
            QueryRootFrame(Request, Response);
            return;
        // End:0x163
        case HeaderPage:
            QueryHeaderPage(Request, Response);
            return;
        // End:0x188
        case RestartPage:
            // End:0x186
            if(!MapIsChanging())
            {
                QuerySubmitRestartPage(Request, Response);
            }
            return;
        // End:0x1CF
        case SiteCSSFile:
            Response.SendCachedFile(((Path $ SkinPath) $ "/") $ Mid(Request.URI, 1), "text/css");
            return;
        // End:0xFFFF
        default:
            i = 0;
            J0x1D9:

            // End:0x217 [Loop If]
            if(i < QueryHandlers.Length)
            {
                // End:0x20D
                if(QueryHandlers[i].Query(Request, Response))
                {
                    return;
                }
                i++;
                // [Loop Continue]
                goto J0x1D9;
            }
            ShowMessage(Response, Error, "Page not found!");
            return;
            break;
    }
    //return;    
}

event PostQuery(WebRequest Request, WebResponse Response)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x5F [Loop If]
    if(i < QueryHandlers.Length)
    {
        // End:0x55
        if(!QueryHandlers[i].PostQuery(Request, Response))
        {
            Response.Connection.bDelayCleanup = true;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    // End:0x7C
    if(Response.Connection.IsHanging())
    {
        return;
    }
    CleanupQuery();
    //return;    
}

function CleanupQuery()
{
    // End:0x40
    if((Resp != none) && Resp.Connection.IsHanging())
    {
        Resp.Connection.Timer();
    }
    Resp = none;
    CurAdmin = none;
    Level.Game.AccessControl.AdminLogout(Spectator);
    //return;    
}

function QueryRootFrame(WebRequest Request, WebResponse Response)
{
    local string GroupPage;

    // End:0x22
    if(QueryHandlers.Length > 0)
    {
        GroupPage = QueryHandlers[0].DefaultPage;
    }
    // End:0x70
    if(Request.GetVariable("ChangeSkin") != "")
    {
        ActiveSkin = Request.GetVariable("WebSkin", ActiveSkin);
        ApplySkinSettings();
        SaveConfig();
    }
    GroupPage = Request.GetVariable("Group", GroupPage);
    Response.Subst("HeaderURI", (HeaderPage $ "?Group=") $ GroupPage);
    Response.Subst("BottomURI", GroupPage);
    Response.Subst("ServerName", Class'Engine.GameReplicationInfo'.default.ServerName);
    ShowFrame(Response, RootFrame);
    //return;    
}

function QueryHeaderPage(WebRequest Request, WebResponse Response)
{
    local int i;
    local string Menu, GroupPage, Dis, CurPageTitle;

    Response.Subst("AdminName", CurAdmin.UserName);
    Response.Subst("HeaderColSpan", "2");
    // End:0x20A
    if(QueryHandlers.Length > 0)
    {
        GroupPage = Request.GetVariable("Group", QueryHandlers[0].DefaultPage);
        Menu = "";
        CurPageTitle = "";
        i = 0;
        J0x98:

        // End:0x1CC [Loop If]
        if(i < QueryHandlers.Length)
        {
            // End:0xE0
            if(QueryHandlers[i].DefaultPage == GroupPage)
            {
                CurPageTitle = QueryHandlers[i].Title;
            }
            Dis = "";
            // End:0x12D
            if((QueryHandlers[i].NeededPrivs != "") && !CanPerform(QueryHandlers[i].NeededPrivs))
            {
                Dis = "d";
            }
            Response.Subst("MenuLink", (RootFrame $ "?Group=") $ QueryHandlers[i].DefaultPage);
            Response.Subst("MenuTitle", QueryHandlers[i].Title);
            Menu = Menu $ (WebInclude((HeaderPage $ "_item") $ Dis));
            i++;
            // [Loop Continue]
            goto J0x98;
        }
        Response.Subst("Location", CurPageTitle);
        Response.Subst("HeaderMenu", Menu);
    }
    // End:0x291
    if(CanPerform("Xs"))
    {
        Response.Subst("HeaderColSpan", "3");
        Response.Subst("SkinSelect", Select("WebSkin", GenerateSkinSelect()));
        Response.Subst("WebSkinSelect", WebInclude(SkinSelectInclude));
    }
    ShowPage(Response, HeaderPage);
    //return;    
}

function QueryRestartPage(WebRequest Request, WebResponse Response)
{
    // End:0x51
    if(CanPerform("Mr|Mt|Mm|Ms|Mu|Ml"))
    {
        ServerChangeMap(Request, Response, Level.GetURLMap(), string(Level.Game.Class));
    }
    //return;    
}

function QuerySubmitRestartPage(WebRequest Request, WebResponse Response)
{
    // End:0x5D
    if(CanPerform("Mr|Mt|Mm|Ms|Mu|Ml"))
    {
        ServerChangeMap(Request, Response, Request.GetVariable("MapName"), Request.GetVariable("GameType"));
    }
    //return;    
}

function AccessDenied(WebResponse Response)
{
    ShowMessage(Response, AccessDeniedText, NoPrivs);
    //return;    
}

function string GenerateGameTypeOptions(string CurrentGameType)
{
    local int i;
    local string SelectedStr, OptionStr;

    i = 0;
    J0x07:

    // End:0xCC [Loop If]
    if(i < AGameType.Count())
    {
        // End:0x52
        if(CurrentGameType ~= AGameType.GetItem(i))
        {
            SelectedStr = " selected";            
        }
        else
        {
            SelectedStr = "";
        }
        OptionStr = ((((((OptionStr $ "<option value=\"") $ AGameType.GetItem(i)) $ "\"") $ SelectedStr) $ ">") $ AGameType.GetTag(i)) $ "</option>";
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return OptionStr;
    //return;    
}

function string GenerateMutatorOptions(string SelectedMutators)
{
    local int i, j;
    local string SelectedStr, OptionStr;
    local array<string> MutatorList;
    local StringArray SortedMutatorList;
    local bool bNoMutators;

    Split(SelectedMutators, ",", MutatorList);
    SortedMutatorList = new (none) Class'XWebAdmin_Decompressed.SortedStringArray';
    i = 0;
    J0x25:

    // End:0x6E [Loop If]
    if(i < AllMutators.Length)
    {
        SortedMutatorList.Add(AllMutators[i].ClassName, AllMutators[i].FriendlyName);
        i++;
        // [Loop Continue]
        goto J0x25;
    }
    SelectedStr = "";
    j = 0;
    J0x7D:

    // End:0xC9 [Loop If]
    if(j < MutatorList.Length)
    {
        // End:0xBF
        if(MutatorList[j] ~= "NONE")
        {
            SelectedStr = " selected";
            bNoMutators = true;
            // [Explicit Break]
            goto J0xC9;
        }
        j++;
        // [Loop Continue]
        goto J0x7D;
    }
    J0xC9:

    OptionStr = ((("<option value=\"NONE\"" $ SelectedStr) $ ">") $ NoneText) $ "</option>";
    i = 0;
    J0x10C:

    // End:0x1FF [Loop If]
    if(i < SortedMutatorList.Count())
    {
        SelectedStr = "";
        // End:0x191
        if(!bNoMutators)
        {
            j = 0;
            J0x13F:

            // End:0x191 [Loop If]
            if(j < MutatorList.Length)
            {
                // End:0x187
                if(MutatorList[j] ~= SortedMutatorList.GetItem(i))
                {
                    SelectedStr = " selected";
                    // [Explicit Break]
                    goto J0x191;
                }
                j++;
                // [Loop Continue]
                goto J0x13F;
            }
        }
        J0x191:

        OptionStr $= (((((("<option value=\"" $ SortedMutatorList.GetItem(i)) $ "\"") $ SelectedStr) $ ">") $ SortedMutatorList.GetTag(i)) $ "</option>");
        i++;
        // [Loop Continue]
        goto J0x10C;
    }
    SortedMutatorList.Reset();
    return OptionStr;
    //return;    
}

function string GenerateMapListOptions(string GameType, int Active)
{
    local int i, idx;
    local array<string> AR;
    local string Result, selected;

    idx = Level.Game.MaplistHandler.GetGameIndex(GameType);
    AR = Level.Game.MaplistHandler.GetMapListNames(idx);
    i = 0;
    J0x5F:

    // End:0xE8 [Loop If]
    if(i < AR.Length)
    {
        selected = Eval(i == Active, " selected", "");
        Result $= (((((("<option value=\"" $ string(i)) $ "\"") $ selected) $ ">") $ AR[i]) $ "</option>");
        i++;
        // [Loop Continue]
        goto J0x5F;
    }
    return Result;
    //return;    
}

function string GenerateMapListSelect(StringArray MapList, StringArray MovedMaps)
{
    local int i;
    local string ResponseStr, SelectedStr;

    // End:0x43
    if(MapList.Count() == 0)
    {
        return ("<option value=\"\">***" @ NoneText) @ "***</option>";
    }
    i = 0;
    J0x4A:

    // End:0x141 [Loop If]
    if(i < MapList.Count())
    {
        // End:0x137
        if(ValidMap(MapList.GetTag(i)))
        {
            SelectedStr = "";
            // End:0xCF
            if((MovedMaps != none) && MovedMaps.FindTagId(MapList.GetTag(i)) >= 0)
            {
                SelectedStr = " selected";
            }
            ResponseStr = ((((((ResponseStr $ "<option value=\"") $ MapList.GetItem(i)) $ "\"") $ SelectedStr) $ ">") $ MapList.GetTag(i)) $ "</option>";
        }
        i++;
        // [Loop Continue]
        goto J0x4A;
    }
    return ResponseStr;
    //return;    
}

function string GenerateSkinSelect()
{
    local string S, selectedstring;
    local int i;

    // End:0x43
    if(Skins.Count() == 0)
    {
        return ("<option value=\"\">***" @ NoneText) @ "***</option>";
    }
    i = 0;
    J0x4A:

    // End:0x12C [Loop If]
    if(i < Skins.Count())
    {
        selectedstring = Eval((CurrentSkin != none) && Level.GetItemName(string(CurrentSkin.Class)) ~= Skins.GetItem(i), " selected", "");
        S = ((((((S $ "<option value=\"") $ Skins.GetItem(i)) $ "\"") $ selectedstring) $ ">") $ Skins.GetTag(i)) $ "</option>";
        i++;
        // [Loop Continue]
        goto J0x4A;
    }
    return S;
    //return;    
}

static function string HtmlEncode(string Src)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x4E [Loop If]
    if(i < default.SpecialChars.Length)
    {
        Src = Repl(Src, default.SpecialChars[i].Plain, default.SpecialChars[i].Coded);
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return Src;
    //return;    
}

static function string HtmlDecode(string Src)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x4E [Loop If]
    if(i < default.SpecialChars.Length)
    {
        Src = Repl(Src, default.SpecialChars[i].Coded, default.SpecialChars[i].Plain);
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return Src;
    //return;    
}

function MapTitle(WebResponse Response)
{
    local string str, smap;

    str = Level.Game.GameReplicationInfo.GameName $ " in ";
    // End:0xA1
    if(Level.Title ~= "untitled")
    {
        smap = Level.GetURLMap();
        // End:0x90
        if(Right(smap, 4) ~= ".ebtr")
        {
            str $= Left(smap, Len(smap) - 4);            
        }
        else
        {
            str $= smap;
        }        
    }
    else
    {
        str $= Level.Title;
    }
    Response.Subst("SubTitle", str);
    //return;    
}

function bool MapIsChanging()
{
    // End:0x2C
    if(Level.NextURL != "")
    {
        ShowMessage(Resp, WaitTitle, MapChanging);
        return true;
    }
    return false;
    //return;    
}

function string HyperLink(string URL, string Text, bool bEnabled, optional string Target)
{
    local string hlink;

    // End:0x7A
    if(bEnabled)
    {
        hlink = ("<a href='" $ URL) $ "'";
        // End:0x55
        if(Target != "")
        {
            hlink = ((hlink @ "target='") $ Target) $ "'";
        }
        hlink = ((hlink $ ">") $ Text) $ "</a>";
        return hlink;
    }
    return Text;
    //return;    
}

function string WebInclude(string File)
{
    local string S;

    // End:0x3C
    if(CurrentSkin != none)
    {
        S = CurrentSkin.HandleWebInclude(Resp, File);
        // End:0x3C
        if(S != "")
        {
            return S;
        }
    }
    return Resp.LoadParsedUHTM((((Path $ SkinPath) $ "/") $ File) $ ".inc");
    //return;    
}

function bool ShowFrame(WebResponse Response, string Page)
{
    // End:0x2B
    if((CurrentSkin != none) && CurrentSkin.HandleHTM(Response, Page))
    {
        return true;
    }
    Response.IncludeUHTM((((Path $ SkinPath) $ "/") $ Page) $ htm);
    return true;
    //return;    
}

function bool ShowPage(WebResponse Response, string Page)
{
    // End:0x3A
    if((CurrentSkin != none) && CurrentSkin.HandleHTM(Response, Page))
    {
        Response.ClearSubst();
        return true;
    }
    Response.IncludeUHTM((((Path $ SkinPath) $ "/") $ Page) $ htm);
    Response.ClearSubst();
    return true;
    //return;    
}

function StatusError(WebResponse Response, string Message)
{
    // End:0x1E
    if(Left(Message, 1) == "@")
    {
        Message = Mid(Message, 1);
    }
    Response.Subst("Status", ((("<font color='" $ StatusErrorColor) $ "'>") $ Message) $ "</font><br>");
    //return;    
}

function StatusOk(WebResponse Response, string Message)
{
    Response.Subst("Status", ((("<font color='" $ StatusOKColor) $ "'>") $ Message) $ "</font>");
    //return;    
}

function bool StatusReport(WebResponse Response, string ErrorMessage, string SuccessMessage)
{
    // End:0x1F
    if(ErrorMessage == "")
    {
        StatusOk(Response, SuccessMessage);        
    }
    else
    {
        StatusError(Response, ErrorMessage);
    }
    return ErrorMessage == "";
    //return;    
}

function ShowMessage(WebResponse Response, string Title, string Message)
{
    // End:0x30
    if((CurrentSkin != none) && CurrentSkin.HandleMessagePage(Response, Title, Message))
    {
        return;
    }
    Response.Subst("Section", Title);
    Response.Subst("Message", Message);
    Response.IncludeUHTM((((Path $ SkinPath) $ "/") $ MessagePage) $ htm);
    //return;    
}

function ShowFramedMessage(WebResponse Response, string Message, bool bIsErrorMsg)
{
    // End:0x31
    if((CurrentSkin != none) && CurrentSkin.HandleFrameMessage(Response, Message, bIsErrorMsg))
    {
        return;
    }
    // End:0x4D
    if(bIsErrorMsg)
    {
        StatusError(Response, Message);        
    }
    else
    {
        Response.Subst("Message", Message);
    }
    Response.IncludeUHTM((((Path $ SkinPath) $ "/") $ FramedMessagePage) $ htm);
    //return;    
}

function string Checkbox(string Tag, bool bChecked, optional bool bDisabled)
{
    Resp.Subst("CheckName", Tag);
    Resp.Subst("Checked", Eval(bChecked, " checked", ""));
    Resp.Subst("Disabled", Eval(bDisabled, " disabled", ""));
    return WebInclude(CheckboxInclude);
    //return;    
}

function string Hidden(string Tag, string Value)
{
    Resp.Subst("HiddenName", Tag);
    Resp.Subst("HiddenValue", Value);
    return WebInclude(HiddenInclude);
    //return;    
}

function string SubmitButton(string SubmitButtonName, string SubmitButtonValue)
{
    Resp.Subst("SubmitName", SubmitButtonName);
    Resp.Subst("SubmitValue", SubmitButtonValue);
    return WebInclude(SubmitButtonInclude);
    //return;    
}

function string ResetButton(string ResetButtonName, string ResetButtonValue)
{
    Resp.Subst("ResetName", ResetButtonName);
    Resp.Subst("ResetValue", ResetButtonValue);
    return WebInclude(ResetButtonInclude);
    //return;    
}

function string TextBox(string TextName, coerce string Size, coerce string MaxLength, optional string DefaultValue)
{
    Resp.Subst("TextName", TextName);
    // End:0x5B
    if(int(Size) > 0)
    {
        Resp.Subst("TextSize", ("size=\"" $ Size) $ "\"");        
    }
    else
    {
        Resp.Subst("TextSize", "");
    }
    // End:0xBA
    if(int(MaxLength) > 0)
    {
        Resp.Subst("TextLength", ("maxlength=\"" $ MaxLength) $ "\"");        
    }
    else
    {
        Resp.Subst("TextLength", "");
    }
    Resp.Subst("TextValue", DefaultValue);
    return WebInclude(TextboxInclude);
    //return;    
}

function string RadioButton(string Group, string Value, bool bSelected)
{
    Resp.Subst("RadioGroup", Group);
    Resp.Subst("RadioValue", Value);
    Resp.Subst("Selected", Eval(bSelected, " checked", ""));
    return WebInclude(RadioButtonInclude);
    //return;    
}

function string Select(string SelectName, string SelectOptions)
{
    Resp.Subst("SelectName", SelectName);
    Resp.Subst("ListOptions", SelectOptions);
    return WebInclude(SelectInclude);
    //return;    
}

function int GetGameCacheIndex(string GameClass)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x41 [Loop If]
    if(i < AllGames.Length)
    {
        // End:0x37
        if(AllGames[i].ClassName ~= GameClass)
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return -1;
    //return;    
}

function bool ValidMap(string MapURL)
{
    local int i;
    local string MapName;

    // End:0x18
    if(Left(Caps(MapName), 4) ~= "TUT-")
    {
        return false;
    }
    MapName = Class'Engine.MaplistRecord'.static.GetBaseMapName(MapURL);
    i = 0;
    J0x39:

    // End:0x6F [Loop If]
    if(i < AllMaps.Length)
    {
        // End:0x65
        if(AllMaps[i].MapName ~= MapName)
        {
            return true;
        }
        i++;
        // [Loop Continue]
        goto J0x39;
    }
    return false;
    //return;    
}

function FormatMapName(out string FullName, out string ShortName)
{
    local string Ext;

    Ext = ".ebtr";
    // End:0x29
    if((FullName == "") && ShortName == "")
    {
        return;
    }
    // End:0x91
    if((FullName != "") && ShortName == "")
    {
        // End:0x71
        if(Right(FullName, 4) ~= Ext)
        {
            ShortName = Left(FullName, Len(FullName) - 4);            
        }
        else
        {
            ShortName = FullName;
            FullName = FullName $ Ext;
        }        
    }
    else
    {
        // End:0xF9
        if((FullName == "") && ShortName != "")
        {
            // End:0xE4
            if(Right(ShortName, 4) ~= Ext)
            {
                FullName = ShortName;
                ShortName = Left(ShortName, Len(ShortName) - 4);                
            }
            else
            {
                FullName = ShortName $ Ext;
            }            
        }
        else
        {
            // End:0x120
            if(!Right(FullName, 4) ~= Ext)
            {
                FullName = FullName $ Ext;
            }
            ShortName = Left(FullName, Len(FullName) - 4);
        }
    }
    //return;    
}

function string UsedMutators()
{
    local int i;
    local string OutStr;

    J0x00:
    // End:0x60 [Loop If]
    if(i < AIncMutators.Count())
    {
        // End:0x31
        if(OutStr != "")
        {
            OutStr $= ",";
        }
        OutStr $= AllMutators[int(AIncMutators.GetItem(i++))].ClassName;
        // [Loop Continue]
        goto J0x00;
    }
    return OutStr;
    //return;    
}

function bool HasURLOption(string ParamName, out string Value)
{
    local string Param;
    local int i;

    Param = ParamName;
    J0x0B:

    // End:0x45 [Loop If]
    if(true)
    {
        i = InStr(Param, ".");
        // End:0x2D
        if(i < 0)
        {
            // [Explicit Break]
            goto J0x45;
        }
        Param = Mid(Param, i + 1);
        // [Loop Continue]
        goto J0x0B;
    }
    J0x45:

    Value = Level.GetUrlOption(Param);
    return Value != "";
    //return;    
}

function string NextPriv(out string PrivString)
{
    local int pos;
    local string priv;

    pos = InStr(PrivString, "|");
    // End:0x28
    if(pos < 0)
    {
        pos = Len(PrivString);
    }
    EatStr(priv, PrivString, pos);
    // End:0x57
    if(PrivString != "")
    {
        PrivString = Mid(PrivString, 1);
    }
    return priv;
    //return;    
}

function bool CanPerform(string privs)
{
    local string priv;

    priv = NextPriv(privs);
    J0x11:

    // End:0x75 [Loop If]
    if(priv != "")
    {
        // End:0x61
        if(Level.Game.AccessControl.AllowPriv(priv) && CurAdmin.HasPrivilege(priv))
        {
            return true;
        }
        priv = NextPriv(privs);
        // [Loop Continue]
        goto J0x11;
    }
    return false;
    //return;    
}

defaultproperties
{
    QueryHandlerClasses[0]="XWebAdmin.xWebQueryCurrent"
    QueryHandlerClasses[1]="XWebAdmin.xWebQueryDefaults"
    QueryHandlerClasses[2]="XWebAdmin.xWebQueryAdmins"
    SpectatorType=Class'XWebAdmin_Decompressed.UTServerAdminSpectator'
    DefaultWebSkinClass=Class'XWebAdmin_Decompressed.UT2K3Skin'
    SpecialChars[0]=(Plain="&",Coded="&amp;")
    SpecialChars[1]=(Plain="\"",Coded="&quot;")
    SpecialChars[2]=(Plain=" ",Coded="&nbsp;")
    SpecialChars[3]=(Plain="<",Coded="&lt;")
    SpecialChars[4]=(Plain=">",Coded="&gt;")
    SpecialChars[5]=(Plain="?",Coded="&copy;")
    SpecialChars[6]=(Plain="?",Coded="&#8482;")
    SpecialChars[7]=(Plain="?",Coded="&reg;")
    DefaultBG="#aaaaaa"
    HighlightedBG="#3a7c8c"
    RootFrame="rootframe"
    HeaderPage="mainmenu"
    MessagePage="message"
    FramedMessagePage="frame_message"
    RestartPage="server_restart"
    htm=".htm"
    AdminRealm="UT Remote Admin Server"
    SiteCSSFile="ut2003.css"
    SiteBG="#243954"
    StatusOKColor="#33cc66"
    StatusErrorColor="Yellow"
    CellLeft="cell_left"
    CellCenter="cell_center"
    CellRight="cell_right"
    CellColSpan="cell_colspan"
    NowrapLeft="cell_left_nowrap"
    NowrapCenter="cell_center_nowrap"
    NowrapRight="cell_right_nowrap"
    RowLeft="row_left"
    RowCenter="row_center"
    CheckboxInclude="checkbox"
    TextboxInclude="textbox"
    SubmitButtonInclude="submit_button"
    RadioButtonInclude="radio_button"
    SelectInclude="select"
    ResetButtonInclude="reset_button"
    HiddenInclude="hidden"
    SkinSelectInclude="mainmenu_items"
    Accept="???"
    Deny="?? ??"
    Update="????"
    Custom="???"
    Error="??"
    NoneText="??"
    SwitchText="???"
    DeleteText="??"
    NewText="?"
    Edit="Edit"
    WaitTitle="?????"
    MapChanging="??? ?? ?? ?? ?? ????. 10~15? ?? ??? ????."
    MapChangingTo="??? ?? '%MapName%'?? ?? ?? ?? ????. 10~15? ?? ??? ????."
    AccessDeniedText="?? ??"
    ErrorAuthenticating="?? ?? ??? ?????!"
    NoPrivs="? ???? ???? ??? ?????."
    LoadingGames="Loading Game Types"
    LoadingMaps="Loading Available Maps"
    Initialized="%class% Initialized on port %port%"
}