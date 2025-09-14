class BTOwnerDrawImageScroll extends BTOwnerDrawImageHK
    editinlinenew
    instanced;

var BTScrollProcess ScrollProcess;
var bool CaptionScroll;
var string OriginalCaption;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIComponent).InitComponent(MyController, myOwner);
    CaptionDrawType = 3;
    bCullingText = true;
    ScrollProcess = new Class'GUIWarfareControls_Decompressed.BTScrollProcess';
    ScrollProcess.__OnNextAnimationStart__Delegate = Internal_OnNextAnimationStart;
    //return;    
}

function Left_Hold_Left()
{
    ScrollProcess.ClearAnimation();
    ScrollProcess.InitAnimation(AWinPos);
    ScrollProcess.AddAnimation(0, 150.0000000, 1, 0.0000000, 0);
    ScrollProcess.AddAnimation(3, 0.0000000, 0, 5.0000000, 0);
    ScrollProcess.AddAnimation(1, 150.0000000, 2, 0.0000000, 1);
    ScrollProcess.AddAnimation(3, 0.0000000, 0, 1.0000000, 0);
    ScrollProcess.DoNextAnimation(ScrollProcess.1);
    //return;    
}

function Internal_OnNextAnimationStart()
{
    // End:0x3C
    if(int(ScrollProcess.ScrollTypeArray[ScrollProcess.CurrentAnimationNum]) == int(ScrollProcess.1))
    {
        cullRight = false;        
    }
    else
    {
        cullRight = true;
    }
    //return;    
}

function CaptionLeftRight(Canvas C)
{
    local float StrWidth, StrHeight;

    // End:0x11
    if(OriginalCaption == Caption)
    {
        return;
    }
    OriginalCaption = Caption;
    C.BtrTextSize(Caption, FontSize[0], StrWidth, StrHeight);
    ScrollProcess.ClearAnimation();
    ScrollProcess.InitAnimation(AWinPos);
    ScrollProcess.AddAnimation(0, 50.0000000, 4, StrWidth + float(20), 0);
    ScrollProcess.AddAnimation(3, 0.0000000, 0, 2.0000000, 0);
    ScrollProcess.AddAnimation(2, 50.0000000, 3, AWinPos.X2 - AWinPos.X1, 2);
    ScrollProcess.AddAnimation(3, 0.0000000, 0, 2.0000000, 0);
    bCullingText = true;
    CaptionScroll = true;
    //return;    
}

function Internal_OnRendered(Canvas C)
{
    local FloatBox fbCull;

    // End:0x5D
    if(CaptionScroll)
    {
        fbCull = ScrollProcess.Process(Controller.RenderDelta);
        Class'GUIWarfareControls_Decompressed.BTScrollProcess'.static.CullString(C, Caption, OriginalCaption, fbCull, AWinPos, float(FontSize[0]));
    }
    super.Internal_OnRendered(C);
    //return;    
}
