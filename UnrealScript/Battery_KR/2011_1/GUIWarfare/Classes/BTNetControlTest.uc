class BTNetControlTest extends BTNetGUIPage
    editinlinenew
    instanced;

var export editinline GUICircularImageList MyGUICircularImageList1;
var float MyGUICircularImageList1_Elapsed;
var int MyGUICircularImageList1_TopDelta;
var export editinline AltSectionBackground MyAltSectionBackground1;
var export editinline GUISectionBackground MySectionBackground1;
var bool GUICircularImageList1_CancelOnClick;
var export editinline GUIImageList MyGUIImageList1;
var export editinline FloatingImage MyFloatingImage1;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    InitializeMyVariables();
    MyFloatingImage1.SetTimer(5.0000000, true);
    MyAltSectionBackground1.ManageComponent(MyGUIImageList1);
    InitializeCircularImageList();
    InitializeImageList();
    //return;    
}

function InitializeMyVariables()
{
    MyFloatingImage1 = FloatingImage(Controls[6]);
    MyGUIImageList1 = GUIImageList(Controls[7]);
    MySectionBackground1 = GUISectionBackground(Controls[8]);
    MyGUICircularImageList1 = GUICircularImageList(Controls[9]);
    MyAltSectionBackground1 = AltSectionBackground(Controls[10]);
    //return;    
}

function InitializeImageList()
{
    local int i;
    local Material M;
    local array<string> SymbolNames;
    local export editinline GUIImageList ImageList;

    ImageList = GUIImageList(Controls[7]);
    Controller.GetTeamSymbolList(SymbolNames, true);
    i = 0;
    J0x2F:

    // End:0x89 [Loop If]
    if(i < SymbolNames.Length)
    {
        M = Material(DynamicLoadObject(SymbolNames[i], Class'Engine.Material'));
        ImageList.AddMaterial(SymbolNames[i], M);
        i++;
        // [Loop Continue]
        goto J0x2F;
    }
    ImageList.FirstImage();
    //return;    
}

