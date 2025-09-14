/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\ACTION_SetHidden.uc
 * Package Imports:
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:2
 *
 *******************************************************************************/
class ACTION_SetHidden extends ScriptedAction
    hidecategories(Object)
    editinlinenew
    collapsecategories;

var(Action) bool bHidden;
var(Action) name HideActorTag;
var array<Actor> Target;

event PostBeginPlay(ScriptedSequence ss)
{
    local Actor A;

    // End:0x41
    if(HideActorTag != 'None')
    {
        // End:0x40
        foreach ss.AllActors(class'Actor', A, HideActorTag)
        {
            Target[Target.Length] = A;                        
        }
    }
}

function bool InitActionFor(ScriptedController C)
{
    local int i;

    // End:0x4c
    if(Target.Length > 0)
    {
        i = 0;
        J0x13:
        // End:0x49 [While If]
        if(i < Target.Length)
        {
            Target[i].bHidden = bHidden;
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x13;
        }
    }
    // End:0x6c
    else
    {
        C.GetInstigator().bHidden = bHidden;
    }
    return false;
}
