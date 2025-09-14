/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfare\Classes\BTRefreshTime.uc
 * Package Imports:
 *	GUIWarfare
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:4
 *
 *******************************************************************************/
class BTRefreshTime extends Object;

var float fCurTime;
var float fMaxTime;

function bool CheckCondition()
{
    // End:0x1c
    if(fMaxTime <= fCurTime)
    {
        fCurTime = 0.0;
        return true;
    }
    return false;
}

function ResetTime()
{
    self.fCurTime = 0.0;
}

function Update(float fAppDelta)
{
    self.fCurTime += fAppDelta;
}

function SetMaxTime(float fMaxTime)
{
    self.fMaxTime = fMaxTime;
    self.fCurTime = fMaxTime;
}
