class TabGroups extends GUIComponent
    editinlinenew
    instanced;

var bool bMultiSelect;
var int selectIndex;
var array<export editinline BTTabPanelHK> TabList;

function bool TabGroups_OnClick(GUIComponent Sender)
{
    local export editinline BTTabPanelHK btn;

    btn = BTTabPanelHK(Sender);
    SelectTab(btn.TabID);
    return true;
    //return;    
}

function AddTab(BTTabPanelHK btn)
{
    TabList.Length = TabList.Length + 1;
    TabList[TabList.Length - 1] = btn;
    btn.TabID = TabList.Length - 1;
    btn.__OnClick__Delegate = TabGroups_OnClick;
    //return;    
}

function RemoveTab(BTTabPanelHK btn)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x42 [Loop If]
    if(i < TabList.Length)
    {
        // End:0x38
        if(TabList[i] == btn)
        {
            TabList.Remove(i, 1);
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

function SelectTab(int Index)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x38 [Loop If]
    if(i < TabList.Length)
    {
        TabList[i].bSelect = false;
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    TabList[Index].bSelect = true;
    TabList[Index].TabGroups_OnSelect();
    selectIndex = Index;
    //return;    
}
