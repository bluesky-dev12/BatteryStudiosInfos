class UT2K4Tab_BotConfigBase extends UT2K4GameTabBase
    config(User)
    editinlinenew
    instanced;

var() automated GUISectionBackground sb_Bots;
var() automated GUISectionBackground sb_Red;
var() automated GUISectionBackground sb_Blue;
var() automated AltSectionBackground sb_PBK;
var() automated GUICharacterList li_Bots;
var() automated GUIImage i_Portrait;
var() automated GUIVertImageListBox lb_Red;
var() automated GUIVertImageListBox lb_Blue;
var() /*0x00000000-0x00000008*/ editconst noexport editinline GUIVertImageList li_Red;
var() /*0x00000000-0x00000008*/ editconst noexport editinline GUIVertImageList li_Blue;
var() automated GUIButton b_AddR;
var() automated GUIButton b_RemoveR;
var() automated GUIButton b_AddB;
var() automated GUIButton b_RemoveB;
var() automated GUIButton b_Config;
var() automated GUIButton b_Left;
var() automated GUIButton b_Right;
var() automated GUIButton b_DoConfig;
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
    //return;    
}

function ShowPanel(bool bShow)
{
    super(GUITabPanel).ShowPanel(bShow);
    // End:0x21
    if(bShow)
    {
        SetVis(bTeamGame);
    }
    //return;    
}

function SetVis(bool bIsTeam)
{
    lb_Blue.SetVisibility(bIsTeam);
    sb_Blue.SetVisibility(bIsTeam);
    // End:0x4A
    if(bIsTeam)
    {
        sb_Red.Caption = RedCaption;        
    }
    else
    {
        sb_Red.Caption = DMCaption;
    }
    //return;    
}

function SetupBotLists(bool bIsTeam)
{
    local int i, j;
    local Class<TeamInfo> TIClass;
    local array<string> Chars;

    bTeamGame = bIsTeam;
    li_Red.Clear();
    li_Blue.Clear();
    // End:0x216
    if(bTeamGame)
    {
        TIClass = Class<TeamInfo>(DynamicLoadObject("XGame.TeamRedConfigured", Class'Core.Class'));
        // End:0x123
        if(TIClass != none)
        {
            TIClass.static.GetAllCharacters(Chars);
            i = 0;
            J0x89:

            // End:0x123 [Loop If]
            if(i < Chars.Length)
            {
                j = 0;
                J0xA0:

                // End:0x119 [Loop If]
                if(j < li_Bots.PlayerList.Length)
                {
                    // End:0x10F
                    if(li_Bots.PlayerList[j].DefaultName ~= Chars[i])
                    {
                        li_Red.Add(li_Bots.PlayerList[j].Portrait, j);
                    }
                    j++;
                    // [Loop Continue]
                    goto J0xA0;
                }
                i++;
                // [Loop Continue]
                goto J0x89;
            }
        }
        TIClass = Class<TeamInfo>(DynamicLoadObject("XGame.TeamBlueConfigured", Class'Core.Class'));
        // End:0x213
        if(TIClass != none)
        {
            TIClass.static.GetAllCharacters(Chars);
            i = 0;
            J0x179:

            // End:0x213 [Loop If]
            if(i < Chars.Length)
            {
                j = 0;
                J0x190:

                // End:0x209 [Loop If]
                if(j < li_Bots.PlayerList.Length)
                {
                    // End:0x1FF
                    if(li_Bots.PlayerList[j].DefaultName ~= Chars[i])
                    {
                        li_Blue.Add(li_Bots.PlayerList[j].Portrait, j);
                    }
                    j++;
                    // [Loop Continue]
                    goto J0x190;
                }
                i++;
                // [Loop Continue]
                goto J0x179;
            }
        }        
    }
    else
    {
        TIClass = Class<TeamInfo>(DynamicLoadObject("XGame.DMRosterConfigured", Class'Core.Class'));
        // End:0x306
        if(TIClass != none)
        {
            TIClass.static.GetAllCharacters(Chars);
            i = 0;
            J0x26C:

            // End:0x306 [Loop If]
            if(i < Chars.Length)
            {
                j = 0;
                J0x283:

                // End:0x2FC [Loop If]
                if(j < li_Bots.PlayerList.Length)
                {
                    // End:0x2F2
                    if(li_Bots.PlayerList[j].DefaultName ~= Chars[i])
                    {
                        li_Red.Add(li_Bots.PlayerList[j].Portrait, j);
                    }
                    j++;
                    // [Loop Continue]
                    goto J0x283;
                }
                i++;
                // [Loop Continue]
                goto J0x26C;
            }
        }
    }
    SetVis(bTeamGame);
    //return;    
}

