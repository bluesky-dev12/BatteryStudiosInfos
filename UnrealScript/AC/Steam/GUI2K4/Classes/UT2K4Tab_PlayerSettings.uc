/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4Tab_PlayerSettings.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:50
 *	Functions:23
 *
 *******************************************************************************/
class UT2K4Tab_PlayerSettings extends Settings_Tabs
    editinlinenew
    instanced;

var localized string HandNames[4];
var localized string TeamNames[3];
var localized string ClickInst;
var localized string All;
var localized string Previews[3];
var bool bChanged;
var() editconst noexport editinline SpinnyWeap SpinnyDude;
var() Vector SpinnyDudeOffset;
var() bool bRenderDude;
var localized string ShowBioCaption;
var localized string Show3DViewCaption;
var localized string DefaultText;
var string OriginalTeam;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground i_BG1;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground i_BG2;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground i_BG3;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage i_Portrait;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Left;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Right;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Pick;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_3DView;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_DropTarget;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIScrollTextBox lb_Scroll;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moEditBox ed_Name;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_SmallWeaps;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moComboBox co_Team;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moComboBox co_Hand;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moComboBox co_Voice;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moNumericEdit nu_FOV;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel lbl_ModelName;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIComboBox co_SkinPreview;
var array< class<wVoicePack> > VoiceClasses;
var() string sChar;
var() string sName;
var() string sNameD;
var() string sCharD;
var() string sVoice;
var() string sVoiceD;
var() int iTeam;
var() int iHand;
var() int iFOV;
var() int iTeamD;
var() int iHandD;
var() int iFOVD;
var() bool bWeaps;
var() bool bWeapsD;
var() int nfov;
var() PlayerRecord PlayerRec;
var() int YawValue;
var delegate<VoiceTypeChanged> __VoiceTypeChanged__Delegate;

delegate VoiceTypeChanged(string NewVoiceType);
function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    co_Hand.AddItem(HandNames[0]);
    co_Hand.AddItem(HandNames[1]);
    co_Hand.AddItem(HandNames[2]);
    co_Hand.AddItem(HandNames[3]);
    co_Hand.ReadOnly(true);
    co_Team.AddItem(TeamNames[0]);
    co_Team.AddItem(TeamNames[1]);
    co_Team.AddItem(TeamNames[2]);
    co_Team.ReadOnly(true);
    // End:0xed
    if(SpinnyDude == none)
    {
        SpinnyDude = PlayerOwner().Spawn(class'SpinnyWeap');
    }
    SpinnyDude.bPlayCrouches = false;
    SpinnyDude.bPlayRandomAnims = false;
    SpinnyDude.SetDrawType(2);
    SpinnyDude.SetDrawScale(0.90);
    SpinnyDude.spinRate = 0;
    b_3DView.Caption = Show3DViewCaption;
    ed_Name.MyEditBox.bConvertSpaces = true;
    ed_Name.MyEditBox.MaxWidth = 16;
    nu_FOV.MyNumericEdit.Step = 5;
    co_SkinPreview.AddItem(Previews[0]);
    co_SkinPreview.AddItem(Previews[1]);
    co_SkinPreview.AddItem(Previews[2]);
    i_BG2.ManageComponent(ed_Name);
    i_BG2.ManageComponent(ch_SmallWeaps);
    i_BG2.ManageComponent(co_Team);
    i_BG2.ManageComponent(co_Hand);
    i_BG2.ManageComponent(co_Voice);
    i_BG2.ManageComponent(nu_FOV);
    i_BG3.ManageComponent(lb_Scroll);
}

function SetPlayerRec()
{
    local int i;
    local array<PlayerRecord> PList;

    class'wUtil'.static.GetPlayerList(PList);
    i = 0;
    J0x18:
    // End:0x60 [While If]
    if(i < PList.Length)
    {
        // End:0x56
        if(sChar ~= PList[i].DefaultName)
        {
            PlayerRec = PList[i];
        }
        // End:0x60
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x18;
        }
    }
    UpdateVoiceOptions();
    UpdateScroll();
    ShowSpinnyDude();
}

