class Counter extends Triggers;

var() byte NumToCount;
var() bool bShowMessage;
var() localized string CountMessage;
var() localized string CompleteMessage;
var byte OriginalNum;
var(CounterSounds) Sound CountSound;
var(CounterSounds) Sound CountAmbientSound;
var(CounterSounds) Sound LoopSound;

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

    // End:0x1EB
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
            // End:0x88
            if(!bShowMessage && CountMessage != "")
            {                
            }
            else
            {
                // End:0x1A9
                if(bShowMessage && CountMessage != "")
                {
                    switch(NumToCount)
                    {
                        // End:0xB9
                        case 1:
                            Num = "one";
                            // End:0x12F
                            break;
                        // End:0xCC
                        case 2:
                            Num = "two";
                            // End:0x12F
                            break;
                        // End:0xE1
                        case 3:
                            Num = "three";
                            // End:0x12F
                            break;
                        // End:0xF5
                        case 4:
                            Num = "four";
                            // End:0x12F
                            break;
                        // End:0x109
                        case 5:
                            Num = "five";
                            // End:0x12F
                            break;
                        // End:0x11C
                        case 6:
                            Num = "six";
                            // End:0x12F
                            break;
                        // End:0xFFFF
                        default:
                            Num = string(NumToCount);
                            // End:0x12F
                            break;
                            break;
                    }
                    S = CountMessage;
                    J0x13A:

                    // End:0x18A [Loop If]
                    if(InStr(S, "%i") >= 0)
                    {
                        i = InStr(S, "%i");
                        S = (Left(S, i) $ Num) $ Mid(S, i + 2);
                        // [Loop Continue]
                        goto J0x13A;
                    }
                    // End:0x1A9
                    if(EventInstigator != none)
                    {
                        EventInstigator.ClientMessage(S);
                    }
                }
            }
        }
        // End:0x1EB
        if(Level.GetMatchMaker().BotTutorial)
        {
            EventInstigator.ClientMessage(string('OnQuest'), 'TutorialEvent');
            AmbientSound = CountAmbientSound;
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