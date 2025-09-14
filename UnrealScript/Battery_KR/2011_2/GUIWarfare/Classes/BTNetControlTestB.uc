class BTNetControlTestB extends BTNetGUIPage
    editinlinenew
    instanced;

var() automated GUIScrollTextBox MyGUIScrollTextBox1;
var() automated GUIVertImageListBox MyGUIVertImageListBox1;
var export editinline GUIVertImageList MyGUIVertImageListBox1_ImageList;
var array<string> MyGUIVertImageListBox1_ImageListNames;
var() automated AltSectionBackground MyAltSectionBackground1;
var() automated GUIListBox ListBox;
var export editinline GUIList ListBox_List;
var() automated MultiSelectListBox MultiListBox;
var export editinline GUIList MultiListBox_List;
var() automated GUIMultiColumnListBox MultiColumnBox;
var export editinline GUIMultiColumnList MultiColumnBox_List;
var string MultiColumnBox_Headings[3];
var bool GUIVertImageListBox1_ImageList_DblClicked;
var float GUIVertImageListBox1_ImageList_DblClickedTime;
var array<string> SymbolNames;
var array<Material> SymbolMaterials;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    ListBox_List = ListBox.List;
    MultiListBox_List = MultiListBox.List;
    MultiColumnBox_List = MultiColumnBox.List;
    InitializeMultiColumnBox();
    MyGUIScrollTextBox1.SetContent("I'm weak with a fragile sense of mind,@Please teach me the strength of love,@Make me glow in the midst of night,@Turn me away from every false chance,@Watch carefully the shades of my heart,@Then teach me the sweetest emotions,", "@");
    MyGUIScrollTextBox1.MyScrollText.__OnClick__Delegate = GUIScrollTextBox1_OnClick;
    MyGUIVertImageListBox1_ImageList = MyGUIVertImageListBox1.List;
    MyGUIVertImageListBox1_ImageList.bDropSource = true;
    MyGUIVertImageListBox1_ImageList.__OnBeginDrag__Delegate = MyGUIVertImageListBox1_ImageList_OnBeginDrag;
    MyGUIVertImageListBox1_ImageList.__OnEndDrag__Delegate = MyGUIVertImageListBox1_ImageList_OnEndDrag;
    MyGUIVertImageListBox1_ImageList.__OnDblClick__Delegate = GUIVertImageListBox1_OnDblClick;
    MyGUIVertImageListBox1.ContextMenu.__OnSelect__Delegate = GUIVertImageListBox1_ContextMenu_OnSelect;
    InitializeMyGUIVertImageListBox1();
    //return;    
}

function InitializeMultiColumnBox()
{
    local int lp1;

    MultiColumnBox.SetScrollBarStyle(true, new Class'XInterface.STY_ArrowLeft', true, new Class'XInterface.STY_ArrowLeft', true, none, true, new Class'XInterface.STY_ArrowLeft', true, none, true, new Class'XInterface.STY_ArrowLeft');
    lp1 = 0;
    J0x42:

    // End:0x78 [Loop If]
    if(lp1 < 3)
    {
        MultiColumnBox_List.ColumnHeadings[lp1] = MultiColumnBox_Headings[lp1];
        lp1++;
        // [Loop Continue]
        goto J0x42;
    }
    MultiColumnBox_List.__OnPreDraw__Delegate = MultiColumnBox_List_OnPreDraw;
    MultiColumnBox_List.__OnDrawItem__Delegate = MultiColumnBox_List_OnDrawItem;
    //return;    
}

function bool MultiColumnBox_List_OnPreDraw(Canvas C)
{
    return false;
    //return;    
}

