class BTLabelRecruitHK extends BTOwnerDrawTextArrayHK
    editinlinenew
    instanced;

var localized string strRecruitState[2];

function SetRecruitState(byte B)
{
    // End:0x1D
    if(int(B) > 0)
    {
        SetData(strRecruitState[1]);        
    }
    else
    {
        SetData(strRecruitState[0]);
    }
    //return;    
}

defaultproperties
{
    strRecruitState[0]="Not Recruiting"
    strRecruitState[1]="Recruiting"
}