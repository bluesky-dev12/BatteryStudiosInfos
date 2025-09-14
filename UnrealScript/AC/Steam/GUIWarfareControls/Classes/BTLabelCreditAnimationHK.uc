/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTLabelCreditAnimationHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:5
 *
 *******************************************************************************/
class BTLabelCreditAnimationHK extends BTOwnerDrawImageHK
    editinlinenew
    instanced;

var float LastTimeSeconds;
var float CurrentTop;
var float DeltaMultiplier;
var delegate<OnEndCredit> __OnEndCredit__Delegate;

delegate OnEndCredit();
function DecreaseDelta()
{
    DeltaMultiplier -= float(40);
    // End:0x23
    if(DeltaMultiplier <= float(0))
    {
        DeltaMultiplier = 1.0;
    }
}

function IncreaseDelta()
{
    DeltaMultiplier += float(40);
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIComponent).InitComponent(MyController, myOwner);
    DeltaMultiplier = 70.0;
    CurrentTop = 1024.0;
    LastTimeSeconds = PlayerOwner().Level.TimeSeconds;
}

function Internal_OnRendered(Canvas C)
{
    local bool bEndAnimation;
    local float Delta, LocalTop, CurrentTimeSeconds;

    Log("[BTPageCredit::Internal_OnPreDraw]");
    bEndAnimation = true;
    CurrentTimeSeconds = PlayerOwner().Level.TimeSeconds;
    Delta = CurrentTimeSeconds - LastTimeSeconds;
    class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.img_staff_back, 0.0, 0.0, 1024.0, 768.0);
    CurrentTop -= Delta * DeltaMultiplier;
    LocalTop = CurrentTop;
    // End:0x138
    if(LocalTop >= float(-1024) && LocalTop <= float(1024 * 2))
    {
        class'BTCustomDrawHK'.static.DrawImageScaleWithClipArea(C, class'BTUIResourcePoolHK'.default.img_staff_text, 341.0, LocalTop, 341.0 * float(2), LocalTop + float(1024), 0.0, 0.0, 341.0, 1024.0);
        bEndAnimation = false;
    }
    LocalTop += float(1024);
    // End:0x1d5
    if(LocalTop >= float(-1024) && LocalTop <= float(1024 * 2))
    {
        class'BTCustomDrawHK'.static.DrawImageScaleWithClipArea(C, class'BTUIResourcePoolHK'.default.img_staff_text, 341.0, LocalTop, 341.0 * float(2), LocalTop + float(1024), 341.0, 0.0, 341.0 * float(2), 1024.0);
        bEndAnimation = false;
    }
    LocalTop += float(1024);
    // End:0x278
    if(LocalTop >= float(-1024) && LocalTop <= float(1024 * 2))
    {
        class'BTCustomDrawHK'.static.DrawImageScaleWithClipArea(C, class'BTUIResourcePoolHK'.default.img_staff_text, 341.0, LocalTop, 341.0 * float(2), LocalTop + float(1024), 341.0 * float(2), 0.0, 341.0 * float(3), 1024.0);
        bEndAnimation = false;
    }
    LastTimeSeconds = CurrentTimeSeconds;
    // End:0x296
    if(bEndAnimation)
    {
        OnEndCredit();
    }
}

defaultproperties
{
    OnRendered=Internal_OnRendered
}