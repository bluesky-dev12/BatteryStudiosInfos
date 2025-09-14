class BTScrollProcess extends Object;

enum E_SCROLL_MOVE_TYPE
{
    E_SMT_SCROLL_X1_LEFT,           // 0
    E_SMT_SCROLL_X2_LEFT,           // 1
    E_SMT_SCROLL_X1_RIGHT,          // 2
    E_SMT_HOLD                      // 3
};

enum E_SCROLL_CHECKEND_TYPE
{
    E_SCT_TIME,                     // 0
    E_SCT_X1_ONLEFT,                // 1
    E_SCT_X2_ONLEFT,                // 2
    E_SCT_WIDTH_LESSVALUE,          // 3
    E_SCT_WIDTH_MOREVALUE           // 4
};

enum E_NEXTANIMATION_ACTION
{
    E_NA_NONE,                      // 0
    E_NA_SET_RIGHT,                 // 1
    E_NA_SET_ORIGIN                 // 2
};

var FloatBox CurrentWinPos;
var FloatBox OriginalWinPos;
var bool bUpdateProcess;
var array<BTScrollProcess.E_SCROLL_MOVE_TYPE> ScrollTypeArray;
var array<float> ScrollDataArray;
var array<BTScrollProcess.E_SCROLL_CHECKEND_TYPE> CheckEndArray;
var array<float> CheckDataArray;
var array<BTScrollProcess.E_NEXTANIMATION_ACTION> NextActionArray;
var int CurrentAnimationNum;
var float CheckHoldTime;
//var delegate<OnNextAnimationStart> __OnNextAnimationStart__Delegate;

delegate OnNextAnimationStart()
{
    //return;    
}

function ClearAnimation()
{
    ScrollTypeArray.Length = 0;
    ScrollDataArray.Length = 0;
    CheckEndArray.Length = 0;
    CheckDataArray.Length = 0;
    NextActionArray.Length = 0;
    InitValue();
    //return;    
}

function AddAnimation(BTScrollProcess.E_SCROLL_MOVE_TYPE _scrollType, float _scrollData, BTScrollProcess.E_SCROLL_CHECKEND_TYPE _check, float _checkData, BTScrollProcess.E_NEXTANIMATION_ACTION _nextAction)
{
    local int inserIndex;

    inserIndex = ScrollTypeArray.Length;
    ScrollTypeArray.Length = ScrollTypeArray.Length + 1;
    ScrollDataArray.Length = ScrollDataArray.Length + 1;
    CheckEndArray.Length = CheckEndArray.Length + 1;
    CheckDataArray.Length = CheckDataArray.Length + 1;
    NextActionArray.Length = NextActionArray.Length + 1;
    ScrollTypeArray[inserIndex] = _scrollType;
    ScrollDataArray[inserIndex] = _scrollData;
    CheckEndArray[inserIndex] = _check;
    CheckDataArray[inserIndex] = _checkData;
    NextActionArray[inserIndex] = _nextAction;
    //return;    
}

function InitValue()
{
    CurrentAnimationNum = 0;
    CheckHoldTime = 0.0000000;
    //return;    
}

function InitAnimation(FloatBox OrigWinPos)
{
    OriginalWinPos = OrigWinPos;
    CurrentWinPos = OriginalWinPos;
    //return;    
}

function FloatBox Process(float DeltaTime)
{
    // End:0xE5
    if(bUpdateProcess && ScrollTypeArray.Length > 0)
    {
        // End:0x59
        if(int(ScrollTypeArray[CurrentAnimationNum]) == int(0))
        {
            CurrentWinPos.X1 = CurrentWinPos.X1 - (ScrollDataArray[CurrentAnimationNum] * DeltaTime);            
        }
        else
        {
            // End:0x9B
            if(int(ScrollTypeArray[CurrentAnimationNum]) == int(1))
            {
                CurrentWinPos.X2 = CurrentWinPos.X2 - (ScrollDataArray[CurrentAnimationNum] * DeltaTime);                
            }
            else
            {
                // End:0xDA
                if(int(ScrollTypeArray[CurrentAnimationNum]) == int(2))
                {
                    CurrentWinPos.X1 = CurrentWinPos.X1 + (ScrollDataArray[CurrentAnimationNum] * DeltaTime);
                }
            }
        }
        CheckEnd(DeltaTime);
    }
    return CurrentWinPos;
    //return;    
}

