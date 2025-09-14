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
var() automated GUISectionBackground i_BG1;
var() automated GUISectionBackground i_BG2;
var() automated GUISectionBackground i_BG3;
var() automated GUIImage i_Portrait;
var() automated GUIButton b_Left;
var() automated GUIButton b_Right;
var() automated GUIButton b_Pick;
var() automated GUIButton b_3DView;
var() automated GUIButton b_DropTarget;
var() automated GUIScrollTextBox lb_Scroll;
var() automated moEditBox ed_Name;
var() automated moCheckBox ch_SmallWeaps;
var() automated moComboBox co_Team;
var() automated moComboBox co_Hand;
var() automated moComboBox co_Voice;
var() automated moNumericEdit nu_FOV;
var() automated GUILabel lbl_ModelName;
var() automated GUIComboBox co_SkinPreview;
var array< Class<wVoicePack> > VoiceClasses;
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
//var delegate<VoiceTypeChanged> __VoiceTypeChanged__Delegate;

delegate VoiceTypeChanged(string NewVoiceType)
{
    //return;    
}

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
    // End:0xED
    if(SpinnyDude == none)
    {
        SpinnyDude = PlayerOwner().Spawn(Class'XInterface.SpinnyWeap');
    }
    SpinnyDude.bPlayCrouches = false;
    SpinnyDude.bPlayRandomAnims = false;
    SpinnyDude.SetDrawType(2);
    SpinnyDude.SetDrawScale(0.9000000);
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
    //return;    
}

function SetPlayerRec()
{
    local int i;
    local array<PlayerRecord> PList;

    Class'WGame.wUtil'.static.GetPlayerList(PList);
    i = 0;
    J0x18:

    // End:0x60 [Loop If]
    if(i < PList.Length)
    {
        // End:0x56
        if(sChar ~= PList[i].DefaultName)
        {
            PlayerRec = PList[i];
            // [Explicit Break]
            goto J0x60;
        }
        i++;
        // [Loop Continue]
        goto J0x18;
    }
    J0x60:

    UpdateVoiceOptions();
    UpdateScroll();
    ShowSpinnyDude();
    //return;    
}

function ShowPanel(bool bShow)
{
    local int i;
    local array<string> VoiceClassNames;
    local Class<wVoicePack> VP;

    super.ShowPanel(bShow);
    // End:0xFF
    if(bShow)
    {
        // End:0xFF
        if(bInit)
        {
            bInit = false;
            PlayerOwner().GetAllInt("WGame.wVoicePack", VoiceClassNames);
            VoiceClasses.Remove(0, VoiceClasses.Length);
            i = 0;
            J0x5E:

            // End:0xB6 [Loop If]
            if(i < VoiceClassNames.Length)
            {
                VP = Class<wVoicePack>(DynamicLoadObject(VoiceClassNames[i], Class'Core.Class'));
                // End:0xAC
                if(VP != none)
                {
                    VoiceClasses[VoiceClasses.Length] = VP;
                }
                i++;
                // [Loop Continue]
                goto J0x5E;
            }
            bRenderDude = true;
            SetPlayerRec();
            i = 0;
            J0xCB:

            // End:0xFF [Loop If]
            if(i < Components.Length)
            {
                Components[i].__OnChange__Delegate = InternalOnChange;
                i++;
                // [Loop Continue]
                goto J0xCB;
            }
        }
    }
    //return;    
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
        PC.ReplaceText(sName, "\"", "");
        sNameD = sName;
        PC.ConsoleCommand("SetName" @ sName);
    }
    // End:0x76
    if(iTeam == 2)
    {
        iTeam = 255;
    }
    // End:0xC1
    if(iTeamD != iTeam)
    {
        iTeamD = iTeam;
        PC.UpdateURL("Team", string(iTeam), true);
        PC.ChangeTeam(iTeam);
    }
    // End:0xD5
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
    // End:0x19B
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
        // End:0x1FC
        if(PC.IsA('wPlayer'))
        {
            bSave = false;            
        }
        else
        {
            PC.UpdateURL("Character", sChar, true);
        }
        // End:0x24E
        if(PlayerRec.Sex ~= "Female")
        {
            PC.UpdateURL("Sex", "F", true);            
        }
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
    // End:0x2A9
    if(bSave)
    {
        PC.SaveConfig();
    }
    //return;    
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
    Class'Engine.Controller'.static.ResetConfig("Handedness");
    Class'Engine.PlayerController'.static.ResetConfig("bSmallWeapons");
    Class'Engine.PlayerController'.static.ResetConfig("DefaultFOV");
    bTemp = Controller.bCurMenuInitialized;
    Controller.bCurMenuInitialized = false;
    i = 0;
    J0x15C:

    // End:0x18C [Loop If]
    if(i < Controls.Length)
    {
        Controls[i].LoadINI();
        i++;
        // [Loop Continue]
        goto J0x15C;
    }
    bRenderDude = true;
    SetPlayerRec();
    Controller.bCurMenuInitialized = bTemp;
    //return;    
}