function ShowPanel(bool bShow)
{
    local int i;
    local array<string> VoiceClassNames;
    local class<wVoicePack> VP;

    super.ShowPanel(bShow);
    // End:0xff
    if(bShow)
    {
        // End:0xff
        if(bInit)
        {
            bInit = false;
            PlayerOwner().GetAllInt("WGame.wVoicePack", VoiceClassNames);
            VoiceClasses.Remove(0, VoiceClasses.Length);
            i = 0;
            J0x5e:
            // End:0xb6 [While If]
            if(i < VoiceClassNames.Length)
            {
                VP = class<wVoicePack>(DynamicLoadObject(VoiceClassNames[i], class'Class'));
                // End:0xac
                if(VP != none)
                {
                    VoiceClasses[VoiceClasses.Length] = VP;
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x5e;
            }
            bRenderDude = true;
            SetPlayerRec();
            i = 0;
            J0xcb:
            // End:0xff [While If]
            if(i < Components.Length)
            {
                Components[i].__OnChange__Delegate = InternalOnChange;
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0xcb;
            }
        }
    }
}

function SaveSettings()
{
    local bool bSave;
    local PlayerController PC;

    super.SaveSettings();
    PC = PlayerOwner();
    // End:0x62
    if(sNameD != sName)
    {
        PC.ReplaceText(sName, "\\"", "");
        sNameD = sName;
        PC.ConsoleCommand("SetName" @ sName);
    }
    // End:0x76
    if(iTeam == 2)
    {
        iTeam = 255;
    }
    // End:0xc1
    if(iTeamD != iTeam)
    {
        iTeamD = iTeam;
        PC.UpdateURL("Team", string(iTeam), true);
        PC.ChangeTeam(iTeam);
    }
    // End:0xd5
    if(iTeam == 255)
    {
        iTeam = 2;
    }
    // End:0x111
    if(bWeapsD != bWeaps)
    {
        bWeapsD = bWeaps;
        PC.bSmallWeapons = bWeaps;
        bSave = true;
    }
    // End:0x163
    if(iHandD != iHand)
    {
        iHandD = iHand;
        PC.Handedness = float(iHand - 1);
        PC.SetHand(iHand - 1);
        bSave = false;
    }
    // End:0x19b
    if(iFOVD != iFOV)
    {
        iFOVD = iFOV;
        PC.FOV(float(iFOV));
        bSave = false;
    }
    // End:0x266
    if(sChar != sCharD)
    {
        sCharD = sChar;
        PC.ConsoleCommand("ChangeCharacter" @ sChar);
        // End:0x1fc
        if(PC.IsA('wPlayer'))
        {
            bSave = false;
        }
        // End:0x21c
        else
        {
            PC.UpdateURL("Character", sChar, true);
        }
        // End:0x24e
        if(PlayerRec.Sex ~= "Female")
        {
            PC.UpdateURL("Sex", "F", true);
        }
        // End:0x266
        else
        {
            PC.UpdateURL("Sex", "M", true);
        }
    }
    // End:0x294
    if(sVoice != sVoiceD)
    {
        sVoiceD = sVoice;
        PC.SetVoice(sVoice);
    }
    // End:0x2a9
    if(bSave)
    {
        PC.SaveConfig();
    }
}

function ResetClicked()
{
    local int i;
    local bool bTemp;
    local PlayerController PC;

    super.ResetClicked();
    PC = PlayerOwner();
    PC.ConsoleCommand("ChangeCharacter Jakob");
    PC.ConsoleCommand("setname Player");
    PC.ChangeTeam(255);
    PC.UpdateURL("Name", "Player", true);
    PC.UpdateURL("Character", "Jakob", true);
    PC.UpdateURL("Sex", "M", true);
    PC.UpdateURL("Team", "255", true);
    class'Controller'.static.ResetConfig("Handedness");
    class'PlayerController'.static.ResetConfig("bSmallWeapons");
    class'PlayerController'.static.ResetConfig("DefaultFOV");
    bTemp = Controller.bCurMenuInitialized;
    Controller.bCurMenuInitialized = false;
    i = 0;
    J0x15c:
    // End:0x18c [While If]
    if(i < Controls.Length)
    {
        Controls[i].LoadINI();
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x15c;
    }
    bRenderDude = true;
    SetPlayerRec();
    Controller.bCurMenuInitialized = bTemp;
}

function InternalOnLoadINI(GUIComponent Sender, string S)
{
    local PlayerController PC;

    PC = PlayerOwner();
    // End:0x25a
    if(GUIMenuOption(Sender) != none)
    {
        switch(GUIMenuOption(Sender))
        {
            // End:0x6a
            case ed_Name:
                sName = PC.GetUrlOption("Name");
                sNameD = sName;
                ed_Name.SetText(sName);
                // End:0x257
                break;
            // End:0x12e
            case co_Team:
                // End:0xc5
                if(PC.PlayerReplicationInfo == none || PC.PlayerReplicationInfo.Team == none)
                {
                    iTeam = int(PC.GetUrlOption("Team"));
                }
                // End:0xeb
                else
                {
                    iTeam = PC.PlayerReplicationInfo.Team.TeamIndex;
                }
                iTeamD = iTeam;
                // End:0x109
                if(iTeam > 1)
                {
                    iTeam = 2;
                }
                co_Team.SetIndex(iTeam);
                // End:0x257
                break;
                sVoiceD = sVoice;
                // End:0x257
                break;
            // End:0x171
            case ch_SmallWeaps:
                bWeaps = PC.bSmallWeapons;
                bWeapsD = bWeaps;
                ch_SmallWeaps.Checked(bWeaps);
                // End:0x257
                break;
            // End:0x1b6
            case co_Hand:
                iHand = int(PC.Handedness + float(1));
                iHandD = iHand;
                co_Hand.SetIndex(iHand);
                // End:0x257
                break;
            // End:0x1f6
            case nu_FOV:
                iFOV = int(PC.DefaultFOV);
                iFOVD = iFOV;
                nu_FOV.SetValue(iFOV);
                // End:0x257
                break;
            // End:0xffff
            default:
                Log(string(Name) @ "Unknown component calling LoadINI:" $ GUIMenuOption(Sender).Caption);
                GUIMenuOption(Sender).SetComponentValue(S, true);
                // End:0x294 Break;
                break;
            }
    }
    // End:0x294
    if(Sender == i_Portrait)
    {
        sChar = PC.GetUrlOption("Character");
        sCharD = sChar;
    }
}

function InternalOnChange(GUIComponent Sender)
{
    local PlayerController PC;

    PC = PlayerOwner();
    super.InternalOnChange(Sender);
    // End:0x120
    if(GUIMenuOption(Sender) != none)
    {
        switch(GUIMenuOption(Sender))
        {
            // End:0x50
            case ed_Name:
                sName = ed_Name.GetText();
                // End:0x11d
                break;
            // End:0x70
            case co_Team:
                iTeam = co_Team.GetIndex();
                // End:0x11d
                break;
            // End:0x91
            case ch_SmallWeaps:
                bWeaps = ch_SmallWeaps.IsChecked();
                // End:0x11d
                break;
            // End:0xb1
            case co_Hand:
                iHand = co_Hand.GetIndex();
                // End:0x11d
                break;
            // End:0xd1
            case nu_FOV:
                iFOV = nu_FOV.GetValue();
                // End:0x11d
                break;
            // End:0x11a
            case co_Voice:
                sVoice = co_Voice.GetExtra();
                PreviewVoice(class<wVoicePack>(co_Voice.GetObject()));
                VoiceTypeChanged(sVoice);
                // End:0x11d
                break;
            // End:0xffff
            default:
                // End:0x135 Break;
                break;
            }
    }
    // End:0x135
    if(Sender == co_SkinPreview)
    {
        UpdateSpinnyDude();
    }
}

function PreviewVoice(class<wVoicePack> NewVoiceClass)
{
    local int Index;

    // End:0x0d
    if(NewVoiceClass == none)
    {
        return;
    }
    Index = NewVoiceClass.static.PickCustomTauntFor(PlayerOwner(), true, false, 21);
    PlayerOwner().ClientPlaySound(NewVoiceClass.default.TauntSound[Index],,, 6);
}

function UpdateVoiceOptions()
{
    local int i;
    local bool bTemp;

    bTemp = Controller.bCurMenuInitialized;
    Controller.bCurMenuInitialized = false;
    co_Voice.MyComboBox.List.Clear();
    co_Voice.AddItem(DefaultText);
    i = co_Voice.FindIndex(sVoice,, true);
    // End:0x9e
    if(i != -1)
    {
        co_Voice.SetIndex(i);
    }
    // End:0xae
    else
    {
        co_Voice.SetIndex(0);
    }
    Controller.bCurMenuInitialized = bTemp;
}

function UpdateScroll()
{
    lb_Scroll.SetContent(Controller.LoadDecoText("", PlayerRec.TextName));
}

function UpdateSpinnyDude()
{
    local Mesh PlayerMesh;
    local Material BodySkin, HeadSkin;
    local string BodySkinName, HeadSkinName, TeamSuffix;
    local bool bBrightSkin;

    i_Portrait.Image = PlayerRec.Portrait;
    PlayerMesh = Mesh(DynamicLoadObject(PlayerRec.MeshName, class'Mesh'));
    // End:0x88
    if(PlayerMesh == none)
    {
        Log("Could not load mesh: " $ PlayerRec.MeshName $ " For player: " $ PlayerRec.DefaultName);
        return;
    }
    TeamSuffix = Eval(co_SkinPreview.GetIndex() > 0, Eval(co_SkinPreview.GetIndex() == 1, "_0", "_1"), "");
    BodySkinName = PlayerRec.BodySkinName $ TeamSuffix;
    bBrightSkin = class'DMMutator'.default.bBrightSkins && Left(BodySkinName, 12) ~= "PlayerSkins.";
    // End:0x13c
    if(bBrightSkin && TeamSuffix != "")
    {
        BodySkinName = "Bright" $ BodySkinName $ "B";
    }
    HeadSkinName = PlayerRec.FaceSkinName;
    // End:0x168
    if(PlayerRec.TeamFace)
    {
        HeadSkinName $= TeamSuffix;
    }
    BodySkin = Material(DynamicLoadObject(BodySkinName, class'Material'));
    // End:0x1db
    if(BodySkin == none)
    {
        Log("Could not load body material: " $ PlayerRec.BodySkinName $ " For player: " $ PlayerRec.DefaultName);
        return;
    }
    // End:0x20f
    if(bBrightSkin)
    {
        SpinnyDude.AmbientGlow = byte(float(SpinnyDude.default.AmbientGlow) * 0.80);
    }
    // End:0x22c
    else
    {
        SpinnyDude.AmbientGlow = SpinnyDude.default.AmbientGlow;
    }
    HeadSkin = Material(DynamicLoadObject(HeadSkinName, class'Material'));
    // End:0x29a
    if(HeadSkin == none)
    {
        Log("Could not load head material: " $ HeadSkinName $ " For player: " $ PlayerRec.DefaultName);
        return;
    }
    SpinnyDude.LinkMesh(PlayerMesh);
    SpinnyDude.Skins[0] = BodySkin;
    SpinnyDude.Skins[1] = HeadSkin;
    SpinnyDude.LoopAnim('Idle_Rest', 1.0 / SpinnyDude.Level.TimeDilation);
}

function bool InternalDraw(Canvas Canvas)
{
    local Vector CamPos, X, Y, Z;
    local Rotator camRot;
    local float oOrgX, oOrgY, oClipX, oClipY;

    // End:0x1db
    if(bRenderDude)
    {
        oOrgX = Canvas.OrgX;
        oOrgY = Canvas.OrgY;
        oClipX = Canvas.ClipX;
        oClipY = Canvas.ClipY;
        Canvas.OrgX = b_DropTarget.ActualLeft();
        Canvas.OrgY = b_DropTarget.ActualTop();
        Canvas.ClipX = b_DropTarget.ActualWidth();
        Canvas.ClipY = b_DropTarget.ActualHeight();
        Canvas.GetCameraLocation(CamPos, camRot);
        GetAxes(camRot, X, Y, Z);
        SpinnyDude.SetLocation(CamPos + SpinnyDudeOffset.X * X + SpinnyDudeOffset.Y * Y + SpinnyDudeOffset.Z * Z);
        Canvas.DrawActorClipped(SpinnyDude, false, b_DropTarget.ActualLeft(), b_DropTarget.ActualTop(), b_DropTarget.ActualWidth(), b_DropTarget.ActualHeight(), true, float(nfov));
        Canvas.OrgX = oOrgX;
        Canvas.OrgY = oOrgY;
        Canvas.ClipX = oClipX;
        Canvas.ClipY = oClipY;
    }
    return bRenderDude;
}

function bool PickModel(GUIComponent Sender)
{
    // End:0x6f
    if(Controller.OpenMenu("GUI2K4.UT2K4ModelSelect", PlayerRec.DefaultName, Eval(Controller.CtrlPressed, PlayerRec.Race, "")))
    {
        Controller.ActivePage.__OnClose__Delegate = ModelSelectClosed;
    }
    return true;
}

function ModelSelectClosed(optional bool bCancelled)
{
    local string str;

    // End:0x0b
    if(bCancelled)
    {
        return;
    }
    str = Controller.ActivePage.GetDataString();
    // End:0x46
    if(str != "")
    {
        sChar = str;
        SetPlayerRec();
    }
}

function ShowSpinnyDude()
{
    // End:0x47
    if(bRenderDude)
    {
        UpdateSpinnyDude();
        co_SkinPreview.SetVisibility(true);
        b_3DView.Caption = ShowBioCaption;
        b_DropTarget.MouseCursorIndex = 5;
    }
    // End:0xa4
    else
    {
        i_Portrait.Image = PlayerRec.Portrait;
        b_3DView.Caption = Show3DViewCaption;
        co_SkinPreview.SetVisibility(false);
        SpinnyDude.LinkMesh(none);
        b_DropTarget.MouseCursorIndex = 0;
    }
}

function bool Toggle3DView(GUIComponent Sender)
{
    bRenderDude = !bRenderDude;
    ShowSpinnyDude();
    return true;
}

function bool NextAnim(GUIComponent Sender)
{
    // End:0x18
    if(bRenderDude)
    {
        SpinnyDude.PlayNextAnim();
    }
    return true;
}

function bool RaceCapturedMouseMove(float deltaX, float deltaY)
{
    local Rotator R;

    R = SpinnyDude.Rotation;
    R.Yaw -= int(float(256) * deltaX);
    SpinnyDude.SetRotation(R);
    return true;
}

event Opened(GUIComponent Sender)
{
    local Rotator R;

    super.Opened(Sender);
    // End:0x67
    if(SpinnyDude != none)
    {
        R.Yaw = 32768;
        R.Pitch = -1024;
        SpinnyDude.SetRotation(R + PlayerOwner().Rotation);
        SpinnyDude.bHidden = false;
    }
}

event Closed(GUIComponent Sender, bool bCancelled)
{
    super.Closed(Sender, bCancelled);
    // End:0x2d
    if(SpinnyDude != none)
    {
        SpinnyDude.bHidden = true;
    }
}

function free()
{
    super(GUITabPanel).free();
    VoiceClasses.Remove(0, VoiceClasses.Length);
    // End:0x3f
    if(co_Voice != none)
    {
        co_Voice.MyComboBox.List.Clear();
    }
    // End:0x56
    if(SpinnyDude != none)
    {
        SpinnyDude.Destroy();
    }
    SpinnyDude = none;
}

function logspinnydude()
{
    Log("SpinnyDudeOffset X:" $ string(SpinnyDudeOffset.X) @ "Y:" $ string(SpinnyDudeOffset.Y) @ "Z:" $ string(SpinnyDudeOffset.Z) @ "Roll:" $ string(SpinnyDude.Rotation.Roll) @ "Pitch:" $ string(SpinnyDude.Rotation.Pitch) @ "Yaw:" $ string(SpinnyDude.Rotation.Yaw) @ "FOV:" $ string(nfov));
}

defaultproperties
{
    HandNames[0]="?"
    HandNames[1]="??"
    HandNames[2]="?"
    HandNames[3]="??"
    TeamNames[0]="??"
    TeamNames[1]="??"
    TeamNames[2]="??"
    ClickInst="?? ?? ??? ????? ?????"
    All="??"
    Previews[0]="?? ?? ??"
    Previews[1]="?? ?? ??"
    Previews[2]="?? ?? ??"
    SpinnyDudeOffset=(X=70.0,Y=0.0,Z=0.0)
    ShowBioCaption="?????"
    Show3DViewCaption="3D ??"
    DefaultText="???"
    begin object name=PlayerBK1 class=GUISectionBackground
        Caption="3D ??"
        WinTop=0.0179690
        WinLeft=0.0040630
        WinWidth=0.4467580
        WinHeight=0.9636310
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'UT2K4Tab_PlayerSettings.PlayerBK1'
    i_BG1=PlayerBK1
    begin object name=PlayerBK2 class=GUISectionBackground
        Caption="??"
        WinTop=0.0179690
        WinLeft=0.4630470
        WinWidth=0.5317190
        WinHeight=0.5730060
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'UT2K4Tab_PlayerSettings.PlayerBK2'
    i_BG2=PlayerBK2
    begin object name=PlayerBK3 class=GUISectionBackground
        bFillClient=true
        Caption="???"
        LeftPadding=0.020
        RightPadding=0.020
        TopPadding=0.020
        BottomPadding=0.020
        WinTop=0.6104170
        WinLeft=0.4630470
        WinWidth=0.5317190
        WinHeight=0.3728110
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'UT2K4Tab_PlayerSettings.PlayerBK3'
    i_BG3=PlayerBK3
    begin object name=PlayerPortrait class=GUIImage
        ImageStyle=2
        ImageRenderStyle=1
        IniOption="@Internal"
        WinTop=0.0948950
        WinLeft=0.0570160
        WinWidth=0.3343680
        WinHeight=0.7981320
        RenderWeight=0.30
        OnDraw=InternalDraw
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: GUIImage'UT2K4Tab_PlayerSettings.PlayerPortrait'
    i_Portrait=PlayerPortrait
    begin object name=bPickModel class=GUIButton
        Caption="??? ??"
        Hint="???? ???? ??? ? ????."
        WinTop=0.9015590
        WinLeft=0.1771740
        WinWidth=0.2333990
        WinHeight=0.050
        TabOrder=2
        OnClick=PickModel
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4Tab_PlayerSettings.bPickModel'
    b_Pick=bPickModel
    begin object name=Player3DView class=GUIButton
        Caption="3D ??"
        Hint="???? 3D ??? ????? ???? ?????? ?????."
        WinTop=0.9015590
        WinLeft=0.0436850
        WinWidth=0.130720
        WinHeight=0.050
        TabOrder=1
        OnClick=Toggle3DView
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4Tab_PlayerSettings.Player3DView'
    b_3DView=Player3DView
    begin object name=DropTarget class=GUIButton
        StyleName="NoBackground"
        WinTop=0.1144260
        WinLeft=0.0130710
        WinWidth=0.4271410
        WinHeight=0.7981320
        MouseCursorIndex=5
        bTabStop=true
        bNeverFocus=true
        bDropTarget=true
        OnKeyEvent=InternalOnKeyEvent
        OnCapturedMouseMove=RaceCapturedMouseMove
    object end
    // Reference: GUIButton'UT2K4Tab_PlayerSettings.DropTarget'
    b_DropTarget=DropTarget
    begin object name=PlayerScroll class=GUIScrollTextBox
        CharDelay=0.00250
        EOLDelay=0.50
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.3213650
        WinLeft=0.2912880
        WinWidth=0.6869150
        WinHeight=0.2603510
        TabOrder=9
    object end
    // Reference: GUIScrollTextBox'UT2K4Tab_PlayerSettings.PlayerScroll'
    lb_Scroll=PlayerScroll
    begin object name=PlayerName class=moEditBox
        Caption="??"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@INTERNAL"
        IniDefault="Player"
        Hint="??? ??? ?????."
        WinTop=0.0760420
        WinLeft=0.3017570
        WinWidth=0.3732420
        TabOrder=3
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moEditBox'UT2K4Tab_PlayerSettings.PlayerName'
    ed_Name=PlayerName
    begin object name=PlayerSmallWeap class=moCheckBox
        CaptionWidth=0.940
        Caption="?? ?? ??"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="False"
        Hint="1?? ??? ???? ??? ?? ????? ???."
        WinTop=0.1502610
        WinLeft=0.705430
        WinWidth=0.2667970
        TabOrder=8
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'UT2K4Tab_PlayerSettings.PlayerSmallWeap'
    ch_SmallWeaps=PlayerSmallWeap
    begin object name=PlayerTeam class=moComboBox
        bReadOnly=true
        ComponentJustification=0
        CaptionWidth=0.70
        Caption="?? ? ??"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="Red"
        Hint="????? ???? ?? ?????."
        WinTop=0.1502610
        WinLeft=0.3017570
        WinWidth=0.3742190
        TabOrder=6
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moComboBox'UT2K4Tab_PlayerSettings.PlayerTeam'
    co_Team=PlayerTeam
    begin object name=PlayerHand class=moComboBox
        bReadOnly=true
        ComponentJustification=0
        CaptionWidth=0.70
        Caption="?? ??"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@INTERNAL"
        IniDefault="Right"
        Hint="??? ???, ?? ??? ?????."
        WinTop=0.2127610
        WinLeft=0.705430
        WinWidth=0.2647660
        TabOrder=7
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moComboBox'UT2K4Tab_PlayerSettings.PlayerHand'
    co_Hand=PlayerHand
    begin object name=VoiceType class=moComboBox
        bReadOnly=true
        ComponentJustification=0
        Caption="??? ??"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="??? ??? ??? ?????."
        WinTop=0.2127610
        WinLeft=0.3017570
        WinWidth=0.3722660
        TabOrder=4
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moComboBox'UT2K4Tab_PlayerSettings.VoiceType'
    co_Voice=VoiceType
    begin object name=PlayerFOV class=moNumericEdit
        MinValue=80
        MaxValue=100
        ComponentJustification=0
        CaptionWidth=0.70
        Caption="?? FOV"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@INTERNAL"
        IniDefault="85"
        Hint="??? ?? ??(FOV)? ?????."
        WinTop=0.0760420
        WinLeft=0.705430
        WinWidth=0.2667970
        TabOrder=5
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moNumericEdit'UT2K4Tab_PlayerSettings.PlayerFOV'
    nu_FOV=PlayerFOV
    begin object name=SkinPreview class=GUIComboBox
        bReadOnly=true
        Hint="??? ??? ???? ??? ??? ?????."
        WinTop=0.111470
        WinLeft=0.0535310
        WinWidth=0.3462580
        WinHeight=0.030
        TabOrder=0
        OnChange=InternalOnChange
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIComboBox'UT2K4Tab_PlayerSettings.SkinPreview'
    co_SkinPreview=SkinPreview
    nfov=65
    PanelCaption="????"
    WinTop=0.150
    WinHeight=0.720
}