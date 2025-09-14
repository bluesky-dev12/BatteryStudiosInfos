/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTWindowBTTPQuestInfoHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:1
 *
 *******************************************************************************/
class BTWindowBTTPQuestInfoHK extends BTWindowHK
    editinlinenew
    instanced;

var export editinline BTTPQuestInfoHK QuestInfo;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local wMatchMaker MM;

    super.InitComponent(MyController, myOwner);
    QuestInfo = BTTPQuestInfoHK(self.NewComponent(new class'BTTPQuestInfoHK', class'BTCustomDrawHK'.static.MakeFloatBox(0.0, 91.0, 756.0, 515.0), 0.010));
    QuestInfo.ButtonClose.AWinPos = fbButtonOK;
    QuestInfo.ButtonClose.Caption = strOK;
    QuestInfo.ButtonClose.ApplyAWinPos();
    QuestInfo.ButtonClose.__OnClick__Delegate = ButtonOK_OnClick;
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    QuestInfo.SetMatchMaker(MM);
    BackgroundImage.SetVisibility(false);
    TopLine.SetVisibility(false);
    BottomLine.SetVisibility(false);
    ButtonCancel.SetVisibility(false);
    ButtonCancel.bAcceptsInput = false;
    ButtonOK.SetVisibility(false);
    ButtonOK.bAcceptsInput = false;
}

defaultproperties
{
    fbButtonOK=(X1=606.0,Y1=463.0,X2=730.0,Y2=500.0)
    bResizeWidthAllowed=true
    bResizeHeightAllowed=true
    bSetControlsBoundToParent=true
    bSetControlsScaleToParent=true
}