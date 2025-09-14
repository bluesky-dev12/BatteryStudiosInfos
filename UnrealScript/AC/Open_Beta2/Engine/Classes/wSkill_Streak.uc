class wSkill_Streak extends wSkill;

var bool BeginPlay;
var int startStreakCount;
var bool GetSkill;

simulated function DeadPlayer()
{
    super.DeadPlayer();
    BeginPlay = false;
    SetbUpdateCall(false);
    //return;    
}

simulated function int GetCheckStreakValue()
{
    //return;    
}

simulated function int GetChangeStreakValue()
{
    return Max(0, (GetCheckStreakValue()) - startStreakCount);
    //return;    
}

simulated function PostBeginPlay()
{
    BeginPlay = true;
    startStreakCount = GetCheckStreakValue();
    // End:0x66
    if(((AttachWeaponID != -1) && !Base.Owner.Level.GetMatchMaker().bChangingHost) && GetSkill)
    {
        ActiveSkill();
    }
    super.PostBeginPlay();
    //return;    
}

simulated function UsedbyWeapon()
{
    GetSkill = false;
    super.UsedbyWeapon();
    //return;    
}

function UpdateProcess()
{
    local int changeValue;

    // End:0x75
    if(BeginPlay)
    {
        changeValue = GetChangeStreakValue();
        // End:0x75
        if(bUpdateCall == false)
        {
            // End:0x4E
            if(changeValue != 0)
            {
                startStreakCount = GetCheckStreakValue();
                SetbyAddCount(byte(int(byAddCount) + changeValue));
            }
            // End:0x75
            if(int(byAddCount) >= CheckStreakCount)
            {
                GetSkill = true;
                AddProcess();
                SetbyAddCount(0);
            }
        }
    }
    super.UpdateProcess();
    //return;    
}

simulated function GetTopInfo(out string strInfo, out string strCountInfo, out int FontSize)
{
    local int currentCount;

    // End:0x17
    if(IsEnable)
    {
        currentCount = CheckStreakCount;        
    }
    else
    {
        currentCount = int(byAddCount);
    }
    currentCount = Min(currentCount, CheckStreakCount);
    super.GetTopInfo(strInfo, strCountInfo, FontSize);
    strCountInfo = (string(currentCount) @ "/") @ string(CheckStreakCount);
    //return;    
}
