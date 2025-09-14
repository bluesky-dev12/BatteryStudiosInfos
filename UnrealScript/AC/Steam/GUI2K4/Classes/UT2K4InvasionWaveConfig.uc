/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4InvasionWaveConfig.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Structs:2
 *	Properties:18
 *	Functions:14
 *
 *******************************************************************************/
class UT2K4InvasionWaveConfig extends GUICustomPropertyPage
    editinlinenew
    instanced;

struct WaveInfo
{
    var int WaveMask;
    var byte WaveMaxMonsters;
    var byte WaveDuration;
    var float WaveDifficulty;
};

struct WaveMonster
{
    var localized string MName;
    var int Mask;
};

var string PropName;
var string PropValue;
var array<string> Waves;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage i_Background;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moNumericEdit nu_Wave;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIMultiOptionListBox lb_Waves;
var export editinline GUIMultiOptionList li_waves;
var localized string WaveText;
var localized string DiffHint;
var localized string DurationHint;
var localized string MaxInvaderHint;
var localized string AIHint;
var int ActiveWave;
var WaveInfo WaveCopy[16];
var WaveMonster WaveMonsters[16];
var export editinline moSlider sl_Diff;
var export editinline moNumericEdit nu_Duration;
var export editinline moNumericEdit nu_MaxMonster;

function string getResult()
{
    return PropValue;
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local class<GameInfo> InvClass;

    super(LockedFloatingWindow).InitComponent(MyController, myOwner);
    InvClass = class<GameInfo>(DynamicLoadObject("SkaarjPack.Invasion", class'Class'));
    li_waves = lb_Waves.List;
    li_waves.__OnChange__Delegate = InternalOnChange;
    li_waves.bDrawSelectionBorder = false;
    li_waves.ItemPadding = 0.150;
    li_waves.ColumnWidth = 0.950;
    li_waves.bHotTrackSound = false;
    sl_Diff = moSlider(li_waves.AddItem("XInterface.moSlider", none, InvClass.static.GetDisplayText("WaveDifficulty"), true));
    nu_Duration = moNumericEdit(li_waves.AddItem("XInterface.moNumericEdit", none, InvClass.static.GetDisplayText("WaveDuration"), true));
    nu_MaxMonster = moNumericEdit(li_waves.AddItem("XInterface.moNumericEdit", none, InvClass.static.GetDisplayText("WaveMaxMonsters"), true));
    sl_Diff.Hint = DiffHint;
    nu_Duration.Hint = DurationHint;
    nu_MaxMonster.Hint = MaxInvaderHint;
    i = 0;
    J0x1e9:
    // End:0x234 [While If]
    if(i < li_waves.NumColumns)
    {
        li_waves.AddItem("XInterface.GUIListSpacer");
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1e9;
    }
    sb_Main.ManageComponent(lb_Waves);
    sb_Main.LeftPadding = 0.0;
    sb_Main.RightPadding = 0.0;
    sb_Main.TopPadding = 0.050;
    sb_Main.BottomPadding = 0.050;
    sb_Main.SetPosition(0.0302340, 0.0750, 0.851640, 0.5656240);
    InitWaveControls();
}

function InitWaveControls()
{
    InitDifficulty();
    InitDuration();
    InitMaxMonsters();
}

function InitDifficulty()
{
    sl_Diff.Setup(0.0, 3.0);
    sl_Diff.CaptionWidth = 0.10;
    sl_Diff.ComponentWidth = -1.0;
    sl_Diff.bAutoSizeCaption = true;
    sl_Diff.ComponentJustification = 0;
}

function InitDuration()
{
    nu_Duration.Setup(1, 255, 1);
    nu_Duration.CaptionWidth = 0.10;
    nu_Duration.ComponentWidth = 0.30;
    nu_Duration.bAutoSizeCaption = true;
    nu_Duration.ComponentJustification = 1;
}

