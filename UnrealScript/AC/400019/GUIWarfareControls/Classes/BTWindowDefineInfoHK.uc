class BTWindowDefineInfoHK extends BTWindowInfoHK
    editinlinenew
    instanced;

var localized string strClientDefaultTitle;
var localized string strClientDefine[300];
var localized string strClientTitle[300];
var int DefineCode;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    //return;    
}

function SetContentText_Instance(int Code, optional string arg0, optional string arg1, optional string arg2, optional string arg3)
{
    local array<string> arrStr;
    local string str_Title, str_Msg;

    str_Msg = Class'Engine.BTCustomDrawHK'.static.FormatString(strClientDefine[Code], arg0, arg1, arg2);
    Split(str_Msg, "|", arrStr);
    str_Title = strClientTitle[Code];
    // End:0x66
    if(str_Title == "")
    {
        str_Title = strClientDefaultTitle;
    }
    // End:0x89
    if(arrStr.Length == 1)
    {
        SetData(str_Title, 5, arrStr[0]);        
    }
    else
    {
        // End:0xB1
        if(arrStr.Length >= 2)
        {
            SetData(str_Title, 5, arrStr[0], arrStr[1]);
        }
    }
    Log("[BTWindowDefineInfoHK::SetContentText_Instance] Msg=" $ str_Msg);
    //return;    
}

static function string GetFormatString(int Code, optional string arg0, optional string arg1, optional string arg2, optional string arg3, optional string arg4, optional string arg5, optional string arg6, optional string arg7, optional string arg8)
{
    return Class'Engine.BTCustomDrawHK'.static.FormatString(default.strClientDefine[Code], arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8);
    //return;    
}

static function string GetClientString(int Code)
{
    return default.strClientDefine[Code];
    //return;    
}

static function bool ShowInfo(GUIController con, int Code, optional string arg0, optional string arg1, optional string arg2)
{
    local string strTitle, strMsg;
    local array<string> arrStr;

    // End:0x48
    if(con == none)
    {
        Log("[BTWindowDefineInfoHK::ShowWindow] GUIController = none");
        return false;
    }
    // End:0xDC
    if(con.OpenMenu("GUIWarfareControls.BTWindowDefineInfoHK") == false)
    {
        Log("[BTWindowDefineInfoHK::ShowWindow] GUIController.OpenMenu Failed!");
        con.LogMenuStack();
        return false;
    }
    strMsg = Class'Engine.BTCustomDrawHK'.static.FormatString(BTWindowDefineInfoHK(con.TopPage()).strClientDefine[Code], arg0, arg1, arg2);
    Split(strMsg, "|", arrStr);
    strTitle = BTWindowDefineInfoHK(con.TopPage()).strClientTitle[Code];
    // End:0x18A
    if(strTitle == "")
    {
        strTitle = BTWindowDefineInfoHK(con.TopPage()).strClientDefaultTitle;
    }
    // End:0x1C5
    if(arrStr.Length == 1)
    {
        BTWindowDefineInfoHK(con.TopPage()).SetData(strTitle, 5, arrStr[0]);        
    }
    else
    {
        // End:0x205
        if(arrStr.Length >= 2)
        {
            BTWindowDefineInfoHK(con.TopPage()).SetData(strTitle, 5, arrStr[0], arrStr[1]);
        }
    }
    BTWindowDefineInfoHK(con.TopPage()).DefineCode = Code;
    Log("[BTWindowDefineInfoHK::ShowInfo] Msg=" $ strMsg);
    return true;
    //return;    
}

