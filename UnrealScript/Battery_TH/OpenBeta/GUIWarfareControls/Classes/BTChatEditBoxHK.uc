class BTChatEditBoxHK extends BTEditBoxHK
    editinlinenew
    instanced;

function bool CheckKeyInputCondition(string st)
{
    // End:0x20
    if((Asc(st) == 8) || Asc(st) == 27)
    {
        return true;
    }
    return false;
    //return;    
}

function bool CheckPastedTextCondition(string Text)
{
    return false;
    //return;    
}
