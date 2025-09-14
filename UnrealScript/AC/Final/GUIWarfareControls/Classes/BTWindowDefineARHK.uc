class BTWindowDefineARHK extends BTWindowAutoResizeHK
    editinlinenew
    instanced;

var localized string strClientDefaultTitle;
var localized string strClientTitle[80];
var localized string strClientDefine[80];

function bool SetContentText_Instance(int Code, optional string arg0, optional string arg1, optional string arg2, optional string arg3)
{
    local array<string> arrStr;
    local string str_Title, str_Msg;

    str_Msg = Class'Engine.BTCustomDrawHK'.static.FormatString(strClientDefine[Code], arg0, arg1, arg2, arg3);
    Split(str_Msg, "|", arrStr);
    str_Title = strClientTitle[Code];
    // End:0x6B
    if(str_Title == "")
    {
        str_Title = strClientDefaultTitle;
    }
    // End:0x94
    if(arrStr.Length == 1)
    {
        SetData(str_Title, arrStr[0]);
        SetButtonCaption(strOK);
    }
    // End:0xC8
    if(arrStr.Length == 2)
    {
        SetData(str_Title, arrStr[0], arrStr[1]);
        SetButtonCaption(strOK);        
    }
    else
    {
        // End:0xFF
        if(arrStr.Length == 3)
        {
            SetData(str_Title, arrStr[0], arrStr[1]);
            SetButtonCaption(arrStr[2]);            
        }
        else
        {
            // End:0x13B
            if(arrStr.Length == 4)
            {
                SetData(str_Title, arrStr[0], arrStr[1]);
                SetButtonCaption(arrStr[2], arrStr[3]);
            }
        }
    }
    Log("[BTWindowDefineARHK::SetContentText_Instance] Msg=" $ str_Msg);
    return true;
    //return;    
}

static function bool SetContentText(GUIController con, int Code, optional string arg0, optional string arg1, optional string arg2, optional string arg3)
{
    local export editinline BTWindowDefineARHK BTWindow;
    local array<string> arrStr;
    local string strTitle, strMsg;

    // End:0x0D
    if(con == none)
    {
        return false;
    }
    BTWindow = BTWindowDefineARHK(con.TopPage());
    // End:0xE2
    if(BTWindow != none)
    {
        strMsg = Class'Engine.BTCustomDrawHK'.static.FormatString(BTWindowDefineARHK(con.TopPage()).strClientDefine[Code], arg0, arg1, arg2, arg3);
        Split(strMsg, "|", arrStr);
        strTitle = BTWindow.strClientTitle[Code];
        // End:0xC7
        if(strTitle == "")
        {
            strTitle = BTWindow.strClientDefaultTitle;
        }
        BTWindow.SetData(strTitle, arrStr[0]);
    }
    //return;    
}

static function bool ShowInfo(GUIController con, int Code, optional string arg0, optional string arg1, optional string arg2, optional string arg3)
{
    local array<string> arrStr;
    local string strTitle, strMsg;

    // End:0x46
    if(con == none)
    {
        Log("[BTWindowDefineARHK::ShowWindow] GUIController = none");
        return false;
    }
    // End:0xD6
    if(con.OpenMenu("GUIWarfareControls.BTWindowDefineARHK") == false)
    {
        Log("[BTWindowDefineARHK::ShowWindow] GUIController.OpenMenu Failed!");
        con.LogMenuStack();
        return false;
    }
    strMsg = Class'Engine.BTCustomDrawHK'.static.FormatString(BTWindowDefineARHK(con.TopPage()).strClientDefine[Code], arg0, arg1, arg2, arg3);
    Split(strMsg, "|", arrStr);
    strTitle = BTWindowDefineARHK(con.TopPage()).strClientTitle[Code];
    // End:0x189
    if(strTitle == "")
    {
        strTitle = BTWindowDefineARHK(con.TopPage()).strClientDefaultTitle;
    }
    // End:0x1FA
    if(arrStr.Length == 1)
    {
        BTWindowDefineARHK(con.TopPage()).SetData(strTitle, arrStr[0]);
        BTWindowDefineARHK(con.TopPage()).SetButtonCaption(BTWindowDefineARHK(con.TopPage()).strOK);
    }
    // End:0x276
    if(arrStr.Length == 2)
    {
        BTWindowDefineARHK(con.TopPage()).SetData(strTitle, arrStr[0], arrStr[1]);
        BTWindowDefineARHK(con.TopPage()).SetButtonCaption(BTWindowDefineARHK(con.TopPage()).strOK);        
    }
    else
    {
        // End:0x2DD
        if(arrStr.Length == 3)
        {
            BTWindowDefineARHK(con.TopPage()).SetData(strTitle, arrStr[0], arrStr[1]);
            BTWindowDefineARHK(con.TopPage()).SetButtonCaption(arrStr[2]);            
        }
        else
        {
            // End:0x349
            if(arrStr.Length == 4)
            {
                BTWindowDefineARHK(con.TopPage()).SetData(strTitle, arrStr[0], arrStr[1]);
                BTWindowDefineARHK(con.TopPage()).SetButtonCaption(arrStr[2], arrStr[3]);
            }
        }
    }
    Log("[BTWindowDefineARHK::ShowInfo] Msg=" $ strMsg);
    return true;
    //return;    
}

