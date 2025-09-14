class TankVictim extends Actor
    placeable;

auto state SleepS
{
    function BeginState()
    {
        SimAnim.AnimSequence = 'Sleep';
        SimAnim.AnimRate = 155;
        SimAnim.bAnimLoop = true;
        SimAnim.TweenRate = 16;
        LoopAnim('Sleep',, 0.2500000);
        //return;        
    }

    function Trigger(Actor Other, Pawn EventInstigator)
    {
        SimAnim.AnimSequence = 'WakeUp';
        SimAnim.bAnimLoop = false;
        SimAnim.TweenRate = 40;
        PlayAnim('WakeUp');
        GotoState('Wake');
        //return;        
    }
    stop;    
}

state Wake
{
    function AnimEnd(int Channel)
    {
        SimAnim.AnimSequence = 'Idle';
        SimAnim.bAnimLoop = true;
        SimAnim.TweenRate = 40;
        LoopAnim('Idle',, 0.1000000);
        SetTimer(15.0000000, false);
        GotoState('Ready');
        //return;        
    }
    stop;    
}

state Ready
{
    function Timer()
    {
        GotoState('SleepS');
        //return;        
    }
    stop;    
}

defaultproperties
{
    DrawType=2
    bStasis=true
    bReplicateAnimations=true
    Mesh=SkeletalMesh'XEffects_Decompressed.TankVictimMesh'
    CollisionRadius=0.0000000
    CollisionHeight=0.0000000
}