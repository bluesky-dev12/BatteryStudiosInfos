/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4LadderButton.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:7
 *	Functions:1
 *
 *******************************************************************************/
class UT2K4LadderButton extends GUIGFXButton
    editinlinenew
    instanced;

var UT2K4MatchInfo MatchInfo;
var MapRecord MyMapRecord;
var int MatchIndex;
var int LadderIndex;
var export editinline GUIImage ProgresBar;
var Material PBNormal;
var Material PBActive;

function SetState(int rung);

defaultproperties
{
    Position=2
    WinWidth=0.0839250
    WinHeight=0.1136880
    bVisible=true
}