defaultproperties
{
    strClientDefaultTitle="Notice"
    strClientDefine[0]="The login server is closed."
    strClientDefine[1]="Enter your password."
    strClientDefine[2]="The ID does not exist."
    strClientDefine[3]="Incorrect password."
    strClientDefine[4]="Internal Login Error"
    strClientDefine[5]="Login DB Error"
    strClientDefine[6]="Unable to connect to the login server. (OnConnect) Error Code=%0"
    strClientDefine[7]="Disconnected from the login server. (OnClose) Error Code=%0"
    strClientDefine[8]="Disconnected from the login server. (OnError) Error Code=%0"
    strClientDefine[9]="Unable to connect to the channel server. (OnConnect) Error Code=%0"
    strClientDefine[10]="Disconnected from the channel server. (OnClose) Error Code=%0"
    strClientDefine[11]="Disconnected from the channel server. (OnError) Error Code=%0"
    strClientDefine[12]="Enter your nickname."
    strClientDefine[13]="You cannot use special characters in your nickname. Enter numbers or letters without spaces."
    strClientDefine[14]="Invalid number of characters. (Min: 4 letters, Max: 16 letters)"
    strClientDefine[15]="This nickname already exists."
    strClientDefine[16]="Character Creation Error"
    strClientDefine[17]="(0) successful, (1) DB Error, (2,3) no ID, (50) already in use"
    strClientDefine[18]="Successfully added friend."
    strClientDefine[19]="Failed to add friend."
    strClientDefine[20]="Repair complete."
    strClientDefine[21]="You have purchased %0."
    strClientDefine[22]="%0 has agreed to be added as your friend."
    strClientDefine[23]="%0 has declined to be added as your friend."
    strClientDefine[24]="%0 item has expired."
    strClientDefine[25]="The maximum number of players allowed for Free For All is 8."
    strClientDefine[26]="Network-related settings (NAT) was not completed. Run it again later. NatType = %0"
    strClientDefine[27]="You cannot do that while Preparing."
    strClientDefine[28]="You cannot change teams while Preparing."
    strClientDefine[30]="You do not have enough Points to place a bid."
    strClientDefine[31]="You do not have enough Points to buy the item."
    strClientDefine[40]="The host cannot change options while a game is in progress."
    strClientDefine[41]="The clan invitation message has been sent."
    strClientDefine[42]="The clan application has been sent."
    strClientDefine[43]="The clan application for %0 was approved."
    strClientDefine[44]="%0 declined the clan invitation."
    strClientDefine[45]="%0 agreed to join %1."
    strClientDefine[46]="%0 declined to join %1."
    strClientDefine[47]="The clan information was changed."
    strClientDefine[48]="The self intro was changed."
    strClientDefine[49]="You cannot use special characters in the clan name. Enter numbers or letters without spaces."
    strClientDefine[50]="This is a valid clan name."
    strClientDefine[51]="This is an invalid clan name."
    strClientDefine[52]="You must perform a duplicate clan name check to create the clan."
    strClientDefine[53]="The clan was created. Moving to the clan window."
    strClientDefine[54]="%1 joined %0."
    strClientDefine[55]="%0's rank changed to %1."
    strClientDefine[56]="Check the clan invitation message first."
    strClientDefine[57]="You must perform a duplicate clan ID check to create the clan."
    strClientDefine[58]="%0 was expelled by the clan master."
    strClientDefine[59]="%0 left %1."
    strClientDefine[60]="Your level is too low to buy the item."
    strClientDefine[61]="The mail was sent successfully."
    strClientDefine[62]="You do not have enough Points to create a clan."
    strClientDefine[65]="Your rewards will be reduced by 50%. You are equipped with default weapons with 0 durability.|Inventory"
    strClientDefine[66]="You are unable to join the game. You are equipped with weapon(s) with 0 durability.|Inventory"
    strClientDefine[67]="You are unable to join the game. You have weapon(s) with 0 durability in the quick slot.|Inventory"
    strClientDefine[70]="The host cannot change graphics settings in the middle of a game. The graphics setting changes will be applied in the next game."
    strClientDefine[71]="All equipped items have been repaired."
    strClientDefine[72]="All items have been repaired."
    strClientDefine[75]="%0 removed you from his or her Friends List."
    strClientDefine[76]="%0 is offline. Send a mail instead."
    strClientDefine[77]="The nickname %0 does not exist."
    strClientDefine[78]="%0's PC specifications are too low to be a host. As a result, the game may not run smoothly. We recommend changing the host to another user."
    strClientDefine[80]="Enter the recipient's nickname."
    strClientDefine[81]="Enter the text for the mail."
    strClientDefine[82]="Unable to log in. The maximum number of users online has been reached."
    strClientDefine[83]="%0 invited you to join %1."
    strClientDefine[84]="Closing the game due to multiple logins.|Quit"
    strClientDefine[85]="%0 applied to join the clan."
    strClientDefine[86]="Can be set only with a graphics card that supports Shader 3.0 or above."
    strClientDefine[87]="%0 account is locked. Closing the game."
    strClientDefine[88]="Unable to verify successfully. Closing the game."
    strClientDefine[89]="You are not a CBT user. Closing the game."
    strClientDefine[90]="Unable to verify login successfully. Closing the game."
    strClientDefine[91]="This account is already logged in. Logging off the previous connection and logging in again."
    strClientDefine[92]="Unable to log off the existing connection. Closing the game."
    strClientDefine[93]="You have been disconnected by the administrator."
    strClientDefine[94]="Purchase complete."
    strClientDefine[95]="%0's ID does not exist in the game."
    strClientDefine[96]="%0 is unable to receive mail because his or her Mailbox is full."
    strClientDefine[97]="Unable to send mail to %0."
    strClientDefine[99]="Unable to log in. The maximum number of users online has been reached.|Quit"
    strClientDefine[100]="%0 logged into channel %2 on the %1 server."
    strClientDefine[101]="You cannot use censored words as a character name."
    strClientDefine[102]="You cannot use censored words in clan names."
    strClientDefine[103]="You cannot use profanity in game names."
    strClientDefine[104]="Closing the game due to an invalid client version."
    strClientDefine[105]="A friend invitation arrived from %0. You cannot check friend invitations while Preparing."
    strClientDefine[106]="%0's clan invitation is stored in the Mailbox."
    strClientDefine[107]="%0's clan application is stored in the Mailbox."
    strClientDefine[110]="Chain Quest Final "
    strClientDefine[111]="Reward: "
    strClientDefine[112]="+%0 Points"
    strClientDefine[113]="+%0 EXP"
    strClientDefine[120]="You already have this item. The item usage period on it has been extended instead."
    strClientDefine[121]="You already have this item. The amount on it has been increased instead."
    strClientDefine[122]="~%0 (month) %1 (day)"
    strClientDefine[123]="You have gifted %1 to %0."
    strClientDefine[125]="%0 Points"
    strClientDefine[126]="%0 W Coin(P)"
    strClientDefine[127]="All selected items were purchased."
    strClientDefine[128]="Registered as your primary PC cafe."
    strClientDefine[129]="%0 accepted the game invitation."
    strClientDefine[130]="%0 declined the game invitation."
    strClientDefine[131]="%0 did not reply within 10 seconds and was declined automatically."
    strClientDefine[132]="Unable to invite. %0 is in the middle of a game."
    strClientDefine[133]="%0 cannot approve clan applications. It was sent by mail to the clan master, %1."
    strClientDefine[134]="%0 cannot approve clan applications. It was sent by mail to the officer %1."
    strClientDefine[135]="%0 is offline. The clan application was sent by mail."
    strClientDefine[136]="Deferred applications are stored in the Mailbox for 12 hours."
    strClientDefine[137]="%0 deferred the clan application."
    strClientDefine[138]="%0 deferred the clan invitation."
    strClientDefine[139]="Unable to invite any more. The game is full."
    strClientDefine[140]="[Clan] Clan Invitation"
    strClientDefine[141]="[Clan] Clan Application"
    strClientDefine[142]="Daily quests reset at 7 AM and the details have changed. The changes are applied either when you log out of the game and log in again, or after you have played a game."
    strClientDefine[143]="Enter a whisper message. /w nickname message"
    strClientDefine[144]="Unable to equip the PC cafe-only item. You are not in an Arctic Combat Affiliate PC cafe."
    strClientDefine[145]="%0 is in the middle of a battle. The clan application was sent by mail."
    strClientDefine[146]="This item contains inappropriate words. Unable to use."
    strClientDefine[147]="Enter the message."
    strClientDefine[148]="Select a clan mark."
    strClientDefine[149]="Before you can use a clan mark, you must perform a duplicate check."
    strClientDefine[150]="You are not in a clan."
    strClientDefine[151]="No game found that meets the conditions."
    strClientDefine[152]="Pound Match Channel = %0, Game Number = %1"
    strClientDefine[153]="You have spammed and are banned from chatting for 1 minute."
    strClientDefine[154]="You are banned from chatting. Time remaining: %0 seconds"
    strClientDefine[155]="You are no longer banned from chatting."
    strClientDefine[156]="This item can be used on the homepage."
    strClientDefine[157]="Closing the game due to an invalid client version. Run the game after completing the update. If the problem persists, run a file inspection from the game launcher."
    strClientDefine[159]="The chat block was removed."
    strClientDefine[160]="Unable to enter Hangul consisting only of consonants or vowels. Try again."
    strClientDefine[161]="Unable to sell at a price lower than the minimum sale price. Try again after entering a start price and Buy Now price that are higher than the minimum sale price."
    strClientDefine[162]="%0 was banned from chatting in accordance with the operating policy. Time remaining: %1 hours %2 minutes"
    strClientDefine[163]="%0 item was blocked in accordance with the operating policy. Inquire at [Homepage] -> [Customer Support] -> [1:1 Inquiry]."
    strClientDefine[164]="The client version is invalid or a file has been damaged. Reinstall the game."
    strClientDefine[165]="The host will be expelled in %0 seconds if the host remains inactive."
    strClientDefine[166]="The user will be moved to the Lobby in %0 seconds due to prolonged inactivity."
    strClientDefine[167]="The user was expelled as he or she remained inactive for 30 seconds after all players were Ready."
    strClientDefine[168]="The user was moved to the Lobby due to prolonged inactivity."
    strClientDefine[169]="The same clan mark already exists. You cannot use this clan mark. Choose another and perform a duplicate clan mark check again."
    strClientDefine[170]="The same clan mark does not already exist. You can use this clan mark."
    strClientDefine[171]="Search & Destroy missions only available to Corporals [4] or higher."
    strClientDefine[172]="You were expelled by the host."
    strClientDefine[173]="The clan mark was changed."
    strClientDefine[174]="%0 hours have passed since you logged into the game."
    strClientDefine[175]="Unable to delete until you receive the item."
    strClientDefine[176]="Press OK to close the window."
    strClientDefine[177]="The PC cafe's paid affiliation period has expired. Consult the PC cafe owner."
    strClientDefine[178]="It is an affiliated PC cafe."
    strClientDefine[179]="The PC cafe's paid affiliation period was recharged. You may now receive the benefits of an affiliated PC cafe."
    strClientDefine[180]="The game was changed to Sniper Battle. Equip a sniper rifle and mark yourself Ready again."
    strClientDefine[181]="The game was changed to No Sniper. Unequip your sniper rifle and mark yourself Ready again."
    strClientDefine[182]="Unable to buy the cash item."
    strClientDefine[183]="Unable to gift the cash item."
    strClientDefine[184]="The nickname was changed from [%0] to [%1]. You must log off the game and log in again for the nickname change to take effect."
    strClientDefine[185]="A friend invitation arrived from %0. You cannot check friend invitations while in the middle of a battle."
    strClientDefine[186]="The clan name was changed from [%0] to [%1]. You must log off the game and log in again for the clan name change to take effect."
    strClientDefine[187]="You cannot join a regular clan battle if you are not a clan member."
    strClientDefine[188]="Unable to intervene during a clan battle."
    strClientDefine[189]="A game may only be started when every user is Ready."
    strClientDefine[190]="%0 team failed to start.  For %1 users to start a clan battle, at least %2 users must be in the same clan."
    strClientDefine[191]="Unable to start a clan battle between teams from the same clan."
    strClientDefine[192]="Unable to start a clan battle between teams from the same clan."
    strClientDefine[193]="A clan battle may only be started when each team has 4 or more users."
    strClientDefine[194]="A game may only be started when the two teams have an identical number of Ready users."
    strClientDefine[195]="%0 team does not have a clan to play in the clan battle."
    strClientDefine[196]="The use of alt+tab is restricted during battle to ensure game stability. Use the function only while accessing the Store, Inventory, or Lobby."
    strClientDefine[197]="Select server and channel."
    strClientDefine[198]="Only alphabet letters and numbers can be used."
    strClientDefine[199]="Only alphabet letters and numbers can be used."
    strClientDefine[200]="%0 item period has been extended."
    strClientDefine[201]="This item cannot be repurchased."
    strClientDefine[202]="Friend request sent to %0."
    strClientDefine[204]="Cannot be purchased, insufficient funds."
    strClientDefine[205]="Cannot be purchased, insufficient funds."
    strClientDefine[206]="You entered a prohibited character. Please try again."
    strClientDefine[207]="Cannot extend the item due to low rank."
    strClientDefine[208]="Cannot extend it due to low points."
    strClientDefine[209]="Cannot extend it due to low cash."
    strClientDefine[210]="If you fail to enter the game within %0 sec. from the lobby, you will be kicked from the game."
    strClientDefine[211]="You've been kicked from the game as you failed to enter the game within 15 sec. from the lobby."
    strClientDefine[220]="Since your current team AF is set to bot mode, you cannot switch to the RSA team."
    strClientDefine[221]="Since your current team RSA is set to bot mode, you cannot switch to the AF team."
    strClientDefine[222]="Clan members cannot be kicked from the game while being connected to the clan channel."
    strClientDefine[223]="%0 W Coin(C)"
    strClientDefine[224]="The code has been successfully redeemed. Thank you for your purchase."
    strClientDefine[225]="Teams cannot be changed in clan matches."
    strClientDefine[227]="[Fixed Respawn Point/Team Deathmatch] Only 1 thrown weapon can be used in this mode. (Skill earned thrown weapon excluded)"
    strClientDefine[228]=" %0 total"
    strClientDefine[229]="Rewards have been received."
    strClientDefine[230]="No Fortune Box Key available."
    strClientTitle[21]="Purchase Complete"
    strClientTitle[127]="Purchase Complete"
    strClientTitle[139]="Invitation Failed"
}