class PlayerInput extends Object within PlayerController
    transient
    native;

var bool bInvertMouse;
var bool bWasForward;
var bool bWasBack;
var bool bWasLeft;
var bool bWasRight;
var bool bEdgeForward;
var bool bEdgeBack;
var bool bEdgeLeft;
var bool bEdgeRight;
var bool bAdjustSampling;
var byte MouseSmoothingMode;
var float MouseSmoothingStrength;
var float MouseSensitivity;
var float MouseSamplingTime;
var float MouseAccelThreshold;
var float SmoothedMouse[2];
var float ZeroTime[2];
var float SamplingTime[2];
var float MaybeTime[2];
var float OldSamples[4];
var int MouseSamples[2];
var float DoubleClickTimer;
var float DoubleClickTime;
var bool bEnableDodging;

function bool InvertLook()
{
    //return;    
}

event PlayerInput(float DeltaTime)
{
    local float FOVScale, MouseScale;

    // End:0x2A
    if(Outer.bDemoOwner && !Outer.default.bDemoOwner)
    {
        return;
    }
    bEdgeForward = bWasForward ^^ (Outer.aBaseY > float(0));
    bEdgeBack = bWasBack ^^ (Outer.aBaseY < float(0));
    bEdgeLeft = bWasLeft ^^ (Outer.aStrafe < float(0));
    bEdgeRight = bWasRight ^^ (Outer.aStrafe > float(0));
    bWasForward = Outer.aBaseY > float(0);
    bWasBack = Outer.aBaseY < float(0);
    bWasLeft = Outer.aStrafe < float(0);
    bWasRight = Outer.aStrafe > float(0);
    FOVScale = Outer.DesiredFOV * 0.0111100;
    MouseScale = MouseSensitivity * FOVScale;
    Outer.aMouseX = SmoothMouse(Outer.aMouseX * MouseScale, DeltaTime, Outer.bXAxis, 0);
    Outer.aMouseY = SmoothMouse(Outer.aMouseY * MouseScale, DeltaTime, Outer.bYAxis, 1);
    Outer.aMouseX = AccelerateMouse(Outer.aMouseX);
    Outer.aMouseY = AccelerateMouse(Outer.aMouseY);
    Outer.aLookUp *= FOVScale;
    Outer.aTurn *= FOVScale;
    // End:0x281
    if(int(Outer.bStrafe) != 0)
    {
        Outer.aStrafe += ((Outer.aBaseX * 7.5000000) + Outer.aMouseX);        
    }
    else
    {
        Outer.aTurn += ((Outer.aBaseX * FOVScale) + Outer.aMouseX);
    }
    Outer.aBaseX = 0.0000000;
    // End:0x357
    if((int(Outer.bStrafe) == 0) && Outer.bAlwaysMouseLook || int(Outer.bLook) != 0)
    {
        // End:0x336
        if(bInvertMouse)
        {
            Outer.aLookUp -= Outer.aMouseY;            
        }
        else
        {
            Outer.aLookUp += Outer.aMouseY;
        }        
    }
    else
    {
        Outer.aForward += Outer.aMouseY;
    }
    // End:0x3B0
    if(int(Outer.bSnapLevel) != 0)
    {
        Outer.bCenterView = true;
        Outer.bKeyboardLook = false;        
    }
    else
    {
        // End:0x3EB
        if(Outer.aLookUp != float(0))
        {
            Outer.bCenterView = false;
            Outer.bKeyboardLook = true;            
        }
        else
        {
            // End:0x435
            if(Outer.bSnapToLevel && !Outer.bAlwaysMouseLook)
            {
                Outer.bCenterView = true;
                Outer.bKeyboardLook = false;
            }
        }
    }
    // End:0x48B
    if(int(Outer.bFreeLook) != 0)
    {
        Outer.bKeyboardLook = true;
        Outer.aLookUp += ((0.5000000 * Outer.aBaseY) * FOVScale);        
    }
    else
    {
        Outer.aForward += Outer.aBaseY;
    }
    Outer.aBaseY = 0.0000000;
    Outer.HandleWalking();
    //return;    
}

exec function SetSmoothingMode(byte B)
{
    MouseSmoothingMode = B;
    //return;    
}

