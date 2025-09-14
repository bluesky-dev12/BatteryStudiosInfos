class BTACLMessengerCommon extends BTAutoColumnListHK
    editinlinenew
    instanced;

//var delegate<deleClanName> __deleClanName__Delegate;

function SetCurpos(int row, int Value)
{
    //return;    
}

function SetCurLocationName(int row, string Value)
{
    //return;    
}

function SetChannelName(int row, string Value)
{
    //return;    
}

function SetServerPort(int row, int Value)
{
    //return;    
}

function SetServerIP(int row, string Value)
{
    //return;    
}

function SetServerName(int row, string Value)
{
    //return;    
}

function SetGameRoomNumber(int row, int Value)
{
    //return;    
}

function SetChannelNumber(int row, int Value)
{
    //return;    
}

function SetCurState(int row, int Value)
{
    //return;    
}

function string GetClanName(int row)
{
    //return;    
}

delegate deleClanName(Canvas C, float L, float t, float R, float B, ACLData Data, string szClanName, int row)
{
    //return;    
}

function DrawClanName(Canvas C, float L, float t, float R, float B, ACLData Data, string szClanName, int row)
{
    // End:0xEA
    if(self.selectIndex == row)
    {
        // End:0xEA
        if(szClanName != "")
        {
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, SelectImage, ((L - float(110)) - float(13)) + float(2), t, L + float(2), B);
            Class'Engine.BTCustomDrawHK'.static.DrawStringPaddingOffset(C, szClanName, Data.Text[1].FontDrawType, float(Data.Text[1].FontSize), (((L - float(110)) - float(13)) + float(2)) + float(2), t, L - float(2), B, 5, 0, 0, 0, Data.Text[1].DrawShadowColor);
        }
    }
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    MultiColumnList.__OnBeginTooltip__Delegate = MultiColumnList_OnBeginToolTip;
    MultiColumnList.__OnEndTooltip__Delegate = MultiColumnList_OnEndToolTip;
    //return;    
}

function GUIToolTip MultiColumnList_OnBeginToolTip()
{
    __deleClanName__Delegate = DrawClanName;
    // End:0x3F
    if(MultiColumnList.ToolTip != none)
    {
        return MultiColumnList.ToolTip.EnterArea();        
    }
    else
    {
        // End:0x70
        if(MultiColumnList.MenuOwner != none)
        {
            return MultiColumnList.MenuOwner.OnBeginTooltip();
        }
    }
    return none;
    //return;    
}

function bool MultiColumnList_OnEndToolTip()
{
    __deleClanName__Delegate = None;
    return true;
    //return;    
}