function InternalOnLoadINI(GUIComponent Sender, string S)
{
    local PlayerController PC;

    PC = PlayerOwner();
    // End:0x25A
    if(GUIMenuOption(Sender) != none)
    {
        switch(GUIMenuOption(Sender))
        {
            // End:0x6A
            case ed_Name:
                sName = PC.GetUrlOption("Name");
                sNameD = sName;
                ed_Name.SetText(sName);
                // End:0x257
                break;
            // End:0x12E
            case co_Team:
                // End:0xC5
                if((PC.PlayerReplicationInfo == none) || PC.PlayerReplicationInfo.Team == none)
                {
                    iTeam = int(PC.GetUrlOption("Team"));                    
                }
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
            // End:0x1B6
            case co_Hand:
                iHand = int(PC.Handedness + float(1));
                iHandD = iHand;
                co_Hand.SetIndex(iHand);
                // End:0x257
                break;
            // End:0x1F6
            case nu_FOV:
                iFOV = int(PC.DefaultFOV);
                iFOVD = iFOV;
                nu_FOV.SetValue(iFOV);
                // End:0x257
                break;
            // End:0xFFFF
            default:
                Log((string(Name) @ "Unknown component calling LoadINI:") $ GUIMenuOption(Sender).Caption);
                GUIMenuOption(Sender).SetComponentValue(S, true);
                break;
        }        
    }
    else
    {
        // End:0x294
        if(Sender == i_Portrait)
        {
            sChar = PC.GetUrlOption("Character");
            sCharD = sChar;
        }
    }
    //return;    
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
                // End:0x11D
                break;
            // End:0x70
            case co_Team:
                iTeam = co_Team.GetIndex();
                // End:0x11D
                break;
            // End:0x91
            case ch_SmallWeaps:
                bWeaps = ch_SmallWeaps.IsChecked();
                // End:0x11D
                break;
            // End:0xB1
            case co_Hand:
                iHand = co_Hand.GetIndex();
                // End:0x11D
                break;
            // End:0xD1
            case nu_FOV:
                iFOV = nu_FOV.GetValue();
                // End:0x11D
                break;
            // End:0x11A
            case co_Voice:
                sVoice = co_Voice.GetExtra();
                PreviewVoice(Class<wVoicePack>(co_Voice.GetObject()));
                VoiceTypeChanged(sVoice);
                // End:0x11D
                break;
            // End:0xFFFF
            default:
                break;
        }        
    }
    else
    {
        // End:0x135
        if(Sender == co_SkinPreview)
        {
            UpdateSpinnyDude();
        }
    }
    //return;    
}

function PreviewVoice(Class<wVoicePack> NewVoiceClass)
{
    local int Index;

    // End:0x0D
    if(NewVoiceClass == none)
    {
        return;
    }
    Index = NewVoiceClass.static.PickCustomTauntFor(PlayerOwner(), true, false, 21);
    PlayerOwner().ClientPlaySound(NewVoiceClass.default.TauntSound[Index],,, 6);
    //return;    
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
    // End:0x9E
    if(i != -1)
    {
        co_Voice.SetIndex(i);        
    }
    else
    {
        co_Voice.SetIndex(0);
    }
    Controller.bCurMenuInitialized = bTemp;
    //return;    
}

