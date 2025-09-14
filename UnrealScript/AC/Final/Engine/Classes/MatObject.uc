class MatObject extends Object
    abstract
    native;

struct Orientation
{
    var() Object.ECamOrientation CamOrientation;
    var() Actor LookAt;
    var() Actor DollyWith;
    var() float EaseIntime;
    var() int bReversePitch;
    var() int bReverseYaw;
    var() int bReverseRoll;
    var transient pointer MA;
    var float PctInStart;
    var float PctInEnd;
    var float PctInDuration;
    var Rotator StartingRotation;
};