exec function SetSmoothingStrength(float f)
{
    MouseSmoothingStrength = FClamp(f, 0.0000000, 1.0000000);
    default.MouseSmoothingStrength = MouseSmoothingStrength;
    //return;    
}

function float AccelerateMouse(float aMouse)
{
    local float Accel;

    // End:0x15
    if(Abs(aMouse) == float(0))
    {
        return 0.0000000;
    }
    Accel = MouseAccelThreshold * MouseSensitivity;
    // End:0x7A
    if(Abs(aMouse) < Accel)
    {
        // End:0x5F
        if(Abs(aMouse) < (0.1000000 * Accel))
        {
            aMouse *= 0.1000000;            
        }
        else
        {
            aMouse = (aMouse * Abs(aMouse)) / Accel;
        }
    }
    return aMouse;
    //return;    
}

function float SmoothMouse(float aMouse, float DeltaTime, out byte SampleCount, int Index)
{
    local int i, sum;

    // End:0x13
    if(int(MouseSmoothingMode) == 0)
    {
        return aMouse;
    }
    // End:0x11B
    if(aMouse == float(0))
    {
        ZeroTime[Index] += DeltaTime;
        // End:0x7F
        if(ZeroTime[Index] < MouseSamplingTime)
        {
            SamplingTime[Index] += DeltaTime;
            MaybeTime[Index] += DeltaTime;
            aMouse = SmoothedMouse[Index];            
        }
        else
        {
            // End:0xE9
            if(bAdjustSampling && MouseSamples[Index] > 9)
            {
                SamplingTime[Index] -= MaybeTime[Index];
                MouseSamplingTime = (0.9000000 * MouseSamplingTime) + ((0.1000000 * SamplingTime[Index]) / float(MouseSamples[Index]));
            }
            SamplingTime[Index] = 0.0000000;
            SmoothedMouse[Index] = 0.0000000;
            MouseSamples[Index] = 0;
        }        
    }
    else
    {
        MaybeTime[Index] = 0.0000000;
        // End:0x1C5
        if(SmoothedMouse[Index] != float(0))
        {
            MouseSamples[Index] += int(SampleCount);
            // End:0x18E
            if(DeltaTime > (MouseSamplingTime * float(int(SampleCount) + 1)))
            {
                SamplingTime[Index] += (MouseSamplingTime * float(SampleCount));                
            }
            else
            {
                SamplingTime[Index] += DeltaTime;
                aMouse = (aMouse * DeltaTime) / (MouseSamplingTime * float(SampleCount));
            }            
        }
        else
        {
            SamplingTime[Index] = 0.5000000 * MouseSamplingTime;
        }
        SmoothedMouse[Index] = aMouse / float(SampleCount);
        ZeroTime[Index] = 0.0000000;
    }
    SampleCount = 0;
    // End:0x31A
    if(int(MouseSmoothingMode) > 1)
    {
        // End:0x29E
        if(aMouse == float(0))
        {
            i = 0;
            J0x231:

            // End:0x28D [Loop If]
            if(i < 3)
            {
                sum += int(float(i + 1) * 0.1000000);
                aMouse += (float(sum) * OldSamples[i]);
                OldSamples[i] = 0.0000000;
                i++;
                // [Loop Continue]
                goto J0x231;
            }
            OldSamples[3] = 0.0000000;            
        }
        else
        {
            aMouse = 0.4000000 * aMouse;
            OldSamples[3] = aMouse;
            i = 0;
            J0x2C5:

            // End:0x31A [Loop If]
            if(i < 3)
            {
                aMouse += ((float(i + 1) * 0.1000000) * OldSamples[i]);
                OldSamples[i] = OldSamples[i + 1];
                i++;
                // [Loop Continue]
                goto J0x2C5;
            }
        }
    }
    return aMouse;
    //return;    
}

function UpdateSensitivity(float f)
{
    MouseSensitivity = FMax(0.0000000, f);
    default.MouseSensitivity = MouseSensitivity;
    //return;    
}

function UpdateSensitivityForAim(bool bZoom)
{
    // End:0x45
    if((bZoom == true) && Outer.Level.GetIsUseMouseRevision())
    {
        MouseSensitivity = FMax(0.0000000, default.MouseSensitivity * 0.8500000);        
    }
    else
    {
        MouseSensitivity = default.MouseSensitivity;
    }
    //return;    
}

