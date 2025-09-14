/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\FadeColor.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Properties:5
 *
 *******************************************************************************/
class FadeColor extends ConstantMaterial
    hidecategories(Object)
    native
    editinlinenew
    collapsecategories;

enum EColorFadeType
{
    FC_Linear,
    FC_Sinusoidal,
    FC_Zigzag
};

var() Color Color1;
var() Color Color2;
var() float FadePeriod;
var() float FadePhase;
var() FadeColor.EColorFadeType ColorFadeType;
