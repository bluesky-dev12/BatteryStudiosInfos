/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4Tab_BotConfigBase.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:24
 *	Functions:13
 *
 *******************************************************************************/
class UT2K4Tab_BotConfigBase extends UT2K4GameTabBase
    dependson(UT2K4GameTabBase)
    dependson(UT2K4BotInfoPage)
    dependson(UT2K4BotConfigPage)
    config(User)
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sb_Bots;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sb_Red;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sb_Blue;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify AltSectionBackground sb_PBK;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUICharacterList li_Bots;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage i_Portrait;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIVertImageListBox lb_Red;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIVertImageListBox lb_Blue;
var() editconst noexport editinline GUIVertImageList li_Red;
var() editconst noexport editinline GUIVertImageList li_Blue;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_AddR;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_RemoveR;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_AddB;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_RemoveB;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Config;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Left;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Right;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_DoConfig;
var() bool bIgnoreListChange;
var() bool bTeamGame;
var() bool bPlaySounds;
var() config bool bAllowDuplicates;
var() localized string DMCaption;
var() localized string RedCaption;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    li_Red = lb_Red.List;
    li_Red.bDropSource = true;
    li_Red.bDropTarget = true;
    li_Red.__OnDragDrop__Delegate = InternalOnDragDrop;
    li_Red.__OnBeginDrag__Delegate = InternalOnBeginDrag;
    li_Red.__OnEndDrag__Delegate = InternalOnEndDrag;
    li_Red.AddLinkObject(b_Config);
    li_Red.AddLinkObject(b_DoConfig);
    li_Blue = lb_Blue.List;
    li_Blue.bDropSource = true;
    li_Blue.bDropTarget = true;
    li_Blue.__OnDragDrop__Delegate = InternalOnDragDrop;
    li_Blue.__OnBeginDrag__Delegate = InternalOnBeginDrag;
    li_Blue.__OnEndDrag__Delegate = InternalOnEndDrag;
    li_Blue.AddLinkObject(b_Config);
    li_Blue.AddLinkObject(b_DoConfig);
    li_Bots.AddLinkObject(b_Config);
    li_Bots.AddLinkObject(b_DoConfig);
    li_Bots.__CheckLinkedObjects__Delegate = UpdateLinks;
    li_Bots.SetIndex(0);
    sb_Red.ManageComponent(lb_Red);
    sb_Blue.ManageComponent(lb_Blue);
    sb_PBK.ManageComponent(i_Portrait);
}

function ShowPanel(bool bShow)
{
    super(GUITabPanel).ShowPanel(bShow);
    // End:0x21
    if(bShow)
    {
        SetVis(bTeamGame);
    }
}

function SetVis(bool bIsTeam)
{
    lb_Blue.SetVisibility(bIsTeam);
    sb_Blue.SetVisibility(bIsTeam);
    // End:0x4a
    if(bIsTeam)
    {
        sb_Red.Caption = RedCaption;
    }
    // End:0x5e
    else
    {
        sb_Red.Caption = DMCaption;
    }
}

