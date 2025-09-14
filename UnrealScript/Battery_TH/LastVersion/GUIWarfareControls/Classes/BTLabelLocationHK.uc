class BTLabelLocationHK extends BTOwnerDrawTextArrayHK
    editinlinenew
    instanced;

var localized string strRadioLocation[100];
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
    if(lp1 < 100)
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
    strRadioLocation[0]="???????"
    strRadioLocation[1]="???????"
    strRadioLocation[2]="??????????????????"
    strRadioLocation[3]="??????? "
    strRadioLocation[4]="???????????"
    strRadioLocation[5]="??????????"
    strRadioLocation[6]="?????????????????????"
    strRadioLocation[7]="????????"
    strRadioLocation[8]="??????"
}