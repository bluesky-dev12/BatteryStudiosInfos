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
var() automated GUISectionBackground sb_Games;
var() automated GUIListBox lb_Games;
var export editinline GUIList li_Games;
var() automated GUISectionBackground sb_Preview;
var() automated GUILabel l_NoPreview;
var() automated GUIImage i_GamePreview;
var() automated AltSectionBackground i_bk;
var() automated GUIScrollTextBox lb_GameDesc;
var localized string EpicGameCaption;
var localized string CustomGameCaption;
//var delegate<OnChangeGameType> __OnChangeGameType__Delegate;

delegate OnChangeGameType(bool bIsCustom)
{
    //return;    
}

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
    //return;    
}

function PopulateGameTypes()
{
    local int i, cnt;

    Class'Engine.CacheManager'.static.GetGameTypeList(GameTypes);
    i = 0;
    J0x18:

    // End:0xEA [Loop If]
    if(i < GameTypes.Length)
    {
        // End:0x88
        if(HasMaps(GameTypes[i]))
        {
            // End:0x7E
            if(int(GameTypes[i].GameTypeGroup) < 3)
            {
                AddEpicGameType(GameTypes[i].GameName, GameTypes[i].MapListClassName);                
            }
            else
            {
                cnt++;
            }
            // [Explicit Continue]
            goto J0xE0;
        }
        // End:0xE0
        if(int(GameTypes[i].GameTypeGroup) >= 3)
        {
            Log(("Gametype" @ GameTypes[i].ClassName) @ "found but it has no maps", 'Warning');
        }
        J0xE0:

        i++;
        // [Loop Continue]
        goto J0x18;
    }
    // End:0x1AB
    if(cnt > 0)
    {
        li_Games.Add(CustomGameCaption, none, "", true);
        i = 0;
        J0x114:

        // End:0x181 [Loop If]
        if(i < GameTypes.Length)
        {
            // End:0x177
            if(HasMaps(GameTypes[i]))
            {
                // End:0x177
                if(int(GameTypes[i].GameTypeGroup) >= 3)
                {
                    AddEpicGameType(GameTypes[i].GameName, GameTypes[i].MapListClassName);
                }
            }
            i++;
            // [Loop Continue]
            goto J0x114;
        }
        li_Games.Insert(0, EpicGameCaption, none, "", true, true);
        li_Games.SetIndex(1);
    }
    //return;    
}

function bool HasMaps(GameRecord TestRec)
{
    local array<MapRecord> Records;

    // End:0x36
    if(TestRec.MapPrefix != "")
    {
        Class'Engine.CacheManager'.static.GetMapList(Records, TestRec.MapPrefix);
        return Records.Length > 0;
    }
    return false;
    //return;    
}

function InitPreview()
{
    local Material Screenie;
    local int Index;

    Index = FindRecordIndex(li_Games.Get(true));
    // End:0xB8
    if((Index >= 0) && Index < GameTypes.Length)
    {
        Screenie = Material(DynamicLoadObject(GameTypes[Index].ScreenshotRef, Class'Engine.Material'));
        // End:0x98
        if(GameTypes[Index].Description != "")
        {
            lb_GameDesc.SetContent(GameTypes[Index].Description);            
        }
        else
        {
            lb_GameDesc.SetContent(Class'GUI2K4_Decompressed.UT2K4Tab_MainBase'.default.MessageNoInfo);
        }        
    }
    else
    {
        lb_GameDesc.SetContent(Class'GUI2K4_Decompressed.UT2K4Tab_MainBase'.default.MessageNoInfo);
    }
    i_GamePreview.Image = Screenie;
    i_GamePreview.SetVisibility(Screenie != none);
    l_NoPreview.SetVisibility(Screenie == none);
    i_bk.Caption = li_Games.Get();
    //return;    
}

