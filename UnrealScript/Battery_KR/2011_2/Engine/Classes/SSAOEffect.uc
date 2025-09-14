class SSAOEffect extends PostProcessEffect
    native
    editinlinenew
    collapsecategories
    noexport;

var const transient pointer NormalDepthTarget;
var const transient pointer RandomTarget;
var const transient pointer HBlurTarget;
var const transient pointer VBlurTarget;
var const transient pointer SourceTarget;

defaultproperties
{
    PriorityEffect=3
}