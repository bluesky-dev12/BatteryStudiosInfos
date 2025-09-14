class Counter extends Triggers;

var() byte NumToCount;
var() bool bShowMessage;
var() localized string CountMessage;
var() localized string CompleteMessage;
var byte OriginalNum;

function BeginPlay()
{
    OriginalNum = NumToCount;
    //return;    
}

function Reset()
{
    NumToCount = OriginalNum;
    //return;    
}

function Trigger(Actor Other, Pawn EventInstigator)
{
    local string S, Num;
    local int i;

    // End:0x18D
    if(int(NumToCount) > 0)
    {
        // End:0x6C
        if(int(--NumToCount) == 0)
        {
            // End:0x54
            if((bShowMessage && CompleteMessage != "") && EventInstigator != none)
            {
                EventInstigator.ClientMessage(CompleteMessage);
            }
            TriggerEvent(Event, Other, EventInstigator);            
        }
        else
        {
            // End:0x18D
            if(bShowMessage && CountMessage != "")
            {
                switch(NumToCount)
                {
                    // End:0x9D
                    case 1:
                        Num = "one";
                        // End:0x113
                        break;
                    // End:0xB0
                    case 2:
                        Num = "two";
                        // End:0x113
                        break;
                    // End:0xC5
                    case 3:
                        Num = "three";
                        // End:0x113
                        break;
                    // End:0xD9
                    case 4:
                        Num = "four";
                        // End:0x113
                        break;
                    // End:0xED
                    case 5:
                        Num = "five";
                        // End:0x113
                        break;
                    // End:0x100
                    case 6:
                        Num = "six";
                        // End:0x113
                        break;
                    // End:0xFFFF
                    default:
                        Num = string(NumToCount);
                        // End:0x113
                        break;
                        break;
                }
                S = CountMessage;
                J0x11E:

                // End:0x16E [Loop If]
                if(InStr(S, "%i") >= 0)
                {
                    i = InStr(S, "%i");
                    S = (Left(S, i) $ Num) $ Mid(S, i + 2);
                    // [Loop Continue]
                    goto J0x11E;
                }
                // End:0x18D
                if(EventInstigator != none)
                {
                    EventInstigator.ClientMessage(S);
                }
            }
        }
    }
    //return;    
}

defaultproperties
{
    NumToCount=2
    CountMessage=" %i ? ? ?? ???..."
    CompleteMessage="??!"
    Texture=Texture'GamePlay_Decompressed.S_Counter'
    bCollideActors=false
}