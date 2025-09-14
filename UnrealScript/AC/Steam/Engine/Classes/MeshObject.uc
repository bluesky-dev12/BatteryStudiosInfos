/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\MeshObject.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:4
 *
 *******************************************************************************/
class MeshObject extends Object
    native
    abstract;

enum EImpSpaceMode
{
    ISM_Sprite,
    ISM_Fixed,
    ISM_PivotVertical,
    ISM_PivotHorizontal
};

enum EImpDrawMode
{
    IDM_Normal,
    IDM_Fading
};

enum EImpLightMode
{
    ILM_Unlit,
    ILM_PseudoShaded,
    ILM_Uniform
};

enum EMeshSectionMethod
{
    MSM_SmoothOnly,
    MSM_RigidOnly,
    MSM_Mixed,
    MSM_SinglePiece,
    MSM_ForcedRigid
};
