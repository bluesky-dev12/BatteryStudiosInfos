class BTCMMessengerFriendHK extends BTContextMenuHK
    editinlinenew
    instanced;

var localized string strContextMenuName[8];

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    i = 0;
    J0x17:

    // End:0x43 [Loop If]
    if(i < 8)
    {
        self.AddItem(strContextMenuName[i]);
        i++;
        // [Loop Continue]
        goto J0x17;
    }
    //return;    
}

defaultproperties
{
    strContextMenuName[0]="?? ??"
    strContextMenuName[1]="?? ??"
    strContextMenuName[2]="???"
    strContextMenuName[3]="?? ????"
    strContextMenuName[4]="??? ????"
    strContextMenuName[5]="?? ??"
    strContextMenuName[6]="?? ?? ??"
    strContextMenuName[7]="?? ??"
}