static function CloseWindowAll(GUIController Controller)
{
    local int i;
    local export editinline BTWindowDefineARHK BTWindow;

    i = 0;
    J0x07:

    // End:0x65 [Loop If]
    if(i < Controller.MenuStack.Length)
    {
        BTWindow = BTWindowDefineARHK(Controller.MenuStack[i]);
        // End:0x5B
        if(BTWindow != none)
        {
            BTWindow.FadeOut(false, true);
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

defaultproperties
{
    strClientTitle[0]="Receive Timed Item"
    strClientTitle[1]="Get Item"
    strClientTitle[2]="Equip Item"
    strClientTitle[3]="Reset Clan Battle Records"
    strClientTitle[4]="Reset Clan Battle Records"
    strClientTitle[5]="Change Clan Name"
    strClientTitle[6]="Change Clan Name"
    strClientTitle[7]="Change Nickname"
    strClientTitle[8]="Change Nickname"
    strClientTitle[9]="Reset Battle Records"
    strClientTitle[10]="Reset Battle Records"
    strClientTitle[11]="Reset Force Quits/Team Kills"
    strClientTitle[12]="Reset Force Quits/Team Kills"
    strClientTitle[13]="Reset Kills/Deaths"
    strClientTitle[14]="Reset Kills/Deaths"
    strClientTitle[15]="Server Radio"
    strClientTitle[16]="Global Radio"
    strClientTitle[17]="Item Destruction"
    strClientTitle[18]="Register Primary PC Cafe"
    strClientTitle[19]="Change Primary PC Cafe"
    strClientTitle[20]="Unable to change your primary PC cafe"
    strClientTitle[21]="Playing in your primary PC cafe."
    strClientTitle[22]="Select Gore Settings"
    strClientTitle[23]="Play Bot Team Deathmatch"
    strClientTitle[24]="Weapon Coupon"
    strClientTitle[25]="Weapon Coupon"
    strClientTitle[26]="Notice"
    strClientTitle[27]="Notice"
    strClientTitle[28]="Unable to enter Game Ready"
    strClientTitle[29]="Unable to Start"
    strClientTitle[30]="Get Item"
    strClientTitle[31]="Server Radio"
    strClientTitle[32]="Global Radio"
    strClientTitle[33]="Searching for opponents"
    strClientTitle[40]="Mailbox Warning"
    strClientTitle[41]="Mailbox"
    strClientTitle[42]="Tutorial Complete"
    strClientTitle[43]="Begin Tutorial"
    strClientTitle[44]="Tutorial Incomplete"
    strClientTitle[45]="Select Speech Language"
    strClientTitle[46]="Camera Motion Effects"
    strClientTitle[47]="Buy Cash"
    strClientTitle[48]="Notice"
    strClientTitle[49]="Notice"
    strClientTitle[50]="Notice"
    strClientTitle[51]="Notice"
    strClientTitle[52]="The Affiliated PC Cafe Game Installation Event!"
    strClientTitle[53]="Delete All Mail"
    strClientTitle[54]="Welcome back to Arctic Combat!"
    strClientTitle[55]="View Help"
    strClientTitle[56]="Notice"
    strClientTitle[57]="Reset Personal Clan Battle Scores"
    strClientTitle[58]="Reset Personal Clan Battle Scores"
    strClientTitle[59]="Reset Personal Clan Battle Kills/Deaths"
    strClientTitle[60]="Reset Personal Clan Battle Kills/Deaths"
    strClientTitle[70]="Standard PC Café"
    strClientTitle[71]="Gold PC Café"
    strClientTitle[72]="Premium PC Café "
    strClientTitle[73]="Game Reserve failed"
    strClientTitle[74]="Game Start failed"
    strClientTitle[75]="Use item"
    strClientTitle[76]="Use item"
    strClientTitle[77]="Issuance complete"
    strClientTitle[78]="Issuance complete"
    strClientTitle[79]="Reward has been given."
    strClientDefine[0]="Remove %0 from Storage?<10>Removing the item activates the item effect and starts the item's timer.| - Items removed from [Paid Storage] can be viewed from the [All] tab. Once an item from a package has been removed, the purchase of that package can no longer be cancelled.|Use|Cancel"
    strClientDefine[1]="Remove %0 from Storage?| - Items removed from [Paid Storage] can be viewed on the [All] tab. Once an item from a package has been removed, the purchase of that package can no longer be cancelled.|Continue|Cancel"
    strClientDefine[2]="Equip %0?<10>Equipping the item starts its timer.| - Once an item from a package has been removed, the purchase of that package can no longer be cancelled.|Continue|Cancel"
    strClientDefine[3]="Reset the clan battle records?<10>This will set clan battle wins, losses, and draws to 0. ||OK|Cancel"
    strClientDefine[4]="Your clan battle records were reset.||OK"
    strClientDefine[5]="Enter a new clan name.|EditBox|OK|Cancel"
    strClientDefine[6]="Your clan name was changed to %0.||OK"
    strClientDefine[7]="Enter a new nickname.|EditBox|OK|Cancel"
    strClientDefine[8]="Your nickname was changed to %0.||OK"
    strClientDefine[9]="Reset battle records?<10>This will set your wins, losses, and draws to 0.||OK|Cancel"
    strClientDefine[10]="The battle records have been reset.||OK"
    strClientDefine[11]="Reset force quits/team kills?<10> This will set your force quit and team kill counts to 0.||OK|Cancel"
    strClientDefine[12]="Your force quits/team kills have been reset.||OK"
    strClientDefine[13]="Reset kills/deaths?<10>This will set your kill, assist, and death counts to 0.||OK|Cancel"
    strClientDefine[14]="Your kills/deaths have been reset.||OK"
    strClientDefine[15]="Sends the message entered below to all users on the current server.|EditBox|OK|Cancel"
    strClientDefine[16]="Sends the message entered below to users on all servers.|EditBox|OK|Cancel"
    strClientDefine[17]="The durability of %0 reached to 0 and was destroyed.| - An unrepairable item is destroyed when its durability reaches 0.|Inventory|OK"
    strClientDefine[18]="Register %0 as your primary PC cafe?<10> <10>  Primary PC cafe benefits<9>       - EXP earned in battle +10%<9>       - Points earned in battle +10%<10> Caution<9><RED>       - Once a primary PC cafe is registered, it cannot be changed for 3 days.||OK|Cancel"
    strClientDefine[19]="%0 is already registered as your primary PC cafe.<10> Change your primary PC cafe to %1?<10> <10>  Primary PC cafe benefits<9>        - EXP earned in battle +10%<9>       - Points earned in battle +10%<10> Caution<9><RED>       - Once your primary PC cafe is registered, it cannot be changed for 3 days.||OK|Cancel"
    strClientDefine[20]="Once your primary PC cafe is registered, it cannot be changed for 3 days.<10> <10>  Primary PC cafe registration status:<9>       - %0 was registered as your primary PC Cafe within the last 3 days.||OK"
    strClientDefine[21]="You are logging in from %0, which is registered as your primary PC cafe.<10> <10>  Primary PC cafe benefits<9>       - EXP earned in battle +10%<9>       - Points earned in battle +10%||OK"
    strClientDefine[22]="This enables certain death effects (gore) in the game where dismembered human body parts are shown.<10>Choose to show or hide these effects.<9><RED> - You can change this setting later in the game options.||Gore On|Gore Off"
    strClientDefine[23]="Do you want to play Team Deathmatch against Bots (AI)?<10>You receive 2,000 Points for completing this mode.<10> If this is your first time playing Arctic Combat, we strongly recommend playing this mode.||Play|Cancel"
    strClientDefine[24]="You have a weapon coupon in your Inventory which you can use to claim a free weapon.<10>Open your Inventory?||Inventory|Cancel"
    strClientDefine[25]="You have a weapon coupon which you can use to claim a free weapon.<10>Claim the weapon now?||Claim Weapon|Cancel"
    strClientDefine[26]="Mission records are not saved in games with less than 4 human players.||OK"
    strClientDefine[27]="Daily quests reset at 7 AM and the quests have changed.<10>These changes are applied when you log off the game and log back in, or after you play a game.||OK"
    strClientDefine[28]="Unable to Ready yourself. You have PC cafe-only items equipped or registered to a quick slot.<10>PC cafe-only items can only be used in affiliated PC cafes.||Inventory"
    strClientDefine[29]="Unable to start the game. You have PC cafe-only items equipped or registered to a quick slot.<10>PC cafe-only items can only be used in affiliated PC cafes.||Inventory"
    strClientDefine[30]="Remove %0 from Storage?<9><RED> - Items removed from [Paid Storage] can be viewed on the [All] tab. Once an item from a package has been removed,<9><RED>   the purchase of that package can no longer be cancelled.|Continue|Cancel"
    strClientDefine[31]="You used the Server Radio.||OK"
    strClientDefine[32]="You used the Global Radio.||OK"
    strClientDefine[33]="Searching for clan battle opponents. Wait a moment.(%0:%1)<10><RED> - Expected wait time (%2:%3)||Stop"
    strClientDefine[40]="Your Mailbox is full. Unable to receive any more mail. Open your Mailbox?|OK|Cancel"
    strClientDefine[41]="You have %0 new message(s). Open your Mailbox?||OK|Cancel"
    strClientDefine[42]="You have completed the tutorial.||OK"
    strClientDefine[43]="Let's begin with a tutorial to instruct you on the basics of battle.||OK"
    strClientDefine[44]="Try next time.||OK"
    strClientDefine[45]="Select the language of speech used during battle.<10>We recommend Korean for beginners, and Foreign if you want a more<10>realistic atmosphere.<9><RED> - You can also change the speech language under Options [Other].||Korean|Foreign"
    strClientDefine[46]="Setting this to Strong displays more realistic visuals, but could<10>induce dizziness. We recommend the Weak setting for those who are new to FPS games.<9><RED>You may also change this setting under options [Controls].||Strong|Weak"
    strClientDefine[47]="You can only buy Cash from the Arctic Combat website."
    strClientDefine[48]="You must be equipped with a sniper rifle to participate in a Sniper Battle.||Inventory|OK"
    strClientDefine[49]="You cannot start a No Sniper game if you are equipped with a sniper rifle.||Inventory|OK"
    strClientDefine[50]="Remove %0 from Storage? | - Cash removed can be used to recharge for immediate use. |Use|Cancel"
    strClientDefine[51]="The items to repair include a loot item (%0) with a damage level above 80.<10>Loot with damage levels above 80 incur much higher repair costs. Proceed?<9> <9><RED>- The damage level increases each time a loot item is repaired.<9><RED>- An item with a damage level of over 100 cannot be sold via auction.||Repair|Cancel"
    strClientDefine[52]="Arctic Combat was played for the first time on the current PC.<10> We award 5,000 Points to those who install and play Arctic Combat for the first time on each PC<10>as a small thank you.<10> <9>  - 5,000 Points were sent to your Mailbox.<9>  - You may only participate in this event in Arctic Combat affiliated PC cafes.<9>  - You can receive the reward up to 10 times with a single ID by being the first person to play the game on other PCs after it was installed."
    strClientDefine[53]="Delete all read mail?<9><RED>  - Unread mail and mail with attachments will not be deleted.||OK|Cancel"
    strClientDefine[54]="We offer special gifts for returning users. They were sent to your Mailbox and may be opened right away.<10> <9> - New Weapon Coupon<9> - 50% Point Increase [14 days]<9> - Recon [AF] [14 days]<9> - Recon [RSA] [14 days]<9> - 10,000 Points"
    strClientDefine[55]="You can view Help on the homepage. Opening the homepage minimizes the game window.||Help|Cancel"
    strClientDefine[56]="Would you like to appoint %0 as the new Clan Master? ||Ok|Cancel"
    strClientDefine[57]="Reset your personal clan battle scores?<10>This will reset your wins, losses, and draws to 0. ||OK|Cancel"
    strClientDefine[58]="Your personal clan battle scores were reset.||OK"
    strClientDefine[59]="Reset your personal clan battle records?<10>This will reset your kills, assists, deaths, and headshots to 0. ||OK|Cancel"
    strClientDefine[60]="Your clan battle records were reset.||OK"
    strClientDefine[70]="You are currently playing at your main PC Café %0. <10> <10>  Main PC Café benefits<9>       - Bonus 10%  EXP from battle<9>       - Bonus 10% Points from battle||Ok"
    strClientDefine[71]="You are currently playing at your main PC Café %0. <10> <10>  Main PC Café benefits<9>       - Bonus 10%  EXP from battle<9>       - Bonus 10% Points from battle||Ok"
    strClientDefine[72]="You are currently playing at your main PC Café %0. <10> <10>  Main PC Café benefits<9>       - Bonus 10%  EXP from battle<9>       - Bonus 10% Points from battle||Ok"
    strClientDefine[73]="Unable to be Ready with Flash Bang or Smoke Grenade equipped or in Quick Slots. Flash Bang and Smoke Grenade cannot be used in this mode.||Inventory"
    strClientDefine[74]="Unable to be Ready with Flash Bang or Smoke Grenade equipped or in Quick Slots. Flash Bang and Smoke Grenade cannot be used in this mode.||Inventory"
    strClientDefine[75]="Use Puzzle Ticket? ||OK|Cancel"
    strClientDefine[76]="Use Roll Call Ticket? ||OK|Cancel"
    strClientDefine[77]="%0 Puzzle received.||OK"
    strClientDefine[78]="%0 Roll Call received.||OK"
    strClientDefine[79]="You have received %0.||OK"
}