function int GametypeSort(GUIListElem ElemA, GUIListElem ElemB)
{
    local byte A, B;

    A = GetWeight(FindGameClass(ElemA.Item), ElemA.bSection);
    B = GetWeight(FindGameClass(ElemB.Item), ElemB.bSection);
    // End:0xA3
    if(int(A) == int(B))
    {
        // End:0x7F
        if(ElemA.Item > ElemB.Item)
        {
            return 1;            
        }
        else
        {
            // End:0x9E
            if(ElemA.Item < ElemB.Item)
            {
                return -1;
            }
        }
        return 0;        
    }
    else
    {
        return int(A) - int(B);
    }
    return int(GetWeight(FindGameClass(ElemA.Item), ElemA.bSection)) - int(GetWeight(FindGameClass(ElemB.Item), ElemA.bSection));
    //return;    
}

function byte GetWeight(string GameClass, bool bSection)
{
    local int i;

    // End:0x0C
    if(bSection)
    {
        return 254;
    }
    i = 0;
    J0x13:

    // End:0x58 [Loop If]
    if(i < GamePos.Length)
    {
        // End:0x4E
        if(GamePos[i].GameClass ~= GameClass)
        {
            return GamePos[i].Weight;
        }
        i++;
        // [Loop Continue]
        goto J0x13;
    }
    return byte(255);
    //return;    
}

function AddEpicGameType(string GameName, string MapList)
{
    li_Games.Add(GameName, none, MapList);
    //return;    
}

function InternalOnChange(GUIComponent Sender)
{
    local int Index;

    Index = FindRecordIndex(li_Games.Get());
    // End:0x3A
    if((Index < 0) || Index >= GameTypes.Length)
    {
        return;
    }
    // End:0x99
    if((Controller.LastGameType == "") || GameTypes[Index].ClassName != Controller.LastGameType)
    {
        InitPreview();
        Controller.LastGameType = GameTypes[Index].ClassName;
    }
    // End:0xC7
    if(Sender == lb_Games)
    {
        // End:0xBC
        if(li_Games.IsSection())
        {
            return;
        }
        OnChangeGameType(false);
    }
    //return;    
}

function InternalOnTrack(GUIComponent Sender, int OldIndex)
{
    // End:0x16
    if(!li_Games.IsValid())
    {
        return;
    }
    // End:0x3E
    if(li_Games.IsSection())
    {
        li_Games.Index = OldIndex;
        return;
    }
    InitPreview();
    //return;    
}

