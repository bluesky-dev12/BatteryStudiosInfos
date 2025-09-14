class UT2K4Movies extends ModsAndDemosTabs
    editinlinenew
    instanced;

struct DefItem
{
    var localized string MapName;
    var localized string Title;
    var localized string Author;
};

var() automated GUISectionBackground sb_Maps;
var() automated GUISectionBackground sb_Preview;
var() automated AltSectionBackground sb_Scroll;
var() automated GUIScrollTextBox lb_MapDesc;
var() automated GUIListBox lb_Maps;
var() automated GUIImage i_MapPreview;
var() automated GUILabel l_MapAuthor;
var() automated GUILabel l_NoPreview;
var array<MapRecord> Maps;
var array<DefItem> DefaultItems;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    i = 0;
    J0x17:

    // End:0x6F [Loop If]
    if(i < DefaultItems.Length)
    {
        lb_Maps.List.Add(DefaultItems[i].Title,, "" $ string((i + 1) * -1));
        i++;
        // [Loop Continue]
        goto J0x17;
    }
    Class'Engine.CacheManager'.static.GetMapList(Maps, "MOV");
    i = 0;
    J0x8C:

    // End:0xF5 [Loop If]
    if(i < Maps.Length)
    {
        // End:0xEB
        if(!DefaultMovie(Maps[i].MapName))
        {
            lb_Maps.List.Add(Maps[i].FriendlyName,, "" $ string(i));
        }
        i++;
        // [Loop Continue]
        goto J0x8C;
    }
    sb_Maps.ManageComponent(lb_Maps);
    sb_Scroll.ManageComponent(lb_MapDesc);
    lb_Maps.__OnChange__Delegate = MapListChange;
    MapListChange(lb_Maps);
    MyPage.MyFooter.b_Movie.__OnClick__Delegate = MovieClick;
    //return;    
}

