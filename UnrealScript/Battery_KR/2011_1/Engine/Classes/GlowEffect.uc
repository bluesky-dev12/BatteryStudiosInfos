class GlowEffect extends PostProcessEffect
    native
    editinlinenew
    collapsecategories
    noexport;

var const transient pointer DownSampledTex;
var const transient pointer DownSampledTex2;
var const transient pointer HorizontalBlur;
var const transient pointer VerticalBlur;

defaultproperties
{
    PriorityEffect=3
}