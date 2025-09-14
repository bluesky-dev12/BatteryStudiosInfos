/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\PlayerInput.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:26
 *	Functions:13
 *
 *******************************************************************************/
class PlayerInput extends Object within PlayerController
    native
    transient;

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
var float MouseSensitivityActive;
var float MouseSensitivityAim;
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

function bool InvertLook();
event PlayerInput(float DeltaTime)
{
    local float FOVScale, MouseScale;

    // End:0x2a
    if(Outer.bDemoOwner && !Outer.default.bDemoOwner)
    {
        return;
    }
    bEdgeForward = bWasForward ^^ Outer.aBaseY > float(0);
    bEdgeBack = bWasBack ^^ Outer.aBaseY < float(0);
    bEdgeLeft = bWasLeft ^^ Outer.aStrafe < float(0);
    bEdgeRight = bWasRight ^^ Outer.aStrafe > float(0);
    bWasForward = Outer.aBaseY > float(0);
    bWasBack = Outer.aBaseY < float(0);
    bWasLeft = Outer.aStrafe < float(0);
    bWasRight = Outer.aStrafe > float(0);
    // End:0x186
    if(Outer.Pawn != none && Outer.Pawn.bIsAiming && Outer.Pawn.Weapon.WeaponType == 2)
    {
        MouseSensitivityActive = MouseSensitivityAim;
    }
    // End:0x191
    else
    {
        MouseSensitivityActive = MouseSensitivity;
    }
    FOVScale = Outer.DesiredFOV * 0.011110;
    MouseScale = MouseSensitivityActive * FOVScale;
    Outer.aMouseX = SmoothMouse(Outer.aMouseX * MouseScale, DeltaTime, Outer.bXAxis, 0);
    Outer.aMouseY = SmoothMouse(Outer.aMouseY * MouseScale, DeltaTime, Outer.bYAxis, 1);
    Outer.aMouseX = AccelerateMouse(Outer.aMouseX);
    Outer.aMouseY = AccelerateMouse(Outer.aMouseY);
    Outer.aLookUp *= FOVScale;
    Outer.aTurn *= FOVScale;
    // End:0x2f8
    if(Outer.bStrafe != 0)
    {
        Outer.aStrafe += Outer.aBaseX * 7.50 + Outer.aMouseX;
    }
    // End:0x32d
    else
    {
        Outer.aTurn += Outer.aBaseX * FOVScale + Outer.aMouseX;
    }
    Outer.aBaseX = 0.0;
    // End:0x3ce
    if(Outer.bStrafe == 0 && Outer.bAlwaysMouseLook || Outer.bLook != 0)
    {
        // End:0x3ad
        if(bInvertMouse)
        {
            Outer.aLookUp -= Outer.aMouseY;
        }
        // End:0x3cb
        else
        {
            Outer.aLookUp += Outer.aMouseY;
        }
    }
    // End:0x3ec
    else
    {
        Outer.aForward += Outer.aMouseY;
    }
    // End:0x427
    if(Outer.bSnapLevel != 0)
    {
        Outer.bCenterView = true;
        Outer.bKeyboardLook = false;
    }
    // End:0x4ac
    else
    {
        // End:0x462
        if(Outer.aLookUp != float(0))
        {
            Outer.bCenterView = false;
            Outer.bKeyboardLook = true;
        }
        // End:0x4ac
        else
        {
            // End:0x4ac
            if(Outer.bSnapToLevel && !Outer.bAlwaysMouseLook)
            {
                Outer.bCenterView = true;
                Outer.bKeyboardLook = false;
            }
        }
    }
    // End:0x502
    if(Outer.bFreeLook != 0)
    {
        Outer.bKeyboardLook = true;
        Outer.aLookUp += 0.50 * Outer.aBaseY * FOVScale;
    }
    // End:0x520
    else
    {
        Outer.aForward += Outer.aBaseY;
    }
    Outer.aBaseY = 0.0;
    Outer.HandleWalking();
}

exec function SetSmoothingMode(byte B)
{
    MouseSmoothingMode = B;
}

exec function SetSmoothingStrength(float f)
{
    MouseSmoothingStrength = FClamp(f, 0.0, 1.0);
    default.MouseSmoothingStrength = MouseSmoothingStrength;
}

