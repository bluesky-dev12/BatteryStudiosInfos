/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTLabelLocationHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:3
 *
 *******************************************************************************/
class BTLabelLocationHK extends BTOwnerDrawTextArrayHK
    editinlinenew
    instanced;

var localized string strRadioLocation[100];
var byte LocationCount;

function SetLocationID(int id)
{
    SetData(strRadioLocation[id]);
}

function CalcLocationCount()
{
    local int lp1;

    LocationCount = 0;
    lp1 = 0;
    J0x0f:
    // End:0x59 [While If]
    if(lp1 < 100)
    {
        // End:0x4c
        if(strRadioLocation[lp1] != "-" || strRadioLocation[lp1] != "")
        {
            ++ LocationCount;
        }
        // End:0x4f
        else
        {
            // This is an implied JumpToken;
            goto J0x59;
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x0f;
    }
    J0x59:
}

function byte GetLocationCount()
{
    return LocationCount;
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