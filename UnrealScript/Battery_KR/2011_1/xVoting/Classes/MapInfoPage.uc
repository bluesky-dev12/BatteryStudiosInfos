class MapInfoPage extends LockedFloatingWindow
    editinlinenew
    instanced;

var() automated GUISectionBackground sb_Info;
var() automated GUIScrollTextBox lb_MapDesc;
var() automated GUIImage i_MapImage;
var() automated GUILabel l_MapAuthor;
var() automated GUILabel l_MapPlayers;
var() automated GUILabel l_NoPreview;
var array<MapRecord> Maps;
var localized string MessageNoInfo;
var localized string AuthorText;
var localized string PlayerText;
var localized string lmsgLevelPreviewUnavailable;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    b_Cancel.SetVisibility(false);
    sb_Main.SetPosition(0.0423020, 0.0432860, 0.9170830, 0.4519790);
    sb_Main.bBoundToParent = true;
    sb_Main.bScaleToParent = true;
    sb_Main.ManageComponent(i_MapImage);
    sb_Info.ManageComponent(lb_MapDesc);
    sb_Info.bBoundToParent = true;
    sb_Info.bScaleToParent = true;
    Class'Engine.CacheManager'.static.GetMapList(Maps);
    //return;    
}

function HandleParameters(string Param1, string Param2)
{
    ReadMapInfo(Param1);
    //return;    
}

function ReadMapInfo(string MapName)
{
    local DecoText dText;
    local string MDesc;
    local int Index, i;
    local Material Screenie;
    local string Package, Item;

    // End:0x0E
    if(MapName == "")
    {
        return;
    }
    // End:0x24
    if(!Controller.bCurMenuInitialized)
    {
        return;
    }
    MapName = StripMapName(MapName);
    Index = FindCacheRecordIndex(MapName);
    // End:0x7F
    if(Maps[Index].FriendlyName != "")
    {
        sb_Main.Caption = Maps[Index].FriendlyName;        
    }
    else
    {
        sb_Main.Caption = MapName;
    }
    // End:0xD0
    if(Maps[Index].ScreenshotRef != "")
    {
        Screenie = Material(DynamicLoadObject(Maps[Index].ScreenshotRef, Class'Engine.Material'));
    }
    i_MapImage.Image = Screenie;
    l_NoPreview.SetVisibility(Screenie == none);
    i_MapImage.SetVisibility(Screenie != none);
    l_MapPlayers.Caption = ((string(Maps[Index].PlayerCountMin) @ "-") @ string(Maps[Index].PlayerCountMax)) @ PlayerText;
    // End:0x1EF
    if(Class'Engine.CacheManager'.static.Is2003Content(Maps[Index].MapName))
    {
        // End:0x1EF
        if(Maps[i].TextName != "")
        {
            // End:0x1D0
            if(!Divide(Maps[Index].TextName, ".", Package, Item))
            {
                Package = "XMaps";
                Item = Maps[Index].TextName;
            }
            dText = Class'WGame.wUtil'.static.LoadDecoText(Package, Item);
        }
    }
    // End:0x25C
    if(dText != none)
    {
        i = 0;
        J0x201:

        // End:0x259 [Loop If]
        if(i < dText.Rows.Length)
        {
            // End:0x232
            if(MDesc != "")
            {
                MDesc $= "|";
            }
            MDesc $= dText.Rows[i];
            i++;
            // [Loop Continue]
            goto J0x201;
        }        
    }
    else
    {
        MDesc = Maps[Index].Description;
    }
    // End:0x289
    if(MDesc == "")
    {
        MDesc = MessageNoInfo;
    }
    lb_MapDesc.SetContent(MDesc);
    // End:0x2E2
    if(Maps[Index].Author != "")
    {
        l_MapAuthor.Caption = (AuthorText $ ":") @ Maps[Index].Author;        
    }
    else
    {
        l_MapAuthor.Caption = "";
    }
    //return;    
}

function string StripMapName(string FullMapName)
{
    local int pos;

    pos = InStr(FullMapName, " ");
    // End:0x31
    if(pos != -1)
    {
        FullMapName = Left(FullMapName, pos);
    }
    return FullMapName;
    //return;    
}