function InitializeCircularImageList()
{
    local int i;
    local Material M;
    local array<string> SymbolNames;

    Controller.GetTeamSymbolList(SymbolNames, true);
    i = 0;
    J0x1C:

    // End:0x81 [Loop If]
    if(i < SymbolNames.Length)
    {
        M = Material(DynamicLoadObject(SymbolNames[i], Class'Engine.Material'));
        // End:0x77
        if(M != none)
        {
            MyGUICircularImageList1.Add(M, SymbolNames[i]);
        }
        i++;
        // [Loop Continue]
        goto J0x1C;
    }
    MyGUICircularImageList1.ContextMenu.__OnSelect__Delegate = GUICircularImageList1_ContextMenu_OnSelect;
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

function GUICircularImageList1_ContextMenu_OnSelect(GUIContextMenu Sender, int Index)
{
    switch(Index)
    {
        // End:0x15
        case 0:
            MyGUICircularImageList1_TopDelta = 0;
            // End:0x3C
            break;
        // End:0x23
        case 1:
            MyGUICircularImageList1_TopDelta = 1;
            // End:0x3C
            break;
        // End:0x36
        case 2:
            MyGUICircularImageList1_TopDelta = -1;
            // End:0x3C
            break;
        // End:0xFFFF
        default:
            // End:0x3C
            break;
            break;
    }
    //return;    
}

function GUIContextMenu1_OnSelect(GUIContextMenu Sender, int Index)
{
    local export editinline CoolImage CoolImage;

    switch(Index)
    {
        // End:0x3F
        case 0:
            CoolImage = CoolImage(Controls[5]);
            CoolImage.Anims.Length = CoolImage.NoAnims;
            // End:0xD8
            break;
        // End:0x6A
        case 1:
            CoolImage = CoolImage(Controls[5]);
            CoolImage.Anims.Length = 0;
            // End:0xD8
            break;
        // End:0x72
        case 2:
            // End:0xD8
            break;
        // End:0x9A
        case 3:
            MyAltSectionBackground1.SetVisibility(true);
            MySectionBackground1.SetVisibility(true);
            // End:0xD8
            break;
        // End:0xC2
        case 4:
            MyAltSectionBackground1.SetVisibility(false);
            MySectionBackground1.SetVisibility(false);
            // End:0xD8
            break;
        // End:0xCA
        case 5:
            // End:0xD8
            break;
        // End:0xD2
        case 6:
            // End:0xD8
            break;
        // End:0xFFFF
        default:
            // End:0xD8
            break;
            break;
    }
    //return;    
}

function bool GUICircularImageList1_OnDraw(Canvas Canvas)
{
    local int NewTop;

    MyGUICircularImageList1_Elapsed += Controller.RenderDelta;
    // End:0xA3
    if(MyGUICircularImageList1_Elapsed > 1.0000000)
    {
        MyGUICircularImageList1_Elapsed = 0.0000000;
        NewTop = MyGUICircularImageList1.Top + MyGUICircularImageList1_TopDelta;
        // End:0x69
        if(NewTop == MyGUICircularImageList1.ItemCount)
        {
            NewTop = 0;
        }
        // End:0x8F
        if(NewTop == -1)
        {
            NewTop = MyGUICircularImageList1.ItemCount - 1;
        }
        MyGUICircularImageList1.SetTopItem(NewTop);
    }
    return false;
    //return;    
}

function bool GUICircularImageList1_OnClick(GUIComponent Sender)
{
    // End:0x16
    if(GUICircularImageList1_CancelOnClick)
    {
        GUICircularImageList1_CancelOnClick = false;
        return false;        
    }
    else
    {
        return MyGUICircularImageList1.InternalOnClick(Sender);
    }
    //return;    
}

function bool GUICircularImageList1_OnRightClick(GUIComponent Sender)
{
    GUICircularImageList1_CancelOnClick = true;
    return true;
    //return;    
}

function bool FloatingImage1_OnClick(GUIComponent Sender)
{
    EnlargeAnimation(Sender, 1.1000000, 0.3500000, 1);
    return true;
    //return;    
}

function FloatingImage1_OnTimer(GUIComponent Sender)
{
    EnlargeAnimation(Sender, 1.1000000, 0.3500000, 1);
    //return;    
}

static function EnlargeAnimation(GUIComponent Target, float resizeFactor, float Time, int repeat)
{
    local int lp1;
    local float oldWidth, oldHeight, NewWidth, NewHeight, oldLeft, oldTop,
	    NewLeft, NewTop;

    Target.KillAnimation();
    oldWidth = Target.ActualWidth();
    oldHeight = Target.ActualHeight();
    NewWidth = oldWidth * resizeFactor;
    NewHeight = oldHeight * resizeFactor;
    Target.Resize(oldWidth, oldHeight, 0.0000000);
    lp1 = 0;
    J0x7C:

    // End:0xD1 [Loop If]
    if(lp1 < repeat)
    {
        Target.Resize(NewWidth, NewHeight, Time);
        Target.Resize(oldWidth, oldHeight, Time);
        lp1++;
        // [Loop Continue]
        goto J0x7C;
    }
    oldLeft = Target.ActualLeft();
    oldTop = Target.ActualTop();
    NewLeft = oldLeft - ((NewWidth - oldWidth) / float(2));
    NewTop = oldTop - ((NewHeight - oldHeight) / float(2));
    Target.Animate(oldLeft, oldTop, 0.0000000);
    lp1 = 0;
    J0x158:

    // End:0x1AD [Loop If]
    if(lp1 < repeat)
    {
        Target.Animate(NewLeft, NewTop, Time);
        Target.Animate(oldLeft, oldTop, Time);
        lp1++;
        // [Loop Continue]
        goto J0x158;
    }
    //return;    
}

defaultproperties
{
    MyGUICircularImageList1_TopDelta=1
    bPersistent=true
    bAllowedAsLast=true
    OnOpen=BTNetControlTest.InternalOnOpen
    OnClose=BTNetControlTest.InternalOnClose
    // Reference: BackgroundImage'GUIWarfare_Decompressed.BTNetControlTest.backg'
    begin object name="backg" class=XInterface.BackgroundImage
    end object
    Controls[0]=backg
    // Reference: GUILabel'GUIWarfare_Decompressed.BTNetControlTest.LabelButton'
    begin object name="LabelButton" class=XInterface.GUILabel
        Caption="GUIButton"
        TextColor=(R=255,G=255,B=255,A=255)
        WinTop=0.0325520
        WinLeft=0.2001950
        WinWidth=0.0859380
        WinHeight=0.0507810
    end object
    Controls[1]=LabelButton
    // Reference: GUIButton'GUIWarfare_Decompressed.BTNetControlTest.ButtonOK'
    begin object name="ButtonOK" class=XInterface.GUIButton
        Caption="OK"
        WinTop=0.0781250
        WinLeft=0.2050780
        WinWidth=0.0693360
        WinHeight=0.0507810
        OnKeyEvent=ButtonOK.InternalOnKeyEvent
    end object
    Controls[2]=ButtonOK
    // Reference: GUILabel'GUIWarfare_Decompressed.BTNetControlTest.LabelEditBox'
    begin object name="LabelEditBox" class=XInterface.GUILabel
        Caption="GUIEditBox"
        TextColor=(R=255,G=255,B=255,A=255)
        WinTop=0.0351550
        WinLeft=0.0478520
        WinWidth=0.0859380
        WinHeight=0.0507810
    end object
    Controls[3]=LabelEditBox
    // Reference: GUIEditBox'GUIWarfare_Decompressed.BTNetControlTest.EditBoxLoginName'
    begin object name="EditBoxLoginName" class=XInterface.GUIEditBox
        WinTop=0.0898440
        WinLeft=0.0195310
        WinWidth=0.1386720
        WinHeight=0.0351560
        bBoundToParent=true
        bScaleToParent=true
        OnActivate=EditBoxLoginName.InternalActivate
        OnDeActivate=EditBoxLoginName.InternalDeactivate
        OnKeyType=EditBoxLoginName.InternalOnKeyType
        OnKeyEvent=EditBoxLoginName.InternalOnKeyEvent
    end object
    Controls[4]=EditBoxLoginName
    // Reference: CoolImage'GUIWarfare_Decompressed.BTNetControlTest.CoolImage1'
    begin object name="CoolImage1" class=XInterface.CoolImage
        Image=Texture'Warfare_UI.ID_Textures.GameContactButton_watched'
        NoAnims=20
        MaxScale=1.5000000
        MinFadeTime=0.5000000
        MaxFadeTime=3.0000000
        MinResetDelay=1.0000000
        MaxResetDelay=3.0000000
        FullAlpha=200
        RenderWeight=0.1000000
        bBoundToParent=true
        bScaleToParent=true
    end object
    Controls[5]=CoolImage1
    // Reference: FloatingImage'GUIWarfare_Decompressed.BTNetControlTest.FloatingImage1'
    begin object name="FloatingImage1" class=XInterface.FloatingImage
        ImageStyle=2
        DropShadowX=0
        DropShadowY=0
        WinTop=0.7557240
        WinLeft=0.8216950
        WinWidth=0.2000000
        WinHeight=0.2000000
        bAcceptsInput=true
        OnClick=BTNetControlTest.FloatingImage1_OnClick
        OnTimer=BTNetControlTest.FloatingImage1_OnTimer
    end object
    Controls[6]=FloatingImage1
    // Reference: GUIImageList'GUIWarfare_Decompressed.BTNetControlTest.GUIImageList1'
    begin object name="GUIImageList1" class=XInterface.GUIImageList
        bWrap=true
        ImageStyle=4
        ImageRenderStyle=1
        ImageAlign=1
        Hint="Your Image List"
        WinTop=0.0617120
        WinLeft=0.7936990
        WinWidth=0.1855610
        WinHeight=0.5063780
    end object
    Controls[7]=GUIImageList1
    // Reference: GUISectionBackground'GUIWarfare_Decompressed.BTNetControlTest.GUICircularImageList1_Background'
    begin object name="GUICircularImageList1_Background" class=XInterface.GUISectionBackground
        Caption="CircularImageList"
        WinTop=0.7420000
        WinLeft=0.0215510
        WinWidth=0.8242720
        WinHeight=0.2259080
        RenderWeight=0.1000000
        OnPreDraw=GUICircularImageList1_Background.InternalPreDraw
    end object
    Controls[8]=GUICircularImageList1_Background
    // Reference: GUICircularImageList'GUIWarfare_Decompressed.BTNetControlTest.GUICircularImageList1'
    begin object name="GUICircularImageList1" class=XInterface.GUICircularImageList
        FixedItemsPerPage=7
        WinTop=0.7962850
        WinLeft=0.0359920
        WinWidth=0.8027160
        WinHeight=0.1500000
        ContextMenu=GUIContextMenu'GUIWarfare_Decompressed.BTNetControlTest.GUICircularImageList1_ContextMenu'
        OnPreDraw=BTNetControlTest.GUICircularImageList1_OnDraw
        OnClick=BTNetControlTest.GUICircularImageList1_OnClick
        OnRightClick=BTNetControlTest.GUICircularImageList1_OnRightClick
        OnMousePressed=GUICircularImageList1.InternalOnMousePressed
        OnMouseRelease=GUICircularImageList1.InternalOnMouseRelease
        OnKeyEvent=GUICircularImageList1.InternalOnKeyEvent
        OnBeginDrag=GUICircularImageList1.InternalOnBeginDrag
        OnEndDrag=GUICircularImageList1.InternalOnEndDrag
        OnDragDrop=GUICircularImageList1.InternalOnDragDrop
        OnDragEnter=GUICircularImageList1.InternalOnDragEnter
        OnDragLeave=GUICircularImageList1.InternalOnDragLeave
        OnDragOver=GUICircularImageList1.InternalOnDragOver
    end object
    Controls[9]=GUICircularImageList1
    // Reference: AltSectionBackground'GUIWarfare_Decompressed.BTNetControlTest.AltSectionBackground1'
    begin object name="AltSectionBackground1" class=GUI2K4.AltSectionBackground
        Caption="Character"
        WinTop=0.0244460
        WinLeft=0.7733450
        WinWidth=0.2237360
        WinHeight=0.5846300
        OnPreDraw=AltSectionBackground1.InternalPreDraw
    end object
    Controls[10]=AltSectionBackground1
    // Reference: GUIContextMenu'GUIWarfare_Decompressed.BTNetControlTest.GUIContextMenu1'
    begin object name="GUIContextMenu1" class=XInterface.GUIContextMenu
        ContextItems=/* Array type was not detected. */
        OnSelect=BTNetControlTest.GUIContextMenu1_OnSelect
    end object
    ContextMenu=GUIContextMenu1
    OnKeyEvent=BTNetControlTest.InternalOnKeyEvent
}