function MultiColumnBox_List_OnDrawItem(Canvas Canvas, int Item, float X, float Y, float W, float HT, bool bSelected, bool bPending)
{
    local Material M;
    local float left0, width0, left1, width1, left2, width2;

    local export editinline GUIStyles DrawStyle;

    M = SymbolMaterials[Item];
    MultiColumnBox_List.GetCellLeftWidth(0, left0, width0);
    MultiColumnBox_List.GetCellLeftWidth(1, left1, width1);
    MultiColumnBox_List.GetCellLeftWidth(2, left2, width2);
    // End:0x80
    if(bSelected)
    {
        DrawStyle = MultiColumnBox_List.SelectedStyle;        
    }
    else
    {
        DrawStyle = MultiColumnBox_List.Style;
    }
    Canvas.Style = 1;
    // End:0x106
    if(M == none)
    {
        DrawStyle.DrawText(Canvas, MultiColumnBox_List.MenuState, X + left0, Y, width0, HT, 1, "none", MultiColumnBox_List.FontScale);        
    }
    else
    {
        Canvas.SetPos(X + left0, Y);
        Canvas.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
        Canvas.DrawTileJustified(M, 1, width0, HT);
    }
    DrawStyle.DrawText(Canvas, MultiColumnBox_List.MenuState, X + left1, Y, width1, HT, 1, Repl(SymbolNames[Item], "TeamSymbols_", "", false), MultiColumnBox_List.FontScale);
    DrawStyle.DrawText(Canvas, MultiColumnBox_List.MenuState, X + left2, Y, width2, HT, 1, string(Len(SymbolNames[Item])), MultiColumnBox_List.FontScale);
    //return;    
}

function InitializeMyGUIVertImageListBox1()
{
    local int i;
    local Material M;
    local string ListName;

    Controller.GetTeamSymbolList(SymbolNames, true);
    MyGUIVertImageListBox1_ImageListNames.Length = SymbolNames.Length;
    i = 0;
    J0x29:

    // End:0xF8 [Loop If]
    if(i < SymbolNames.Length)
    {
        M = Material(DynamicLoadObject(SymbolNames[i], Class'Engine.Material'));
        MyGUIVertImageListBox1_ImageList.Add(M, i);
        MyGUIVertImageListBox1_ImageListNames[i] = SymbolNames[i];
        SymbolMaterials[i] = M;
        ListName = Repl(SymbolNames[i], "TeamSymbols_", "", false);
        MultiListBox_List.Add(ListName, none, SymbolNames[i]);
        MultiColumnBox_List.AddedItem();
        i++;
        // [Loop Continue]
        goto J0x29;
    }
    //return;    
}

function InternalOnOpen()
{
    OnOpen();
    //return;    
}

function InternalOnClose(optional bool bCanceled)
{
    OnClose(bCanceled);
    //return;    
}

event Opened(GUIComponent Sender)
{
    super.Opened(Sender);
    //return;    
}

function bool InternalOnKeyEvent(out byte key, out byte State, float Delta)
{
    local Interactions.EInputKey iKey;
    local Interactions.EInputAction iState;

    iKey = key;
    iState = State;
    // End:0x3A
    if(int(iKey) == int(27))
    {
        page_Main.SetPage(1, true);
        return true;
    }
    return false;
    //return;    
}

function bool GUIScrollTextBox1_OnClick(GUIComponent Sender)
{
    MyGUIScrollTextBox1.Restart();
    return true;
    //return;    
}

function GUIVertImageListBox1_OnChange(GUIComponent Sender)
{
    local int Item;
    local float timeSinceDblClick;
    local export editinline BTNetControlTest_ImageInfo imageInfo;
    local Material M;

    Item = MyGUIVertImageListBox1_ImageList.GetItem();
    timeSinceDblClick = Controller.ViewportOwner.Actor.Level.TimeSeconds - GUIVertImageListBox1_ImageList_DblClickedTime;
    // End:0x113
    if(timeSinceDblClick < 0.0500000)
    {
        GUIVertImageListBox1_ImageList_DblClickedTime = 0.0000000;
        // End:0xB8
        if(BTNetControlTest_ImageInfo(Controller.TopPage()) == none)
        {
            Controller.OpenMenu("GUIWarfare.BTNetControlTest_ImageInfo");            
        }
        imageInfo = BTNetControlTest_ImageInfo(Controller.TopPage());
        M = Material(DynamicLoadObject(MyGUIVertImageListBox1_ImageListNames[Item], Class'Engine.Material'));
        imageInfo.Image.Image = M;        
    }
    else
    {
        MyGUIScrollTextBox1.SetContent(MyGUIVertImageListBox1_ImageListNames[Item]);
    }
    //return;    
}

function bool GUIVertImageListBox1_OnDblClick(GUIComponent Sender)
{
    GUIVertImageListBox1_ImageList_DblClickedTime = Controller.ViewportOwner.Actor.Level.TimeSeconds;
    return false;
    //return;    
}

