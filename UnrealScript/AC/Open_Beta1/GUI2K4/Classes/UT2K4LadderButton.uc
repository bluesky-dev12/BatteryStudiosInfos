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

function SetState(int rung)
{
    //return;    
}

defaultproperties
{
    Position=2
    WinWidth=0.0839250
    WinHeight=0.1136880
    bVisible=false
}