class BTLabelCreditAnimationHK extends BTOwnerDrawImageHK
    editinlinenew
    instanced;

var float LastTimeSeconds;
var float CurrentTop;
var float DeltaMultiplier;
//var delegate<OnEndCredit> __OnEndCredit__Delegate;

delegate OnEndCredit()
{
    //return;    
}

function DecreaseDelta()
{
    DeltaMultiplier -= float(40);
    // End:0x23
    if(DeltaMultiplier <= float(0))
    {
        DeltaMultiplier = 1.0000000;
    }
    //return;    
}

function IncreaseDelta()
{
    DeltaMultiplier += float(40);
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIComponent).InitComponent(MyController, myOwner);
    DeltaMultiplier = 70.0000000;
    CurrentTop = 1024.0000000;
    LastTimeSeconds = PlayerOwner().Level.TimeSeconds;
    //return;    
}

function Internal_OnRendered(Canvas C)
{
    local bool bEndAnimation;
    local float Delta, LocalTop, CurrentTimeSeconds;

    Log("[BTPageCredit::Internal_OnPreDraw]");
    bEndAnimation = true;
    CurrentTimeSeconds = PlayerOwner().Level.TimeSeconds;
    Delta = CurrentTimeSeconds - LastTimeSeconds;
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_staff_back, 0.0000000, 0.0000000, 1024.0000000, 768.0000000);
    CurrentTop -= (Delta * DeltaMultiplier);
    LocalTop = CurrentTop;
    // End:0x138
    if((LocalTop >= float(-1024)) && LocalTop <= float(1024 * 2))
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImageScaleWithClipArea(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_staff_text, 341.0000000, LocalTop, 341.0000000 * float(2), LocalTop + float(1024), 0.0000000, 0.0000000, 341.0000000, 1024.0000000);
        bEndAnimation = false;
    }
    LocalTop += float(1024);
    // End:0x1D5
    if((LocalTop >= float(-1024)) && LocalTop <= float(1024 * 2))
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImageScaleWithClipArea(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_staff_text, 341.0000000, LocalTop, 341.0000000 * float(2), LocalTop + float(1024), 341.0000000, 0.0000000, 341.0000000 * float(2), 1024.0000000);
        bEndAnimation = false;
    }
    LocalTop += float(1024);
    // End:0x278
    if((LocalTop >= float(-1024)) && LocalTop <= float(1024 * 2))
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImageScaleWithClipArea(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_staff_text, 341.0000000, LocalTop, 341.0000000 * float(2), LocalTop + float(1024), 341.0000000 * float(2), 0.0000000, 341.0000000 * float(3), 1024.0000000);
        bEndAnimation = false;
    }
    LastTimeSeconds = CurrentTimeSeconds;
    // End:0x296
    if(bEndAnimation)
    {
        OnEndCredit();
    }
    //return;    
}

defaultproperties
{
    OnRendered=BTLabelCreditAnimationHK.Internal_OnRendered
}