class BTRefreshTime extends Object;

var float fCurTime;
var float fMaxTime;

function bool CheckCondition()
{
    // End:0x1C
    if(fMaxTime <= fCurTime)
    {
        fCurTime = 0.0000000;
        return true;
    }
    return false;
    //return;    
}

function ResetTime()
{
    self.fCurTime = 0.0000000;
    //return;    
}

function Update(float fAppDelta)
{
    self.fCurTime += fAppDelta;
    //return;    
}

function SetMaxTime(float fMaxTime)
{
    self.fMaxTime = fMaxTime;
    self.fCurTime = fMaxTime;
    //return;    
}
