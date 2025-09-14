/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4Movies.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:10
 *	Functions:6
 *
 *******************************************************************************/
class UT2K4Movies extends ModsAndDemosTabs
    editinlinenew
    instanced;

struct DefItem
{
    var localized string MapName;
    var localized string Title;
    var localized string Author;
};

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sb_Maps;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sb_Preview;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify AltSectionBackground sb_Scroll;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIScrollTextBox lb_MapDesc;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIListBox lb_Maps;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage i_MapPreview;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel l_MapAuthor;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel l_NoPreview;
var array<MapRecord> Maps;
var array<DefItem> DefaultItems;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    i = 0;
    J0x17:
    // End:0x6f [While If]
    if(i < DefaultItems.Length)
    {
        lb_Maps.List.Add(DefaultItems[i].Title,, "" $ string(i + 1 * -1));
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x17;
    }
    class'CacheManager'.static.GetMapList(Maps, "MOV");
    i = 0;
    J0x8c:
    // End:0xf5 [While If]
    if(i < Maps.Length)
    {
        // End:0xeb
        if(!DefaultMovie(Maps[i].MapName))
        {
            lb_Maps.List.Add(Maps[i].FriendlyName,, "" $ string(i));
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x8c;
    }
    sb_Maps.ManageComponent(lb_Maps);
    sb_Scroll.ManageComponent(lb_MapDesc);
    lb_Maps.__OnChange__Delegate = MapListChange;
    MapListChange(lb_Maps);
    MyPage.MyFooter.b_Movie.__OnClick__Delegate = MovieClick;
}

function bool DefaultMovie(string Mov)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x3d [While If]
    if(i < DefaultItems.Length)
    {
        // End:0x33
        if(DefaultItems[i].MapName ~= Mov)
        {
            return true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return false;
}

function string GetMovieInfo(string Index, string Prop)
{
    local int i;

    i = int(Index);
    // End:0xa2
    if(i >= 0)
    {
        // End:0x3b
        if(Prop == "author")
        {
            return Maps[i].Author;
        }
        // End:0x5c
        if(Prop == "desc")
        {
            return Maps[i].Description;
        }
        // End:0x7c
        if(Prop == "map")
        {
            return Maps[i].MapName;
        }
        // End:0x9f
        if(Prop == "screen")
        {
            return Maps[i].ScreenshotRef;
        }
    }
    // End:0x125
    else
    {
        i = int(Abs(float(i)));
        // End:0xd9
        if(Prop == "author")
        {
            return DefaultItems[i - 1].Author;
        }
        // End:0x102
        if(Prop == "desc")
        {
            return DefaultItems[i - 1].Title $ ".";
        }
        // End:0x125
        if(Prop == "map")
        {
            return DefaultItems[i - 1].MapName;
        }
    }
    return "";
}

function MapListChange(GUIComponent Sender)
{
    l_MapAuthor.Caption = GetMovieInfo(lb_Maps.List.GetExtra(), "author");
    lb_MapDesc.SetContent(GetMovieInfo(lb_Maps.List.GetExtra(), "desc"));
    UpdateScreenshot(GetMovieInfo(lb_Maps.List.GetExtra(), "screen"));
}

function UpdateScreenshot(string ScreenshotRef)
{
    local Material Screenie;

    Screenie = Material(DynamicLoadObject(ScreenshotRef, class'Material'));
    i_MapPreview.Image = Screenie;
    l_NoPreview.SetVisibility(Screenie == none);
    i_MapPreview.SetVisibility(Screenie != none);
}

function bool MovieClick(GUIComponent Sender)
{
    Console(Controller.Master.Console).DelayedConsoleCommand("open" @ GetMovieInfo(lb_Maps.List.GetExtra(), "map") $ "?game=");
    return true;
}

defaultproperties
{
    begin object name=sbMaps class=GUISectionBackground
        bFillClient=true
        Caption="??? ??"
        WinTop=0.0181250
        WinLeft=0.0169930
        WinWidth=0.4821490
        WinHeight=0.5236110
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'UT2K4Movies.sbMaps'
    sb_Maps=sbMaps
    begin object name=sbPreview class=GUISectionBackground
        bFillClient=true
        Caption="???"
        WinTop=0.0181250
        WinLeft=0.5157430
        WinWidth=0.4708990
        WinHeight=0.5278760
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'UT2K4Movies.sbPreview'
    sb_Preview=sbPreview
    begin object name=sbScroll class=AltSectionBackground
        bFillClient=true
        Caption="??? ??"
        WinTop=0.5612070
        WinLeft=0.019970
        WinWidth=0.9679240
        WinHeight=0.421870
        OnPreDraw=InternalPreDraw
    object end
    // Reference: AltSectionBackground'UT2K4Movies.sbScroll'
    sb_Scroll=sbScroll
    begin object name=lbMapDesc class=GUIScrollTextBox
        CharDelay=0.00250
        EOLDelay=0.50
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.6284210
        WinLeft=0.5610650
        WinWidth=0.3799930
        WinHeight=0.268410
        bTabStop=true
        bNeverFocus=true
    object end
    // Reference: GUIScrollTextBox'UT2K4Movies.lbMapDesc'
    lb_MapDesc=lbMapDesc
    begin object name=lbMaps class=GUIListBox
        bVisibleWhenEmpty=true
        OnCreateComponent=InternalOnCreateComponent
        Hint="???? ???? ???? ??? ? ? ????. ???? ?? ??? ?? ? ? ????."
        WinTop=0.1692720
        WinLeft=0.0456710
        WinWidth=0.4224810
        WinHeight=0.449870
        TabOrder=0
    object end
    // Reference: GUIListBox'UT2K4Movies.lbMaps'
    lb_Maps=lbMaps
    begin object name=iMapPreview class=GUIImage
        ImageStyle=2
        ImageRenderStyle=1
        WinTop=0.1076910
        WinLeft=0.5626680
        WinWidth=0.3720020
        WinHeight=0.357480
        RenderWeight=0.20
    object end
    // Reference: GUIImage'UT2K4Movies.iMapPreview'
    i_MapPreview=iMapPreview
    begin object name=MapAuthorLabel class=GUILabel
        TextAlign=1
        StyleName="TextLabel"
        WinTop=0.4676580
        WinLeft=0.5382090
        WinWidth=0.426180
        WinHeight=0.0325520
        RenderWeight=0.30
    object end
    // Reference: GUILabel'UT2K4Movies.MapAuthorLabel'
    l_MapAuthor=MapAuthorLabel
    begin object name=lNoPreview class=GUILabel
        Caption="???? ????"
        TextAlign=1
        TextColor=(R=247,G=255,B=0,A=255)
        TextFont="UT2HeaderFont"
        bTransparent=true
        bMultiLine=true
        VertAlign=1
        WinTop=0.1076910
        WinLeft=0.5626680
        WinWidth=0.3720020
        WinHeight=0.357480
    object end
    // Reference: GUILabel'UT2K4Movies.lNoPreview'
    l_NoPreview=lNoPreview
    DefaultItems=// Object reference not set to an instance of an object.
    
    Tag=4
}