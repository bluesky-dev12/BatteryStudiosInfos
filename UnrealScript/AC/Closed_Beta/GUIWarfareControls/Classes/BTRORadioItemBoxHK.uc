class BTRORadioItemBoxHK extends RenderObject;

var GUIController PController;
var bool bSelect;
var Image RadioButton[3];
var BTROItemBoxHK itemBox;

function Init()
{
    RadioButton[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.radi_back;
    RadioButton[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.radi_on;
    RadioButton[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.radi_ok;
    itemBox = new Class'GUIWarfareControls_Decompressed.BTROItemBoxHK';
    itemBox.Init();
    //return;    
}

function bool Render(Canvas C, optional float Delta)
{
    local int iState;

    // End:0x0D
    if(!bVisible)
    {
        return false;
    }
    // End:0x4E
    if(CheckIn(float(int(PController.MouseX)), float(int(PController.MouseY))))
    {
        itemBox.bMouseOn = true;        
    }
    else
    {
        itemBox.bMouseOn = false;
    }
    // End:0x7C
    if(bSelect)
    {
        itemBox.bFocused = true;        
    }
    else
    {
        itemBox.bFocused = false;
    }
    itemBox.bVisible = bVisible;
    iState = 0;
    // End:0xC7
    if(itemBox.bFocused)
    {
        iState = 2;        
    }
    else
    {
        // End:0xE0
        if(itemBox.bMouseOn)
        {
            iState = 1;
        }
    }
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, RadioButton[iState], AWinPos.X1, AWinPos.Y1, AWinPos.X1 + float(53), AWinPos.Y2);
    itemBox.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1 + float(53), AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
    itemBox.Render(C);
    //return;    
}
