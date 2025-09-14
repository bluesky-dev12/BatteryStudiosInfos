class UT2K4SPTab_CustomLadder extends UT2K4SPTab_SingleLadder
    editinlinenew
    instanced;

var string CustomLadderClass;
var int CustomLadderIndex;

function InitComponent(GUIController pMyController, GUIComponent myOwner)
{
    super(UT2K4SPTab_Base).InitComponent(pMyController, myOwner);
    //return;    
}

function InitCustom()
{
    CustomLadderIndex = GP.GetCustomLadder(CustomLadderClass);
    Entries = CreateVButtons(LadderId, LadderTop, LadderLeft, LadderHeight);
    CreateLabels();
    moveMatchInfo(-0.0850000, 0.2500000);
    bInit = true;
    //return;    
}
