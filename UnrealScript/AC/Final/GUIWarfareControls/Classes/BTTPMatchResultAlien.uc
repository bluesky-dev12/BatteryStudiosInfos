class BTTPMatchResultAlien extends BTTPMatchResultCommonHK
    editinlinenew
    instanced;

var() automated FloatBox fbAlienModeMark;
var export editinline BTOwnerDrawImageHK LabelAlienModeMark;
var() automated FloatBox fbAlienModeListBack;
var export editinline BTOwnerDrawImageHK LabelAlienModeListBack;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    LabelAlienModeMark = NewLabelComponent(fbAlienModeMark, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.GameResult_AlienMode_Mark);
    LabelAlienModeMark.RenderWeight = 2.0000000;
    LabelAlienModeListBack = NewLabelComponent(fbAlienModeListBack, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.GameResult_AlienMode_List_BG);
    //return;    
}

function SetVisibility(bool bIsVisible)
{
    local int lp1;

    super.SetVisibility(bIsVisible);
    ButtonTopLine[6].SetVisibility(false);
    ButtonTopLine[4].SetVisibility(false);
    lp1 = 0;
    J0x39:

    // End:0xE9 [Loop If]
    if(lp1 < 2)
    {
        LabelTeamResult[lp1].SetVisibility(false);
        LabelSelectACL[lp1].SetVisibility(false);
        LabelTeamLogo[lp1].SetVisibility(false);
        LabelTeamResult[lp1].SetVisibility(false);
        LabelTeamScore[lp1].SetVisibility(false);
        LabelTeamScoreResult[lp1].SetVisibility(false);
        LabelACL[lp1].SetVisibility(false);
        ++lp1;
        // [Loop Continue]
        goto J0x39;
    }
    //return;    
}

defaultproperties
{
    fbAlienModeMark=(X1=12.0000000,Y1=116.0000000,X2=94.0000000,Y2=684.0000000)
    fbAlienModeListBack=(X1=12.0000000,Y1=116.0000000,X2=1024.0000000,Y2=685.0000000)
    fbButtonTopLine[2]=(X1=394.0000000,Y1=98.0000000,X2=571.0000000,Y2=111.0000000)
    fbButtonTopLine[3]=(X1=571.0000000,Y1=98.0000000,X2=721.0000000,Y2=111.0000000)
    fbButtonTopLine[4]=(X1=721.0000000,Y1=98.0000000,X2=759.0000000,Y2=111.0000000)
    fbButtonTopLine[5]=(X1=759.0000000,Y1=98.0000000,X2=794.0000000,Y2=111.0000000)
    ACLMem_ClassName=Class'GUIWarfareControls_Decompressed.BTACLMatchResult2'
}