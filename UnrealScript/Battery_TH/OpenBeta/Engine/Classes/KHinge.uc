class KHinge extends KConstraint
    native
    placeable;

enum EHingeType
{
    HT_Normal,                      // 0
    HT_Springy,                     // 1
    HT_Motor,                       // 2
    HT_Controlled                   // 3
};

var(KarmaConstraint) KHinge.EHingeType KHingeType;
var(KarmaConstraint) float KStiffness;
var(KarmaConstraint) float KDamping;
var(KarmaConstraint) float KDesiredAngVel;
var(KarmaConstraint) float KMaxTorque;
var(KarmaConstraint) float KDesiredAngle;
var(KarmaConstraint) float KProportionalGap;
var(KarmaConstraint) float KAltDesiredAngle;
var bool KUseAltDesired;
var const float KCurrentAngle;

auto state Default
{    stop;    
}

state() ToggleMotor
{
    ignores Trigger;

    function Trigger(Actor Other, Pawn EventInstigator)
    {
        // End:0x2E
        if(int(KHingeType) == int(2))
        {
            KDesiredAngle = KCurrentAngle;
            KUseAltDesired = false;
            KHingeType = 3;            
        }
        else
        {
            KHingeType = 2;
        }
        KUpdateConstraintParams();
        KConstraintActor1.KWake();
        //return;        
    }
Begin:

    KHingeType = 3;
    KUseAltDesired = false;
    KUpdateConstraintParams();
    stop;        
}

state() ControlMotor
{
    function Trigger(Actor Other, Pawn EventInstigator)
    {
        // End:0x2D
        if(int(KHingeType) != int(2))
        {
            KHingeType = 2;
            KUpdateConstraintParams();
            KConstraintActor1.KWake();
        }
        //return;        
    }

    function UnTrigger(Actor Other, Pawn EventInstigator)
    {
        // End:0x40
        if(int(KHingeType) == int(2))
        {
            KDesiredAngle = KCurrentAngle;
            KUseAltDesired = false;
            KHingeType = 3;
            KUpdateConstraintParams();
            KConstraintActor1.KWake();
        }
        //return;        
    }
Begin:

    KHingeType = 3;
    KUseAltDesired = false;
    KUpdateConstraintParams();
    stop;        
}

state() ToggleDesired
{
    ignores Trigger;

    function Trigger(Actor Other, Pawn EventInstigator)
    {
        // End:0x14
        if(KUseAltDesired)
        {
            KUseAltDesired = false;            
        }
        else
        {
            KUseAltDesired = true;
        }
        KUpdateConstraintParams();
        KConstraintActor1.KWake();
        //return;        
    }
    stop;    
}

state() ControlDesired
{
    function Trigger(Actor Other, Pawn EventInstigator)
    {
        KUseAltDesired = true;
        KUpdateConstraintParams();
        KConstraintActor1.KWake();
        //return;        
    }

    function UnTrigger(Actor Other, Pawn EventInstigator)
    {
        KUseAltDesired = false;
        KUpdateConstraintParams();
        KConstraintActor1.KWake();
        //return;        
    }
    stop;    
}

defaultproperties
{
    KStiffness=50.0000000
    KProportionalGap=8200.0000000
    Texture=Texture'Engine_Decompressed.S_KHinge'
    bDirectional=true
}