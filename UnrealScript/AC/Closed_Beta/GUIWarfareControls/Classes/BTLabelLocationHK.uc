class BTLabelLocationHK extends BTOwnerDrawTextArrayHK
    editinlinenew
    instanced;

var localized string strRadioLocation[33];
var byte LocationCount;

function SetLocationID(int id)
{
    SetData(strRadioLocation[id]);
    //return;    
}

function CalcLocationCount()
{
    local int lp1;

    LocationCount = 0;
    lp1 = 0;
    J0x0F:

    // End:0x59 [Loop If]
    if(lp1 < 33)
    {
        // End:0x4C
        if((strRadioLocation[lp1] != "-") || strRadioLocation[lp1] != "")
        {
            ++LocationCount;
            // [Explicit Continue]
            goto J0x4F;
        }
        // [Explicit Break]
        goto J0x59;
        J0x4F:

        ++lp1;
        // [Loop Continue]
        goto J0x0F;
    }
    J0x59:

    //return;    
}

function byte GetLocationCount()
{
    return LocationCount;
    //return;    
}

defaultproperties
{
    strRadioLocation[0]="All"
    strRadioLocation[1]="National"
    strRadioLocation[2]="Seoul"
    strRadioLocation[3]="Busan"
    strRadioLocation[4]="Daegu"
    strRadioLocation[5]="Gwangju"
    strRadioLocation[6]="Daejeon"
    strRadioLocation[7]="Ulsan"
    strRadioLocation[8]="Gyeonggi"
    strRadioLocation[9]="Gangwon"
    strRadioLocation[10]="Chungcheong"
    strRadioLocation[11]="Gyeongsang"
    strRadioLocation[12]="Jeolla"
    strRadioLocation[13]="Jeju"
    strRadioLocation[14]="International"
}