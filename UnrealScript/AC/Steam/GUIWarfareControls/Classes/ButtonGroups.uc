/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\ButtonGroups.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:7
 *
 *******************************************************************************/
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
}

function AddButton(BTOwnerDrawCaptionButtonHK btn, optional int Extra)
{
    ButtonList.Length = ButtonList.Length + 1;
    ButtonList[ButtonList.Length - 1] = btn;
    btn.ButtonID = ButtonList.Length - 1;
    btn.Extra = Extra;
    btn.__OnClick__Delegate = ButtonGroups_OnClick;
}

function SetFontSizeAll(int Size)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x3b [While If]
    if(i < ButtonList.Length)
    {
        ButtonList[i].SetFontSizeAll(Size);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function RemoveButton(BTOwnerDrawCaptionButtonHK btn)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x42 [While If]
    if(i < ButtonList.Length)
    {
        // End:0x38
        if(ButtonList[i] == btn)
        {
            ButtonList.Remove(i, 1);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function int GetSelectIndex()
{
    return selectIndex;
}

function int GetSelectButtonExtra()
{
    return ButtonList[selectIndex].Extra;
}

function SelectButton(int Index)
{
    local int i;

    // End:0x57
    if(bTabControlMode)
    {
        i = 0;
        J0x10:
        // End:0x3f [While If]
        if(i < ButtonList.Length)
        {
            ButtonList[i].EnableMe();
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x10;
        }
        ButtonList[Index].DisableMe();
    }
    // End:0xa6
    else
    {
        i = 0;
        J0x5e:
        // End:0x8f [While If]
        if(i < ButtonList.Length)
        {
            ButtonList[i].bSelect = false;
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x5e;
        }
        ButtonList[Index].bSelect = true;
    }
    selectIndex = Index;
}
