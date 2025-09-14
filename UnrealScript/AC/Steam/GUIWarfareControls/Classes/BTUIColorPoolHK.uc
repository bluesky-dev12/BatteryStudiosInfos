/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTUIColorPoolHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	Core
 *
 * Stats:
 *	Functions:106
 *
 *******************************************************************************/
class BTUIColorPoolHK extends Object;

static function Color ClanName()
{
    return class'Canvas'.static.MakeColor(232, 247, 182, byte(255));
}

static function Color myName()
{
    return class'Canvas'.static.MakeColor(byte(255), 153, 0, byte(255));
}

static function Color GradeBase()
{
    return class'Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255));
}

static function Color GradeShop_DurabilityX()
{
    return class'Canvas'.static.MakeColor(128, 128, 128, byte(255));
}

static function Color GradeShop()
{
    return class'Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255));
}

static function Color GradeCommon()
{
    return class'Canvas'.static.MakeColor(124, 241, 126, byte(255));
}

static function Color GradeNormal()
{
    return class'Canvas'.static.MakeColor(byte(255), byte(255), 0, byte(255));
}

static function Color GradeHigh()
{
    return class'Canvas'.static.MakeColor(70, 183, 223, byte(255));
}

static function Color GradeRare()
{
    return class'Canvas'.static.MakeColor(byte(255), 153, 0, byte(255));
}

static function Color GradeLegend()
{
    return class'Canvas'.static.MakeColor(181, 157, byte(255), byte(255));
}

static function Color GradePCBang()
{
    return class'Canvas'.static.MakeColor(byte(255), 49, 52, byte(255));
}

static function Color ChatNormal()
{
    return class'Canvas'.static.MakeColor(229, 229, 229, byte(255));
}

static function Color ChatSelf()
{
    return class'Canvas'.static.MakeColor(byte(255), 140, 0, byte(255));
}

static function Color ChatWhisper()
{
    return class'Canvas'.static.MakeColor(227, 40, 227, byte(255));
}

static function Color ChatClan()
{
    return class'Canvas'.static.MakeColor(30, 240, 140, byte(255));
}

static function Color ChatSystem()
{
    return class'Canvas'.static.MakeColor(220, 21, 21, byte(255));
}

static function Color ChatBroadCastItem()
{
    return class'Canvas'.static.MakeColor(220, 220, 0, byte(255));
}

static function Color ChatGhost()
{
    return class'Canvas'.static.MakeColor(165, 130, 95, byte(255));
}

static function Color ChatTeamGhost()
{
    return class'Canvas'.static.MakeColor(140, 170, 110, byte(255));
}

static function Color ChatTeam()
{
    return class'Canvas'.static.MakeColor(160, byte(255), 0, byte(255));
}

static function Color AASLevel3()
{
    return class'Canvas'.static.MakeColor(byte(255), 219, 53, byte(255));
}

static function Color AASLevel7()
{
    return class'Canvas'.static.MakeColor(byte(255), 0, 0, byte(255));
}

static function Color ButtonN()
{
    return class'Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255));
}

static function Color ButtonOn()
{
    return class'Canvas'.static.MakeColor(0, 0, 0, byte(255));
}

static function Color ButtonWatched()
{
    return class'Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255));
}

static function Color ButtonPressed()
{
    return class'Canvas'.static.MakeColor(25, 22, 16, byte(255));
}

static function Color ButtonDisable()
{
    return class'Canvas'.static.MakeColor(139, 138, 130, byte(255));
}

static function Color newButtonN()
{
    return class'Canvas'.static.MakeColor(204, 204, 204, byte(255));
}

static function Color newButtonOn()
{
    return class'Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255));
}

static function Color newButtonWatched()
{
    return class'Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255));
}

static function Color newButtonPressed()
{
    return class'Canvas'.static.MakeColor(102, 102, 102, byte(255));
}

static function Color newButtonDisable()
{
    return class'Canvas'.static.MakeColor(102, 102, 102, byte(255));
}

static function Color ButtonOnShadow()
{
    return class'Canvas'.static.MakeColor(58, 48, 33, 150);
}

static function Color ButtonPressedShadow()
{
    return class'Canvas'.static.MakeColor(187, 161, 73, 100);
}

static function Color BigButtonN()
{
    return class'Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255));
}

