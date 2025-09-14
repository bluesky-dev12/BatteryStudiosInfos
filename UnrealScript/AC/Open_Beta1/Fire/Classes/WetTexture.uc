class WetTexture extends WaterTexture
    native
    noexport
    safereplace
    hidecategories(Object);

var(WaterPaint) Texture SourceTexture;
var transient Texture OldSourceTex;
var transient pointer LocalSourceBitmap;
