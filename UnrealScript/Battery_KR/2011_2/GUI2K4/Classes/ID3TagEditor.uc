class ID3TagEditor extends FloatingWindow
    editinlinenew
    instanced;

var() automated GUIPanel p_Main;
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
    //return;    
}

event Closed(GUIComponent Sender, bool bCancelled)
{
    super(GUIPage).Closed(Sender, bCancelled);
    Stream.SaveID3Tag();
    //return;    
}

function bool SetFileManager()
{
    // End:0x27
    if(FileManager != none)
    {
        // End:0x25
        if((Handler == none) && !SetHandler())
        {
            return false;
        }
        return true;
    }
    // End:0x41
    if((Handler == none) && !SetHandler())
    {
        return false;
    }
    FileManager = Handler.FileManager;
    return FileManager != none;
    //return;    
}

function bool SetHandler()
{
    local int i;

    // End:0x23
    if((Controller == none) || Controller.ViewportOwner == none)
    {
        return false;
    }
    i = 0;
    J0x2A:

    // End:0xA8 [Loop If]
    if(i < Controller.ViewportOwner.LocalInteractions.Length)
    {
        // End:0x9E
        if(StreamInteraction(Controller.ViewportOwner.LocalInteractions[i]) != none)
        {
            Handler = StreamInteraction(Controller.ViewportOwner.LocalInteractions[i]);
            return true;
        }
        i++;
        // [Loop Continue]
        goto J0x2A;
    }
    Log("StreamPlayer.SetHandler() - no StreamInteractions found!", 'MusicPlayer');
    return false;
    //return;    
}

function HandleObject(Object obj, optional Object OptionalObject_1, optional Object OptionalObj_2)
{
    assert(fileName != "");
    // End:0x27
    if(obj != none)
    {
        Stream = Stream(obj);
    }
    // End:0x4C
    if(Stream == none)
    {
        Stream = FileManager.CreateStream(fileName);
    }
    // End:0x6C
    if(Stream != none)
    {
        ID3Tag = Stream.GetTag();
    }
    ReadTag();
    //return;    
}

function HandleParameters(string ParamA, string ParamB)
{
    fileName = ParamA;
    //return;    
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
    //return;    
}

function int FindFieldIndex(string Caption)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x53 [Loop If]
    if(i < ID3Tag.Fields.Length)
    {
        // End:0x49
        if(ID3Tag.Fields[i].FieldName == Caption)
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

function ReadTag()
{
    local int i;
    local export editinline AnimatedEditBox Box;

    // End:0x0D
    if(ID3Tag == none)
    {
        return;
    }
    i = 0;
    J0x14:

    // End:0xAC [Loop If]
    if(i < ID3Tag.Fields.Length)
    {
        Box = AnimatedEditBox(li_Fields.AddItem("GUI2K4.AnimatedEditBox", none, ID3Tag.Fields[i].FieldName));
        Box.SetComponentValue(ID3Tag.Fields[i].FieldValue, true);
        i++;
        // [Loop Continue]
        goto J0x14;
    }
    //return;    
}

function SetPanelPosition(Canvas C)
{
    local float AT;

    AT = (t_WindowTitle.ActualTop() + t_WindowTitle.ActualHeight()) + float(2);
    p_Main.WinTop = p_Main.RelativeTop(AT);
    p_Main.WinHeight = p_Main.RelativeHeight((Bounds[3] - ActualHeight(0.0150000)) - AT);
    //return;    
}

function ListCreateComponent(GUIMenuOption NewComp, GUIMultiOptionList Sender)
{
    NewComp.bAutoSizeCaption = false;
    //return;    
}

defaultproperties
{
    // Reference: GUIPanel'GUI2K4_Decompressed.ID3TagEditor.MainPanel'
    begin object name="MainPanel" class=XInterface.GUIPanel
        WinTop=0.0915950
        WinLeft=0.0112500
        WinWidth=0.9787500
        WinHeight=0.8962500
        RenderWeight=0.2000000
    end object
    p_Main=MainPanel
    // Reference: GUIMultiOptionListBox'GUI2K4_Decompressed.ID3TagEditor.FieldList'
    begin object name="FieldList" class=XInterface.GUIMultiOptionListBox
        bVisibleWhenEmpty=true
        OnCreateComponent=FieldList.InternalOnCreateComponent
        bBoundToParent=true
        bScaleToParent=true
    end object
    lb_Fields=FieldList
    EditBoxHint="?????? ?????"
    WindowName="?? ???"
    MinPageWidth=0.4589840
    MinPageHeight=0.3301550
}