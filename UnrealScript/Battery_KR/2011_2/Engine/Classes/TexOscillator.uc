class TexOscillator extends TexModifier
    native
    editinlinenew
    collapsecategories
    hidecategories(Object,Material);

enum ETexOscillationType
{
    OT_Pan,                         // 0
    OT_Stretch,                     // 1
    OT_StretchRepeat,               // 2
    OT_Jitter                       // 3
};

var() float UOscillationRate;
var() float VOscillationRate;
var() float UOscillationPhase;
var() float VOscillationPhase;
var() float UOscillationAmplitude;
var() float VOscillationAmplitude;
var() TexOscillator.ETexOscillationType UOscillationType;
var() TexOscillator.ETexOscillationType VOscillationType;
var() float UOffset;
var() float VOffset;
var Matrix M;
var float LastSu;
var float LastSv;
var float CurrentUJitter;
var float CurrentVJitter;

defaultproperties
{
    UOscillationRate=1.0000000
    VOscillationRate=1.0000000
    UOscillationAmplitude=0.1000000
    VOscillationAmplitude=0.1000000
}