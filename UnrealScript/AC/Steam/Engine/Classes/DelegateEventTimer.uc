/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\DelegateEventTimer.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:1
 *
 *******************************************************************************/
class DelegateEventTimer extends DelegateObject
    dependson(DelegateObject);

var int Data_Int[3];
var string Data_String[3];
var delegate<OnEventTimer> __OnEventTimer__Delegate;

delegate OnEventTimer(int Index);