function bool DefaultMovie(string Mov)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x3D [Loop If]
    if(i < DefaultItems.Length)
    {
        // End:0x33
        if(DefaultItems[i].MapName ~= Mov)
        {
            return true;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return false;
    //return;    
}

function string GetMovieInfo(string Index, string Prop)
{
    local int i;

    i = int(Index);
    // End:0xA2
    if(i >= 0)
    {
        // End:0x3B
        if(Prop == "author")
        {
            return Maps[i].Author;
        }
        // End:0x5C
        if(Prop == "desc")
        {
            return Maps[i].Description;
        }
        // End:0x7C
        if(Prop == "map")
        {
            return Maps[i].MapName;
        }
        // End:0x9F
        if(Prop == "screen")
        {
            return Maps[i].ScreenshotRef;
        }        
    }
    else
    {
        i = int(Abs(float(i)));
        // End:0xD9
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
    //return;    
}

function MapListChange(GUIComponent Sender)
{
    l_MapAuthor.Caption = GetMovieInfo(lb_Maps.List.GetExtra(), "author");
    lb_MapDesc.SetContent(GetMovieInfo(lb_Maps.List.GetExtra(), "desc"));
    UpdateScreenshot(GetMovieInfo(lb_Maps.List.GetExtra(), "screen"));
    //return;    
}

function UpdateScreenshot(string ScreenshotRef)
{
    local Material Screenie;

    Screenie = Material(DynamicLoadObject(ScreenshotRef, Class'Engine.Material'));
    i_MapPreview.Image = Screenie;
    l_NoPreview.SetVisibility(Screenie == none);
    i_MapPreview.SetVisibility(Screenie != none);
    //return;    
}

function bool MovieClick(GUIComponent Sender)
{
    Console(Controller.Master.Console).DelayedConsoleCommand(("open" @ (GetMovieInfo(lb_Maps.List.GetExtra(), "map"))) $ "?game=");
    return true;
    //return;    
}

defaultproperties
{
    // Reference: GUISectionBackground'GUI2K4_Decompressed.UT2K4Movies.sbMaps'
    begin object name="sbMaps" class=XInterface.GUISectionBackground
        bFillClient=true
        Caption="??? ??"
        WinTop=0.0181250
        WinLeft=0.0169930
        WinWidth=0.4821490
        WinHeight=0.5236110
        OnPreDraw=sbMaps.InternalPreDraw
    end object
    sb_Maps=sbMaps
    // Reference: GUISectionBackground'GUI2K4_Decompressed.UT2K4Movies.sbPreview'
    begin object name="sbPreview" class=XInterface.GUISectionBackground
        bFillClient=true
        Caption="???"
        WinTop=0.0181250
        WinLeft=0.5157430
        WinWidth=0.4708990
        WinHeight=0.5278760
        OnPreDraw=sbPreview.InternalPreDraw
    end object
    sb_Preview=sbPreview
    // Reference: AltSectionBackground'GUI2K4_Decompressed.UT2K4Movies.sbScroll'
    begin object name="sbScroll" class=GUI2K4_Decompressed.AltSectionBackground
        bFillClient=true
        Caption="??? ??"
        WinTop=0.5612070
        WinLeft=0.0199700
        WinWidth=0.9679240
        WinHeight=0.4218700
        OnPreDraw=sbScroll.InternalPreDraw
    end object
    sb_Scroll=sbScroll
    // Reference: GUIScrollTextBox'GUI2K4_Decompressed.UT2K4Movies.lbMapDesc'
    begin object name="lbMapDesc" class=XInterface.GUIScrollTextBox
        CharDelay=0.0025000
        EOLDelay=0.5000000
        OnCreateComponent=lbMapDesc.InternalOnCreateComponent
        WinTop=0.6284210
        WinLeft=0.5610650
        WinWidth=0.3799930
        WinHeight=0.2684100
        bTabStop=false
        bNeverFocus=true
    end object
    lb_MapDesc=lbMapDesc
    // Reference: GUIListBox'GUI2K4_Decompressed.UT2K4Movies.lbMaps'
    begin object name="lbMaps" class=XInterface.GUIListBox
        bVisibleWhenEmpty=true
        OnCreateComponent=lbMaps.InternalOnCreateComponent
        Hint="???? ???? ???? ??? ? ? ????. ???? ?? ??? ?? ? ? ????."
        WinTop=0.1692720
        WinLeft=0.0456710
        WinWidth=0.4224810
        WinHeight=0.4498700
        TabOrder=0
    end object
    lb_Maps=lbMaps
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4Movies.iMapPreview'
    begin object name="iMapPreview" class=XInterface.GUIImage
        ImageStyle=2
        ImageRenderStyle=1
        WinTop=0.1076910
        WinLeft=0.5626680
        WinWidth=0.3720020
        WinHeight=0.3574800
        RenderWeight=0.2000000
    end object
    i_MapPreview=iMapPreview
    // Reference: GUILabel'GUI2K4_Decompressed.UT2K4Movies.MapAuthorLabel'
    begin object name="MapAuthorLabel" class=XInterface.GUILabel
        TextAlign=1
        StyleName="TextLabel"
        WinTop=0.4676580
        WinLeft=0.5382090
        WinWidth=0.4261800
        WinHeight=0.0325520
        RenderWeight=0.3000000
    end object
    l_MapAuthor=MapAuthorLabel
    // Reference: GUILabel'GUI2K4_Decompressed.UT2K4Movies.lNoPreview'
    begin object name="lNoPreview" class=XInterface.GUILabel
        Caption="???? ????"
        TextAlign=1
        TextColor=(R=247,G=255,B=0,A=255)
        TextFont="UT2HeaderFont"
        bTransparent=false
        bMultiLine=true
        VertAlign=1
        WinTop=0.1076910
        WinLeft=0.5626680
        WinWidth=0.3720020
        WinHeight=0.3574800
    end object
    l_NoPreview=lNoPreview
    DefaultItems[0]=(MapName="MOV-UT2004-Intro",Title="UT2004 ?? ???? ??? ???",Author="Epic Games")
    DefaultItems[1]=(MapName="MOV-UT2-Intro",Title="UT2003 ?? ???? ??? ???",Author="Epic Games")
    DefaultItems[2]=(MapName="TUT-BR",Title="?? ????",Author="Epic Games")
    DefaultItems[3]=(MapName="TUT-CTF",Title="?? ? ??? ????",Author="Epic Games")
    DefaultItems[4]=(MapName="TUT-DM",Title="?? ?? ????",Author="Epic Games")
    DefaultItems[5]=(MapName="TUT-DOM",Title="?? ?? ????",Author="Epic Games")
    DefaultItems[6]=(MapName="TUT-ONS",Title="??? ????",Author="Epic Games")
    Tag=4
}