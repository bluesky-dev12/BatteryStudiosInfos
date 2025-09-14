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
    //return;    
}

function string Play()
{
    LastAutoAdjustSkill = moCheckBox(Controls[15]).IsChecked();
    SaveConfig();
    return (super.Play() $ "?AutoAdjust=") $ string(LastAutoAdjustSkill);
    //return;    
}

defaultproperties
{
    GoalScoreText="Frag Limit"
    Controls[0]=GUIImage'XInterface_Decompressed.Tab_InstantActionBaseRules.IARulesBK1'
    Controls[1]=GUIImage'XInterface_Decompressed.Tab_InstantActionBaseRules.IARulesBK2'
    Controls[2]=GUIImage'XInterface_Decompressed.Tab_InstantActionBaseRules.IARulesBK3'
    Controls[3]=GUILabel'XInterface_Decompressed.Tab_InstantActionBaseRules.IARulesGameSpeedLabel'
    Controls[4]=GUISlider'XInterface_Decompressed.Tab_InstantActionBaseRules.IARulesGameSpeedSlider'
    Controls[5]=moCheckBox'XInterface_Decompressed.Tab_InstantActionBaseRules.IARulesWeaponStay'
    Controls[6]=moCheckBox'XInterface_Decompressed.Tab_InstantActionBaseRules.IARulesTranslocator'
    Controls[7]=GUILabel'XInterface_Decompressed.Tab_InstantActionBaseRules.IARulesFriendlyFireLabel'
    Controls[8]=GUISlider'XInterface_Decompressed.Tab_InstantActionBaseRules.IARulesFriendlyFireSlider'
    Controls[9]=moNumericEdit'XInterface_Decompressed.Tab_InstantActionBaseRules.IARulesGoalScore'
    Controls[10]=moNumericEdit'XInterface_Decompressed.Tab_InstantActionBaseRules.IARulesTimeLimit'
    Controls[11]=moNumericEdit'XInterface_Decompressed.Tab_InstantActionBaseRules.IARulesMaxLives'
    Controls[12]=moCheckBox'XInterface_Decompressed.Tab_InstantActionBaseRules.IARulesAllowWeaponThrow'
    Controls[13]=moCheckBox'XInterface_Decompressed.Tab_InstantActionBaseRules.IARulesBrightSkins'
    // Reference: GUIImage'XInterface_Decompressed.Tab_IADeathMatch.IARulesBK4'
    begin object name="IARulesBK4" class=XInterface_Decompressed.GUIImage
        ImageColor=(R=255,G=255,B=255,A=160)
        ImageStyle=1
        WinTop=0.7854300
        WinLeft=0.0216410
        WinWidth=0.9575000
        WinHeight=0.1560160
    end object
    Controls[14]=IARulesBK4
    // Reference: moCheckBox'XInterface_Decompressed.Tab_IADeathMatch.IARulesAutoAdjustSkill'
    begin object name="IARulesAutoAdjustSkill" class=XInterface_Decompressed.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="Auto-Adjust Skill"
        OnCreateComponent=IARulesAutoAdjustSkill.InternalOnCreateComponent
        Hint="When enabled, bots will adjust their skill to match yours."
        WinTop=0.8582950
        WinLeft=0.3750000
        WinWidth=0.2500000
        WinHeight=0.1560160
    end object
    Controls[15]=IARulesAutoAdjustSkill
}