class UT2k4ModelSelect extends LockedFloatingWindow
    editinlinenew
    instanced;

var Material LockedImage;
var() automated GUIVertImageListBox CharList;
var() automated moComboBox co_Race;
var() automated GUIImage i_bk;
var() array<PlayerRecord> PlayerList;
var export editinline UT2K4Tab_PlayerSettings MyTab;
var SpinnyWeap SpinnyDude;
var(SpinnyDude) Vector SpinnyDudeOffset;
var int nfov;
var() int YawValue;
var() private string InvalidTypes;
var() private string IgnoredTypes;
var int DoneInit;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    sb_Main.SetPosition(0.0400000, 0.0750000, 0.6807420, 0.5558590);
    sb_Main.RightPadding = 0.5000000;
    sb_Main.ManageComponent(CharList);
    Class'WGame.wUtil'.static.GetPlayerList(PlayerList);
    RefreshCharacterList(InvalidTypes);
    co_Race.MyComboBox.List.bInitializeList = true;
    co_Race.ReadOnly(true);
    co_Race.AddItem("All");
    PopulateRaces();
    RaceChange(none);
    co_Race.__OnChange__Delegate = RaceChange;
    // End:0xFF
    if(SpinnyDude == none)
    {
        SpinnyDude = PlayerOwner().Spawn(Class'XInterface.SpinnyWeap');
    }
    SpinnyDude.SetDrawType(2);
    SpinnyDude.SetDrawScale(0.9000000);
    SpinnyDude.spinRate = 0;
    //return;    
}

event Opened(GUIComponent Sender)
{
    local Rotator R;

    super(PopupPageBase).Opened(Sender);
    // End:0x46
    if(SpinnyDude != none)
    {
        R.Yaw = 32768;
        SpinnyDude.SetRotation(R + PlayerOwner().Rotation);
    }
    //return;    
}

