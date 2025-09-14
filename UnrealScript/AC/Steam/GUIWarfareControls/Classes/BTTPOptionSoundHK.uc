/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTTPOptionSoundHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:6
 *	Functions:13
 *
 *******************************************************************************/
class BTTPOptionSoundHK extends BTTPOptionBaseHK
    editinlinenew
    instanced;

struct OptionSoundInfo
{
    var bool bSound;
    var bool bMusic;
    var int SoundVolume;
    var int MusicVolume;
    var bool bEAXSound;
};

var localized string strLow;
var localized string strHigh;
var localized string strLabel[10];
var bool bUseSound;
var OptionSoundInfo InitInfo;
var OptionSoundInfo CurrentInfo;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local PlayerController PC;

    super.InitComponent(MyController, myOwner);
    Label.Length = 10;
    Content.Length = 10;
    InternalPadding.Length = 10;
    i = 0;
    J0x32:
    // End:0x5e [While If]
    if(i < 10)
    {
        InternalPadding[i].Y2 = 9.0;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x32;
    }
    PC = PlayerOwner();
    bUseSound = bool(PC.ConsoleCommand("GETUSESOUND TEST"));
    InitializeLabel();
    InitializeContent();
    InitData();
    LoadData();
    ACLList_PositionChanged(0);
}

function InitData()
{
    local PlayerController PC;
    local float ft;

    PC = PlayerOwner();
    ft = float(PC.ConsoleCommand("GETCONFIG_FLOAT sound MusicVolume"));
    InitInfo.MusicVolume = int(ft * float(100));
    // End:0x78
    if(InitInfo.MusicVolume > 0)
    {
        InitInfo.bMusic = true;
    }
    ft = float(PC.ConsoleCommand("GETCONFIG_FLOAT Sound SoundVolume"));
    InitInfo.SoundVolume = int(ft * float(100));
    // End:0xe7
    if(InitInfo.SoundVolume > 0)
    {
        InitInfo.bSound = true;
    }
    InitInfo.bEAXSound = bool(PC.ConsoleCommand("GETCONFIG_BOOL sound UseEAX"));
    CurrentInfo = InitInfo;
}

function DefaultResetData()
{
    CurrentInfo = InitInfo;
    CurrentInfo.bSound = true;
    CurrentInfo.bMusic = true;
    CurrentInfo.SoundVolume = 50;
    CurrentInfo.MusicVolume = 30;
    CurrentInfo.bEAXSound = false;
    SaveData();
    LoadData();
}

function ResetData()
{
    CurrentInfo = InitInfo;
    SaveData();
    LoadData();
}

function SaveData()
{
    local PlayerController PC;

    PC = PlayerOwner();
    // End:0x181
    if(CurrentInfo.bMusic)
    {
        // End:0xa3
        if(!bool(PC.ConsoleCommand("GETCONFIG_BOOL sound UseAL")))
        {
            PC.ConsoleCommand("setdata ALAudio.FModAudioSubsystem MusicVolume" @ string(float(CurrentInfo.MusicVolume) * 0.010));
        }
        // End:0xf8
        else
        {
            PC.ConsoleCommand("setdata ALAudio.ALAudioSubsystem MusicVolume" @ string(float(CurrentInfo.MusicVolume) * 0.010));
        }
        PC.ConsoleCommand("SETCONFIG_FLOAT sound MusicVolume" @ string(float(CurrentInfo.MusicVolume) * 0.010));
        // End:0x17e
        if(InitInfo.bMusic != CurrentInfo.bMusic)
        {
            PC.Player.Console.NextBGM();
        }
    }
    // End:0x26d
    else
    {
        // End:0x1f8
        if(!bool(PC.ConsoleCommand("GETCONFIG_BOOL sound UseAL")))
        {
            PC.ConsoleCommand("setdata ALAudio.FModAudioSubsystem MusicVolume 0");
        }
        // End:0x238
        else
        {
            PC.ConsoleCommand("setdata ALAudio.ALAudioSubsystem MusicVolume 0");
        }
        PC.ConsoleCommand("SETCONFIG_FLOAT sound MusicVolume 0");
    }
    // End:0x3a9
    if(CurrentInfo.bSound)
    {
        // End:0x307
        if(!bool(PC.ConsoleCommand("GETCONFIG_BOOL sound UseAL")))
        {
            PC.ConsoleCommand("setdata ALAudio.FModAudioSubsystem SoundVolume" @ string(float(CurrentInfo.SoundVolume) * 0.010));
        }
        // End:0x35c
        else
        {
            PC.ConsoleCommand("setdata ALAudio.ALAudioSubsystem SoundVolume" @ string(float(CurrentInfo.SoundVolume) * 0.010));
        }
        PC.ConsoleCommand("SETCONFIG_FLOAT Sound SoundVolume" @ string(float(CurrentInfo.SoundVolume) * 0.010));
    }
    // End:0x495
    else
    {
        // End:0x420
        if(!bool(PC.ConsoleCommand("GETCONFIG_BOOL sound UseAL")))
        {
            PC.ConsoleCommand("setdata ALAudio.FModAudioSubsystem SoundVolume 0");
        }
        // End:0x460
        else
        {
            PC.ConsoleCommand("setdata ALAudio.ALAudioSubsystem SoundVolume 0");
        }
        PC.ConsoleCommand("SETCONFIG_FLOAT sound SoundVolume 0");
    }
    // End:0x514
    if(!bool(PC.ConsoleCommand("GETCONFIG_BOOL sound UseAL")))
    {
        PC.ConsoleCommand("setdata ALAudio.FModAudioSubsystem UseEAX" @ string(CurrentInfo.bEAXSound));
    }
    // End:0x55c
    else
    {
        PC.ConsoleCommand("setdata ALAudio.ALAudioSubsystem UseEAX" @ string(CurrentInfo.bEAXSound));
    }
    PC.ConsoleCommand("SETCONFIG_BOOL sound UseEAX" @ string(CurrentInfo.bEAXSound));
    // End:0x603
    if(bool(PC.ConsoleCommand("GETCONFIG_BOOL sound UseAL")) && InitInfo.bEAXSound != CurrentInfo.bEAXSound)
    {
        PC.ConsoleCommand("SOUND_REBOOT");
    }
}

