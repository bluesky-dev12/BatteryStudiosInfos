/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2k4ModelSelect.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:13
 *	Functions:13
 *
 *******************************************************************************/
class UT2k4ModelSelect extends LockedFloatingWindow
    editinlinenew
    instanced;

var Material LockedImage;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIVertImageListBox CharList;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moComboBox co_Race;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage i_bk;
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
    sb_Main.SetPosition(0.040, 0.0750, 0.6807420, 0.5558590);
    sb_Main.RightPadding = 0.50;
    sb_Main.ManageComponent(CharList);
    class'wUtil'.static.GetPlayerList(PlayerList);
    RefreshCharacterList(InvalidTypes);
    co_Race.MyComboBox.List.bInitializeList = true;
    co_Race.ReadOnly(true);
    co_Race.AddItem("All");
    PopulateRaces();
    RaceChange(none);
    co_Race.__OnChange__Delegate = RaceChange;
    // End:0xff
    if(SpinnyDude == none)
    {
        SpinnyDude = PlayerOwner().Spawn(class'SpinnyWeap');
    }
    SpinnyDude.SetDrawType(2);
    SpinnyDude.SetDrawScale(0.90);
    SpinnyDude.spinRate = 0;
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
}

function PopulateRaces()
{
    local int i;
    local string specName;

    i = 0;
    J0x07:
    // End:0x8c [While If]
    if(i < PlayerList.Length)
    {
        specName = Caps(PlayerList[i].Race);
        // End:0x82
        if(specName != "" && co_Race.MyComboBox.List.FindIndex(specName, true) == -1)
        {
            co_Race.AddItem(specName);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
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
    J0x3f:
    // End:0x159 [While If]
    if(i < PlayerList.Length)
    {
        // End:0x14f
        if(Race == "" || Race ~= PlayerList[i].Race)
        {
            // End:0x100
            if(PlayerList[i].Menu != "")
            {
                j = 0;
                J0x95:
                // End:0xed [While If]
                if(j < Excluded.Length)
                {
                    // End:0xe3
                    if(InStr(";" $ PlayerList[i].Menu $ ";", ";" $ Excluded[j] $ ";") != -1)
                    {
                    }
                    // End:0xed
                    else
                    {
                        ++ j;
                        // This is an implied JumpToken; Continue!
                        goto J0x95;
                    }
                }
                // End:0x100
                if(j < Excluded.Length)
                {
                }
                // End:0x14f
                else
                {
                }
                bLocked = !IsUnlocked(PlayerList[i]);
                CharList.List.Add(PlayerList[i].Portrait, i, int(bLocked));
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x3f;
    }
    CharList.List.LockedMat = LockedImage;
    CharList.List.bNotify = true;
}

function ListChange(GUIComponent Sender)
{
    local ImageListElem elem;

    CharList.List.GetAtIndex(CharList.List.Index, elem.Image, elem.Item, elem.Locked);
    // End:0x121
    if(elem.Item >= 0 && elem.Item < PlayerList.Length)
    {
        // End:0x96
        if(elem.Locked == 1)
        {
            b_OK.DisableMe();
        }
        // End:0xa5
        else
        {
            b_OK.EnableMe();
        }
        sb_Main.Caption = PlayerList[elem.Item].DefaultName;
        // End:0x11e
        if(sb_Main.Caption ~= "Mr.Crow")
        {
            PlayerOwner().ClientPlaySound(Sound(DynamicLoadObject("AnnouncerNames.Mr_Crow", class'Sound')),,, 6);
        }
    }
    // End:0x132
    else
    {
        sb_Main.Caption = "";
    }
    UpdateSpinnyDude();
}

function RaceChange(GUIComponent Sender)
{
    local string specName;

    specName = co_Race.GetText();
    // End:0x2c
    if(specName == "All")
    {
        specName = "";
    }
    RefreshCharacterList(InvalidTypes, specName);
}

function UpdateSpinnyDude()
{
    local int idx;
    local PlayerRecord Rec;
    local Mesh PlayerMesh;
    local Material BodySkin, HeadSkin;
    local string BodySkinName, HeadSkinName, TeamSuffix;

    idx = CharList.List.GetItem();
    // End:0x3d
    if(idx < 0 || idx >= PlayerList.Length)
    {
        return;
    }
    Rec = PlayerList[idx];
    // End:0xc8
    if(Rec.Race ~= "Juggernaut" || Rec.DefaultName ~= "Axon" || Rec.DefaultName ~= "Cyclops" || Rec.DefaultName ~= "Virus")
    {
        SpinnyDudeOffset = vect(250.0, 1.0, -14.0);
    }
    // End:0xdb
    else
    {
        SpinnyDudeOffset = vect(250.0, 1.0, -24.0);
    }
    PlayerMesh = Mesh(DynamicLoadObject(Rec.MeshName, class'Mesh'));
    // End:0x14a
    if(PlayerMesh == none)
    {
        Log("Could not load mesh: " $ Rec.MeshName $ " For player: " $ Rec.DefaultName);
        return;
    }
    BodySkinName = Rec.BodySkinName;
    HeadSkinName = Rec.FaceSkinName;
    // End:0x186
    if(Rec.TeamFace)
    {
        HeadSkinName $= TeamSuffix;
    }
    BodySkin = Material(DynamicLoadObject(BodySkinName, class'Material'));
    // End:0x1f9
    if(BodySkin == none)
    {
        Log("Could not load body material: " $ Rec.BodySkinName $ " For player: " $ Rec.DefaultName);
        return;
    }
    HeadSkin = Material(DynamicLoadObject(HeadSkinName, class'Material'));
    // End:0x267
    if(HeadSkin == none)
    {
        Log("Could not load head material: " $ HeadSkinName $ " For player: " $ Rec.DefaultName);
        return;
    }
    SpinnyDude.LinkMesh(PlayerMesh);
    SpinnyDude.Skins[0] = BodySkin;
    SpinnyDude.Skins[1] = HeadSkin;
    SpinnyDude.LoopAnim('Idle_Rest', 1.0 / SpinnyDude.Level.TimeDilation);
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
    SpinnyDude.SetLocation(CamPos + SpinnyDudeOffset.X * X + SpinnyDudeOffset.Y * Y + SpinnyDudeOffset.Z * Z);
    Canvas.DrawActorClipped(SpinnyDude, false, i_bk.ActualLeft(), i_bk.ActualTop(), i_bk.ActualWidth(), i_bk.ActualHeight(), true, float(nfov));
    Canvas.OrgX = oOrgX;
    Canvas.OrgY = oOrgY;
    Canvas.ClipX = oClipX;
    Canvas.ClipY = oClipY;
    return true;
}

function free()
{
    super(GUIPage).free();
    // End:0x1d
    if(SpinnyDude != none)
    {
        SpinnyDude.Destroy();
    }
    SpinnyDude = none;
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
    // End:0xb2 [While If]
    if(i < PlayerList.Length)
    {
        // End:0xa8
        if(PlayerList[i].DefaultName ~= Who && IsUnlocked(PlayerList[i]))
        {
            DoneInit = i;
            CharList.List.SetIndex(CharList.List.FindItem(i));
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x28;
    }
    UpdateSpinnyDude();
}

function string GetDataString()
{
    local int idx;

    idx = CharList.List.GetItem();
    // End:0x3e
    if(idx < 0 || idx >= PlayerList.Length)
    {
        return "";
    }
    return PlayerList[idx].DefaultName;
}

function bool IsHiddenCharacter(string CharacterMenuString)
{
    local int i;
    local array<string> RecordFilters;

    // End:0x0e
    if(CharacterMenuString == "")
    {
        return false;
    }
    Split(CharacterMenuString, ";", RecordFilters);
    i = RecordFilters.Length - 1;
    J0x2c:
    // End:0x80 [While If]
    if(i >= 0)
    {
        // End:0x76
        if(InStr(";" $ IgnoredTypes $ ";", ";" $ RecordFilters[i] $ ";") != -1)
        {
            RecordFilters.Remove(i, 1);
        }
        // End:0x76
        else
        {
        }
        -- i;
        // This is an implied JumpToken; Continue!
        goto J0x2c;
    }
    return RecordFilters.Length > 0;
}

function bool IsUnlocked(PlayerRecord Test)
{
    // End:0x17
    if(!IsHiddenCharacter(Test.Menu))
    {
        return true;
    }
    return class'UT2k4MainPage'.static.IsUnlocked(Test.Menu);
}

defaultproperties
{
    begin object name=vil_CharList class=GUIVertImageListBox
        CellStyle=1
        NoVisibleRows=3
        NoVisibleCols=4
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.1851190
        WinLeft=0.1028880
        WinWidth=0.4034070
        WinHeight=0.6581250
        TabOrder=0
        bBoundToParent=true
        bScaleToParent=true
        OnChange=ListChange
    object end
    // Reference: GUIVertImageListBox'UT2k4ModelSelect.vil_CharList'
    CharList=vil_CharList
    begin object name=CharRace class=moComboBox
        bReadOnly=true
        ComponentJustification=0
        CaptionWidth=0.250
        Caption="??"
        OnCreateComponent=InternalOnCreateComponent
        Hint="????? ???? ???? ?????"
        WinTop=0.880
        WinLeft=0.0527330
        WinWidth=0.3881550
        WinHeight=0.0428570
        TabOrder=4
        bBoundToParent=true
        bScaleToParent=true
    object end
    // Reference: moComboBox'UT2k4ModelSelect.CharRace'
    co_Race=CharRace
    begin object name=iBK class=GUIImage
        ImageColor=(R=255,G=255,B=255,A=128)
        ImageStyle=1
        DropShadowX=4
        DropShadowY=4
        WinTop=0.0075070
        WinLeft=0.5302060
        WinWidth=0.3689450
        WinHeight=0.81250
        RenderWeight=0.520
        bBoundToParent=true
        bScaleToParent=true
        OnDraw=InternalOnDraw
    object end
    // Reference: GUIImage'UT2k4ModelSelect.iBK'
    i_bk=iBK
    SpinnyDudeOffset=(X=250.0,Y=1.0,Z=-14.0)
    nfov=15
    InvalidTypes="DUP"
    IgnoredTypes="SP"
    WindowName="??? ??"
}