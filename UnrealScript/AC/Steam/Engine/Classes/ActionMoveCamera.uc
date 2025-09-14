/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\ActionMoveCamera.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Properties:1
 *
 *******************************************************************************/
class ActionMoveCamera extends MatAction
    native
    config();

enum EPathStyle
{
    PATHSTYLE_Linear,
    PATHSTYLE_Bezier
};

var(Path) config ActionMoveCamera.EPathStyle PathStyle;
