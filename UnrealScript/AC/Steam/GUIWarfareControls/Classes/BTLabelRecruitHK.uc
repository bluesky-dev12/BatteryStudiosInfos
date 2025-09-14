/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTLabelRecruitHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:1
 *
 *******************************************************************************/
class BTLabelRecruitHK extends BTOwnerDrawTextArrayHK
    editinlinenew
    instanced;

var localized string strRecruitState[2];

function SetRecruitState(byte B)
{
    // End:0x1d
    if(B > 0)
    {
        SetData(strRecruitState[1]);
    }
    // End:0x2a
    else
    {
        SetData(strRecruitState[0]);
    }
}

defaultproperties
{
    strRecruitState[0]="Not Recruiting"
    strRecruitState[1]="Recruiting"
}