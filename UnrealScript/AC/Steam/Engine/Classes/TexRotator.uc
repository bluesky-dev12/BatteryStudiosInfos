/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\TexRotator.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Properties:9
 *
 *******************************************************************************/
class TexRotator extends TexModifier
    hidecategories(Object,Material)
    native
    editinlinenew
    collapsecategories;

enum ETexRotationType
{
    TR_FixedRotation,
    TR_ConstantlyRotating,
    TR_OscillatingRotation
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
