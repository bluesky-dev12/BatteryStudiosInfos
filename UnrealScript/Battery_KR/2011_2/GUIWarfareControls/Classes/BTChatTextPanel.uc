class BTChatTextPanel extends GUITabPanel
    editinlinenew
    instanced;

var() automated GUIScrollTextBox TextBox;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(MyController, myOwner);
    TextBox.SetScrollBarStyle(true, new Class'GUIWarfareStyles.STY2WarfareScrollZone', true, new Class'GUIWarfareStyles.STY2WarfareScrollIncreaseButton', true, none, true, new Class'GUIWarfareStyles.STY2WarfareScrollDecreaseButton', true, none, true, new Class'GUIWarfareStyles.STY2WarfareScrollGripButton');
    //return;    
}

function AppendText(coerce string txt)
{
    TextBox.AddText(txt);
    //return;    
}

function Clear()
{
    TextBox.SetContent("");
    //return;    
}

defaultproperties
{
    // Reference: GUIScrollTextBox'GUIWarfareControls_Decompressed.BTChatTextPanel.mTextBox'
    begin object name="mTextBox" class=XInterface.GUIScrollTextBox
        CharDelay=0.0700000
        EOLDelay=0.5000000
        OnCreateComponent=mTextBox.InternalOnCreateComponent
        WinLeft=0.0100000
        WinWidth=0.9900000
        bTabStop=false
        bNeverFocus=true
    end object
    TextBox=mTextBox
    bBoundToParent=true
    bScaleToParent=true
}