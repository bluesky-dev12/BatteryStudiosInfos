/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\AssaultPath.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:12
 *	Functions:7
 *
 *******************************************************************************/
class AssaultPath extends NavigationPoint
    hidecategories(Lighting,LightColor,Karma,Force);

var GameObjective AssociatedObjective;
var AssaultPath NextPath;
var() int Position;
var() name ObjectiveTag;
var() name PathTag[4];
var() bool bEnabled;
var() bool bNoReturn;
var() bool bReturnOnly;
var bool bFirstPath;
var bool bLastPath;
var() bool bNoGrouping;
var() float Priority;

event Trigger(Actor Other, Pawn EventInstigator)
{
    bEnabled = !bEnabled;
}

function ValidatePathTags()
{
    // End:0x1e
    if(PathTag[0] == 'None')
    {
        PathTag[0] = Name;
    }
}

function AddTo(GameObjective o)
{
    local AssaultPath A;
    local int i;

    NextPath = none;
    AssociatedObjective = o;
    // End:0x38
    if(o.AlternatePaths == none)
    {
        o.AlternatePaths = self;
        return;
    }
    ValidatePathTags();
    A = o.AlternatePaths;
    J0x52:
    // End:0x150 [While If]
    if(A != none)
    {
        i = 0;
        J0x64:
        // End:0x113 [While If]
        if(i < 4)
        {
            // End:0x109
            if(PathTag[i] != 'None' && A.HasPathTag(PathTag[i]))
            {
                // End:0xd8
                if(A.Position < Position)
                {
                    A.bLastPath = false;
                    bFirstPath = false;
                }
                // End:0x109
                else
                {
                    // End:0x109
                    if(A.Position > Position)
                    {
                        A.bFirstPath = false;
                        bLastPath = false;
                    }
                }
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x64;
        }
        // End:0x139
        if(A.NextPath == none)
        {
            A.NextPath = self;
            return;
        }
        A = A.NextPath;
        // This is an implied JumpToken; Continue!
        goto J0x52;
    }
}

function name PickTag()
{
    local name Result;
    local int i, Num;

    ValidatePathTags();
    Result = PathTag[0];
    i = 0;
    J0x1a:
    // End:0x6e [While If]
    if(i < 4)
    {
        // End:0x64
        if(PathTag[i] != 'None')
        {
            ++ Num;
            // End:0x64
            if(FRand() < float(1 / Num))
            {
                Result = PathTag[i];
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1a;
    }
    return Result;
}

function bool HasPathTag(name aPathTag)
{
    local int i;

    ValidatePathTags();
    i = 0;
    J0x0d:
    // End:0x3a [While If]
    if(i < 4)
    {
        // End:0x30
        if(PathTag[i] == aPathTag)
        {
            return true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0d;
    }
    return false;
}

function AssaultPath FindNextPath(name AlternatePathTag)
{
    local AssaultPath A, List;
    local int i, Num;
    local float sum, R;

    A = AssociatedObjective.AlternatePaths;
    J0x14:
    // End:0x151 [While If]
    if(A != none)
    {
        // End:0x13a
        if(A.bEnabled && A.Position > Position && !A.bReturnOnly && A.HasPathTag(AlternatePathTag))
        {
            // End:0xf0
            if(List[0] == none || A.Position < List[0].Position)
            {
                i = 0;
                J0xb3:
                // End:0xd9 [While If]
                if(i < Num)
                {
                    List[i] = none;
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0xb3;
                }
                List[0] = A;
                Num = 1;
            }
            // End:0x13a
            else
            {
                // End:0x13a
                if(A.Position == List[0].Position)
                {
                    List[Num] = A;
                    ++ Num;
                    // End:0x13a
                    if(Num > 15)
                    {
                    }
                    // End:0x151
                    else
                    {
                    }
                }
            }
            A = A.NextPath;
            // This is an implied JumpToken; Continue!
            goto J0x14;
        }
    }
    // End:0x20f
    if(Num > 0)
    {
        i = 0;
        J0x163:
        // End:0x197 [While If]
        if(i < Num)
        {
            sum += List[i].Priority;
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x163;
        }
        R = FRand() * sum;
        sum = 0.0;
        i = 0;
        J0x1b8:
        // End:0x207 [While If]
        if(i < Num)
        {
            sum += List[i].Priority;
            // End:0x1fd
            if(R <= sum)
            {
                return List[i];
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x1b8;
        }
        return List[0];
    }
    return none;
}

function AssaultPath FindPreviousPath(name AlternatePathTag)
{
    local AssaultPath A, List;
    local int i, Num;
    local float sum, R;

    A = AssociatedObjective.AlternatePaths;
    J0x14:
    // End:0x113 [While If]
    if(A != none)
    {
        // End:0xfc
        if(A.bEnabled && A.Position < Position && A.HasPathTag(AlternatePathTag) && !A.bNoReturn)
        {
            // End:0xd6
            if(List[0] == none || A.Position == List[0].Position)
            {
                List[Num] = A;
                ++ Num;
                // End:0xd3
                if(Num > 15)
                {
                }
                // End:0x113
                else
                {
                    // This is an implied JumpToken;
                    goto J0xfc;
                }
                // End:0xfc
                if(A.Position < List[0].Position)
                {
                }
                // End:0x113
                else
                {
                }
                J0xfc:
                A = A.NextPath;
                // This is an implied JumpToken; Continue!
                goto J0x14;
            }
        }
    }
    // End:0x1d1
    if(Num > 0)
    {
        i = 0;
        J0x125:
        // End:0x159 [While If]
        if(i < Num)
        {
            sum += List[i].Priority;
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x125;
        }
        R = FRand() * sum;
        sum = 0.0;
        i = 0;
        J0x17a:
        // End:0x1c9 [While If]
        if(i < Num)
        {
            sum += List[i].Priority;
            // End:0x1bf
            if(R <= sum)
            {
                return List[i];
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x17a;
        }
        return List[0];
    }
    return none;
}

defaultproperties
{
    bEnabled=true
    bFirstPath=true
    bLastPath=true
    Priority=1.0
}