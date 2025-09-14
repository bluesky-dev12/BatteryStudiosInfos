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
    //return;    
}

function ValidatePathTags()
{
    // End:0x1E
    if(PathTag[0] == 'None')
    {
        PathTag[0] = Name;
    }
    //return;    
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

    // End:0x150 [Loop If]
    if(A != none)
    {
        i = 0;
        J0x64:

        // End:0x113 [Loop If]
        if(i < 4)
        {
            // End:0x109
            if((PathTag[i] != 'None') && A.HasPathTag(PathTag[i]))
            {
                // End:0xD8
                if(A.Position < Position)
                {
                    A.bLastPath = false;
                    bFirstPath = false;
                    // [Explicit Continue]
                    goto J0x109;
                }
                // End:0x109
                if(A.Position > Position)
                {
                    A.bFirstPath = false;
                    bLastPath = false;
                }
            }
            J0x109:

            i++;
            // [Loop Continue]
            goto J0x64;
        }
        // End:0x139
        if(A.NextPath == none)
        {
            A.NextPath = self;
            return;
        }
        A = A.NextPath;
        // [Loop Continue]
        goto J0x52;
    }
    //return;    
}

function name PickTag()
{
    local name Result;
    local int i, Num;

    ValidatePathTags();
    Result = PathTag[0];
    i = 0;
    J0x1A:

    // End:0x6E [Loop If]
    if(i < 4)
    {
        // End:0x64
        if(PathTag[i] != 'None')
        {
            Num++;
            // End:0x64
            if(FRand() < float(1 / Num))
            {
                Result = PathTag[i];
            }
        }
        i++;
        // [Loop Continue]
        goto J0x1A;
    }
    return Result;
    //return;    
}

function bool HasPathTag(name aPathTag)
{
    local int i;

    ValidatePathTags();
    i = 0;
    J0x0D:

    // End:0x3A [Loop If]
    if(i < 4)
    {
        // End:0x30
        if(PathTag[i] == aPathTag)
        {
            return true;
        }
        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    return false;
    //return;    
}

function AssaultPath FindNextPath(name AlternatePathTag)
{
    local AssaultPath A, List;
    local int i, Num;
    local float sum, R;

    A = AssociatedObjective.AlternatePaths;
    J0x14:

    // End:0x151 [Loop If]
    if(A != none)
    {
        // End:0x13A
        if(((A.bEnabled && A.Position > Position) && !A.bReturnOnly) && A.HasPathTag(AlternatePathTag))
        {
            // End:0xF0
            if((List[0] == none) || A.Position < List[0].Position)
            {
                i = 0;
                J0xB3:

                // End:0xD9 [Loop If]
                if(i < Num)
                {
                    List[i] = none;
                    i++;
                    // [Loop Continue]
                    goto J0xB3;
                }
                List[0] = A;
                Num = 1;                
            }
            else
            {
                // End:0x13A
                if(A.Position == List[0].Position)
                {
                    List[Num] = A;
                    Num++;
                    // End:0x13A
                    if(Num > 15)
                    {
                        // [Explicit Break]
                        goto J0x151;
                    }
                }
            }
        }
        A = A.NextPath;
        // [Loop Continue]
        goto J0x14;
    }
    J0x151:

    // End:0x20F
    if(Num > 0)
    {
        i = 0;
        J0x163:

        // End:0x197 [Loop If]
        if(i < Num)
        {
            sum += List[i].Priority;
            i++;
            // [Loop Continue]
            goto J0x163;
        }
        R = FRand() * sum;
        sum = 0.0000000;
        i = 0;
        J0x1B8:

        // End:0x207 [Loop If]
        if(i < Num)
        {
            sum += List[i].Priority;
            // End:0x1FD
            if(R <= sum)
            {
                return List[i];
            }
            i++;
            // [Loop Continue]
            goto J0x1B8;
        }
        return List[0];
    }
    return none;
    //return;    
}

function AssaultPath FindPreviousPath(name AlternatePathTag)
{
    local AssaultPath A, List;
    local int i, Num;
    local float sum, R;

    A = AssociatedObjective.AlternatePaths;
    J0x14:

    // End:0x113 [Loop If]
    if(A != none)
    {
        // End:0xFC
        if(((A.bEnabled && A.Position < Position) && A.HasPathTag(AlternatePathTag)) && !A.bNoReturn)
        {
            // End:0xD6
            if((List[0] == none) || A.Position == List[0].Position)
            {
                List[Num] = A;
                Num++;
                // End:0xD3
                if(Num > 15)
                {
                    // [Explicit Break]
                    goto J0x113;
                }                
            }
            else
            {
                // End:0xFC
                if(A.Position < List[0].Position)
                {
                    // [Explicit Break]
                    goto J0x113;
                }
            }
        }
        A = A.NextPath;
        // [Loop Continue]
        goto J0x14;
    }
    J0x113:

    // End:0x1D1
    if(Num > 0)
    {
        i = 0;
        J0x125:

        // End:0x159 [Loop If]
        if(i < Num)
        {
            sum += List[i].Priority;
            i++;
            // [Loop Continue]
            goto J0x125;
        }
        R = FRand() * sum;
        sum = 0.0000000;
        i = 0;
        J0x17A:

        // End:0x1C9 [Loop If]
        if(i < Num)
        {
            sum += List[i].Priority;
            // End:0x1BF
            if(R <= sum)
            {
                return List[i];
            }
            i++;
            // [Loop Continue]
            goto J0x17A;
        }
        return List[0];
    }
    return none;
    //return;    
}

defaultproperties
{
    bEnabled=true
    bFirstPath=true
    bLastPath=true
    Priority=1.0000000
}