function float AccelerateMouse(float aMouse)
{
    local float Accel;

    // End:0x15
    if(Abs(aMouse) == float(0))
    {
        return 0.0;
    }
    Accel = MouseAccelThreshold * MouseSensitivity;
    // End:0x7a
    if(Abs(aMouse) < Accel)
    {
        // End:0x5f
        if(Abs(aMouse) < 0.10 * Accel)
        {
            aMouse *= 0.10;
        }
        // End:0x7a
        else
        {
            aMouse = aMouse * Abs(aMouse) / Accel;
        }
    }
    return aMouse;
}

function float SmoothMouse(float aMouse, float DeltaTime, out byte SampleCount, int Index)
{
    local int i, sum;

    // End:0x13
    if(MouseSmoothingMode == 0)
    {
        return aMouse;
    }
    // End:0x11b
    if(aMouse == float(0))
    {
        ZeroTime[Index] += DeltaTime;
        // End:0x7f
        if(ZeroTime[Index] < MouseSamplingTime)
        {
            SamplingTime[Index] += DeltaTime;
            MaybeTime[Index] += DeltaTime;
            aMouse = SmoothedMouse[Index];
        }
        // End:0x118
        else
        {
            // End:0xe9
            if(bAdjustSampling && MouseSamples[Index] > 9)
            {
                SamplingTime[Index] -= MaybeTime[Index];
                MouseSamplingTime = 0.90 * MouseSamplingTime + 0.10 * SamplingTime[Index] / float(MouseSamples[Index]);
            }
            SamplingTime[Index] = 0.0;
            SmoothedMouse[Index] = 0.0;
            MouseSamples[Index] = 0;
        }
    }
    // End:0x208
    else
    {
        MaybeTime[Index] = 0.0;
        // End:0x1c5
        if(SmoothedMouse[Index] != float(0))
        {
            MouseSamples[Index] += SampleCount;
            // End:0x18e
            if(DeltaTime > MouseSamplingTime * float(SampleCount + 1))
            {
                SamplingTime[Index] += MouseSamplingTime * float(SampleCount);
            }
            // End:0x1c2
            else
            {
                SamplingTime[Index] += DeltaTime;
                aMouse = aMouse * DeltaTime / MouseSamplingTime * float(SampleCount);
            }
        }
        // End:0x1dd
        else
        {
            SamplingTime[Index] = 0.50 * MouseSamplingTime;
        }
        SmoothedMouse[Index] = aMouse / float(SampleCount);
        ZeroTime[Index] = 0.0;
    }
    SampleCount = 0;
    // End:0x31a
    if(MouseSmoothingMode > 1)
    {
        // End:0x29e
        if(aMouse == float(0))
        {
            i = 0;
            J0x231:
            // End:0x28d [While If]
            if(i < 3)
            {
                sum += int(float(i + 1) * 0.10);
                aMouse += float(sum) * OldSamples[i];
                OldSamples[i] = 0.0;
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x231;
            }
            OldSamples[3] = 0.0;
        }
        // End:0x31a
        else
        {
            aMouse = 0.40 * aMouse;
            OldSamples[3] = aMouse;
            i = 0;
            J0x2c5:
            // End:0x31a [While If]
            if(i < 3)
            {
                aMouse += float(i + 1) * 0.10 * OldSamples[i];
                OldSamples[i] = OldSamples[i + 1];
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x2c5;
            }
        }
    }
    return aMouse;
}

function UpdateSensitivity(float f, optional bool bZooming)
{
    // End:0x2b
    if(!bZooming)
    {
        MouseSensitivity = FMax(0.0, f);
        default.MouseSensitivity = MouseSensitivity;
    }
    // End:0x48
    else
    {
        MouseSensitivityAim = FMax(0.0, f);
        default.MouseSensitivityAim = MouseSensitivityAim;
    }
}

