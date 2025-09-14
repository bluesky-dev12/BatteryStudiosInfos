/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTCMMessengerOnOffline.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:8
 *
 *******************************************************************************/
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
    // End:0x6b
    if(float(X + 119) > C.ClipX)
    {
        X -= ItemWidth + 139;
    }
    class'BTCustomDrawHK'.static.DrawImage(C, BackgroundImage, float(X - 10), float(Y), float(X + 149), float(Y + nPopupSize[nOnLine - 1]));
    dy1 = 13;
    dy2 = 49;
    i = 0;
    J0xd1:
    // End:0x160 [While If]
    if(i < nOnLine)
    {
        class'BTCustomDrawHK'.static.DrawStringPaddingOffset(C, strLineText[i], CaptionDrawType, float(FontSize[0]), float(X - 10), float(Y + dy1), float(X + 149), float(Y + dy2), 0, 3, 0, 0);
        dy1 += 15;
        dy2 += 36;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xd1;
    }
    return true;
}

function SetLogOnState(int nLogOnState)
{
    // End:0x18
    if(nLogOnState == -1)
    {
        nOnLine = 0;
        return;
    }
    // End:0x2e
    if(nLogOnState >= 1)
    {
        nOnLine = 2;
    }
    // End:0x4a
    else
    {
        nOnLine = 1;
        ChangeWispherState(false);
        ChangeInviteState(false);
        ChangeMoveRoomState(false);
    }
    strLineText[0] = strOnOff[nLogOnState];
}

function SetLocation(string strChannelName, int GameRoomNum)
{
    local string szLocName;

    // End:0x54
    if(strChannelName != "")
    {
        // End:0x3c
        if(GameRoomNum != -1)
        {
            szLocName = strChannelName $ " / No." $ string(GameRoomNum);
        }
        // End:0x47
        else
        {
            szLocName = strChannelName;
        }
        strLineText[1] = szLocName;
    }
}

function ChangeWispherState(bool bActive)
{
    // End:0x19
    if(bActive == true)
    {
        ChangeStateByIndex(2, 0);
    }
    // End:0x23
    else
    {
        ChangeStateByIndex(2, 1);
    }
}

function ChangeInviteState(bool bActive)
{
    // End:0x19
    if(bActive == true)
    {
        ChangeStateByIndex(4, 0);
    }
    // End:0x23
    else
    {
        ChangeStateByIndex(4, 1);
    }
}

function ChangeMoveRoomState(bool bActive)
{
    // End:0x19
    if(bActive == true)
    {
        ChangeStateByIndex(3, 0);
    }
    // End:0x23
    else
    {
        ChangeStateByIndex(3, 1);
    }
}

function bool IsActiveInviteState()
{
    return GetItemState(4) == 0;
}

function bool IsActiveMoveRoomState()
{
    return GetItemState(3) == 0;
}

defaultproperties
{
    nOnLine=1
    strOnOff[0]="Offline"
    strOnOff[1]="Online"
    strOnOff[2]="In Game"
    nPopupSize[0]=65
    nPopupSize[1]=90
}