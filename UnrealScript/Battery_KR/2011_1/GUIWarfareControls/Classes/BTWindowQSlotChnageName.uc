class BTWindowQSlotChnageName extends BTWindow
    editinlinenew
    instanced;

var() automated GUIButton ButtonOK;
var() automated GUIButton ButtonCancel;
var() automated BTTailImage ButtonTail[2];
var() automated BTInputImage ImgTitleBG;
var() automated FloatingImage ImgTitleString;
var() automated FloatingImage ImgWnd_BG;
var() automated BTInputImage ImgEditBoxBG[5];
var() automated GUIEditBox EditBoxName[5];
var() automated GUILabel LabelStrings[5];
//var delegate<OnOK> __OnOK__Delegate;

delegate bool OnOK(GUIComponent Sender)
{
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local wMyPlayerStatus MyStatus;
    local int i;

    super(FloatingWindow).InitComponent(MyController, myOwner);
    MyStatus = Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer;
    i = 0;
    J0x4F:

    // End:0x93 [Loop If]
    if(i < 5)
    {
        EditBoxName[i].SetText(MyStatus.QuickSlotList[i].strName);
        i++;
        // [Loop Continue]
        goto J0x4F;
    }
    //return;    
}

function ResetComponents()
{
    //return;    
}

event Opened(GUIComponent Sender)
{
    super.Opened(Sender);
    FocusFirst(none);
    //return;    
}

function Closed(GUIComponent Sender, bool bCancelled)
{
    super.Closed(Sender, bCancelled);
    //return;    
}

function bool InternalOnKeyEvent(out byte key, out byte State, float Delta)
{
    return false;
    //return;    
}

function InternalOnCreateComponent(GUIComponent NewComp, GUIComponent Sender)
{
    super(FloatingWindow).InternalOnCreateComponent(NewComp, Sender);
    //return;    
}

function bool ButtonOK_OnClick(GUIComponent Sender)
{
    local wMyPlayerStatus MyStatus;
    local int i;

    MyStatus = Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer;
    i = 0;
    J0x3F:

    // End:0x84 [Loop If]
    if(i < 5)
    {
        MyStatus.QuickSlotList[i].strName = EditBoxName[i].GetText();
        i++;
        // [Loop Continue]
        goto J0x3F;
    }
    return OnOK(self);
    //return;    
}

function bool ButtonCancel_OnClick(GUIComponent Sender)
{
    Controller.CloseMenu(false);
    return true;
    //return;    
}

defaultproperties
{
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bMoveAllowed=false
    DefaultLeft=0.3339844
    DefaultTop=0.3528646
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
    bPersistent=true
    bAllowedAsLast=true
    InactiveFadeColor=(R=60,G=60,B=60,A=255)
    WinTop=0.3528646
    WinLeft=0.3339844
    WinWidth=0.3320312
    WinHeight=0.3072917
}