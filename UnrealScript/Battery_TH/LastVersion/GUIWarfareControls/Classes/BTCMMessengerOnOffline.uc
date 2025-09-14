class BTCMMessengerOnOffline extends BTContextMenuHK
    editinlinenew
    instanced;

var int nOnLine;
var localized string strOnOff[3];
var byte nPopupSize[2];
var string strLineText[2];

function bool OnDraw(Canvas C)
{
    local int X, Y, i, dy1, dy2;

    super.OnDraw(C);
    // End:0x18
    if(nOnLine == 0)
    {
        return true;
    }
    X = int(ActualLeft() + float(ItemWidth));
    Y = int(ActualTop() - float(20));
    // End:0x6B
    if(float(X + 119) > C.ClipX)
    {
        X -= (ItemWidth + 139);
    }
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, BackgroundImage, float(X - 10), float(Y), float(X + 149), float(Y + int(nPopupSize[nOnLine - 1])));
    dy1 = 13;
    dy2 = 49;
    i = 0;
    J0xD1:

    // End:0x160 [Loop If]
    if(i < nOnLine)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawStringPaddingOffset(C, strLineText[i], CaptionDrawType, float(FontSize[0]), float(X - 10), float(Y + dy1), float(X + 149), float(Y + dy2), 0, 3, 0, 0);
        dy1 += 15;
        dy2 += 36;
        ++i;
        // [Loop Continue]
        goto J0xD1;
    }
    return true;
    //return;    
}

function SetLogOnState(int nLogOnState)
{
    // End:0x18
    if(nLogOnState == -1)
    {
        nOnLine = 0;
        return;
    }
    // End:0x2E
    if(nLogOnState >= 1)
    {
        nOnLine = 2;        
    }
    else
    {
        nOnLine = 1;
        ChangeWispherState(false);
        ChangeInviteState(false);
        ChangeMoveRoomState(false);
    }
    strLineText[0] = strOnOff[nLogOnState];
    //return;    
}

function SetLocation(string strChannelName, int GameRoomNum)
{
    local string szLocName;

    // End:0x54
    if(strChannelName != "")
    {
        // End:0x3C
        if(GameRoomNum != -1)
        {
            szLocName = (strChannelName $ " / No.") $ string(GameRoomNum);            
        }
        else
        {
            szLocName = strChannelName;
        }
        strLineText[1] = szLocName;
    }
    //return;    
}

function ChangeWispherState(bool bActive)
{
    // End:0x19
    if(bActive == true)
    {
        ChangeStateByIndex(2, 0);        
    }
    else
    {
        ChangeStateByIndex(2, 1);
    }
    //return;    
}

function ChangeInviteState(bool bActive)
{
    // End:0x19
    if(bActive == true)
    {
        ChangeStateByIndex(4, 0);        
    }
    else
    {
        ChangeStateByIndex(4, 1);
    }
    //return;    
}

function ChangeMoveRoomState(bool bActive)
{
    // End:0x19
    if(bActive == true)
    {
        ChangeStateByIndex(3, 0);        
    }
    else
    {
        ChangeStateByIndex(3, 1);
    }
    //return;    
}

function bool IsActiveInviteState()
{
    return int(GetItemState(4)) == int(0);
    //return;    
}

function bool IsActiveMoveRoomState()
{
    return int(GetItemState(3)) == int(0);
    //return;    
}

defaultproperties
{
    nOnLine=1
    strOnOff[0]="Offline"
    strOnOff[1]="Online"
    strOnOff[2]="Playing"
    nPopupSize[0]=65
    nPopupSize[1]=90
}