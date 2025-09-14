class XBoxPlayerInput extends PlayerInput within PlayerController
    transient
    config(User);

const InputMax = 32768;
const NumPresets = 4;
const MaxFilterEntries = 4;

struct LookPreset
{
    var() localized string PresetName;
    var() float HScale;
    var() float HExponent;
    var() float VScale;
    var() float VExponent;
};

var() config float HScale;
var() config float HExponent;
var() config float HLookRateMax;
var() config float VScale;
var() config float VExponent;
var() config float VLookRateMax;
var() config bool bInvertVLook;
var() config bool bLookSpring;
var() float HLook;
var() float VLook;
var() float abx;
var() float abz;
var() float wfor;
var() float wstr;
var() float wafor;
var() float wastr;
var() config LookPreset LookPresets[4];
var() config string SelectedPresetName;
var() float VelScale;
var() float AccelScale;
var() float DampeningFactor;
var() float MinAccelComponent;
var() float ForwardFilter[4];
var() float StrafeFilter[4];

function PlayerInput(float DeltaTime)
{
    local float FOVScale;

    // End:0x2A
    if(int(Outer.bSnapLevel) != 0)
    {
        Outer.bCenterView = true;        
    }
    else
    {
        // End:0x51
        if(Outer.aBaseZ != float(0))
        {
            Outer.bCenterView = false;
        }
    }
    abx = Outer.aBaseX;
    abz = Outer.aBaseZ;
    // End:0x97
    if(bInvertVLook)
    {
        Outer.aBaseZ *= -1.0000000;
    }
    HLook = Remap(Outer.aBaseX, HScale, HExponent, HLookRateMax);
    VLook = Remap(Outer.aBaseZ, VScale, VExponent, VLookRateMax);
    bEdgeForward = bWasForward ^^ (Outer.aBaseY > float(0));
    bEdgeBack = bWasBack ^^ (Outer.aBaseY < float(0));
    bEdgeRight = bWasRight ^^ (Outer.aStrafe > float(0));
    bEdgeLeft = bWasLeft ^^ (Outer.aStrafe < float(0));
    bWasForward = Outer.aBaseY > float(0);
    bWasBack = Outer.aBaseY < float(0);
    bWasRight = Outer.aStrafe > float(0);
    bWasLeft = Outer.aStrafe < float(0);
    Outer.aForward = Outer.aBaseY;
    FOVScale = Outer.DesiredFOV * 0.0100000;
    Outer.aTurn = HLook * FOVScale;
    Outer.aLookUp = VLook * FOVScale;
    Outer.HandleWalking();
    //return;    
}

static function float Remap(float in, float Scale, float Exp, float ratemax)
{
    local float Out;
    local bool bNeg;

    in /= float(32768);
    // End:0x2F
    if(in < float(0))
    {
        bNeg = true;
        in *= -1.0000000;
    }
    Out = (in * Scale) + (in ** Exp);
    // End:0x64
    if(bNeg)
    {
        Out *= -1.0000000;
    }
    Out *= (ratemax / (1.0000000 + Scale));
    return Out;
    //return;    
}

function VelToAccel(float dt)
{
    local Vector X, Y, Z;

    wfor = Outer.aForward * VelScale;
    wstr = Outer.aStrafe * VelScale;
    GetAxes(Outer.Pawn.Rotation, X, Y, Z);
    Outer.aForward = GetComponentAccel(Outer.aForward, X, dt, ForwardFilter);
    Outer.aStrafe = GetComponentAccel(Outer.aStrafe, Y, dt, StrafeFilter);
    wafor = Outer.aForward;
    wastr = Outer.aStrafe;
    //return;    
}

function float GetComponentAccel(float Input, Vector Dir, float dt, out float filter[4], optional bool blog)
{
    local float Speed, Error, output;

    // End:0x20
    if(Input == 0.0000000)
    {
        return FilterOutput(filter, Input);
    }
    Speed = Outer.Pawn.Velocity Dot Dir;
    Error = (Input * VelScale) - Speed;
    output = ((DampeningFactor * Error) * AccelScale) * dt;
    // End:0xB0
    if((sign(output)) != (sign(Input)))
    {
        output = MinAccelComponent * (sign(Input));
    }
    output = FilterOutput(filter, output);
    // End:0x135
    if(blog)
    {
        Log((((((((string(Outer.Level.TimeSeconds) $ "    ") $ string(Input * VelScale)) $ "    ") $ string(Speed)) $ "    ") $ string(Error)) $ "    ") $ string(output));
    }
    return output;
    //return;    
}

function float sign(float in)
{
    // End:0x1E
    if(in != 0.0000000)
    {
        return Abs(in) / in;
    }
    return 0.0000000;
    //return;    
}

function float FilterOutput(out float filter[4], float output)
{
    local int i;
    local float total;

    output /= float(4);
    i = 0;
    J0x12:

    // End:0x57 [Loop If]
    if(i < (4 - 1))
    {
        filter[i] = filter[i + 1];
        total += filter[i];
        i++;
        // [Loop Continue]
        goto J0x12;
    }
    filter[i] = output;
    total += output;
    return total;
    //return;    
}

function bool InvertLook()
{
    bInvertVLook = !bInvertVLook;
    return bInvertVLook;
    //return;    
}

defaultproperties
{
    HExponent=1.0000000
    HLookRateMax=1500.0000000
    VExponent=1.0000000
    VLookRateMax=750.0000000
    bInvertVLook=true
    LookPresets[0]=(PresetName="Linear",HScale=0.0000000,HExponent=1.0000000,VScale=0.0000000,VExponent=1.0000000)
    LookPresets[1]=(PresetName="Exponential",HScale=0.0000000,HExponent=2.0000000,VScale=0.0000000,VExponent=2.0000000)
    LookPresets[2]=(PresetName="Hybrid",HScale=0.5000000,HExponent=4.0000000,VScale=0.5000000,VExponent=4.0000000)
    LookPresets[3]=(PresetName="Custom",HScale=0.5000000,HExponent=4.0000000,VScale=0.5000000,VExponent=4.0000000)
    SelectedPresetName="Hybrid"
    VelScale=0.0134000
    AccelScale=4.6550002
    DampeningFactor=30.0000000
    MinAccelComponent=0.1000000
}