function string Play()
{
    local int i;
    local Class<TeamInfo> TIClass;
    local array<string> Characters;
    local bool b1, b2;
    local string URL;
    local int MinPlayers;

    // End:0x245
    if(bTeamGame)
    {
        TIClass = Class<TeamInfo>(DynamicLoadObject("XGame.TeamRedConfigured", Class'Core.Class'));
        // End:0xF0
        if(TIClass != none)
        {
            Characters.Length = li_Red.ItemCount;
            i = 0;
            J0x5F:

            // End:0xB0 [Loop If]
            if(i < li_Red.ItemCount)
            {
                Characters[i] = li_Bots.GetNameAt(li_Red.GetItemIntAtIndex(i));
                i++;
                // [Loop Continue]
                goto J0x5F;
            }
            TIClass.static.SetCharacters(Characters);
            TIClass.static.StaticSaveConfig();
            MinPlayers += li_Red.ItemCount;
            b1 = true;
        }
        TIClass = Class<TeamInfo>(DynamicLoadObject("XGame.TeamBlueConfigured", Class'Core.Class'));
        // End:0x1D8
        if(TIClass != none)
        {
            Characters.Length = li_Blue.ItemCount;
            i = 0;
            J0x147:

            // End:0x198 [Loop If]
            if(i < li_Blue.ItemCount)
            {
                Characters[i] = li_Bots.GetNameAt(li_Blue.GetItemIntAtIndex(i));
                i++;
                // [Loop Continue]
                goto J0x147;
            }
            TIClass.static.SetCharacters(Characters);
            TIClass.static.StaticSaveConfig();
            MinPlayers += li_Blue.ItemCount;
            b2 = true;
        }
        // End:0x20C
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
    else
    {
        TIClass = Class<TeamInfo>(DynamicLoadObject("XGame.DMRosterConfigured", Class'Core.Class'));
        // End:0x325
        if(TIClass != none)
        {
            Characters.Length = li_Red.ItemCount;
            i = 0;
            J0x29C:

            // End:0x2ED [Loop If]
            if(i < li_Red.ItemCount)
            {
                Characters[i] = li_Bots.GetNameAt(li_Red.GetItemIntAtIndex(i));
                i++;
                // [Loop Continue]
                goto J0x29C;
            }
            TIClass.static.SetCharacters(Characters);
            TIClass.static.StaticSaveConfig();
            MinPlayers += li_Red.ItemCount;
        }
        // End:0x35B
        if(MinPlayers > 0)
        {
            URL $= "?DMTeam=xgame.DMRosterConfigured";
        }
    }
    return URL;
    //return;    
}

function CharListChange(GUIComponent Sender)
{
    local Sound NameSound;

    i_Portrait.Image = li_Bots.GetPortrait();
    sb_PBK.Caption = li_Bots.GetName();
    // End:0x5A
    if(bPlaySounds)
    {
        NameSound = li_Bots.GetSound();
    }
    //return;    
}

function UpdateLinks(GUIListBase List)
{
    local int MaxCount;
    local bool bRedValid, bBlueValid, bMainValid;

    bRedValid = li_Red.IsValid();
    bBlueValid = li_Blue.IsValid();
    bMainValid = li_Bots.IsValid();
    // End:0x5C
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
    // End:0xA8
    if(bRedValid)
    {
        li_Red.EnableLinkedObjects();
    }
    // End:0xC0
    if(bBlueValid)
    {
        li_Blue.EnableLinkedObjects();
    }
    // End:0xD8
    if(bMainValid)
    {
        li_Bots.EnableLinkedObjects();
    }
    // End:0xEC
    if(bTeamGame)
    {
        MaxCount = 16;        
    }
    else
    {
        MaxCount = 32;
    }
    //return;    
}

function ListChange(GUIComponent Sender)
{
    // End:0x6C
    if((Sender == lb_Blue) || Sender == lb_Red)
    {
        // End:0x6C
        if(GUIVertImageListBox(Sender).List.IsValid())
        {
            li_Bots.SetIndex(GUIVertImageListBox(Sender).List.GetItem());
        }
    }
    //return;    
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
    // End:0xA5
    if(Sender == b_AddR)
    {
        bIgnoreListChange = true;
        li_Red.Add(li_Bots.GetPortrait(), li_Bots.Index);
        return true;
    }
    // End:0xEA
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
    // End:0x1CC
    if(Sender == b_Config)
    {
        // End:0x1CA
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
    //return;    
}

function bool InternalOnBeginDrag(GUIComponent Sender)
{
    local bool Result, bTemp;

    bTemp = bPlaySounds;
    bPlaySounds = false;
    Result = GUIListBase(Sender).InternalOnBeginDrag(Sender);
    bPlaySounds = bTemp;
    return Result;
    //return;    
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
    // End:0x3C
    if(Accepting == none)
    {
        Accepting = li_Bots;
    }
    List.InternalOnEndDrag(Accepting, true);
    //return;    
}

function bool InternalMouseOver(GUIComponent Sender, Canvas C, out int X, out int Y, out int XL, out int YL)
{
    local int idx;
    local export editinline GUIVertImageList List;

    List = GUIVertImageList(Sender);
    // End:0x1D
    if(List == none)
    {
        return false;
    }
    idx = List.CalculateIndex(true);
    // End:0x4E
    if(!List.IsValidIndex(idx))
    {
        return false;
    }
    List.SetHint(li_Bots.GetNameAt(List.GetItemIntAtIndex(idx)));
    return false;
    //return;    
}

function bool InternalOnDragDrop(GUIComponent Target)
{
    local export editinline GUIVertImageList TList, SList;
    local array<PlayerRecord> AddingBots;
    local int i, j, MaxCount;
    local bool Result;

    SList = GUIVertImageList(Controller.DropSource);
    TList = GUIVertImageList(Target);
    // End:0x2A4
    if(TList != none)
    {
        // End:0x48
        if(bTeamGame)
        {
            MaxCount = 16;            
        }
        else
        {
            MaxCount = 31;
        }
        // End:0x6A
        if(TList.ItemCount >= MaxCount)
        {
            return false;
        }
        // End:0x1A3
        if(SList != none)
        {
            j = SList.SelectedElements.Length;
            J0x8A:

            // End:0x16A [Loop If]
            if((j > 0) && (j + TList.ItemCount) > MaxCount)
            {
                i = 0;
                J0xBD:

                // End:0x13A [Loop If]
                if(i < SList.SelectedItems.Length)
                {
                    // End:0x130
                    if(SList.Elements[SList.SelectedItems[i]] == SList.SelectedElements[j - 1])
                    {
                        SList.SelectedItems.Remove(i, 1);
                        // [Explicit Break]
                        goto J0x13A;
                    }
                    i++;
                    // [Loop Continue]
                    goto J0xBD;
                }
                J0x13A:

                SList.SelectedElements.Remove(j - 1, 1);
                j = SList.SelectedElements.Length;
                // [Loop Continue]
                goto J0x8A;
            }
            Result = TList.InternalOnDragDrop(Target);
            // End:0x199
            if(Result)
            {
                UpdateLinks(li_Bots);
            }
            return Result;            
        }
        else
        {
            // End:0x2A1
            if(Controller.DropSource == li_Bots)
            {
                AddingBots = li_Bots.GetPendingElements();
                i = 0;
                J0x1D7:

                // End:0x29F [Loop If]
                if(i < AddingBots.Length)
                {
                    // End:0x20C
                    if(TList.ItemCount >= MaxCount)
                    {
                        UpdateLinks(TList);
                        return true;
                    }
                    bIgnoreListChange = true;
                    j = 0;
                    J0x21B:

                    // End:0x268 [Loop If]
                    if(j < li_Bots.PlayerList.Length)
                    {
                        // End:0x25E
                        if(li_Bots.PlayerList[j] == AddingBots[i])
                        {
                            // [Explicit Break]
                            goto J0x268;
                        }
                        j++;
                        // [Loop Continue]
                        goto J0x21B;
                    }
                    J0x268:

                    TList.Add(li_Bots.PlayerList[j].Portrait, j);
                    i++;
                    // [Loop Continue]
                    goto J0x1D7;
                }
                return true;
            }
        }        
    }
    else
    {
        // End:0x2C8
        if(Target == li_Bots)
        {
            return li_Bots.InternalOnDragDrop(Target);
        }
    }
    return false;
    //return;    
}

defaultproperties
{
    // Reference: GUISectionBackground'GUI2K4_Decompressed.UT2K4Tab_BotConfigBase.BotConfigMainBG'
    begin object name="BotConfigMainBG" class=XInterface.GUISectionBackground
        Caption="???? ??? ?? ??? ?? ??????."
        WinTop=0.6507340
        WinLeft=0.0585160
        WinWidth=0.8875010
        WinHeight=0.3280470
        OnPreDraw=BotConfigMainBG.InternalPreDraw
    end object
    sb_Bots=BotConfigMainBG
    // Reference: GUISectionBackground'GUI2K4_Decompressed.UT2K4Tab_BotConfigBase.BotConfigRedBackground'
    begin object name="BotConfigRedBackground" class=XInterface.GUISectionBackground
        Caption="??"
        WinTop=0.0083340
        WinLeft=0.0117580
        WinWidth=0.3587310
        WinHeight=0.5768760
        OnPreDraw=BotConfigRedBackground.InternalPreDraw
    end object
    sb_Red=BotConfigRedBackground
    // Reference: GUISectionBackground'GUI2K4_Decompressed.UT2K4Tab_BotConfigBase.BotConfigBlueBackground'
    begin object name="BotConfigBlueBackground" class=XInterface.GUISectionBackground
        Caption="??"
        WinTop=0.0083340
        WinLeft=0.6297430
        WinWidth=0.3587310
        WinHeight=0.5768760
        OnPreDraw=BotConfigBlueBackground.InternalPreDraw
    end object
    sb_Blue=BotConfigBlueBackground
    // Reference: AltSectionBackground'GUI2K4_Decompressed.UT2K4Tab_BotConfigBase.BotConfigPortraitBackground'
    begin object name="BotConfigPortraitBackground" class=GUI2K4_Decompressed.AltSectionBackground
        FontScale=0
        WinTop=0.0378200
        WinLeft=0.3927770
        WinWidth=0.2202180
        WinHeight=0.5121040
        OnPreDraw=BotConfigPortraitBackground.InternalPreDraw
    end object
    sb_PBK=BotConfigPortraitBackground
    // Reference: GUICharacterList'GUI2K4_Decompressed.UT2K4Tab_BotConfigBase.BotConfigCharList'
    begin object name="BotConfigCharList" class=XInterface.GUICharacterList
        StyleName="CharButton"
        Hint="?? ??????, ??? ??? ? ??? ?? ???????, ??? ??? ??? ??????."
        WinTop=0.7148260
        WinLeft=0.1391400
        WinWidth=0.7246090
        WinHeight=0.2367580
        TabOrder=7
        bDropSource=true
        bDropTarget=true
        OnClick=BotConfigCharList.InternalOnClick
        OnRightClick=BotConfigCharList.InternalOnRightClick
        OnMousePressed=BotConfigCharList.InternalOnMousePressed
        OnMouseRelease=BotConfigCharList.InternalOnMouseRelease
        OnChange=UT2K4Tab_BotConfigBase.CharListChange
        OnKeyEvent=BotConfigCharList.InternalOnKeyEvent
        OnBeginDrag=UT2K4Tab_BotConfigBase.InternalOnBeginDrag
        OnEndDrag=BotConfigCharList.InternalOnEndDrag
        OnDragDrop=BotConfigCharList.InternalOnDragDrop
        OnDragEnter=BotConfigCharList.InternalOnDragEnter
        OnDragLeave=BotConfigCharList.InternalOnDragLeave
        OnDragOver=BotConfigCharList.InternalOnDragOver
    end object
    li_Bots=BotConfigCharList
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4Tab_BotConfigBase.BotConfigPortrait'
    begin object name="BotConfigPortrait" class=XInterface.GUIImage
        ImageStyle=2
        ImageRenderStyle=1
        DropShadowY=6
        WinTop=0.0039860
        WinLeft=0.4000000
        WinWidth=0.2000000
        WinHeight=0.5737540
        RenderWeight=1.1010000
    end object
    i_Portrait=BotConfigPortrait
    // Reference: GUIVertImageListBox'GUI2K4_Decompressed.UT2K4Tab_BotConfigBase.BotConfigRedList'
    begin object name="BotConfigRedList" class=XInterface.GUIVertImageListBox
        ImageScale=0.2000000
        bVisibleWhenEmpty=true
        bSorted=true
        OnCreateComponent=BotConfigRedList.InternalOnCreateComponent
        Hint="???? ?? ? ?? ???."
        WinTop=0.0607500
        WinLeft=0.0142580
        WinWidth=0.3453520
        WinHeight=0.5048830
        TabOrder=0
        OnChange=UT2K4Tab_BotConfigBase.ListChange
    end object
    lb_Red=BotConfigRedList
    // Reference: GUIVertImageListBox'GUI2K4_Decompressed.UT2K4Tab_BotConfigBase.BotConfigBlueList'
    begin object name="BotConfigBlueList" class=XInterface.GUIVertImageListBox
        ImageScale=0.2000000
        bVisibleWhenEmpty=true
        bSorted=true
        OnCreateComponent=BotConfigBlueList.InternalOnCreateComponent
        Hint="???? ?? ? ?? ???."
        WinTop=0.0607500
        WinLeft=0.6347280
        WinWidth=0.3453520
        WinHeight=0.5048830
        TabOrder=5
        OnChange=UT2K4Tab_BotConfigBase.ListChange
    end object
    lb_Blue=BotConfigBlueList
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4Tab_BotConfigBase.IABotConfigConfig'
    begin object name="IABotConfigConfig" class=XInterface.GUIButton
        Caption="??"
        MenuState=4
        Hint="??? ??? ????? ?????."
        WinTop=0.5939490
        WinLeft=0.3573060
        WinWidth=0.1365630
        WinHeight=0.0497650
        TabOrder=9
        OnClick=UT2K4Tab_BotConfigBase.InternalOnClick
        OnKeyEvent=IABotConfigConfig.InternalOnKeyEvent
    end object
    b_Config=IABotConfigConfig
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4Tab_BotConfigBase.BotLeft'
    begin object name="BotLeft" class=XInterface.GUIButton
        StyleName="ArrowLeft"
        WinTop=0.7909630
        WinLeft=0.1019530
        WinWidth=0.0435550
        WinHeight=0.0844140
        TabOrder=6
        bNeverFocus=true
        bRepeatClick=true
        OnClick=UT2K4Tab_BotConfigBase.InternalOnClick
        OnKeyEvent=BotLeft.InternalOnKeyEvent
    end object
    b_Left=BotLeft
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4Tab_BotConfigBase.BotRight'
    begin object name="BotRight" class=XInterface.GUIButton
        StyleName="ArrowRight"
        WinTop=0.7909630
        WinLeft=0.8546490
        WinWidth=0.0435550
        WinHeight=0.0844140
        TabOrder=8
        bNeverFocus=true
        bRepeatClick=true
        OnClick=UT2K4Tab_BotConfigBase.InternalOnClick
        OnKeyEvent=BotRight.InternalOnKeyEvent
    end object
    b_Right=BotRight
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4Tab_BotConfigBase.IABotConfigDoConfig'
    begin object name="IABotConfigDoConfig" class=XInterface.GUIButton
        Caption="??"
        MenuState=4
        Hint="? ?? ??? ?????."
        WinTop=0.5939490
        WinLeft=0.5057430
        WinWidth=0.1365630
        WinHeight=0.0497650
        TabOrder=10
        OnClick=UT2K4Tab_BotConfigBase.InternalOnClick
        OnKeyEvent=IABotConfigDoConfig.InternalOnKeyEvent
    end object
    b_DoConfig=IABotConfigDoConfig
    bAllowDuplicates=true
    DMCaption="? ????"
    RedCaption="??"
    WinTop=0.1500000
    WinHeight=0.7700000
}