function int FindCacheRecordIndex(string MapName)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x41 [Loop If]
    if(i < Maps.Length)
    {
        // End:0x37
        if(Maps[i].MapName == MapName)
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

function bool ReturnButtonOnClick(GUIComponent Sender)
{
    Controller.CloseMenu(true);
    return true;
    //return;    
}

function SetVisibility(bool bIsVisible)
{
    super(GUIMultiComponent).SetVisibility(bIsVisible);
    l_NoPreview.SetVisibility(i_MapImage.Image == none);
    i_MapImage.SetVisibility(i_MapImage.Image != none);
    //return;    
}

defaultproperties
{
    // Reference: GUISectionBackground'xVoting_Decompressed.MapInfoPage.sbInfo'
    begin object name="sbInfo" class=XInterface.GUISectionBackground
        bFillClient=true
        WinTop=0.5146980
        WinLeft=0.0453050
        WinWidth=0.9183220
        WinHeight=0.3741670
        OnPreDraw=sbInfo.InternalPreDraw
    end object
    sb_Info=sbInfo
    // Reference: GUIScrollTextBox'xVoting_Decompressed.MapInfoPage.MapInfoList'
    begin object name="MapInfoList" class=XInterface.GUIScrollTextBox
        CharDelay=0.0025000
        EOLDelay=0.5000000
        bVisibleWhenEmpty=true
        OnCreateComponent=MapInfoList.InternalOnCreateComponent
        WinTop=0.6202350
        WinLeft=0.2848880
        WinWidth=0.9183220
        WinHeight=0.2075000
        bTabStop=false
        bScaleToParent=true
        bNeverFocus=true
    end object
    lb_MapDesc=MapInfoList
    // Reference: GUIImage'xVoting_Decompressed.MapInfoPage.MapImage'
    begin object name="MapImage" class=XInterface.GUIImage
        ImageStyle=2
        ImageRenderStyle=1
        WinTop=0.1731770
        WinLeft=0.2818850
        WinWidth=0.9170830
        WinHeight=0.4519790
        RenderWeight=0.2000000
        bScaleToParent=true
    end object
    i_MapImage=MapImage
    // Reference: GUILabel'xVoting_Decompressed.MapInfoPage.MapAuthorLabel'
    begin object name="MapAuthorLabel" class=XInterface.GUILabel
        Caption="????"
        TextAlign=1
        TextColor=(R=255,G=255,B=255,A=255)
        TextFont="UT2ServerListFont"
        WinTop=0.3662570
        WinLeft=0.0428040
        WinWidth=0.9153130
        WinHeight=0.0493590
        RenderWeight=0.3000000
        bScaleToParent=true
    end object
    l_MapAuthor=MapAuthorLabel
    // Reference: GUILabel'xVoting_Decompressed.MapInfoPage.MapPlayersLabel'
    begin object name="MapPlayersLabel" class=XInterface.GUILabel
        Caption="????"
        TextAlign=1
        TextColor=(R=255,G=255,B=255,A=255)
        TextFont="UT2ServerListFont"
        WinTop=0.3976520
        WinLeft=0.0428040
        WinWidth=0.9153130
        WinHeight=0.0493590
        RenderWeight=0.3000000
        bScaleToParent=true
    end object
    l_MapPlayers=MapPlayersLabel
    // Reference: GUILabel'xVoting_Decompressed.MapInfoPage.NoPreview'
    begin object name="NoPreview" class=XInterface.GUILabel
        Caption="No Preview Available"
        TextAlign=1
        TextColor=(R=247,G=255,B=0,A=255)
        TextFont="UT2HeaderFont"
        bTransparent=false
        bMultiLine=true
        VertAlign=1
        WinTop=0.1731770
        WinLeft=0.2818850
        WinWidth=0.9170830
        WinHeight=0.4519790
        bScaleToParent=true
    end object
    l_NoPreview=NoPreview
    MessageNoInfo="??? ????!"
    AuthorText="???"
    PlayerText="????"
    lmsgLevelPreviewUnavailable="?? ???? ???"
    DefaultLeft=0.2640630
    DefaultTop=0.0772130
    DefaultWidth=0.4687500
    DefaultHeight=0.8019540
    bAllowedAsLast=true
    WinTop=0.0772130
    WinLeft=0.2640630
    WinWidth=0.4687500
    WinHeight=0.8019540
}