function LoadData()
{
    local PlayerController PC;

    PC = PlayerOwner();
    BTTPOptionRadioButtonHK(Content[0]).ButtonRadio.SetData(CurrentInfo.bMusic);
    // End:0x65
    if(CurrentInfo.bMusic && bUseSound)
    {
        BTSliderHK(Content[1]).EnableMe();
    }
    // End:0x7b
    else
    {
        BTSliderHK(Content[1]).DisableMe();
    }
    BTSliderHK(Content[1]).SetCurrentValue(float(CurrentInfo.MusicVolume));
    BTTPOptionRadioButtonHK(Content[2]).ButtonRadio.SetData(CurrentInfo.bSound);
    // End:0xfb
    if(CurrentInfo.bSound && bUseSound)
    {
        BTSliderHK(Content[3]).EnableMe();
    }
    // End:0x112
    else
    {
        BTSliderHK(Content[3]).DisableMe();
    }
    BTSliderHK(Content[3]).SetCurrentValue(float(CurrentInfo.SoundVolume));
    BTTPOptionRadioButtonHK(Content[4]).ButtonRadio.SetData(CurrentInfo.bEAXSound);
}

function InitializeLabel()
{
    local int i;
    local RenderObject ro;

    i = 0;
    J0x07:
    // End:0xe5 [While If]
    if(i < Label.Length)
    {
        ro = new class'RenderObject';
        ro.Init();
        ACLList.AddRenderObject(ro);
        Label[i] = NewLabelComponent(class'BTCustomDrawHK'.static.MakeEmptyBox(), class'BTUIResourcePoolHK'.default.empty);
        Label[i].SetDefaultFontColor();
        Label[i].CaptionDrawType = 3;
        Label[i].Caption = strLabel[i];
        Label[i].SetFontSizeAll(9);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function Content0_OnSelect(bool bOn)
{
    // End:0x28
    if(bOn && bUseSound)
    {
        Content[1].EnableMe();
    }
    // End:0x39
    else
    {
        Content[1].DisableMe();
    }
    CurrentInfo.bMusic = bOn;
}

function Content1_OnChangeValue(int ChangeValue)
{
    CurrentInfo.MusicVolume = ChangeValue;
}

function Content2_OnSelect(bool bOn)
{
    // End:0x29
    if(bOn && bUseSound)
    {
        Content[3].EnableMe();
    }
    // End:0x3b
    else
    {
        Content[3].DisableMe();
    }
    CurrentInfo.bSound = bOn;
}

function Content3_OnChangeValue(int ChangeValue)
{
    CurrentInfo.SoundVolume = ChangeValue;
}

function Content4_OnSelect(bool bOn)
{
    CurrentInfo.bEAXSound = bOn;
}

function InitializeContent()
{
    local PlayerController PC;

    PC = PlayerOwner();
    Content[0] = NewComponent(new class'BTTPOptionRadioButtonHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.770);
    BTTPOptionRadioButtonHK(Content[0]).ButtonRadio.__OnSelect__Delegate = Content0_OnSelect;
    // End:0x75
    if(bUseSound == false)
    {
        Content[0].DisableMe();
    }
    Content[1] = NewComponent(new class'BTSliderHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.760);
    BTSliderHK(Content[1]).SetData(36, 16);
    BTSliderHK(Content[1]).ButtonLeft.Caption = strLow;
    BTSliderHK(Content[1]).ButtonLeft.SetFontSizeAll(9);
    BTSliderHK(Content[1]).ButtonRight.Caption = strHigh;
    BTSliderHK(Content[1]).ButtonRight.SetFontSizeAll(9);
    BTSliderHK(Content[1]).__OnChangeValue__Delegate = Content1_OnChangeValue;
    // End:0x181
    if(bUseSound == false)
    {
        BTSliderHK(Content[1]).DisableMe();
    }
    Content[2] = NewComponent(new class'BTTPOptionRadioButtonHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.770);
    BTTPOptionRadioButtonHK(Content[2]).ButtonRadio.__OnSelect__Delegate = Content2_OnSelect;
    // End:0x1f0
    if(bUseSound == false)
    {
        Content[2].DisableMe();
    }
    Content[3] = NewComponent(new class'BTSliderHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.760);
    BTSliderHK(Content[3]).SetData(36, 16);
    BTSliderHK(Content[3]).ButtonLeft.Caption = strLow;
    BTSliderHK(Content[3]).ButtonRight.Caption = strHigh;
    BTSliderHK(Content[3]).__OnChangeValue__Delegate = Content3_OnChangeValue;
    // End:0x2c0
    if(bUseSound == false)
    {
        BTSliderHK(Content[3]).DisableMe();
    }
    Content[4] = NewComponent(new class'BTTPOptionRadioButtonHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.770);
    BTTPOptionRadioButtonHK(Content[4]).ButtonRadio.__OnSelect__Delegate = Content4_OnSelect;
    // End:0x32f
    if(bUseSound == false)
    {
        Content[4].DisableMe();
    }
}

defaultproperties
{
    strLow="Low"
    strHigh="High"
    strLabel[0]="BGM Volume"
    strLabel[2]="SFX Volume"
    strLabel[4]="Echo Effects"
}