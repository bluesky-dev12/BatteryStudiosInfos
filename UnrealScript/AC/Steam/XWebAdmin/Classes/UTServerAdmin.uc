/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XWebAdmin\Classes\UTServerAdmin.uc
 * Package Imports:
 *	XWebAdmin
 *	UWeb
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:70
 *	Functions:55
 *
 *******************************************************************************/
class UTServerAdmin extends WebApplication
    dependson(UTServerAdminSpectator)
    config();

struct HtmlChar
{
    var string Plain;
    var string Coded;
};

var config string ActiveSkin;
var() config array<string> QueryHandlerClasses;
var array<xWebQueryHandler> QueryHandlers;
var() array< class<WebSkin> > WebSkins;
var() class<UTServerAdminSpectator> SpectatorType;
var() class<WebSkin> DefaultWebSkinClass;
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
    // End:0x2b
    if(SpectatorType != none)
    {
        Spectator = Level.Spawn(SpectatorType);
    }
    // End:0x42
    else
    {
        Spectator = Level.Spawn(class'UTServerAdminSpectator');
    }
    // End:0x5d
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
}

function LoadMaps()
{
    Log(LoadingMaps, 'WebAdmin');
    class'CacheManager'.static.GetMapList(AllMaps);
}

function LoadGameTypes()
{
    local int i;

    Log(LoadingGames, 'WebAdmin');
    AGameType = new (none) class'SortedStringArray';
    class'CacheManager'.static.GetGameTypeList(AllGames);
    i = 0;
    J0x33:
    // End:0x7c [While If]
    if(i < AllGames.Length)
    {
        AGameType.Add(AllGames[i].ClassName, AllGames[i].GameName);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x33;
    }
}

function LoadMutators()
{
    local Mutator M;
    local int i, id;

    AExcMutators = new (none) class'StringArray';
    AIncMutators = new (none) class'SortedStringArray';
    // End:0x32
    if(Level.IsDemoBuild())
    {
        return;
    }
    class'CacheManager'.static.GetMutatorList(AllMutators);
    i = 0;
    J0x4a:
    // End:0x8a [While If]
    if(i < AllMutators.Length)
    {
        AExcMutators.Add(string(i), AllMutators[i].ClassName);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x4a;
    }
    M = Level.Game.BaseMutator;
    J0xa7:
    // End:0x174 [While If]
    if(M != none)
    {
        // End:0x15d
        if(M.bUserAdded)
        {
            id = AExcMutators.FindTagId(string(M.Class));
            // End:0x12a
            if(id >= 0)
            {
                AIncMutators.Add(AExcMutators.GetItem(id), AllMutators[id].FriendlyName);
            }
            // End:0x15d
            else
            {
                Log("Unknown Mutator in use: " @ string(M.Class), 'WebAdmin');
            }
        }
        M = M.NextMutator;
        // This is an implied JumpToken; Continue!
        goto J0xa7;
    }
}

