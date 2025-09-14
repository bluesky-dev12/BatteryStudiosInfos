/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\Tab_IADeathMatch.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:2
 *
 *******************************************************************************/
class Tab_IADeathMatch extends Tab_InstantActionBaseRules
    config(User)
    editinlinenew
    instanced;

var config bool LastAutoAdjustSkill;
var localized string GoalScoreText;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    MyGoalScore.MyLabel.Caption = GoalScoreText;
    moCheckBox(Controls[15]).Checked(LastAutoAdjustSkill);
}

function string Play()
{
    LastAutoAdjustSkill = moCheckBox(Controls[15]).IsChecked();
    SaveConfig();
    return super.Play() $ "?AutoAdjust=" $ string(LastAutoAdjustSkill);
}

defaultproperties
{
    GoalScoreText="Kill Limit"
    Controls=// Object reference not set to an instance of an object.
    
}