function int FindRecordIndex(string GameName)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x41 [Loop If]
    if(i < GameTypes.Length)
    {
        // End:0x37
        if(GameTypes[i].GameName ~= GameName)
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

function string FindGameClass(string GameName)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x4C [Loop If]
    if(i < GameTypes.Length)
    {
        // End:0x42
        if(GameTypes[i].GameName ~= GameName)
        {
            return GameTypes[i].ClassName;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return "";
    //return;    
}

event SetVisibility(bool bIsVisible)
{
    super(GUIMultiComponent).SetVisibility(bIsVisible);
    i_GamePreview.SetVisibility(i_GamePreview.Image != none);
    l_NoPreview.SetVisibility(i_GamePreview.Image == none);
    //return;    
}

defaultproperties
{
    GamePos[0]=(GameClass="UT2K4Assault.ASGameInfo",Weight=0)
    GamePos[1]=(GameClass="Onslaught.ONSOnslaughtGame",Weight=1)
    GamePos[2]=(GameClass="xGame.xDeathMatch",Weight=2)
    GamePos[3]=(GameClass="xGame.xCTFGame",Weight=3)
    GamePos[4]=(GameClass="xGame.xTeamGame",Weight=4)
    GamePos[5]=(GameClass="xGame.xDoubleDom",Weight=5)
    GamePos[6]=(GameClass="xGame.xBombingRun",Weight=6)
    GamePos[7]=(GameClass="BonusPack.xMutantGame",Weight=7)
    GamePos[8]=(GameClass="SkaarjPack.Invasion",Weight=8)
    GamePos[9]=(GameClass="BonusPack.xLastManStandingGame",Weight=9)
    GamePos[10]=(GameClass="xGame.xVehicleCTFGame",Weight=10)
    GamePos[11]=(GameClass="xGame.InstagibCTF",Weight=11)
    // Reference: GUISectionBackground'GUI2K4_Decompressed.UT2K4Tab_GameTypeBase.GameTypeLeftGroup'
    begin object name="GameTypeLeftGroup" class=XInterface.GUISectionBackground
        Caption="?? ??? ?? ??"
        TopPadding=0.0250000
        BottomPadding=0.0250000
        WinTop=0.0431250
        WinLeft=0.0237500
        WinWidth=0.4825000
        WinHeight=0.9414900
        TabOrder=0
        OnPreDraw=GameTypeLeftGroup.InternalPreDraw
    end object
    sb_Games=GameTypeLeftGroup
    // Reference: GUIListBox'GUI2K4_Decompressed.UT2K4Tab_GameTypeBase.UT2004Games'
    begin object name="UT2004Games" class=XInterface.GUIListBox
        SelectedStyleName="ListSelection"
        bVisibleWhenEmpty=true
        bSorted=true
        OnCreateComponent=UT2004Games.InternalOnCreateComponent
        FontScale=2
        WinTop=0.1442250
        WinLeft=0.0455990
        WinWidth=0.4384570
        WinHeight=0.7969820
        TabOrder=0
        bBoundToParent=true
        bScaleToParent=true
        OnChange=UT2K4Tab_GameTypeBase.InternalOnChange
    end object
    lb_Games=UT2004Games
    // Reference: GUISectionBackground'GUI2K4_Decompressed.UT2K4Tab_GameTypeBase.GameTypeRightGroup'
    begin object name="GameTypeRightGroup" class=XInterface.GUISectionBackground
        Caption="????"
        WinTop=0.0431250
        WinLeft=0.5132430
        WinWidth=0.4646490
        WinHeight=0.9414900
        OnPreDraw=GameTypeRightGroup.InternalPreDraw
    end object
    sb_Preview=GameTypeRightGroup
    // Reference: GUILabel'GUI2K4_Decompressed.UT2K4Tab_GameTypeBase.NoPreview'
    begin object name="NoPreview" class=XInterface.GUILabel
        Caption="???? ??."
        TextAlign=1
        TextColor=(R=247,G=255,B=0,A=255)
        TextFont="UT2HeaderFont"
        bTransparent=false
        bMultiLine=true
        VertAlign=1
        WinTop=0.1428260
        WinLeft=0.5392240
        WinWidth=0.4118620
        WinHeight=0.3165450
    end object
    l_NoPreview=NoPreview
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4Tab_GameTypeBase.GameTypePreview'
    begin object name="GameTypePreview" class=XInterface.GUIImage
        ImageStyle=2
        ImageRenderStyle=1
        WinTop=0.1428260
        WinLeft=0.5392240
        WinWidth=0.4118620
        WinHeight=0.3165450
        RenderWeight=0.2000000
    end object
    i_GamePreview=GameTypePreview
    // Reference: AltSectionBackground'GUI2K4_Decompressed.UT2K4Tab_GameTypeBase.Bk1'
    begin object name="Bk1" class=GUI2K4_Decompressed.AltSectionBackground
        WinTop=0.4785530
        WinLeft=0.5356220
        WinWidth=0.4190300
        WinHeight=0.4744550
        RenderWeight=0.3000000
        OnPreDraw=Bk1.InternalPreDraw
    end object
    i_bk=Bk1
    // Reference: GUIScrollTextBox'GUI2K4_Decompressed.UT2K4Tab_GameTypeBase.GameTypeDescription'
    begin object name="GameTypeDescription" class=XInterface.GUIScrollTextBox
        bNoTeletype=true
        CharDelay=0.0025000
        EOLDelay=0.5000000
        OnCreateComponent=GameTypeDescription.InternalOnCreateComponent
        WinTop=0.5567740
        WinLeft=0.5652700
        WinWidth=0.3620560
        WinHeight=0.3257160
        bTabStop=false
        bNeverFocus=true
    end object
    lb_GameDesc=GameTypeDescription
    EpicGameCaption="?? ?? ??"
    CustomGameCaption="??? ?? ??"
}