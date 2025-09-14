class wMutatorList extends Actor
    notplaceable;

var() array<MutatorRecord> MutatorList;

simulated function Init(optional bool bLoadClasses)
{
    local MutatorRecord tmp;
    local int i, j;

    Class'Engine.CacheManager'.static.GetMutatorList(MutatorList);
    i = 0;
    J0x18:

    // End:0xBB [Loop If]
    if(i < (MutatorList.Length - 1))
    {
        j = i + 1;
        J0x39:

        // End:0xB1 [Loop If]
        if(j < MutatorList.Length)
        {
            // End:0xA7
            if(MutatorList[j].FriendlyName < MutatorList[i].FriendlyName)
            {
                tmp = MutatorList[i];
                MutatorList[i] = MutatorList[j];
                MutatorList[j] = tmp;
            }
            j++;
            // [Loop Continue]
            goto J0x39;
        }
        i++;
        // [Loop Continue]
        goto J0x18;
    }
    //return;    
}

simulated function LoadClasses()
{
    //return;    
}
