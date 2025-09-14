/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4Tab_MainBase.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:19
 *	Functions:13
 *
 *******************************************************************************/
class UT2K4Tab_MainBase extends UT2K4GameTabBase
    dependson(UT2K4GameTabBase)
    editinlinenew
    instanced;

var() bool bOnlyShowOfficial;
var() bool bOnlyShowCustom;
var MaplistManager MapHandler;
var array<MapRecord> CacheMaps;
var() array<MapItem> Maps;
var array<string> TutorialMaps;
var GameRecord CurrentGameType;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_OfficialMapsOnly;
var export editinline GUIButton b_Primary;
var export editinline GUIButton b_Secondary;
var() localized string MessageNoInfo;
var() localized string AuthorText;
var() localized string PlayerText;
var() localized string FilterText;
var() localized string ClearText;
var() localized string LinkText;
var() localized string DefaultText;
var() localized string AutoSelectText;
var string MaplistEditorMenu;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    ch_OfficialMapsOnly.Checked(bOnlyShowOfficial);
}

function InitGameType();
function InitMaps(optional string MapPrefix);
function HandleContextOpen(GUIComponent Sender, GUIContextMenu Menu, GUIComponent ContextMenuOwner)
{
    // End:0x25
    if(!bOnlyShowOfficial)
    {
        Menu.ContextItems[3] = FilterText;
    }
    // End:0x3c
    else
    {
        Menu.ContextItems[3] = ClearText;
    }
}

function InitMapHandler()
{
    local PlayerController PC;

    PC = PlayerOwner();
    // End:0x7e
    if(PC.Level.Game != none && MaplistManager(PC.Level.Game.MaplistHandler) != none)
    {
        MapHandler = MaplistManager(PC.Level.Game.MaplistHandler);
    }
    // End:0xa7
    if(MapHandler == none)
    {
        // End:0xa6
        foreach PC.DynamicActors(class'MaplistManager', MapHandler)
        {
            // End:0xa6
            break;                        
        }
    }
    // End:0xc9
    if(MapHandler == none)
    {
        MapHandler = PC.Spawn(class'MaplistManager');
    }
}

function string GetMapPrefix()
{
    return CurrentGameType.MapPrefix;
}

function string GetRulesClass()
{
    return "";
}

function string GetMapListClass()
{
    return CurrentGameType.MapListClassName;
}

function bool GetIsTeamGame()
{
    return CurrentGameType.bTeamGame && !GetGameClass() ~= "SkaarjPack.Invasion";
}

function string GetGameClass()
{
    return CurrentGameType.ClassName;
}

function string GetMapName(GUITreeList List, int Index)
{
    local MapItem Item;

    // End:0x0e
    if(List == none)
    {
        return "";
    }
    // End:0x3b
    if(!List.IsValidIndex(Index))
    {
        Index = List.Index;
    }
    class'MaplistRecord'.static.CreateMapItem(List.GetValueAtIndex(Index), Item);
    return Item.MapName;
}

function string GetMapURL(GUITreeList List, int Index)
{
    local MapItem Item;

    // End:0x0e
    if(List == none)
    {
        return "";
    }
    // End:0x3b
    if(!List.IsValidIndex(Index))
    {
        Index = List.Index;
    }
    class'MaplistRecord'.static.CreateMapItem(List.GetValueAtIndex(Index), Item);
    return Item.FullURL;
}

function ChangeMapFilter(GUIComponent Sender)
{
    // End:0x11
    if(Sender != ch_OfficialMapsOnly)
    {
        return;
    }
    bOnlyShowOfficial = ch_OfficialMapsOnly.IsChecked();
    InitMaps();
}

defaultproperties
{
    begin object name=FilterCheck class=moCheckBox
        CaptionWidth=0.10
        ComponentWidth=0.90
        Caption="?? ?? ??"
        OnCreateComponent=InternalOnCreateComponent
        Hint="?? ?? ??? ?????? ??? ??? ?????."
        WinTop=0.9495310
        WinLeft=0.0392580
        WinWidth=0.3417970
        WinHeight=0.0300350
        TabOrder=1
        OnChange=ChangeMapFilter
    object end
    // Reference: moCheckBox'UT2K4Tab_MainBase.FilterCheck'
    ch_OfficialMapsOnly=FilterCheck
    MessageNoInfo="??? ????!"
    AuthorText="???"
    PlayerText="????"
    FilterText="?? ?? ??"
    ClearText="?? ? ??"
    LinkText="?? ??"
    DefaultText="???"
    AutoSelectText="?? ??"
    MaplistEditorMenu="GUI2K4.MaplistEditor"
    WinTop=0.150
    WinHeight=0.770
}