/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\Combiner.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:2
 *	Properties:9
 *
 *******************************************************************************/
class Combiner extends Material
    hidecategories(Object)
    native
    editinlinenew
    collapsecategories;

enum EColorOperation
{
    CO_Use_Color_From_Material1,
    CO_Use_Color_From_Material2,
    CO_Multiply,
    CO_Add,
    CO_Subtract,
    CO_AlphaBlend_With_Mask,
    CO_Add_With_Mask_Modulation,
    CO_Use_Color_From_Mask
};

enum EAlphaOperation
{
    AO_Use_Mask,
    AO_Multiply,
    AO_Add,
    AO_Use_Alpha_From_Material1,
    AO_Use_Alpha_From_Material2
};

var int combiner_dummy;
var() Combiner.EColorOperation CombineOperation;
var() Combiner.EAlphaOperation AlphaOperation;
var() editinlineuse Material Material1;
var() editinlineuse Material Material2;
var() editinlineuse Material Mask;
var() bool InvertMask;
var() bool Modulate2X;
var() bool Modulate4X;

defaultproperties
{
    MaterialType=2
}