function CheckEnd(float DeltaTime)
{
    local bool isNextAnimation;

    // End:0x4D
    if(int(CheckEndArray[CurrentAnimationNum]) == int(0))
    {
        CheckHoldTime += DeltaTime;
        // End:0x4A
        if(CheckHoldTime >= CheckDataArray[CurrentAnimationNum])
        {
            CheckHoldTime = 0.0000000;
            isNextAnimation = true;
        }        
    }
    else
    {
        // End:0x9C
        if(int(CheckEndArray[CurrentAnimationNum]) == int(1))
        {
            // End:0x99
            if(CurrentWinPos.X1 <= OriginalWinPos.X1)
            {
                CurrentWinPos.X1 = OriginalWinPos.X1;
                isNextAnimation = true;
            }            
        }
        else
        {
            // End:0xEB
            if(int(CheckEndArray[CurrentAnimationNum]) == int(2))
            {
                // End:0xE8
                if(CurrentWinPos.X2 <= OriginalWinPos.X1)
                {
                    CurrentWinPos.X2 = OriginalWinPos.X1;
                    isNextAnimation = true;
                }                
            }
            else
            {
                // End:0x132
                if(int(CheckEndArray[CurrentAnimationNum]) == int(3))
                {
                    // End:0x12F
                    if((CurrentWinPos.X2 - CurrentWinPos.X1) <= CheckDataArray[CurrentAnimationNum])
                    {
                        isNextAnimation = true;
                    }                    
                }
                else
                {
                    // End:0x176
                    if(int(CheckEndArray[CurrentAnimationNum]) == int(4))
                    {
                        // End:0x176
                        if((CurrentWinPos.X2 - CurrentWinPos.X1) >= CheckDataArray[CurrentAnimationNum])
                        {
                            isNextAnimation = true;
                        }
                    }
                }
            }
        }
    }
    // End:0x1A0
    if(isNextAnimation)
    {
        DoNextAnimation(NextActionArray[CurrentAnimationNum]);
        NextAnimation();
        OnNextAnimationStart();
    }
    //return;    
}

function DoNextAnimation(BTScrollProcess.E_NEXTANIMATION_ACTION _nextAction)
{
    // End:0x3A
    if(int(_nextAction) == int(1))
    {
        CurrentWinPos = OriginalWinPos;
        CurrentWinPos.X1 = CurrentWinPos.X2 - 0.1000000;        
    }
    else
    {
        // End:0x55
        if(int(_nextAction) == int(2))
        {
            CurrentWinPos = OriginalWinPos;
        }
    }
    //return;    
}

function NextAnimation()
{
    CurrentAnimationNum = CurrentAnimationNum + 1;
    // End:0x25
    if(CurrentAnimationNum >= ScrollTypeArray.Length)
    {
        CurrentAnimationNum = 0;
    }
    //return;    
}

static function bool CullString(Canvas C, out string strOutput, string Text, FloatBox fbCheck, FloatBox fbTarget, float fntSize)
{
    local float rW, rH, startGap, textWidthLimit, ellipsisWidth, findWidth,
	    tempH;

    local int i, StartIndex, strCount;
    local string temp;
    local bool bCulled;

    C.BtrTextSize(Text, int(fntSize), rW, rH);
    textWidthLimit = fbTarget.X2 - fbTarget.X1;
    // End:0x1DC
    if(rW > textWidthLimit)
    {
        C.BtrTextSize("", int(fntSize), ellipsisWidth, tempH);
        startGap = float(Max(int(fbTarget.X1 - fbCheck.X1), 0));
        i = 0;
        J0x9C:

        // End:0x113 [Loop If]
        if(i < Len(Text))
        {
            temp = Mid(Text, 0, i);
            C.BtrTextSize(temp, int(fntSize), findWidth, tempH);
            // End:0x109
            if(findWidth >= (startGap - ellipsisWidth))
            {
                StartIndex = i;
                // [Explicit Break]
                goto J0x113;
            }
            i++;
            // [Loop Continue]
            goto J0x9C;
        }
        J0x113:

        strCount = Len(Text) - StartIndex;
        i = 0;
        J0x12E:

        // End:0x1AC [Loop If]
        if(i < Len(Text))
        {
            temp = Mid(Text, StartIndex, i);
            C.BtrTextSize(temp, int(fntSize), findWidth, tempH);
            // End:0x1A2
            if(findWidth >= (textWidthLimit - ellipsisWidth))
            {
                strCount = i - 1;
                // [Explicit Break]
                goto J0x1AC;
            }
            i++;
            // [Loop Continue]
            goto J0x12E;
        }
        J0x1AC:

        strCount = Max(strCount, 1);
        strOutput = Mid(Text, StartIndex, strCount);
        bCulled = true;        
    }
    else
    {
        strOutput = Text;
        bCulled = false;
    }
    return bCulled;
    //return;    
}

defaultproperties
{
    bUpdateProcess=true
}