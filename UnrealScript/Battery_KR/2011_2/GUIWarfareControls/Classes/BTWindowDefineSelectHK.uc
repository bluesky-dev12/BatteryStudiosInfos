class BTWindowDefineSelectHK extends BTWindowSelectHK
    editinlinenew
    instanced;

var localized string strClientDefaultTitle;
var localized string strClientTitle[50];
var localized string strClientDefine[50];

static function bool ShowInfo(GUIController con, int Code, optional string arg0, optional string arg1, optional string arg2)
{
    local array<string> arrStr;
    local string strTitle, strMsg;

    // End:0x4A
    if(con == none)
    {
        Log("[BTWindowDefineSelectHK::ShowWindow] GUIController = none");
        return false;
    }
    // End:0xE2
    if(con.OpenMenu("GUIWarfareControls.BTWindowDefineSelectHK") == false)
    {
        Log("[BTWindowDefineSelectHK::ShowWindow] GUIController.OpenMenu Failed!");
        con.LogMenuStack();
        return false;
    }
    strMsg = Class'Engine.BTCustomDrawHK'.static.FormatString(BTWindowDefineSelectHK(con.TopPage()).strClientDefine[Code], arg0, arg1, arg2);
    Split(strMsg, "|", arrStr);
    strTitle = BTWindowDefineInfoHK(con.TopPage()).strClientTitle[Code];
    // End:0x190
    if(strTitle == "")
    {
        strTitle = BTWindowDefineInfoHK(con.TopPage()).strClientDefaultTitle;
    }
    // End:0x1CB
    if(arrStr.Length == 1)
    {
        BTWindowDefineSelectHK(con.TopPage()).SetData(strTitle, 5, arrStr[0]);        
    }
    else
    {
        // End:0x20E
        if(arrStr.Length == 2)
        {
            BTWindowDefineSelectHK(con.TopPage()).SetData(strTitle, 5, arrStr[0], arrStr[1]);            
        }
        else
        {
            // End:0x256
            if(arrStr.Length >= 3)
            {
                BTWindowDefineSelectHK(con.TopPage()).SetData(strTitle, 5, arrStr[0], arrStr[1], arrStr[2]);
            }
        }
    }
    Log("[BTWindowDefineSelectHK::ShowInfo] Msg=" $ strMsg);
    return true;
    //return;    
}

defaultproperties
{
    strClientDefaultTitle="???"
    strClientDefine[0]="%0?? ?? ??????. ?? ??? ????????|??|??"
    strClientDefine[19]="??? 0? ?? ??? ???? ?? ??? 50%? ?????.|??|??"
    strClientDefine[20]="%0? ???? ??? ??? ???. ?????????"
    strClientDefine[21]="%0?? ??? ???? PC ??? ?? ?????? ???? ?? ? ????.??? ??? ?????????"
}