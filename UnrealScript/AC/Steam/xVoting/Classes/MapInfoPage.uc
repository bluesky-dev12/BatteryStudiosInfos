/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path xVoting\Classes\MapInfoPage.uc
 * Package Imports:
 *	xVoting
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:11
 *	Functions:7
 *
 *******************************************************************************/
class MapInfoPage extends LockedFloatingWindow
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sb_Info;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIScrollTextBox lb_MapDesc;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage i_MapImage;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel l_MapAuthor;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel l_MapPlayers;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel l_NoPreview;
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
    class'CacheManager'.static.GetMapList(Maps);
}

function HandleParameters(string Param1, string Param2)
{
    ReadMapInfo(Param1);
}

function ReadMapInfo(string MapName)
{
    local DecoText dText;
    local string MDesc;
    local int Index, i;
    local Material Screenie;
    local string Package, Item;

    // End:0x0e
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
    // End:0x7f
    if(Maps[Index].FriendlyName != "")
    {
        sb_Main.Caption = Maps[Index].FriendlyName;
    }
    // End:0x93
    else
    {
        sb_Main.Caption = MapName;
    }
    // End:0xd0
    if(Maps[Index].ScreenshotRef != "")
    {
        Screenie = Material(DynamicLoadObject(Maps[Index].ScreenshotRef, class'Material'));
    }
    i_MapImage.Image = Screenie;
    l_NoPreview.SetVisibility(Screenie == none);
    i_MapImage.SetVisibility(Screenie != none);
    l_MapPlayers.Caption = string(Maps[Index].PlayerCountMin) @ "-" @ string(Maps[Index].PlayerCountMax) @ PlayerText;
    // End:0x1ef
    if(class'CacheManager'.static.Is2003Content(Maps[Index].MapName))
    {
        // End:0x1ef
        if(Maps[i].TextName != "")
        {
            // End:0x1d0
            if(!Divide(Maps[Index].TextName, ".", Package, Item))
            {
                Package = "XMaps";
                Item = Maps[Index].TextName;
            }
            dText = class'wUtil'.static.LoadDecoText(Package, Item);
        }
    }
    // End:0x25c
    if(dText != none)
    {
        i = 0;
        J0x201:
        // End:0x259 [While If]
        if(i < dText.Rows.Length)
        {
            // End:0x232
            if(MDesc != "")
            {
                MDesc $= "|";
            }
            MDesc $= dText.Rows[i];
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x201;
        }
    }
    // End:0x272
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
    // End:0x2e2
    if(Maps[Index].Author != "")
    {
        l_MapAuthor.Caption = AuthorText $ ":" @ Maps[Index].Author;
    }
    // End:0x2f3
    else
    {
        l_MapAuthor.Caption = "";
    }
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
}

function int FindCacheRecordIndex(string MapName)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x41 [While If]
    if(i < Maps.Length)
    {
        // End:0x37
        if(Maps[i].MapName == MapName)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return -1;
}

function bool ReturnButtonOnClick(GUIComponent Sender)
{
    Controller.CloseMenu(true);
    return true;
}

function SetVisibility(bool bIsVisible)
{
    super(GUIMultiComponent).SetVisibility(bIsVisible);
    l_NoPreview.SetVisibility(i_MapImage.Image == none);
    i_MapImage.SetVisibility(i_MapImage.Image != none);
}

defaultproperties
{
    begin object name=sbInfo class=GUISectionBackground
        bFillClient=true
        WinTop=0.5146980
        WinLeft=0.0453050
        WinWidth=0.9183220
        WinHeight=0.3741670
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'MapInfoPage.sbInfo'
    sb_Info=sbInfo
    begin object name=MapInfoList class=GUIScrollTextBox
        CharDelay=0.00250
        EOLDelay=0.50
        bVisibleWhenEmpty=true
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.6202350
        WinLeft=0.2848880
        WinWidth=0.9183220
        WinHeight=0.20750
        bTabStop=true
        bScaleToParent=true
        bNeverFocus=true
    object end
    // Reference: GUIScrollTextBox'MapInfoPage.MapInfoList'
    lb_MapDesc=MapInfoList
    begin object name=MapImage class=GUIImage
        ImageStyle=2
        ImageRenderStyle=1
        WinTop=0.1731770
        WinLeft=0.2818850
        WinWidth=0.9170830
        WinHeight=0.4519790
        RenderWeight=0.20
        bScaleToParent=true
    object end
    // Reference: GUIImage'MapInfoPage.MapImage'
    i_MapImage=MapImage
    begin object name=MapAuthorLabel class=GUILabel
        Caption="????"
        TextAlign=1
        TextColor=(R=255,G=255,B=255,A=255)
        TextFont="UT2ServerListFont"
        WinTop=0.3662570
        WinLeft=0.0428040
        WinWidth=0.9153130
        WinHeight=0.0493590
        RenderWeight=0.30
        bScaleToParent=true
    object end
    // Reference: GUILabel'MapInfoPage.MapAuthorLabel'
    l_MapAuthor=MapAuthorLabel
    begin object name=MapPlayersLabel class=GUILabel
        Caption="????"
        TextAlign=1
        TextColor=(R=255,G=255,B=255,A=255)
        TextFont="UT2ServerListFont"
        WinTop=0.3976520
        WinLeft=0.0428040
        WinWidth=0.9153130
        WinHeight=0.0493590
        RenderWeight=0.30
        bScaleToParent=true
    object end
    // Reference: GUILabel'MapInfoPage.MapPlayersLabel'
    l_MapPlayers=MapPlayersLabel
    begin object name=NoPreview class=GUILabel
        Caption="No Preview Available"
        TextAlign=1
        TextColor=(R=247,G=255,B=0,A=255)
        TextFont="UT2HeaderFont"
        bTransparent=true
        bMultiLine=true
        VertAlign=1
        WinTop=0.1731770
        WinLeft=0.2818850
        WinWidth=0.9170830
        WinHeight=0.4519790
        bScaleToParent=true
    object end
    // Reference: GUILabel'MapInfoPage.NoPreview'
    l_NoPreview=NoPreview
    MessageNoInfo="??? ????!"
    AuthorText="???"
    PlayerText="????"
    lmsgLevelPreviewUnavailable="?? ???? ???"
    DefaultLeft=0.2640630
    DefaultTop=0.0772130
    DefaultWidth=0.468750
    DefaultHeight=0.8019540
    bAllowedAsLast=true
    WinTop=0.0772130
    WinLeft=0.2640630
    WinWidth=0.468750
    WinHeight=0.8019540
}