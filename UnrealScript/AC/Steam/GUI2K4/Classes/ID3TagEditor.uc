/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\ID3TagEditor.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:10
 *	Functions:11
 *
 *******************************************************************************/
class ID3TagEditor extends FloatingWindow
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIPanel p_Main;
var StreamInterface FileManager;
var StreamInteraction Handler;
var export editinline GUIMultiOptionListBox lb_Fields;
var export editinline GUIMultiOptionList li_Fields;
var array<export editinline AnimatedEditBox> ed_Fields;
var string fileName;
var Stream Stream;
var StreamTag ID3Tag;
var localized string EditBoxHint;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    p_Main.__OnCreateComponent__Delegate = InternalOnCreateComponent;
    p_Main.AppendComponent(lb_Fields);
    li_Fields = lb_Fields.List;
    li_Fields.__OnCreateComponent__Delegate = ListCreateComponent;
    li_Fields.bDrawSelectionBorder = false;
    SetFileManager();
}

event Closed(GUIComponent Sender, bool bCancelled)
{
    super(GUIPage).Closed(Sender, bCancelled);
    Stream.SaveID3Tag();
}

function bool SetFileManager()
{
    // End:0x27
    if(FileManager != none)
    {
        // End:0x25
        if(Handler == none && !SetHandler())
        {
            return false;
        }
        return true;
    }
    // End:0x41
    if(Handler == none && !SetHandler())
    {
        return false;
    }
    FileManager = Handler.FileManager;
    return FileManager != none;
}

function bool SetHandler()
{
    local int i;

    // End:0x23
    if(Controller == none || Controller.ViewportOwner == none)
    {
        return false;
    }
    i = 0;
    J0x2a:
    // End:0xa8 [While If]
    if(i < Controller.ViewportOwner.LocalInteractions.Length)
    {
        // End:0x9e
        if(StreamInteraction(Controller.ViewportOwner.LocalInteractions[i]) != none)
        {
            Handler = StreamInteraction(Controller.ViewportOwner.LocalInteractions[i]);
            return true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x2a;
    }
    Log("StreamPlayer.SetHandler() - no StreamInteractions found!", 'MusicPlayer');
    return false;
}

function HandleObject(Object obj, optional Object OptionalObject_1, optional Object OptionalObj_2)
{
    assert(fileName != "");
    // End:0x27
    if(obj != none)
    {
        Stream = Stream(obj);
    }
    // End:0x4c
    if(Stream == none)
    {
        Stream = FileManager.CreateStream(fileName);
    }
    // End:0x6c
    if(Stream != none)
    {
        ID3Tag = Stream.GetTag();
    }
    ReadTag();
}

function HandleParameters(string ParamA, string ParamB)
{
    fileName = ParamA;
}

function InternalOnChange(GUIComponent Sender)
{
    local int i, idx;
    local export editinline GUIMenuOption Mo;

    // End:0x93
    if(GUIMultiOptionList(Sender) != none)
    {
        Mo = li_Fields.Get();
        // End:0x41
        if(Mo == none)
        {
            Warn("mo was None");
            return;
        }
        idx = FindFieldIndex(Mo.Caption);
        // End:0x93
        if(i != -1)
        {
            ID3Tag.Fields[i].FieldValue = Mo.GetComponentValue();
        }
    }
}

function int FindFieldIndex(string Caption)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x53 [While If]
    if(i < ID3Tag.Fields.Length)
    {
        // End:0x49
        if(ID3Tag.Fields[i].FieldName == Caption)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return -1;
}

function ReadTag()
{
    local int i;
    local export editinline AnimatedEditBox Box;

    // End:0x0d
    if(ID3Tag == none)
    {
        return;
    }
    i = 0;
    J0x14:
    // End:0xac [While If]
    if(i < ID3Tag.Fields.Length)
    {
        Box = AnimatedEditBox(li_Fields.AddItem("GUI2K4.AnimatedEditBox", none, ID3Tag.Fields[i].FieldName));
        Box.SetComponentValue(ID3Tag.Fields[i].FieldValue, true);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
}

function SetPanelPosition(Canvas C)
{
    local float AT;

    AT = t_WindowTitle.ActualTop() + t_WindowTitle.ActualHeight() + float(2);
    p_Main.WinTop = p_Main.RelativeTop(AT);
    p_Main.WinHeight = p_Main.RelativeHeight(Bounds[3] - ActualHeight(0.0150) - AT);
}

function ListCreateComponent(GUIMenuOption NewComp, GUIMultiOptionList Sender)
{
    NewComp.bAutoSizeCaption = false;
}

defaultproperties
{
    begin object name=MainPanel class=GUIPanel
        WinTop=0.0915950
        WinLeft=0.011250
        WinWidth=0.978750
        WinHeight=0.896250
        RenderWeight=0.20
    object end
    // Reference: GUIPanel'ID3TagEditor.MainPanel'
    p_Main=MainPanel
    begin object name=FieldList class=GUIMultiOptionListBox
        bVisibleWhenEmpty=true
        OnCreateComponent=InternalOnCreateComponent
        bBoundToParent=true
        bScaleToParent=true
    object end
    // Reference: GUIMultiOptionListBox'ID3TagEditor.FieldList'
    lb_Fields=FieldList
    EditBoxHint="?????? ?????"
    WindowName="?? ???"
    MinPageWidth=0.4589840
    MinPageHeight=0.3301550
}