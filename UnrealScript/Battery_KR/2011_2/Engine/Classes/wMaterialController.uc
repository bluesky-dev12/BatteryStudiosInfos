class wMaterialController extends Actor
    placeable;

enum EMatAction
{
    MTA_SwapShaderDiffuse,          // 0
    MTA_SwapShaderSelfIllum,        // 1
    MTA_SwapShaderSpecular,         // 2
    MTA_SwapCombinerMat1,           // 3
    MTA_SwapCombinerMat2,           // 4
    MTA_NoAction                    // 5
};

enum EMatTickFunc
{
    MTF_PulseConstantColor,         // 0
    MTF_FadeConstantColor,          // 1
    MTF_NoAction                    // 2
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
    // End:0x3B
    if(X < 0.5000000)
    {
        return 2.0000000 * ((X * X) * (3.0000000 - (2.0000000 * X)));        
    }
    else
    {
        return 2.0000000 * (1.0000000 - ((X * X) * (3.0000000 - (2.0000000 * X))));
    }
    //return;    
}

simulated function PostBeginPlay()
{
    tickPtA = 255.0000000;
    tickPtB = 255.0000000;
    //return;    
}

simulated function TickConstantColor(ConstantColor cc, float t)
{
    local float F, Alpha;

    tickAccum += t;
    // End:0x26
    if(tickAccum >= 1.0000000)
    {
        tickAccum = 1.0000000;
    }
    // End:0x6F
    if(int(MatTickFunc) == int(1))
    {
        // End:0x4C
        if(tickAccum >= 1.0000000)
        {
            Disable('Tick');
        }
        Alpha = tickPtA + (tickAccum * (tickPtB - tickPtA));        
    }
    else
    {
        // End:0xE8
        if(int(MatTickFunc) == int(0))
        {
            Alpha = tickPtA + (tickAccum * (tickPtB - tickPtA));
            F = Level.TimeSeconds * MatTickValue;
            F = F - float(int(F));
            Alpha = (Pulse(F)) * Alpha;
        }
    }
    cc.Color.A = byte(Alpha);
    //return;    
}

simulated function Tick(float t)
{
    super.Tick(t);
    // End:0x1D
    if(int(MatTickFunc) == int(2))
    {
        return;
    }
    // End:0x7B
    if(Target.IsA('Shader') && Shader(Target).SpecularityMask.IsA('ConstantColor'))
    {
        TickConstantColor(ConstantColor(Shader(Target).SpecularityMask), t);        
    }
    else
    {
        // End:0xA4
        if(Target.IsA('ConstantColor'))
        {
            TickConstantColor(ConstantColor(Target), t);
        }
    }
    //return;    
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
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

simulated function CombinerAction(Combiner cb)
{
    //return;    
}

simulated event Trigger(Actor Other, Pawn EventInstigator)
{
    local Material tmp;

    // End:0x12
    if(int(MatTriggerAction) == int(5))
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
    else
    {
        // End:0x90
        if(Target.IsA('Combiner'))
        {
            CombinerAction(Combiner(Target));            
        }
        else
        {
            Log("Incompatible material in wMaterialTrigger", 'Warning');
        }
    }
    // End:0x1A1
    if(Target.IsA('Shader') && Shader(Target).SpecularityMask.IsA('ConstantColor'))
    {
        // End:0x13F
        if(triggerOn)
        {
            tickPtA = float(ConstantColor(Shader(Target).SpecularityMask).Color.A);
            tickPtB = 255.0000000;            
        }
        else
        {
            tickPtA = float(ConstantColor(Shader(Target).SpecularityMask).Color.A);
            tickPtB = 0.0000000;
        }
        tickAccum = 0.0000000;
        switch(MatTickFunc)
        {
            // End:0x18F
            case 1:
            // End:0x19E
            case 0:
                Enable('Tick');
                // End:0x1A1
                break;
            // End:0xFFFF
            default:
                break;
        }
    }
    else
    {
        //return;        
    }
}

defaultproperties
{
    MatTriggerAction=5
    MatTickValue=1.0000000
    bNoDelete=true
    RemoteRole=2
}