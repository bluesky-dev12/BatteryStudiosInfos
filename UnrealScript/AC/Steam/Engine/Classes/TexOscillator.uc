/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\TexOscillator.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Properties:15
 *
 *******************************************************************************/
class TexOscillator extends TexModifier
    hidecategories(Object,Material)
    native
    editinlinenew
    collapsecategories;

enum ETexOscillationType
{
    OT_Pan,
    OT_Stretch,
    OT_StretchRepeat,
    OT_Jitter
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
    UOscillationRate=1.0
    VOscillationRate=1.0
    UOscillationAmplitude=0.10
    VOscillationAmplitude=0.10
}