static function Color BigButtonOn()
{
    return class'Canvas'.static.MakeColor(0, 0, 0, byte(255));
}

static function Color BigButtonWatched()
{
    return class'Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255));
}

static function Color BigButtonPressed()
{
    return class'Canvas'.static.MakeColor(25, 22, 16, byte(255));
}

static function Color BigButtonDisable()
{
    return class'Canvas'.static.MakeColor(139, 138, 130, byte(255));
}

static function Color BigButtonOnShadow()
{
    return class'Canvas'.static.MakeColor(58, 48, 33, 150);
}

static function Color BigButtonPressedShadow()
{
    return class'Canvas'.static.MakeColor(187, 161, 73, 100);
}

static function Color RadioButtonN()
{
    return class'Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255));
}

static function Color RadioButtonNBold()
{
    return class'Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255));
}

static function Color RadioButtonOn()
{
    return class'Canvas'.static.MakeColor(byte(255), 140, 0, byte(255));
}

static function Color RadioButtonWatched()
{
    return class'Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255));
}

static function Color RadioButtonPressed()
{
    return class'Canvas'.static.MakeColor(byte(255), 140, 0, byte(255));
}

static function Color RadioButtonDisable()
{
    return class'Canvas'.static.MakeColor(165, 130, 95, byte(255));
}

static function Color RadioButtonSelect()
{
    return class'Canvas'.static.MakeColor(byte(255), 140, 0, byte(255));
}

static function Color ButtonPageListN()
{
    return class'Canvas'.static.MakeColor(204, 204, 106, byte(255));
}

static function Color ButtonPageListOn()
{
    return class'Canvas'.static.MakeColor(254, 209, 0, byte(255));
}

static function Color ButtonPageListWatched()
{
    return class'Canvas'.static.MakeColor(204, 204, 106, byte(255));
}

static function Color ButtonPageListPressed()
{
    return class'Canvas'.static.MakeColor(101, 103, 86, byte(255));
}

static function Color ButtonPageListDisable()
{
    return class'Canvas'.static.MakeColor(101, 103, 86, byte(255));
}

static function Color TabButtonN()
{
    return class'Canvas'.static.MakeColor(209, 208, 172, byte(255));
}

static function Color TabButtonOn()
{
    return class'Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255));
}

static function Color TabButtonWatched()
{
    return class'Canvas'.static.MakeColor(209, 208, 172, byte(255));
}

static function Color TabButtonPressed()
{
    return class'Canvas'.static.MakeColor(186, 184, 174, byte(255));
}

static function Color TabButtonDisable()
{
    return class'Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255));
}

static function Color TabButtonN_PaidItem()
{
    return class'Canvas'.static.MakeColor(217, byte(255), 100, byte(255));
}

static function Color TabButtonOn_PaidItem()
{
    return class'Canvas'.static.MakeColor(190, byte(255), 0, byte(255));
}

static function Color TabButtonWatched_PaidItem()
{
    return class'Canvas'.static.MakeColor(190, byte(255), 0, byte(255));
}

static function Color TabButtonPressed_PaidItem()
{
    return class'Canvas'.static.MakeColor(140, 150, 100, byte(255));
}

static function Color TabButtonDisable_PaidItem()
{
    return class'Canvas'.static.MakeColor(111, 111, 111, byte(255));
}

static function Color SubTabButtonN()
{
    return class'Canvas'.static.MakeColor(189, 184, 157, byte(255));
}

static function Color SubTabButtonOn()
{
    return class'Canvas'.static.MakeColor(233, 216, 134, byte(255));
}

static function Color SubTabButtonWatched()
{
    return class'Canvas'.static.MakeColor(233, 216, 134, byte(255));
}

static function Color SubTabButtonPressed()
{
    return class'Canvas'.static.MakeColor(154, 144, 99, byte(255));
}

static function Color SubTabButtonDisable()
{
    return class'Canvas'.static.MakeColor(117, 117, 109, byte(255));
}

static function Color ListTopButtonN()
{
    return class'Canvas'.static.MakeColor(144, 146, 142, byte(255));
}

static function Color ListTopButtonOn()
{
    return class'Canvas'.static.MakeColor(byte(255), 217, 85, byte(255));
}

static function Color ListTopButtonWatched()
{
    return class'Canvas'.static.MakeColor(byte(255), 217, 85, byte(255));
}

