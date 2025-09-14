/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\MatSubAction.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Properties:8
 *
 *******************************************************************************/
class MatSubAction extends MatObject
    dependson(MatObject)
    native
    editinlinenew
    abstract;

enum ESAStatus
{
    SASTATUS_Waiting,
    SASTATUS_Running,
    SASTATUS_Ending,
    SASTATUS_Expired
};

var(Time) float Delay;
var(Time) float Duration;
var Texture Icon;
var MatSubAction.ESAStatus Status;
var localized string Desc;
var transient float PctStarting;
var transient float PctEnding;
var transient float PctDuration;

defaultproperties
{
    Desc="N/A"
}