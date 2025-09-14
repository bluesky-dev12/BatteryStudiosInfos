/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\TankVictim.uc
 * Package Imports:
 *	XEffects
 *	Engine
 *	Core
 *
 * Stats:
 *	States:3
 *
 *******************************************************************************/
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
        LoopAnim('Sleep',, 0.250);
    }

    function Trigger(Actor Other, Pawn EventInstigator)
    {
        SimAnim.AnimSequence = 'WakeUp';
        SimAnim.bAnimLoop = false;
        SimAnim.TweenRate = 40;
        PlayAnim('WakeUp');
        GotoState('Wake');
    }

}

state Wake
{
    function AnimEnd(int Channel)
    {
        SimAnim.AnimSequence = 'Idle';
        SimAnim.bAnimLoop = true;
        SimAnim.TweenRate = 40;
        LoopAnim('Idle',, 0.10);
        SetTimer(15.0, false);
        GotoState('Ready');
    }

}

state Ready
{
    function Timer()
    {
        GotoState('SleepS');
    }

}

defaultproperties
{
    DrawType=2
    bStasis=true
    bReplicateAnimations=true
    Mesh=SkeletalMesh'TankVictimMesh'
    CollisionRadius=0.0
    CollisionHeight=0.0
}