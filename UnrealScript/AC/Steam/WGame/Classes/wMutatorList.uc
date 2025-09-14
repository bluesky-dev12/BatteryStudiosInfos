/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wMutatorList.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:2
 *
 *******************************************************************************/
class wMutatorList extends Actor
    notplaceable;

var() array<MutatorRecord> MutatorList;

simulated function Init(optional bool bLoadClasses)
{
    local MutatorRecord tmp;
    local int i, j;

    class'CacheManager'.static.GetMutatorList(MutatorList);
    i = 0;
    J0x18:
    // End:0xbb [While If]
    if(i < MutatorList.Length - 1)
    {
        j = i + 1;
        J0x39:
        // End:0xb1 [While If]
        if(j < MutatorList.Length)
        {
            // End:0xa7
            if(MutatorList[j].FriendlyName < MutatorList[i].FriendlyName)
            {
                tmp = MutatorList[i];
                MutatorList[i] = MutatorList[j];
                MutatorList[j] = tmp;
            }
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0x39;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x18;
    }
}

simulated function LoadClasses();
