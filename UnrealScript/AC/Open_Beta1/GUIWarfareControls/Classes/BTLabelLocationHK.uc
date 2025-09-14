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
    strRadioLocation[0]="All"
    strRadioLocation[1]="Germany"
    strRadioLocation[2]="Brazil"
    strRadioLocation[3]="USA"
    strRadioLocation[4]="Poland"
    strRadioLocation[5]="France"
    strRadioLocation[6]="Belgium"
    strRadioLocation[7]="UK"
    strRadioLocation[8]="Canada"
    strRadioLocation[9]="Peru"
    strRadioLocation[10]="Spain"
    strRadioLocation[11]="Venezuela"
    strRadioLocation[12]="Turkey"
    strRadioLocation[13]="Greece"
    strRadioLocation[14]="Netherlands"
    strRadioLocation[15]="Australia"
    strRadioLocation[16]="Argentina"
    strRadioLocation[17]="Romania"
    strRadioLocation[18]="Portugal"
    strRadioLocation[19]="Hungary"
    strRadioLocation[20]="Italy"
    strRadioLocation[21]="Sweden"
    strRadioLocation[22]="Austria"
    strRadioLocation[23]="Denmark"
    strRadioLocation[24]="New Zealand"
    strRadioLocation[25]="Switzerland"
    strRadioLocation[26]="Mexico"
    strRadioLocation[27]="Russia"
    strRadioLocation[28]="Czech Republic"
    strRadioLocation[29]="Croatia"
    strRadioLocation[30]="Finland"
    strRadioLocation[31]="Ukraine"
    strRadioLocation[32]="Lithuania"
    strRadioLocation[33]="Bulgaria"
    strRadioLocation[34]="Norway"
    strRadioLocation[35]="Slovenia"
    strRadioLocation[36]="Estonia"
    strRadioLocation[37]="Serbia"
    strRadioLocation[38]="Latvia"
}