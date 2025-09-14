class BTLuckyWinner extends GUIMultiComponent
    editinlinenew
    instanced;

var int ItemID;
var bool ChangedWinners;
var array<string> Winners;
var array<BtrDouble> WinnersTime;
var localized string strWinnersHeader;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    //return;    
}

function AddWinner(string winnerName, BtrDouble winTime)
{
    local int i;
    local bool bAdded;

    bAdded = false;
    ChangedWinners = true;
    i = 0;
    J0x17:

    // End:0x8F [Loop If]
    if(i < Winners.Length)
    {
        // End:0x85
        if(BtrDoubleLessEqual(winTime, WinnersTime[i]))
        {
            bAdded = true;
            Winners.Insert(i, 1);
            WinnersTime.Insert(i, 1);
            Winners[i] = winnerName;
            WinnersTime[i] = winTime;
            // [Explicit Break]
            goto J0x8F;
        }
        ++i;
        // [Loop Continue]
        goto J0x17;
    }
    J0x8F:

    // End:0xBE
    if(!bAdded)
    {
        Winners[Winners.Length] = winnerName;
        WinnersTime[WinnersTime.Length] = winTime;
    }
    // End:0xDB
    if(Winners.Length > 10)
    {
        Winners.Remove(0, 1);
        WinnersTime.Remove(0, 1);
    }
    //return;    
}

function ClearWinners()
{
    Winners.Length = 0;
    WinnersTime.Length = 0;
    ChangedWinners = true;
    //return;    
}

function bool MakeString(out string strOutput)
{
    local int i;

    // End:0x73
    if(ChangedWinners)
    {
        ChangedWinners = false;
        strOutput = strWinnersHeader;
        i = 0;
        J0x23:

        // End:0x71 [Loop If]
        if(i < Winners.Length)
        {
            strOutput @= Winners[i];
            // End:0x67
            if(i < (Winners.Length - 1))
            {
                strOutput @= ", ";
            }
            ++i;
            // [Loop Continue]
            goto J0x23;
        }
        return true;
    }
    return false;
    //return;    
}

defaultproperties
{
    strWinnersHeader="?????????????"
}