function LoadQueryHandlers()
{
    local int i, j;
    local xWebQueryHandler QH;
    local class<xWebQueryHandler> QHC;

    LoadSkins();
    i = 0;
    J0x0d:
    // End:0x199 [While If]
    if(i < QueryHandlerClasses.Length)
    {
        QHC = class<xWebQueryHandler>(DynamicLoadObject(QueryHandlerClasses[i], class'Class'));
        // End:0x132
        if(QHC != none)
        {
            j = 0;
            J0x50:
            // End:0x92 [While If]
            if(j < QueryHandlers.Length)
            {
                // End:0x88
                if(QueryHandlers[j].Class == QHC)
                {
                    QHC = none;
                }
                // End:0x92
                else
                {
                    ++ j;
                    // This is an implied JumpToken; Continue!
                    goto J0x50;
                }
            }
            // End:0x12f
            if(QHC != none)
            {
                QH = new (self) QHC;
                // End:0x12f
                if(QH != none)
                {
                    // End:0xf1
                    if(QH.Init())
                    {
                        QueryHandlers.Length = QueryHandlers.Length + 1;
                        QueryHandlers[QueryHandlers.Length - 1] = QH;
                    }
                    // End:0x12f
                    else
                    {
                        Log("WebQueryHandler:" @ string(QHC) @ "could not be initialized", 'WebAdmin');
                    }
                }
            }
        }
        // End:0x18f
        else
        {
            Log("Invalid QueryHandlerClass:" $ QueryHandlerClasses[i] $ ".  Removing invalid entry.", 'WebAdmin');
            QueryHandlerClasses.Remove(i, 1);
            SaveConfig();
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0d;
    }
}

function string SetGamePI(optional string GameType)
{
    local class<Info> TmpClass;
    local array< class<Info> > InfoClasses;
    local int i;

    // End:0x4d
    if(GameType == "")
    {
        InfoClasses[0] = Level.Game.Class;
        GameType = string(Level.Game.Class);
    }
    // End:0xa9
    else
    {
        TmpClass = class<Info>(DynamicLoadObject(GameType, class'Class'));
        // End:0x9c
        if(TmpClass == none)
        {
            Log("Error loading gametype" @ GameType, 'WebAdmin');
            return "";
        }
        InfoClasses[0] = TmpClass;
    }
    // End:0xc3
    if(GamePI == none)
    {
        GamePI = new (none) class'PlayInfo';
    }
    // End:0x108
    if(Level.Game.AccessControl != none)
    {
        InfoClasses[1] = Level.Game.AccessControl.Class;
    }
    J0x108:
    // End:0x17a [While If]
    if(i < AIncMutators.Count())
    {
        TmpClass = class<Info>(DynamicLoadObject(AllMutators[int(AIncMutators.GetItem(++ i))].ClassName, class'Class'));
        // End:0x177
        if(TmpClass != none)
        {
            InfoClasses[InfoClasses.Length] = TmpClass;
        }
        // This is an implied JumpToken; Continue!
        goto J0x108;
    }
    GamePI.Init(InfoClasses);
    return GameType;
}

function StringArray ReloadExcludeMaps(string GameType)
{
    local int i, GameIndex;
    local string MapPrefix;
    local StringArray AMaps;
    local array<MapRecord> MapRecords;

    // End:0x2b
    if(GameType == "")
    {
        GameType = string(Level.Game.Class);
    }
    GameIndex = GetGameCacheIndex(GameType);
    // End:0x83
    if(GameIndex == -1)
    {
        Warn("Could not load gametype" @ GameType @ "for maplist.");
        return AMaps;
    }
    AMaps = new (none) class'SortedStringArray';
    MapPrefix = AllGames[GameIndex].MapPrefix;
    class'CacheManager'.static.GetMapList(MapRecords, MapPrefix);
    i = 0;
    J0xc5:
    // End:0x187 [While If]
    if(i < MapRecords.Length)
    {
        // End:0x17d
        if(ValidMap(MapRecords[i].MapName))
        {
            // End:0x14d
            if(bDebug)
            {
                Log("Adding entry to exclude maplist  Item '" $ string(i) $ "' Tag '" $ MapRecords[i].MapName $ "'");
            }
            AMaps.Add(MapRecords[i].MapName, MapRecords[i].MapName, true);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xc5;
    }
    return AMaps;
}

function StringArray ReloadIncludeMaps(StringArray ExMaps, int GameIndex, int MapListIndex)
{
    local int i, id;
    local string MapName;
    local array<string> Maps;
    local StringArray Arr;

    Arr = new (none) class'StringArray';
    Maps = Level.Game.MaplistHandler.GetMapList(GameIndex, MapListIndex);
    i = 0;
    J0x47:
    // End:0x144 [While If]
    if(i < Maps.Length)
    {
        MapName = class'MaplistRecord'.static.GetBaseMapName(Maps[i]);
        Arr.Add(MapName $ Maps[i], MapName, true);
        // End:0xfd
        if(bDebug)
        {
            Log("Adding map entry to include list Item '" $ MapName $ Maps[i] $ "' Tag '" $ MapName $ "'");
        }
        id = ExMaps.FindTagId(MapName);
        // End:0x13a
        if(id != -1)
        {
            ExMaps.Remove(id);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x47;
    }
    return Arr;
}

function CreateFullMutatorList(out StringArray Mutators, out StringArray GroupsOnly)
{
    local StringArray Grouped;
    local int i, j, Z;
    local string GrpName, thisgroup, nextgroup;

    Grouped = new (none) class'SortedStringArray';
    i = 0;
    J0x16:
    // End:0xdd [While If]
    if(i < Mutators.Count())
    {
        j = int(Mutators.GetItem(i));
        // End:0x79
        if(AllMutators[j].GroupName == "")
        {
            GrpName = "Z" $ string(++ Z);
        }
        // End:0x8f
        else
        {
            GrpName = AllMutators[j].GroupName;
        }
        Grouped.Add(string(j), GrpName $ "." $ AllMutators[j].FriendlyName $ AllMutators[j].ClassName);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x16;
    }
    i = 0;
    J0xe4:
    // End:0x2c0 [While If]
    if(i < Grouped.Count())
    {
        thisgroup = AllMutators[int(Grouped.GetItem(i))].GroupName;
        nextgroup = "";
        // End:0x13b
        if(thisgroup == "")
        {
        }
        // End:0x2b6
        else
        {
            // End:0x181
            if(i + 1 < Grouped.Count())
            {
                nextgroup = AllMutators[int(Grouped.GetItem(i + 1))].GroupName;
            }
            // End:0x2b6
            if(thisgroup ~= nextgroup)
            {
                j = i;
                J0x19b:
                // End:0x25b [While If]
                if(nextgroup ~= thisgroup && j < Grouped.Count())
                {
                    GroupsOnly.MoveFromId(Grouped, Grouped.FindItemId(Grouped.GetItem(j)));
                    thisgroup = nextgroup;
                    // End:0x22e
                    if(j + 1 == Grouped.Count())
                    {
                        nextgroup = "";
                    }
                    // End:0x258
                    else
                    {
                        nextgroup = AllMutators[int(Grouped.GetItem(j + 1))].GroupName;
                    }
                    // This is an implied JumpToken; Continue!
                    goto J0x19b;
                }
                // End:0x2ab
                if(j < Grouped.Count())
                {
                    GroupsOnly.MoveFromId(Grouped, Grouped.FindItemId(Grouped.GetItem(j)));
                }
                i = -1;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xe4;
    }
    Mutators.Reset();
    i = 0;
    J0x2d6:
    // End:0x33b [While If]
    if(i < Grouped.Count())
    {
        j = int(Grouped.GetItem(i));
        Mutators.Add(string(j), AllMutators[j].FriendlyName);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x2d6;
    }
    Grouped.Reset();
}

function LoadSkins()
{
    local int i;
    local string S;
    local class<WebSkin> SkinClass;

    Skins = new (none) class'StringArray';
    S = Level.GetNextInt("XWebAdmin.WebSkin", ++ i);
    J0x3e:
    // End:0xe7 [While If]
    if(S != "")
    {
        SkinClass = class<WebSkin>(DynamicLoadObject(S, class'Class'));
        // End:0xb5
        if(SkinClass != none)
        {
            Skins.Add(Level.GetItemName(string(SkinClass)), SkinClass.default.DisplayName);
            WebSkins[WebSkins.Length] = SkinClass;
        }
        S = Level.GetNextInt("XWebAdmin.WebSkin", ++ i);
        // This is an implied JumpToken; Continue!
        goto J0x3e;
    }
    ApplySkinSettings();
}

function ApplySkinSettings()
{
    local int i;

    // End:0x0d
    if(Skins == none)
    {
        return;
    }
    // End:0x45
    if(CurrentSkin != none && Level.GetItemName(string(CurrentSkin.Class)) ~= ActiveSkin)
    {
        return;
    }
    i = Skins.FindItemId(ActiveSkin);
    // End:0x7c
    if(i < 0)
    {
        CurrentSkin = new (none) class'UT2K3Skin';
    }
    // End:0x91
    else
    {
        CurrentSkin = new (none) WebSkins[i];
    }
    // End:0xac
    if(CurrentSkin != none)
    {
        CurrentSkin.Init(self);
    }
}

function ServerChangeMap(WebRequest Request, WebResponse Response, string MapName, string GameType)
{
    local int i;
    local bool bConflict;
    local string Conflicts, str, ShortName, Muts;

    // End:0x2a
    if(Level.NextURL != "")
    {
        ShowMessage(Response, WaitTitle, MapChanging);
    }
    // End:0xa3
    if(Request.GetVariable("Save", "") != "")
    {
        i = 0;
        J0x4f:
        // End:0xa0 [While If]
        if(i < GamePI.Settings.Length)
        {
            ShortName = Level.GetItemName(GamePI.Settings[i].SettingName);
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x4f;
        }
    }
    // End:0x33a
    else
    {
        bConflict = false;
        Conflicts = "";
        GameType = SetGamePI(GameType);
        i = 0;
        J0xcb:
        // End:0x294 [While If]
        if(i < GamePI.Settings.Length)
        {
            // End:0x28a
            if(HasURLOption(GamePI.Settings[i].SettingName, str) && !GamePI.Settings[i].Value ~= str && GamePI.Settings[i].SettingName != "GameReplicationInfo.AdminName")
            {
                Response.Subst("SettingName", GamePI.Settings[i].SettingName);
                Response.Subst("SettingText", GamePI.Settings[i].DisplayName);
                Response.Subst("DefVal", GamePI.Settings[i].Value);
                Response.Subst("URLVal", str);
                Response.Subst("MapName", MapName);
                Response.Subst("GameType", GameType);
                Conflicts = Conflicts $ WebInclude(RestartPage $ "_row");
                bConflict = true;
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0xcb;
        }
        // End:0x33a
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
    // End:0x36a
    if(Muts != "")
    {
        Muts = "?Mutator=" $ Muts;
    }
    Level.ServerTravel(MapName $ "?Game=" $ GameType $ Muts, false);
    ShowMessage(Response, WaitTitle, MapChanging);
}

function UpdateCustomMapList(int GameIndex, int Index, string NewName)
{
    // End:0x6d
    if(!Level.Game.MaplistHandler.GetMapListTitle(GameIndex, Index) == NewName)
    {
        Index = Level.Game.MaplistHandler.RenameList(GameIndex, Index, NewName);
    }
    // End:0xcb
    if(Level.Game.MaplistHandler.GetActiveList(GameIndex) == Index)
    {
        Level.Game.MaplistHandler.ApplyMapList(GameIndex, Index);
    }
    // End:0xf6
    else
    {
        Level.Game.MaplistHandler.SaveMapList(GameIndex, Index);
    }
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
    // End:0x48 [While If]
    if(i < QueryHandlers.Length)
    {
        QueryHandlers[i].Cleanup();
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x19;
    }
    // End:0x59
    if(Resp != none)
    {
        CleanupQuery();
    }
    super.CleanupApp();
}

function bool PreQuery(WebRequest Request, WebResponse Response)
{
    local bool bResult;
    local int i;

    // End:0x57
    if(Level == none || Level.Game == none || Level.Game.AccessControl == none)
    {
        ShowMessage(Response, Error, ErrorAuthenticating);
        return false;
    }
    // End:0x68
    if(Resp != none)
    {
        CleanupQuery();
    }
    // End:0xca
    if(Spectator == none)
    {
        // End:0x98
        if(SpectatorType != none)
        {
            Spectator = Level.Spawn(SpectatorType);
        }
        // End:0xaf
        else
        {
            Spectator = Level.Spawn(class'UTServerAdminSpectator');
        }
        // End:0xca
        if(Spectator != none)
        {
            Spectator.Server = self;
        }
    }
    // End:0xec
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
    // End:0x1bd
    if(CurAdmin == none)
    {
        ShowMessage(Response, Error, ErrorAuthenticating);
        Level.Game.AccessControl.AdminLogout(Spectator);
        return false;
    }
    Resp = Response;
    bResult = true;
    i = 0;
    J0x1d7:
    // End:0x21d [While If]
    if(i < QueryHandlers.Length)
    {
        // End:0x213
        if(!QueryHandlers[i].PreQuery(Request, Response))
        {
            bResult = false;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1d7;
    }
    return bResult;
}

event Query(WebRequest Request, WebResponse Response)
{
    local int i;

    Response.Subst("BugAddress", "webadminbugs" $ Level.EngineVersion $ "@epicgames.com");
    Response.Subst("CSS", SiteCSSFile);
    Response.Subst("BODYBG", SiteBG);
    // End:0x117
    if(CurrentSkin != none && CurrentSkin.SpecialQuery.Length > 0)
    {
        i = 0;
        J0xa9:
        // End:0x117 [While If]
        if(i < CurrentSkin.SpecialQuery.Length)
        {
            // End:0x10d
            if(CurrentSkin.SpecialQuery[i] ~= Mid(Request.URI, 1))
            {
                // End:0x10a
                if(CurrentSkin.HandleSpecialQuery(Request, Response))
                {
                    return;
                }
            }
            // End:0x117
            else
            {
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0xa9;
            }
        }
    }
    switch(Mid(Request.URI, 1))
    {
        // End:0x12f
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
        // End:0x1cf
        case SiteCSSFile:
            Response.SendCachedFile(Path $ SkinPath $ "/" $ Mid(Request.URI, 1), "text/css");
            return;
        // End:0xffff
        default:
            i = 0;
            J0x1d9:
            // End:0x217 [While If]
            if(i < QueryHandlers.Length)
            {
                // End:0x20d
                if(QueryHandlers[i].Query(Request, Response))
                {
                    return;
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x1d9;
            }
            ShowMessage(Response, Error, "Page not found!");
            return;
    }
}

event PostQuery(WebRequest Request, WebResponse Response)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x5f [While If]
    if(i < QueryHandlers.Length)
    {
        // End:0x55
        if(!QueryHandlers[i].PostQuery(Request, Response))
        {
            Response.Connection.bDelayCleanup = true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    // End:0x7c
    if(Response.Connection.IsHanging())
    {
        return;
    }
    CleanupQuery();
}

function CleanupQuery()
{
    // End:0x40
    if(Resp != none && Resp.Connection.IsHanging())
    {
        Resp.Connection.Timer();
    }
    Resp = none;
    CurAdmin = none;
    Level.Game.AccessControl.AdminLogout(Spectator);
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
    Response.Subst("HeaderURI", HeaderPage $ "?Group=" $ GroupPage);
    Response.Subst("BottomURI", GroupPage);
    Response.Subst("ServerName", class'GameReplicationInfo'.default.ServerName);
    ShowFrame(Response, RootFrame);
}

function QueryHeaderPage(WebRequest Request, WebResponse Response)
{
    local int i;
    local string Menu, GroupPage, Dis, CurPageTitle;

    Response.Subst("AdminName", CurAdmin.UserName);
    Response.Subst("HeaderColSpan", "2");
    // End:0x20a
    if(QueryHandlers.Length > 0)
    {
        GroupPage = Request.GetVariable("Group", QueryHandlers[0].DefaultPage);
        Menu = "";
        CurPageTitle = "";
        i = 0;
        J0x98:
        // End:0x1cc [While If]
        if(i < QueryHandlers.Length)
        {
            // End:0xe0
            if(QueryHandlers[i].DefaultPage == GroupPage)
            {
                CurPageTitle = QueryHandlers[i].Title;
            }
            Dis = "";
            // End:0x12d
            if(QueryHandlers[i].NeededPrivs != "" && !CanPerform(QueryHandlers[i].NeededPrivs))
            {
                Dis = "d";
            }
            Response.Subst("MenuLink", RootFrame $ "?Group=" $ QueryHandlers[i].DefaultPage);
            Response.Subst("MenuTitle", QueryHandlers[i].Title);
            Menu = Menu $ WebInclude(HeaderPage $ "_item" $ Dis);
            ++ i;
            // This is an implied JumpToken; Continue!
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
}

function QueryRestartPage(WebRequest Request, WebResponse Response)
{
    // End:0x51
    if(CanPerform("Mr|Mt|Mm|Ms|Mu|Ml"))
    {
        ServerChangeMap(Request, Response, Level.GetURLMap(), string(Level.Game.Class));
    }
}

function QuerySubmitRestartPage(WebRequest Request, WebResponse Response)
{
    // End:0x5d
    if(CanPerform("Mr|Mt|Mm|Ms|Mu|Ml"))
    {
        ServerChangeMap(Request, Response, Request.GetVariable("MapName"), Request.GetVariable("GameType"));
    }
}

function AccessDenied(WebResponse Response)
{
    ShowMessage(Response, AccessDeniedText, NoPrivs);
}

function string GenerateGameTypeOptions(string CurrentGameType)
{
    local int i;
    local string SelectedStr, OptionStr;

    i = 0;
    J0x07:
    // End:0xcc [While If]
    if(i < AGameType.Count())
    {
        // End:0x52
        if(CurrentGameType ~= AGameType.GetItem(i))
        {
            SelectedStr = " selected";
        }
        // End:0x5a
        else
        {
            SelectedStr = "";
        }
        OptionStr = OptionStr $ "<option value=\\"" $ AGameType.GetItem(i) $ "\\"" $ SelectedStr $ ">" $ AGameType.GetTag(i) $ "</option>";
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return OptionStr;
}

function string GenerateMutatorOptions(string SelectedMutators)
{
    local int i, j;
    local string SelectedStr, OptionStr;
    local array<string> MutatorList;
    local StringArray SortedMutatorList;
    local bool bNoMutators;

    Split(SelectedMutators, ",", MutatorList);
    SortedMutatorList = new (none) class'SortedStringArray';
    i = 0;
    J0x25:
    // End:0x6e [While If]
    if(i < AllMutators.Length)
    {
        SortedMutatorList.Add(AllMutators[i].ClassName, AllMutators[i].FriendlyName);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x25;
    }
    SelectedStr = "";
    j = 0;
    J0x7d:
    // End:0xc9 [While If]
    if(j < MutatorList.Length)
    {
        // End:0xbf
        if(MutatorList[j] ~= "NONE")
        {
            SelectedStr = " selected";
            bNoMutators = true;
        }
        // End:0xc9
        else
        {
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0x7d;
        }
    }
    OptionStr = "<option value=\\"NONE\\"" $ SelectedStr $ ">" $ NoneText $ "</option>";
    i = 0;
    J0x10c:
    // End:0x1ff [While If]
    if(i < SortedMutatorList.Count())
    {
        SelectedStr = "";
        // End:0x191
        if(!bNoMutators)
        {
            j = 0;
            J0x13f:
            // End:0x191 [While If]
            if(j < MutatorList.Length)
            {
                // End:0x187
                if(MutatorList[j] ~= SortedMutatorList.GetItem(i))
                {
                    SelectedStr = " selected";
                }
                // End:0x191
                else
                {
                    ++ j;
                    // This is an implied JumpToken; Continue!
                    goto J0x13f;
                }
            }
        }
        OptionStr $= "<option value=\\"" $ SortedMutatorList.GetItem(i) $ "\\"" $ SelectedStr $ ">" $ SortedMutatorList.GetTag(i) $ "</option>";
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x10c;
    }
    SortedMutatorList.Reset();
    return OptionStr;
}

function string GenerateMapListOptions(string GameType, int Active)
{
    local int i, idx;
    local array<string> AR;
    local string Result, selected;

    idx = Level.Game.MaplistHandler.GetGameIndex(GameType);
    AR = Level.Game.MaplistHandler.GetMapListNames(idx);
    i = 0;
    J0x5f:
    // End:0xe8 [While If]
    if(i < AR.Length)
    {
        selected = Eval(i == Active, " selected", "");
        Result $= "<option value=\\"" $ string(i) $ "\\"" $ selected $ ">" $ AR[i] $ "</option>";
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x5f;
    }
    return Result;
}

function string GenerateMapListSelect(StringArray MapList, StringArray MovedMaps)
{
    local int i;
    local string ResponseStr, SelectedStr;

    // End:0x43
    if(MapList.Count() == 0)
    {
        return "<option value=\\"\\">***" @ NoneText @ "***</option>";
    }
    i = 0;
    J0x4a:
    // End:0x141 [While If]
    if(i < MapList.Count())
    {
        // End:0x137
        if(ValidMap(MapList.GetTag(i)))
        {
            SelectedStr = "";
            // End:0xcf
            if(MovedMaps != none && MovedMaps.FindTagId(MapList.GetTag(i)) >= 0)
            {
                SelectedStr = " selected";
            }
            ResponseStr = ResponseStr $ "<option value=\\"" $ MapList.GetItem(i) $ "\\"" $ SelectedStr $ ">" $ MapList.GetTag(i) $ "</option>";
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x4a;
    }
    return ResponseStr;
}

function string GenerateSkinSelect()
{
    local string S, selectedstring;
    local int i;

    // End:0x43
    if(Skins.Count() == 0)
    {
        return "<option value=\\"\\">***" @ NoneText @ "***</option>";
    }
    i = 0;
    J0x4a:
    // End:0x12c [While If]
    if(i < Skins.Count())
    {
        selectedstring = Eval(CurrentSkin != none && Level.GetItemName(string(CurrentSkin.Class)) ~= Skins.GetItem(i), " selected", "");
        S = S $ "<option value=\\"" $ Skins.GetItem(i) $ "\\"" $ selectedstring $ ">" $ Skins.GetTag(i) $ "</option>";
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x4a;
    }
    return S;
}

static function string HtmlEncode(string Src)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x4e [While If]
    if(i < default.SpecialChars.Length)
    {
        Src = Repl(Src, default.SpecialChars[i].Plain, default.SpecialChars[i].Coded);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return Src;
}

static function string HtmlDecode(string Src)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x4e [While If]
    if(i < default.SpecialChars.Length)
    {
        Src = Repl(Src, default.SpecialChars[i].Coded, default.SpecialChars[i].Plain);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return Src;
}

function MapTitle(WebResponse Response)
{
    local string str, smap;

    str = Level.Game.GameReplicationInfo.GameName $ " in ";
    // End:0xa1
    if(Level.Title ~= "untitled")
    {
        smap = Level.GetURLMap();
        // End:0x90
        if(Right(smap, 4) ~= ".ebtr")
        {
            str $= Left(smap, Len(smap) - 4);
        }
        // End:0x9e
        else
        {
            str $= smap;
        }
    }
    // End:0xb8
    else
    {
        str $= Level.Title;
    }
    Response.Subst("SubTitle", str);
}

function bool MapIsChanging()
{
    // End:0x2c
    if(Level.NextURL != "")
    {
        ShowMessage(Resp, WaitTitle, MapChanging);
        return true;
    }
    return false;
}

function string HyperLink(string URL, string Text, bool bEnabled, optional string Target)
{
    local string hlink;

    // End:0x7a
    if(bEnabled)
    {
        hlink = "<a href='" $ URL $ "'";
        // End:0x55
        if(Target != "")
        {
            hlink = hlink @ "target='" $ Target $ "'";
        }
        hlink = hlink $ ">" $ Text $ "</a>";
        return hlink;
    }
    return Text;
}

function string WebInclude(string File)
{
    local string S;

    // End:0x3c
    if(CurrentSkin != none)
    {
        S = CurrentSkin.HandleWebInclude(Resp, File);
        // End:0x3c
        if(S != "")
        {
            return S;
        }
    }
    return Resp.LoadParsedUHTM(Path $ SkinPath $ "/" $ File $ ".inc");
}

function bool ShowFrame(WebResponse Response, string Page)
{
    // End:0x2b
    if(CurrentSkin != none && CurrentSkin.HandleHTM(Response, Page))
    {
        return true;
    }
    Response.IncludeUHTM(Path $ SkinPath $ "/" $ Page $ htm);
    return true;
}

function bool ShowPage(WebResponse Response, string Page)
{
    // End:0x3a
    if(CurrentSkin != none && CurrentSkin.HandleHTM(Response, Page))
    {
        Response.ClearSubst();
        return true;
    }
    Response.IncludeUHTM(Path $ SkinPath $ "/" $ Page $ htm);
    Response.ClearSubst();
    return true;
}

function StatusError(WebResponse Response, string Message)
{
    // End:0x1e
    if(Left(Message, 1) == "@")
    {
        Message = Mid(Message, 1);
    }
    Response.Subst("Status", "<font color='" $ StatusErrorColor $ "'>" $ Message $ "</font><br>");
}

function StatusOk(WebResponse Response, string Message)
{
    Response.Subst("Status", "<font color='" $ StatusOKColor $ "'>" $ Message $ "</font>");
}

function bool StatusReport(WebResponse Response, string ErrorMessage, string SuccessMessage)
{
    // End:0x1f
    if(ErrorMessage == "")
    {
        StatusOk(Response, SuccessMessage);
    }
    // End:0x2f
    else
    {
        StatusError(Response, ErrorMessage);
    }
    return ErrorMessage == "";
}

function ShowMessage(WebResponse Response, string Title, string Message)
{
    // End:0x30
    if(CurrentSkin != none && CurrentSkin.HandleMessagePage(Response, Title, Message))
    {
        return;
    }
    Response.Subst("Section", Title);
    Response.Subst("Message", Message);
    Response.IncludeUHTM(Path $ SkinPath $ "/" $ MessagePage $ htm);
}

function ShowFramedMessage(WebResponse Response, string Message, bool bIsErrorMsg)
{
    // End:0x31
    if(CurrentSkin != none && CurrentSkin.HandleFrameMessage(Response, Message, bIsErrorMsg))
    {
        return;
    }
    // End:0x4d
    if(bIsErrorMsg)
    {
        StatusError(Response, Message);
    }
    // End:0x6a
    else
    {
        Response.Subst("Message", Message);
    }
    Response.IncludeUHTM(Path $ SkinPath $ "/" $ FramedMessagePage $ htm);
}

function string Checkbox(string Tag, bool bChecked, optional bool bDisabled)
{
    Resp.Subst("CheckName", Tag);
    Resp.Subst("Checked", Eval(bChecked, " checked", ""));
    Resp.Subst("Disabled", Eval(bDisabled, " disabled", ""));
    return WebInclude(CheckboxInclude);
}

function string Hidden(string Tag, string Value)
{
    Resp.Subst("HiddenName", Tag);
    Resp.Subst("HiddenValue", Value);
    return WebInclude(HiddenInclude);
}

function string SubmitButton(string SubmitButtonName, string SubmitButtonValue)
{
    Resp.Subst("SubmitName", SubmitButtonName);
    Resp.Subst("SubmitValue", SubmitButtonValue);
    return WebInclude(SubmitButtonInclude);
}

function string ResetButton(string ResetButtonName, string ResetButtonValue)
{
    Resp.Subst("ResetName", ResetButtonName);
    Resp.Subst("ResetValue", ResetButtonValue);
    return WebInclude(ResetButtonInclude);
}

function string TextBox(string TextName, coerce string Size, coerce string MaxLength, optional string DefaultValue)
{
    Resp.Subst("TextName", TextName);
    // End:0x5b
    if(int(Size) > 0)
    {
        Resp.Subst("TextSize", "size=\\"" $ Size $ "\\"");
    }
    // End:0x76
    else
    {
        Resp.Subst("TextSize", "");
    }
    // End:0xba
    if(int(MaxLength) > 0)
    {
        Resp.Subst("TextLength", "maxlength=\\"" $ MaxLength $ "\\"");
    }
    // End:0xd7
    else
    {
        Resp.Subst("TextLength", "");
    }
    Resp.Subst("TextValue", DefaultValue);
    return WebInclude(TextboxInclude);
}

function string RadioButton(string Group, string Value, bool bSelected)
{
    Resp.Subst("RadioGroup", Group);
    Resp.Subst("RadioValue", Value);
    Resp.Subst("Selected", Eval(bSelected, " checked", ""));
    return WebInclude(RadioButtonInclude);
}

function string Select(string SelectName, string SelectOptions)
{
    Resp.Subst("SelectName", SelectName);
    Resp.Subst("ListOptions", SelectOptions);
    return WebInclude(SelectInclude);
}

function int GetGameCacheIndex(string GameClass)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x41 [While If]
    if(i < AllGames.Length)
    {
        // End:0x37
        if(AllGames[i].ClassName ~= GameClass)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return -1;
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
    MapName = class'MaplistRecord'.static.GetBaseMapName(MapURL);
    i = 0;
    J0x39:
    // End:0x6f [While If]
    if(i < AllMaps.Length)
    {
        // End:0x65
        if(AllMaps[i].MapName ~= MapName)
        {
            return true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x39;
    }
    return false;
}

function FormatMapName(out string FullName, out string ShortName)
{
    local string Ext;

    Ext = ".ebtr";
    // End:0x29
    if(FullName == "" && ShortName == "")
    {
        return;
    }
    // End:0x91
    if(FullName != "" && ShortName == "")
    {
        // End:0x71
        if(Right(FullName, 4) ~= Ext)
        {
            ShortName = Left(FullName, Len(FullName) - 4);
        }
        // End:0x8e
        else
        {
            ShortName = FullName;
            FullName = FullName $ Ext;
        }
    }
    // End:0x138
    else
    {
        // End:0xf9
        if(FullName == "" && ShortName != "")
        {
            // End:0xe4
            if(Right(ShortName, 4) ~= Ext)
            {
                FullName = ShortName;
                ShortName = Left(ShortName, Len(ShortName) - 4);
            }
            // End:0xf6
            else
            {
                FullName = ShortName $ Ext;
            }
        }
        // End:0x138
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
}

function string UsedMutators()
{
    local int i;
    local string OutStr;

    // End:0x60 [While If]
    if(i < AIncMutators.Count())
    {
        J0x00:
        // End:0x31
        if(OutStr != "")
        {
            OutStr $= ",";
        }
        OutStr $= AllMutators[int(AIncMutators.GetItem(++ i))].ClassName;
        // This is an implied JumpToken; Continue!
        goto J0x00;
    }
    return OutStr;
}

function bool HasURLOption(string ParamName, out string Value)
{
    local string Param;
    local int i;

    Param = ParamName;
    J0x0b:
    // End:0x45 [While If]
    if(true)
    {
        i = InStr(Param, ".");
        // End:0x2d
        if(i < 0)
        {
        }
        // End:0x45
        else
        {
            Param = Mid(Param, i + 1);
            // This is an implied JumpToken; Continue!
            goto J0x0b;
        }
    }
    Value = Level.GetUrlOption(Param);
    return Value != "";
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
}

function bool CanPerform(string privs)
{
    local string priv;

    priv = NextPriv(privs);
    J0x11:
    // End:0x75 [While If]
    if(priv != "")
    {
        // End:0x61
        if(Level.Game.AccessControl.AllowPriv(priv) && CurAdmin.HasPrivilege(priv))
        {
            return true;
        }
        priv = NextPriv(privs);
        // This is an implied JumpToken; Continue!
        goto J0x11;
    }
    return false;
}

defaultproperties
{
    QueryHandlerClasses=// Object reference not set to an instance of an object.
    
    SpectatorType=class'UTServerAdminSpectator'
    DefaultWebSkinClass=class'UT2K3Skin'
    SpecialChars=// Object reference not set to an instance of an object.
    
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