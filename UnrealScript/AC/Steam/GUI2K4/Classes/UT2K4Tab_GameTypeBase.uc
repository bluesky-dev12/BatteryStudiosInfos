/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4Tab_GameTypeBase.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:14
 *	Functions:13
 *
 *******************************************************************************/
class UT2K4Tab_GameTypeBase extends UT2K4GameTabBase
    editinlinenew
    instanced;

struct SortHack
{
    var string GameClass;
    var byte Weight;
};

var array<SortHack> GamePos;
var export editinline UT2K4Tab_MainBase tp_Main;
var array<GameRecord> GameTypes;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sb_Games;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIListBox lb_Games;
var export editinline GUIList li_Games;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sb_Preview;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel l_NoPreview;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage i_GamePreview;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify AltSectionBackground i_bk;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIScrollTextBox lb_GameDesc;
var localized string EpicGameCaption;
var localized string CustomGameCaption;
var delegate<OnChangeGameType> __OnChangeGameType__Delegate;

delegate OnChangeGameType(bool bIsCustom);
function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    li_Games = lb_Games.List;
    li_Games.bHotTrack = true;
    li_Games.__OnTrack__Delegate = InternalOnTrack;
    li_Games.__CompareItem__Delegate = GametypeSort;
    PopulateGameTypes();
    InitPreview();
    lb_GameDesc.MyScrollText.Style = lb_GameDesc.Style;
    i_bk.ManageComponent(lb_GameDesc);
}

