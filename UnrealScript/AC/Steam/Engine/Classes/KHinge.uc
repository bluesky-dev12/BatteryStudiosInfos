/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\KHinge.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Properties:10
 *	States:5
 *
 *******************************************************************************/
class KHinge extends KConstraint
    native
    placeable;

enum EHingeType
{
    HT_Normal,
    HT_Springy,
    HT_Motor,
    HT_Controlled
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
{

}

state() ToggleMotor
{
    function Trigger(Actor Other, Pawn EventInstigator)
    {
        // End:0x2e
        if(KHingeType == 2)
        {
            KDesiredAngle = KCurrentAngle;
            KUseAltDesired = false;
            KHingeType = 3;
        }
        // End:0x36
        else
        {
            KHingeType = 2;
        }
        KUpdateConstraintParams();
        KConstraintActor1.KWake();
    }

Begin:
    KHingeType = 3;
    KUseAltDesired = false;
    KUpdateConstraintParams();
}

state() ControlMotor
{
    function Trigger(Actor Other, Pawn EventInstigator)
    {
        // End:0x2d
        if(KHingeType != 2)
        {
            KHingeType = 2;
            KUpdateConstraintParams();
            KConstraintActor1.KWake();
        }
    }

    function UnTrigger(Actor Other, Pawn EventInstigator)
    {
        // End:0x40
        if(KHingeType == 2)
        {
            KDesiredAngle = KCurrentAngle;
            KUseAltDesired = false;
            KHingeType = 3;
            KUpdateConstraintParams();
            KConstraintActor1.KWake();
        }
    }

Begin:
    KHingeType = 3;
    KUseAltDesired = false;
    KUpdateConstraintParams();
}

state() ToggleDesired
{
    function Trigger(Actor Other, Pawn EventInstigator)
    {
        // End:0x14
        if(KUseAltDesired)
        {
            KUseAltDesired = false;
        }
        // End:0x1c
        else
        {
            KUseAltDesired = true;
        }
        KUpdateConstraintParams();
        KConstraintActor1.KWake();
    }

}

state() ControlDesired
{
    function Trigger(Actor Other, Pawn EventInstigator)
    {
        KUseAltDesired = true;
        KUpdateConstraintParams();
        KConstraintActor1.KWake();
    }

    function UnTrigger(Actor Other, Pawn EventInstigator)
    {
        KUseAltDesired = false;
        KUpdateConstraintParams();
        KConstraintActor1.KWake();
    }

}

defaultproperties
{
    KStiffness=50.0
    KProportionalGap=8200.0
    Texture=Texture'S_KHinge'
    bDirectional=true
}