function UpdateScroll()
{
    lb_Scroll.SetContent(Controller.LoadDecoText("", PlayerRec.TextName));
    //return;    
}

function UpdateSpinnyDude()
{
    local Mesh PlayerMesh;
    local Material BodySkin, HeadSkin;
    local string BodySkinName, HeadSkinName, TeamSuffix;
    local bool bBrightSkin;

    i_Portrait.Image = PlayerRec.Portrait;
    PlayerMesh = Mesh(DynamicLoadObject(PlayerRec.MeshName, Class'Engine.Mesh'));
    // End:0x88
    if(PlayerMesh == none)
    {
        Log((("Could not load mesh: " $ PlayerRec.MeshName) $ " For player: ") $ PlayerRec.DefaultName);
        return;
    }
    TeamSuffix = Eval(co_SkinPreview.GetIndex() > 0, Eval(co_SkinPreview.GetIndex() == 1, "_0", "_1"), "");
    BodySkinName = PlayerRec.BodySkinName $ TeamSuffix;
    bBrightSkin = Class'UnrealGame.DMMutator'.default.bBrightSkins && Left(BodySkinName, 12) ~= "PlayerSkins.";
    // End:0x13C
    if(bBrightSkin && TeamSuffix != "")
    {
        BodySkinName = ("Bright" $ BodySkinName) $ "B";
    }
    HeadSkinName = PlayerRec.FaceSkinName;
    // End:0x168
    if(PlayerRec.TeamFace)
    {
        HeadSkinName $= TeamSuffix;
    }
    BodySkin = Material(DynamicLoadObject(BodySkinName, Class'Engine.Material'));
    // End:0x1DB
    if(BodySkin == none)
    {
        Log((("Could not load body material: " $ PlayerRec.BodySkinName) $ " For player: ") $ PlayerRec.DefaultName);
        return;
    }
    // End:0x20F
    if(bBrightSkin)
    {
        SpinnyDude.AmbientGlow = byte(float(SpinnyDude.default.AmbientGlow) * 0.8000000);        
    }
    else
    {
        SpinnyDude.AmbientGlow = SpinnyDude.default.AmbientGlow;
    }
    HeadSkin = Material(DynamicLoadObject(HeadSkinName, Class'Engine.Material'));
    // End:0x29A
    if(HeadSkin == none)
    {
        Log((("Could not load head material: " $ HeadSkinName) $ " For player: ") $ PlayerRec.DefaultName);
        return;
    }
    SpinnyDude.LinkMesh(PlayerMesh);
    SpinnyDude.Skins[0] = BodySkin;
    SpinnyDude.Skins[1] = HeadSkin;
    SpinnyDude.LoopAnim('Idle_Rest', 1.0000000 / SpinnyDude.Level.TimeDilation);
    //return;    
}

function bool InternalDraw(Canvas Canvas)
{
    local Vector CamPos, X, Y, Z;
    local Rotator camRot;
    local float oOrgX, oOrgY, oClipX, oClipY;

    // End:0x1DB
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
        SpinnyDude.SetLocation(((CamPos + (SpinnyDudeOffset.X * X)) + (SpinnyDudeOffset.Y * Y)) + (SpinnyDudeOffset.Z * Z));
        Canvas.DrawActorClipped(SpinnyDude, false, b_DropTarget.ActualLeft(), b_DropTarget.ActualTop(), b_DropTarget.ActualWidth(), b_DropTarget.ActualHeight(), true, float(nfov));
        Canvas.OrgX = oOrgX;
        Canvas.OrgY = oOrgY;
        Canvas.ClipX = oClipX;
        Canvas.ClipY = oClipY;
    }
    return bRenderDude;
    //return;    
}