function UpdateAccel(float f)
{
    MouseAccelThreshold = FMax(0.0250000, f);
    default.MouseAccelThreshold = MouseAccelThreshold;
    //return;    
}

function UpdateSmoothing(int Mode)
{
    MouseSmoothingMode = byte(Mode);
    default.MouseSmoothingMode = MouseSmoothingMode;
    //return;    
}

function InvertMouse(optional string Invert)
{
    // End:0x1D
    if(Invert != "")
    {
        bInvertMouse = bool(Invert);        
    }
    else
    {
        bInvertMouse = !bInvertMouse;
    }
    SaveConfig();
    default.bInvertMouse = bInvertMouse;
    //return;    
}

function ChangeSnapView(bool B)
{
    Outer.bSnapToLevel = B;
    //return;    
}

function Actor.EDoubleClickDir CheckForDoubleClickMove(float DeltaTime)
{
    local Actor.EDoubleClickDir DoubleClickMove, OldDoubleClick;

    // End:0x24
    if(int(Outer.DoubleClickDir) == int(5))
    {
        DoubleClickMove = 5;        
    }
    else
    {
        DoubleClickMove = 0;
    }
    // End:0x2CB
    if(DoubleClickTime > 0.0000000)
    {
        // End:0xAB
        if(int(Outer.DoubleClickDir) == int(5))
        {
            // End:0xA8
            if((Outer.Pawn != none) && int(Outer.Pawn.Physics) == int(1))
            {
                DoubleClickTimer = 0.0000000;
                Outer.DoubleClickDir = 6;
            }            
        }
        else
        {
            // End:0x202
            if(int(Outer.DoubleClickDir) != int(6))
            {
                OldDoubleClick = Outer.DoubleClickDir;
                Outer.DoubleClickDir = 0;
                // End:0x111
                if(bEdgeForward && bWasForward)
                {
                    Outer.DoubleClickDir = 3;                    
                }
                else
                {
                    // End:0x139
                    if(bEdgeBack && bWasBack)
                    {
                        Outer.DoubleClickDir = 4;                        
                    }
                    else
                    {
                        // End:0x161
                        if(bEdgeLeft && bWasLeft)
                        {
                            Outer.DoubleClickDir = 1;                            
                        }
                        else
                        {
                            // End:0x186
                            if(bEdgeRight && bWasRight)
                            {
                                Outer.DoubleClickDir = 2;
                            }
                        }
                    }
                }
                // End:0x1B6
                if(int(Outer.DoubleClickDir) == int(0))
                {
                    Outer.DoubleClickDir = OldDoubleClick;                    
                }
                else
                {
                    // End:0x1EE
                    if(int(Outer.DoubleClickDir) != int(OldDoubleClick))
                    {
                        DoubleClickTimer = DoubleClickTime + (0.5000000 * DeltaTime);                        
                    }
                    else
                    {
                        DoubleClickMove = Outer.DoubleClickDir;
                    }
                }
            }
        }
        // End:0x262
        if(int(Outer.DoubleClickDir) == int(6))
        {
            DoubleClickTimer = FMin(DoubleClickTimer - DeltaTime, 0.0000000);
            // End:0x25F
            if(DoubleClickTimer < -0.3500000)
            {
                Outer.DoubleClickDir = 0;
                DoubleClickTimer = DoubleClickTime;
            }            
        }
        else
        {
            // End:0x2CB
            if((int(Outer.DoubleClickDir) != int(0)) && int(Outer.DoubleClickDir) != int(5))
            {
                DoubleClickTimer -= DeltaTime;
                // End:0x2CB
                if(DoubleClickTimer < float(0))
                {
                    Outer.DoubleClickDir = 0;
                    DoubleClickTimer = DoubleClickTime;
                }
            }
        }
    }
    return DoubleClickMove;
    //return;    
}

defaultproperties
{
    bAdjustSampling=true
    MouseSmoothingMode=1
    MouseSensitivity=3.0000000
    MouseSamplingTime=0.0091160
    DoubleClickTime=0.2500000
}