function PopulateGameTypes()
{
    local int i, cnt;

    class'CacheManager'.static.GetGameTypeList(GameTypes);
    i = 0;
    J0x18:
    // End:0xea [While If]
    if(i < GameTypes.Length)
    {
        // End:0x88
        if(HasMaps(GameTypes[i]))
        {
            // End:0x7e
            if(GameTypes[i].GameTypeGroup < 3)
            {
                AddEpicGameType(GameTypes[i].GameName, GameTypes[i].MapListClassName);
            }
            // End:0x85
            else
            {
                ++ cnt;
            }
        }
        // End:0xe0
        else
        {
            // End:0xe0
            if(GameTypes[i].GameTypeGroup >= 3)
            {
                Log("Gametype" @ GameTypes[i].ClassName @ "found but it has no maps", 'Warning');
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x18;
    }
    // End:0x1ab
    if(cnt > 0)
    {
        li_Games.Add(CustomGameCaption, none, "", true);
        i = 0;
        J0x114:
        // End:0x181 [While If]
        if(i < GameTypes.Length)
        {
            // End:0x177
            if(HasMaps(GameTypes[i]))
            {
                // End:0x177
                if(GameTypes[i].GameTypeGroup >= 3)
                {
                    AddEpicGameType(GameTypes[i].GameName, GameTypes[i].MapListClassName);
                }
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x114;
        }
        li_Games.Insert(0, EpicGameCaption, none, "", true, true);
        li_Games.SetIndex(1);
    }
}

function bool HasMaps(GameRecord TestRec)
{
    local array<MapRecord> Records;

    // End:0x36
    if(TestRec.MapPrefix != "")
    {
        class'CacheManager'.static.GetMapList(Records, TestRec.MapPrefix);
        return Records.Length > 0;
    }
    return false;
}

function InitPreview()
{
    local Material Screenie;
    local int Index;

    Index = FindRecordIndex(li_Games.Get(true));
    // End:0xb8
    if(Index >= 0 && Index < GameTypes.Length)
    {
        Screenie = Material(DynamicLoadObject(GameTypes[Index].ScreenshotRef, class'Material'));
        // End:0x98
        if(GameTypes[Index].Description != "")
        {
            lb_GameDesc.SetContent(GameTypes[Index].Description);
        }
        // End:0xb5
        else
        {
            lb_GameDesc.SetContent(class'UT2K4Tab_MainBase'.default.MessageNoInfo);
        }
    }
    // End:0xd5
    else
    {
        lb_GameDesc.SetContent(class'UT2K4Tab_MainBase'.default.MessageNoInfo);
    }
    i_GamePreview.Image = Screenie;
    i_GamePreview.SetVisibility(Screenie != none);
    l_NoPreview.SetVisibility(Screenie == none);
    i_bk.Caption = li_Games.Get();
}

function int GametypeSort(GUIListElem ElemA, GUIListElem ElemB)
{
    local byte A, B;

    A = GetWeight(FindGameClass(ElemA.Item), ElemA.bSection);
    B = GetWeight(FindGameClass(ElemB.Item), ElemB.bSection);
    // End:0xa3
    if(A == B)
    {
        // End:0x7f
        if(ElemA.Item > ElemB.Item)
        {
            return 1;
        }
        // End:0x9e
        else
        {
            // End:0x9e
            if(ElemA.Item < ElemB.Item)
            {
                return -1;
            }
        }
        return 0;
    }
    // End:0xb4
    else
    {
        return A - B;
    }
    return GetWeight(FindGameClass(ElemA.Item), ElemA.bSection) - GetWeight(FindGameClass(ElemB.Item), ElemA.bSection);
}

function byte GetWeight(string GameClass, bool bSection)
{
    local int i;

    // End:0x0c
    if(bSection)
    {
        return 254;
    }
    i = 0;
    J0x13:
    // End:0x58 [While If]
    if(i < GamePos.Length)
    {
        // End:0x4e
        if(GamePos[i].GameClass ~= GameClass)
        {
            return GamePos[i].Weight;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x13;
    }
    return byte(255);
}

function AddEpicGameType(string GameName, string MapList)
{
    li_Games.Add(GameName, none, MapList);
}

function InternalOnChange(GUIComponent Sender)
{
    local int Index;

    Index = FindRecordIndex(li_Games.Get());
    // End:0x3a
    if(Index < 0 || Index >= GameTypes.Length)
    {
        return;
    }
    // End:0x99
    if(Controller.LastGameType == "" || GameTypes[Index].ClassName != Controller.LastGameType)
    {
        InitPreview();
        Controller.LastGameType = GameTypes[Index].ClassName;
    }
    // End:0xc7
    if(Sender == lb_Games)
    {
        // End:0xbc
        if(li_Games.IsSection())
        {
            return;
        }
        OnChangeGameType(false);
    }
}

function InternalOnTrack(GUIComponent Sender, int OldIndex)
{
    // End:0x16
    if(!li_Games.IsValid())
    {
        return;
    }
    // End:0x3e
    if(li_Games.IsSection())
    {
        li_Games.Index = OldIndex;
        return;
    }
    InitPreview();
}

function int FindRecordIndex(string GameName)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x41 [While If]
    if(i < GameTypes.Length)
    {
        // End:0x37
        if(GameTypes[i].GameName ~= GameName)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return -1;
}

function string FindGameClass(string GameName)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x4c [While If]
    if(i < GameTypes.Length)
    {
        // End:0x42
        if(GameTypes[i].GameName ~= GameName)
        {
            return GameTypes[i].ClassName;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return "";
}

event SetVisibility(bool bIsVisible)
{
    super(GUIMultiComponent).SetVisibility(bIsVisible);
    i_GamePreview.SetVisibility(i_GamePreview.Image != none);
    l_NoPreview.SetVisibility(i_GamePreview.Image == none);
}

defaultproperties
{
    GamePos=// Object reference not set to an instance of an object.
    
    begin object name=GameTypeLeftGroup class=GUISectionBackground
        Caption="?? ??? ?? ??"
        TopPadding=0.0250
        BottomPadding=0.0250
        WinTop=0.0431250
        WinLeft=0.023750
        WinWidth=0.48250
        WinHeight=0.941490
        TabOrder=0
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'UT2K4Tab_GameTypeBase.GameTypeLeftGroup'
    sb_Games=GameTypeLeftGroup
    begin object name=UT2004Games class=GUIListBox
        SelectedStyleName="ListSelection"
        bVisibleWhenEmpty=true
        bSorted=true
        OnCreateComponent=InternalOnCreateComponent
        FontScale=2
        WinTop=0.1442250
        WinLeft=0.0455990
        WinWidth=0.4384570
        WinHeight=0.7969820
        TabOrder=0
        bBoundToParent=true
        bScaleToParent=true
        OnChange=InternalOnChange
    object end
    // Reference: GUIListBox'UT2K4Tab_GameTypeBase.UT2004Games'
    lb_Games=UT2004Games
    begin object name=GameTypeRightGroup class=GUISectionBackground
        Caption="????"
        WinTop=0.0431250
        WinLeft=0.5132430
        WinWidth=0.4646490
        WinHeight=0.941490
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'UT2K4Tab_GameTypeBase.GameTypeRightGroup'
    sb_Preview=GameTypeRightGroup
    begin object name=NoPreview class=GUILabel
        Caption="???? ??."
        TextAlign=1
        TextColor=(R=247,G=255,B=0,A=255)
        TextFont="UT2HeaderFont"
        bTransparent=true
        bMultiLine=true
        VertAlign=1
        WinTop=0.1428260
        WinLeft=0.5392240
        WinWidth=0.4118620
        WinHeight=0.3165450
    object end
    // Reference: GUILabel'UT2K4Tab_GameTypeBase.NoPreview'
    l_NoPreview=NoPreview
    begin object name=GameTypePreview class=GUIImage
        ImageStyle=2
        ImageRenderStyle=1
        WinTop=0.1428260
        WinLeft=0.5392240
        WinWidth=0.4118620
        WinHeight=0.3165450
        RenderWeight=0.20
    object end
    // Reference: GUIImage'UT2K4Tab_GameTypeBase.GameTypePreview'
    i_GamePreview=GameTypePreview
    begin object name=Bk1 class=AltSectionBackground
        WinTop=0.4785530
        WinLeft=0.5356220
        WinWidth=0.419030
        WinHeight=0.4744550
        RenderWeight=0.30
        OnPreDraw=InternalPreDraw
    object end
    // Reference: AltSectionBackground'UT2K4Tab_GameTypeBase.Bk1'
    i_bk=Bk1
    begin object name=GameTypeDescription class=GUIScrollTextBox
        bNoTeletype=true
        CharDelay=0.00250
        EOLDelay=0.50
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.5567740
        WinLeft=0.565270
        WinWidth=0.3620560
        WinHeight=0.3257160
        bTabStop=true
        bNeverFocus=true
    object end
    // Reference: GUIScrollTextBox'UT2K4Tab_GameTypeBase.GameTypeDescription'
    lb_GameDesc=GameTypeDescription
    EpicGameCaption="?? ?? ??"
    CustomGameCaption="??? ?? ??"
}