function bool PickModel(GUIComponent Sender)
{
    // End:0x6F
    if(Controller.OpenMenu("GUI2K4.UT2K4ModelSelect", PlayerRec.DefaultName, Eval(Controller.CtrlPressed, PlayerRec.Race, "")))
    {
        Controller.ActivePage.__OnClose__Delegate = ModelSelectClosed;
    }
    return true;
    //return;    
}

function ModelSelectClosed(optional bool bCancelled)
{
    local string str;

    // End:0x0B
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
    //return;    
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
    else
    {
        i_Portrait.Image = PlayerRec.Portrait;
        b_3DView.Caption = Show3DViewCaption;
        co_SkinPreview.SetVisibility(false);
        SpinnyDude.LinkMesh(none);
        b_DropTarget.MouseCursorIndex = 0;
    }
    //return;    
}

function bool Toggle3DView(GUIComponent Sender)
{
    bRenderDude = !bRenderDude;
    ShowSpinnyDude();
    return true;
    //return;    
}

function bool NextAnim(GUIComponent Sender)
{
    // End:0x18
    if(bRenderDude)
    {
        SpinnyDude.PlayNextAnim();
    }
    return true;
    //return;    
}

function bool RaceCapturedMouseMove(float deltaX, float deltaY)
{
    local Rotator R;

    R = SpinnyDude.Rotation;
    R.Yaw -= int(float(256) * deltaX);
    SpinnyDude.SetRotation(R);
    return true;
    //return;    
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
    //return;    
}

event Closed(GUIComponent Sender, bool bCancelled)
{
    super.Closed(Sender, bCancelled);
    // End:0x2D
    if(SpinnyDude != none)
    {
        SpinnyDude.bHidden = true;
    }
    //return;    
}

function free()
{
    super(GUITabPanel).free();
    VoiceClasses.Remove(0, VoiceClasses.Length);
    // End:0x3F
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
    //return;    
}

