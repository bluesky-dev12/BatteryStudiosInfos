class ButtonGroups extends GUIComponent
    editinlinenew
    instanced;

var bool bTabControlMode;
var bool bMultiSelect;
var int selectIndex;
var array<export editinline BTOwnerDrawCaptionButtonHK> ButtonList;

function bool ButtonGroups_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    SelectButton(btn.ButtonID);
    return true;
    //return;    
}

function AddButton(BTOwnerDrawCaptionButtonHK btn, optional int Extra)
{
    ButtonList.Length = ButtonList.Length + 1;
    ButtonList[ButtonList.Length - 1] = btn;
    btn.ButtonID = ButtonList.Length - 1;
    btn.Extra = Extra;
    btn.__OnClick__Delegate = ButtonGroups_OnClick;
    //return;    
}

function RemoveButton(BTOwnerDrawCaptionButtonHK btn)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x42 [Loop If]
    if(i < ButtonList.Length)
    {
        // End:0x38
        if(ButtonList[i] == btn)
        {
            ButtonList.Remove(i, 1);
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function int GetSelectIndex()
{
    return selectIndex;
    //return;    
}

function int GetSelectButtonExtra()
{
    return ButtonList[selectIndex].Extra;
    //return;    
}

function SelectButton(int Index)
{
    local int i;

    // End:0x57
    if(bTabControlMode)
    {
        i = 0;
        J0x10:

        // End:0x3F [Loop If]
        if(i < ButtonList.Length)
        {
            ButtonList[i].EnableMe();
            i++;
            // [Loop Continue]
            goto J0x10;
        }
        ButtonList[Index].DisableMe();        
    }
    else
    {
        i = 0;
        J0x5E:

        // End:0x8F [Loop If]
        if(i < ButtonList.Length)
        {
            ButtonList[i].bSelect = false;
            i++;
            // [Loop Continue]
            goto J0x5E;
        }
        ButtonList[Index].bSelect = true;
    }
    selectIndex = Index;
    //return;    
}
