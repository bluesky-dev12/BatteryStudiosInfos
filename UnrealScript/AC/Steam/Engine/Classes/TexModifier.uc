/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\TexModifier.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:2
 *	Properties:4
 *
 *******************************************************************************/
class TexModifier extends Modifier
    dependson(Modifier)
    hidecategories(Object,Material)
    native
    noteditinlinenew
    collapsecategories;

enum ETexCoordSrc
{
    TCS_Stream0,
    TCS_Stream1,
    TCS_Stream2,
    TCS_Stream3,
    TCS_Stream4,
    TCS_Stream5,
    TCS_Stream6,
    TCS_Stream7,
    TCS_WorldCoords,
    TCS_CameraCoords,
    TCS_WorldEnvMapCoords,
    TCS_CameraEnvMapCoords,
    TCS_ProjectorCoords,
    TCS_NoChange
};

enum ETexCoordCount
{
    TCN_2DCoords,
    TCN_3DCoords,
    TCN_4DCoords
};

var TexModifier.ETexCoordSrc TexCoordSource;
var() TexModifier.ETexCoordCount TexCoordCount;
var() bool TexCoordProjected;
var int texmodifier_dummy;

defaultproperties
{
    TexCoordSource=13
    MaterialType=4097
}