function SetupBotLists(bool bIsTeam)
{
    local int i, j;
    local class<TeamInfo> TIClass;
    local array<string> Chars;

    bTeamGame = bIsTeam;
    li_Red.Clear();
    li_Blue.Clear();
    // End:0x216
    if(bTeamGame)
    {
        TIClass = class<TeamInfo>(DynamicLoadObject("XGame.TeamRedConfigured", class'Class'));
        // End:0x123
        if(TIClass != none)
        {
            TIClass.static.GetAllCharacters(Chars);
            i = 0;
            J0x89:
            // End:0x123 [While If]
            if(i < Chars.Length)
            {
                j = 0;
                J0xa0:
                // End:0x119 [While If]
                if(j < li_Bots.PlayerList.Length)
                {
                    // End:0x10f
                    if(li_Bots.PlayerList[j].DefaultName ~= Chars[i])
                    {
                        li_Red.Add(li_Bots.PlayerList[j].Portrait, j);
                    }
                    ++ j;
                    // This is an implied JumpToken; Continue!
                    goto J0xa0;
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x89;
            }
        }
        TIClass = class<TeamInfo>(DynamicLoadObject("XGame.TeamBlueConfigured", class'Class'));
        // End:0x213
        if(TIClass != none)
        {
            TIClass.static.GetAllCharacters(Chars);
            i = 0;
            J0x179:
            // End:0x213 [While If]
            if(i < Chars.Length)
            {
                j = 0;
                J0x190:
                // End:0x209 [While If]
                if(j < li_Bots.PlayerList.Length)
                {
                    // End:0x1ff
                    if(li_Bots.PlayerList[j].DefaultName ~= Chars[i])
                    {
                        li_Blue.Add(li_Bots.PlayerList[j].Portrait, j);
                    }
                    ++ j;
                    // This is an implied JumpToken; Continue!
                    goto J0x190;
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x179;
            }
        }
    }
    // End:0x306
    else
    {
        TIClass = class<TeamInfo>(DynamicLoadObject("XGame.DMRosterConfigured", class'Class'));
        // End:0x306
        if(TIClass != none)
        {
            TIClass.static.GetAllCharacters(Chars);
            i = 0;
            J0x26c:
            // End:0x306 [While If]
            if(i < Chars.Length)
            {
                j = 0;
                J0x283:
                // End:0x2fc [While If]
                if(j < li_Bots.PlayerList.Length)
                {
                    // End:0x2f2
                    if(li_Bots.PlayerList[j].DefaultName ~= Chars[i])
                    {
                        li_Red.Add(li_Bots.PlayerList[j].Portrait, j);
                    }
                    ++ j;
                    // This is an implied JumpToken; Continue!
                    goto J0x283;
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x26c;
            }
        }
    }
    SetVis(bTeamGame);
}

function string Play()
{
    local int i;
    local class<TeamInfo> TIClass;
    local array<string> Characters;
    local bool b1, b2;
    local string URL;
    local int MinPlayers;

    // End:0x245
    if(bTeamGame)
    {
        TIClass = class<TeamInfo>(DynamicLoadObject("XGame.TeamRedConfigured", class'Class'));
        // End:0xf0
        if(TIClass != none)
        {
            Characters.Length = li_Red.ItemCount;
            i = 0;
            J0x5f:
            // End:0xb0 [While If]
            if(i < li_Red.ItemCount)
            {
                Characters[i] = li_Bots.GetNameAt(li_Red.GetItemIntAtIndex(i));
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x5f;
            }
            TIClass.static.SetCharacters(Characters);
            TIClass.static.StaticSaveConfig();
            MinPlayers += li_Red.ItemCount;
            b1 = true;
        }
        TIClass = class<TeamInfo>(DynamicLoadObject("XGame.TeamBlueConfigured", class'Class'));
        // End:0x1d8
        if(TIClass != none)
        {
            Characters.Length = li_Blue.ItemCount;
            i = 0;
            J0x147:
            // End:0x198 [While If]
            if(i < li_Blue.ItemCount)
            {
                Characters[i] = li_Bots.GetNameAt(li_Blue.GetItemIntAtIndex(i));
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x147;
            }
            TIClass.static.SetCharacters(Characters);
            TIClass.static.StaticSaveConfig();
            MinPlayers += li_Blue.ItemCount;
            b2 = true;
        }
        // End:0x20c
        if(b1)
        {
            URL $= "?RedTeam=XGame.TeamRedConfigured";
        }
        // End:0x242
        if(b2)
        {
            URL $= "?BlueTeam=XGame.TeamBlueConfigured";
        }
    }
    // End:0x35b
    else
    {
        TIClass = class<TeamInfo>(DynamicLoadObject("XGame.DMRosterConfigured", class'Class'));
        // End:0x325
        if(TIClass != none)
        {
            Characters.Length = li_Red.ItemCount;
            i = 0;
            J0x29c:
            // End:0x2ed [While If]
            if(i < li_Red.ItemCount)
            {
                Characters[i] = li_Bots.GetNameAt(li_Red.GetItemIntAtIndex(i));
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x29c;
            }
            TIClass.static.SetCharacters(Characters);
            TIClass.static.StaticSaveConfig();
            MinPlayers += li_Red.ItemCount;
        }
        // End:0x35b
        if(MinPlayers > 0)
        {
            URL $= "?DMTeam=xgame.DMRosterConfigured";
        }
    }
    return URL;
}

function CharListChange(GUIComponent Sender)
{
    local Sound NameSound;

    i_Portrait.Image = li_Bots.GetPortrait();
    sb_PBK.Caption = li_Bots.GetName();
    // End:0x70
    if(bPlaySounds)
    {
        NameSound = li_Bots.GetSound();
        PlayerOwner().ClientPlaySound(NameSound,,, 6);
    }
}

function UpdateLinks(GUIListBase List)
{
    local int MaxCount;
    local bool bRedValid, bBlueValid, bMainValid;

    bRedValid = li_Red.IsValid();
    bBlueValid = li_Blue.IsValid();
    bMainValid = li_Bots.IsValid();
    // End:0x5c
    if(!bRedValid)
    {
        li_Red.DisableLinkedObjects();
    }
    // End:0x76
    if(!bBlueValid)
    {
        li_Blue.DisableLinkedObjects();
    }
    // End:0x90
    if(!bMainValid)
    {
        li_Bots.DisableLinkedObjects();
    }
    // End:0xa8
    if(bRedValid)
    {
        li_Red.EnableLinkedObjects();
    }
    // End:0xc0
    if(bBlueValid)
    {
        li_Blue.EnableLinkedObjects();
    }
    // End:0xd8
    if(bMainValid)
    {
        li_Bots.EnableLinkedObjects();
    }
    // End:0xec
    if(bTeamGame)
    {
        MaxCount = 16;
    }
    // End:0xf4
    else
    {
        MaxCount = 32;
    }
}

function ListChange(GUIComponent Sender)
{
    // End:0x6c
    if(Sender == lb_Blue || Sender == lb_Red)
    {
        // End:0x6c
        if(GUIVertImageListBox(Sender).List.IsValid())
        {
            li_Bots.SetIndex(GUIVertImageListBox(Sender).List.GetItem());
        }
    }
}

function bool InternalOnClick(GUIComponent Sender)
{
    // End:0x30
    if(Sender == b_Left)
    {
        li_Bots.SetFocus(none);
        li_Bots.PgUp();
        return true;
    }
    // End:0x60
    if(Sender == b_Right)
    {
        li_Bots.SetFocus(none);
        li_Bots.PgDown();
        return true;
    }
    // End:0xa5
    if(Sender == b_AddR)
    {
        bIgnoreListChange = true;
        li_Red.Add(li_Bots.GetPortrait(), li_Bots.Index);
        return true;
    }
    // End:0xea
    if(Sender == b_AddB)
    {
        bIgnoreListChange = true;
        li_Blue.Add(li_Bots.GetPortrait(), li_Bots.Index);
        return true;
    }
    // End:0x118
    if(Sender == b_RemoveR)
    {
        li_Red.Remove(li_Red.Index);
        return true;
    }
    // End:0x146
    if(Sender == b_RemoveB)
    {
        li_Blue.Remove(li_Blue.Index);
        return true;
    }
    // End:0x1cc
    if(Sender == b_Config)
    {
        // End:0x1ca
        if(Controller.OpenMenu("GUI2K4.UT2K4BotInfoPage"))
        {
            UT2K4BotInfoPage(Controller.ActivePage).SetupBotInfo(li_Bots.GetPortrait(), li_Bots.GetDecoText(), li_Bots.GetRecord());
        }
        return true;
    }
    // End:0x254
    if(Sender == b_DoConfig)
    {
        // End:0x252
        if(Controller.OpenMenu("GUI2K4.UT2K4BotConfigPage"))
        {
            UT2K4BotConfigPage(Controller.ActivePage).SetupBotInfo(li_Bots.GetPortrait(), li_Bots.GetDecoText(), li_Bots.GetRecord());
        }
        return true;
    }
    return false;
}

function bool InternalOnBeginDrag(GUIComponent Sender)
{
    local bool Result, bTemp;

    bTemp = bPlaySounds;
    bPlaySounds = false;
    Result = GUIListBase(Sender).InternalOnBeginDrag(Sender);
    bPlaySounds = bTemp;
    return Result;
}

function InternalOnEndDrag(GUIComponent Accepting, bool bAccepted)
{
    local export editinline GUIVertImageList List;

    List = GUIVertImageList(Controller.DropSource);
    // End:0x26
    if(List == none)
    {
        return;
    }
    // End:0x3c
    if(Accepting == none)
    {
        Accepting = li_Bots;
    }
    List.InternalOnEndDrag(Accepting, true);
}

function bool InternalMouseOver(GUIComponent Sender, Canvas C, out int X, out int Y, out int XL, out int YL)
{
    local int idx;
    local export editinline GUIVertImageList List;

    List = GUIVertImageList(Sender);
    // End:0x1d
    if(List == none)
    {
        return false;
    }
    idx = List.CalculateIndex(true);
    // End:0x4e
    if(!List.IsValidIndex(idx))
    {
        return false;
    }
    List.SetHint(li_Bots.GetNameAt(List.GetItemIntAtIndex(idx)));
    return false;
}

function bool InternalOnDragDrop(GUIComponent Target)
{
    local export editinline GUIVertImageList TList, SList;
    local array<PlayerRecord> AddingBots;
    local int i, j, MaxCount;
    local bool Result;

    SList = GUIVertImageList(Controller.DropSource);
    TList = GUIVertImageList(Target);
    // End:0x2a4
    if(TList != none)
    {
        // End:0x48
        if(bTeamGame)
        {
            MaxCount = 16;
        }
        // End:0x50
        else
        {
            MaxCount = 31;
        }
        // End:0x6a
        if(TList.ItemCount >= MaxCount)
        {
            return false;
        }
        // End:0x1a3
        if(SList != none)
        {
            j = SList.SelectedElements.Length;
            J0x8a:
            // End:0x16a [While If]
            if(j > 0 && j + TList.ItemCount > MaxCount)
            {
                i = 0;
                J0xbd:
                // End:0x13a [While If]
                if(i < SList.SelectedItems.Length)
                {
                    // End:0x130
                    if(SList.Elements[SList.SelectedItems[i]] == SList.SelectedElements[j - 1])
                    {
                        SList.SelectedItems.Remove(i, 1);
                    }
                    // End:0x13a
                    else
                    {
                        ++ i;
                        // This is an implied JumpToken; Continue!
                        goto J0xbd;
                    }
                }
                SList.SelectedElements.Remove(j - 1, 1);
                j = SList.SelectedElements.Length;
                // This is an implied JumpToken; Continue!
                goto J0x8a;
            }
            Result = TList.InternalOnDragDrop(Target);
            // End:0x199
            if(Result)
            {
                UpdateLinks(li_Bots);
            }
            return Result;
        }
        // End:0x2a1
        else
        {
            // End:0x2a1
            if(Controller.DropSource == li_Bots)
            {
                AddingBots = li_Bots.GetPendingElements();
                i = 0;
                J0x1d7:
                // End:0x29f [While If]
                if(i < AddingBots.Length)
                {
                    // End:0x20c
                    if(TList.ItemCount >= MaxCount)
                    {
                        UpdateLinks(TList);
                        return true;
                    }
                    bIgnoreListChange = true;
                    j = 0;
                    J0x21b:
                    // End:0x268 [While If]
                    if(j < li_Bots.PlayerList.Length)
                    {
                        // End:0x25e
                        if(li_Bots.PlayerList[j] == AddingBots[i])
                        {
                        }
                        // End:0x268
                        else
                        {
                            ++ j;
                            // This is an implied JumpToken; Continue!
                            goto J0x21b;
                        }
                    }
                    TList.Add(li_Bots.PlayerList[j].Portrait, j);
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0x1d7;
                }
                return true;
            }
        }
    }
    // End:0x2c8
    else
    {
        // End:0x2c8
        if(Target == li_Bots)
        {
            return li_Bots.InternalOnDragDrop(Target);
        }
    }
    return false;
}

defaultproperties
{
    begin object name=BotConfigMainBG class=GUISectionBackground
        Caption="???? ??? ?? ??? ?? ??????."
        WinTop=0.6507340
        WinLeft=0.0585160
        WinWidth=0.8875010
        WinHeight=0.3280470
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'UT2K4Tab_BotConfigBase.BotConfigMainBG'
    sb_Bots=BotConfigMainBG
    begin object name=BotConfigRedBackground class=GUISectionBackground
        Caption="??"
        WinTop=0.0083340
        WinLeft=0.0117580
        WinWidth=0.3587310
        WinHeight=0.5768760
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'UT2K4Tab_BotConfigBase.BotConfigRedBackground'
    sb_Red=BotConfigRedBackground
    begin object name=BotConfigBlueBackground class=GUISectionBackground
        Caption="??"
        WinTop=0.0083340
        WinLeft=0.6297430
        WinWidth=0.3587310
        WinHeight=0.5768760
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'UT2K4Tab_BotConfigBase.BotConfigBlueBackground'
    sb_Blue=BotConfigBlueBackground
    begin object name=BotConfigPortraitBackground class=AltSectionBackground
        FontScale=0
        WinTop=0.037820
        WinLeft=0.3927770
        WinWidth=0.2202180
        WinHeight=0.5121040
        OnPreDraw=InternalPreDraw
    object end
    // Reference: AltSectionBackground'UT2K4Tab_BotConfigBase.BotConfigPortraitBackground'
    sb_PBK=BotConfigPortraitBackground
    begin object name=BotConfigCharList class=GUICharacterList
        StyleName="CharButton"
        Hint="?? ??????, ??? ??? ? ??? ?? ???????, ??? ??? ??? ??????."
        WinTop=0.7148260
        WinLeft=0.139140
        WinWidth=0.7246090
        WinHeight=0.2367580
        TabOrder=7
        bDropSource=true
        bDropTarget=true
        OnClick=InternalOnClick
        OnRightClick=InternalOnRightClick
        OnMousePressed=InternalOnMousePressed
        OnMouseRelease=InternalOnMouseRelease
        OnChange=CharListChange
        OnKeyEvent=InternalOnKeyEvent
        OnBeginDrag=InternalOnBeginDrag
        OnEndDrag=InternalOnEndDrag
        OnDragDrop=InternalOnDragDrop
        OnDragEnter=InternalOnDragEnter
        OnDragLeave=InternalOnDragLeave
        OnDragOver=InternalOnDragOver
    object end
    // Reference: GUICharacterList'UT2K4Tab_BotConfigBase.BotConfigCharList'
    li_Bots=BotConfigCharList
    begin object name=BotConfigPortrait class=GUIImage
        ImageStyle=2
        ImageRenderStyle=1
        DropShadowY=6
        WinTop=0.0039860
        WinLeft=0.40
        WinWidth=0.20
        WinHeight=0.5737540
        RenderWeight=1.1010
    object end
    // Reference: GUIImage'UT2K4Tab_BotConfigBase.BotConfigPortrait'
    i_Portrait=BotConfigPortrait
    begin object name=BotConfigRedList class=GUIVertImageListBox
        ImageScale=0.20
        bVisibleWhenEmpty=true
        bSorted=true
        OnCreateComponent=InternalOnCreateComponent
        Hint="???? ?? ? ?? ???."
        WinTop=0.060750
        WinLeft=0.0142580
        WinWidth=0.3453520
        WinHeight=0.5048830
        TabOrder=0
        OnChange=ListChange
    object end
    // Reference: GUIVertImageListBox'UT2K4Tab_BotConfigBase.BotConfigRedList'
    lb_Red=BotConfigRedList
    begin object name=BotConfigBlueList class=GUIVertImageListBox
        ImageScale=0.20
        bVisibleWhenEmpty=true
        bSorted=true
        OnCreateComponent=InternalOnCreateComponent
        Hint="???? ?? ? ?? ???."
        WinTop=0.060750
        WinLeft=0.6347280
        WinWidth=0.3453520
        WinHeight=0.5048830
        TabOrder=5
        OnChange=ListChange
    object end
    // Reference: GUIVertImageListBox'UT2K4Tab_BotConfigBase.BotConfigBlueList'
    lb_Blue=BotConfigBlueList
    begin object name=IABotConfigConfig class=GUIButton
        Caption="??"
        MenuState=4
        Hint="??? ??? ????? ?????."
        WinTop=0.5939490
        WinLeft=0.3573060
        WinWidth=0.1365630
        WinHeight=0.0497650
        TabOrder=9
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4Tab_BotConfigBase.IABotConfigConfig'
    b_Config=IABotConfigConfig
    begin object name=BotLeft class=GUIButton
        StyleName="ArrowLeft"
        WinTop=0.7909630
        WinLeft=0.1019530
        WinWidth=0.0435550
        WinHeight=0.0844140
        TabOrder=6
        bNeverFocus=true
        bRepeatClick=true
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4Tab_BotConfigBase.BotLeft'
    b_Left=BotLeft
    begin object name=BotRight class=GUIButton
        StyleName="ArrowRight"
        WinTop=0.7909630
        WinLeft=0.8546490
        WinWidth=0.0435550
        WinHeight=0.0844140
        TabOrder=8
        bNeverFocus=true
        bRepeatClick=true
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4Tab_BotConfigBase.BotRight'
    b_Right=BotRight
    begin object name=IABotConfigDoConfig class=GUIButton
        Caption="??"
        MenuState=4
        Hint="? ?? ??? ?????."
        WinTop=0.5939490
        WinLeft=0.5057430
        WinWidth=0.1365630
        WinHeight=0.0497650
        TabOrder=10
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4Tab_BotConfigBase.IABotConfigDoConfig'
    b_DoConfig=IABotConfigDoConfig
    bAllowDuplicates=true
    DMCaption="? ????"
    RedCaption="??"
    WinTop=0.150
    WinHeight=0.770
}