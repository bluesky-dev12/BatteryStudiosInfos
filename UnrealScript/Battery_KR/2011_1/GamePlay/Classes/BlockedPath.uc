class BlockedPath extends NavigationPoint
    hidecategories(Lighting,LightColor,Karma,Force);

var bool bStartBlocked;

function PostBeginPlay()
{
    bStartBlocked = bBlocked;
    super.PostBeginPlay();
    //return;    
}

function Reset()
{
    super(Actor).Reset();
    bBlocked = bStartBlocked;
    //return;    
}

function Trigger(Actor Other, Pawn EventInstigator)
{
    bBlocked = !bBlocked;
    //return;    
}

defaultproperties
{
    bBlocked=true
    bBlockable=true
}