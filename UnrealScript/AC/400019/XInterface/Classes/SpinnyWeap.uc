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
        J0x1A:

        // End:0x50 [Loop If]
        if(i >= 0)
        {
            // End:0x46
            if(AnimNames[i] == 'crouch')
            {
                AnimNames.Remove(i, 1);
            }
            i++;
            // [Loop Continue]
            goto J0x1A;
        }
    }
    //return;    
}

function Tick(float Delta)
{
    local Rotator NewRot;

    NewRot = Rotation;
    NewRot.Yaw += int((Delta * float(spinRate)) / Level.TimeDilation);
    SetRotation(NewRot);
    CurrentTime += (Delta / Level.TimeDilation);
    // End:0x7B
    if(bPlayRandomAnims && CurrentTime >= NextAnimTime)
    {
        PlayNextAnim();
    }
    //return;    
}

event AnimEnd(int Channel)
{
    super.AnimEnd(Channel);
    PlayAnim(AnimNames[0], 1.0000000 / Level.TimeDilation, 0.2500000 / Level.TimeDilation);
    //return;    
}

function PlayNextAnim()
{
    local name NewAnimName;

    // End:0x1B
    if((Mesh == none) || AnimNames.Length == 0)
    {
        return;
    }
    NewAnimName = AnimNames[Rand(AnimNames.Length)];
    J0x2F:

    // End:0x62 [Loop If]
    if((NewAnimName == 'crouch') && !bPlayCrouches)
    {
        NewAnimName = AnimNames[Rand(AnimNames.Length)];
        // [Loop Continue]
        goto J0x2F;
    }
    PlayAnim(NewAnimName, 1.0000000 / Level.TimeDilation, 0.2500000 / Level.TimeDilation);
    NextAnimTime = CurrentTime + AnimChangeInterval;
    //return;    
}

defaultproperties
{
    spinRate=20000
    bPlayCrouches=true
    AnimChangeInterval=3.0000000
    AnimNames[0]="Idle_Rest"
    AnimNames[1]="crouch"
    AnimNames[2]="AssSmack"
    AnimNames[3]="PThrust"
    AnimNames[4]="ThroatCut"
    AnimNames[5]="gesture_halt"
    AnimNames[6]="gesture_point"
    AnimNames[7]="gesture_beckon"
    DrawType=8
    RemoteRole=0
    LODBias=100000.0000000
    DrawScale=0.5000000
    bUnlit=true
    bAlwaysTick=true
}