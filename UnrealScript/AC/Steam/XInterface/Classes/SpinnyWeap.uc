/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\SpinnyWeap.uc
 * Package Imports:
 *	XInterface
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:7
 *	Functions:4
 *
 *******************************************************************************/
class SpinnyWeap extends Actor
    notplaceable;

var() int spinRate;
var() bool bPlayRandomAnims;
var() bool bPlayCrouches;
var() float AnimChangeInterval;
var() array<name> AnimNames;
var float CurrentTime;
var float NextAnimTime;

simulated event PostBeginPlay()
{
    local int i;

    // End:0x50
    if(!bPlayCrouches)
    {
        i = AnimNames.Length - 1;
        J0x1a:
        // End:0x50 [While If]
        if(i >= 0)
        {
            // End:0x46
            if(AnimNames[i] == 'crouch')
            {
                AnimNames.Remove(i, 1);
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x1a;
        }
    }
}

function Tick(float Delta)
{
    local Rotator NewRot;

    NewRot = Rotation;
    NewRot.Yaw += int(Delta * float(spinRate) / Level.TimeDilation);
    SetRotation(NewRot);
    CurrentTime += Delta / Level.TimeDilation;
    // End:0x7b
    if(bPlayRandomAnims && CurrentTime >= NextAnimTime)
    {
        PlayNextAnim();
    }
}

event AnimEnd(int Channel)
{
    super.AnimEnd(Channel);
    PlayAnim(AnimNames[0], 1.0 / Level.TimeDilation, 0.250 / Level.TimeDilation);
}

function PlayNextAnim()
{
    local name NewAnimName;

    // End:0x1b
    if(Mesh == none || AnimNames.Length == 0)
    {
        return;
    }
    NewAnimName = AnimNames[Rand(AnimNames.Length)];
    J0x2f:
    // End:0x62 [While If]
    if(NewAnimName == 'crouch' && !bPlayCrouches)
    {
        NewAnimName = AnimNames[Rand(AnimNames.Length)];
        // This is an implied JumpToken; Continue!
        goto J0x2f;
    }
    PlayAnim(NewAnimName, 1.0 / Level.TimeDilation, 0.250 / Level.TimeDilation);
    NextAnimTime = CurrentTime + AnimChangeInterval;
}

defaultproperties
{
    spinRate=20000
    bPlayCrouches=true
    AnimChangeInterval=3.0
    AnimNames=// Object reference not set to an instance of an object.
    
    DrawType=8
    RemoteRole=0
    LODBias=100000.0
    DrawScale=0.50
    bUnlit=true
    bAlwaysTick=true
}