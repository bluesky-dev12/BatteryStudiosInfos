class VariableTexPanner extends TexModifier
    native
    editinlinenew
    collapsecategories
    hidecategories(Object,Material);

var() Rotator PanDirection;
var() float PanRate;
var Matrix M;
var float LastTime;
var float PanOffset;

defaultproperties
{
    PanRate=0.1000000
}