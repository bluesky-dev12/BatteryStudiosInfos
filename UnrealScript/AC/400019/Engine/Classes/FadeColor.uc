class FadeColor extends ConstantMaterial
    native
    editinlinenew
    collapsecategories
    hidecategories(Object);

enum EColorFadeType
{
    FC_Linear,                      // 0
    FC_Sinusoidal,                  // 1
    FC_Zigzag                       // 2
};

var() Color Color1;
var() Color Color2;
var() float FadePeriod;
var() float FadePhase;
var() FadeColor.EColorFadeType ColorFadeType;
