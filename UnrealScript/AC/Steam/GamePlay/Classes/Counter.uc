/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\Counter.uc
 * Package Imports:
 *	Gameplay
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:8
 *	Functions:3
 *
 *******************************************************************************/
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
}

function Reset()
{
    NumToCount = OriginalNum;
}

function Trigger(Actor Other, Pawn EventInstigator)
{
    local string S, Num;
    local int i;

    // End:0x217
    if(NumToCount > 0)
    {
        // End:0x6c
        if(-- NumToCount == 0)
        {
            // End:0x54
            if(bShowMessage && CompleteMessage != "" && EventInstigator != none)
            {
                EventInstigator.ClientMessage(CompleteMessage);
            }
            TriggerEvent(Event, Other, EventInstigator);
        }
        // End:0x1a9
        else
        {
            // End:0x88
            if(!bShowMessage && CountMessage != "")
            {
            }
            // End:0x1a9
            else
            {
                // End:0x1a9
                if(bShowMessage && CountMessage != "")
                {
                    switch(NumToCount)
                    {
                        // End:0xb9
                        case 1:
                            Num = "one";
                            // End:0x12f
                            break;
                        // End:0xcc
                        case 2:
                            Num = "two";
                            // End:0x12f
                            break;
                        // End:0xe1
                        case 3:
                            Num = "three";
                            // End:0x12f
                            break;
                        // End:0xf5
                        case 4:
                            Num = "four";
                            // End:0x12f
                            break;
                        // End:0x109
                        case 5:
                            Num = "five";
                            // End:0x12f
                            break;
                        // End:0x11c
                        case 6:
                            Num = "six";
                            // End:0x12f
                            break;
                        // End:0xffff
                        default:
                            Num = string(NumToCount);
                            // End:0x12f Break;
                            break;
                    }
                    S = CountMessage;
                    J0x13a:
                    // End:0x18a [While If]
                    if(InStr(S, "%i") >= 0)
                    {
                        i = InStr(S, "%i");
                        S = Left(S, i) $ Num $ Mid(S, i + 2);
                        // This is an implied JumpToken; Continue!
                        goto J0x13a;
                    }
                    // End:0x1a9
                    if(EventInstigator != none)
                    {
                        EventInstigator.ClientMessage(S);
                    }
                }
            }
        }
        // End:0x217
        if(Level.GetMatchMaker().BotTutorial)
        {
            EventInstigator.ClientMessage(string('OnQuest'), 'TutorialEvent');
            PlaySound(CountSound, 0, float(SoundVolume) / 255.0, false, SoundRadius, float(SoundPitch) / 64.0);
            AmbientSound = CountAmbientSound;
        }
    }
}

defaultproperties
{
    NumToCount=2
    CountMessage=" %i ? ? ?? ???..."
    CompleteMessage="??!"
    Texture=Texture'S_Counter'
    bCollideActors=true
}