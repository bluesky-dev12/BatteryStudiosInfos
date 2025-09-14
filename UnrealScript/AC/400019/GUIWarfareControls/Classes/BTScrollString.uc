class BTScrollString extends Object;

var BTScrollProcess ScrollProcess;
var bool cullRight;
var string OriginalCaption;
var FloatBox fbCull;

function InitValue()
{
    ScrollProcess = new Class'GUIWarfareControls_Decompressed.BTScrollProcess';
    ScrollProcess.__OnNextAnimationStart__Delegate = Internal_OnNextAnimationStart;
    //return;    
}

function ProcessScrollPoint(Canvas C, out string outputString, string OriginString, float X1, float Y1, float X2, float Y2, bool bOn, float FontSize, float fDelta)
{
    local FloatBox fbTemp;

    fbTemp.X1 = X1;
    fbTemp.Y1 = Y1;
    fbTemp.X2 = X2;
    fbTemp.Y2 = Y2;
    ProcessScroll(C, outputString, OriginString, fbTemp, bOn, FontSize, fDelta);
    //return;    
}

function ProcessScroll(Canvas C, out string outputString, string OriginString, FloatBox originPos, bool bOn, float FontSize, float fDelta)
{
    CaptionLeftRight(C, OriginString, originPos, FontSize);
    // End:0x51
    if(bOn)
    {
        ScrollProcess.bUpdateProcess = true;
        fbCull = ScrollProcess.Process(fDelta);        
    }
    else
    {
        ScrollProcess.DoNextAnimation(2);
        ScrollProcess.InitValue();
        ScrollProcess.bUpdateProcess = false;
        fbCull = originPos;
        cullRight = true;
        outputString = OriginalCaption;
    }
    Class'GUIWarfareControls_Decompressed.BTScrollProcess'.static.CullString(C, outputString, OriginalCaption, fbCull, originPos, FontSize);
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

function CaptionLeftRight(Canvas C, string Caption, FloatBox originPos, float FontSize)
{
    local float StrWidth, StrHeight;

    // End:0x11
    if(OriginalCaption == Caption)
    {
        return;
    }
    OriginalCaption = Caption;
    C.BtrTextSize(Caption, int(FontSize), StrWidth, StrHeight);
    ScrollProcess.ClearAnimation();
    ScrollProcess.InitAnimation(originPos);
    ScrollProcess.AddAnimation(0, 50.0000000, 4, StrWidth + float(20), 0);
    ScrollProcess.AddAnimation(3, 0.0000000, 0, 2.0000000, 0);
    ScrollProcess.AddAnimation(2, 50.0000000, 3, originPos.X2 - originPos.X1, 2);
    ScrollProcess.AddAnimation(3, 0.0000000, 0, 2.0000000, 0);
    //return;    
}

defaultproperties
{
    cullRight=true
}