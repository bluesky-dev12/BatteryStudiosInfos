class BTTPOptionRadioButtonHK extends BTTabPanelHK
    editinlinenew
    instanced;

var float perc;
var export editinline BTRadioOnOffButtonHK ButtonRadio;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int halfW;

    super(GUIPanel).InitComponent(MyController, myOwner);
    halfW = int(float(int(AWinPos.X2 - AWinPos.X1)) * perc);
    ButtonRadio = BTRadioOnOffButtonHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTRadioOnOffButtonHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox()));
    //return;    
}

function ApplyAWinPos()
{
    local int halfW;

    // End:0x0D
    if(ButtonRadio == none)
    {
        return;
    }
    super(GUIComponent).ApplyAWinPos();
    halfW = int(float(int(AWinPos.X2 - AWinPos.X1)) * perc);
    ButtonRadio.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1, AWinPos.Y1, (AWinPos.X1 + float(halfW)) - float(2), AWinPos.Y2);
    ButtonRadio.ApplyAWinPos();
    //return;    
}

defaultproperties
{
    perc=0.5000000
}