function InitMaxMonsters()
{
    nu_MaxMonster.Setup(1, 24, 1);
    nu_MaxMonster.CaptionWidth = 0.10;
    nu_MaxMonster.ComponentWidth = 0.30;
    nu_MaxMonster.bAutoSizeCaption = true;
    nu_MaxMonster.ComponentJustification = 1;
}

function SetOwner(GUIComponent NewOwner)
{
    super.SetOwner(NewOwner);
    PropName = Item.DisplayName;
    PropValue = Mid(Item.Value, 2, Len(Item.Value) - 4);
    t_WindowTitle.Caption = PropName;
    DisassembleWaveString();
    InitializeList();
}

function AssembleWaveString()
{
    local int i;

    PropValue = "((";
    i = 0;
    J0x11:
    // End:0xf4 [While If]
    if(i < 16)
    {
        // End:0x36
        if(i > 0)
        {
            PropValue $= "),(";
        }
        PropValue $= "WaveMask=" $ string(WaveCopy[i].WaveMask);
        PropValue $= ",WaveMaxMonsters=" $ string(WaveCopy[i].WaveMaxMonsters);
        PropValue $= ",WaveDuration=" $ string(WaveCopy[i].WaveDuration);
        PropValue $= ",WaveDifficulty=" $ string(WaveCopy[i].WaveDifficulty);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x11;
    }
    PropValue $= "))";
}

function DisassembleWaveString()
{
    local int i;

    Split(PropValue, "),(", Waves);
    i = 0;
    J0x18:
    // End:0x115 [While If]
    if(i < Waves.Length && i < 16)
    {
        WaveCopy[i].WaveMask = int(ParseOption(Waves[i], ",", "WaveMask"));
        WaveCopy[i].WaveMaxMonsters = byte(ParseOption(Waves[i], ",", "WaveMaxMonsters"));
        WaveCopy[i].WaveDuration = byte(ParseOption(Waves[i], ",", "WaveDuration"));
        WaveCopy[i].WaveDifficulty = float(ParseOption(Waves[i], ",", "WaveDifficulty"));
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x18;
    }
}