function logspinnydude()
{
    Log((((((((((((("SpinnyDudeOffset X:" $ string(SpinnyDudeOffset.X)) @ "Y:") $ string(SpinnyDudeOffset.Y)) @ "Z:") $ string(SpinnyDudeOffset.Z)) @ "Roll:") $ string(SpinnyDude.Rotation.Roll)) @ "Pitch:") $ string(SpinnyDude.Rotation.Pitch)) @ "Yaw:") $ string(SpinnyDude.Rotation.Yaw)) @ "FOV:") $ string(nfov));
    //return;    
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
    SpinnyDudeOffset=(X=70.0000000,Y=0.0000000,Z=0.0000000)
    ShowBioCaption="?????"
    Show3DViewCaption="3D ??"
    DefaultText="???"
    // Reference: GUISectionBackground'GUI2K4_Decompressed.UT2K4Tab_PlayerSettings.PlayerBK1'
    begin object name="PlayerBK1" class=XInterface.GUISectionBackground
        Caption="3D ??"
        WinTop=0.0179690
        WinLeft=0.0040630
        WinWidth=0.4467580
        WinHeight=0.9636310
        OnPreDraw=PlayerBK1.InternalPreDraw
    end object
    i_BG1=PlayerBK1
    // Reference: GUISectionBackground'GUI2K4_Decompressed.UT2K4Tab_PlayerSettings.PlayerBK2'
    begin object name="PlayerBK2" class=XInterface.GUISectionBackground
        Caption="??"
        WinTop=0.0179690
        WinLeft=0.4630470
        WinWidth=0.5317190
        WinHeight=0.5730060
        OnPreDraw=PlayerBK2.InternalPreDraw
    end object
    i_BG2=PlayerBK2
    // Reference: GUISectionBackground'GUI2K4_Decompressed.UT2K4Tab_PlayerSettings.PlayerBK3'
    begin object name="PlayerBK3" class=XInterface.GUISectionBackground
        bFillClient=true
        Caption="???"
        LeftPadding=0.0200000
        RightPadding=0.0200000
        TopPadding=0.0200000
        BottomPadding=0.0200000
        WinTop=0.6104170
        WinLeft=0.4630470
        WinWidth=0.5317190
        WinHeight=0.3728110
        OnPreDraw=PlayerBK3.InternalPreDraw
    end object
    i_BG3=PlayerBK3
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4Tab_PlayerSettings.PlayerPortrait'
    begin object name="PlayerPortrait" class=XInterface.GUIImage
        ImageStyle=2
        ImageRenderStyle=1
        IniOption="@Internal"
        WinTop=0.0948950
        WinLeft=0.0570160
        WinWidth=0.3343680
        WinHeight=0.7981320
        RenderWeight=0.3000000
        OnDraw=UT2K4Tab_PlayerSettings.InternalDraw
        OnLoadINI=UT2K4Tab_PlayerSettings.InternalOnLoadINI
    end object
    i_Portrait=PlayerPortrait
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4Tab_PlayerSettings.bPickModel'
    begin object name="bPickModel" class=XInterface.GUIButton
        Caption="??? ??"
        Hint="???? ???? ??? ? ????."
        WinTop=0.9015590
        WinLeft=0.1771740
        WinWidth=0.2333990
        WinHeight=0.0500000
        TabOrder=2
        OnClick=UT2K4Tab_PlayerSettings.PickModel
        OnKeyEvent=bPickModel.InternalOnKeyEvent
    end object
    b_Pick=bPickModel
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4Tab_PlayerSettings.Player3DView'
    begin object name="Player3DView" class=XInterface.GUIButton
        Caption="3D ??"
        Hint="???? 3D ??? ????? ???? ?????? ?????."
        WinTop=0.9015590
        WinLeft=0.0436850
        WinWidth=0.1307200
        WinHeight=0.0500000
        TabOrder=1
        OnClick=UT2K4Tab_PlayerSettings.Toggle3DView
        OnKeyEvent=Player3DView.InternalOnKeyEvent
    end object
    b_3DView=Player3DView
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4Tab_PlayerSettings.DropTarget'
    begin object name="DropTarget" class=XInterface.GUIButton
        StyleName="NoBackground"
        WinTop=0.1144260
        WinLeft=0.0130710
        WinWidth=0.4271410
        WinHeight=0.7981320
        MouseCursorIndex=5
        bTabStop=false
        bNeverFocus=true
        bDropTarget=true
        OnKeyEvent=DropTarget.InternalOnKeyEvent
        OnCapturedMouseMove=UT2K4Tab_PlayerSettings.RaceCapturedMouseMove
    end object
    b_DropTarget=DropTarget
    // Reference: GUIScrollTextBox'GUI2K4_Decompressed.UT2K4Tab_PlayerSettings.PlayerScroll'
    begin object name="PlayerScroll" class=XInterface.GUIScrollTextBox
        CharDelay=0.0025000
        EOLDelay=0.5000000
        OnCreateComponent=PlayerScroll.InternalOnCreateComponent
        WinTop=0.3213650
        WinLeft=0.2912880
        WinWidth=0.6869150
        WinHeight=0.2603510
        TabOrder=9
    end object
    lb_Scroll=PlayerScroll
    // Reference: moEditBox'GUI2K4_Decompressed.UT2K4Tab_PlayerSettings.PlayerName'
    begin object name="PlayerName" class=XInterface.moEditBox
        Caption="??"
        OnCreateComponent=PlayerName.InternalOnCreateComponent
        IniOption="@INTERNAL"
        IniDefault="Player"
        Hint="??? ??? ?????."
        WinTop=0.0760420
        WinLeft=0.3017570
        WinWidth=0.3732420
        TabOrder=3
        OnLoadINI=UT2K4Tab_PlayerSettings.InternalOnLoadINI
    end object
    ed_Name=PlayerName
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_PlayerSettings.PlayerSmallWeap'
    begin object name="PlayerSmallWeap" class=XInterface.moCheckBox
        CaptionWidth=0.9400000
        Caption="?? ?? ??"
        OnCreateComponent=PlayerSmallWeap.InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="False"
        Hint="1?? ??? ???? ??? ?? ????? ???."
        WinTop=0.1502610
        WinLeft=0.7054300
        WinWidth=0.2667970
        TabOrder=8
        OnLoadINI=UT2K4Tab_PlayerSettings.InternalOnLoadINI
    end object
    ch_SmallWeaps=PlayerSmallWeap
    // Reference: moComboBox'GUI2K4_Decompressed.UT2K4Tab_PlayerSettings.PlayerTeam'
    begin object name="PlayerTeam" class=XInterface.moComboBox
        bReadOnly=true
        ComponentJustification=0
        CaptionWidth=0.7000000
        Caption="?? ? ??"
        OnCreateComponent=PlayerTeam.InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="Red"
        Hint="????? ???? ?? ?????."
        WinTop=0.1502610
        WinLeft=0.3017570
        WinWidth=0.3742190
        TabOrder=6
        OnLoadINI=UT2K4Tab_PlayerSettings.InternalOnLoadINI
    end object
    co_Team=PlayerTeam
    // Reference: moComboBox'GUI2K4_Decompressed.UT2K4Tab_PlayerSettings.PlayerHand'
    begin object name="PlayerHand" class=XInterface.moComboBox
        bReadOnly=true
        ComponentJustification=0
        CaptionWidth=0.7000000
        Caption="?? ??"
        OnCreateComponent=PlayerHand.InternalOnCreateComponent
        IniOption="@INTERNAL"
        IniDefault="Right"
        Hint="??? ???, ?? ??? ?????."
        WinTop=0.2127610
        WinLeft=0.7054300
        WinWidth=0.2647660
        TabOrder=7
        OnLoadINI=UT2K4Tab_PlayerSettings.InternalOnLoadINI
    end object
    co_Hand=PlayerHand
    // Reference: moComboBox'GUI2K4_Decompressed.UT2K4Tab_PlayerSettings.VoiceType'
    begin object name="VoiceType" class=XInterface.moComboBox
        bReadOnly=true
        ComponentJustification=0
        Caption="??? ??"
        OnCreateComponent=VoiceType.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="??? ??? ??? ?????."
        WinTop=0.2127610
        WinLeft=0.3017570
        WinWidth=0.3722660
        TabOrder=4
        OnLoadINI=UT2K4Tab_PlayerSettings.InternalOnLoadINI
    end object
    co_Voice=VoiceType
    // Reference: moNumericEdit'GUI2K4_Decompressed.UT2K4Tab_PlayerSettings.PlayerFOV'
    begin object name="PlayerFOV" class=XInterface.moNumericEdit
        MinValue=80
        MaxValue=100
        ComponentJustification=0
        CaptionWidth=0.7000000
        Caption="?? FOV"
        OnCreateComponent=PlayerFOV.InternalOnCreateComponent
        IniOption="@INTERNAL"
        IniDefault="85"
        Hint="??? ?? ??(FOV)? ?????."
        WinTop=0.0760420
        WinLeft=0.7054300
        WinWidth=0.2667970
        TabOrder=5
        OnLoadINI=UT2K4Tab_PlayerSettings.InternalOnLoadINI
    end object
    nu_FOV=PlayerFOV
    // Reference: GUIComboBox'GUI2K4_Decompressed.UT2K4Tab_PlayerSettings.SkinPreview'
    begin object name="SkinPreview" class=XInterface.GUIComboBox
        bReadOnly=true
        Hint="??? ??? ???? ??? ??? ?????."
        WinTop=0.1114700
        WinLeft=0.0535310
        WinWidth=0.3462580
        WinHeight=0.0300000
        TabOrder=0
        OnChange=UT2K4Tab_PlayerSettings.InternalOnChange
        OnKeyEvent=SkinPreview.InternalOnKeyEvent
    end object
    co_SkinPreview=SkinPreview
    nfov=65
    PanelCaption="????"
    WinTop=0.1500000
    WinHeight=0.7200000
}