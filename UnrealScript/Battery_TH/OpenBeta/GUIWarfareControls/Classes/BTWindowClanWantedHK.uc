class BTWindowClanWantedHK extends BTWindowHK
    editinlinenew
    instanced;

var localized string strLabel[2];
var() automated FloatBox fbLabel;
var export editinline BTMultiLineEditBoxHK Label;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    Label = BTMultiLineEditBoxHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTMultiLineEditBoxHK', fbLabel));
    Label.bReadOnly = true;
    Label.bActiveCursor = false;
    //return;    
}

function SetData(int curState)
{
    Label.SetText(strLabel[curState]);
    // End:0x5B
    if(curState == 0)
    {
        Label.AWinPos.Y1 = fbLabel.Y1 - float(5);
        Label.ApplyAWinPos();        
    }
    else
    {
        // End:0x93
        if(curState == 1)
        {
            Label.AWinPos.Y1 = fbLabel.Y1;
            Label.ApplyAWinPos();
        }
    }
    //return;    
}

defaultproperties
{
    strLabel[0]="????????????????????????? ?????????????????????????????????????????????????????????????????"
    strLabel[1]="??????????????????????? ???????????????????????"
    fbLabel=(X1=275.0000000,Y1=369.0000000,X2=760.0000000,Y2=400.0000000)
    fbBackgroundImage=(X1=245.0000000,Y1=304.0000000,X2=780.0000000,Y2=465.0000000)
    fbTopLine=(X1=265.0000000,Y1=324.0000000,X2=760.0000000,Y2=350.0000000)
    fbBottomLine=(X1=265.0000000,Y1=401.0000000,X2=760.0000000,Y2=445.0000000)
    fbButtonOK=(X1=391.0000000,Y1=407.0000000,X2=511.0000000,Y2=440.0000000)
    fbButtonCancel=(X1=515.0000000,Y1=407.0000000,X2=635.0000000,Y2=440.0000000)
    strTitle="??????"
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
}