function GUIVertImageListBox1_ContextMenu_OnSelect(GUIContextMenu Sender, int Index)
{
    switch(Index)
    {
        // End:0x28
        case 0:
            MyGUIVertImageListBox1.List.CellStyle = 0;
            // End:0xBA
            break;
        // End:0xB0
        case 1:
            MyGUIVertImageListBox1.CellStyle = 1;
            MyGUIVertImageListBox1.List.CellStyle = 1;
            MyGUIVertImageListBox1.NoVisibleCols = 4;
            MyGUIVertImageListBox1.List.NoVisibleCols = 4;
            MyGUIVertImageListBox1.NoVisibleRows = 4;
            MyGUIVertImageListBox1.List.NoVisibleRows = 4;
            // End:0xBA
            break;
        // End:0xFFFF
        default:
            assert(false);
            // End:0xBA
            break;
            break;
    }
    //return;    
}

function bool MyGUIVertImageListBox1_ImageList_OnBeginDrag(GUIComponent Sender)
{
    local bool Value;

    Value = MyGUIVertImageListBox1_ImageList.InternalOnBeginDrag(Sender);
    // End:0x44
    if(Value)
    {
        Class'GUIWarfare_Decompressed.BTNetControlTest'.static.EnlargeAnimation(MyAltSectionBackground1, 1.0599999, 0.1000000, 2);
    }
    return Value;
    //return;    
}

function MyGUIVertImageListBox1_ImageList_OnEndDrag(GUIComponent Sender, bool Accepted)
{
    // End:0x0F
    if(Accepted)
    {
        MyGUIVertImageListBox1_DeleteSelectedItem();
    }
    //return;    
}

function bool InternalOnClick(GUIComponent Sender)
{
    local int lp1;
    local float ActualLeft, ActualTop;

    ActualLeft = MyGUIScrollTextBox1.ActualLeft();
    ActualTop = MyGUIScrollTextBox1.ActualTop();
    MyGUIScrollTextBox1.KillAnimation();
    MyGUIScrollTextBox1.Stop();
    MyGUIScrollTextBox1.Animate(ActualLeft, ActualTop);
    MyGUIScrollTextBox1.Animate(Controller.MouseX, Controller.MouseY, 0.5000000);
    lp1 = 0;
    J0x92:

    // End:0x10E [Loop If]
    if(lp1 < 3)
    {
        MyGUIScrollTextBox1.Animate(Controller.MouseX + float(30), Controller.MouseY, 0.2500000);
        MyGUIScrollTextBox1.Animate(Controller.MouseX, Controller.MouseY, 0.4500000);
        ++lp1;
        // [Loop Continue]
        goto J0x92;
    }
    return true;
    //return;    
}

function AltSectionBackground1_OnDragEnter(GUIComponent DropTarget)
{
    //return;    
}

function bool AltSectionBackground1_OnDragDrop(GUIComponent DropTarget)
{
    local export editinline GUIQuestionPage QPage;
    local int SelectedItem;
    local bool askSure;

    askSure = false;
    // End:0xCC
    if(askSure)
    {
        // End:0xC7
        if(Controller.OpenMenu("GUI2K4.GUI2K4QuestionPage"))
        {
            SelectedItem = MyGUIVertImageListBox1_ImageList.SelectedElements[0].Item;
            QPage = GUIQuestionPage(Controller.TopPage());
            QPage.SetupQuestion(("Are you sure to Delete \"" $ MyGUIVertImageListBox1_ImageListNames[SelectedItem]) $ "\"?", 48, 32);
            QPage.__OnButtonClick__Delegate = OnYesNo;
        }
        return false;        
    }
    else
    {
        return true;
    }
    //return;    
}

function OnYesNo(byte bButton)
{
    // End:0x43
    if(int(bButton) == 16)
    {
        Controller.CloseMenu(true);
        Class'GUIWarfare_Decompressed.BTNetControlTest'.static.EnlargeAnimation(MyAltSectionBackground1, 0.8500000, 0.1500000, 1);
        MyGUIVertImageListBox1_DeleteSelectedItem();
    }
    //return;    
}

function MyGUIVertImageListBox1_DeleteSelectedItem()
{
    local int SelectedItem;
    local string selectedItemString;

    SelectedItem = MyGUIVertImageListBox1_ImageList.Elements[MyGUIVertImageListBox1_ImageList.Index].Item;
    selectedItemString = MyGUIVertImageListBox1_ImageListNames[SelectedItem];
    selectedItemString = Repl(selectedItemString, "TeamSymbols_", "", false);
    ListBox_List.Add(selectedItemString);
    MyGUIVertImageListBox1_ImageList.Remove(MyGUIVertImageListBox1_ImageList.Index);
    //return;    
}