function UpdateSensitivityForAim(bool bZoom)
{
    // End:0x51
    if(bZoom == true)
    {
        // End:0x43
        if(Outer.Level.GetIsUseMouseRevision())
        {
            MouseSensitivityAim = FMax(0.0, default.MouseSensitivityAim * 0.850);
        }
        // End:0x4e
        else
        {
            MouseSensitivityAim = default.MouseSensitivityAim;
        }
    }
    // End:0x5c
    else
    {
        MouseSensitivity = default.MouseSensitivity;
    }
}

function UpdateAccel(float f)
{
    MouseAccelThreshold = FMax(0.0250, f);
    default.MouseAccelThreshold = MouseAccelThreshold;
}

function UpdateSmoothing(int Mode)
{
    MouseSmoothingMode = byte(Mode);
    default.MouseSmoothingMode = MouseSmoothingMode;
}

function InvertMouse(optional string Invert)
{
    // End:0x1d
    if(Invert != "")
    {
        bInvertMouse = bool(Invert);
    }
    // End:0x2c
    else
    {
        bInvertMouse = !bInvertMouse;
    }
    SaveConfig();
    default.bInvertMouse = bInvertMouse;
}

function ChangeSnapView(bool B)
{
    Outer.bSnapToLevel = B;
}

function Actor.EDoubleClickDir CheckForDoubleClickMove(float DeltaTime)
{
    local Actor.EDoubleClickDir DoubleClickMove, OldDoubleClick;

    // End:0x24
    if(Outer.DoubleClickDir == 5)
    {
        DoubleClickMove = 5;
    }
    // End:0x2c
    else
    {
        DoubleClickMove = 0;
    }
    // End:0x2cb
    if(DoubleClickTime > 0.0)
    {
        // End:0xab
        if(Outer.DoubleClickDir == 5)
        {
            // End:0xa8
            if(Outer.Pawn != none && Outer.Pawn.Physics == 1)
            {
                DoubleClickTimer = 0.0;
                Outer.DoubleClickDir = 6;
            }
        }
        // End:0x202
        else
        {
            // End:0x202
            if(Outer.DoubleClickDir != 6)
            {
                OldDoubleClick = Outer.DoubleClickDir;
                Outer.DoubleClickDir = 0;
                // End:0x111
                if(bEdgeForward && bWasForward)
                {
                    Outer.DoubleClickDir = 3;
                }
                // End:0x186
                else
                {
                    // End:0x139
                    if(bEdgeBack && bWasBack)
                    {
                        Outer.DoubleClickDir = 4;
                    }
                    // End:0x186
                    else
                    {
                        // End:0x161
                        if(bEdgeLeft && bWasLeft)
                        {
                            Outer.DoubleClickDir = 1;
                        }
                        // End:0x186
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
                // End:0x1b6
                if(Outer.DoubleClickDir == 0)
                {
                    Outer.DoubleClickDir = OldDoubleClick;
                }
                // End:0x202
                else
                {
                    // End:0x1ee
                    if(Outer.DoubleClickDir != OldDoubleClick)
                    {
                        DoubleClickTimer = DoubleClickTime + 0.50 * DeltaTime;
                    }
                    // End:0x202
                    else
                    {
                        DoubleClickMove = Outer.DoubleClickDir;
                    }
                }
            }
        }
        // End:0x262
        if(Outer.DoubleClickDir == 6)
        {
            DoubleClickTimer = FMin(DoubleClickTimer - DeltaTime, 0.0);
            // End:0x25f
            if(DoubleClickTimer < -0.350)
            {
                Outer.DoubleClickDir = 0;
                DoubleClickTimer = DoubleClickTime;
            }
        }
        // End:0x2cb
        else
        {
            // End:0x2cb
            if(Outer.DoubleClickDir != 0 && Outer.DoubleClickDir != 5)
            {
                DoubleClickTimer -= DeltaTime;
                // End:0x2cb
                if(DoubleClickTimer < float(0))
                {
                    Outer.DoubleClickDir = 0;
                    DoubleClickTimer = DoubleClickTime;
                }
            }
        }
    }
    return DoubleClickMove;
}

defaultproperties
{
    bAdjustSampling=true
    MouseSmoothingMode=1
    MouseSensitivity=3.0
    MouseSensitivityActive=3.0
    MouseSensitivityAim=3.0
    MouseSamplingTime=0.0091160
    DoubleClickTime=0.250
}