function PopulateRaces()
{
    local int i;
    local string specName;

    i = 0;
    J0x07:

    // End:0x8C [Loop If]
    if(i < PlayerList.Length)
    {
        specName = Caps(PlayerList[i].Race);
        // End:0x82
        if((specName != "") && co_Race.MyComboBox.List.FindIndex(specName, true) == -1)
        {
            co_Race.AddItem(specName);
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function RefreshCharacterList(string ExcludedChars, optional string Race)
{
    local int i, j;
    local array<string> Excluded;
    local bool bLocked;

    CharList.List.bNotify = false;
    CharList.Clear();
    Split(ExcludedChars, ";", Excluded);
    i = 0;
    J0x3F:

    // End:0x159 [Loop If]
    if(i < PlayerList.Length)
    {
        // End:0x14F
        if((Race == "") || Race ~= PlayerList[i].Race)
        {
            // End:0x100
            if(PlayerList[i].Menu != "")
            {
                j = 0;
                J0x95:

                // End:0xED [Loop If]
                if(j < Excluded.Length)
                {
                    // End:0xE3
                    if(InStr((";" $ PlayerList[i].Menu) $ ";", (";" $ Excluded[j]) $ ";") != -1)
                    {
                        // [Explicit Break]
                        goto J0xED;
                    }
                    j++;
                    // [Loop Continue]
                    goto J0x95;
                }
                J0xED:

                // End:0x100
                if(j < Excluded.Length)
                {
                    // [Explicit Continue]
                    goto J0x14F;
                }
            }
            bLocked = !IsUnlocked(PlayerList[i]);
            CharList.List.Add(PlayerList[i].Portrait, i, int(bLocked));
        }
        J0x14F:

        i++;
        // [Loop Continue]
        goto J0x3F;
    }
    CharList.List.LockedMat = LockedImage;
    CharList.List.bNotify = true;
    //return;    
}

function ListChange(GUIComponent Sender)
{
    local ImageListElem elem;

    CharList.List.GetAtIndex(CharList.List.Index, elem.Image, elem.Item, elem.Locked);
    // End:0xCC
    if((elem.Item >= 0) && elem.Item < PlayerList.Length)
    {
        // End:0x96
        if(elem.Locked == 1)
        {
            b_OK.DisableMe();            
        }
        else
        {
            b_OK.EnableMe();
        }
        sb_Main.Caption = PlayerList[elem.Item].DefaultName;        
    }
    else
    {
        sb_Main.Caption = "";
    }
    UpdateSpinnyDude();
    //return;    
}

function RaceChange(GUIComponent Sender)
{
    local string specName;

    specName = co_Race.GetText();
    // End:0x2C
    if(specName == "All")
    {
        specName = "";
    }
    RefreshCharacterList(InvalidTypes, specName);
    //return;    
}

function UpdateSpinnyDude()
{
    local int idx;
    local PlayerRecord Rec;
    local Mesh PlayerMesh;
    local Material BodySkin, HeadSkin;
    local string BodySkinName, HeadSkinName, TeamSuffix;

    idx = CharList.List.GetItem();
    // End:0x3D
    if((idx < 0) || idx >= PlayerList.Length)
    {
        return;
    }
    Rec = PlayerList[idx];
    // End:0xC8
    if((((Rec.Race ~= "Juggernaut") || Rec.DefaultName ~= "Axon") || Rec.DefaultName ~= "Cyclops") || Rec.DefaultName ~= "Virus")
    {
        SpinnyDudeOffset = vect(250.0000000, 1.0000000, -14.0000000);        
    }
    else
    {
        SpinnyDudeOffset = vect(250.0000000, 1.0000000, -24.0000000);
    }
    PlayerMesh = Mesh(DynamicLoadObject(Rec.MeshName, Class'Engine.Mesh'));
    // End:0x14A
    if(PlayerMesh == none)
    {
        Log((("Could not load mesh: " $ Rec.MeshName) $ " For player: ") $ Rec.DefaultName);
        return;
    }
    BodySkinName = Rec.BodySkinName;
    HeadSkinName = Rec.FaceSkinName;
    // End:0x186
    if(Rec.TeamFace)
    {
        HeadSkinName $= TeamSuffix;
    }
    BodySkin = Material(DynamicLoadObject(BodySkinName, Class'Engine.Material'));
    // End:0x1F9
    if(BodySkin == none)
    {
        Log((("Could not load body material: " $ Rec.BodySkinName) $ " For player: ") $ Rec.DefaultName);
        return;
    }
    HeadSkin = Material(DynamicLoadObject(HeadSkinName, Class'Engine.Material'));
    // End:0x267
    if(HeadSkin == none)
    {
        Log((("Could not load head material: " $ HeadSkinName) $ " For player: ") $ Rec.DefaultName);
        return;
    }
    SpinnyDude.LinkMesh(PlayerMesh);
    SpinnyDude.Skins[0] = BodySkin;
    SpinnyDude.Skins[1] = HeadSkin;
    SpinnyDude.LoopAnim('Idle_Rest', 1.0000000 / SpinnyDude.Level.TimeDilation);
    //return;    
}

function bool InternalOnDraw(Canvas Canvas)
{
    local Vector CamPos, X, Y, Z;
    local Rotator camRot;
    local float oOrgX, oOrgY, oClipX, oClipY;

    // End:0x50
    if(DoneInit >= 0)
    {
        CharList.List.MakeVisible(float(DoneInit) / float(CharList.List.ItemCount));
        DoneInit = -1;
    }
    oOrgX = Canvas.OrgX;
    oOrgY = Canvas.OrgY;
    oClipX = Canvas.ClipX;
    oClipY = Canvas.ClipY;
    Canvas.OrgX = i_bk.ActualLeft();
    Canvas.OrgY = i_bk.ActualTop();
    Canvas.ClipX = i_bk.ActualWidth();
    Canvas.ClipY = i_bk.ActualHeight();
    Canvas.GetCameraLocation(CamPos, camRot);
    GetAxes(camRot, X, Y, Z);
    SpinnyDude.SetLocation(((CamPos + (SpinnyDudeOffset.X * X)) + (SpinnyDudeOffset.Y * Y)) + (SpinnyDudeOffset.Z * Z));
    Canvas.DrawActorClipped(SpinnyDude, false, i_bk.ActualLeft(), i_bk.ActualTop(), i_bk.ActualWidth(), i_bk.ActualHeight(), true, float(nfov));
    Canvas.OrgX = oOrgX;
    Canvas.OrgY = oOrgY;
    Canvas.ClipX = oClipX;
    Canvas.ClipY = oClipY;
    return true;
    //return;    
}

function free()
{
    super(GUIPage).free();
    // End:0x1D
    if(SpinnyDude != none)
    {
        SpinnyDude.Destroy();
    }
    SpinnyDude = none;
    //return;    
}

function HandleParameters(string Who, string Team)
{
    local int i;

    // End:0x21
    if(Team != "")
    {
        co_Race.Find(Team);
    }
    i = 0;
    J0x28:

    // End:0xB2 [Loop If]
    if(i < PlayerList.Length)
    {
        // End:0xA8
        if((PlayerList[i].DefaultName ~= Who) && IsUnlocked(PlayerList[i]))
        {
            DoneInit = i;
            CharList.List.SetIndex(CharList.List.FindItem(i));
        }
        i++;
        // [Loop Continue]
        goto J0x28;
    }
    UpdateSpinnyDude();
    //return;    
}

function string GetDataString()
{
    local int idx;

    idx = CharList.List.GetItem();
    // End:0x3E
    if((idx < 0) || idx >= PlayerList.Length)
    {
        return "";
    }
    return PlayerList[idx].DefaultName;
    //return;    
}

function bool IsHiddenCharacter(string CharacterMenuString)
{
    local int i;
    local array<string> RecordFilters;

    // End:0x0E
    if(CharacterMenuString == "")
    {
        return false;
    }
    Split(CharacterMenuString, ";", RecordFilters);
    i = RecordFilters.Length - 1;
    J0x2C:

    // End:0x80 [Loop If]
    if(i >= 0)
    {
        // End:0x76
        if(InStr((";" $ IgnoredTypes) $ ";", (";" $ RecordFilters[i]) $ ";") != -1)
        {
            RecordFilters.Remove(i, 1);
            // [Explicit Continue]
        }
        i--;
        // [Loop Continue]
        goto J0x2C;
    }
    return RecordFilters.Length > 0;
    //return;    
}

function bool IsUnlocked(PlayerRecord test)
{
    // End:0x17
    if(!IsHiddenCharacter(test.Menu))
    {
        return true;
    }
    return Class'GUI2K4_Decompressed.UT2k4MainPage'.static.IsUnlocked(test.Menu);
    //return;    
}

defaultproperties
{
    // Reference: GUIVertImageListBox'GUI2K4_Decompressed.UT2k4ModelSelect.vil_CharList'
    begin object name="vil_CharList" class=XInterface.GUIVertImageListBox
        CellStyle=1
        NoVisibleRows=3
        NoVisibleCols=4
        OnCreateComponent=vil_CharList.InternalOnCreateComponent
        WinTop=0.1851190
        WinLeft=0.1028880
        WinWidth=0.4034070
        WinHeight=0.6581250
        TabOrder=0
        bBoundToParent=true
        bScaleToParent=true
        OnChange=UT2k4ModelSelect.ListChange
    end object
    CharList=vil_CharList
    // Reference: moComboBox'GUI2K4_Decompressed.UT2k4ModelSelect.CharRace'
    begin object name="CharRace" class=XInterface.moComboBox
        bReadOnly=true
        ComponentJustification=0
        CaptionWidth=0.2500000
        Caption="??"
        OnCreateComponent=CharRace.InternalOnCreateComponent
        Hint="????? ???? ???? ?????"
        WinTop=0.8800000
        WinLeft=0.0527330
        WinWidth=0.3881550
        WinHeight=0.0428570
        TabOrder=4
        bBoundToParent=true
        bScaleToParent=true
    end object
    co_Race=CharRace
    // Reference: GUIImage'GUI2K4_Decompressed.UT2k4ModelSelect.iBK'
    begin object name="iBK" class=XInterface.GUIImage
        ImageColor=(R=255,G=255,B=255,A=128)
        ImageStyle=1
        DropShadowX=4
        DropShadowY=4
        WinTop=0.0075070
        WinLeft=0.5302060
        WinWidth=0.3689450
        WinHeight=0.8125000
        RenderWeight=0.5200000
        bBoundToParent=true
        bScaleToParent=true
        OnDraw=UT2k4ModelSelect.InternalOnDraw
    end object
    i_bk=iBK
    SpinnyDudeOffset=(X=250.0000000,Y=1.0000000,Z=-14.0000000)
    nfov=15
    InvalidTypes="DUP"
    IgnoredTypes="SP"
    WindowName="??? ??"
}