defaultproperties
{
    // Reference: GUIScrollTextBox'GUIWarfare_Decompressed.BTNetControlTestB.GUIScrollTextBox1'
    begin object name="GUIScrollTextBox1" class=XInterface.GUIScrollTextBox
        CharDelay=0.0700000
        EOLDelay=0.5000000
        TextAlign=1
        OnCreateComponent=GUIScrollTextBox1.InternalOnCreateComponent
        WinTop=0.3579080
        WinLeft=0.3492220
        WinWidth=0.3299600
        WinHeight=0.2500000
        bTabStop=false
        bNeverFocus=true
    end object
    MyGUIScrollTextBox1=GUIScrollTextBox1
    // Reference: GUIVertImageListBox'GUIWarfare_Decompressed.BTNetControlTestB.GUIVertImageListBox1'
    begin object name="GUIVertImageListBox1" class=XInterface.GUIVertImageListBox
        ImageScale=0.2000000
        bVisibleWhenEmpty=true
        bSorted=true
        OnCreateComponent=GUIVertImageListBox1.InternalOnCreateComponent
        WinTop=0.6826560
        WinLeft=0.2243750
        WinWidth=0.5564380
        WinHeight=0.2821220
        ContextMenu=GUIContextMenu'GUIWarfare_Decompressed.BTNetControlTestB.GUIVertImageListBox1_ContextMenu'
        OnChange=BTNetControlTestB.GUIVertImageListBox1_OnChange
    end object
    MyGUIVertImageListBox1=GUIVertImageListBox1
    // Reference: AltSectionBackground'GUIWarfare_Decompressed.BTNetControlTestB.AltSectionBackground1'
    begin object name="AltSectionBackground1" class=GUI2K4.AltSectionBackground
        Caption="Trash Can"
        WinTop=0.7038960
        WinLeft=0.7982450
        WinWidth=0.1714470
        WinHeight=0.2285160
        bAcceptsInput=true
        bDropTarget=true
        OnPreDraw=AltSectionBackground1.InternalPreDraw
        OnDragDrop=BTNetControlTestB.AltSectionBackground1_OnDragDrop
        OnDragEnter=BTNetControlTestB.AltSectionBackground1_OnDragEnter
    end object
    MyAltSectionBackground1=AltSectionBackground1
    // Reference: GUIListBox'GUIWarfare_Decompressed.BTNetControlTestB.mListBox'
    begin object name="mListBox" class=XInterface.GUIListBox
        bVisibleWhenEmpty=true
        OnCreateComponent=mListBox.InternalOnCreateComponent
        WinTop=0.6999350
        WinLeft=0.0140840
        WinWidth=0.1891810
        WinHeight=0.2368420
    end object
    ListBox=mListBox
    // Reference: MultiSelectListBox'GUIWarfare_Decompressed.BTNetControlTestB.mMultiListBox'
    begin object name="mMultiListBox" class=XInterface.MultiSelectListBox
        bVisibleWhenEmpty=true
        OnCreateComponent=mMultiListBox.InternalOnCreateComponent
        WinTop=0.0247720
        WinLeft=0.8029240
        WinWidth=0.1891810
        WinHeight=0.2368420
    end object
    MultiListBox=mMultiListBox
    // Reference: GUIMultiColumnListBox'GUIWarfare_Decompressed.BTNetControlTestB.mMultiColumnBox'
    begin object name="mMultiColumnBox" class=XInterface.GUIMultiColumnListBox
        HeaderColumnPerc=/* Array type was not detected. */
        OnCreateComponent=mMultiColumnBox.InternalOnCreateComponent
        WinTop=0.0200000
        WinLeft=0.0100000
        WinWidth=0.3500000
        WinHeight=0.2000000
    end object
    MultiColumnBox=mMultiColumnBox
    MultiColumnBox_Headings[0]="Icon"
    MultiColumnBox_Headings[1]="Name"
    MultiColumnBox_Headings[2]="Length"
    bPersistent=true
    bAllowedAsLast=true
    OnOpen=BTNetControlTestB.InternalOnOpen
    OnClose=BTNetControlTestB.InternalOnClose
    OnClick=BTNetControlTestB.InternalOnClick
    OnKeyEvent=BTNetControlTestB.InternalOnKeyEvent
}