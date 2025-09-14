class BTTPQuestInfoHK extends BTTabPanelHK
    editinlinenew
    instanced;

var export editinline TabControlMocker TabControl;
var export editinline BTOwnerDrawImageHK BackgroundImage;
var array<export editinline BTOwnerDrawCaptionButtonHK> ButtonCategory;
var export editinline BTACLQuestHK ACLQuest;
var export editinline BTLabelQuestDescHK LabelQuestDesc;
var export editinline BTOwnerDrawCaptionButtonHK ButtonTab[6];
var export editinline BTOwnerDrawCaptionButtonHK ButtonClose;
var localized string strButtonTab[6];
var localized string strButtonClose;
var bool bSelfTopMenuOwner;
var bool bSlidingTabPanel;
var bool bShowing;
var float SlideTime;
var float SlideMultiplier;
var FloatBox ShowAWinFrame;
var FloatBox HideAWinFrame;

function bool ButtonTab_OnClick(GUIComponent Sender)
{
    local int lp1;

    lp1 = 0;
    J0x07:

    // End:0x7A [Loop If]
    if(lp1 < TabControl.Buttons.Length)
    {
        // End:0x70
        if(TabControl.Buttons[lp1] == Sender)
        {
            TabControl.SetVisiblePanel(lp1);
            ACLQuest.SetVisibleQuestType(lp1);
            SetLabelQuestDesc(0);
            // [Explicit Break]
            goto J0x7A;
        }
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    J0x7A:

    return true;
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local FloatBox fb;

    super(GUIPanel).InitComponent(MyController, myOwner);
    fb.X1 = AWinPos.X1;
    fb.X2 = AWinPos.X2;
    fb.Y1 = AWinPos.Y1 + float(25);
    fb.Y2 = AWinPos.Y2;
    BackgroundImage = NewLabelComponent(fb, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_1);
    BackgroundImage.CanvasStyle = 2;
    fb.X1 = AWinPos.X1 + float(6);
    fb.X2 = (AWinPos.X2 - float(6)) - float(15);
    fb.Y1 = (AWinPos.Y1 + float(25)) + float(6);
    fb.Y2 = (AWinPos.Y2 - float(166)) - float(5);
    ACLQuest = BTACLQuestHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTACLQuestHK', fb));
    fb.X1 = AWinPos.X1 + float(6);
    fb.X2 = AWinPos.X2 - float(6);
    fb.Y1 = AWinPos.Y2 - float(166);
    fb.Y2 = AWinPos.Y2 - float(43);
    LabelQuestDesc = BTLabelQuestDescHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTLabelQuestDescHK', fb));
    ACLQuest.MultiColumnList.__OnClick__Delegate = ACLQuest_OnClick;
    fb.X1 = AWinPos.X1;
    fb.X2 = AWinPos.X1 + float(90);
    fb.Y1 = AWinPos.Y1;
    fb.Y2 = AWinPos.Y1 + float(25);
    i = 0;
    J0x246:

    // End:0x35D [Loop If]
    if(i < 6)
    {
        ButtonTab[i] = NewButtonComponent(fb);
        ButtonTab[i].CaptionDrawType = 4;
        ButtonTab[i].CaptionPadding[1] = 2;
        ButtonTab[i].SetDefaultTabButtonFontColor();
        ButtonTab[i].SetDefaultTabButtonImage();
        ButtonTab[i].Caption = strButtonTab[i];
        fb.X1 += float(91);
        fb.X2 += float(91);
        TabControl.BindTabButtonAndPanel(ButtonTab[i], ACLQuest);
        ButtonTab[i].__OnClick__Delegate = ButtonTab_OnClick;
        ButtonTab[i].CanvasStyle = 2;
        i++;
        // [Loop Continue]
        goto J0x246;
    }
    TabControl.SetVisiblePanel(0);
    ACLQuest.SetVisibleQuestType(0);
    SetLabelQuestDesc(0);
    fb.X1 = (AWinPos.X2 - float(6)) - float(120);
    fb.X2 = AWinPos.X2 - float(6);
    fb.Y1 = (AWinPos.Y2 - float(6)) - float(32);
    fb.Y2 = AWinPos.Y2 - float(6);
    ButtonClose = NewButtonComponent(fb);
    ButtonClose.SetDefaultButtonImage();
    ButtonClose.SetFontSizeAll(11);
    ButtonClose.Caption = strButtonClose;
    ButtonClose.__OnClick__Delegate = ButtonClose_OnClick;
    ButtonClose.CanvasStyle = 2;
    //return;    
}

function SetSlideTabPanel()
{
    bSelfTopMenuOwner = true;
    ShowAWinFrame = AWinFrame;
    HideAWinFrame = AWinFrame;
    HideAWinFrame.X1 -= AWinPos.X2;
    HideAWinFrame.X2 -= AWinPos.X2;
    AWinFrame = HideAWinFrame;
    TraversalApplyAWinPos();
    SetVisibility(false);
    //return;    
}

function GUIComponent GetTopMenuOwner()
{
    // End:0x1B
    if(bSelfTopMenuOwner || MenuOwner == none)
    {
        return self;        
    }
    else
    {
        return MenuOwner.GetTopMenuOwner();
    }
    //return;    
}

function bool ButtonClose_OnClick(GUIComponent Sender)
{
    Hide();
    return true;
    //return;    
}

function bool ACLQuest_OnClick(GUIComponent Sender)
{
    // End:0x28
    if(ACLQuest.LastSelectedIndex >= 0)
    {
        SetLabelQuestDesc(ACLQuest.LastSelectedIndex);
    }
    return true;
    //return;    
}

function bool Internal_OnPreDraw(Canvas C)
{
    OnPreDraw(C);
    // End:0x151
    if(bSlidingTabPanel)
    {
        SlideTime -= (Controller.RenderDelta * (1.0000000 + ((float(1) - SlideTime) * SlideMultiplier)));
        // End:0x6F
        if(SlideTime <= float(0))
        {
            SlideTime = 0.0000000;
            bSlidingTabPanel = false;
            SetVisibility(bShowing);
        }
        // End:0xE3
        if(bShowing)
        {
            AWinFrame.X1 = (HideAWinFrame.X1 * SlideTime) + (ShowAWinFrame.X1 * (float(1) - SlideTime));
            AWinFrame.X2 = (HideAWinFrame.X2 * SlideTime) + (ShowAWinFrame.X2 * (float(1) - SlideTime));            
        }
        else
        {
            AWinFrame.X1 = (ShowAWinFrame.X1 * SlideTime) + (HideAWinFrame.X1 * (float(1) - SlideTime));
            AWinFrame.X2 = (ShowAWinFrame.X2 * SlideTime) + (HideAWinFrame.X2 * (float(1) - SlideTime));
        }
        TraversalApplyAWinPos();
    }
    return true;
    //return;    
}

function SetMatchMaker(wMatchMaker MM)
{
    local int i;

    ACLQuest.RemovePool();
    ACLQuest.RemoveAll();
    MM.SortQuestList(Controller.ViewportOwner.Actor.Level.GameMgr);
    i = 0;
    J0x5D:

    // End:0xC1 [Loop If]
    if(i < MM.QuestList.Length)
    {
        ACLQuest.AddQuestInfo(MM.QuestList[i].QuestID, MM.QuestList[i].CurrentProgress);
        i++;
        // [Loop Continue]
        goto J0x5D;
    }
    LabelQuestDesc.SetData("", "", "", "", "", "", "");
    // End:0xFA
    if(MM.QuestList.Length > 0)
    {
        SetLabelQuestDesc(0);
    }
    //return;    
}

function Show()
{
    // End:0x16
    if(bVisible || bSlidingTabPanel)
    {
        return;
    }
    SlideTime = 1.0000000;
    bShowing = true;
    bSlidingTabPanel = true;
    SetVisibility(true);
    PlayerOwner().ClientPlaySound(Sound'Warfare_Sound_UI.Window.ui_window_open',,, 6);
    //return;    
}

function Hide()
{
    // End:0x19
    if((bVisible == false) || bSlidingTabPanel)
    {
        return;
    }
    SlideTime = 1.0000000;
    bShowing = false;
    bSlidingTabPanel = true;
    PlayerOwner().ClientPlaySound(Sound'Warfare_Sound_UI.Window.ui_window_close',,, 6);
    //return;    
}

function SetLabelQuestDesc(int RowIndex)
{
    local BTAutoColumnListDataHK row;

    // End:0xEA
    if((RowIndex >= 0) && RowIndex < ACLQuest.ACLRowList.Length)
    {
        row = ACLQuest.ACLRowList[RowIndex];
        LabelQuestDesc.SetData(row.DataPerColumn[3].strValue, row.DataPerColumn[4].strValue, row.DataPerColumn[2].strValue, row.DataPerColumn[0].strValue, row.DataPerColumn[1].strValue, row.DataPerColumn[5].strValue, row.DataPerColumn[6].strValue);        
    }
    else
    {
        LabelQuestDesc.SetData("", "", "", "", "", "", "");
    }
    //return;    
}

defaultproperties
{
    // Reference: TabControlMocker'GUIWarfareControls_Decompressed.BTTPQuestInfoHK.mTabControl'
    begin object name="mTabControl" class=GUIWarfareControls_Decompressed.TabControlMocker
    end object
    TabControl=mTabControl
    strButtonTab[0]="??"
    strButtonTab[1]="?? ??"
    strButtonTab[2]="???"
    strButtonTab[3]="??"
    strButtonTab[4]="??"
    strButtonTab[5]="?? ??"
    strButtonClose="??"
    SlideMultiplier=4.0000000
    bAcceptsInput=true
    OnPreDraw=BTTPQuestInfoHK.Internal_OnPreDraw
}