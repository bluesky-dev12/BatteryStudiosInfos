/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4SPTab_CustomLadder.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:2
 *
 *******************************************************************************/
class UT2K4SPTab_CustomLadder extends UT2K4SPTab_SingleLadder
    dependson(UT2K4SPTab_SingleLadder)
    editinlinenew
    instanced;

var string CustomLadderClass;
var int CustomLadderIndex;

function InitComponent(GUIController pMyController, GUIComponent myOwner)
{
    super(UT2K4SPTab_Base).InitComponent(pMyController, myOwner);
}

function InitCustom()
{
    CustomLadderIndex = GP.GetCustomLadder(CustomLadderClass);
    Entries = CreateVButtons(LadderId, LadderTop, LadderLeft, LadderHeight);
    CreateLabels();
    moveMatchInfo(-0.0850, 0.250);
    bInit = true;
}
