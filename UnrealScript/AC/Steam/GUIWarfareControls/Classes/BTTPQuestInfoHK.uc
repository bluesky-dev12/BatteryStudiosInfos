/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTTPQuestInfoHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:16
 *	Functions:11
 *
 *******************************************************************************/
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
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    lp1 = 0;
    J0x17:
    // End:0xb1 [While If]
    if(lp1 < TabControl.Buttons.Length)
    {
        // End:0xa7
        if(TabControl.Buttons[lp1] == Sender)
        {
            TabControl.SetVisiblePanel(lp1);
            // End:0x81
            if(lp1 == 0)
            {
                ACLQuest.SetVisibleQuestType(lp1);
            }
            // End:0x9d
            if(lp1 == 1)
            {
                ACLQuest.SetVisibleQuestType(3);
            }
            SetLabelQuestDesc(0);
        }
        // End:0xb1
        else
        {
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x17;
        }
    }
    return true;
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local FloatBox fb;

    super(GUIPanel).InitComponent(MyController, myOwner);
    fb.X1 = AWinPos.X1;
    fb.X2 = AWinPos.X2;
    fb.Y1 = AWinPos.Y1;
    fb.Y2 = AWinPos.Y2;
    BackgroundImage = NewLabelComponent(fb, class'BTUIResourcePoolHK'.default.Quest_Info_BG);
    BackgroundImage.CanvasStyle = 2;
    fb.X1 = AWinPos.X1 + float(14);
    fb.Y1 = AWinPos.Y1 + float(44);
    fb.X2 = AWinPos.X2 - float(28);
    fb.Y2 = AWinPos.Y2 - float(196);
    ACLQuest = BTACLQuestHK(NewComponent(new class'BTACLQuestHK', fb));
    fb.X1 = 14.0;
    fb.Y1 = 324.0;
    fb.X2 = 602.0;
    fb.Y2 = 491.0;
    LabelQuestDesc = BTLabelQuestDescHK(NewComponent(new class'BTLabelQuestDescHK', fb));
    ACLQuest.MultiColumnList.__OnClick__Delegate = ACLQuest_OnClick;
    i = 0;
    J0x1a2:
    // End:0x371 [While If]
    if(i < 2)
    {
        fb.X1 = 13.0 + float(i * 103);
        fb.X2 = 116.0 + float(i * 103);
        fb.Y1 = 101.0;
        fb.Y2 = 133.0;
        ButtonTab[i] = NewButtonComponent(fb);
        ButtonTab[i].CaptionDrawType = 4;
        ButtonTab[i].CaptionPadding[1] = 2;
        ButtonTab[i].SetTabButtonFontColor();
        ButtonTab[i].SetBigTabButtonImage();
        // End:0x2a3
        if(i == 0)
        {
            ButtonTab[i].Caption = strButtonTab[0];
        }
        // End:0x2cb
        else
        {
            // End:0x2cb
            if(i == 1)
            {
                ButtonTab[i].Caption = strButtonTab[3];
            }
        }
        TabControl.BindTabButtonAndPanel(ButtonTab[i], ACLQuest);
        ButtonTab[i].__OnClick__Delegate = ButtonTab_OnClick;
        ButtonTab[i].CanvasStyle = 2;
        ButtonTab[i].ButtonID = i;
        TabControl.SetVisiblePanel(0);
        // End:0x360
        if(i == 0)
        {
            ACLQuest.SetVisibleQuestType(0);
        }
        SetLabelQuestDesc(0);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1a2;
    }
    fb.X1 = 606.0;
    fb.Y1 = 463.0;
    fb.X2 = 730.0;
    fb.Y2 = 500.0;
    ButtonClose = NewButtonComponent(fb);
    ButtonClose.SetDefaultButtonImage();
    ButtonClose.SetFontSizeAll(11);
    ButtonClose.Caption = strButtonClose;
    ButtonClose.__OnClick__Delegate = ButtonClose_OnClick;
    ButtonClose.CanvasStyle = 2;
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
}

function GUIComponent GetTopMenuOwner()
{
    // End:0x1b
    if(bSelfTopMenuOwner || MenuOwner == none)
    {
        return self;
    }
    // End:0x2b
    else
    {
        return MenuOwner.GetTopMenuOwner();
    }
}

