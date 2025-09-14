class UT2K4Tab_MainBase extends UT2K4GameTabBase
    editinlinenew
    instanced;

var() bool bOnlyShowOfficial;
var() bool bOnlyShowCustom;
var MaplistManager MapHandler;
var array<MapRecord> CacheMaps;
var() array<MapItem> Maps;
var array<string> TutorialMaps;
var GameRecord CurrentGameType;
var() automated moCheckBox ch_OfficialMapsOnly;
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
    //return;    
}

function InitGameType()
{
    //return;    
}

function InitMaps(optional string MapPrefix)
{
    //return;    
}

function HandleContextOpen(GUIComponent Sender, GUIContextMenu Menu, GUIComponent ContextMenuOwner)
{
    // End:0x25
    if(!bOnlyShowOfficial)
    {
        Menu.ContextItems[3] = FilterText;        
    }
    else
    {
        Menu.ContextItems[3] = ClearText;
    }
    //return;    
}

function InitMapHandler()
{
    local PlayerController PC;

    PC = PlayerOwner();
    // End:0x7E
    if((PC.Level.Game != none) && MaplistManager(PC.Level.Game.MaplistHandler) != none)
    {
        MapHandler = MaplistManager(PC.Level.Game.MaplistHandler);
    }
    // End:0xA7
    if(MapHandler == none)
    {
        // End:0xA6
        foreach PC.DynamicActors(Class'Engine.MaplistManager', MapHandler)
        {
            // End:0xA6
            break;            
        }        
    }
    // End:0xC9
    if(MapHandler == none)
    {
        MapHandler = PC.Spawn(Class'Engine.MaplistManager');
    }
    //return;    
}

function string GetMapPrefix()
{
    return CurrentGameType.MapPrefix;
    //return;    
}

function string GetRulesClass()
{
    return "";
    //return;    
}

function string GetMapListClass()
{
    return CurrentGameType.MapListClassName;
    //return;    
}

function bool GetIsTeamGame()
{
    return CurrentGameType.bTeamGame && !(GetGameClass()) ~= "SkaarjPack.Invasion";
    //return;    
}

function string GetGameClass()
{
    return CurrentGameType.ClassName;
    //return;    
}

function string GetMapName(GUITreeList List, int Index)
{
    local MapItem Item;

    // End:0x0E
    if(List == none)
    {
        return "";
    }
    // End:0x3B
    if(!List.IsValidIndex(Index))
    {
        Index = List.Index;
    }
    Class'Engine.MaplistRecord'.static.CreateMapItem(List.GetValueAtIndex(Index), Item);
    return Item.MapName;
    //return;    
}

function string GetMapURL(GUITreeList List, int Index)
{
    local MapItem Item;

    // End:0x0E
    if(List == none)
    {
        return "";
    }
    // End:0x3B
    if(!List.IsValidIndex(Index))
    {
        Index = List.Index;
    }
    Class'Engine.MaplistRecord'.static.CreateMapItem(List.GetValueAtIndex(Index), Item);
    return Item.FullURL;
    //return;    
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
    //return;    
}

defaultproperties
{
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_MainBase.FilterCheck'
    begin object name="FilterCheck" class=XInterface.moCheckBox
        CaptionWidth=0.1000000
        ComponentWidth=0.9000000
        Caption="?? ?? ??"
        OnCreateComponent=FilterCheck.InternalOnCreateComponent
        Hint="?? ?? ??? ?????? ??? ??? ?????."
        WinTop=0.9495310
        WinLeft=0.0392580
        WinWidth=0.3417970
        WinHeight=0.0300350
        TabOrder=1
        OnChange=UT2K4Tab_MainBase.ChangeMapFilter
    end object
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
    WinTop=0.1500000
    WinHeight=0.7700000
}