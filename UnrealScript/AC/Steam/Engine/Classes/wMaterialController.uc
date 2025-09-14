/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wMaterialController.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:2
 *	Properties:10
 *	Functions:7
 *
 *******************************************************************************/
class wMaterialController extends Actor
    placeable;

enum EMatAction
{
    MTA_SwapShaderDiffuse,
    MTA_SwapShaderSelfIllum,
    MTA_SwapShaderSpecular,
    MTA_SwapCombinerMat1,
    MTA_SwapCombinerMat2,
    MTA_NoAction
};

enum EMatTickFunc
{
    MTF_PulseConstantColor,
    MTF_FadeConstantColor,
    MTF_NoAction
};

var() Material Target;
var() Material SwapMaterialA;
var() Material SwapMaterialB;
var() wMaterialController.EMatAction MatTriggerAction;
var() wMaterialController.EMatTickFunc MatTickFunc;
var() float MatTickValue;
var transient float tickAccum;
var transient float tickPtA;
var transient float tickPtB;
var transient bool triggerOn;

simulated function float Pulse(float X)
{
    // End:0x3b
    if(X < 0.50)
    {
        return 2.0 * X * X * 3.0 - 2.0 * X;
    }
    // End:0x6b
    else
    {
        return 2.0 * 1.0 - X * X * 3.0 - 2.0 * X;
    }
}

simulated function PostBeginPlay()
{
    tickPtA = 255.0;
    tickPtB = 255.0;
}

simulated function TickConstantColor(ConstantColor cc, float t)
{
    local float f, Alpha;

    tickAccum += t;
    // End:0x26
    if(tickAccum >= 1.0)
    {
        tickAccum = 1.0;
    }
    // End:0x6f
    if(MatTickFunc == 1)
    {
        // End:0x4c
        if(tickAccum >= 1.0)
        {
            Disable('Tick');
        }
        Alpha = tickPtA + tickAccum * tickPtB - tickPtA;
    }
    // End:0xe8
    else
    {
        // End:0xe8
        if(MatTickFunc == 0)
        {
            Alpha = tickPtA + tickAccum * tickPtB - tickPtA;
            f = Level.TimeSeconds * MatTickValue;
            f = f - float(int(f));
            Alpha = Pulse(f) * Alpha;
        }
    }
    cc.Color.A = byte(Alpha);
}

simulated function Tick(float t)
{
    super.Tick(t);
    // End:0x1d
    if(MatTickFunc == 2)
    {
        return;
    }
    // End:0x7b
    if(Target.IsA('Shader') && Shader(Target).SpecularityMask.IsA('ConstantColor'))
    {
        TickConstantColor(ConstantColor(Shader(Target).SpecularityMask), t);
    }
    // End:0xa4
    else
    {
        // End:0xa4
        if(Target.IsA('ConstantColor'))
        {
            TickConstantColor(ConstantColor(Target), t);
        }
    }
}

simulated function ShaderAction(Shader sh)
{
    switch(MatTriggerAction)
    {
        // End:0x23
        case 2:
            sh.Specular = SwapMaterialA;
            // End:0x26
            break;
        // End:0xffff
        default:
}

simulated function CombinerAction(Combiner cb);
simulated event Trigger(Actor Other, Pawn EventInstigator)
{
    local Material tmp;

    // End:0x12
    if(MatTriggerAction == 5)
    {
        return;
    }
    tmp = SwapMaterialA;
    SwapMaterialA = SwapMaterialB;
    SwapMaterialB = tmp;
    triggerOn = !triggerOn;
    // End:0x69
    if(Target.IsA('Shader'))
    {
        ShaderAction(Shader(Target));
    }
    // End:0xc2
    else
    {
        // End:0x90
        if(Target.IsA('Combiner'))
        {
            CombinerAction(Combiner(Target));
        }
        // End:0xc2
        else
        {
            Log("Incompatible material in wMaterialTrigger", 'Warning');
        }
    }
    // End:0x1a1
    if(Target.IsA('Shader') && Shader(Target).SpecularityMask.IsA('ConstantColor'))
    {
        // End:0x13f
        if(triggerOn)
        {
            tickPtA = float(ConstantColor(Shader(Target).SpecularityMask).Color.A);
            tickPtB = 255.0;
        }
        // End:0x178
        else
        {
            tickPtA = float(ConstantColor(Shader(Target).SpecularityMask).Color.A);
            tickPtB = 0.0;
        }
        tickAccum = 0.0;
        switch(MatTickFunc)
        {
            // End:0x18f
            case 1:
            // End:0x19e
            case 0:
                Enable('Tick');
                // End:0x1a1
                break;
            // End:0xffff
            default:
            }
}

defaultproperties
{
    MatTriggerAction=5
    MatTickValue=1.0
    bNoDelete=true
    RemoteRole=2
}