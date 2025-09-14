class TexRotator extends TexModifier
    native
    editinlinenew
    collapsecategories
    hidecategories(Object,Material);

enum ETexRotationType
{
    TR_FixedRotation,               // 0
    TR_ConstantlyRotating,          // 1
    TR_OscillatingRotation          // 2
};

var Matrix M;
var() TexRotator.ETexRotationType TexRotationType;
var() Rotator Rotation;
var deprecated bool ConstantRotation;
var() float UOffset;
var() float VOffset;
var() Rotator OscillationRate;
var() Rotator OscillationAmplitude;
var() Rotator OscillationPhase;