function bool ButtonClose_OnClick(GUIComponent Sender)
{
    Hide();
    return true;
}

function bool ACLQuest_OnClick(GUIComponent Sender)
{
    // End:0x28
    if(ACLQuest.LastSelectedIndex >= 0)
    {
        SetLabelQuestDesc(ACLQuest.LastSelectedIndex);
    }
    return true;
}

function bool Internal_OnPreDraw(Canvas C)
{
    OnPreDraw(C);
    // End:0x151
    if(bSlidingTabPanel)
    {
        SlideTime -= Controller.RenderDelta * 1.0 + float(1) - SlideTime * SlideMultiplier;
        // End:0x6f
        if(SlideTime <= float(0))
        {
            SlideTime = 0.0;
            bSlidingTabPanel = false;
            SetVisibility(bShowing);
        }
        // End:0xe3
        if(bShowing)
        {
            AWinFrame.X1 = HideAWinFrame.X1 * SlideTime + ShowAWinFrame.X1 * float(1) - SlideTime;
            AWinFrame.X2 = HideAWinFrame.X2 * SlideTime + ShowAWinFrame.X2 * float(1) - SlideTime;
        }
        // End:0x14b
        else
        {
            AWinFrame.X1 = ShowAWinFrame.X1 * SlideTime + HideAWinFrame.X1 * float(1) - SlideTime;
            AWinFrame.X2 = ShowAWinFrame.X2 * SlideTime + HideAWinFrame.X2 * float(1) - SlideTime;
        }
        TraversalApplyAWinPos();
    }
    return true;
}

function SetMatchMaker(wMatchMaker MM)
{
    local int i;

    ACLQuest.RemovePool();
    ACLQuest.RemoveAll();
    MM.SortQuestList(Controller.ViewportOwner.Actor.Level.GameMgr);
    i = 0;
    J0x5d:
    // End:0xc1 [While If]
    if(i < MM.QuestList.Length)
    {
        ACLQuest.AddQuestInfo(MM.QuestList[i].QuestID, MM.QuestList[i].CurrentProgress);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x5d;
    }
    LabelQuestDesc.SetData("", "", "", "", "", "", "");
    // End:0xfa
    if(MM.QuestList.Length > 0)
    {
        SetLabelQuestDesc(0);
    }
}

function Show()
{
    // End:0x16
    if(bVisible || bSlidingTabPanel)
    {
        return;
    }
    SlideTime = 1.0;
    bShowing = true;
    bSlidingTabPanel = true;
    SetVisibility(true);
    PlayerOwner().ClientPlaySound(sound'ui_window_open',,, 6);
}

function Hide()
{
    // End:0x19
    if(bVisible == false || bSlidingTabPanel)
    {
        return;
    }
    SlideTime = 1.0;
    bShowing = false;
    bSlidingTabPanel = true;
    PlayerOwner().ClientPlaySound(sound'ui_window_close',,, 6);
}

function SetLabelQuestDesc(int RowIndex)
{
    local BTAutoColumnListDataHK row;

    // End:0xea
    if(RowIndex >= 0 && RowIndex < ACLQuest.ACLRowList.Length)
    {
        row = ACLQuest.ACLRowList[RowIndex];
        LabelQuestDesc.SetData(row.DataPerColumn[3].strValue, row.DataPerColumn[4].strValue, row.DataPerColumn[2].strValue, row.DataPerColumn[0].strValue, row.DataPerColumn[1].strValue, row.DataPerColumn[5].strValue, row.DataPerColumn[6].strValue);
    }
    // End:0x107
    else
    {
        LabelQuestDesc.SetData("", "", "", "", "", "", "");
    }
}

defaultproperties
{
    TabControl=mTabControl
    strButtonTab[0]="All"
    strButtonTab[1]="Basic Training"
    strButtonTab[2]="Event"
    strButtonTab[3]="Daily"
    strButtonTab[4]="General"
    strButtonTab[5]="Mastery"
    strButtonClose="Close"
    SlideMultiplier=4.0
    bAcceptsInput=true
    OnPreDraw=Internal_OnPreDraw
}