function InitializeList()
{
    local int i;
    local export editinline moCheckBox ch;

    i = 0;
    J0x07:
    // End:0x9a [While If]
    if(i < 16)
    {
        ch = moCheckBox(li_waves.AddItem("XInterface.moCheckbox",, WaveMonsters[i].MName));
        // End:0x90
        if(ch != none)
        {
            ch.Tag = WaveMonsters[i].Mask;
            ch.bAutoSizeCaption = true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    UpdateWaveValues();
}

function string GetDataString()
{
    return PropValue;
}

event Closed(GUIComponent Sender, bool bCancelled)
{
    // End:0x14
    if(!bCancelled)
    {
        AssembleWaveString();
    }
    // End:0x2b
    else
    {
        PropValue = "((" $ PropValue $ "))";
    }
    super(GUIPage).Closed(Sender, bCancelled);
}

function InternalOnChange(GUIComponent Sender)
{
    local export editinline GUIMenuOption Mo;

    // End:0x2d
    if(Sender == nu_Wave)
    {
        ActiveWave = nu_Wave.GetValue();
        UpdateWaveValues();
    }
    // End:0x176
    else
    {
        // End:0x176
        if(Sender == li_waves)
        {
            Mo = li_waves.Get();
            // End:0x83
            if(Mo == sl_Diff)
            {
                WaveCopy[ActiveWave].WaveDifficulty = sl_Diff.GetValue();
            }
            // End:0xe8
            else
            {
                // End:0xb7
                if(Mo == nu_Duration)
                {
                    WaveCopy[ActiveWave].WaveDuration = byte(nu_Duration.GetValue());
                }
                // End:0xe8
                else
                {
                    // End:0xe8
                    if(Mo == nu_MaxMonster)
                    {
                        WaveCopy[ActiveWave].WaveMaxMonsters = byte(nu_MaxMonster.GetValue());
                    }
                }
            }
            // End:0x176
            if(moCheckBox(Mo) != none)
            {
                // End:0x143
                if(moCheckBox(Mo).IsChecked())
                {
                    WaveCopy[ActiveWave].WaveMask = WaveCopy[ActiveWave].WaveMask | Mo.Tag;
                }
                // End:0x176
                else
                {
                    WaveCopy[ActiveWave].WaveMask = WaveCopy[ActiveWave].WaveMask & ~Mo.Tag;
                }
            }
        }
    }
}

function UpdateWaveValues()
{
    local export editinline moCheckBox ch;
    local int i;

    sl_Diff.SetComponentValue(string(WaveCopy[ActiveWave].WaveDifficulty), true);
    nu_Duration.SetComponentValue(string(WaveCopy[ActiveWave].WaveDuration), true);
    nu_MaxMonster.SetComponentValue(string(WaveCopy[ActiveWave].WaveMaxMonsters), true);
    i = 3;
    J0x6e:
    // End:0xf0 [While If]
    if(i < li_waves.Elements.Length)
    {
        ch = moCheckBox(li_waves.Elements[i]);
        // End:0xb4
        if(ch == none)
        {
        }
        // End:0xe6
        else
        {
            ch.SetComponentValue(string(WaveCopy[ActiveWave].WaveMask & ch.Tag), true);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x6e;
    }
}

defaultproperties
{
    begin object name=WaveNumber class=moNumericEdit
        MinValue=0
        MaxValue=15
        ComponentJustification=1
        CaptionWidth=0.10
        ComponentWidth=0.30
        Caption="?? ?? ??."
        OnCreateComponent=InternalOnCreateComponent
        Hint="????? ?? ?? ??? ?????"
        WinTop=0.092990
        WinLeft=0.4073530
        WinWidth=0.220
        WinHeight=0.0428570
        RenderWeight=0.70
        bBoundToParent=true
        bScaleToParent=true
        OnChange=InternalOnChange
    object end
    // Reference: moNumericEdit'UT2K4InvasionWaveConfig.WaveNumber'
    nu_Wave=WaveNumber
    begin object name=WavesList class=GUIMultiOptionListBox
        NumColumns=3
        bVisibleWhenEmpty=true
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.1506080
        WinLeft=0.00750
        WinWidth=0.983750
        WinHeight=0.6981490
        TabOrder=1
        bBoundToParent=true
        bScaleToParent=true
        OnChange=InternalOnChange
    object end
    // Reference: GUIMultiOptionListBox'UT2K4InvasionWaveConfig.WavesList'
    lb_Waves=WavesList
    DiffHint="?? ??? ??? ????"
    DurationHint="?? ??? ??? ????"
    MaxInvaderHint="?? ???? ??? ?? ???? ??."
    AIHint="???/???? ?? ???"
    WaveMonsters[0]=(MName="???",Mask=1)
    WaveMonsters[1]=(MName="???? ???? ??",Mask=2)
    WaveMonsters[2]=(MName="??",Mask=4)
    WaveMonsters[3]=(MName="??",Mask=8)
    WaveMonsters[4]=(MName="??? ??",Mask=16)
    WaveMonsters[5]=(MName="???",Mask=32)
    WaveMonsters[6]=(MName="???",Mask=64)
    WaveMonsters[7]=(MName="???",Mask=128)
    WaveMonsters[8]=(MName="??? ??",Mask=256)
    WaveMonsters[9]=(MName="??? ???",Mask=512)
    WaveMonsters[10]=(MName="??? ???",Mask=1024)
    WaveMonsters[11]=(MName="???",Mask=2048)
    WaveMonsters[12]=(MName="???",Mask=4096)
    WaveMonsters[13]=(MName="???",Mask=8192)
    WaveMonsters[14]=(MName="???? ???? ??",Mask=16384)
    WaveMonsters[15]=(MName="???? ???? ??",Mask=32768)
    DefaultLeft=0.050
    DefaultWidth=0.90
    bDrawFocusedLast=true
    WinLeft=0.050
    WinWidth=0.90
}