static function Color ListTopButtonPressed()
{
    return class'Canvas'.static.MakeColor(135, 120, 69, byte(255));
}

static function Color ListTopButtonDisable()
{
    return class'Canvas'.static.MakeColor(125, 125, 125, byte(255));
}

static function Color QuestReward()
{
    return class'Canvas'.static.MakeColor(byte(255), 153, 0, byte(255));
}

static function Color Cash()
{
    return class'Canvas'.static.MakeColor(2, 198, 254, byte(255));
}

static function Color Point()
{
    return class'Canvas'.static.MakeColor(178, 233, 31, byte(255));
}

static function Color SmallPerc()
{
    return class'Canvas'.static.MakeColor(byte(255), 140, 63, byte(255));
}

static function Color Damage0()
{
    return class'Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255));
}

static function Color Damage1()
{
    return class'Canvas'.static.MakeColor(124, 241, 126, byte(255));
}

static function Color Damage2()
{
    return class'Canvas'.static.MakeColor(70, 183, 223, byte(255));
}

static function Color Damage3()
{
    return class'Canvas'.static.MakeColor(154, 84, 0, byte(255));
}

static function Color Damage4()
{
    return class'Canvas'.static.MakeColor(byte(255), 49, 52, byte(255));
}

static function Color LabelWarning()
{
    return class'Canvas'.static.MakeColor(byte(255), 49, 52, byte(255));
}

static function Color InverseLabelWarning()
{
    return class'Canvas'.static.MakeColor(52, 49, byte(255), byte(255));
}

static function Color DefaultWhite()
{
    return class'Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255));
}

static function Color DefaultShadow()
{
    return class'Canvas'.static.MakeColor(0, 0, 0, 200);
}

static function Color DefaultGray()
{
    return class'Canvas'.static.MakeColor(128, 128, 128, byte(255));
}

static function Color DefaultRed()
{
    return class'Canvas'.static.MakeColor(byte(255), 0, 0, byte(255));
}

static function Color ItemUIStatus_Normal()
{
    return class'Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255));
}

static function Color ItemUIStatus_Plus()
{
    return class'Canvas'.static.MakeColor(144, byte(255), 0, byte(255));
}

static function Color ItemUIStatus_Minus()
{
    return class'Canvas'.static.MakeColor(byte(255), 0, 0, byte(255));
}

static function Color ListItem_Normal()
{
    return class'Canvas'.static.MakeColor(180, 190, 170, byte(255));
}

static function Color ListItem_On()
{
    return class'Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255));
}

static function Color ListItem_Select()
{
    return class'Canvas'.static.MakeColor(153, 155, 88, byte(255));
}

static function Color ListItem_Disable()
{
    return class'Canvas'.static.MakeColor(117, 117, 109, byte(255));
}

static function Color CompletedQuest_Title()
{
    return class'Canvas'.static.MakeColor(190, 230, 0, byte(255));
}

static function Color CompletedQuest_Content()
{
    return class'Canvas'.static.MakeColor(byte(255), 216, 0, byte(255));
}

static function Color CompletedQuest_Reward()
{
    return class'Canvas'.static.MakeColor(190, 230, 0, byte(255));
}

static function Color NewQuest_Title()
{
    return class'Canvas'.static.MakeColor(250, 220, 140, byte(255));
}

static function Color NewQuest_Content()
{
    return class'Canvas'.static.MakeColor(230, 230, 220, byte(255));
}

static function Color NewQuest_Reward()
{
    return class'Canvas'.static.MakeColor(250, 220, 140, byte(255));
}

static function Color FriendlyUserNameN()
{
    return class'Canvas'.static.MakeColor(162, 207, 41, byte(255));
}

static function Color FriendlyUserNameOn()
{
    return class'Canvas'.static.MakeColor(196, byte(255), 38, byte(255));
}

static function Color FriendlyUserNamePressed()
{
    return class'Canvas'.static.MakeColor(111, 131, 57, byte(255));
}

static function Color FriendlyUserNameSelected()
{
    return class'Canvas'.static.MakeColor(216, 254, 102, byte(255));
}

static function Color FriendlyUserNameDisable()
{
    return class'Canvas'.static.MakeColor(126, 133, 107, byte(255));
}
